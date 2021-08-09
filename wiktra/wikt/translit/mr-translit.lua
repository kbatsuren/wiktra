-- Transliteration for Marathi (in progress)
local export = {}
local gsub = mw.ustring.gsub
local find = mw.ustring.find

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
    ["व"] = "v",
    ["ळ"] = "ḷ",
    ["श"] = "ś",
    ["ष"] = "ṣ",
    ["स"] = "s",
    ["ह"] = "h",
    ["ऱ"] = "r",
    -- ['ज्ञ'] = 'dny',

    -- special nuqta consonants ONLY FOR [[MOD:mr-IPA]] not mainspace entries
    ["ज़"] = "j̈",
    ["झ़"] = "j̈h",
    ["च़"] = "ċ",
    ["छ़"] = "ċh",

    -- vowel diacritics
    ["ि"] = "i",
    ["ु"] = "u",
    ["े"] = "e",
    ["ो"] = "o",
    ["ा"] = "ā",
    ["ी"] = "ī",
    ["ू"] = "ū",
    ["ृ"] = "ru",
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
    ["ऋ"] = "ŕ",
    ["ऐ"] = "ai",
    ["औ"] = "au",
    ["ऑ"] = "ŏ",
    ["ॲ"] = "ĕ",
    ["ऍ"] = "ĕ",

    ["ॐ"] = "om",

    -- chandrabindu
    ["ँ"] = "̃",

    -- anusvara
    ["ं"] = "ṁ",

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

local nasal_assim = {["क"] = "ङ", ["ख"] = "ङ", ["ग"] = "ङ", ["घ"] = "ङ", ["च"] = "ञ", ["छ"] = "ञ", ["ज"] = "ञ", ["झ"] = "ञ", ["ट"] = "ण", ["ठ"] = "ण", ["ड"] = "ण", ["ढ"] = "ण", ["प"] = "म", ["फ"] = "म", ["ब"] = "म", ["भ"] = "म", ["म"] = "म", ["य"] = "इ", ["र"] = "उ", ["ल"] = "ल", ["व"] = "उ", ["श"] = "उ", ["ष"] = "उ", ["स"] = "उ", ["ह"] = "उ"}

local perm_cl = {["म्ल"] = true, ["व्ल"] = true, ["न्ल"] = true}

local all_cons, special_cons = "कखगघङचछजझञटठडढतथदधपफबभशषसयरलवहणनमळ", "दतयरलवहनम"
local vowel, vowel_sign = "%*aिुृेोाीूैौॉॅ", "अइउएओआईऊऋऐऔऑऍ"
local syncope_pattern = "([" .. vowel .. vowel_sign .. "])(़?[" .. all_cons .. "])a(़?[" .. all_cons .. "])([ंँ]?[" .. vowel .. vowel_sign .. "])"

local function rev_string(text)
    local char_array, i = {}, 1
    for char in string.gmatch(text, "[%z\1-\127\194-\244][\128-\191]*") do -- UTF-8 character pattern
        char_array[i] = char
        i = i + 1
    end
    return table.concat(require("table").reverse(char_array))
end

function export.tr(text, lang, sc)
    text = gsub(text, "ाँ", "ॉ" .. "ं")
    text = gsub(text, "ँ", "ॅ" .. "ं")
    text = gsub(text, "([^" .. vowel .. vowel_sign .. "])ं ", "%1अ ")
    text = gsub(text, "([^" .. vowel .. vowel_sign .. "])ं$", "%1अ")
    text = gsub(text, "([" .. all_cons .. "]़?)([" .. vowel .. "्]?)", function(c, d) return c .. (d == "" and "a" or d) end)
    for word in mw.ustring.gmatch(text, "[ऀ-ॿa]+") do
        local orig_word = word
        word = rev_string(word)
        word = gsub(word, "^a(़?[" .. all_cons .. "][" .. vowel .. vowel_sign .. "])", "%1")
        while find(word, syncope_pattern) do word = gsub(word, syncope_pattern, "%1%2%3%4") end
        word = gsub(word, "(.?)ं(.)", function(succ, prev) return succ .. (succ .. prev == "a" and "्म" or (succ == "" and find(prev, "[" .. vowel .. "]") and "̃" or nasal_assim[succ] or "n")) .. prev end)
        text = gsub(text, orig_word, rev_string(word))
    end
    text = gsub(text, ".़?", conv)
    text = gsub(text, "a([iu])̃", "a͠%1")
    text = gsub(text, "aa", "a")
    text = gsub(text, "ñjñ", "ndny")
    text = gsub(text, "jñ", "dny")
    return mw.ustring.toNFC(text)
end

return export
