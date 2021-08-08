local export = {}

local tt = {
    ["𐫀"] = "ʾ", -- aleph
    ["𐫁"] = "b", -- beth
    ["𐫂"] = "β", -- bheth
    ["𐫃"] = "g", -- gimel
    ["𐫄"] = "ɣ", -- ghimel
    ["𐫅"] = "d", -- daleth
    ["𐫆"] = "ẖ", -- he
    ["𐫇"] = "w", -- waw
    ["𐫈"] = "ẉ̇", -- ud (conjunction)
    ["𐫉"] = "z", -- zayin
    ["𐫊"] = "ž", -- zhayin
    ["𐫋"] = "j", -- jayin
    ["𐫌"] = "ǰ", -- jhayin
    ["𐫍"] = "h", -- heth
    ["𐫎"] = "ṯ", -- teth
    ["𐫏"] = "y", -- yodh
    ["𐫐"] = "k", -- kaph
    ["𐫑"] = "k̇", -- xaph
    ["𐫒"] = "k̈", -- khaph
    ["𐫓"] = "l", -- lamedh
    ["𐫔"] = "δ", -- dhamedh
    ["𐫕"] = "θ", -- thamedh
    ["𐫖"] = "m", -- mem
    ["𐫗"] = "n", -- nun
    ["𐫘"] = "s", -- samekh
    ["𐫙"] = "ʿ", -- ayin
    ["𐫚"] = "ʿ̈ ", -- aayin
    ["𐫛"] = "p", -- pe
    ["𐫜"] = "f", -- fe
    ["𐫝"] = "c", -- sadhe
    ["𐫞"] = "q", -- qoph
    ["𐫟"] = "x", -- xoph
    ["𐫠"] = "q̈", -- qhoph
    ["𐫡"] = "r", -- resh
    ["𐫢"] = "š", -- shin
    ["𐫣"] = "ś", -- sshin
    ["𐫤"] = "t", -- taw
    ["◌𐫥"] = "̃", -- abbreviation mark above
    ["◌𐫦"] = "̃", -- abbreviation mark below
    ["𐫫"] = "1", -- one
    ["𐫬"] = "5", -- five
    ["𐫭"] = "10", -- ten
    ["𐫮"] = "20", -- twenty
    ["𐫯"] = "100" -- one hundred
}

function export.tr(text, lang, sc)
    -- If the script is not Mani, do not transliterate
    if sc ~= "Mani" then return end

    -- Transliterate characters
    text = mw.ustring.gsub(text, ".", tt)

    return text
end

return export
