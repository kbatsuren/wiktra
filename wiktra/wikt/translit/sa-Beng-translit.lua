local export = {}

local consonants = {["ক"] = "k", ["খ"] = "kh", ["গ"] = "g", ["ঘ"] = "gh", ["ঙ"] = "ṅ", ["চ"] = "c", ["ছ"] = "ch", ["জ"] = "j", ["ঝ"] = "jh", ["ঞ"] = "ñ", ["ট"] = "ṭ", ["ঠ"] = "ṭh", ["ড"] = "ḍ", ["ঢ"] = "ḍh", ["ণ"] = "ṇ", ["ত"] = "t", ["থ"] = "th", ["দ"] = "d", ["ধ"] = "dh", ["ন"] = "n", ["প"] = "p", ["ফ"] = "ph", ["ব"] = "b", ["ভ"] = "bh", ["ম"] = "m", ["য"] = "y", ["য়"] = "y", ["ৰ"] = "r", ["র"] = "r", ["ল"] = "l", ["ল়"] = "ḷ", ["ৱ"] = "v", ["শ"] = "ś", ["ষ"] = "ṣ", ["স"] = "s", ["হ"] = "h"}

local diacritics = {["া"] = "ā", ["ি"] = "i", ["ী"] = "ī", ["ু"] = "u", ["ূ"] = "ū", ["ৃ"] = "ṛ", ["ৄ"] = "ṝ", ["ৢ"] = "ḷ", ["ৣ"] = "ḹ", ["ে"] = "e", ["ৈ"] = "ai", ["ো"] = "o", ["ৌ"] = "au", ["্"] = ""}

local tt = {
    -- vowels
    ["অ"] = "a",
    ["আ"] = "ā",
    ["ই"] = "i",
    ["ঈ"] = "ī",
    ["উ"] = "u",
    ["ঊ"] = "ū",
    ["ঋ"] = "ṛ",
    ["ৠ"] = "ṝ",
    ["ঌ"] = "ḷ",
    ["ৡ"] = "ḹ",
    ["এ"] = "e",
    ["ঐ"] = "ai",
    ["ও"] = "o",
    ["ঔ"] = "au",
    -- chandrabindu    
    ["ঁ"] = "m̐", -- until a better method is found
    -- anusvara    
    ["ং"] = "ṃ", -- until a better method is found
    -- visarga    
    ["ঃ"] = "ḥ",
    --     
    ["ৎ"] = "t",
    -- avagraha
    ["ঽ"] = "’",
    -- numerals
    ["૦"] = "০",
    ["૧"] = "১",
    ["૨"] = "২",
    ["૩"] = "৩",
    ["૪"] = "৪",
    ["૫"] = "৫",
    ["૬"] = "৬",
    ["૭"] = "৭",
    ["૮"] = "৮",
    ["૯"] = "৯",
    -- punctuation        
    ["॥"] = ".", -- double danda
    ["।"] = ".", -- danda
    -- Vedic extensions
    -- ['ᳵ']='x', ['ᳶ']='f',
    -- Om
    ["ওঁ"] = "oṃ",
    -- reconstructed
    ["*"] = ""
}

function export.tr(text, lang, sc)
    text = mw.ustring.gsub(text, "([কখগঘঙচছজঝঞটঠডঢণতথদধনপফবভমযৰরলৱশষসহ]়?)" .. -- য় and ল় are composition exclusions!
    "([ািীুূৃৄৢৣেৈোৌ্]?)", function(c, d)
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
