local export = {}

local tab = {
    ["А"] = "A",
    ["Б"] = "B",
    ["В"] = "V",
    ["Г"] = "G",
    ["Д"] = "D",
    ["Е"] = "E",
    ["Ё"] = "Yo",
    ["Ж"] = "Ž",
    ["З"] = "Z",
    ["И"] = "I",
    ["Й"] = "Y",
    ["Ј"] = "J̌",
    ["J"] = "J̌[[Category:Altai text with misused characters|J]]",
    ["К"] = "K",
    ["Л"] = "L",
    ["М"] = "M",
    ["Н"] = "N",
    ["Ҥ"] = "Ŋ",
    ["О"] = "O",
    ["Ӧ"] = "Ö",
    ["Ö"] = "Ö[[Category:Altai text with misused characters|Ö]]",
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
    ["д"] = "d",
    ["е"] = "e",
    ["ё"] = "yo",
    ["ж"] = "ž",
    ["з"] = "z",
    ["и"] = "i",
    ["й"] = "y",
    ["ј"] = "ǰ",
    ["j"] = "ǰ[[Category:Altai text with misused characters|j]]",
    ["к"] = "k",
    ["л"] = "l",
    ["м"] = "m",
    ["н"] = "n",
    ["ҥ"] = "ŋ",
    ["о"] = "o",
    ["ӧ"] = "ö",
    ["ö"] = "ö[[Category:Altai text with misused characters|ö]]",
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
    ["ы"] = "ï",
    ["ь"] = "ʹ",
    ["э"] = "e",
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
