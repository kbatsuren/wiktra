local u = mw.ustring.char

local ACUTE = u(0x0301)
local MACRON = u(0x0304)
local DOTABOVE = u(0x0307)
local DIAER = u(0x0308)
local CARON = u(0x030C)

local str_gsub, ugsub = string.gsub, mw.ustring.gsub
local UTF8char = "[\1-\127\194-\244][\128-\191]*"

local export = {}

local tab = {
    ["А"] = "A",
    ["а"] = "a",
    ["Б"] = "B",
    ["б"] = "b",
    ["В"] = "W",
    ["в"] = "w",
    ["Г"] = "G",
    ["г"] = "g",
    ["Д"] = "D",
    ["д"] = "d",
    ["Е"] = "Je",
    ["е"] = "je",
    ["Ё"] = "Jo",
    ["ё"] = "jo",
    ["Ж"] = "Ž",
    ["ж"] = "ž",
    ["З"] = "Z",
    ["з"] = "z",
    ["І"] = "Ï",
    ["і"] = "ï",
    ["И"] = "I",
    ["и"] = "i",
    ["Й"] = "J",
    ["й"] = "j",
    ["К"] = "K",
    ["к"] = "k",
    ["Л"] = "L",
    ["л"] = "l",
    ["М"] = "M",
    ["м"] = "m",
    ["Н"] = "N",
    ["н"] = "n",
    ["О"] = "O",
    ["о"] = "o",
    ["П"] = "P",
    ["п"] = "p",
    ["Р"] = "R",
    ["р"] = "r",
    ["С"] = "S",
    ["с"] = "s",
    ["Т"] = "T",
    ["т"] = "t",
    ["У"] = "U",
    ["у"] = "u",
    ["Ф"] = "F",
    ["ф"] = "f",
    ["Х"] = "Q",
    ["х"] = "q",
    ["Ц"] = "C",
    ["ц"] = "c",
    ["Ч"] = "Č",
    ["ч"] = "č",
    ["Ш"] = "Š",
    ["ш"] = "š",
    ["Щ"] = "Ś",
    ["щ"] = "ś",
    ["Ъ"] = "ʺ",
    ["ъ"] = "ʺ",
    ["Ы"] = "Y",
    ["ы"] = "y",
    ["Ь"] = "ʹ",
    ["ь"] = "ʹ",
    ["Э"] = "E",
    ["э"] = "e",
    ["Ю"] = "Ju",
    ["ю"] = "ju",
    ["Я"] = "ja",
    ["я"] = "ja",
    ["Ѣ"] = "Ě",
    ["ѣ"] = "ě"
}

local other = {
    {"Аа", "Ā"}, {"аа", "ā"}, -- long "а"
    {"Ее", "Jē"}, {"ее", "jē"}, -- long "е"
    {"Ии", "Ī"}, {"ии", "ī"}, -- long "и"
    {"Оо", "Ō"}, {"оо", "ō"}, -- long "о"
    {"Уу", "Ū"}, {"уу", "ū"}, -- long "у"
    {"Ээ", "Ē"}, {"ээ", "ē"}, -- long "э"
    {"Ъ%-", "%-"}, {"ъ%-", "%-"}, -- final "ъ"
    {"Ъ ", " "}, {"ъ ", " "}, -- final "ъ"
    {"Ъ$", ""}, {"ъ$", ""}, -- final "ъ"
    {"([БВГДЖЗЙКЛМНПРСТФХЦЧШЩбвгджзйклмнпрстфхцчшщ])Е", "%1E"}, -- post-consonantal E
    {"([БВГДЖЗЙКЛМНПРСТФХЦЧШЩбвгджзйклмнпрстфхцчшщ])е", "%1e"}, -- post-consonantal e
    {"([БВГДЖЗЙКЛМНПРСТФХЦЧШЩбвгджзйклмнпрстфхцчшщ])Ее", "%1Ē"}, -- post-consonantal long E
    {"([БВГДЖЗЙКЛМНПРСТФХЦЧШЩбвгджзйклмнпрстфхцчшщ])ее", "%1ē"} -- post-consonantal long e
}

function export.tr(text, lang, sc)
    for i, replacement in ipairs(other) do text = str_gsub(text, unpack(replacement)) end

    return (str_gsub(text, UTF8char, tab))
end

return export
