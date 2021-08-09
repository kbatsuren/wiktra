local export = {}
local gsub = mw.ustring.gsub
local u = mw.ustring.char
local con_cls = "([" .. u(0x11700) .. "-" .. u(0x1171A) .. "][" .. u(0x1171D) .. u(0x1171E) .. u(0x1171F) .. "]?)"

local tt = {
    -- consonants
    [u(0x11700)] = "k",
    [u(0x11701)] = "kh",
    [u(0x11702)] = "ng",
    [u(0x11703)] = "n",
    [u(0x11704)] = "t",
    [u(0x11705)] = "t",
    [u(0x11706)] = "p",
    [u(0x11707)] = "ph",
    [u(0x11708)] = "b",
    [u(0x11709)] = "m",
    [u(0x1170A)] = "y",
    [u(0x1170B)] = "ch",
    [u(0x1170C)] = "th",
    [u(0x1170D)] = "r",
    [u(0x1170E)] = "l",
    [u(0x1170F)] = "s",
    [u(0x11710)] = "ny",
    [u(0x11711)] = "h",
    [u(0x11712)] = "ʼ",
    [u(0x11713)] = "d",
    [u(0x11714)] = "dh",
    [u(0x11715)] = "g",
    [u(0x11716)] = "g",
    [u(0x11717)] = "gh",
    [u(0x11718)] = "bh",
    [u(0x11719)] = "jh",
    [u(0x1171A)] = "b",
    -- medials
    [u(0x1171D)] = "l",
    [u(0x1171E)] = "r",
    [u(0x1171F)] = "r",
    -- vowels (excluding composition)
    [u(0x11720)] = "a",
    [u(0x11721)] = "aa",
    [u(0x11722)] = "i",
    [u(0x11723)] = "ii",
    [u(0x11724)] = "u",
    [u(0x11725)] = "uu",
    [u(0x11727)] = "w",
    [u(0x11729)] = "y",
    [u(0x11726)] = "e",
    [u(0x11728)] = "o",
    [u(0x1172A)] = "m",
    [u(0x1172B)] = "",
    -- numerals
    [u(0x11730)] = "0",
    [u(0x11731)] = "1",
    [u(0x11732)] = "2",
    [u(0x11733)] = "3",
    [u(0x11734)] = "4",
    [u(0x11735)] = "5",
    [u(0x11736)] = "6",
    [u(0x11737)] = "7",
    [u(0x11738)] = "8",
    [u(0x11739)] = "9",
    [u(0x1173A)] = "[10]",
    [u(0x1173B)] = "[20]",
    -- punctuations and symbols
    [u(0x1173C)] = ",",
    [u(0x1173D)] = ".",
    [u(0x1173E)] = "@",
    [u(0x1173F)] = "wi",
    -- zero-width space (display it if it hides in a word)
    [u(0x200B)] = "‼"
}

local adjust0 = {
    -- vowels (composition)
    [u(0x11722) .. u(0x11724)] = "ue",
    [u(0x11726) .. u(0x11721)] = "oo",
    [u(0x11728) .. u(0x11726) .. u(0x11721)] = "woo",
    [u(0x11726) .. u(0x11727)] = "ee",
    [u(0x11729) .. u(0x11724)] = "aay"
}

function export.tr(text, lang, sc, debug_mode)

    if type(text) == "table" then -- called directly from a template
        text = text.args[1]
    end

    text = gsub(text, u(0x11708) .. "(" .. u(0x1172B) .. ")", "w%1") -- final -b becomes -w
    text = gsub(text, con_cls .. "([" .. u(0x11700) .. "-" .. u(0x11719) .. "w]" .. ")" .. u(0x1172B), "%1a%2")
    text = gsub(text, con_cls .. "([" .. u(0x11727) .. u(0x11729) .. u(0x1172A) .. "])", "%1a%2")

    for k, v in pairs(adjust0) do text = gsub(text, con_cls .. k, "%1" .. v) end

    text = gsub(text, ".", tt)

    return text

end

return export
