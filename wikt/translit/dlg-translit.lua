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
    ["Ӈ"] = "Ñ",
    ["ӈ"] = "ñ",
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
    ["Ш"] = "Ś",
    ["ш"] = "ś",
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

local digraphs = {["Дь"] = "C", ["дь"] = "c", ["Нь"] = "Ń", ["нь"] = "ń"}

function export.tr(text, lang, sc)
    local str_gsub = string.gsub
    for digraph, repl in ipairs(digraphs) do text = str_gsub(text, digraph, repl) end

    -- е after a vowel or at the beginning of a word becomes ye
    text = mw.ustring.gsub(text, "([АОӨУҮЫЕЯЁЮИЕЪЬаоөуүыэяёюиеъь%A][́̀]?)е", "%1je")
    text = str_gsub(text, "^Е", "Ye")
    text = str_gsub(text, "^е", "ye")
    text = mw.ustring.gsub(text, "([^Ѐ-ӿ])Е", "%1Ye")
    text = mw.ustring.gsub(text, "([^Ѐ-ӿ])е", "%1ye")

    -- pattern for non-ASCII UTF-8 characters
    return (str_gsub(text, "[\194-\244][\128-\191]+", tab))
end

return export
