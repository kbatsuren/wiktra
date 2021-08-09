local export = {}

local consonants = {["ক"] = "k", ["খ"] = "kh", ["গ"] = "g", ["ঘ"] = "gh", ["ঙ"] = "ṅ", ["চ"] = "c", ["ছ"] = "ch", ["জ"] = "j", ["ঝ"] = "jh", ["ঞ"] = "ñ", ["ট"] = "ṭ", ["ঠ"] = "ṭh", ["ড"] = "ḍ", ["ঢ"] = "ḍh", ["ণ"] = "ṇ", ["ত"] = "t", ["থ"] = "th", ["দ"] = "d", ["ধ"] = "dh", ["ন"] = "n", ["প"] = "p", ["ফ"] = "ph", ["ব"] = "b", ["ভ"] = "bh", ["ম"] = "m", ["য"] = "j", ["ৰ"] = "r", ["ল"] = "l", ["ৱ"] = "w", ["শ"] = "ś", ["ষ"] = "ṣ", ["স"] = "s", ["হ"] = "h", ["ড়"] = "ṛ", ["ঢ়"] = "ṛh", ["য়"] = "y", ["ক্ষ"] = "khy"}

local diacritics = {["া"] = "a", ["ি"] = "i", ["ী"] = "ī", ["ু"] = "u", ["ূ"] = "ū", ["ৃ"] = "ṛ", ["ৄ"] = "ṝ", ["ৢ"] = "ḷ", ["ৣ"] = "ḹ", ["ে"] = "e", ["ৈ"] = "oi", ["ো"] = "ö", ["ৌ"] = "ou", ["্"] = ""}

local tt = {
    -- vowels
    ["অ"] = "o",
    ["আ"] = "a",
    ["ই"] = "i",
    ["ঈ"] = "ī",
    ["উ"] = "u",
    ["ঊ"] = "ū",
    ["ঋ"] = "ṛ",
    ["ৠ"] = "ṝ",
    ["ঌ"] = "ḷ",
    ["ৡ"] = "ḹ",
    ["এ"] = "e",
    ["ঐ"] = "oi",
    ["ও"] = "ö",
    ["ঔ"] = "ou",
    -- chandrabindu    
    ["ঁ"] = "̐", -- until a better method is found
    -- anusvara    
    ["ং"] = "ṅ", -- until a better method is found
    -- visarga    
    ["ঃ"] = "ḥ",
    -- avagraha
    ["ঽ"] = "’",
    --
    ["ৎ"] = "t",
    -- numerals
    ["০"] = "0",
    ["১"] = "1",
    ["২"] = "2",
    ["৩"] = "3",
    ["৪"] = "4",
    ["৫"] = "5",
    ["৬"] = "6",
    ["৭"] = "7",
    ["৮"] = "8",
    ["৯"] = "9",
    -- punctuation        
    ["॥"] = ".", -- double danda
    ["।"] = ",",
    -- reconstructed
    ["*"] = ""
}

function export.tr(text, lang, sc)
    text = mw.ustring.gsub(text, "([কখগঘঙচছজঝঞটঠডঢণতথদধনপফবভমযৰলৱশষসহ]়?)" .. "([ািীুূৃৄৢৣেৈোৌ্]?)", function(c, d)
        if d == "" then
            return consonants[c] .. "o"
        else
            return consonants[c] .. diacritics[d]
        end
    end)

    text = mw.ustring.gsub(text, ".", tt)

    return text
end

return export
