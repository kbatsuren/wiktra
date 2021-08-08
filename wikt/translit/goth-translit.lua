local export = {}

local Goth_Latn = {["𐌰"] = "a", ["𐌱"] = "b", ["𐌲"] = "g", ["𐌳"] = "d", ["𐌴"] = "ē", ["𐌵"] = "q", ["𐌶"] = "z", ["𐌷"] = "h", ["𐌸"] = "þ", ["𐌹"] = "i", ["𐌺"] = "k", ["𐌻"] = "l", ["𐌼"] = "m", ["𐌽"] = "n", ["𐌾"] = "j", ["𐌿"] = "u", ["𐍀"] = "p", ["𐍁"] = "?", ["𐍂"] = "r", ["𐍃"] = "s", ["𐍄"] = "t", ["𐍅"] = "w", ["𐍆"] = "f", ["𐍇"] = "x", ["𐍈"] = "ƕ", ["𐍉"] = "ō", ["𐍊"] = "?"}

local Latn_Goth = {["ā"] = "𐌰", ["e"] = "𐌴", ["ī"] = "𐌹", ["o"] = "𐍉", ["ū"] = "𐌿", ["y"] = "𐍅"}

for g, l in pairs(Goth_Latn) do if l ~= "?" then Latn_Goth[l] = g end end

function export.tr(text, lang, sc)
    text = mw.ustring.gsub(text, "𐌴𐌹", "ei")

    return (mw.ustring.gsub(text, ".", Goth_Latn))
end

function export.tr_reverse(text)
    text = mw.ustring.lower(text)
    return (mw.ustring.gsub(text, ".", Latn_Goth))
end

return export
