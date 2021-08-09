-- Transliteration for Assamese
local export = {}
local gsub = mw.ustring.gsub
local match = mw.ustring.match

local conv = {
    -- consonants
    ["ক্ষ"] = "kh",
    ["ক"] = "k",
    ["খ"] = "kh",
    ["গ"] = "g",
    ["ঘ"] = "gh",
    ["ঙ"] = "ṅ",
    ["চ"] = "s",
    ["ছ"] = "s",
    ["জ"] = "z",
    ["ঝ"] = "zh",
    ["ঞ"] = "ñ",
    ["ট"] = "t",
    ["ঠ"] = "th",
    ["ড"] = "d",
    ["ঢ"] = "dh",
    ["ণ"] = "n",
    ["ত"] = "t",
    ["থ"] = "th",
    ["দ"] = "d",
    ["ধ"] = "dh",
    ["ন"] = "n",
    ["প"] = "p",
    ["ফ"] = "ph",
    ["ব"] = "b",
    ["ভ"] = "bh",
    ["ম"] = "m",
    ["য"] = "z",
    ["ৰ"] = "r",
    ["ল"] = "l",
    ["ৱ"] = "w",
    ["শ"] = "x",
    ["ষ"] = "x",
    ["স"] = "x",
    ["হ"] = "h",
    ["য়"] = "y",
    ["ড়"] = "r",
    ["ঢ়"] = "rh",

    -- vowel diacritics
    ["’"] = "ö",
    ["ি"] = "i",
    ["ু"] = "u",
    ["ৃ"] = "ri",
    ["ে"] = "e",
    ["ে’"] = "ë",
    ["ো"] = "ü",
    ["া"] = "a",
    ["ী"] = "i",
    ["ূ"] = "u",
    ["ৈ"] = "oi",
    ["ৌ"] = "ou",

    -- visarga
    ["ঃ"] = "o",

    -- vowel signs
    ["অ"] = "o",
    ["অ’"] = "ó",
    ["ই"] = "i",
    ["উ"] = "u",
    ["ঋ"] = "ri",
    ["এ"] = "e",
    ["এ’"] = "é",
    ["ও"] = "ü",
    ["আ"] = "a",
    ["ঈ"] = "i",
    ["ঊ"] = "u",
    ["ঐ"] = "oi",
    ["ঔ"] = "ou",

    -- hosonto
    ["্"] = "",

    -- sondrobindu
    ["ঁ"] = "̃",

    -- owogroho
    ["ঽ"] = "o",

    -- onusor
    ["ং"] = "ṅ",

    -- hosonto to, 
    ["ৎ"] = "t",

    -- numerals
    ["০"] = "0",
    ["১"] = "1",
    ["২"] = "2",
    ["৩"] = "3",
    ["৪"] = "4",
    ["৫"] = "5",
    ["৬"] = "6",
    ["৭"] = "7",
    ["৮"] = "8",
    ["৯"] = "9",

    -- punctuation
    ["।"] = "." -- dari
}

local conv2 = {["ক্ষ"] = "ḱ", ["খ"] = "ḱ", ["ঘ"] = "ǵ", ["ঙ"] = "ŋ", ["ং"] = "ŋ", ["ঝ"] = "ź", ["ঠ"] = "ṫ", ["থ"] = "ṫ", ["ঢ"] = "ḋ", ["ধ"] = "ḋ", ["ফ"] = "ṗ", ["ভ"] = "ḃ", ["ঢ়"] = "ŕ", ["ৃ"] = "ṙ", ["ঋ"] = "ṙ", ["ৈ"] = "ʏ", ["ঐ"] = "ʏ", ["ৌ"] = "ɵ", ["ঔ"] = "ɵ"}

local consonant, vowel, vowel_sign = "ক-হড়-য়ৰৱ", "oা-ৌ’", "অ-ঔ"
local c = "[" .. consonant .. "]"
local cc = "়?" .. c
local v = "[" .. vowel .. vowel_sign .. "]"
local syncope_pattern = "(" .. v .. cc .. v .. cc .. ")o(" .. cc .. "ঁ?" .. v .. ")"

local function rev_string(text)
    local result, length = "", mw.ustring.len(text)
    for i = 1, length do result = result .. mw.ustring.sub(text, length - i + 1, length - i + 1) end
    return result
end

