-- This module will transliterate text in the Georgian script per WT:GEOR TR. 
-- It is used to transliterate Bats (bbl), Georgian (ka), Laz (lzz), Old Georgian (oge), 
-- Udi (udi) and Mingrelian (xmf).
-- Language code: bbl, kat(geo), lzz, oge, udi, xmf.

local export = {}
	-- Keep synchronized with [[Module:sva-translit]]
local gsub = mw.ustring.gsub
local tt = {
	["ა"]="a", ["ბ"]="b", ["გ"]="g", ["დ"]="d", ["ე"]="e", ["ვ"]="v", ["ზ"]="z", ["ჱ"]="ē",
	["თ"]="t", ["ი"]="i", ["კ"]="ḳ", ["ლ"]="l", ["მ"]="m", ["ნ"]="n", ["ჲ"]="y", ["ო"]="o",
	["პ"]="ṗ", ["ჟ"]="ž", ["რ"]="r", ["ს"]="s", ["ტ"]="ṭ", ["ჳ"]="wi", ["უ"]="u", ["ფ"]="p",
	["ქ"]="k", ["ღ"]="ɣ", ["ყ"]="q̇", ["შ"]="š", ["ჩ"]="č", ["ც"]="c",
	["ძ"]="ʒ", ["წ"]="c̣", ["ჭ"]="č̣", ["ხ"]="x", ["ჴ"]="q", ["ჯ"]="ǯ", ["ჰ"]="h", ["ჵ"]="ō", ["ჶ"]="f", ["ჷ"]="ə", ["ჸ"]="ʾ"
};

function export.tr(text, lang, sc)
	-- Transliterating vowel nasalization in Bats
	text = gsub(text, 'ჼ', '̃')
	text = gsub(text, '<sup>ნ</sup>', '̃')
	text = gsub(text, '.', tt)
	return text
end

return export