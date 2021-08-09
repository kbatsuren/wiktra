local export = {}
local tab = {["А"] = "A", ["Б"] = "B", ["В"] = "V", ["Г"] = "G", ["Д"] = "D", ["Е"] = "E", ["З"] = "Z", ["И"] = "I", ["Й"] = "J", ["К"] = "K", ["Л"] = "L", ["М"] = "M", ["Н"] = "N", ["О"] = "O", ["Ӧ"] = "Ö", ["П"] = "P", ["Р"] = "R", ["С"] = "S", ["Т"] = "T", ["У"] = "U", ["Ӱ"] = "Ü", ["Ф"] = "F", ["Х"] = "H", ["Ч"] = "Č", ["Ш"] = "Š", ["Ґ"] = "Ğʺ", ["Ы"] = "Ï", ["Э"] = "E", ["а"] = "a", ["б"] = "b", ["в"] = "v", ["г"] = "g", ["д"] = "d", ["е"] = "e", ["з"] = "z", ["и"] = "i", ["й"] = "j", ["к"] = "k", ["л"] = "l", ["м"] = "m", ["н"] = "n", ["о"] = "o", ["ӧ"] = "ö", ["п"] = "p", ["р"] = "r", ["с"] = "s", ["т"] = "t", ["у"] = "u", ["ӱ"] = "ü", ["ф"] = "f", ["х"] = "h", ["ч"] = "č", ["ш"] = "š", ["ґ"] = "ğ", ["ы"] = "ï", ["э"] = "e"}
local mapping = {["дж"] = "dž", ["Дж"] = "Dž"}
function export.tr(text, lang, sc)
    -- Ё needs converting if is decomposed
    text = text:gsub("ё", "ё"):gsub("Ё", "Ё")

    -- е after a vowel or at the beginning of a text becomes ye
    text = mw.ustring.gsub(text, "([АОӦУӰЫЕИЕаоӧуӱыэёие%A][\204\129\204\128]?)е", "%1je")
    text = mw.ustring.gsub(text, "^Е", "Je")
    text = mw.ustring.gsub(text, "^е", "je")
    text = mw.ustring.gsub(text, "([^Ѐ-ӿ])Е", "%1je")
    text = mw.ustring.gsub(text, "([^Ѐ-ӿ])е", "%1je")

    return (mw.ustring.gsub(text, ".", tab))
end

return export