function export.tr(text, lang, sc, mode)
    text = gsub(text, "([^ৰ])্য", "%1্য়")
    text = gsub(text, "্ব", "্ৱ")
    text = gsub(text, "[শষস]্", "চ্")
    text = gsub(text, "্স", "্চ")
    text = gsub(text, "[োও]ৱ", "্ও")
    text = gsub(text, "ক্ষ", "খ")
    text = gsub(text, "’ৱ", "্অ’")
    text = gsub(text, "[ুুউ]ৱ(.)", "্উ%1")
    text = gsub(text, "[োও]ৱ(.)", "্ও%1")
    text = gsub(text, "োঁৱ(.)", "্ওঁ%1")
    text = gsub(text, "[ৌঔ]ৱ", "্ঔ")
    text = gsub(text, "[িই]য়(.)", "্ই%1")
    text = gsub(text, "ৃয়", "্ঋ")
    text = gsub(text, "[েএ]য়(.)", "্এ%1")
    text = gsub(text, "[ে’এ’]য়", "্এ’")
    text = gsub(text, "[ৈঐ]য়(.)", "্ঐ%1")
    text = gsub(text, "[ীঈ]য়(.)", "্ঈ%1")
    text = gsub(text, "[ীঈ]য়", "্ঈঅ") -- end
    text = gsub(text, "[ূূঊ]ৱ", "্ঊ")
    text = gsub(text, "݁", "্অ")
    text = gsub(text, "ঃ", "্অ")
    text = gsub(text, "[࣪ܿ]", "্")
    text = gsub(text, "বাৰ", "্বাৰ")
    text = gsub(text, "বিলাক", "্বিলাক")
    text = gsub(text, "টো", "্টো")
    text = gsub(text, "খন", "্খন")
    text = gsub(text, "ডাল", "্ডাল")
    text = gsub(text, "খিনি", "্খিনি")
    text = gsub(text, "জন", "্জন")
    text = gsub(text, "জনী", "্জনী")
    text = gsub(text, "গৰাকী", "্গৰাকী")
    text = gsub(text, "সকল", "্সকল")
    text = gsub(text, "কৈ", "্কৈ")
    text = gsub(text, "কে", "্কে")
    text = gsub(text, "ফাল", "্ফাল")
    text = gsub(text, "কেই", "্কেই")
    text = gsub(text, "মান", "্মান")
    text = gsub(text, "[িীইঈ]ঞ", "্ইঅ͂")
    text = gsub(text, "ঞ্", "ন্̃")

    text = gsub(text, "(" .. c .. "়?)([" .. vowel .. "’?্]?)", function(a, b) return a .. (b == "" and "o" or b) end)

    for word in mw.ustring.gmatch(text, "[ঁ-৽o’]+") do
        local orig_word = word
        word = rev_string(word)
        word = gsub(word, "^o(়?" .. c .. ")(ঁ?" .. v .. ")", "%1%2")
        while match(word, syncope_pattern) do word = gsub(word, syncope_pattern, "%1%2") end
        text = gsub(text, orig_word, rev_string(word))
    end

    if mode == "IPA" then
        text = gsub(text, ".[়’]?", conv2)
        text = gsub(text, ".", conv2)
    end

    text = gsub(text, ".[়’]?", conv)
    text = gsub(text, ".", conv)

    local consonants_Latn_no_h = "[b-df-gj-np-tv-z]"

    -- Cw
    text = gsub(text, "mw", "mb") -- special case
    text = gsub(text, "^(" .. consonants_Latn_no_h .. "h?)w", "%1") -- initial
    text = gsub(text, "hw", "hb")
    text = gsub(text, "(" .. consonants_Latn_no_h .. ")w", "%1%1") -- medial

    -- zñ
    text = gsub(text, "^zñ", "gy") -- initial
    text = gsub(text, "zñ", "gg") -- medial

    -- Cy
    text = gsub(text, "^khy", "kh")
    text = gsub(text, "([aéeióoüu])(" .. consonants_Latn_no_h .. ")y", "%1i%2%2")

    -- final "b" has inherent vowel
    text = gsub(text, "b$", "bo")
    text = gsub(text, "b ", "bo ")

    -- final r conjuncts
    text = gsub(text, "r([kszt])o$", "r%1")
    text = gsub(text, "r([kszt])o ", "r%1 ")
    text = gsub(text, "rkho$", "rkh")
    text = gsub(text, "rkho ", "rkh ")

    if match(text, "[ঁ-৽]") and mode ~= "debug" then
        return nil
    else
        return mw.ustring.toNFC(text)
    end
end

return export
