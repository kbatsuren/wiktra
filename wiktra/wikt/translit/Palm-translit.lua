local export = {}

local tt = {
    ["𐡠"] = "ʾ", -- aleph
    ["𐡡"] = "b", -- beth
    ["𐡢"] = "g", -- gimel
    ["𐡣"] = "d", -- daleth
    ["𐡤"] = "h", -- he
    ["𐡥"] = "w", -- waw
    ["𐡦"] = "z", -- zayin
    ["𐡧"] = "ḥ", -- heth
    ["𐡨"] = "ṭ", -- teth
    ["𐡩"] = "y", -- yodh
    ["𐡪"] = "k", -- kaph
    ["𐡫"] = "l", -- lamedh
    ["𐡬"] = "m", -- mem
    ["𐡭"] = "n", -- final nun
    ["𐡮"] = "n", -- nun
    ["𐡯"] = "s", -- samekh
    ["𐡰"] = "ʿ", -- ayin
    ["𐡱"] = "p", -- pe
    ["𐡲"] = "ṣ", -- sadhe
    ["𐡳"] = "q", -- qoph
    ["𐡴"] = "r", -- resh
    ["𐡵"] = "š", -- shin
    ["𐡶"] = "t", -- taw
    ["𐡷"] = "☙", -- left-pointing fleuron
    ["𐡸"] = "❧", -- right-pointing fleuron
    ["𐡹"] = "1", -- one
    ["𐡺"] = "2", -- two
    ["𐡻"] = "3", -- three
    ["𐡼"] = "4", -- four
    ["𐡽"] = "5", -- five
    ["𐡾"] = "10", -- ten
    ["𐡿"] = "20" -- twenty
}

function export.tr(text, lang, sc)

    if sc ~= "Palm" then return end

    -- Transliterate characters
    text = mw.ustring.gsub(text, ".", tt)

    return text
end

return export
