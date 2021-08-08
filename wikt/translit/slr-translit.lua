local export = {}

local data = {}

data["slr-Arab"] = {
    -- consonants
    ["م"] = "m",
    ["ن"] = "n",
    ["د"] = "d",
    ["ت"] = "t",
    ["ب"] = "b",
    ["پ"] = "p",
    ["ف"] = "f",
    ["ق"] = "q",
    ["ك"] = "k",
    ["ڭ"] = "ñ",
    ["گ"] = "g",
    ["غ"] = "ġ",
    ["ع"] = "ğ",
    ["ھ"] = "h",
    ["خ"] = "x",
    ["چ"] = "č",
    ["ج"] = "ǧ",
    ["ژ"] = "ž",
    ["ز"] = "z",
    ["س"] = "s",
    ["ش"] = "š",
    ["ر"] = "r",
    ["ل"] = "l",
    ["وْ"] = "u",
    ["ي"] = "y",
    ["ۋ"] = "w",
    -- vowels
    ["ا"] = "a",
    ["ە"] = "e",
    ["ې"] = "ë",
    ["ى"] = "i",
    ["و"] = "o",
    ["ۆ"] = "ö",
    ["ۇ"] = "u",
    ["ۈ"] = "ü",
    -- punctuation
    ["؟"] = "?",
    ["،"] = ",",
    ["؛"] = ";"
}

function export.tr(text, lang, sc)
    if not data[sc] then return nil end

    -- remove initial hamza
    text = mw.ustring.gsub(text, "^\216\166(.)", "%1")
    text = mw.ustring.gsub(text, "%s\216\166(.)", " %1")

    -- transliterate letters one to one
    text = mw.ustring.gsub(text, ".", data[sc])

    return text
end

return export
