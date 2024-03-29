local export = {}

local tt = {
    ["а"] = "a",
    ["ӓ"] = "ä",
    ["ӑ"] = "ă",
    ["б"] = "b",
    ["в"] = "w",
    ["г"] = "g",
    ["д"] = "d",
    ["е"] = "e",
    ["ё"] = "ë",
    ["ә"] = "ə",
    ["ӛ"] = "ə̂",
    ["ж"] = "ž",
    ["з"] = "z",
    ["и"] = "i",
    ["і"] = "i",
    ["й"] = "j",
    ["к"] = "k",
    ["к"] = "k",
    ["қ"] = "k̦",
    ["ӄ"] = "ḳ",
    ["л"] = "l",
    ["ӆ"] = "ł",
    ["ԓ"] = "ḷ",
    ["љ"] = "l`",
    ["м"] = "m",
    ["н"] = "n",
    ["ң"] = "n̦",
    ["ӈ"] = "ň",
    ["њ"] = "n`",
    ["о"] = "o",
    ["ӧ"] = "ö",
    ["ө"] = "ô",
    ["ӫ"] = "ő",
    ["п"] = "p",
    ["р"] = "r",
    ["с"] = "s",
    ["ҫ"] = "ş",
    ["т"] = "t",
    ["ҭ"] = "ț",
    ["у"] = "u",
    ["ӱ"] = "ü",
    ["ў"] = "ŭ",
    ["ф"] = "f",
    ["х"] = "x",
    ["ҳ"] = "h̦",
    ["ц"] = "c",
    ["ч"] = "č",
    ["ҷ"] = "c̦",
    ["ш"] = "š",
    ["щ"] = "ŝ",
    ["ъ"] = "”",
    ["ы"] = "y",
    ["ь"] = "’",
    ["э"] = "è",
    ["є"] = "ê",
    ["є̈	"] = "̈ê",
    ["ю"] = "û",
    ["ю̆"] = "̆û",
    ["я"] = "â",
    ["я̆"] = "̆â",
    ["я̈"] = "̈â",
    ["А"] = "A",
    ["Ӓ"] = "Ä",
    ["Ӑ"] = "Ă",
    ["Б"] = "B",
    ["В"] = "W",
    ["Г"] = "G",
    ["Д"] = "D",
    ["Е"] = "E",
    ["Ё"] = "Ë",
    ["Ә"] = "Ə",
    ["Ӛ"] = "Ə̂",
    ["Ж"] = "Ž",
    ["З"] = "Z",
    ["И"] = "I",
    ["І"] = "I",
    ["Й"] = "J",
    ["К"] = "K",
    ["К"] = "K",
    ["Қ"] = "K̦",
    ["Ӄ"] = "Ḳ",
    ["Л"] = "L",
    ["Ӆ"] = "Ł",
    ["Ԓ"] = "Ḷ",
    ["Љ"] = "L`",
    ["М"] = "M",
    ["Н"] = "N",
    ["Ң"] = "N̦",
    ["Ӈ"] = "Ň",
    ["Њ"] = "N`",
    ["О"] = "O",
    ["Ӧ"] = "Ö",
    ["Ө"] = "Ô",
    ["Ӫ"] = "Ő",
    ["П"] = "P",
    ["Р"] = "R",
    ["С"] = "S",
    ["Ҫ"] = "Ş",
    ["Т"] = "T",
    ["Ҭ"] = "Ț",
    ["У"] = "U",
    ["Ӱ"] = "Ü",
    ["Ў"] = "Ŭ",
    ["Ф"] = "F",
    ["Х"] = "X",
    ["Ҳ"] = "H̦",
    ["Ц"] = "C",
    ["Ч"] = "Č",
    ["Ҷ"] = "C̦",
    ["Ш"] = "Š",
    ["Щ"] = "Ŝ",
    ["Ъ"] = "”",
    ["Ы"] = "Y",
    ["Ь"] = "’",
    ["Э"] = "È",
    ["Є"] = "Ê",
    ["Є̈	"] = "̈Ê",
    ["Ю"] = "Û",
    ["Ю̆"] = "̆Û",
    ["Я"] = "Â",
    ["Я̆"] = "̆Â",
    ["Я̈"] = "̈Â"
};

function export.tr(text) return (mw.ustring.gsub(text, ".", tt)) end

return export
