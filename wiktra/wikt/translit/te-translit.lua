local export = {}

local consonants = {["క"] = "k", ["ఖ"] = "kh", ["గ"] = "g", ["ఘ"] = "gh", ["ఙ"] = "ṅ", ["చ"] = "c", ["ఛ"] = "ch", ["జ"] = "j", ["ఝ"] = "jh", ["ఞ"] = "ñ", ["ట"] = "ṭ", ["ఠ"] = "ṭh", ["డ"] = "ḍ", ["ఢ"] = "ḍh", ["ణ"] = "ṇ", ["త"] = "t", ["థ"] = "th", ["ద"] = "d", ["ధ"] = "dh", ["న"] = "n", ["ప"] = "p", ["ఫ"] = "ph", ["బ"] = "b", ["భ"] = "bh", ["మ"] = "m", ["య"] = "y", ["ర"] = "r", ["ల"] = "l", ["వ"] = "v", ["ళ"] = "ḷ", ["శ"] = "ś", ["ష"] = "ṣ", ["స"] = "s", ["హ"] = "h", ["ఱ"] = "ṛ", ["ౘ"] = "ts", ["ౙ"] = "dz", ["ౚ"] = "ṟ"}

local diacritics = {["ా"] = "ā", ["ి"] = "i", ["ీ"] = "ī", ["ు"] = "u", ["ూ"] = "ū", ["ృ"] = "r̥", ["ౄ"] = "r̥̄", ["ె"] = "e", ["ే"] = "ē", ["ై"] = "ai", ["ొ"] = "o", ["ో"] = "ō", ["ౌ"] = "au", ["్"] = ""}
local tt = {
    -- vowels
    ["అ"] = "a",
    ["ఆ"] = "ā",
    ["ఇ"] = "i",
    ["ఈ"] = "ī",
    ["ఉ"] = "u",
    ["ఊ"] = "ū",
    ["ఋ"] = "r̥",
    ["ౠ"] = "r̥̄",
    ["ఌ"] = "l̥",
    ["ౡ"] = "l̥̄",
    ["ఎ"] = "e",
    ["ఏ"] = "ē",
    ["ఐ"] = "ai",
    ["ఒ"] = "o",
    ["ఓ"] = "ō",
    ["ఔ"] = "au",
    ["అం"] = "aṅ",
    ["అఁ"] = "aṃ",
    ["అః"] = "ah",
    -- other symbols
    ["ం"] = "ṃ", -- anusvara
    ["ః"] = "ḥ", -- visarga
    ["ఁ"] = "ṅ", -- candrabindu/arthanusvāra/aranusa
    ["ఽ"] = "’", -- avagraha
    -- digits
    ["౦"] = "0",
    ["౧"] = "1",
    ["౨"] = "2",
    ["౩"] = "3",
    ["౪"] = "4",
    ["౫"] = "5",
    ["౬"] = "6",
    ["౭"] = "7",
    ["౮"] = "8",
    ["౯"] = "9",
    ["౸"] = "0⁄4",
    ["౹"] = "¼",
    ["౺"] = "2⁄4",
    ["౻"] = "¾",
    ["౦"] = "0⁄16",
    ["౼"] = "1⁄16",
    ["౽"] = "2⁄16",
    ["౾"] = "3⁄16"
}

-- translit any words or phrases
function export.tr(text, lang, sc)
    text = mw.ustring.gsub(text, "([కఖగఘఙచఛజఝఞటఠడఢణతథదధనపఫబభమయరలవళశషసహఱౘౙౚ])" .. "([ాిీుూృ̥ౄ̥̄ెేైొోౌ్]?)", function(c, d)
        if d == "" then
            return consonants[c] .. "a"
        else
            return consonants[c] .. diacritics[d]
        end
    end)

    text = mw.ustring.gsub(text, ".", tt)

    -- anusvara
    text = mw.ustring.gsub(text, "ṃ([kgṅ])", "ṅ%1")
    text = mw.ustring.gsub(text, "ṃ([cjñ])", "ñ%1")
    text = mw.ustring.gsub(text, "ṃ([ṭḍṇ])", "ṇ%1")
    text = mw.ustring.gsub(text, "ṃ([tdn])", "n%1")
    text = mw.ustring.gsub(text, "ṃ([pbm])", "m%1")

    return text
end

return export
