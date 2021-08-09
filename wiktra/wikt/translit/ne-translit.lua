-- Transliteration for Nepali
local export = {}
local gsub = mw.ustring.gsub
local match = mw.ustring.match

local conv = {
    -- consonants
    ["क"] = "k",
    ["ख"] = "kh",
    ["ग"] = "g",
    ["घ"] = "gh",
    ["ङ"] = "ṅ",
    ["च"] = "c",
    ["छ"] = "ch",
    ["ज"] = "j",
    ["झ"] = "jh",
    ["ञ"] = "ñ",
    ["ट"] = "ṭ",
    ["ठ"] = "ṭh",
    ["ड"] = "ḍ",
    ["ढ"] = "ḍh",
    ["ण"] = "ṇ",
    ["त"] = "t",
    ["थ"] = "th",
    ["द"] = "d",
    ["ध"] = "dh",
    ["न"] = "n",
    ["प"] = "p",
    ["फ"] = "ph",
    ["ब"] = "b",
    ["भ"] = "bh",
    ["म"] = "m",
    ["य"] = "y",
    ["र"] = "r",
    ["ल"] = "l",
    ["व"] = "w",
    ["श"] = "ś",
    ["ष"] = "ṣ",
    ["स"] = "s",
    ["ह"] = "h",

    ["क़"] = "q",
    ["ख़"] = "x",
    ["ग़"] = "ġ",
    ["ऴ"] = "ḻ",
    ["ळ"] = "ḷ",
    ["ज़"] = "z",
    ["श़"] = "ž",
    ["झ़"] = "ž",
    ["ड़"] = "ṛ",
    ["ढ़"] = "ṛh",
    ["फ़"] = "f",
    ["थ़"] = "θ",
    ["द़"] = "ð",
    ["ऩ"] = "ṉ",
    ["ऱ"] = "ṟ",
    ["ॽ"] = "'",
    ["व़"] = "V",
    ["ॹ"] = "ž",
    -- vowel diacritics
    ["ि"] = "i",
    ["ु"] = "u",
    ["े"] = "e",
    ["ो"] = "o",
    ["ा"] = "ā",
    ["ी"] = "ī",
    ["ू"] = "ū",
    ["ृ"] = "r̥",
    ["ॄ"] = "r̥̄",
    ["ॢ"] = "l̥",
    ["ॣ"] = "l̥̄",
    ["ै"] = "ai",
    ["ौ"] = "au",
    ["ॉ"] = "ŏ",
    ["ॅ"] = "ĕ",
    -- vowel signs
    ["अ"] = "a",
    ["इ"] = "i",
    ["उ"] = "u",
    ["ए"] = "e",
    ["ओ"] = "o",
    ["आ"] = "ā",
    ["ई"] = "ī",
    ["ऊ"] = "ū",
    ["ऋ"] = "r̥",
    ["ॠ"] = "r̥̄",
    ["ऌ"] = "l̥",
    ["ॡ"] = "l̥̄",
    ["ऐ"] = "ai",
    ["औ"] = "au",
    ["ऑ"] = "ŏ",
    ["ॲ"] = "ĕ",
    ["ऍ"] = "ĕ",
    -- chandrabindu
    ["ँ"] = "̃",
    -- anusvara
    ["ं"] = "ṃ",
    -- visarga
    ["ः"] = "ḥ",
    -- virama
    ["्"] = "",
    -- om
    ["ॐ"] = "om̐",
    -- zero width joiner
    ["‍"] = "a",
    -- numerals
    ["०"] = "0",
    ["१"] = "1",
    ["२"] = "2",
    ["३"] = "3",
    ["४"] = "4",
    ["५"] = "5",
    ["६"] = "6",
    ["७"] = "7",
    ["८"] = "8",
    ["९"] = "9",
    -- punctuation
    ["।"] = ".", -- danda
    ["॥"] = ".", -- double danda
    ["+"] = "", -- compound separator

    -- abbreviation sign
    ["॰"] = "."
}

