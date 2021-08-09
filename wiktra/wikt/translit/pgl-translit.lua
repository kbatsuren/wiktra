local export = {}

local chars = {
    [" "] = " ",
    ["·"] = ".",

    ["ᚁ"] = "b", -- beith
    ["ᚂ"] = "l", -- luis
    ["ᚃ"] = "v", -- fearn
    ["ᚄ"] = "s", -- saille
    ["ᚅ"] = "n", -- nuin

    ["ᚆ"] = "h", -- uath
    ["ᚇ"] = "d", -- dair
    ["ᚈ"] = "t", -- tinne
    ["ᚉ"] = "c", -- coll
    ["ᚊ"] = "q", -- ceirt

    ["ᚋ"] = "m", -- muin
    ["ᚌ"] = "g", -- gort
    ["ᚍ"] = "ŋ", -- ngétal
    ["ᚎ"] = "z", -- straif
    ["ᚏ"] = "r", -- ruis

    ["ᚐ"] = "a", -- ailm
    ["ᚑ"] = "o", -- onn
    ["ᚒ"] = "u", -- úr
    ["ᚓ"] = "e", -- edad
    ["ᚔ"] = "i", -- idad

    ["ᚕ"] = "k", -- Or "ea"
    ["ᚖ"] = "oi",
    ["ᚗ"] = "ui",
    ["ᚘ"] = "p", -- Or "ia"
    ["ᚙ"] = "x", -- Or "ae"
    ["ᚚ"] = "p", -- peithboc "soft B"

    ["᚛"] = "",
    ["᚜"] = ""
}

function export.tr(text, lang, sc) return (mw.ustring.gsub(text, ".", chars)) end

return export
