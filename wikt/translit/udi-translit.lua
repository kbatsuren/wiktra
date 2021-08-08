local export = {}

local tt = {["б"] = "b", ["п"] = "p", ["в"] = "v", ["ф"] = "f", ["м"] = "m", ["б"] = "b", ["д"] = "d", ["т"] = "t", ["ц"] = "c", ["з"] = "z", ["с"] = "s", ["н"] = "n", ["л"] = "l", ["ч"] = "č", ["ж"] = "ž", ["ш"] = "š", ["р"] = "r", ["г"] = "g", ["к"] = "k", ["х"] = "χ", ["й"] = "j", ["и"] = "i", ["у"] = "u", ["е"] = "e", ["о"] = "o", ["а"] = "a", ["ы"] = "ə", ["ҝ"] = "gʲ"};

local trigraphs = {["джъ"] = "ǯ:", ["джӏ"] = "ǯ:", ["чӏъ"] = "č̣:"}
local digraphs = {["пӏ"] = "ṗ", ["тӏ"] = "ṭ", ["дз"] = "ʒ", ["цӏ"] = "c̣", ["дж"] = "ǯ", ["чӏ"] = "č̣", ["чъ"] = "č:", ["жъ"] = "ž:", ["жӏ"] = "ž:", ["шъ"] = "š:", ["шӏ"] = "š:", ["кӏ"] = "ḳ", ["гъ"] = "ɣ", ["къ"] = "q̇", ["хъ"] = "q", ["гь"] = "h", ["уь"] = "ü", ["оь"] = "ö", ["аь"] = "ä", ["иӏ"] = "i̱", ["иъ"] = "i̱", ["уӏ"] = "u̱", ["уъ"] = "u̱", ["еӏ"] = "e̱", ["еъ"] = "e̱", ["оӏ"] = "o̱", ["оъ"] = "o̱", ["аӏ"] = "a̱", ["аъ"] = "a̱", ["ыъ"] = "ə̱"}

function export.tr(text, lang, sc)
    if sc ~= "Cyrl" then return nil end

    local str_gsub = string.gsub
    local UTF8_char = "[%z\1-\127\194-\244][\128-\191]*"

    -- Convert capital to lowercase palochka. Lowercase is found in tables
    -- above.
    text = str_gsub(text, mw.ustring.char(0x4C0), mw.ustring.char(0x4CF))

    for trigraph, translit in pairs(trigraphs) do text = str_gsub(text, trigraph, translit) end

    for digraph, translit in pairs(digraphs) do text = str_gsub(text, digraph, translit) end

    text = str_gsub(text, UTF8_char, tt)

    return text
end

return export
