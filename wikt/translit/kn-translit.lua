local export = {}

local consonants = {["ಕ"] = "k", ["ಖ"] = "kh", ["ಗ"] = "g", ["ಘ"] = "gh", ["ಙ"] = "ṅ", ["ಚ"] = "c", ["ಛ"] = "ch", ["ಜ"] = "j", ["ಝ"] = "jh", ["ಞ"] = "ñ", ["ಟ"] = "ṭ", ["ಠ"] = "ṭh", ["ಡ"] = "ḍ", ["ಢ"] = "ḍh", ["ಣ"] = "ṇ", ["ತ"] = "t", ["ಥ"] = "th", ["ದ"] = "d", ["ಧ"] = "dh", ["ನ"] = "n", ["ಪ"] = "p", ["ಫ"] = "ph", ["ಬ"] = "b", ["ಭ"] = "bh", ["ಮ"] = "m", ["ಯ"] = "y", ["ರ"] = "r", ["ಱ"] = "ṟ", ["ಲ"] = "l", ["ವ"] = "v", ["ಶ"] = "ś", ["ಷ"] = "ṣ", ["ಸ"] = "s", ["ಹ"] = "h", ["ಳ"] = "ḷ", ["ೞ"] = "ḻ", ["ಫ಼"] = "f", ["ಜ಼"] = "z", ["ಳ಼"] = "zh"}

local diacritics = {["ಾ"] = "ā", ["ಿ"] = "i", ["ೀ"] = "ī", ["ು"] = "u", ["ೂ"] = "ū", ["ೃ"] = "ṛ", ["ೄ"] = "r̥̄", ["ೆ"] = "e", ["ೇ"] = "ē", ["ೈ"] = "ai", ["ೊ"] = "o", ["ೋ"] = "ō", ["ೌ"] = "au"}

local nonconsonants = {
    -- vowels
    ["ಅ"] = "a",
    ["ಆ"] = "ā",
    ["ಇ"] = "i",
    ["ಈ"] = "ī",
    ["ಉ"] = "u",
    ["ಊ"] = "ū",
    ["ಋ"] = "ṛ",
    ["ೠ"] = "r̥̄",
    ["ಌ"] = "l̥",
    ["ೡ"] = "l̥̄",
    ["ಎ"] = "e",
    ["ಏ"] = "ē",
    ["ಐ"] = "ai",
    ["ಒ"] = "o",
    ["ಓ"] = "ō",
    ["ಔ"] = "au",
    ["ಅಂ"] = "aṃ",
    ["ಅಃ"] = "ah",
    -- other symbols
    ["ಂ"] = "ṃ", -- anusvara
    ["ಃ"] = "ḥ", -- visarga
    -- halant, supresses the inherent vowel "a"
    ["್"] = "",
    -- digits
    ["೦"] = "0",
    ["೧"] = "1",
    ["೨"] = "2",
    ["೩"] = "3",
    ["೪"] = "4",
    ["೫"] = "5",
    ["೬"] = "6",
    ["೭"] = "7",
    ["೮"] = "8",
    ["೯"] = "9"
}

-- translit any words or phrases
function export.tr(text, lang, sc)
    text = mw.ustring.gsub(text, "([ಕಖಗಘಙಚಛಜಝಞಟಠಡಢಣತಥದಧನಪಫಬಭಮಯರಱಲವಶಷಸಹಳೞಕಖ][಼]?)" .. "([ಾಿೀುೂೃೆೇೈೊೋೌ್]?)", function(c, d)
        -- mw.log('match', c, d)
        c = consonants[c] or c
        if d == "" then
            return c .. "a"
        else
            return c .. (diacritics[d] or d)
        end
    end)

    text = mw.ustring.gsub(text, ".", nonconsonants)

    -- anusvara
    text = mw.ustring.gsub(text, "ṃ([kgṅ])", "ṅ%1")
    text = mw.ustring.gsub(text, "ṃ([cjñ])", "ñ%1")
    text = mw.ustring.gsub(text, "ṃ([ṭḍṇ])", "ṇ%1")
    text = mw.ustring.gsub(text, "ṃ([tdn])", "n%1")
    text = mw.ustring.gsub(text, "ṃ([pbm])", "m%1")

    return text
end

return export
