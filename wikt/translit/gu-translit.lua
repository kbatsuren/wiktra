local export = {}

local gsub = mw.ustring.gsub
local match = mw.ustring.match

local conv = {
    -- consonants
    ["ક"] = "k",
    ["ખ"] = "kh",
    ["ગ"] = "g",
    ["ઘ"] = "gh",
    ["ઙ"] = "ṅ",
    ["ચ"] = "c",
    ["છ"] = "ch",
    ["જ"] = "j",
    ["ઝ"] = "jh",
    ["ઞ"] = "ñ",
    ["ટ"] = "ṭ",
    ["ઠ"] = "ṭh",
    ["ડ"] = "ḍ",
    ["ઢ"] = "ḍh",
    ["ણ"] = "ṇ",
    ["ત"] = "t",
    ["થ"] = "th",
    ["દ"] = "d",
    ["ધ"] = "dh",
    ["ન"] = "n",
    ["પ"] = "p",
    ["ફ"] = "ph",
    ["બ"] = "b",
    ["ભ"] = "bh",
    ["મ"] = "m",
    ["ય"] = "y",
    ["ર"] = "r",
    ["લ"] = "l",
    ["વ"] = "v",
    ["ળ"] = "ḷ",
    ["શ"] = "ś",
    ["ષ"] = "ṣ",
    ["સ"] = "s",
    ["હ"] = "h",
    ["ત઼"] = "t̰",
    ["જ઼"] = "z",
    ["ંઘ઼"] = "ng",
    ["ડ઼"] = "ṛ",
    ["ઢ઼"] = "ṛh",
    ["ન઼"] = "ṉ",
    ["ફ઼"] = "f",

    -- vowel diacritics
    ["ા"] = "ā",
    ["િ"] = "i",
    ["ી"] = "ī",
    ["ુ"] = "u",
    ["ૂ"] = "ū",
    ["ૃ"] = "ṛ",
    ["ૄ"] = "ṝ",
    ["ે"] = "e",
    ["ૈ"] = "ai",
    ["ો"] = "o",
    ["ૌ"] = "au",
    ["ૅ"] = "ɛ",
    ["ૉ"] = "ɔ",

    -- vowel mātras
    ["અ"] = "a",
    ["આ"] = "ā",
    ["ઇ"] = "i",
    ["ઈ"] = "ī",
    ["ઉ"] = "u",
    ["ઊ"] = "ū",
    ["ઋ"] = "ru",
    ["ૠ"] = "ṝ",
    ["એ"] = "e",
    ["ઐ"] = "ai",
    ["ઓ"] = "o",
    ["ઔ"] = "au",
    ["ઍ"] = "ɛ",
    ["ઑ"] = "ɔ",

    -- chandrabindu    
    ["ઁ"] = "m̐", -- until a better method is found

    -- anusvara    
    ["ં"] = "ṃ", -- until a better method is found

    -- visarga
    ["ઃ"] = "ḥ",

    -- virama
    ["્"] = "",

    -- avagraha
    ["ઽ"] = "’",

    -- numerals
    ["૦"] = "0",
    ["૧"] = "1",
    ["૨"] = "2",
    ["૩"] = "3",
    ["૪"] = "4",
    ["૫"] = "5",
    ["૬"] = "6",
    ["૭"] = "7",
    ["૮"] = "8",
    ["૯"] = "9",

    -- punctuation        
    ["।"] = ".", -- danda
    ["+"] = "", -- compound separator

    -- om
    ["ૐ"] = "OM"
}

local nasal_assim = {["[kg]h?"] = "ṅ", ["[cj]h?"] = "ñ", ["[ṭḍṛ]h?"] = "ṇ", ["[td]h?"] = "n", ["[pb]h?"] = "m", ["n"] = "n", ["m"] = "m"}

function export.tr(text, lang, sc)
    local c = "([કખગઘઙચછજઝઞટઠડઢતથદધપફબભશષસયરલવહણનમ]઼?)"
    local no_drop = "ય"
    local final_no_drop = "યરલવહનમ"
    local v = "([a્ાિીુૂેૈોૌૃૄૅૉ]ઁ?)"
    local virama = "(્)"
    local n = "(ં?)"
    local nukta = "([તજઘડઢનફ]઼)"

    local can_drop = gsub(c, "[" .. no_drop .. "]", "")
    local final_can_drop = gsub(c, "[" .. final_no_drop .. "]", "")
    local no_virama = gsub(v, virama, "")

    text = text .. " "

    -- text = gsub(text,"(%S)"..c.."%2","%1ː%2")

    text = gsub(text, c, "%1a")
    text = gsub(text, "a" .. v, "%1")
    text = gsub(text, no_virama .. n .. can_drop .. "a ", "%1%2%3 ") -- ending
    text = gsub(text, virama .. n .. final_can_drop .. "a ", "%1%2%3 ") -- ending
    local pattern = no_virama .. n .. can_drop .. "a" .. c .. no_virama
    while match(text, "(.*)" .. pattern) do text = gsub(text, "(.*)" .. pattern, "%1%2%3%4%5%6") end

    text = gsub(text, nukta, conv)
    text = gsub(text, ".", conv)

    for key, val in pairs(nasal_assim) do text = gsub(text, "([aeiou])ṃ(" .. key .. ")", "%1" .. val .. "%2") end

    text = gsub(text, "([aiueēoāīū])ṃ", "%1̃")

    text = gsub(text, "ː(.)", "%1%1")

    text = gsub(text, " $", "")

    text = gsub(text, "ā̃tar", "āntar")

    text = gsub(text, "OM", "oṃ")
    text = gsub(text, "a*%*a*", "a")

    return mw.ustring.toNFC(text)
end

return export
