local export = {}
local gsub = mw.ustring.gsub
local match = mw.ustring.match

local conv = {
    -- consonants
    ["क"] = "k",
    ["ख"] = "kh",
    ["ग"] = "g",
    ["घ"] = "gh",
    ["ङ"] = "ng",
    ["च"] = "ts",
    ["छ"] = "tsh",
    ["ज"] = "dz",
    ["झ"] = "dzh",
    ["ञ"] = "ny",
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
    ["ळ"] = "ḷ",
    ["श"] = "sh",
    ["ष"] = "ṣ",
    ["स"] = "s",
    ["ह"] = "h",
    ["श़"] = "zh",
    ["स़"] = "z",
    ["ॽ"] = "'",
    ["च़"] = "c",
    ["छ़"] = "ch",

    --
    ["क़"] = "q",
    ["ख़"] = "x",
    ["ग़"] = "ġ",
    ["ऴ"] = "ḻ",
    ["ज़"] = "z",
    ["झ़"] = "ž",
    ["ड़"] = "ṛ",
    ["ढ़"] = "ṛh",
    ["फ़"] = "f",
    ["थ़"] = "θ",
    ["द़"] = "ð",
    ["ऩ"] = "ṉ",
    ["ऱ"] = "ṟ",
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

local all_cons, special_cons = "कखगघङचछजझञटठडढणतथदधनपफबभमयरलवसशषह", "कखगघचछजझटठडढणतथदधनपफबभमयरलवशषसह"
local vowel, vowel_sign = "aिुृेोाीूैौॉॅॆॊॄॢॣ", "अइउएओआईऊऋॠॡऌऐऔऑऍ"

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

        local escaped_orig_word = gsub(orig_word, "%+", "")
        text = gsub(text, orig_word, rev_string(word))
        text = gsub(text, "च्य", "c")
        text = gsub(text, "छ्य", "ch")
        text = gsub(text, "ज्य", "j")
        text = gsub(text, "झ्य", "jh")
    end
    text = gsub(text, ".़?", conv)
    text = gsub(text, "a([iu])̃", "a͠%1")
    text = gsub(text, "[<>]", "")
    return mw.ustring.toNFC(text)
end
return export
