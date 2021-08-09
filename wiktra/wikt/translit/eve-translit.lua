local export = {}

local u = mw.ustring.char

local MACRON = u(0x0304)
local DOTABOVE = u(0x0307)

local tab = {
    ["А"] = "A",
    ["а"] = "a",
    ["Б"] = "B",
    ["б"] = "ʙ",
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
    ["Ө"] = "Ö",
    ["ө"] = "ö",
    ["Ӫ"] = "Ö",
    ["ӫ"] = "ö",
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
    ["Ч"] = "C",
    ["ч"] = "c",
    ["Ы"] = "I",
    ["ы"] = "i",
    ["Э"] = "Ə",
    ["э"] = "ə",
    ["Ю"] = "Ju",
    ["ю"] = "ju",
    ["Я"] = "Ẹ",
    ["я"] = "ẹ", -- Not present in the original latinisation
    -- non-native letters
    ["Ж"] = "Z",
    ["ж"] = "z",
    ["З"] = "Z",
    ["з"] = "z",
    ["Ц"] = "C",
    ["ц"] = "c",
    ["Ш"] = "S",
    ["ш"] = "s",
    ["Щ"] = "S",
    ["щ"] = "s",
    ["Ъ"] = "ʺ",
    ["ъ"] = "ʺ",
    ["Ь"] = "’",
    ["ь"] = "’",

    -- non-standard letters
    ["Ҕ"] = "Γ",
    ["ҕ"] = "γ",
    ["Ҥ"] = "Ŋ",
    ["ҥ"] = "ŋ",
    ["Ү"] = "Ü",
    ["ү"] = "ü",
    ["Һ"] = "Ḥ",
    ["һ"] = "ḥ",
    ["Ӄ"] = "Q",
    ["ӄ"] = "q"
}

local iotatedTranslit = {["е"] = "je", ["я"] = "ja", ["и"] = "ji", ["ӣ"] = "jī", ["Е"] = "Je", ["Я"] = "Ja"}

local replacements = {
    {"Ё", "Jo"}, {"ё", "jo"}, {"Ӫ", "Jö"}, {"ӫ", "jö"}, {"Ю", "Ju"}, {"ю", "ju"}, -- Unfortunately the Cyrillic alphabet doesn't distinguish between ʒe and ʒə
    {"Де", "Ʒe"}, {"де", "ʒe"}, {"Не", "Ņe"}, {"не", "ņe"}, {"Ди", "Ʒi"}, {"ди", "ʒi"}, {"Ни", "Ņi"}, {"ни", "ņi"}, {"Дя", "Ʒa"}, {"дя", "ʒa"}, {"Ня", "Ņa"}, {"ня", "ņa"}, {"Дj", "Ʒ"}, {"дj", "ʒ"}, {"Нj", "Ņ"}, {"нj", "ņ"}, -- The following is non-standard but supposedly used in non-standard spelling and dialect forms
    {"Дь", "Ʒ"}, {"дь", "ʒ"}, {"Нь", "Ņ"}, {"нь", "ņ"}, {"Нг", "Ŋ"}, {"нг", "ŋ"}
}

function export.tr(text, lang, sc)
    local ugsub, str_gsub = mw.ustring.gsub, string.gsub
    local UTF8char = "[\1-\127\194-\244][\128-\191]*"

    for i, replacement in ipairs(replacements) do text = str_gsub(text, unpack(replacement)) end

    -- е after a vowel or at the beginning of a word becomes ye
    -- Again, the Cyrillic alphabet doesn't distinguish between je and jə
    text = ugsub(text, "([АОУЫЯЕИӢЪЬаӣиоуыэяеъьaeioöu][" .. MACRON .. DOTABOVE .. "]?)([еяиӣ])", function(preceding, iotated) return preceding .. iotatedTranslit[iotated] end)

    text = ugsub(text, "^[ЕеЯя]", iotatedTranslit)

    text = ugsub(text, "([^Ѐ-ӿ])([ЕеЯя])", function(preceding, iotated) return preceding .. iotatedTranslit[iotated] end)

    text = str_gsub(text, UTF8char, tab)

    return text
end

return export