local nasal_assim = {["क"] = "ङ", ["ख"] = "ङ", ["ग"] = "ङ", ["घ"] = "ङ", ["च"] = "ञ", ["छ"] = "ञ", ["ज"] = "ञ", ["झ"] = "ञ", ["ट"] = "ण", ["ठ"] = "ण", ["ड"] = "ण", ["ढ"] = "ण", ["प"] = "म", ["फ"] = "म", ["ब"] = "म", ["भ"] = "म", ["म"] = "म", ["त"] = "न", ["थ"] = "न", ["द"] = "न", ["ध"] = "न", ["न"] = "न", ["ष"] = "न", ["श"] = "ङ", ["स"] = "न", ["य"] = "म", ["र"] = "म", ["ल"] = "ँ", ["व"] = "म", ["ह"] = "ङ"}
local perm_cl = {["ज्न"] = true, ["ज्ञ"] = true, ["ट्र"] = true, ["ड्र"] = true, ["ट्स"] = true, ["ड्स"] = true, ["स्ड"] = true}

local all_cons, special_cons = "कखगघङचछजझञटठडढणतथदधनपफबभमयरलवसशषह", "कखगघचछजझटठडढणतथदधनपफबभमयरलवशषसह"
local vowel, vowel_sign = "aिुृेोाीूैौॉॅॆॊॄॢॣ", "अइउएओआईऊऋॠॡऌऐऔऑऍ"
local syncope_pattern = "(़?[" .. all_cons .. "])([ंँ]?[" .. vowel .. vowel_sign .. "])(़?[" .. all_cons .. "])([ंँ]?[" .. vowel .. vowel_sign .. "])(़?[" .. all_cons .. "])a(़?[" .. all_cons .. "])([ंँ]?[" .. vowel .. vowel_sign .. "])(़?[" .. all_cons .. "])([ंँ]?[" .. vowel .. vowel_sign .. "])"

local nor_cons, sp_cons = "कखगघङचछजझञटठडढतथदधपफबभशषसयरलवणनमयरलवनम", "कलम"
local vowel, vowel_sign = "aिुृेोाीूैौॉॅॆॊॄॢॣ", "अइउएओआईऊऋॠॡऌऐऔऑऍ"
local koka_sign = "ोीाैे"
local koka_pattern = "([" .. koka_sign .. "])(़?[" .. sp_cons .. "])a(़?[" .. gsub(nor_cons, "य", "") .. "])([ंँ]?[" .. vowel .. vowel_sign .. "])"

local function rev_string(text)
    local result, length = {}, mw.ustring.len(text)
    for i = length, 1, -1 do table.insert(result, mw.ustring.sub(text, i, i)) end
    return table.concat(result)
