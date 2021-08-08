local export = {}

local tt = {
    ["𐼰"] = "ʾ", -- aleph
    ["𐼱"] = "β", -- beth
    ["𐼲"] = "ɣ", -- gimel
    ["𐼳"] = "h", -- he
    ["𐼴"] = "w", -- waw
    ["𐼵"] = "z", -- zayin
    ["𐼶"] = "x", -- heth
    ["𐼷"] = "y", -- yodh
    ["𐼸"] = "k", -- kaph
    ["𐼹"] = "δ", -- lamedh
    ["𐼺"] = "m", -- mem
    ["𐼻"] = "n", -- nun
    ["𐼼"] = "s", -- samekh
    ["𐼽"] = "ʿ", -- ayin
    ["𐼾"] = "p", -- pe
    ["𐼿"] = "c", -- sadhe
    ["𐽀"] = "r", -- resh-ayin
    ["𐽁"] = "š", -- shin
    ["𐽂"] = "t", -- taw
    ["𐽃"] = "f", -- fesh
    ["𐽄"] = "l", -- lesh
    ["𐽅"] = "š", -- phonogram shin
    ["𐽆"] = "", -- dot above
    ["𐽇"] = "", -- dot above
    ["𐽈"] = "", -- two dots above
    ["𐽉"] = "", -- two dots below
    ["𐽊"] = "", -- curve above
    ["𐽋"] = "", -- curve below
    ["𐽌"] = "", -- hook above
    ["𐽍"] = "", -- hook below
    ["𐽎"] = "", -- long hook below
    ["𐽏"] = "", -- resh below
    ["𐽐"] = "", -- stroke below
    ["𐽑"] = "1", -- one
    ["𐽒"] = "10", -- ten
    ["𐽓"] = "20", -- twenty
    ["𐽔"] = "100" -- one hundred
}

function export.tr(text, lang, sc)
    -- If the script is not Sogd, do not transliterate
    if sc ~= "Sogd" then return end

    -- Transliterate characters
    text = mw.ustring.gsub(text, ".", tt)

    return text
end

return export
