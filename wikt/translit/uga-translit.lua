local export = {}

local tt = {
    ["𐎀"] = "ả",
    ["𐎁"] = "b",
    ["𐎂"] = "g",
    ["𐎃"] = "ḫ",
    ["𐎄"] = "d",
    ["𐎅"] = "h",
    ["𐎆"] = "w",
    ["𐎇"] = "z",
    ["𐎈"] = "ḥ",
    ["𐎉"] = "ṭ",
    ["𐎊"] = "y",
    ["𐎋"] = "k",
    ["𐎌"] = "š",
    ["𐎍"] = "l",
    ["𐎎"] = "m",
    ["𐎏"] = "ḏ",
    ["𐎐"] = "n",
    ["𐎑"] = "ẓ",
    ["𐎒"] = "s",
    ["𐎓"] = "ʿ",
    ["𐎔"] = "p",
    ["𐎕"] = "ṣ",
    ["𐎖"] = "q",
    ["𐎗"] = "r",
    ["𐎘"] = "ṯ",
    ["𐎙"] = "ġ",
    ["𐎚"] = "t",
    ["𐎛"] = "ỉ",
    ["𐎜"] = "ủ",
    ["𐎝"] = "s̀",
    ["𐎟"] = " · " -- word divider
}

local reverse = {
    ["ả"] = "𐎀",
    ["b"] = "𐎁",
    ["g"] = "𐎂",
    ["ḫ"] = "𐎃",
    ["d"] = "𐎄",
    ["h"] = "𐎅",
    ["w"] = "𐎆",
    ["z"] = "𐎇",
    ["ḥ"] = "𐎈",
    ["ṭ"] = "𐎉",
    ["y"] = "𐎊",
    ["k"] = "𐎋",
    ["š"] = "𐎌",
    ["l"] = "𐎍",
    ["m"] = "𐎎",
    ["ḏ"] = "𐎏",
    ["n"] = "𐎐",
    ["ẓ"] = "𐎑",
    ["s"] = "𐎒",
    ["ʿ"] = "𐎓",
    ["p"] = "𐎔",
    ["ṣ"] = "𐎕",
    ["q"] = "𐎖",
    ["r"] = "𐎗",
    ["ṯ"] = "𐎘",
    ["ġ"] = "𐎙",
    ["t"] = "𐎚",
    ["ỉ"] = "𐎛",
    ["ủ"] = "𐎜",
    ["ś"] = "𐎝",
    ["·"] = "𐎟" -- word divider
}

local get_glottal = {["a"] = "ả", ["i"] = "ỉ", ["u"] = "ủ"}

local aliases = {["a"] = "ả", ["i"] = "ỉ", ["u"] = "ủ", ["θ"] = "ṯ", ["ð"] = "ḏ", ["x"] = "ḫ", ["ẖ"] = "ḫ", ["ɣ"] = "ġ", ["ḡ"] = "ġ", ["ħ"] = "ḥ", ["ḳ"] = "q", ["ḓ"] = "ẓ"}

function export.tr(text, lang, sc)
    text = mw.ustring.gsub(text, ".", tt)
    return text
end

function export.reverse(text)
    if type(text) == "table" then text = text.args[1] end
    text = mw.ustring.gsub(text, " *[.·] *", "·")
    text = mw.ustring.gsub(text, "[ʿˁʕ‘]", "ʿ")
    text = mw.ustring.gsub(text, "[ʾˀʔ’]", "ʾ")
    text = mw.ustring.gsub(text, "ʾ([aiu])", get_glottal)
    text = mw.ustring.gsub(text, "s[̀2₂]", "ś")
    text = mw.ustring.gsub(text, "s<sub>2</sub>", "ś")
    text = mw.ustring.gsub(text, ".", reverse)
    return text
end

return export
