local export = {}

local AC = mw.ustring.char(0x0301) -- acute =  ́

local rsubn = mw.ustring.gsub

-- version of rsubn() that discards all but the first return value
local function rsub(term, foo, bar)
    local retval = rsubn(term, foo, bar)
    return retval
end

local tt = {
    ["А"] = "A",
    ["а"] = "a",
    ["Б"] = "B",
    ["б"] = "b",
    ["В"] = "V",
    ["в"] = "v",
    ["Г"] = "H",
    ["г"] = "h",
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
    ["І"] = "I",
    ["і"] = "i",
    ["И"] = "I",
    ["и"] = "i", -- present for Old Belarusian; FIXME, remove when we have a separate language code for this lang
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
    ["Ў"] = "Ŭ",
    ["ў"] = "ŭ",
    ["Ф"] = "F",
    ["ф"] = "f",
    ["Х"] = "X",
    ["х"] = "x",
    ["Ц"] = "C",
    ["ц"] = "c",
    ["Ч"] = "Č",
    ["ч"] = "č",
    ["Ш"] = "Š",
    ["ш"] = "š",
    ["Ы"] = "Y",
    ["ы"] = "y",
    ["Ь"] = "ʹ",
    ["ь"] = "ʹ",
    ["Э"] = "E",
    ["э"] = "e",
    ["Ю"] = "Ju",
    ["ю"] = "ju",
    ["Я"] = "Ja",
    ["я"] = "ja",
    ["’"] = "ʺ",
    ["ʼ"] = "ʺ",
    -- currently non-standard, used in some older norms
    ["Ґ"] = "G",
    ["ґ"] = "g",
    -- Belarusian style quotes
    ["«"] = "“",
    ["»"] = "”"
};

local unstressed_vowels = "aeiyuAEIYU"
local unstressed_vowel = "[" .. unstressed_vowels .. "]"

local acute_decomposer = {["á"] = "a" .. AC, ["é"] = "e" .. AC, ["í"] = "i" .. AC, ["ó"] = "o" .. AC, ["ú"] = "u" .. AC, ["ý"] = "y" .. AC, ["Á"] = "A" .. AC, ["É"] = "E" .. AC, ["Í"] = "I" .. AC, ["Ó"] = "O" .. AC, ["Ú"] = "U" .. AC, ["Ý"] = "Y" .. AC}

function export.tr(text, lang, sc)
    text = mw.ustring.gsub(text, "'+", {["'"] = "ʺ"}) -- neutral apostrophe
    text = mw.ustring.gsub(text, ".", tt)

    -- Mark word boundaries
    text = mw.ustring.gsub(text, "(%s+)", "#%1#")
    text = "#" .. text .. "#"

    -- Mark stress on <o>
    text = mw.ustring.gsub(text, "(#[^#Oo" .. AC .. "]*)([Oo])([^#Oo" .. AC .. "]*" .. unstressed_vowel .. "[^#Oo" .. AC .. "]*#)", "%1%2" .. AC .. "%3")
    text = mw.ustring.gsub(text, "(#[^#Oo" .. AC .. "]*" .. unstressed_vowel .. "[^#Oo" .. AC .. "]*)([Oo])([^#Oo" .. AC .. "]*#)", "%1%2" .. AC .. "%3")

    -- Strip hashes
    text = mw.ustring.gsub(text, "#", "")

    return text
end

function export.reverse_tr(text) -- reverse-translit any words or phrases
    local reverse_tt = {}
    for k, v in pairs(tt) do reverse_tt[v] = k end
    reverse_tt["ʺ"] = "'"
    reverse_tt["ʹ"] = "ь"
    reverse_tt["i"] = "і"
    reverse_tt["I"] = "І"
    text = rsub(text, ".", acute_decomposer)
    text = rsub(text, "[Jj][aeou]", reverse_tt)
    text = rsub(text, ".", reverse_tt)
    return text
end

return export
