local export = {}

local digraphs = {
    ["ейка"] = "eyka",
    ["Ейка"] = "Eyka",
    ["эк"] = "ek",
    ["Эк"] = "Ek",
    ["фак"] = "fak",
    ["Фак"] = "Fak",
    ["конт"] = "kont",
    ["Конт"] = "Kont",
    ["кл"] = "kl",
    ["Кл"] = "Kl",
    ["ишк"] = "işk",
    ["Ишк"] = "İşk",
    ["кте"] = "kte",
    ["Кте"] = "Kte",
    ["кре"] = "kre",
    ["Кре"] = "Kre",
    ["гр"] = "gr",
    ["Гр"] = "Gr",
    ["үрк"] = "ürk",
    ["Үрк"] = "Ürk",
    ["эрк"] = "erk",
    ["Эрк"] = "Erk",
    ["ерк"] = "erk",
    ["Ерк"] = "Erk",
    ["ирк"] = "irk",
    ["Ирк"] = "İrk",
    ["көрк"] = "körk",
    ["Көрк"] = "Körk",
    ["күкү"] = "kükü",
    ["Күкү"] = "Kükü",
    ["коф"] = "kof",
    ["Коф"] = "Kof",
    ["курст"] = "kurst",
    ["Курст"] = "Kurst",
    ["ынок"] = "ınok",
    ["Ынок"] = "Inok",
    ["ганд"] = "gand",
    ["Ганд"] = "Gand",
    ["рока"] = "roka",
    ["Рока"] = "Roka",
    ["окси"] = "oksi",
    ["Окси"] = "Oksi",
    ["ика"] = "ika",
    ["Ика"] = "İka",
    ["гог"] = "gog",
    ["Гог"] = "Gog",
    ["ечка"] = "eçka",
    ["Ечка"] = "Eçka",
    ["очка"] = "oçka",
    ["Очка"] = "Oçka",
    ["гор"] = "gor",
    ["Гор"] = "Gor",
    ["фг"] = "fg",
    ["Фг"] = "Fg",
    ["ки"] = "ki",
    ["Ки"] = "Ki",
    ["ик"] = "ik",
    ["Ик"] = "İk",
    ["ке"] = "ke",
    ["Ке"] = "Ke",
    ["ек"] = "ek",
    ["Ек"] = "Ek",
    ["кү"] = "kü",
    ["Кү"] = "Kü",
    ["үк"] = "ük",
    ["Үк"] = "Ük",
    ["кө"] = "kö",
    ["Кө"] = "Kö",
    ["өк"] = "ök",
    ["Өк"] = "Ök",
    ["ги"] = "gi",
    ["Ги"] = "Gi",
    ["иг"] = "ig",
    ["Иг"] = "İg",
    ["ге"] = "ge",
    ["Ге"] = "Ge",
    ["ег"] = "eg",
    ["Ег"] = "Eg",
    ["гү"] = "gü",
    ["Гү"] = "Gü",
    ["үг"] = "üg",
    ["Үг"] = "Üg",
    ["гө"] = "gö",
    ["Гө"] = "Gö",
    ["өг"] = "ög",
    ["Өг"] = "Ög"
}

local tt = {
    ["ү"] = "ü",
    ["Ү"] = "Ü",
    ["т"] = "t",
    ["Т"] = "T",
    ["р"] = "r",
    ["Р"] = "R",
    ["ф"] = "f",
    ["Ф"] = "F",
    ["ө"] = "ö",
    ["Ө"] = "Ö",
    ["ю"] = "yu",
    ["Ю"] = "Yu",
    ["ш"] = "ş",
    ["Ш"] = "Ş",
    ["ь"] = "ʹ",
    ["Ь"] = "ʹ",
    ["ъ"] = "ʺ",
    ["Ъ"] = "ʺ",
    ["н"] = "n",
    ["Н"] = "N",
    ["п"] = "p",
    ["П"] = "P",
    ["й"] = "y",
    ["Й"] = "Y",
    ["л"] = "l",
    ["Л"] = "L",
    ["з"] = "z",
    ["З"] = "Z",
    ["е"] = "e",
    ["Е"] = "E",
    ["г"] = "ğ",
    ["Г"] = "Ğ",
    ["б"] = "b",
    ["Б"] = "B",
    ["у"] = "u",
    ["У"] = "U",
    ["с"] = "s",
    ["С"] = "S",
    ["х"] = "h",
    ["Х"] = "H",
    ["ч"] = "ç",
    ["Ч"] = "Ç",
    ["щ"] = "şç",
    ["Щ"] = "Şç",
    ["я"] = "ya",
    ["Я"] = "Ya",
    ["ы"] = "ı",
    ["Ы"] = "I",
    ["э"] = "e",
    ["Э"] = "E",
    ["м"] = "m",
    ["М"] = "M",
    ["о"] = "o",
    ["О"] = "O",
    ["и"] = "i",
    ["И"] = "İ",
    ["ё"] = "yo",
    ["Ё"] = "Yo",
    ["ж"] = "j",
    ["Ж"] = "J",
    ["к"] = "q",
    ["К"] = "Q",
    ["д"] = "d",
    ["Д"] = "D",
    ["в"] = "v",
    ["В"] = "V",
    ["ц"] = "ts",
    ["Ц"] = "Ts",
    ["а"] = "a",
    ["А"] = "A",
    ["ң"] = "ñ",
    ["Ң"] = "Ñ"
};

function export.tr(text, lang, sc)
    if sc == "Arab" then return nil end

    for digraph, replacement in pairs(digraphs) do text = mw.ustring.gsub(text, digraph, replacement) end

    text = mw.ustring.gsub(text, "([АОӨӘУЫЕЯЁЮИЕаоөәуыэяёюиеъь%A][́̀]?)([Ее])", function(a, e) return a .. (e == "е" and "ye" or "Ye") end):gsub("^Е", "Ye"):gsub("^е", "ye");

    return (mw.ustring.gsub(text, ".", tt))
end

return export
