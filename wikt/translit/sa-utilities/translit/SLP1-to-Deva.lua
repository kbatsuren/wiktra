local export = {}

local consonant_list = "kKgGNcCjJYwWqQRtTdDnpPbBmyrlLvSzsh"
local consonant = "[" .. consonant_list .. "]"
local vowel_list = "aAiIuUfFxXeEoO"
local vowel = "[" .. vowel_list .. "]"

local U = mw.ustring.char

local virAma = U(0x94D)

local diacritics = {["a"] = "", ["A"] = "ा", ["i"] = "ि", ["I"] = "ी", ["u"] = "ु", ["U"] = "ू", ["f"] = "ृ", ["F"] = "ॄ", ["x"] = "ॢ", ["X"] = "ॣ", ["e"] = "े", ["E"] = "ै", ["o"] = "ो", ["O"] = "ौ"}

local tt = {
    -- consonants
    ["k"] = "क",
    ["K"] = "ख",
    ["g"] = "ग",
    ["G"] = "घ",
    ["N"] = "ङ",
    ["c"] = "च",
    ["C"] = "छ",
    ["j"] = "ज",
    ["J"] = "झ",
    ["Y"] = "ञ",
    ["w"] = "ट",
    ["W"] = "ठ",
    ["q"] = "ड",
    ["Q"] = "ढ",
    ["R"] = "ण",
    ["t"] = "त",
    ["T"] = "थ",
    ["d"] = "द",
    ["D"] = "ध",
    ["n"] = "न",
    ["p"] = "प",
    ["P"] = "फ",
    ["b"] = "ब",
    ["B"] = "भ",
    ["m"] = "म",
    ["y"] = "य",
    ["r"] = "र",
    ["l"] = "ल",
    ["v"] = "व",
    ["L"] = "ळ",
    ["S"] = "श",
    ["z"] = "ष",
    ["s"] = "स",
    ["h"] = "ह",
    -- vowels
    ["a"] = "अ",
    ["A"] = "आ",
    ["i"] = "इ",
    ["I"] = "ई",
    ["u"] = "उ",
    ["U"] = "ऊ",
    ["f"] = "ऋ",
    ["F"] = "ॠ",
    ["x"] = "ऌ",
    ["X"] = "ॡ",
    ["e"] = "ए",
    ["E"] = "ऐ",
    ["o"] = "ओ",
    ["O"] = "औ",
    -- chandrabindu
    ["~"] = "ँ",
    -- anusvara
    ["M"] = "ं",
    -- visarga
    ["H"] = "ः",
    -- avagraha
    ["'"] = "ऽ",
    -- numerals
    ["0"] = "०",
    ["1"] = "१",
    ["2"] = "२",
    ["3"] = "३",
    ["4"] = "४",
    ["5"] = "५",
    ["6"] = "६",
    ["7"] = "७",
    ["8"] = "८",
    ["9"] = "९",
    -- Vedic extensions
    ["Z"] = "ᳵ",
    ["V"] = "ᳶ",
    ["/"] = "",
    ["\\"] = ""
}

function export.tr(text, lang, sc)
    -- capture twice so that all adjacent pairs are covered
    text = mw.ustring.gsub(text, "(" .. consonant .. ")" .. "(" .. consonant .. ")", "%1" .. virAma .. "%2")
    text = mw.ustring.gsub(text, "(" .. consonant .. ")" .. "(" .. consonant .. ")", "%1" .. virAma .. "%2")
    -- whitespace and end of string
    text = mw.ustring.gsub(text, "(" .. consonant .. ")%f[%s%z]", "%1" .. virAma)
    -- all vowel diacritics
    text = mw.ustring.gsub(text, "(" .. consonant .. ")(" .. vowel .. ")", function(c, v) return c .. diacritics[v] end)
    -- everything else
    text = mw.ustring.gsub(text, ".", tt)
    return mw.ustring.toNFC(text)
end

return export
