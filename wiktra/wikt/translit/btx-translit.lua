local export = {}

local consonants = {["ᯀ"] = "(h)", ["ᯂ"] = "k", ["ᯅ"] = "b", ["ᯇ"] = "p", ["ᯉ"] = "n", ["ᯋ"] = "w", ["ᯎ"] = "g", ["ᯐ"] = "j", ["ᯑ"] = "d", ["ᯒ"] = "r", ["ᯔ"] = "m", ["ᯗ"] = "t", ["ᯘ"] = "s", ["ᯛ"] = "y", ["ᯝ"] = "ng", ["ᯞ"] = "l", ["ᯠ"] = "c", ["ᯡ"] = "c"}

local diacritics = {["ᯧ"] = "e", ["ᯩ"] = "e", ["ᯪ"] = "i", ["ᯫ"] = "i", ["ᯨ"] = "o", ["ᯭ"] = "o", ["ᯬ"] = "u", ["᯳"] = ""}

local nonconsonants = {
    -- vowels
    ["ᯤ"] = "i",
    ["ᯥ"] = "u",
    -- aditional characters
    ["ᯰ"] = "ng",
    ["ᯱ"] = "h"
}

-- translit any words or phrases
function export.tr(text, lang, sc)
    text = mw.ustring.gsub(text, "([ᯀᯂᯅᯇᯉᯋᯎᯐᯑᯒᯔᯗᯘᯛᯝᯞᯠᯡ])" .. "([ᯧᯩᯪᯫᯨᯭᯬ᯳]?)", function(c, d)
        if d == "" then
            return consonants[c] .. "a"
        else
            return consonants[c] .. diacritics[d]
        end
    end)
    text = mw.ustring.gsub(text, ".", nonconsonants)

    return text
end

return export
