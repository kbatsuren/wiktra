-- Transliteration for Hindi (possibly other languages using Devanagari script, except for Sanskrit)
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
    ["व"] = "v",
    ["ळ"] = "ḷ",
    ["श"] = "ś",
    ["ष"] = "ṣ",
    ["स"] = "s",
    ["ह"] = "h",
    ["क़"] = "q",
    ["ख़"] = "x",
    ["ग़"] = "ġ",
    ["ऴ"] = "ḻ",
    ["ज़"] = "z",
    ["ष़"] = "ḻ",
    ["झ़"] = "ž",
    ["ड़"] = "ṛ",
    ["ढ़"] = "ṛh",
    ["फ़"] = "f",
    ["थ़"] = "θ",
    ["ऩ"] = "ṉ",
    ["ऱ"] = "ṟ",
    -- ['ज्ञ'] = 'gy',

    -- vowel diacritics
    ["ि"] = "i",
    ["ु"] = "u",
    ["े"] = "e",
    ["ो"] = "o",
    ["ॊ"] = "ǒ",
    ["ॆ"] = "ě",
    ["ा"] = "ā",
    ["ी"] = "ī",
    ["ू"] = "ū",
    ["ृ"] = "ŕ",
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
    ["ऎ"] = "ě",
    ["ऒ"] = "ǒ",
    ["ऋ"] = "ŕ",
    ["ऐ"] = "ai",
    ["औ"] = "au",
    ["ऑ"] = "ŏ",
    ["ऍ"] = "ĕ",

    ["ॐ"] = "om",

    -- chandrabindu
    ["ँ"] = "̃",

    -- anusvara
    ["ं"] = "̃",

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

local nasal_assim_short = {["क"] = "ङ", ["ख"] = "ङ", ["ग"] = "ङ", ["घ"] = "ङ", ["ङ"] = "ङ", ["च"] = "ञ", ["छ"] = "ञ", ["ज"] = "ञ", ["झ"] = "ञ", ["ञ"] = "ञ", ["ट"] = "ण", ["ठ"] = "ण", ["ड"] = "ण", ["ढ"] = "ण", ["ण"] = "ण", ["त"] = "न", ["थ"] = "न", ["द"] = "न", ["ध"] = "न", ["न"] = "न", ["प"] = "म", ["फ"] = "म", ["ब"] = "म", ["भ"] = "म", ["म"] = "म", ["व"] = "म", ["य"] = "ँ", ["ष"] = "न", ["श"] = "न", ["स"] = "न", ["ह"] = "ँ"}

local nasal_assim_long = {["क"] = "ँ", ["ख"] = "ँ", ["ग"] = "ङ", ["घ"] = "ङ", ["ङ"] = "ङ", ["च"] = "ँ", ["छ"] = "ञ्", ["ज"] = "ञ", ["झ"] = "ञ", ["ञ"] = "ञ", ["ट"] = "ँ", ["ठ"] = "ँ", ["ड"] = "ण", ["ढ"] = "ण", ["ण"] = "ण", ["त"] = "न", ["थ"] = "न", ["द"] = "न", ["ध"] = "न", ["न"] = "न", ["प"] = "ँ", ["फ"] = "ँ", ["ब"] = "म", ["भ"] = "म", ["म"] = "म", ["ह"] = "ँ"}

-- These clusters when occurring word-finally will not trigger a schwa added
-- after them even though the second consonant is in special_cons, which normally
-- causes the extra schwa to be added. NOTE: The clusters are reversed from their
-- ultimate effect, e.g. the first cluster is written 'ml' but actually applies
-- to words ending in 'lm'. The clusters below overall refer to the six clusters
-- describable by [rl][mnv], i.e. rm, rn, rv, lm, ln, lv.
local perm_cl = {["म्ल"] = true, ["व्ल"] = true, ["न्ल"] = true, ["म्र"] = true, ["व्र"] = true, ["न्र"] = true}

local all_cons, special_cons = "कखगघङचछजझञटठडढतथदधपफबभशषसयरलवहणनम", "यरलवहनमञ"
local vowel, vowel_sign = "*aिुृेोाीूैौॉॅॆॊ'", "अइउएओआईऊऋऐऔऑऍ'"
local long_vowel, short_vowel = "ाीूआईऊ", "*aिुृॉॅॆॊअइउऋऑऍोैौेओऔएऐ'"
local syncope_pattern = "([" .. vowel .. vowel_sign .. "])(़?[" .. all_cons .. "])a(़?[" .. all_cons .. "])([ंँ]?[" .. vowel .. vowel_sign .. "])"

local function rev_string(text)
    local result, length = {}, mw.ustring.len(text)
    for i = length, 1, -1 do table.insert(result, mw.ustring.sub(text, i, i)) end
    return table.concat(result)
end

function export.tr(text, lang, sc)
    -- force word-final anusvara to behave as a pure nasal
    text = gsub(text, "ं$", "ँ")
    text = gsub(text, "ं ", "ँ ")
    text = gsub(text, "ं%-", "ँ-")
    -- abbreviation dot
    text = gsub(text, "॰", ".")
    text = gsub(text, "([" .. all_cons .. "]़?)([" .. vowel .. "्]?)", function(c, d) return c .. (d == "" and "a" or d) end)
    for word in mw.ustring.gmatch(text, "[ऀ-ॿa*]+") do
        local orig_word = word
        word = rev_string(word)
        word = gsub(word, "^a(़?)([" .. all_cons .. "])(.)(.?)", function(opt, first, second, third) return (((match(first, "[" .. special_cons .. "]") and match(second, "्") and not perm_cl[first .. second .. third]) or match(first .. second, "य[ी]")) and "a" or "") .. opt .. first .. second .. third end)
        while match(word, syncope_pattern) do word = gsub(word, syncope_pattern, "%1%2%3%4") end
        word = rev_string(word)
        -- sometimes chandrabindu != anusvara
        word = gsub(word, "([" .. short_vowel .. long_vowel .. "])ं([सशषवय])", function(prev, succ) return prev .. (nasal_assim_short[succ] or "̃") .. succ end)
        word = gsub(word, "([" .. short_vowel .. long_vowel .. "])ँ([सशषवय])", function(prev, succ) return prev .. "̃" .. succ end)
        word = gsub(word, "([" .. short_vowel .. long_vowel .. "])ं([तदडपछ])", function(prev, succ) return prev .. (nasal_assim_short[succ] or "̃") .. succ end)
        word = gsub(word, "([" .. short_vowel .. long_vowel .. "])ँ([तदडपछ])", function(prev, succ) return prev .. "̃" .. succ end)
        -- force chandrabindu to behave as anusvara
        word = gsub(word, "ँ", "ं")
        word = gsub(word, "([" .. short_vowel .. "])ं(.़?)", function(prev, succ) return prev .. (nasal_assim_short[succ] or "̃") .. succ end)
        word = gsub(word, "([" .. long_vowel .. "])ं(.़?)", function(prev, succ) return prev .. (nasal_assim_long[succ] or "̃") .. succ end)
        -- Convert * to %* so we can match it in a regex.
        local escaped_orig_word = gsub(orig_word, "%*", "%*")
        text = gsub(text, escaped_orig_word, word)
    end
    text = gsub(text, ".़?", conv)
    text = gsub(text, "a([iu])̃", "a͠%1")
    text = gsub(text, "jñ", "gy")
    text = gsub(text, "ñz", "nz")
    text = gsub(text, "ṇṛ", "nz")
    text = gsub(text, "%*", "a")
    return mw.ustring.toNFC(text)
end

return export