end
function export.tr(text, lang, sc)
    text = gsub(text, "([" .. all_cons .. "]़?)([" .. vowel .. "्]?)", function(c, d) return c .. (d == "" and "a" or d) end)
    for word in mw.ustring.gmatch(text, "[ऀ-ॿa]+") do
        local orig_word = word
        word = rev_string(word)
        word = gsub(word, "^a(़?)([" .. all_cons .. "])(.)(.?)", function(opt, first, second, third) return (((match(first, "[" .. special_cons .. "]") and match(second, "ं") or match(first, "[" .. special_cons .. "]") and match(second, "्") and not perm_cl[first .. second .. third]) or match(first .. second, "य[aिुृेोाीूैौॉॅॆॊआईउऊइएऐओऔ]") or match(first .. second, "ह[अaिुृेोाीूैौॉॅॆॊआईउऊइएऐओऔ]")) and "a" or "") .. opt .. first .. second .. third end)

        while match(word, syncope_pattern) do word = gsub(word, syncope_pattern, "%1%2%3%4%5%6%7%8%9") end
        while match(word, koka_pattern) do word = gsub(word, koka_pattern, "%1%2%3%4") end
        word = gsub(word, "(.?)ं(.)", function(succ, prev) return succ .. (succ .. prev == "a" and "्म" or (succ == "" and match(prev, "[" .. vowel .. "]") and "̃" or nasal_assim[succ] or "ṃ")) .. prev end)

        local escaped_orig_word = gsub(orig_word, "%+", "")
        text = gsub(text, orig_word, rev_string(word))
        text = gsub(text, "ईन$", "īna")
        text = gsub(text, "(...)ईन ", "%1īna ")
        text = gsub(text, "इन$", "ina")
        text = gsub(text, "(...)इन ", "%1ina ")
        text = gsub(text, "ैन$", "aina")
        text = gsub(text, "(...)ैैैैन ", "%1aina ")
        text = gsub(text, "उन$", "una")
        text = gsub(text, "(...)उन ", "%1una ")
        text = gsub(text, "िन$", "ina")
        text = gsub(text, "(...)िन ", "%1ina ")
        text = gsub(text, "िछ$", "icha")
        text = gsub(text, "(...)िछ ", "%1icha ")
        text = gsub(text, "उछ$", "ucha")
        text = gsub(text, "(...)उछ ", "%1ucha ")
        text = gsub(text, "इछ$", "icha")
        text = gsub(text, "(...)इछ ", "%1icha ")
        text = gsub(text, "एछ$", "echa")
        text = gsub(text, "ेछ$", "echa")
        text = gsub(text, "(...)ेछ ", "%1echa ")
        text = gsub(text, "(...)ेन ", "%1ena ")
        text = gsub(text, "ेन$", "ena")
        text = gsub(text, "(...)एन ", "%1ena ")
        text = gsub(text, "एर$", "era")
        text = gsub(text, "(...)एर ", "%1era ")
        text = gsub(text, "ेर$", "era")
        text = gsub(text, "(...)ेर ", "%1era ")
        text = gsub(text, "एन$", "ena")
        text = gsub(text, "उँछ$", "ũcha")
        text = gsub(text, "(...)उँछ ", "%1ucha ")
        text = gsub(text, "बाट$", "bāṭa")
        text = gsub(text, "(...)बाट ", "%1bāṭa ")
        text = gsub(text, "ज्ञ", "gy")
    end
    text = gsub(text, ".़?", conv)
    text = gsub(text, "a([iu])̃", "a͠%1")
    text = gsub(text, "[<>]", "")
    text = gsub(text, "ॱ", "")

    text = gsub(text, "dach$", "dacha")
    text = gsub(text, "(...)dach ", "%1dacha ")
    text = gsub(text, "ain$", "aina")
    text = gsub(text, "(...)ain ", "%1aina ")
    text = gsub(text, "nach$", "nacha")
    text = gsub(text, "(...)nach ", "%1nacha ")
    text = gsub(text, "wai", "vai")
    text = gsub(text, "w$", "v")
    text = gsub(text, "(...)w ", "%1v ")
    text = gsub(text, "([raäāiīuūeo])([r])w", "%1rv")
    text = gsub(text, "w([iīewoyr̥l̥l̥̄r̥̄])", "v%1")
    text = gsub(text, "([w])a([krjtcṅñysśdphṇn])([tnrṇṣcśkghjsueoayd])", "va%2%3")
    text = gsub(text, "([w])ā([cgjṇtdmyshśṣn])", "vā%2")
    text = gsub(text, "([w])ā([r])([tdābuṇṣh])", "vā%2%3")
    text = gsub(text, "([w])ā([l])([m])", "vā%2%3")
    text = gsub(text, "([w])a([sśṣṅñṃypdtnc])", "va%2")
    text = gsub(text, "rh̥", "hr̥")
    ---text = gsub(text, 'kṣ', 'ch̥')
    text = gsub(text, "ahar([uū])", "har%1")
    text = gsub(text, "abāṭa", "bāṭa")

    text = gsub(text, "kan$", "kana")
    text = gsub(text, "(...)kan ", "%1kana ")
    text = gsub(text, "([ptkbdgṭṇñḍmṅnlrwyhṣśs])([ptkbdgṭḍmṇñnlrwyṣśs])har([uū])", "%1%2ahar%3")
    text = gsub(text, "([ptkbdgṭṇñḍmṅnlrwyhṣśs])([ptkbdgṭḍmṇñnlrwyṣśs])bāṭa", "%1%2abāṭa")
    text = gsub(text, "([ptkbdgṭḍmṅṇñnlrwyhṣśs])([ptkbdgṭḍmnlrṇñwyś])([mlk])", "%1%2a%3")
    text = gsub(text, "ñz", "nz")
    text = gsub(text, "ñgy", "ṅgy")
    text = gsub(text, "([a])(̃)l([a])", "%1ml%3") -- assim case l
    text = gsub(text, "([eāuūiīo])([īuiū])m([m])", "%1%2ṃ%3") -- assim case m
    text = gsub(text, "([a])([īuiū])m([m])", "%1͠%2%3") -- assim case m2
    text = gsub(text, "([eāuūiīo])([īuiū])n([st])", "%1%2ṃ%3") -- assim case s
    text = gsub(text, "([a])([īuiū])n([st])", "%1͠%2%3") -- assim case s2
    text = gsub(text, "([a])([uū])ṅ([hk])", "%1͠%2%3") -- assim case kh
    text = gsub(text, "([eāuūiīo])([īuiū])ṅ([kh])", "%1%2ṃ%3") -- assim case kh2
    return mw.ustring.toNFC(text)
end
return export
