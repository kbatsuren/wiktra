local export = {}

local consonants = {["க"] = "k", ["ங"] = "ṅ", ["ச"] = "c", ["ஞ"] = "ñ", ["ட"] = "ṭ", ["ண"] = "ṇ", ["த"] = "t", ["ந"] = "n", ["ப"] = "p", ["ம"] = "m", ["ய"] = "y", ["ர"] = "r", ["ல"] = "l", ["வ"] = "v", ["ழ"] = "ḻ", ["ள"] = "ḷ", ["ற"] = "ṟ", ["ன"] = "ṉ", ["ஶ"] = "ś", ["ஜ"] = "j", ["ஷ"] = "ṣ", ["ஸ"] = "s", ["ஹ"] = "h", ["ஃப"] = "f", ["ஃஜ"] = "z", ["ஃஸ"] = "x", ["ஃ"] = "ḥ"}

local diacritics = {
    ["ா"] = "ā",
    ["ி"] = "i",
    ["ீ"] = "ī",
    ["ு"] = "u",
    ["ூ"] = "ū",
    ["ெ"] = "e",
    ["ே"] = "ē",
    ["ை"] = "ai",
    ["ொ"] = "o",
    ["ோ"] = "ō",
    ["ௌ"] = "au",
    ["்"] = "", -- halant, supresses the inherent vowel "a"
    -- no diacritic
    [""] = "a"
}

local nonconsonants = {
    -- vowels
    ["அ"] = "’a",
    ["ஆ"] = "’ā",
    ["இ"] = "’i",
    ["ஈ"] = "’ī",
    ["உ"] = "’u",
    ["ஊ"] = "’ū",
    ["எ"] = "’e",
    ["ஏ"] = "’ē",
    ["ஐ"] = "’ai",
    ["ஒ"] = "’o",
    ["ஓ"] = "’ō",
    ["ஔ"] = "’au"
    -- other symbols
    --	['ஃ']='' ,
}

-- translit any words or phrases
function export.tr(text, lang, sc)
    text = mw.ustring.gsub(text, "(ஃ?)([க-ஹ])([ா-்]?)", function(h, c, d) return (consonants[h .. c] or consonants[h] .. (consonants[c] or c)) .. diacritics[d] end)

    text = mw.ustring.gsub(text, "[அ-ஔ]", nonconsonants)

    text = mw.ustring.gsub(text, "^’", "")
    text = mw.ustring.gsub(text, "([%s%p])’", "%1")

    return text
end

return export
