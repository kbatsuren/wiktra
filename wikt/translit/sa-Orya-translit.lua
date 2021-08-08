local export = {}

local consonants = {["କ"] = "k", ["ଖ"] = "kh", ["ଗ"] = "g", ["ଘ"] = "gh", ["ଙ"] = "ṅ", ["ଚ"] = "c", ["ଛ"] = "ch", ["ଜ"] = "j", ["ଝ"] = "jh", ["ଞ"] = "ñ", ["ଟ"] = "ṭ", ["ଠ"] = "ṭh", ["ଡ"] = "ḍ", ["ଢ"] = "ḍh", ["ଣ"] = "ṇ", ["ତ"] = "t", ["ଥ"] = "th", ["ଦ"] = "d", ["ଧ"] = "dh", ["ନ"] = "n", ["ପ"] = "p", ["ଫ"] = "ph", ["ବ"] = "b", ["ଭ"] = "bh", ["ମ"] = "m", ["ଯ"] = "y", ["ୟ"] = "y", ["ର"] = "r", ["ଲ"] = "l", ["ଳ"] = "ḷ", ["ଵ"] = "v", ["ଶ"] = "ś", ["ଷ"] = "ṣ", ["ସ"] = "s", ["ହ"] = "h"}

local diacritics = {["ା"] = "ā", ["ି"] = "i", ["ୀ"] = "ī", ["ୁ"] = "u", ["ୂ"] = "ū", ["ୃ"] = "ṛ", ["ୄ"] = "ṝ", ["ୢ"] = "ḷ", ["ୣ"] = "ḹ", ["େ"] = "e", ["ୈ"] = "ai", ["ୋ"] = "o", ["ୌ"] = "au", ["୍"] = ""}

local tt = {
    -- vowels
    ["ଅ"] = "a",
    ["ଆ"] = "ā",
    ["ଇ"] = "i",
    ["ଈ"] = "ī",
    ["ଉ"] = "u",
    ["ଊ"] = "ū",
    ["ଋ"] = "ṛ",
    ["ୠ"] = "ṝ",
    ["ଌ"] = "ḷ",
    ["ୡ"] = "ḹ",
    ["ଏ"] = "e",
    ["ଐ"] = "ai",
    ["ଓ"] = "o",
    ["ଔ"] = "au",
    -- chandrabindu    
    ["ଁ"] = "m̐", -- until a better method is found
    -- anusvara    
    ["ଂ"] = "ṃ", -- until a better method is found
    -- visarga    
    ["ଃ"] = "ḥ",
    -- avagraha
    ["ଽ"] = "’",
    -- numerals
    ["૦"] = "୦",
    ["૧"] = "୧",
    ["૨"] = "୨",
    ["૩"] = "୩",
    ["૪"] = "୪",
    ["૫"] = "୫",
    ["૬"] = "୬",
    ["૭"] = "୭",
    ["૮"] = "୮",
    ["૯"] = "୯",
    -- punctuation        
    ["॥"] = ".", -- double danda
    ["।"] = ".", -- danda
    -- Vedic extensions
    -- ['ᳵ']='x', ['ᳶ']='f',
    -- Om
    ["ଓମ୍"] = "oṃ",
    -- reconstructed
    ["*"] = ""
}

function export.tr(text, lang, sc)
    text = mw.ustring.gsub(text, "([କଖଗଘଙଚଛଜଝଞଟଠଡଢଣତଥଦଧନପଫବଭମଯୟରଲଳଵଶଷସହ])" .. "([ାିୀୁୂୃୄୢୣେୈୋୌ୍]?)", function(c, d)
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
