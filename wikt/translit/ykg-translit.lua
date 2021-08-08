local u = mw.ustring.char

local MACRON = u(0x0304)
local DOTABOVE = u(0x0307)
local DOTBELOW = u(0x0323)

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
    ["Г̧̧"] = "H",
    ["г̧"] = "h",
    ["Ғ"] = "H",
    ["ғ"] = "h",
    ["Ҕ"] = "H",
    ["ҕ"] = "h", -- Atlasova, Wikipedia and Kurilov all differ in this
    ["Д"] = "D",
    ["д"] = "d",
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
    ["Ӈ"] = "Ŋ",
    ["ӈ"] = "ŋ",
    ["Ң"] = "Ŋ",
    ["ң"] = "ŋ",
    ["Ҥ"] = "Ŋ",
    ["ҥ"] = "ŋ", -- Same as h above
    ["О"] = "O",
    ["о"] = "o",
    ["Ө"] = "Ö",
    ["ө"] = "ö",
    ["Ӧ"] = "Ö",
    ["ӧ"] = "ö",
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
    ["Ч"] = "Ț",
    ["ч"] = "ț",
    ["Э"] = "E",
    ["э"] = "e",

    -- non-native letters
    ["Е"] = "E",
    ["е"] = "e",
    ["Ё"] = "Jo",
    ["ё"] = "jo",
    ["Ж"] = "Z",
    ["ж"] = "z",
    ["З"] = "Z",
    ["з"] = "z",
    ["Ц"] = "C",
    ["ц"] = "c",
    ["Ш"] = "Ş",
    ["ш"] = "ş",
    ["Щ"] = "Ş",
    ["щ"] = "ş",
    ["Ы"] = "Y",
    ["ы"] = "y",
    ["Ю"] = "Ju",
    ["ю"] = "ju",
    ["Я"] = "Ja",
    ["я"] = "ja",
    ["Ъ"] = "",
    ["ъ"] = "",
    ["Ь"] = "",
    ["ь"] = ""
}

local other = {{"Дь", "D̦"}, {"дь", "d̦"}, {"Нь", "Ņ"}, {"нь", "ņ"}, {"Ль", "Ļ"}, {"ль", "ļ"}, {"Г̧", "H"}, {"г̧", "h"}}

function export.tr(text, lang, sc)
    for i, replacement in ipairs(other) do text = str_gsub(text, unpack(replacement)) end

    -- Intrestingly the orthography(ies) don't use Cyrillic palatal vowels

    return (str_gsub(text, UTF8char, tab))
end

return export
