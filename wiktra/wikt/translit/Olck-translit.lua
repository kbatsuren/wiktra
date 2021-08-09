local export = {}

local conv = {
    ["ᱚ"] = "ô",
    ["ᱛ"] = "t",
    ["ᱜ"] = "g",
    ["ᱝ"] = "ṅ",
    ["ᱞ"] = "l",
    ["ᱟ"] = "a",
    ["ᱠ"] = "k",
    ["ᱡ"] = "j",
    ["ᱢ"] = "m",
    ["ᱣ"] = "v",
    ["ᱤ"] = "i",
    ["ᱥ"] = "s",
    ["ᱦ"] = "h",
    ["ᱧ"] = "ñ",
    ["ᱨ"] = "r",
    ["ᱩ"] = "u",
    ["ᱪ"] = "c",
    ["ᱫ"] = "d",
    ["ᱬ"] = "ṇ",
    ["ᱭ"] = "y",
    ["ᱮ"] = "e",
    ["ᱯ"] = "p",
    ["ᱰ"] = "ḍ",
    ["ᱱ"] = "n",
    ["ᱲ"] = "ṛ",
    ["ᱳ"] = "o",
    ["ᱴ"] = "ṭ",
    ["ᱵ"] = "b",
    ["ᱶ"] = "w̃",
    ["ᱷ"] = "h", -- aspiration

    -- numerals
    ["᱐"] = "0",
    ["᱑"] = "1",
    ["᱒"] = "2",
    ["᱓"] = "3",
    ["᱔"] = "4",
    ["᱕"] = "5",
    ["᱖"] = "6",
    ["᱗"] = "7",
    ["᱘"] = "8",
    ["᱙"] = "9",

    -- punctuation        
    ["᱿"] = ".",
    ["᱾"] = ".",

    -- special chars
    ["ᱸ"] = "̃", -- mu tudag: nasalization
    ["ᱺ"] = "ᱹ̃", -- mu gahla tudag: nasalization
    ["ᱻ"] = "ː" -- rela: gemination
}

local gahla_tudag = {["ô"] = "ŏ", ["a"] = "ă", ["e"] = "ĕ"}

local ahad = {["k’"] = "g", ["c’"] = "j", ["t’"] = "d", ["p’"] = "b", ["h’"] = "h"}

local pharka = {["g"] = "k’", ["j"] = "c’", ["d"] = "t’", ["b"] = "p’", ["h"] = "h’"}

local punctuation = "([ ᱾᱿,!?\"'])"

function export.tr(text, lang, sc)
    text = mw.ustring.gsub(text, ".", function(c) return conv[c] end)

    -- word-final glottalization
    text = mw.ustring.gsub(text, "[gjdb]$", pharka)
    text = mw.ustring.gsub(text, "([gjdb])" .. punctuation, function(c, d) return pharka[c] .. d end)

    -- gahla tudag
    text = mw.ustring.gsub(text, "(.)ᱹ", function(c) return gahla_tudag[c] end)

    -- ahad
    text = mw.ustring.gsub(text, "(.’)ᱽ", function(c) return ahad[c] end)

    -- parkha
    text = mw.ustring.gsub(text, "(.)ᱼ", function(c) return pharka[c] end)

    text = mw.ustring.gsub(text, "h’", "ʔ")

    return text
end

return export
