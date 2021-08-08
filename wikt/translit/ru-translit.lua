local export = {}

--[=[

FIXME:

1. (DONE) If you write '''Б'''ез, it transliterates to '''B'''jez instead of
   '''B'''ez, as it should.
2. (DONE) Convert ъ to nothing before comma or other non-letter particle, e.g.
   in Однимъ словомъ, идешь на чтеніе.
3. (DONE) Make special-casing for adjectives in -го and for что (and friends)
    be the default, and implement transformations in Cyrillic rather than after
    translit so that we can display the transformed Cyrillic in the
    "phonetic respelling" notation of {{ru-IPA}}.
4. (DONE) Convert apostrophe to ъ before transliteration when after a consonant
   and before a vowel (requested by Atitarev).
]=]

local u = mw.ustring.char
local rfind = mw.ustring.find
local rsub = mw.ustring.gsub -- WARNING: Don't return this directly in a function, or surround in parens
local rmatch = mw.ustring.match
local rsplit = mw.text.split
local ulower = mw.ustring.lower
local usub = mw.ustring.sub

local GR = u(0x0300) -- grave =  ̀
local TEMP_G = u(0xFFF1) -- substitute to preserve g from changing to v

local function ine(x) -- if not empty
    if x == "" then
        return nil
    else
        return x
    end
end

-- In this table, we now map Cyrillic е and э to je and e, and handle the
-- post-consonant version (plain e and ɛ) specially.
local tab = {
    ["А"] = "A",
    ["Б"] = "B",
    ["В"] = "V",
    ["Г"] = "G",
    ["Д"] = "D",
    ["Е"] = "Je",
    ["Ё"] = "Jó",
    ["Ж"] = "Ž",
    ["З"] = "Z",
    ["И"] = "I",
    ["Й"] = "J",
    ["К"] = "K",
    ["Л"] = "L",
    ["М"] = "M",
    ["Н"] = "N",
    ["О"] = "O",
    ["П"] = "P",
    ["Р"] = "R",
    ["С"] = "S",
    ["Т"] = "T",
    ["У"] = "U",
    ["Ф"] = "F",
    ["Х"] = "X",
    ["Ц"] = "C",
    ["Ч"] = "Č",
    ["Ш"] = "Š",
    ["Щ"] = "Šč",
    ["Ъ"] = "ʺ",
    ["Ы"] = "Y",
    ["Ь"] = "ʹ",
    ["Э"] = "E",
    ["Ю"] = "Ju",
    ["Я"] = "Ja",
    ["а"] = "a",
    ["б"] = "b",
    ["в"] = "v",
    ["г"] = "g",
    ["д"] = "d",
    ["е"] = "je",
    ["ё"] = "jó",
    ["ж"] = "ž",
    ["з"] = "z",
    ["и"] = "i",
    ["й"] = "j",
    ["к"] = "k",
    ["л"] = "l",
    ["м"] = "m",
    ["н"] = "n",
    ["о"] = "o",
    ["п"] = "p",
    ["р"] = "r",
    ["с"] = "s",
    ["т"] = "t",
    ["у"] = "u",
    ["ф"] = "f",
    ["х"] = "x",
    ["ц"] = "c",
    ["ч"] = "č",
    ["ш"] = "š",
    ["щ"] = "šč",
    ["ъ"] = "ʺ",
    ["ы"] = "y",
    ["ь"] = "ʹ",
    ["э"] = "e",
    ["ю"] = "ju",
    ["я"] = "ja",
    -- Russian style quotes
    ["«"] = "“",
    ["»"] = "”",
    -- archaic, pre-1918 letters
    ["І"] = "I",
    ["і"] = "i",
    ["Ѳ"] = "F",
    ["ѳ"] = "f",
    ["Ѣ"] = "Jě",
    ["ѣ"] = "jě",
    ["Ѵ"] = "I",
    ["ѵ"] = "i"
}

