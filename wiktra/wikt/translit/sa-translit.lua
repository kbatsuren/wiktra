local export = {}

local consonants = {["क"] = "k", ["ख"] = "kh", ["ग"] = "g", ["घ"] = "gh", ["ङ"] = "ṅ", ["च"] = "c", ["छ"] = "ch", ["ज"] = "j", ["झ"] = "jh", ["ञ"] = "ñ", ["ट"] = "ṭ", ["ठ"] = "ṭh", ["ड"] = "ḍ", ["ढ"] = "ḍh", ["ण"] = "ṇ", ["त"] = "t", ["थ"] = "th", ["द"] = "d", ["ध"] = "dh", ["न"] = "n", ["प"] = "p", ["फ"] = "ph", ["ब"] = "b", ["भ"] = "bh", ["म"] = "m", ["य"] = "y", ["र"] = "r", ["ल"] = "l", ["व"] = "v", ["ळ"] = "ḷ", ["श"] = "ś", ["ष"] = "ṣ", ["स"] = "s", ["ह"] = "h"}

local diacritics = {["ा"] = "ā", ["ि"] = "i", ["ी"] = "ī", ["ु"] = "u", ["ू"] = "ū", ["ृ"] = "ṛ", ["ॄ"] = "ṝ", ["ॢ"] = "ḷ", ["ॣ"] = "ḹ", ["े"] = "e", ["ै"] = "ai", ["ो"] = "o", ["ौ"] = "au", ["्"] = ""}

local tt = {
    -- vowels
    ["अ"] = "a",
    ["आ"] = "ā",
    ["इ"] = "i",
    ["ई"] = "ī",
    ["उ"] = "u",
    ["ऊ"] = "ū",
    ["ऋ"] = "ṛ",
    ["ॠ"] = "ṝ",
    ["ऌ"] = "ḷ",
    ["ॡ"] = "ḹ",
    ["ए"] = "e",
    ["ऐ"] = "ai",
    ["ओ"] = "o",
    ["औ"] = "au",
    -- chandrabindu    
    ["ँ"] = "m̐", -- until a better method is found
    -- anusvara    
    ["ं"] = "ṃ", -- until a better method is found
    -- visarga    
    ["ः"] = "ḥ",
    -- avagraha
    ["ऽ"] = "’",
    -- numerals
    ["०"] = "0",
    ["१"] = "1",
    ["२"] = "2",
    ["३"] = "3",
    ["४"] = "4",
    ["५"] = "5",
    ["६"] = "6",
    ["७"] = "7",
    ["८"] = "8",
    ["९"] = "9",
    -- punctuation        
    ["॥"] = ".", -- double danda
    ["।"] = ".", -- danda
    -- Vedic extensions
    ["ᳵ"] = "x",
    ["ᳶ"] = "f",
    -- Om
    ["ॐ"] = "oṃ",
    -- reconstructed
    ["*"] = "",
    -- accentuation (needs to be handled)
    ["॑"] = "",
    ["॒"] = ""
}

function export.tr(text, lang, sc)
    text = mw.ustring.gsub(text, "([कखगघङचछजझञटठडढणतथदधनपफबभमयरलळवशषसह])" .. "([ािीुूृॄॢॣेैोौ्]?)", function(c, d)
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
