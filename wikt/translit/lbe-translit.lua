local export = {}

local tt = {["б"] = "b", ["п"] = "p", ["ф"] = "f", ["в"] = "w", ["м"] = "m", ["д"] = "d", ["т"] = "t", ["й"] = "y", ["н"] = "n", ["з"] = "z", ["ц"] = "c", ["с"] = "s", ["ж"] = "ž", ["ш"] = "š", ["щ"] = "š:", ["л"] = "l", ["ч"] = "č", ["р"] = "r", ["г"] = "g", ["к"] = "k", ["х"] = "x", ["ъ"] = "ʼ", ["а"] = "a", ["е"] = "e", ["и"] = "i", ["о"] = "o", ["у"] = "u", ["э"] = "e", ["ю"] = "uˤ", ["я"] = "aˤ", ["Б"] = "B", ["П"] = "P", ["Ф"] = "F", ["В"] = "W", ["М"] = "M", ["Д"] = "D", ["Т"] = "T", ["Й"] = "Y", ["Н"] = "N", ["З"] = "Z", ["Ц"] = "C", ["С"] = "S", ["Ж"] = "Ž", ["Ш"] = "Š", ["Щ"] = "Š:", ["Л"] = "L", ["Ч"] = "Č", ["Р"] = "R", ["Г"] = "G", ["К"] = "K", ["Х"] = "X", ["Ъ"] = "ʼ", ["А"] = "A", ["Е"] = "E", ["И"] = "I", ["О"] = "O", ["У"] = "U", ["Э"] = "E", ["Ю"] = "Uˤ", ["Я"] = "Aˤ"};

local tetragraphs = {["хьхь"] = "x̂:", ["Хьхь"] = "X̂:"}

local digraphs = {["пп"] = "p:", ["пӏ"] = "pʼ", ["тт"] = "t:", ["аь"] = "ä", ["оь"] = "oˤ", ["Пп"] = "P:", ["Пӏ"] = "Pʼ", ["Тт"] = "T:", ["Аь"] = "Ä", ["Оь"] = "Oˤ", ["цӏ"] = "cʼ", ["цц"] = "c:", ["тӏ"] = "tʼ", ["сс"] = "s:", ["чч"] = "č:", ["чӏ"] = "čʼ", ["кь"] = "qʼ", ["кк"] = "k:", ["кӏ"] = "kʼ", ["хь"] = "x̂", ["хъ"] = "q", ["къ"] = "q:", ["гъ"] = "ğ", ["хх"] = "x:", ["хӏ"] = "ħ", ["гь"] = "h", ["Цӏ"] = "Cʼ", ["Цц"] = "C:", ["Тӏ"] = "Tʼ", ["Сс"] = "S:", ["Чч"] = "Č:", ["Чӏ"] = "Čʼ", ["Кь"] = "Qʼ", ["Кк"] = "K:", ["Кӏ"] = "Kʼ", ["Хь"] = "X̂", ["Хъ"] = "Q", ["Къ"] = "Q:", ["Гъ"] = "Ğ", ["Хх"] = "X:", ["Хӏ"] = "Ħ", ["Гь"] = "H"}

function export.tr(text, lang, sc)
    local str_gsub = string.gsub
    local UTF8_char = "[%z\1-\127\194-\244][\128-\191]*"

    -- Convert capital to lowercase palochka. Lowercase is found in tables
    -- above.
    text = str_gsub(text, mw.ustring.char(0x4C0), mw.ustring.char(0x4CF))

    for tetragraph, replacement in pairs(tetragraphs) do text = str_gsub(text, tetragraph, replacement) end

    for digraph, replacement in pairs(digraphs) do text = str_gsub(text, digraph, replacement) end

    text = str_gsub(text, UTF8_char, tt)

    return text
end

return export
