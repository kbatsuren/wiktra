local export = {}

local tt = {
    ["𐼀"] = "ʾ", -- aleph
    ["𐼁"] = "ʾ", -- final aleph
    ["𐼂"] = "β", -- beth
    ["𐼃"] = "β", -- final beth
    ["𐼄"] = "ɣ", -- gimel
    ["𐼅"] = "h", -- he
    ["𐼆"] = "h", -- final he
    ["𐼇"] = "w", -- waw
    ["𐼈"] = "z", -- zayin
    ["𐼉"] = "x", -- heth
    ["𐼊"] = "y", -- yodh
    ["𐼋"] = "k", -- kaph
    ["𐼌"] = "δ", -- lamedh
    ["𐼍"] = "m", -- mem
    ["𐼎"] = "n", -- nun
    ["𐼏"] = "n", -- final nun
    ["𐼐"] = "n", -- final nun with vertical tail
    ["𐼑"] = "s", -- samekh
    ["𐼒"] = "ʿ", -- ayin
    ["𐼓"] = "ʿD", -- alternative ayin
    ["𐼔"] = "p", -- pe
    ["𐼕"] = "c", -- sadhe
    ["𐼖"] = "c", -- final sadhe
    ["𐼗"] = "c", -- final sadhe with vertical tail
    ["𐼘"] = "r", -- resh-ayin-deleth
    ["𐼙"] = "š", -- shin
    ["𐼚"] = "t", -- taw
    ["𐼛"] = "t", -- final taw
    ["𐼜"] = "t" -- final taw with vertical tail
}, {
    ["𐼝"] = "1", -- one
    ["𐼞"] = "2", -- two
    ["𐼟"] = "3", -- three
    ["𐼠"] = "4", -- four
    ["𐼡"] = "5", -- five
    ["𐼢"] = "10", -- ten
    ["𐼣"] = "20", -- twenty
    ["𐼤"] = "30", -- thirty
    ["𐼥"] = "100", -- one hundred
    ["𐼦"] = "½" -- one half
}, {
    ["𐼧"] = "r" -- ayin-daleth ligature
}

function export.tr(text, lang, sc)
    -- If the script is not Sogd, do not transliterate
    if sc ~= "Sogo" then return end

    -- Transliterate characters
    text = mw.ustring.gsub(text, ".", tt)

    return text
end

return export
