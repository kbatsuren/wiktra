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
    ["І"] = "Ï",
    ["Ј"] = "C",
    ["К"] = "K",
    ["Қ"] = "Q",
    ["Л"] = "L",
    ["М"] = "M",
    ["Н"] = "N",
    ["Ҥ"] = "Ñ",
    ["О"] = "O",
    ["Ӧ"] = "Ö",
    ["П"] = "P",
    ["Р"] = "R",
    ["С"] = "S",
    ["Т"] = "T",
    ["У"] = "U",
    ["Ӱ"] = "Ü",
    ["Ф"] = "F",
    ["Х"] = "X",
    ["Һ"] = "h",
    ["Ц"] = "C",
    ["Ч"] = "Ç",
    ["Ҹ"] = "Ć",
    ["Ш"] = "Ş",
    ["Щ"] = "Ś",
    ["Ъ"] = "ʺ",
    ["Ы"] = "I",
    ["Ь"] = "ʹ",
    ["Э"] = "Ä",
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
    ["і"] = "ï",
    ["j"] = "c",
    ["к"] = "k",
    ["қ"] = "q",
    ["л"] = "l",
    ["м"] = "m",
    ["н"] = "n",
    ["ҥ"] = "ñ",
    ["о"] = "o",
    ["ӧ"] = "ö",
    ["п"] = "p",
    ["р"] = "r",
    ["с"] = "s",
    ["т"] = "t",
    ["у"] = "u",
    ["ӱ"] = "ü",
    ["ф"] = "f",
    ["х"] = "x",
    ["һ"] = "h",
    ["ц"] = "c",
    ["ч"] = "ç",
    ["ҹ"] = "ć",
    ["ш"] = "ş",
    ["щ"] = "ś",
    ["ъ"] = "ʺ",
    ["ы"] = "ı",
    ["ь"] = "ʹ",
    ["э"] = "ä",
    ["ю"] = "yu",
    ["я"] = "ya"
}

local iotated = {["Е"] = "Ye", ["е"] = "ye"}

function export.tr(text, lang, sc)
    local ugsub = mw.ustring.gsub

    -- Ё needs to be composed if is decomposed (e + combining diaeresis).
    -- However, this cannot happen in wikitext, only in Lua modules.
    text = mw.ustring.toNFC(text)

    -- е after a vowel or at the beginning of a word becomes ye
    -- Note that according to modern Altai orthography ее (instead of ээ) is occationally used for long r
    text = ugsub(text, "([АОӨУҮЫЯЁЮИЪЬаоөуүыяёюиъь%A][́̀]?)е", "%1ye")
    -- text = mw.ustring.gsub(text, "([АОӨУҮЫЕЯЁЮИЕЪЬаоөуүыэяёюиеъь%A][́̀]?)е", "%1ye")
    text = ugsub(text, "^[Ее]", iotated)
    text = ugsub(text, "([^Ѐ-ӿ])([Ее])", function(a, b) return a .. iotated[b] end)

    return (ugsub(text, ".", tab))
end

return export
