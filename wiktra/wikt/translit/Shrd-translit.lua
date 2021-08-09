local export = {}

local consonants = {["𑆑"] = "k", ["𑆒"] = "kh", ["𑆓"] = "g", ["𑆔"] = "gh", ["𑆕"] = "ṅ", ["𑆖"] = "c", ["𑆗"] = "ch", ["𑆘"] = "j", ["𑆙"] = "jh", ["𑆚"] = "ñ", ["𑆛"] = "ṭ", ["𑆜"] = "ṭh", ["𑆝"] = "ḍ", ["𑆞"] = "ḍh", ["𑆟"] = "ṇ", ["𑆠"] = "t", ["𑆡"] = "th", ["𑆢"] = "d", ["𑆣"] = "dh", ["𑆤"] = "n", ["𑆥"] = "p", ["𑆦"] = "ph", ["𑆧"] = "b", ["𑆨"] = "bh", ["𑆩"] = "m", ["𑆪"] = "y", ["𑆫"] = "r", ["𑆬"] = "l", ["𑆮"] = "v", ["𑆭"] = "ḷ", ["𑆯"] = "ś", ["𑆰"] = "ṣ", ["𑆱"] = "s", ["𑆲"] = "h"}

local diacritics = {["𑆳"] = "ā", ["𑆴"] = "i", ["𑆵"] = "ī", ["𑆶"] = "u", ["𑆷"] = "ū", ["𑆸"] = "ṛ", ["𑆹"] = "ṝ", ["𑆺"] = "ḷ", ["𑆻"] = "ḹ", ["𑆻"] = "e", ["𑆽"] = "ai", ["𑆾"] = "o", ["𑆿"] = "au", ["𑇀"] = ""}

local tt = {
    -- vowels
    ["𑆃"] = "a",
    ["𑆄"] = "ā",
    ["𑆅"] = "i",
    ["𑆆"] = "ī",
    ["𑆇"] = "u",
    ["𑆈"] = "ū",
    ["𑆉"] = "ṛ",
    ["𑆊"] = "ṝ",
    ["𑆋"] = "ḷ",
    ["𑆌"] = "ḹ",
    ["𑆍"] = "e",
    ["𑆎"] = "ai",
    ["𑆏"] = "o",
    ["𑆐"] = "au",
    -- chandrabindu    
    ["𑆀"] = "m̐", -- until a better method is found
    -- anusvara    
    ["𑆁"] = "ṃ", -- until a better method is found
    -- visarga    
    ["𑆂"] = "ḥ",
    -- avagraha
    ["𑇁"] = "’",
    -- numerals
    ["𑇐"] = "0",
    ["𑇑"] = "1",
    ["𑇒"] = "2",
    ["𑇓"] = "3",
    ["𑇔"] = "4",
    ["𑇕"] = "5",
    ["𑇖"] = "6",
    ["𑇗"] = "7",
    ["𑇘"] = "8",
    ["𑇙"] = "9",
    -- punctuation        
    ["𑇆"] = ".", -- double danda
    ["𑇅"] = ".", -- danda
    -- Vedic extensions
    ["𑇂"] = "x",
    ["𑇃"] = "f",
    -- Om
    ["𑇄"] = "oṃ",
    -- reconstructed
    ["*"] = ""
}

function export.tr(text, lang, sc)
    text = mw.ustring.gsub(text, "([𑆑𑆒𑆓𑆔𑆕𑆖𑆗𑆘𑆙𑆚𑆛𑆜𑆝𑆞𑆟𑆠𑆡𑆢𑆣𑆤𑆥𑆦𑆧𑆨𑆩𑆪𑆫𑆬𑆮𑆭𑆯𑆰𑆱𑆲])" .. "([𑆳𑆴𑆵𑆶𑆷𑆸𑆹𑆺𑆻𑆼𑆽𑆾𑆿𑇀]?)", function(c, d)
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
