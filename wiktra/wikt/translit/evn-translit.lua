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
    ["В"] = "W",
    ["в"] = "w",
    ["Е"] = "E",
    ["е"] = "e",
    ["Ё"] = "Jo",
    ["ё"] = "jo",
    ["Г"] = "G",
    ["г"] = "g",
    ["Д"] = "D",
    ["д"] = "d",
    ["И"] = "I",
    ["и"] = "i",
    ["Ӣ"] = "Ī",
    ["ӣ"] = "ī",
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
    ["Ӯ"] = "Ū",
    ["ӯ"] = "ū",
    ["Ф"] = "F",
    ["ф"] = "f",
    ["Х"] = "H",
    ["х"] = "h",
    ["Ч"] = "Ç",
    ["ч"] = "ç",
    ["Ы"] = "I",
    ["ы"] = "i",
    ["Э"] = "Ə",
    ["э"] = "ə",
    ["Ю"] = "Ju",
    ["ю"] = "ju",
    ["Я"] = "Ja",
    ["я"] = "ja",
    -- non-native letters
    ["Б"] = "B",
    ["б"] = "b",
    ["Ж"] = "Z",
    ["ж"] = "z",
    ["З"] = "Z",
    ["з"] = "z",
    ["Ц"] = "C",
    ["ц"] = "c",
    ["Ш"] = "Ş",
    ["ш"] = "ş",
    ["Щ"] = "Ş",
    ["щ"] = "ş", -- in literary language ш is only found in Russian words and was originally represented with s, however some dialects have ш in native words
    ["Ъ"] = "ʺ",
    ["ъ"] = "ʺ",
    ["Ь"] = "’",
    ["ь"] = "’"
}

local other = {
    {"Я", "Ja"}, {"я", "ja"}, {"Ё", "Jo"}, {"ё", "jo"}, {"Ю", "Ju"}, {"ю", "ju"}, -- Unfortunately the Cyrillic alphabet doesn't distinguish between ʒe and ʒə
    {"Де", "Ʒe"}, {"де", "ʒe"}, {"Не", "Ņe"}, {"не", "ņe"}, {"Ди", "Ʒi"}, {"ди", "ʒi"}, {"Ни", "Ņi"}, {"ни", "ņi"}, {"Дӣ", "Ʒī"}, {"дӣ", "ʒī"}, {"Нӣ", "Ņī"}, {"нӣ", "ņī"}, {"Дj", "Ʒ"}, {"дj", "ʒ"}, {"Нj", "Ņ"}, {"нj", "ņ"}
}

function export.tr(text, lang, sc)
    for i, replacement in ipairs(other) do text = str_gsub(text, unpack(replacement)) end

    -- е after a vowel or at the beginning of a word becomes ye
    -- Again, the Cyrillic alphabet doesn't distinguish between je and jə
    text = ugsub(text, "([АОУЫЕИӢЪЬаӣиоуыэеъьaeiou][" .. MACRON .. DOTABOVE .. DOTBELOW .. "]?)е", "%1je")
    text = ugsub(text, "([АОУЫЕИӢЪЬаӣиоуыэеъьaeiou][" .. MACRON .. DOTABOVE .. DOTBELOW .. "]?)и", "%1ji")
    text = ugsub(text, "([АОУЫЕИӢЪЬаӣиоуыэеъьaeiou][" .. MACRON .. DOTABOVE .. DOTBELOW .. "]?)ӣ", "%1jī")
    text = str_gsub(text, "^Е", "Je")
    text = str_gsub(text, "^е", "je")
    text = ugsub(text, "([^Ѐ-ӿ])Е", "%1Je")
    text = ugsub(text, "([^Ѐ-ӿ])е", "%1je")

    return (str_gsub(text, UTF8char, tab))
end

return export
