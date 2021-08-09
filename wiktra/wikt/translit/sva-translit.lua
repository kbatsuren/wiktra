local export = {}
-- Keep synchronized with [[Module:Geor-translit]]
local tt = {["ა"] = "a", ["а"] = "a", ["ბ"] = "b", ["б"] = "b", ["გ"] = "g", ["г"] = "g", ["დ"] = "d", ["д"] = "d", ["ე"] = "e", ["ვ"] = "v", ["в"] = "v", ["ზ"] = "z", ["ჱ"] = "ē", ["თ"] = "t", ["ꚋ"] = "t", ["ი"] = "i", ["і"] = "i", ["კ"] = "ḳ", ["к"] = "ḳ", ["ლ"] = "l", ["л"] = "l", ["მ"] = "m", ["ნ"] = "n", ["н"] = "n", ["ჲ"] = "y", ["ო"] = "o", ["პ"] = "ṗ", ["п"] = "ṗ", ["ჟ"] = "ž", ["ж"] = "ž", ["რ"] = "r", ["р"] = "r", ["ს"] = "s", ["ტ"] = "ṭ", ["ჳ"] = "w", ["უ"] = "u", ["у"] = "u", ["ფ"] = "p", ["ҧ"] = "p", ["ქ"] = "k", ["ӄ"] = "k", ["ღ"] = "ɣ", ["ҕ"] = "ɣ", ["ყ"] = "q̇", ["შ"] = "š", ["ш"] = "š", ["ჩ"] = "č", ["ч"] = "č", ["ც"] = "c", ["ძ"] = "ʒ", ["წ"] = "c̣", ["ჭ"] = "č̣", ["ꚓ"] = "č̣", ["ხ"] = "x", ["х"] = "x", ["ჴ"] = "q", ["ჯ"] = "ǯ", ["ჰ"] = "h", ["ჵ"] = "ō", ["ჶ"] = "f", ["ჷ"] = "ə", ["ѵ"] = "ə", ["ჸ"] = "ʾ"};

function export.tr(text)
    text = mw.ustring.gsub(text, "ჳი", "ü")
    text = mw.ustring.gsub(text, "ჳე", "ö")
    text = mw.ustring.gsub(text, "а̇", "ä")
    -- Transliterating vowel nasalization in some dialects
    text = mw.ustring.gsub(text, "ჼ", "̃")
    text = mw.ustring.gsub(text, ".", tt)

    return text
end

return export
