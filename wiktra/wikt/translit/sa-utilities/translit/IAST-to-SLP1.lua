local export = {}

local U = mw.ustring.char

local acute = U(0x301) -- combining acute
local grave = U(0x300) -- combining grave

local composed_accents = {["á"] = "a/", ["à"] = "a\\", ["í"] = "i/", ["ì"] = "i\\", ["ú"] = "u/", ["ù"] = "u\\", ["é"] = "e/", ["è"] = "e\\", ["ó"] = "o/", ["ò"] = "o\\", [acute] = "/", [grave] = "\\"}

local normalize_accents = {["á"] = "/", ["à"] = "\\"}

local function change_accent(text)
    -- normalize accent placement
    text = mw.ustring.gsub(text, "([áà])([iu])", function(a, iu) return "a" .. iu .. normalize_accents[a] end)
    text = mw.ustring.gsub(text, ".", composed_accents)
    return text
end

local function detect_lateral_flap(text)
    -- an "ḷ" initially before a non-vowel or between two non-vowels vowel is assumed to be "x"
    text = mw.ustring.gsub(text, "^ḷ([^aāiīuūeoṛṝḷḹ])", "x%1")
    text = mw.ustring.gsub(text, "([^aāiīuūeoṛṝḷḹ])ḷ([^aāiīuūeoṛṝḷḹ])", "%1x%2")
    -- all others are assumed to be "L"
    text = mw.ustring.gsub(text, "ḷ", "L")
    return text
end

local tt = {
    [1] = {
        -- consonants
        ["kh"] = "K",
        ["gh"] = "G",
        ["ch"] = "C",
        ["jh"] = "J",
        ["ṭh"] = "W",
        ["ḍh"] = "Q",
        ["th"] = "T",
        ["dh"] = "D",
        ["ph"] = "P",
        ["bh"] = "B"
    },
    [2] = {
        -- vowels
        ["ai"] = "E",
        ["au"] = "O"
    },
    [3] = {
        -- chandrabindu
        ["m̐"] = "~"
    },
    [4] = {

        -- consonants
        ["ṅ"] = "N",
        ["ñ"] = "Y",
        ["ṭ"] = "w",
        ["ḍ"] = "q",
        ["ṇ"] = "R",
        ["ś"] = "S",
        ["ṣ"] = "z", -- ["ḷ"] = "L"

        -- vowels
        ["ā"] = "A",
        ["ī"] = "I",
        ["ū"] = "U",
        ["ṛ"] = "f",
        ["ṝ"] = "F",
        ["ḹ"] = "X", -- ["ḷ"] = "x",

        -- avagraha
        ["’"] = "",

        -- other
        ["ṃ"] = "M",
        ["ḥ"] = "H",
        ["x"] = "Z",
        ["f"] = "V"
    }
}

function export.tr(text, lang, sc)
    text = mw.ustring.toNFC(text)
    text = change_accent(text)
    text = detect_lateral_flap(text)
    text = mw.ustring.gsub(text, "[kgcjṭḍtdpb]h", tt[1])
    text = mw.ustring.gsub(text, "a[iu]", tt[2])
    text = mw.ustring.gsub(text, "m̐", tt[3])
    text = mw.ustring.gsub(text, ".", tt[4])
    return text
end

return export
