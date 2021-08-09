local export = {}
local gsub = mw.ustring.gsub

local tt = {
    -- consonants
    ["ᦀ"] = "˙ʼ",
    ["ᦁ"] = "ʼ",
    ["ᦂ"] = "k\204\135",
    ["ᦃ"] = "x\204\135",
    ["ᦄ"] = "n\204\135g",
    ["ᦅ"] = "k",
    ["ᦆ"] = "x",
    ["ᦇ"] = "ng",
    ["ᦈ"] = "t\204\135s",
    ["ᦉ"] = "s\204\135",
    ["ᦊ"] = "y\204\135",
    ["ᦋ"] = "ts",
    ["ᦌ"] = "s",
    ["ᦍ"] = "y",
    ["ᦎ"] = "t\204\135",
    ["ᦏ"] = "t\204\135h",
    ["ᦐ"] = "n\204\135",
    ["ᦑ"] = "t",
    ["ᦒ"] = "th",
    ["ᦓ"] = "n",
    ["ᦔ"] = "p\204\135",
    ["ᦕ"] = "p\204\135h",
    ["ᦖ"] = "m\204\135",
    ["ᦗ"] = "p",
    ["ᦘ"] = "ph",
    ["ᦙ"] = "m",
    ["ᦚ"] = "f\204\135",
    ["ᦛ"] = "v\204\135",
    ["ᦜ"] = "l\204\135",
    ["ᦝ"] = "f",
    ["ᦞ"] = "v",
    ["ᦟ"] = "l",
    ["ᦠ"] = "h\204\135",
    ["ᦡ"] = "d\204\135",
    ["ᦢ"] = "b\204\135",
    ["ᦣ"] = "h",
    ["ᦤ"] = "d",
    ["ᦥ"] = "b",
    ["ᦦ"] = "k\204\135w",
    ["ᦧ"] = "x\204\135w",
    ["ᦨ"] = "kw",
    ["ᦩ"] = "xw",
    ["ᦪ"] = "s\204\135w",
    ["ᦫ"] = "sw",
    -- vowels and finals (visual ordering by Unicode 8)
    ["ᦰ"] = "!",
    ["ᦱ"] = "aa",
    ["ᦲ"] = "ii",
    ["ᦳ"] = "u",
    ["ᦴ"] = "uu",
    ["ᦸ"] = "oa",
    ["ᦹ"] = "ue",
    ["ᦵ"] = "e",
    ["ᦶ"] = "ae",
    ["ᦷ"] = "o",
    ["ᦺ"] = "ay", -- this line to be swapped
    ["ᦻ"] = "aay",
    ["ᦼ"] = "uy",
    ["ᦽ"] = "oy",
    ["ᦾ"] = "oay",
    ["ᦿ"] = "uey",
    ["ᧀ"] = "iiy",
    ["ᧁ"] = "w",
    ["ᧂ"] = "ng",
    ["ᧃ"] = "n",
    ["ᧄ"] = "m",
    ["ᧅ"] = "k",
    ["ᧆ"] = "d",
    ["ᧇ"] = "b",
    -- tones
    ["ᧈ"] = "<sup>1</sup>",
    ["ᧉ"] = "<sup>2</sup>",
    -- numerals
    ["᧐"] = "0",
    ["᧑"] = "1",
    ["᧒"] = "2",
    ["᧓"] = "3",
    ["᧔"] = "4",
    ["᧕"] = "5",
    ["᧖"] = "6",
    ["᧗"] = "7",
    ["᧘"] = "8",
    ["᧙"] = "9",
    ["᧚"] = "1",
    -- ligatures ᧞ ᧟ sorted after ᦶᦜ
    ["᧞"] = "l\204\135ae",
    ["᧟"] = "l\204\135aew"
}

function export.tr(text, lang, sc, debug_mode)

    if type(text) == "table" then -- called directly from a template
        text = text.args[1]
    end

    text = gsub(text, "([ᦵᦶᦷᦺ])([ᦀ-ᦫ])", "%2%1") -- swapped
    text = gsub(text, "([ᦀ-ᦫ])([ᧁ-ᧇ])", "%1a%2")

    text = gsub(text, ".", tt)

    text = gsub(text, "aa!", "a")
    text = gsub(text, "ii!", "i")
    text = gsub(text, "uu!", "u")
    text = gsub(text, "eii", "oe")

    return text

end

return export