-- following based on ru-common for use with is_monosyllabic()
-- any Cyrillic or Latin vowel, including ёЁ and composed Cyrillic vowels with grave accent;
-- not including accented Latin vowels except ě (FIXME, might want to change this)
local lowercase_vowels = "аеиоуяэыюіѣѵүѐѝёaeiouyěɛ"
local uppercase_vowels = "АЕИОУЯЭЫЮІѢѴҮЀЍЁAEIOUYĚƐ"
local vowels = lowercase_vowels .. uppercase_vowels

-- FIXME! Doesn't work with ɣ, which gets included in this character set
local non_consonants = "[" .. vowels .. "ЪЬъьʹʺ%A]"
local consonants = "[^" .. vowels .. "ЪЬъьʹʺ%A]"

local map_to_plain_e_map = {["Е"] = "E", ["е"] = "e", ["Ѣ"] = "Ě", ["ѣ"] = "ě", ["Э"] = "Ɛ", ["э"] = "ɛ"}
local function map_to_plain_e(pre, e) return pre .. map_to_plain_e_map[e] end

local map_to_je_map = {["Е"] = "Je", ["е"] = "je", ["Ѣ"] = "Jě", ["ѣ"] = "jě", ["Э"] = "E", ["э"] = "e"}
local function map_to_je(pre, e)
    if e == nil then
        e = pre
        pre = ""
    end
    return pre .. map_to_je_map[e]
end

-- decompose composed grave chars; they will map to uncomposed Latin letters for
-- consistency with other char+grave combinations, and we do this early to
-- avoid problems converting to e or je
local decompose_grave_map = {["ѐ"] = "е" .. GR, ["Ѐ"] = "Е" .. GR, ["ѝ"] = "и" .. GR, ["Ѝ"] = "И" .. GR}

-- True if Cyrillic or decomposed Latin word has no more than one vowel;
-- includes non-syllabic stems such as льд-; copied from ru-common and modified
-- to avoid having to import that module (which would slow things down
-- significantly)
local function is_monosyllabic(word) return not rfind(word, "[" .. vowels .. "].*[" .. vowels .. "]") end

