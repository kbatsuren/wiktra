local export = {}

local consonants = {["ಕ"] = "k", ["ಖ"] = "kh", ["ಗ"] = "g", ["ಘ"] = "gh", ["ಙ"] = "ṅ", ["ಚ"] = "c", ["ಛ"] = "ch", ["ಜ"] = "j", ["ಝ"] = "jh", ["ಞ"] = "ñ", ["ಟ"] = "ṭ", ["ಠ"] = "ṭh", ["ಡ"] = "ḍ", ["ಢ"] = "ḍh", ["ಣ"] = "ṇ", ["ತ"] = "t", ["ಥ"] = "th", ["ದ"] = "d", ["ಧ"] = "dh", ["ನ"] = "n", ["ಪ"] = "p", ["ಫ"] = "ph", ["ಬ"] = "b", ["ಭ"] = "bh", ["ಮ"] = "m", ["ಯ"] = "y", ["ರ"] = "r", ["ಲ"] = "l", ["ವ"] = "v", ["ಳ"] = "ḷ", ["ಶ"] = "ś", ["ಷ"] = "ṣ", ["ಸ"] = "s", ["ಹ"] = "h"}

local diacritics = {["ಾ"] = "ā", ["ಿ"] = "i", ["ೀ"] = "ī", ["ು"] = "u", ["ೂ"] = "ū", ["ೃ"] = "ṛ", ["ೄ"] = "ṝ", ["ೢ"] = "ḷ", ["ೣ"] = "ḹ", ["ೇ"] = "e", ["ೈ"] = "ai", ["ೋ"] = "o", ["ೌ"] = "au", ["್"] = ""}

local tt = {
    -- vowels
    ["ಅ"] = "a",
    ["ಆ"] = "ā",
    ["ಇ"] = "i",
    ["ಈ"] = "ī",
    ["ಉ"] = "u",
    ["ಊ"] = "ū",
    ["ಋ"] = "ṛ",
    ["ೠ"] = "ṝ",
    ["ಌ"] = "ḷ",
    ["ೡ"] = "ḹ",
    ["ಏ"] = "e",
    ["ಐ"] = "ai",
    ["ಓ"] = "o",
    ["ಔ"] = "au",
    -- chandrabindu    
    ["ಁ"] = "m̐", -- until a better method is found
    -- anusvara    
    ["ಂ"] = "ṃ", -- until a better method is found
    -- visarga    
    ["ಃ"] = "ḥ",
    -- avagraha
    ["ಽ"] = "’",
    -- numerals
    ["೦"] = "0",
    ["೧"] = "1",
    ["೨"] = "2",
    ["೩"] = "3",
    ["೪"] = "4",
    ["೫"] = "5",
    ["೬"] = "6",
    ["೭"] = "7",
    ["೮"] = "8",
    ["೯"] = "9",
    -- punctuation        
    ["॥"] = ".", -- double danda
    ["।"] = ".", -- danda
    -- Vedic extensions
    ["ೱ"] = "x",
    ["ೲ"] = "f",
    -- Om
    ["ಓಂ"] = "oṃ",
    -- reconstructed
    ["*"] = ""
}

function export.tr(text, lang, sc)
    text = mw.ustring.gsub(text, "([ಕಖಗಘಙಚಛಜಝಞಟಠಡಢಣತಥದಧನಪಫಬಭಮಯರಲವಳಶಷಸಹ])" .. "([ಾಿೀುೂೃೄೢೣೇೈೋೌ್]?)", function(c, d)
        if d == "" then
            return consonants[c] .. "a"
        else
            return consonants[c] .. diacritics[d]
        end
    end)

    text = mw.ustring.gsub(text, ".", tt)

    return text
end

return export
