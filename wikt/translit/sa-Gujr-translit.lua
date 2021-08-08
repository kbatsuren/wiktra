local export = {}

local consonants = {["ક"] = "k", ["ખ"] = "kh", ["ગ"] = "g", ["ઘ"] = "gh", ["ઙ"] = "ṅ", ["ચ"] = "c", ["છ"] = "ch", ["જ"] = "j", ["ઝ"] = "jh", ["ઞ"] = "ñ", ["ટ"] = "ṭ", ["ઠ"] = "ṭh", ["ડ"] = "ḍ", ["ઢ"] = "ḍh", ["ણ"] = "ṇ", ["ત"] = "t", ["થ"] = "th", ["દ"] = "d", ["ધ"] = "dh", ["ન"] = "n", ["પ"] = "p", ["ફ"] = "ph", ["બ"] = "b", ["ભ"] = "bh", ["મ"] = "m", ["ય"] = "y", ["ર"] = "r", ["લ"] = "l", ["વ"] = "v", ["ળ"] = "ḷ", ["શ"] = "ś", ["ષ"] = "ṣ", ["સ"] = "s", ["હ"] = "h"}

local diacritics = {["ા"] = "ā", ["િ"] = "i", ["ી"] = "ī", ["ુ"] = "u", ["ૂ"] = "ū", ["ૃ"] = "ṛ", ["ૄ"] = "ṝ", ["ૢ"] = "ḷ", ["ૣ"] = "ḹ", ["ે"] = "e", ["ૈ"] = "ai", ["ો"] = "o", ["ૌ"] = "au", ["્"] = ""}

local tt = {
    -- vowels
    ["અ"] = "a",
    ["આ"] = "ā",
    ["ઇ"] = "i",
    ["ઈ"] = "ī",
    ["ઉ"] = "u",
    ["ઊ"] = "ū",
    ["ઋ"] = "ṛ",
    ["ૠ"] = "ṝ",
    ["ઌ"] = "ḷ",
    ["ૡ"] = "ḹ",
    ["એ"] = "e",
    ["ઐ"] = "ai",
    ["ઓ"] = "o",
    ["ઔ"] = "au",
    -- chandrabindu    
    ["ઁ"] = "m̐", -- until a better method is found
    -- anusvara    
    ["ં"] = "ṃ", -- until a better method is found
    -- visarga    
    ["ઃ"] = "ḥ",
    -- avagraha
    ["ઽ"] = "’",
    -- numerals
    ["૦"] = "0",
    ["૧"] = "1",
    ["૨"] = "2",
    ["૩"] = "3",
    ["૪"] = "4",
    ["૫"] = "5",
    ["૬"] = "6",
    ["૭"] = "7",
    ["૮"] = "8",
    ["૯"] = "9",
    -- punctuation        
    ["॥"] = ".", -- double danda
    ["।"] = ".", -- danda
    -- Vedic extensions
    ["ᳵ"] = "x",
    ["ᳶ"] = "f",
    -- Om
    ["ૐ"] = "oṃ",
    -- reconstructed
    ["*"] = ""
}

function export.tr(text, lang, sc)
    text = mw.ustring.gsub(text, "([કખગઘઙચછજઝઞટઠડઢણતથદધનપફબભમયરલવળશષસહ])" .. "([ાિીુૂૃૄૢૣેૈોૌ્]?)", function(c, d)
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
