-- Transliteration for Hindi (possibly other languages using Devanagari script, except for Sanskrit)
local export = {}
local gsub = mw.ustring.gsub
local match = mw.ustring.match

local conv = {
    -- consonants
    ["ख"] = "k",
    ["ग"] = "g",
    ["ङ"] = "ṅ",
    ["ज"] = "j",
    ["थ"] = "t",
    ["द"] = "d",
    ["न"] = "n",
    ["फ"] = "f",
    ["ब"] = "b",
    ["म"] = "m",
    ["य"] = "y",
    ["र"] = "r",
    ["ल"] = "l",
    ["व"] = "o",
    ["स"] = "s",
    ["ह"] = "h",

    -- vowel diacritics
    ["ि"] = "i",
    ["ु"] = "u",
    ["े"] = "e",
    ["ो"] = "w",
    ["ा"] = "a",
    ["ै"] = "wi",
    ["ौ"] = "wu",
    ["’"] = "o",

    -- vowel signs
    ["अ"] = "o",
    ["इ"] = "i",
    ["उ"] = "u",
    ["ए"] = "e",
    ["ओ"] = "w",
    ["आ"] = "a",
    ["ऐ"] = "wi",
    ["औ"] = "wu",
    ["अ’"] = "o",

    ["ॐ"] = "om",

    -- chandrabindu
    ["ँ"] = "ṅ",

    -- anusvara
    ["ं"] = "ṅ",

    -- visarga
    ["ः"] = "ḥ",

    -- virama
    ["्"] = "",

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

-- These clusters when occurring word-finally will not trigger a schwa added
-- after them even though the second consonant is in special_cons, which normally
-- causes the extra schwa to be added. NOTE: The clusters are reversed from their
-- ultimate effect, e.g. the first cluster is written 'ml' but actually applies
-- to words ending in 'lm'. The clusters below overall refer to the six clusters
-- describable by [rl][mnv], i.e. rm, rn, rv, lm, ln, lv.
local perm_cl = {["म्ल"] = true, ["व्ल"] = true, ["न्ल"] = true, ["म्र"] = true, ["व्र"] = true, ["न्र"] = true}

local all_cons, special_cons = "कखगघङचछजझञटठडढतथदधपफबभशषसयरलवहणनम", "यरलवहनम"
local vowel, vowel_sign = "*िुेोाैौ’o'", "अइउएओआऐऔअ’'"
local long_vowel, short_vowel = "ाैौआऐऔ", "*िुेो’अइउएओअ'"
local syncope_pattern = "([" .. vowel .. vowel_sign .. "])(़?[" .. all_cons .. "])o(़?[" .. all_cons .. "])([ंँ]?[" .. vowel .. vowel_sign .. "])"

local function rev_string(text)
    local result, length = {}, mw.ustring.len(text)
    for i = length, 1, -1 do table.insert(result, mw.ustring.sub(text, i, i)) end
    return table.concat(result)
end

function export.tr(text, lang, sc)
    -- abbreviation dot
    text = gsub(text, "॰", ".")
    text = gsub(text, "([" .. all_cons .. "]़?)([" .. vowel .. "्]?)", function(c, d) return c .. (d == "" and "o" or d) end)
    for word in mw.ustring.gmatch(text, "[ऀऀ-ॿo']+") do
        local orig_word = word
        word = rev_string(word)
        word = gsub(word, "^o(़?)([" .. all_cons .. "])(.)(.?)", function(opt, first, second, third) return (((match(first, "[" .. special_cons .. "]") and match(second, "्") and not perm_cl[first .. second .. third]) or match(first .. second, "य[ी]")) and "o" or "") .. opt .. first .. second .. third end)
        while match(word, syncope_pattern) do word = gsub(word, syncope_pattern, "%1%2%3%4") end
        word = rev_string(word)
        -- Convert * to %* so we can match it in a regex.
        local escaped_orig_word = gsub(orig_word, "%*", "%*")
        text = gsub(text, escaped_orig_word, word)
    end
    text = gsub(text, ".़?", conv)
    text = gsub(text, "%*", "o")
    return mw.ustring.toNFC(text)
end

return export
