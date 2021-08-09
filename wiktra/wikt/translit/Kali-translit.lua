local export = {}
local gsub = mw.ustring.gsub
local u = mw.ustring.char

local tt1 = {
    -- consonants
    ["ꤊ"] = "k",
    ["ꤋ"] = "hk",
    ["ꤌ"] = "g",
    ["ꤍ"] = "ng",
    ["ꤎ"] = "s",
    ["ꤏ"] = "hs",
    ["ꤐ"] = "z",
    ["ꤑ"] = "ny",
    ["ꤒ"] = "t",
    ["ꤓ"] = "ht",
    ["ꤔ"] = "n",
    ["ꤕ"] = "p",
    ["ꤖ"] = "hp",
    ["ꤗ"] = "m",
    ["ꤘ"] = "d",
    ["ꤙ"] = "b",
    ["ꤚ"] = "r",
    ["ꤛ"] = "y",
    ["ꤜ"] = "l",
    ["ꤝ"] = "w",
    ["ꤞ"] = "th",
    ["ꤟ"] = "h",
    ["ꤠ"] = "v",
    ["ꤡ"] = "c",
    -- vowels
    ["ꤢ"] = "a",
    ["ꤣ"] = "oe",
    ["ꤤ"] = "i",
    ["ꤥ"] = "o",
    -- tones
    ["꤫"] = u(0x0301),
    ["꤬"] = u(0x0300),
    ["꤭"] = u(0x0304),
    -- marks
    ["꤮"] = "-",
    ["꤯"] = ".",
    -- numerals
    ["꤀"] = "0",
    ["꤁"] = "1",
    ["꤂"] = "2",
    ["꤃"] = "3",
    ["꤄"] = "4",
    ["꤅"] = "5",
    ["꤆"] = "6",
    ["꤇"] = "7",
    ["꤈"] = "8",
    ["꤉"] = "9",
    -- zero-width space (display it if it hides in a word)
    [u(0x200B)] = "‼"
}

local tt2 = {
    -- vowels
    ["ꤢꤦ"] = "ue",
    ["ꤢꤧ"] = "ae",
    ["ꤢꤨ"] = "u",
    ["ꤢꤩ"] = "e",
    ["ꤢꤪ"] = "oa",
    ["ꤣꤦ"] = "oeue",
    ["ꤣꤧ"] = "ueae",
    ["ꤣꤨ"] = "oeu",
    ["ꤣꤩ"] = "oee",
    ["ꤣꤪ"] = "oeoa"
}

function export.tr(text, lang, sc, debug_mode)

    if type(text) == "table" then -- called directly from a template
        text = text.args[1]
    end

    text = gsub(text, "([ꤢ-ꤥ][ꤦ-꤭]*)([ꤢ-ꤥ])", "%1’%2") -- add apostrophe between adjacent two vowels
    text = gsub(text, "([ꤊ-ꤡ])ꤟ([ꤢ-ꤥ][ꤦ-ꤪ]?)", "%1%2̤") -- change h between initial and vowel into subcolon

    text = gsub(text, "ꤟꤌꤣ", "u" .. u(0x0324) .. "eoe") -- use u() to break Unicode normalization
    text = gsub(text, "ꤛꤣ", "ueoe")
    text = gsub(text, "[ꤢꤣ][ꤦ-ꤪ]", tt2)
    text = gsub(text, ".", tt1)

    text = gsub(text, "([aeiou])([aeiou]*)̤", "%1̤%2") -- move subcolon to first aeiou
    text = gsub(text, "([aeiou]̤?)([aeiou]*)([" .. u(0x0301) .. u(0x0300) .. u(0x0304) .. "])", "%1%3%2") -- add tone mark on first aeiou

    return text

end

return export
