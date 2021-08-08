local export = {}

local tt = {
    ["𐾰"] = "ʾ", -- aleph
    ["𐾱"] = "ʾ", -- small aleph
    ["𐾲"] = "β", -- beth
    ["𐾳"] = "ɣ", -- gimel
    ["𐾴"] = "d", -- daleth
    ["𐾵"] = "h", -- he
    ["𐾶"] = "w", -- waw
    ["𐾷"] = "w", -- curled waw
    ["𐾸"] = "z", -- zayin
    ["𐾹"] = "x", -- heth
    ["𐾺"] = "y", -- yodh
    ["𐾻"] = "k", -- kaph
    ["𐾼"] = "δ", -- lamedh
    ["𐾽"] = "m", -- mem
    ["𐾾"] = "n", -- nun
    ["𐾿"] = "s", -- samekh
    ["𐿀"] = "ʿ", -- ayin
    ["𐿁"] = "p", -- pe
    ["𐿂"] = "r", -- resh
    ["𐿃"] = "š", -- shin
    ["𐿄"] = "t", -- taw
    ["𐿅"] = "1", -- one
    ["𐿆"] = "2", -- two
    ["𐿇"] = "3", -- three
    ["𐿈"] = "4", -- four
    ["𐿉"] = "10", -- ten
    ["𐿊"] = "20", -- twenty
    ["𐿋"] = "100" -- one hundred
}

function export.tr(text, lang, sc)
    -- If the script is not Chrs, do not transliterate
    if sc ~= "Chrs" then return end

    -- Transliterate characters
    text = mw.ustring.gsub(text, ".", tt)

    return text
end

return export