-- Apply transformations to the Cyrillic to more closely match pronunciation.
-- Return two arguments: the "original" text (after decomposing composed
-- grave characters), and the transformed text. If the two are different,
-- {{ru-IPA}} should display a "phonetic respelling" notation. 
-- NOADJ disables special-casing for adjectives in -го, while FORCEADJ forces
-- special-casing for adjectives, including those in -аго (pre-reform spelling)
-- and disables checking for exceptions (e.g. много, ого). NOSHTO disables
-- special-casing for что and related words.
function export.apply_tr_fixes(text, noadj, noshto, forceadj)
    -- decompose composed grave characters before we convert Cyrillic е to
    -- Latin e or je
    text = rsub(text, "[ѐЀѝЍ]", decompose_grave_map)

    local origtext = text
    -- the second half of the if-statement below is an optimization; see above.
    if not noadj and text:find("го") then
        local v = {["г"] = "в", ["Г"] = "В"}
        local repl = function(e, g, o, sja) return e .. v[g] .. o .. (sja or "") end
        -- Handle какого-нибудь/-либо/-то; must be done first because of an exception
        -- made for бого-, снего-, etc.
        text = rsub(text, "([кКтТ][аА][кК][оеОЕ" .. (forceadj and "аА" or "") .. "][\204\129\204\128]?)([гГ])([оО]%-)", repl)
        if not forceadj then
            -- handle много
            text = rsub(text, "%f[%a\204\129\204\128]([Мм]но[\204\129\204\128]?)го%f[^%a\204\129\204\128]", "%1" .. TEMP_G .. "о")
            -- handle немного, намного
            text = rsub(text, "%f[%a\204\129\204\128]([Нн][еа]мно[\204\129\204\128]?)го%f[^%a\204\129\204\128]", "%1" .. TEMP_G .. "о")
            -- handle до́рого [short form of дорогой, adverb]
            text = rsub(text, "%f[%a\204\129\204\128]([Дд]о[\204\129\204\128]?ро)го%f[^%a\204\129\204\128]", "%1" .. TEMP_G .. "о")
            -- handle недо́рого [short form of недорогой, adverb]
            text = rsub(text, "%f[%a\204\129\204\128]([Нн]едо[\204\129\204\128]?ро)го%f[^%a\204\129\204\128]", "%1" .. TEMP_G .. "о")
            -- handle стро́го
            text = rsub(text, "%f[%a\204\129\204\128]([Сс]тро[\204\129\204\128]?)го%f[^%a\204\129\204\128]", "%1" .. TEMP_G .. "о")
            -- handle нестро́го
            text = rsub(text, "%f[%a\204\129\204\128]([Нн]естро[\204\129\204\128]?)го%f[^%a\204\129\204\128]", "%1" .. TEMP_G .. "о")
            -- handle на́строго
            text = rsub(text, "%f[%a\204\129\204\128]([Нн]а[\204\129\204\128]?стро)го%f[^%a\204\129\204\128]", "%1" .. TEMP_G .. "о")
            -- handle убо́го
            text = rsub(text, "%f[%a\204\129\204\128]([Уу]бо[\204\129\204\128]?)го%f[^%a\204\129\204\128]", "%1" .. TEMP_G .. "о")
            -- handle поло́го
            text = rsub(text, "%f[%a\204\129\204\128]([Пп]оло[\204\129\204\128]?)го%f[^%a\204\129\204\128]", "%1" .. TEMP_G .. "о")
            -- check for neuter short forms of compound adjectives in -но́гий
            if rfind(text, "оно[\204\129\204\128]?го%f[^%a\204\129\204\128]") then
                -- handle безно́го
                text = rsub(text, "%f[%a\204\129\204\128]([Бб]езно[\204\129\204\128]?)го%f[^%a\204\129\204\128]", "%1" .. TEMP_G .. "о")
                -- handle босоно́го
                text = rsub(text, "%f[%a\204\129\204\128]([Бб]осоно[\204\129\204\128]?)го%f[^%a\204\129\204\128]", "%1" .. TEMP_G .. "о")
                -- handle веслоно́го
                text = rsub(text, "%f[%a\204\129\204\128]([Вв]еслоно[\204\129\204\128]?)го%f[^%a\204\129\204\128]", "%1" .. TEMP_G .. "о")
                -- handle длинноно́го
                text = rsub(text, "%f[%a\204\129\204\128]([Дд]линноно[\204\129\204\128]?)го%f[^%a\204\129\204\128]", "%1" .. TEMP_G .. "о")
                -- handle двуно́го
                text = rsub(text, "%f[%a\204\129\204\128]([Дд]вуно[\204\129\204\128]?)го%f[^%a\204\129\204\128]", "%1" .. TEMP_G .. "о")
                -- handle коротконо́го
                text = rsub(text, "%f[%a\204\129\204\128]([Кк]оротконо[\204\129\204\128]?)го%f[^%a\204\129\204\128]", "%1" .. TEMP_G .. "о")
                -- handle кривоно́го
                text = rsub(text, "%f[%a\204\129\204\128]([Кк]ривоно[\204\129\204\128]?)го%f[^%a\204\129\204\128]", "%1" .. TEMP_G .. "о")
                -- handle одноно́го
                text = rsub(text, "%f[%a\204\129\204\128]([Оо]дноно[\204\129\204\128]?)го%f[^%a\204\129\204\128]", "%1" .. TEMP_G .. "о")
                -- handle пятино́го
                text = rsub(text, "%f[%a\204\129\204\128]([Пп]ятино[\204\129\204\128]?)го%f[^%a\204\129\204\128]", "%1" .. TEMP_G .. "о")
                -- handle трёхно́го
                text = rsub(text, "%f[%a\204\129\204\128]([Тт]р[ёе][\204\129\204\128]?хно[\204\129\204\128]?)го%f[^%a\204\129\204\128]", "%1" .. TEMP_G .. "о")
                -- handle хромоно́го
                text = rsub(text, "%f[%a\204\129\204\128]([Хх]ромоно[\204\129\204\128]?)го%f[^%a\204\129\204\128]", "%1" .. TEMP_G .. "о")
                -- handle четвероно́го
                text = rsub(text, "%f[%a\204\129\204\128]([Чч]етвероно[\204\129\204\128]?)го%f[^%a\204\129\204\128]", "%1" .. TEMP_G .. "о")
                -- handle шестино́го
                text = rsub(text, "%f[%a\204\129\204\128]([Шш]естино[\204\129\204\128]?)го%f[^%a\204\129\204\128]", "%1" .. TEMP_G .. "о")
            end
            -- handle пе́го [short form of пе́гий "piebald"]
            text = rsub(text, "%f[%a\204\129\204\128]([Пп]е[\204\129\204\128]?)го%f[^%a\204\129\204\128]", "%1" .. TEMP_G .. "о")
            -- handle лого, сого, ого
            text = rsub(text, "%f[%a\204\129\204\128]([лсЛС]?[Оо][\204\129\204\128]?)г(о[\204\129\204\128]?)%f[^%a\204\129\204\128]", "%1" .. TEMP_G .. "%2")
            -- handle Того, То́го (but not того or Того́, which have /v/)
            text = rsub(text, "%f[%a\204\129\204\128](То́?)го%f[^%a\204\129\204\128]", "%1" .. TEMP_G .. "о")
            -- handle лего
            text = rsub(text, "%f[%a\204\129\204\128]([Лл]е[\204\129\204\128]?)го%f[^%a\204\129\204\128]", "%1" .. TEMP_G .. "о")
            -- handle игого, огого; note, we substitute TEMP_G for both г's
            -- because otherwise the ого- at the beginning gets converted to ово
            text = rsub(text, "%f[%a\204\129\204\128]([ИиОо])гог(о[\204\129\204\128]?)%f[^%a\204\129\204\128]", "%1" .. TEMP_G .. "о" .. TEMP_G .. "%2")
            -- handle Диего
            text = rsub(text, "%f[%a\204\129\204\128](Дие́?)го%f[^%a\204\129\204\128]", "%1" .. TEMP_G .. "о")
            -- handle бо́лого
            text = rsub(text, "%f[%a\204\129\204\128]([Бб]о[\204\129\204\128]?ло)го%f[^%a\204\129\204\128]", "%1" .. TEMP_G .. "о")
            -- handle *ого-, *его- (e.g. бого-, снего-)
            text = rsub(text, "([ео][\204\129\204\128]?)го%-", "%1" .. TEMP_G .. "о-")
        end
        -- handle genitive/accusative endings, which are spelled -ого/-его/-аго
        -- (-ogo/-ego/-ago) but transliterated -ovo/-evo/-avo; only for adjectives
        -- and pronouns, excluding words like много, ого (-аго occurs in
        -- pre-reform spelling); \204\129 is an acute accent, \204\128 is a grave accent
        local pattern = "([оеОЕ" .. (forceadj and "аА" or "") .. "][\204\129\204\128]?)([гГ])([оО][\204\129\204\128]?)"
        local reflexive = "([сС][яЯ][\204\129\204\128]?)"
        text = rsub(text, pattern .. "%f[^%a\204\129\204\128]", repl)
        text = rsub(text, pattern .. reflexive .. "%f[^%a\204\129\204\128]", repl)
        -- handle сегодня
        text = rsub(text, "%f[%a\204\129\204\128]([Сс]е)г(о[\204\129\204\128]?дня)%f[^%a\204\129\204\128]", "%1в%2")
        -- handle сегодняшн-
        text = rsub(text, "%f[%a\204\129\204\128]([Сс]е)г(о[\204\129\204\128]?дняшн)", "%1в%2")
        -- replace TEMP_G with g; must be done after the -go -> -vo changes
        text = rsub(text, TEMP_G, "г")
    end

    -- the second half of the if-statement below is an optimization; see above.
    if not noshto and text:find("то") then
        local ch2sh = {["ч"] = "ш", ["Ч"] = "Ш"}
        -- Handle что
        text = rsub(text, "%f[%a\204\129\204\128]([Чч])(то[\204\129\204\128]?)%f[^%a\204\129\204\128]", function(ch, to) return ch2sh[ch] .. to end)
        -- Handle чтобы, чтоб
        text = rsub(text, "%f[%a\204\129\204\128]([Чч])(то[\204\129\204\128]?бы?)%f[^%a\204\129\204\128]", function(ch, to) return ch2sh[ch] .. to end)
        -- Handle ничто
        text = rsub(text, "%f[%a\204\129\204\128]([Нн]и)ч(то[\204\129\204\128]?)%f[^%a\204\129\204\128]", "%1ш%2")
    end

    -- Handle мягкий, лёгкий, легчать, etc.
    text = rsub(text, "([МмЛл][яеё][\204\129\204\128]?)г([кч])", "%1х%2")

    return origtext, text
