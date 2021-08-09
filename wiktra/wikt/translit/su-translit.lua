local export = {}

local consonants = {["ᮊ"] = "k", ["ᮌ"] = "g", ["ᮍ"] = "ng", ["ᮎ"] = "c", ["ᮏ"] = "j", ["ᮑ"] = "ny", ["ᮒ"] = "t", ["ᮓ"] = "d", ["ᮔ"] = "n", ["ᮕ"] = "p", ["ᮘ"] = "b", ["ᮙ"] = "m", ["ᮚ"] = "y", ["ᮛ"] = "r", ["ᮜ"] = "l", ["ᮝ"] = "w", ["ᮞ"] = "s", ["ᮠ"] = "h", ["ᮖ"] = "f", ["ᮋ"] = "q", ["ᮗ"] = "v", ["ᮟ"] = "x", ["ᮐ"] = "z", ["ᮮ"] = "kh", ["ᮯ"] = "sy"}

local diacritics = {["ᮤ"] = "i", ["ᮥ"] = "u", ["ᮦ"] = "é", ["ᮧ"] = "o", ["ᮨ"] = "e", ["ᮩ"] = "eu", ["ᮺ"] = "-a", ["᮫"] = "", ["᮪"] = ""}

local special = {["ᮬ"] = "m", ["ᮭ"] = "w", ["ᮡ"] = "y", ["ᮢ"] = "r", ["ᮣ"] = "l"}

local nonconsonants = {
    -- vowels
    ["ᮃ"] = "a",
    ["ᮆ"] = "é",
    ["ᮄ"] = "i",
    ["ᮇ"] = "o",
    ["ᮅ"] = "u",
    ["ᮈ"] = "e",
    ["ᮉ"] = "eu",
    ["ᮻ"] = "reu",
    ["ᮼ"] = "leu",
    -- aditional characters
    ["|"] = "", -- digit pipe bar
    ["ᮀ"] = "ng",
    ["ᮁ"] = "r",
    ["ᮂ"] = "h",
    ["ᮾ"] = "k",
    ["ᮿ"] = "m",
    -- digits
    ["᮰"] = "0",
    ["᮱"] = "1",
    ["᮲"] = "2",
    ["᮳"] = "3",
    ["᮴"] = "4",
    ["᮵"] = "5",
    ["᮶"] = "6",
    ["᮷"] = "7",
    ["᮸"] = "8",
    ["᮹"] = "9"
}

-- translit any words or phrases
function export.tr(text, lang, sc)
    text = mw.ustring.gsub(text, "([ᮊᮌᮍᮎᮏᮑᮒᮓᮔᮕᮘᮙᮚᮛᮜᮝᮞᮠᮖᮋᮗᮟᮐᮮᮯ])" .. "([ᮬᮭᮡᮢᮣ]?)" .. "([ᮤᮥᮦᮧᮨᮩᮺ ᮫᮪]?)", function(c, s, d)
        if s == "" then
            if d == "" then
                return consonants[c] .. "a"
            else
                return consonants[c] .. (diacritics[d] or d)
            end
        else
            if d == "" then
                return consonants[c] .. (special[s] or s) .. "a"
            else
                return consonants[c] .. (special[s] or s) .. (diacritics[d] or d)
            end
        end
    end)

    text = mw.ustring.gsub(text, ".", nonconsonants)

    return text
end

return export
