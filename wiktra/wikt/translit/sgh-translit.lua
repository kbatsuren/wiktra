local export = {}

local tt = {["а"] = "a", ["б"] = "b", ["в"] = "v", ["г"] = "g", ["д"] = "d", ["е"] = "ē", ["ж"] = "ž", ["з"] = "z", ["и"] = "i", ["ӣ"] = "ī", ["й"] = "y", ["к"] = "k", ["л"] = "l", ["м"] = "m", ["н"] = "n", ["о"] = "ō", ["п"] = "p", ["р"] = "r", ["с"] = "s", ["т"] = "t", ["у"] = "u", ["ӯ"] = "ū", ["ф"] = "f", ["х"] = "x", ["ц"] = "c", ["ӡ"] = "ʒ", ["ч"] = "č", ["ш"] = "š", ["ғ"] = "ɣ", ["қ"] = "q", ["ҳ"] = "h", ["ҷ"] = "ǰ", ["А"] = "A", ["Б"] = "B", ["В"] = "V", ["Г"] = "G", ["Д"] = "D", ["Е"] = "Ē", ["Ж"] = "Ž", ["З"] = "Z", ["И"] = "I", ["Ӣ"] = "Ī", ["Й"] = "Y", ["К"] = "K", ["Л"] = "L", ["М"] = "M", ["Н"] = "N", ["О"] = "Ō", ["П"] = "P", ["Р"] = "R", ["С"] = "S", ["Т"] = "T", ["У"] = "U", ["Ӯ"] = "Ū", ["Ф"] = "F", ["Х"] = "X", ["Ц"] = "C", ["Ӡ"] = "Ʒ", ["Ч"] = "Č", ["Ш"] = "Š", ["Ғ"] = "Ɣ", ["Қ"] = "Q", ["Ҳ"] = "H", ["Ҷ"] = "J̌"};

local mapping = {["в̌"] = "w", ["д̌"] = "δ", ["т̌"] = "θ", ["е̂"] = "ê", ["е̣"] = "ẹ", ["о̣"] = "ọ", ["у̊"] = "ū̊", ["г̌"] = "ɣ̌", ["В̌"] = "W", ["Д̌"] = "Δ", ["Т̌"] = "Θ", ["Е̂"] = "Ê", ["Е̣"] = "Ẹ", ["О̣"] = "Ọ", ["У̊"] = "Ū̊", ["Г̌"] = "Ɣ̌"}

function export.tr(text, lang, sc)
    if sc == "Latn" then return nil end

    for char, translit in pairs(mapping) do text = mw.ustring.gsub(text, char, translit) end

    text = mw.ustring.gsub(text, ".", tt)

    return text
end

return export