end

-- Transliterate after the pronunciation-related transformations of
-- export.apply_tr_fixes() have been applied. Called from {{ru-IPA}}.
-- INCLUDE_MONOSYLLABIC_JO_ACCENT is as in export.tr().
function export.tr_after_fixes(text, include_monosyllabic_jo_accent)
    -- Remove word-final hard sign, either utterance-finally or followed by
    -- a non-letter character such as space, comma, period, hyphen, etc.
    text = rsub(text, "[Ъъ]$", "")
    text = rsub(text, "[Ъъ]([%A])", "%1")

    -- Convert apostrophe the hard sign between consonant and vowel (i.e.
    -- in the places where the hard sign normally occurs in modern text).
    -- Apostrophe is sometimes used to indicate the hard sign; this may have
    -- originated from the forcible removal of the hard sign from printing
    -- offices in the 1920's, after the implementation of the Russian
    -- orthography reform. The if-statement is an optimization; see below.
    if rfind(text, "'") then
        text = rsub(text, "(" .. consonants .. ")'([" .. lowercase_vowels .. "])", "%1ъ%2")
        text = rsub(text, "(" .. consonants .. ")'([" .. uppercase_vowels .. "])", "%1Ъ%2")
    end

    -- the if-statement below isn't necessary but may speed things up,
    -- particularly when include_monosyllabic_jo_accent isn't set, in that
    -- in the majority of cases where ё doesn't occur, we avoid a pattern find
    -- (in is_monosyllabic()) and three pattern subs. The translit module needs
    -- to be as fast as possible since it may be called hundreds or
    -- thousands of times on some pages.
    if rfind(text, "[Ёё]") then
        -- We need to special-case ё after a "hushing" consonant, which becomes
        -- ó (or o), without j. We also need special cases for monosyllabic ё
        -- when INCLUDE_MONOSYLLABIC_JO_ACCENT isn't set, so we don't add the
        -- accent mark that we would otherwise include.
        if not include_monosyllabic_jo_accent and is_monosyllabic(text) and not rfind(text, "^%-") then
            text = rsub(text, "([жшчщЖШЧЩ])ё", "%1o")
            text = text:gsub("ё", "jo")
            text = text:gsub("Ё", "Jo")
        else
            -- in a nonmonosyllabic word where there is a later stressed vowel
            -- in the same word (e.g. трёхэта́жный), don't put an accent mark on ё.
            text = rsub(text, "ё([^ %-]-[" .. vowels .. "]́)", "jo%1")
            -- same goes if there are two ё's in a word (трёхколёсный, четырёхзвёздный)
            text = rsub(text, "ё([^ %-]-ё)", "jo%1")
            -- same goes if this is a prefix (четырёх-)
            text = rsub(text, "ё([^ %-]-%-)$", "jo%1")
            -- same goes if there is a stressed vowel *followed* by ё (this is
            -- quite rare but occurs e.g. in А́ндзё "Anjō (city in Japan)"
            text = rsub(text, "([" .. vowels .. "]́[^ %-]-)ё", "%1jo")
            -- handle hushing consonant + ё + another accented vowel (e.g. шёлкопряди́льня)
            -- (already partly converted by previous regexes)
            text = rsub(text, "([жшчщЖШЧЩ])j", "%1")
            -- handle remaining cases of hushing consonant + ё
            text = rsub(text, "([жшчщЖШЧЩ])ё", "%1ó")
            -- conversion of remaining ё will occur as a result of 'tab'.
        end
    end

    -- ю after ж and ш becomes u (e.g. брошюра, жюри)
    text = rsub(text, "([жшЖШ])ю", "%1u")

    -- the if-statement below isn't necessary but may speed things up in that
    -- in the majority of cases where the letters below don't occur, we avoid
    -- six pattern subs.
    if rfind(text, "[ЕеѢѣЭэ]") then
        -- е after a dash at the beginning of a word becomes e, and э becomes ɛ
        -- (like after a consonant)
        text = rsub(text, "^(%-)([ЕеѢѣЭэ])", map_to_plain_e)
        text = rsub(text, "(%s%-)([ЕеѢѣЭэ])", map_to_plain_e)
        -- don't get confused by single quote or parens between consonant and е;
        -- e.g. Б'''ез''', американ(ец)
        text = rsub(text, "(" .. consonants .. "['%(%)]*)([ЕеѢѣЭэ])", map_to_plain_e)

        -- This is now the default
        -- е after a vowel or at the beginning of a word becomes je, and э becomes e
        -- text = rsub(text, "^([ЕеѢѣЭэ])", map_to_je)
        -- text = rsub(text, "(" .. non_consonants .. ")([ЕеѢѣЭэ])", map_to_je)
        -- -- need to do it twice in case of sequences of such vowels
        -- text = rsub(text, "^([ЕеѢѣЭэ])", map_to_je)
        -- text = rsub(text, "(" .. non_consonants .. ")([ЕеѢѣЭэ])", map_to_je)
    end

    text = (rsub(text, ".", tab))
    return text
end

-- Transliterates text, which should be a single word or phrase. It should
-- include stress marks, which are then preserved in the transliteration.
-- ё is a special case: it is rendered (j)ó in multisyllabic words and
-- monosyllabic words in multi-word phrases, but rendered (j)o without an
-- accent in isolated monosyllabic words, unless INCLUDE_MONOSYLLABIC_JO_ACCENT
-- is specified. (This is used in conjugation and declension tables.)
-- NOADJ disables special-casing for adjectives in -го, while FORCEADJ forces
-- special-casing for adjectives and disables checking for exceptions
-- (e.g. много). NOSHTO disables special-casing for что and related words.
function export.tr(text, lang, sc, include_monosyllabic_jo_accent, noadj, noshto, forceadj)
    local origtext, subbed_text = export.apply_tr_fixes(text, noadj, noshto, forceadj)
    return export.tr_after_fixes(subbed_text, include_monosyllabic_jo_accent)
end

-- translit with various special-case substitutions; NOADJ disables
-- special-casing for adjectives in -го, while FORCEADJ forces special-casing
-- for adjectives and disables checking for expections (e.g. много).
-- NOSHTO disables special-casing for что and related words. SUB is used
-- to implement arbitrary substitutions in the Cyrillic text before other
-- transformations are applied and before translit. It is of the form
-- FROM/TO,FROM/TO,...
function export.tr_sub(text, include_monosyllabic_jo_accent, noadj, noshto, sub, forceadj)
    if type(text) == "table" then -- called directly from a template
        include_monosyllabic_jo_accent = ine(text.args.include_monosyllabic_jo_accent)
        noadj = ine(text.args.noadj)
        noshto = ine(text.args.noshto)
        sub = ine(text.args.sub)
        text = text.args[1]
    end

    if sub then
        local subs = rsplit(sub, ",")
        for _, subpair in ipairs(subs) do
            local subsplit = rsplit(subpair, "/")
            text = rsub(text, subsplit[1], subsplit[2])
        end
    end

    return export.tr(text, nil, nil, include_monosyllabic_jo_accent, noadj, noshto, forceadj)
end

-- for adjectives, pronouns
function export.tr_adj(text, include_monosyllabic_jo_accent)
    if type(text) == "table" then -- called directly from a template
        include_monosyllabic_jo_accent = ine(text.args.include_monosyllabic_jo_accent)
        text = text.args[1]
    end

    -- we have to include "forceadj" because typically when tr_adj() is called
    -- from the noun or adjective modules, it's called with suffix ого, which
    -- would otherwise trigger the exceptional case and be transliterated as ogo
    return export.tr(text, nil, nil, include_monosyllabic_jo_accent, false, "noshto", "forceadj")
end

return export

-- For Vim, so we get 4-space tabs
-- vim: set ts=4 sw=4 noet:
