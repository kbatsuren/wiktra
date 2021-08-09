local export = {}

local mapping1 = {["п"] = "p", ["б"] = "b", ["т"] = "t", ["д"] = "d", ["к"] = "k", ["г"] = "g", ["ц"] = "c", ["ч"] = "č", ["с"] = "s", ["з"] = "z", ["ш"] = "š", ["ж"] = "ž", ["х"] = "x", ["м"] = "m", ["н"] = "n", ["р"] = "r", ["л"] = "l", ["в"] = "v", ["й"] = "y", ["и"] = "i", ["е"] = "e", ["э"] = "e", ["а"] = "a", ["о"] = "o", ["у"] = "u", ["ъ"] = "ʾ"}

local mapping2 = {["пӏ"] = "p’", ["тӏ"] = "t’", ["кӏ"] = "k’", ["къ"] = "q’", ["цӏ"] = "c’", ["лӏ"] = "ƛ", ["кь"] = "ƛ’", ["чӏ"] = "č’", ["хъ"] = "q", ["лъ"] = "λ", ["гъ"] = "ġ", ["хӏ"] = "ḥ", ["гӏ"] = "a̯", ["гь"] = "h", ["аь"] = "ä", ["аӏ"] = "aʿ", ["еӏ"] = "eʿ", ["иӏ"] = "iʿ", ["оӏ"] = "oʿ", ["уӏ"] = "uʿ"}

function export.tr(text, lang, sc)
    local str_gsub = string.gsub
    local UTF8_char = "[%z\1-\127\194-\244][\128-\191]*"

    -- Convert capital to lowercase palochka.
    text = str_gsub(text, mw.ustring.char(0x4C0), mw.ustring.char(0x4CF))

    for pat, repl in pairs(mapping2) do text = str_gsub(text, pat, repl) end
    text = str_gsub(text, UTF8_char, mapping1)

    return text
end

return export
