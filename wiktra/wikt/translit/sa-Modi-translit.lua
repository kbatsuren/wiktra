local export = {}

local consonants = {["𑘎"] = "k", ["𑘏"] = "kh", ["𑘐"] = "g", ["𑘑"] = "gh", ["𑘒"] = "ṅ", ["𑘓"] = "c", ["𑘔"] = "ch", ["𑘕"] = "j", ["𑘖"] = "jh", ["𑘗"] = "ñ", ["𑘘"] = "ṭ", ["𑘙"] = "ṭh", ["𑘚"] = "ḍ", ["𑘛"] = "ḍh", ["𑘜"] = "ṇ", ["𑘝"] = "t", ["𑘞"] = "th", ["𑘟"] = "d", ["𑘠"] = "dh", ["𑘡"] = "n", ["𑘢"] = "p", ["𑘣"] = "ph", ["𑘤"] = "b", ["𑘥"] = "bh", ["𑘦"] = "m", ["𑘧"] = "y", ["𑘨"] = "r", ["𑘩"] = "l", ["𑘪"] = "v", ["𑘯"] = "ḷ", ["𑘫"] = "ś", ["𑘬"] = "ṣ", ["𑘭"] = "s", ["𑘮"] = "h"}

local diacritics = {["𑘰"] = "ā", ["𑘱"] = "i", ["𑘲"] = "ī", ["𑘳"] = "u", ["𑘴"] = "ū", ["𑘵"] = "ṛ", ["𑘶"] = "ṝ", ["𑘷"] = "ḷ", ["𑘸"] = "ḹ", ["𑘹"] = "e", ["𑘺"] = "ai", ["𑘻"] = "o", ["𑘼"] = "au", ["𑘿"] = ""}

local tt = {
    -- vowels
    ["𑘀"] = "a",
    ["𑘁"] = "ā",
    ["𑘂"] = "i",
    ["𑘃"] = "ī",
    ["𑘄"] = "u",
    ["𑘅"] = "ū",
    ["𑘆"] = "ṛ",
    ["𑘇"] = "ṝ",
    ["𑘈"] = "ḷ",
    ["𑘉"] = "ḹ",
    ["𑘊"] = "e",
    ["𑘋"] = "ai",
    ["𑘌"] = "o",
    ["𑘍"] = "au",
    -- chandrabindu    
    ["𑙀"] = "m̐", -- until a better method is found
    -- anusvara    
    ["𑘽"] = "ṃ", -- until a better method is found
    -- visarga    
    ["𑘾"] = "ḥ",
    -- avagraha
    ["ऽ"] = "’",
    -- numerals
    ["𑙐"] = "0",
    ["𑙑"] = "1",
    ["𑙒"] = "2",
    ["𑙓"] = "3",
    ["𑙔"] = "4",
    ["𑙕"] = "5",
    ["𑙖"] = "6",
    ["𑙗"] = "7",
    ["𑙘"] = "8",
    ["𑙙"] = "9",
    -- punctuation        
    ["𑙂"] = ".", -- double danda
    ["𑙁"] = ".", -- danda
    -- Vedic extensions
    ["ᳵ"] = "x",
    ["ᳶ"] = "f",
    -- Om
    ["𑘌𑘦𑘿"] = "oṃ",
    -- reconstructed
    ["*"] = ""
}

function export.tr(text, lang, sc)
    text = mw.ustring.gsub(text, "([𑘎𑘏𑘐𑘑𑘒𑘓𑘔𑘕𑘖𑘗𑘘𑘙𑘚𑘛𑘜𑘝𑘞𑘟𑘠𑘡𑘢𑘣𑘤𑘥𑘦𑘧𑘨𑘩𑘪𑘫𑘬𑘭𑘮𑘯])" .. "([𑘰𑘱𑘲𑘳𑘴𑘵𑘶𑘷𑘸𑘹𑘺𑘻𑘼𑘿]?)", function(c, d)
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
