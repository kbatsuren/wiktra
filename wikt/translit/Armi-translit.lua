local export = {}

local tt = {
    ["𐡀"] = "ʾ", -- aleph
    ["𐡁"] = "b", -- beth
    ["𐡂"] = "g", -- gimel
    ["𐡃"] = "d", -- daleth
    ["𐡄"] = "h", -- he
    ["𐡅"] = "w", -- waw
    ["𐡆"] = "z", -- zayin
    ["𐡇"] = "ḥ", -- heth
    ["𐡈"] = "ṭ", -- teth
    ["𐡉"] = "y", -- yodh
    ["𐡊"] = "k", -- khaph
    ["𐡋"] = "l", -- lamedh
    ["𐡌"] = "m", -- mem
    ["𐡍"] = "n", -- nun
    ["𐡎"] = "s", -- samekh
    ["𐡏"] = "ʿ", -- ayin
    ["𐡐"] = "p", -- pe
    ["𐡑"] = "ṣ", -- sadhe
    ["𐡒"] = "q", -- qoph
    ["𐡓"] = "r", -- resh
    ["𐡔"] = "š", -- shin
    ["𐡕"] = "t", -- taw
    ["𐡗"] = "|", -- section sign
    ["𐡘"] = "1", -- one
    ["𐡙"] = "2", -- two
    ["𐡚"] = "3", -- three
    ["𐡛"] = "10", -- ten
    ["𐡜"] = "20", -- twenty
    ["𐡝"] = "100", -- one hundred
    ["𐡞"] = "1000", -- one thousand
    ["𐡟"] = "10000" -- ten thousand
}

function export.tr(text, lang, sc)

    if sc ~= "Armi" then return end

    -- Transliterate characters
    text = mw.ustring.gsub(text, ".", tt)

    return text
end

return export
