local export = {}
local gsub = mw.ustring.gsub
local u = mw.ustring.char
-- pattern ([ᥐ-ᥢ])([ᥣ-ᥬ]?)([ᥐᥒᥖᥙᥛᥝᥢᥭ]?)([ᥰ-ᥴ{dia-tones}]?)

local tt = {
    -- consonants
    ["ᥐ"] = "k",
    ["ᥑ"] = "x",
    ["ᥒ"] = "ng",
    ["ᥓ"] = "ts",
    ["ᥔ"] = "s",
    ["ᥕ"] = "y",
    ["ᥖ"] = "t",
    ["ᥗ"] = "th",
    ["ᥘ"] = "l",
    ["ᥙ"] = "p",
    ["ᥚ"] = "ph",
    ["ᥛ"] = "m",
    ["ᥜ"] = "f",
    ["ᥝ"] = "w",
    ["ᥞ"] = "h",
    ["ᥟ"] = "ʼ",
    ["ᥠ"] = "kh",
    ["ᥡ"] = "tsh",
    ["ᥢ"] = "n",
    -- vowels
    ["ᥣ"] = "aa",
    ["ᥤ"] = "i",
    ["ᥥ"] = "e",
    ["ᥦ"] = "ae",
    ["ᥧ"] = "u",
    ["ᥨ"] = "o",
    ["ᥩ"] = "oa",
    ["ᥪ"] = "ue",
    ["ᥫ"] = "oe",
    ["ᥬ"] = "aue",
    ["ᥭ"] = "y"
}

local tone_table = {
    -- different ordering from Unicode: http://www.seasite.niu.edu/tai/TaiDehong/index.htm
    -- also supports old orthography
    ["ᥰ"] = u(0x0308),
    [u(0x0308)] = u(0x0308),
    [u(0x00A8)] = u(0x0308), -- 2 ä
    ["ᥱ"] = u(0x030C),
    [u(0x030C)] = u(0x030C),
    [u(0x02C7)] = u(0x030C), -- 3 ǎ
    ["ᥲ"] = u(0x0300),
    [u(0x0300)] = u(0x0300),
    [u(0x0060)] = u(0x0300),
    [u(0x02CB)] = u(0x0300), -- 4 à
    ["ᥳ"] = u(0x0307),
    [u(0x0307)] = u(0x0307),
    [u(0x02D9)] = u(0x0307), -- 5 ȧ
    ["ᥴ"] = u(0x0301),
    [u(0x0301)] = u(0x0301),
    [u(0x00B4)] = u(0x0301),
    [u(0x02CA)] = u(0x0301), -- 1 á
    [""] = "" -- 6 a
}

local tone_key = "([ᥰ-ᥴ" .. u(0x0308) .. u(0x00A8) .. u(0x030C) .. u(0x02C7) .. u(0x0300) .. u(0x0060) .. u(0x02CB) .. u(0x0307) .. u(0x02D9) .. u(0x0301) .. u(0x00B4) .. u(0x02CA) .. "]?)"

function export.tr(text, lang, sc, debug_mode)

    if type(text) == "table" then -- called directly from a template
        text = text.args[1]
    end

    text = gsub(text, "([ᥐ-ᥢ])([ᥐᥒᥖᥙᥛᥝᥢᥭ])", "%1a%2")
    text = gsub(text, ".", tt)

    -- adds tone diacritic
    for old in mw.text.gsplit(text, " ") do
        new = gsub(old, "([aeiou])([a-z]*)" .. tone_key, function(v, x, t) return v .. tone_table[t] .. x end)
        text = gsub(text, old, new, 1)
    end

    return text

end

return export
