-- Transliteration for Maithili
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
    ["झ़"] = "ž",
    ["ड़"] = "ṛ",
    ["ढ़"] = "ṛh",
    ["फ़"] = "f",
    ["ऩ"] = "ṉ",
    ["ऱ"] = "ṟ",

    -- vowel diacritics
    ["ि"] = "i",
    ["ु"] = "u",
    ["े"] = "ē",
    ["ॆ"] = "e",
    ["ो"] = "ō",
    ["ॊ"] = "o",
    ["ा"] = "ā",
    ["ी"] = "ī",
    ["ू"] = "ū",
    ["ृ"] = "r̥",
    ["ॄ"] = "r̥̄",
    ["ै"] = "ai",
    ["ौ"] = "au",
    ["ॏ"] = "ŏ",
    ["ऺ"] = "â",
    ["ॅ"] = "ĕ",

    -- vowel signs
    ["अ"] = "a",
    ["इ"] = "i",
    ["उ"] = "u",
    ["ए"] = "ē",
    ["ऎ"] = "e",
    ["ओ"] = "ō",
    ["आ"] = "ā",
    ["ई"] = "ī",
    ["ऊ"] = "ū",
    ["व़"] = "u",
    ["य़"] = "i",
    ["ऋ"] = "r̥",
    ["ॠ"] = "r̥̄",
    ["ऐ"] = "ai",
    ["औ"] = "au",
    ["ꣾ"] = "ai",
    ["◌ꣿ"] = "ai",
    ["ॵ"] = "ŏ",
    ["ऒ"] = "o",
    ["ॴ"] = "â",
    ["ऍ"] = "ĕ",
    ["इऺ"] = "ï",
    ["उऺ"] = "ü",
    ["२"] = "’",
    ["ऽ"] = "ô",
    ["ँ"] = "̃", -- chandrabindu
    ["ं"] = "̃", -- anusvara
    ["ः"] = "ḥ", -- visarga
    ["्"] = "", -- virama
    ["ॐ"] = "om̐", -- om

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

local nasal_assim = {["क"] = "ङ", ["ख"] = "ङ", ["ग"] = "ङ", ["घ"] = "ङ", ["च"] = "ञ", ["छ"] = "ञ", ["ज"] = "ञ", ["झ"] = "ञ", ["ट"] = "ण", ["ठ"] = "ण", ["ड"] = "ण", ["ढ"] = "ण", ["प"] = "म", ["फ"] = "म", ["ब"] = "म", ["भ"] = "म", ["म"] = "म", ["त"] = "न", ["थ"] = "न", ["द"] = "न", ["ध"] = "न", ["न"] = "न"}
local perm_cl = {["म्ल"] = true, ["व्ल"] = true, ["न्ल"] = true}

local all_cons, special_cons = "कखगघङचछजझञटठडढणतथदधनपफबभमयरलवसशषह", "छकखगतसहयथडढठपदणधरषटलवब भडचनशम"
local vowel, vowel_sign = "aिुृेोाीूैौॉॅॆॊऻऻॊॆॏ’", "अइउएओआईऊऋॠऎऒव़य़ॵॳॴऐऔऑऍ"

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

        word = gsub(word, "(.?)ं(.)", function(succ, prev) return succ .. (succ .. prev == "a" and "्म" or (succ == "" and match(prev, "[" .. vowel .. "]") and "̃" or nasal_assim[succ] or "̃")) .. prev end)

        local escaped_orig_word = gsub(orig_word, "%+", "")
        text = gsub(text, orig_word, rev_string(word))
        text = gsub(text, "ज्ञ", "gy")
    end
    text = gsub(text, ".़?", conv)
    text = gsub(text, "ā([iu])̃", "ā͠%1")
    text = gsub(text, "uu", "u")
    text = gsub(text, "aâ", "â")
    text = gsub(text, "ii", "i")
    text = gsub(text, "([iīaāuūeoâ])a", "%1")
    text = gsub(text, "[<>]", "")
    return mw.ustring.toNFC(text)
end
return export
