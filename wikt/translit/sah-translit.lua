local export = {}

local tab = {
    ["А"] = "A",
    ["а"] = "a",
    ["Б"] = "B",
    ["б"] = "b",
    ["Г"] = "G",
    ["г"] = "g",
    ["Ҕ"] = "Ğ",
    ["ҕ"] = "ğ",
    ["Д"] = "D",
    ["д"] = "d",
    ["И"] = "İ",
    ["и"] = "i",
    ["Й"] = "Y",
    ["й"] = "y",
    ["К"] = "K",
    ["к"] = "k",
    ["Л"] = "L",
    ["л"] = "l",
    ["М"] = "M",
    ["м"] = "m",
    ["Н"] = "N",
    ["н"] = "n",
    ["Ҥ"] = "Ŋ",
    ["ҥ"] = "ŋ",
    ["О"] = "O",
    ["о"] = "o",
    ["Ө"] = "Ö",
    ["ө"] = "ö",
    ["П"] = "P",
    ["п"] = "p",
    ["Р"] = "R",
    ["р"] = "r",
    ["С"] = "S",
    ["с"] = "s",
    ["Һ"] = "H",
    ["һ"] = "h",
    ["Т"] = "T",
    ["т"] = "t",
    ["У"] = "U",
    ["у"] = "u",
    ["Ү"] = "Ü",
    ["ү"] = "ü",
    ["Х"] = "X",
    ["х"] = "x",
    ["Ч"] = "Ç",
    ["ч"] = "ç",
    ["Ш"] = "Ş",
    ["ш"] = "ş",
    ["Ы"] = "I",
    ["ы"] = "ı",
    ["Э"] = "E",
    ["э"] = "e",
    -- non-native letters
    ["В"] = "V",
    ["в"] = "v",
    ["Е"] = "E",
    ["е"] = "e",
    ["Ё"] = "Yo",
    ["ё"] = "yo",
    ["Ж"] = "J",
    ["ж"] = "j",
    ["З"] = "Z",
    ["з"] = "z",
    ["Ф"] = "F",
    ["ф"] = "f",
    ["Ц"] = "Ts",
    ["ц"] = "ts",
    ["Щ"] = "Şç",
    ["щ"] = "şç",
    ["Ъ"] = "ʺ",
    ["ъ"] = "ʺ",
    ["Ь"] = "’",
    ["ь"] = "’",
    ["Ю"] = "Yu",
    ["ю"] = "yu",
    ["Я"] = "Ya",
    ["я"] = "ya"
}

function export.tr(text, lang, sc)
    text = mw.ustring.gsub(text, "Дь", "C")
    text = mw.ustring.gsub(text, "дь", "c")
    text = mw.ustring.gsub(text, "Нь", "Ń")
    text = mw.ustring.gsub(text, "нь", "ń")

    -- е after a vowel or at the beginning of a word becomes ye
    text = mw.ustring.gsub(text, "([АОӨУҮЫЕЯЁЮИЕЪЬаоөуүыэяёюиеъь%A][́̀]?)е", "%1je")
    text = mw.ustring.gsub(text, "^Е", "Ye")
    text = mw.ustring.gsub(text, "^е", "ye")
    text = mw.ustring.gsub(text, "([^Ѐ-ӿ])Е", "%1Ye")
    text = mw.ustring.gsub(text, "([^Ѐ-ӿ])е", "%1ye")

    return (mw.ustring.gsub(text, ".", tab))
end

return export
