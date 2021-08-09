local export = {}

local tab = {
    ["А"] = "A",
    ["Б"] = "B",
    ["В"] = "V",
    ["Г"] = "G",
    ["Д"] = "D",
    ["Е"] = "E",
    ["Ё"] = "Yo",
    ["Ж"] = "J",
    ["З"] = "Z",
    ["И"] = "İ",
    ["Й"] = "Y",
    ["К"] = "K",
    ["Л"] = "L",
    ["М"] = "M",
    ["Н"] = "N",
    ["Ң"] = "Ñ",
    ["О"] = "O",
    ["Ө"] = "Ö",
    ["П"] = "P",
    ["Р"] = "R",
    ["С"] = "S",
    ["Т"] = "T",
    ["У"] = "U",
    ["Ү"] = "Ü",
    ["Ф"] = "F",
    ["Х"] = "X",
    ["Ц"] = "Ts",
    ["Ч"] = "Ç",
    ["Ш"] = "Ş",
    ["Щ"] = "Şş",
    ["Ъ"] = "ʺ",
    ["Ы"] = "I",
    ["Ь"] = "ʹ",
    ["Э"] = "E",
    ["Ю"] = "Yu",
    ["Я"] = "Ya",
    ["а"] = "a",
    ["б"] = "b",
    ["в"] = "v",
    ["г"] = "g",
    ["д"] = "d",
    ["е"] = "e",
    ["ё"] = "yo",
    ["ж"] = "j",
    ["з"] = "z",
    ["и"] = "i",
    ["й"] = "y",
    ["к"] = "k",
    ["л"] = "l",
    ["м"] = "m",
    ["н"] = "n",
    ["ң"] = "ñ",
    ["о"] = "o",
    ["ө"] = "ö",
    ["п"] = "p",
    ["р"] = "r",
    ["с"] = "s",
    ["т"] = "t",
    ["у"] = "u",
    ["ү"] = "ü",
    ["ф"] = "f",
    ["х"] = "x",
    ["ц"] = "ts",
    ["ч"] = "ç",
    ["ш"] = "ş",
    ["щ"] = "şş",
    ["ъ"] = "ʺ",
    ["ы"] = "ı",
    ["ь"] = "ʹ",
    ["э"] = "e",
    ["ю"] = "yu",
    ["я"] = "ya"
}

function export.tr(text, lang, sc)
    text = mw.ustring.gsub(text, "Аъ", "À")
    text = mw.ustring.gsub(text, "аъ", "à")
    text = mw.ustring.gsub(text, "Эъ", "È")
    text = mw.ustring.gsub(text, "эъ", "è")
    text = mw.ustring.gsub(text, "Оъ", "Ò")
    text = mw.ustring.gsub(text, "оъ", "ò")
    text = mw.ustring.gsub(text, "Үъ", "Ü'")
    text = mw.ustring.gsub(text, "үъ", "ü'")
    text = mw.ustring.gsub(text, "Уъ", "Ỳ")
    text = mw.ustring.gsub(text, "уъ", "ỳ")
    text = mw.ustring.gsub(text, "Иъ", "Ì")
    text = mw.ustring.gsub(text, "иъ", "ì")
    text = mw.ustring.gsub(text, "Ыъ", "I'")
    text = mw.ustring.gsub(text, "ыъ", "ı'")
    text = mw.ustring.gsub(text, "Өъ", "Ö'")
    text = mw.ustring.gsub(text, "өъ", "ö'")
    -- Ё needs converting if is decomposed
    text = text:gsub("ё", "ё"):gsub("Ё", "Ё")

    return (mw.ustring.gsub(text, ".", tab))
end

return export
