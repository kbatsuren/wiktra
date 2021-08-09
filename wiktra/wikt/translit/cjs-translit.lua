local export = {}

local tab = {
    ["А"] = "A",
    ["Б"] = "B",
    ["В"] = "V",
    ["Г"] = "G",
    ["Ғ"] = "Ĝ",
    ["Д"] = "D",
    ["Е"] = "E",
    ["Ё"] = "Yo",
    ["Ж"] = "Ž",
    ["З"] = "Z",
    ["И"] = "I",
    ["Й"] = "Y",
    ["Ј"] = "J̌[[Category:Shor text with old orthography]]",
    ["J"] = "J̌[[Category:Shor text with misused character(s)]][[Category:Shor text with old orthography]]",
    ["К"] = "K",
    ["Қ"] = "K̂",
    ["Л"] = "L",
    ["М"] = "M",
    ["Н"] = "N",
    ["Ң"] = "Ŋ",
    ["Ҥ"] = "Ŋ[[Category:Shor text with old orthography]]",
    ["О"] = "O",
    ["Ӧ"] = "Ö",
    ["Ö"] = "Ö[[Category:Shor text with misused character(s)]]",
    ["П"] = "P",
    ["Р"] = "R",
    ["С"] = "S",
    ["Т"] = "T",
    ["У"] = "U",
    ["Ӱ"] = "Ü",
    ["Ф"] = "F",
    ["Х"] = "H",
    ["Ц"] = "C",
    ["Ч"] = "Č",
    ["Ш"] = "Š",
    ["Щ"] = "Šč",
    ["Ъ"] = "ʺ",
    ["Ы"] = "Ï",
    ["Ь"] = "ʹ",
    ["Э"] = "E",
    ["Ю"] = "Yu",
    ["Я"] = "Ya",
    ["а"] = "a",
    ["б"] = "b",
    ["в"] = "v",
    ["г"] = "g",
    ["ғ"] = "ĝ",
    ["д"] = "d",
    ["е"] = "e",
    ["ё"] = "yo",
    ["ж"] = "ž",
    ["з"] = "z",
    ["и"] = "i",
    ["й"] = "y",
    ["ј"] = "ǰ[[Category:Shor text with old orthography]]",
    ["j"] = "ǰ[[Category:Shor text with misused character(s)]][[Category:Shor text with old orthography]]",
    ["к"] = "k",
    ["қ"] = "k̂",
    ["л"] = "l",
    ["м"] = "m",
    ["н"] = "n",
    ["ң"] = "ŋ",
    ["ҥ"] = "ŋ[[Category:Shor text with old orthography]]",
    ["о"] = "o",
    ["ӧ"] = "ö",
    ["ö"] = "ö[[Category:Shor text with misused character(s)]]",
    ["п"] = "p",
    ["р"] = "r",
    ["с"] = "s",
    ["т"] = "t",
    ["у"] = "u",
    ["ӱ"] = "ü",
    ["ф"] = "f",
    ["х"] = "h",
    ["ц"] = "c",
    ["ч"] = "č",
    ["ш"] = "š",
    ["щ"] = "šč",
    ["ъ"] = "ʺ",
    ["ы"] = "ı",
    ["ь"] = "ʹ",
    ["э"] = "e",
    ["ю"] = "yu",
    ["я"] = "ya"
}

function export.tr(text, lang, sc)
    -- Ё needs converting if is decomposed
    text = text:gsub("ё", "ё"):gsub("Ё", "Ё")

    -- е after a vowel or at the beginning of a word becomes ye
    -- Note that according to modern Shor orthography ее (instead of ээ) is occationally used for long e
    text = mw.ustring.gsub(text, "([АОӨУҮЫЯЁЮИЪЬаоөуүыяёюиъь%A][́̀]?)е", "%1ye")
    -- text = mw.ustring.gsub(text, "([АОӨУҮЫЕЯЁЮИЕЪЬаоөуүыэяёюиеъь%A][́̀]?)е","%1ye")
    text = mw.ustring.gsub(text, "^Е", "Ye")
    text = mw.ustring.gsub(text, "^е", "ye")
    text = mw.ustring.gsub(text, "([^Ѐ-ӿ])Е", "%1Ye")
    text = mw.ustring.gsub(text, "([^Ѐ-ӿ])е", "%1ye")

    return (mw.ustring.gsub(text, ".", tab))
end

return export
