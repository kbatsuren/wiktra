local export = {}

local consonants = {["ক"] = "k", ["খ"] = "kh", ["গ"] = "g", ["ঘ"] = "gh", ["ঙ"] = "ṅ", ["চ"] = "c", ["ছ"] = "ch", ["জ"] = "j", ["ঝ"] = "jh", ["ঞ"] = "ñ", ["ট"] = "ṭ", ["ঠ"] = "ṭh", ["ড"] = "ḍ", ["ড়"] = "ṛ", ["ঢ"] = "ḍh", ["ঢ়"] = "ṛh", ["ণ"] = "ṇ", ["ত"] = "t", ["থ"] = "th", ["দ"] = "d", ["ধ"] = "dh", ["ন"] = "n", ["প"] = "p", ["ফ"] = "ph", ["ব"] = "b", ["ভ"] = "bh", ["ম"] = "m", ["য"] = "j", ["য়"] = "ẏ", ["র"] = "r", ["ল"] = "l", ["শ"] = "ś", ["ষ"] = "ś", ["স"] = "ś", ["হ"] = "h"}

local diacritics = {["া"] = "ā", ["ি"] = "i", ["ী"] = "i", ["ু"] = "u", ["ূ"] = "u", ["ৃ"] = "ri", ["ে"] = "e", ["ৈ"] = "ôi", ["ো"] = "o", ["ৌ"] = "au", ["্"] = ""}

local tt = {
    -- vowels
    ["অ"] = "a",
    ["আ"] = "ā",
    ["ই"] = "i",
    ["ী"] = "i",
    ["উ"] = "u",
    ["ঊ"] = "u",
    ["ঋ"] = "ri",
    ["এ"] = "e",
    ["ঐ"] = "ai",
    ["ও"] = "o",
    ["ঔ"] = "au",

    -- candrabindu    
    ["ঁ"] = "̃",

    -- anusvara    
    ["ং"] = "ṅ",

    -- visarga    
    ["ঃ"] = "ḥ",

    -- punctuation        
    ["।"] = "." -- danda
}

function export.tr(text, lang, sc)
    text = mw.ustring.gsub(text, "([কখগঘঙচছজঝঞটঠডঢণতথদধনপফবরভমযলশষসহ]়?)" .. "([a্িুৃেোাীূৈৌ]?)", function(c, d)
        if not consonants[c] then return c end
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
