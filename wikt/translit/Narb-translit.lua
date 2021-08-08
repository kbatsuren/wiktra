local export = {}

local chars = {["𐪏"] = "s³", ["𐪙"] = "ḏ", ["𐪍"] = "ẖ", ["𐪊"] = "s¹", ["𐪆"] = "s²", ["𐪛"] = "ṯ", ["𐪑"] = "ʾ", ["𐪒"] = "ʿ", ["𐪈"] = "b", ["𐪕"] = "d", ["𐪓"] = "ḍ", ["𐪐"] = "f", ["𐪔"] = "g", ["𐪖"] = "ġ", ["𐪀"] = "h", ["𐪂"] = "ḥ", ["𐪋"] = "k", ["𐪁"] = "l", ["𐪃"] = "m", ["𐪌"] = "n", ["𐪄"] = "q", ["𐪇"] = "r", ["𐪎"] = "ṣ", ["𐪉"] = "t", ["𐪗"] = "ṭ", ["𐪅"] = "w", ["𐪚"] = "y", ["𐪘"] = "z", ["𐪜"] = "ẓ"}

function export.tr(text, lang, sc) return (mw.ustring.gsub(text, ".", chars)) end

return export
