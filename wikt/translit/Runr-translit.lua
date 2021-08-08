local export = {}

local letters = {}

local export = {}

local letters = {}

-- Elder futhark
letters["gmq-pro"] = {
    ["ᚠ"] = "f",
    ["ᚢ"] = "u",
    ["ᚦ"] = "þ",
    ["ᚨ"] = "a",
    ["ᚼ"] = "A", -- transitional period
    ["ᚱ"] = "r",
    ["ᚲ"] = "k",
    ["ᚳ"] = "k",
    ["ᚴ"] = "k", -- transitional period
    ["ᚷ"] = "g",
    ["ᚹ"] = "w",
    ["ᚺ"] = "h",
    ["ᚻ"] = "h",
    ["ᚾ"] = "n",
    ["ᛁ"] = "i",
    ["ᛃ"] = "j",
    ["ᛇ"] = "ï",
    ["ᛈ"] = "p",
    ["ᛉ"] = "z",
    ["ᛦ"] = "z", -- transitional period
    ["ᛊ"] = "s",
    ["ᛋ"] = "s",
    ["ᛏ"] = "t",
    ["ᛒ"] = "b",
    ["ᛖ"] = "e",
    ["ᛗ"] = "m",
    ["ᛚ"] = "l",
    ["ᛜ"] = "ŋ",
    ["ᛝ"] = "ŋ",
    ["ᛟ"] = "o",
    ["ᛞ"] = "d"
}

-- Anglo-Saxon futhorc
letters["ang"] = {["ᚠ"] = "f", ["ᚢ"] = "u", ["ᚦ"] = "þ", ["ᚩ"] = "ó", ["ᚱ"] = "r", ["ᚳ"] = "c", ["ᚷ"] = "ȝ", ["ᚸ"] = "g", ["ᚹ"] = "w", ["ᚺ"] = "h", ["ᚻ"] = "h", ["ᚾ"] = "n", ["ᛁ"] = "i", ["ᛄ"] = "j", ["ᛇ"] = "eo", ["ᛈ"] = "p", ["ᛉ"] = "x", ["ᛋ"] = "s", ["ᛏ"] = "t", ["ᛒ"] = "b", ["ᛖ"] = "e", ["ᛗ"] = "m", ["ᛚ"] = "l", ["ᛜ"] = "ŋ", ["ᛝ"] = "ŋ", ["ᛟ"] = "œ", ["ᛞ"] = "d", ["ᚪ"] = "a", ["ᚫ"] = "æ", ["ᚣ"] = "y", ["ᛡ"] = "io", ["ᛠ"] = "ea"}

-- Younger futhark
letters["non"] = {["ᚠ"] = "f", ["ᚢ"] = "u", ["ᚦ"] = "þ", ["ᚬ"] = "ą", ["ᚱ"] = "r", ["ᚴ"] = "k", ["ᚼ"] = "h", ["ᚽ"] = "h", ["ᚾ"] = "n", ["ᚿ"] = "n", ["ᛁ"] = "i", ["ᛅ"] = "a", ["ᛆ"] = "a", ["ᛋ"] = "s", ["ᛌ"] = "s", ["ᛏ"] = "t", ["ᛐ"] = "t", ["ᛒ"] = "b", ["ᛓ"] = "b", ["ᛘ"] = "m", ["ᛙ"] = "m", ["ᛚ"] = "l", ["ᛦ"] = "ʀ", ["ᛧ"] = "ʀ", ["ᛂ"] = "e", ["ᚮ"] = "o"}

function export.tr(text, lang, sc)
    if letters[lang] then return (mw.ustring.gsub(text, ".", letters[lang])) end

    return nil
end

return export
