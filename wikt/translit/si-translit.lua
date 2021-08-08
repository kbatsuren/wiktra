local gsub = mw.ustring.gsub
local export = {}

local consonants = {["ක"] = "k", ["ඛ"] = "kh", ["ග"] = "g", ["ඝ"] = "gh", ["ඞ"] = "ṅ", ["ඟ"] = "ⁿg", ["ච"] = "c", ["ඡ"] = "ch", ["ජ"] = "j", ["ඣ"] = "jh", ["ඤ"] = "ñ", ["ඥ"] = "gn", ["ඦ"] = "ⁿj", ["ට"] = "ṭ", ["ඨ"] = "ṭh", ["ඩ"] = "ḍ", ["ඪ"] = "ḍh", ["ණ"] = "ṇ", ["ඬ"] = "ⁿḍ", ["ත"] = "t", ["ථ"] = "th", ["ද"] = "d", ["ධ"] = "dh", ["න"] = "n", ["ඳ"] = "ⁿd", ["ප"] = "p", ["ෆ"] = "f", ["ඵ"] = "ph", ["බ"] = "b", ["භ"] = "bh", ["ම"] = "m", ["ඹ"] = "ᵐb", ["ය"] = "y", ["ර"] = "r", ["ල"] = "l", ["ව"] = "w", ["ශ"] = "ś", ["ෂ"] = "ṣ", ["ස"] = "s", ["හ"] = "h", ["ළ"] = "ḷ", ["ෆ"] = "f"}

local diacritics = {["ා"] = "ā", ["ැ"] = "æ", ["ෑ"] = "ǣ", ["ි"] = "i", ["ී"] = "ī", ["ු"] = "u", ["ූ"] = "ū", ["ෙ"] = "e", ["ේ"] = "ē", ["ෛ"] = "ai", ["ො"] = "o", ["ෝ"] = "ō", ["ෞ"] = "au", ["ෘ"] = "r̥", ["ෟ"] = "l̥", ["ෲ"] = "r̥̄", ["ෳ"] = "l̥̄", ["්"] = ""}
local tt = {
    -- vowels
    ["අ"] = "a",
    ["ආ"] = "ā",
    ["ඇ"] = "æ",
    ["ඈ"] = "ǣ",
    ["ඉ"] = "i",
    ["ඊ"] = "ī",
    ["උ"] = "u",
    ["ඌ"] = "ū",
    ["එ"] = "e",
    ["ඒ"] = "ē",
    ["ඓ"] = "ai",
    ["ඔ"] = "o",
    ["ඕ"] = "ō",
    ["ඖ"] = "au",
    ["ඍ"] = "r̥",
    ["ඎ"] = "r̥̄",
    ["ඏ"] = "l̥",
    ["ඐ"] = "l̥̄",
    -- other symbols
    ["ං"] = "ṁ", -- anusvara
    ["ඃ"] = "ḥ", -- visarga
    ["්"] = "", -- hal kirīma, suppresses the inherent vowel "a"
    -- punctuation
    ["෴"] = "." -- kunddaliya (obsolete)    
}

-- translit any words or phrases
function export.tr(text, lang, sc)
    local u = mw.ustring.char
    if type(text) == "table" then
        text = text.args[1]
        lang = text.args[2]
        sc = text.args[3]
    end
    text = mw.ustring.gsub(text, -- Handle conjunct and touching clusters.
    "[" .. u(0x200d, 0x0dca) .. "][" .. u(0x200d, 0x0dca) .. "]", {[u(0x200d, 0x0dca)] = u(0x0dca), [u(0x0dca, 0x200d)] = u(0x0dca)})
    text = mw.ustring.gsub(text, "([කඛගඝඞඟචඡජඣඤඥඦටඨඩඪණඬතථදධනඳපපඵබභමඹයරලවශෂසහළෆ])" .. "([\224\183\153\224\183\146\224\183\156\224\183\148\224\183\144\224\183\146\224\183\143\224\183\154\224\183\157\224\183\150\224\183\145\224\183\147\224\183\152\224\183\159\224\183\178\224\183\179\224\183\155\224\183\158\224\183\138]?)", function(c, d)
        if d == "" then
            return consonants[c] .. "a"
        else
            return consonants[c] .. diacritics[d]
        end
    end)

    text = gsub(text, ".", tt)
    if (lang == "pi" or lang == "sa") then -- Convert to IAST.
        text = gsub(text, "." .. mw.ustring.char(0x325) .. "?" .. mw.ustring.char(0x304) .. "?", {["ṁ"] = "ṃ", ["w"] = "v", ["r̥"] = "ṛ", ["r̥̄"] = "ṝ", ["l̥"] = "ḷ", ["l̥̄"] = "ḹ"})
    end
    return text
end

return export
