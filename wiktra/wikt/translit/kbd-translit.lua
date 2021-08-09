local export = {}

local tt = {["а"] = "ā", ["б"] = "b", ["в"] = "v", ["г"] = "γ", ["д"] = "d", ["е"] = "e", ["ё"] = "ë", ["ж"] = "ž", ["з"] = "z", ["и"] = "i", ["й"] = "j", ["к"] = "k", ["л"] = "l", ["м"] = "m", ["н"] = "n", ["о"] = "o", ["п"] = "p", ["р"] = "r", ["с"] = "s", ["т"] = "t", ["у"] = "w", ["ф"] = "f", ["х"] = "x", ["ц"] = "c", ["ч"] = "č", ["ш"] = "š", ["щ"] = "ŝ", ["ъ"] = "”", ["ы"] = "ə", ["ь"] = "’", ["э"] = "ă", ["ю"] = "ju", ["я"] = "jā", ["ӏ"] = "ʾ", ["А"] = "Ā", ["Б"] = "B", ["В"] = "V", ["Г"] = "Γ", ["Д"] = "D", ["Е"] = "E", ["Ё"] = "Ë", ["Ж"] = "Ž", ["З"] = "Z", ["И"] = "I", ["Й"] = "J", ["К"] = "K", ["Л"] = "L", ["М"] = "M", ["Н"] = "N", ["О"] = "O", ["П"] = "P", ["Р"] = "R", ["С"] = "S", ["Т"] = "T", ["У"] = "W", ["Ф"] = "F", ["Х"] = "X", ["Ц"] = "C", ["Ч"] = "Č", ["Ш"] = "Š", ["Щ"] = "Ŝ", ["Ъ"] = "”", ["Ы"] = "Ə", ["Ь"] = "’", ["Э"] = "Ă", ["Ю"] = "Ju", ["Я"] = "Jā", ["ӏ"] = "ʾ"};

local trigraphs = {["кхъу"] = "q°", ["Кхъу"] = "Q°", ["гъу"] = "ġ°", ["Кхъ"] = "Q", ["кхъ"] = "q", ["къу"] = "q̇°", ["кӏу"] = "ḳ°", ["хъу"] = "χ°"}

local digraphs = {["гу"] = "g°", ["гь"] = "ɡ’", ["гъ"] = "ġ", ["дж"] = "ǯ̍", ["дз"] = "ʒ", ["жъ"] = "ẑ", ["жь"] = "ẑ", ["ку"] = "k°", ["къ"] = "q̇", ["кӏ"] = "č̣̍", ["лъ"] = "ł", ["лӏ"] = "ḷ", ["пӏ"] = "ṗ", ["сӏ"] = "ṣ̣", ["тӏ"] = "ṭ", ["фӏ"] = "f̣", ["ху"] = "x°", ["хъ"] = "χ", ["хь"] = "ḥ", ["цӏ"] = "c̣", ["чу"] = "č̍°", ["щӏ"] = "ṣ̂", ["ӏу"] = "ʾ°", ["Гъу"] = "Ġ°", ["Къу"] = "Q̇°", ["Кӏу"] = "Ḳ°", ["Хъу"] = "Χ°", ["Гу"] = "G°", ["Гь"] = "ɡ’", ["Гъ"] = "Ġ", ["Дж"] = "Ǯ̍", ["Дз"] = "Ʒ", ["Жъ"] = "Ẑ", ["Жь"] = "Ẑ̂", ["Ку"] = "K°", ["Къ"] = "Q̇", ["Кӏ"] = "Č̣̍", ["Лъ"] = "Ł", ["Лӏ"] = "Ḷ", ["Пӏ"] = "Ṗ", ["Сӏ"] = "Ṣ̣", ["Тӏ"] = "Ṭ", ["Фӏ"] = "F̣", ["Ху"] = "X°", ["Хъ"] = "Χ", ["Хь"] = "Ḥ", ["Цӏ"] = "C̣", ["Чу"] = "Č̍°", ["Щӏ"] = "Ṣ̂"}

function export.tr(text)
    local str_gsub = string.gsub
    local UTF8char = "[%z\1-\127\194-\244][\128-\191]*"

    -- Convert uppercase palochka to lowercase. Lowercase is found in tables
    -- above.
    text = str_gsub(text, mw.ustring.char(0x4C0), mw.ustring.char(0x4CF))

    for trigraph, replacement in pairs(trigraphs) do text = str_gsub(text, trigraph, replacement) end

    for digraph, replacement in pairs(digraphs) do text = str_gsub(text, digraph, replacement) end

    text = str_gsub(text, UTF8char, tt)

    return text
end

return export