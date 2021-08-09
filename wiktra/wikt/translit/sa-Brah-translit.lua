local export = {}

local consonants = {["𑀓"] = "k", ["𑀔"] = "kh", ["𑀕"] = "g", ["𑀖"] = "gh", ["𑀗"] = "ṅ", ["𑀘"] = "c", ["𑀙"] = "ch", ["𑀚"] = "j", ["𑀛"] = "jh", ["𑀜"] = "ñ", ["𑀝"] = "ṭ", ["𑀞"] = "ṭh", ["𑀟"] = "ḍ", ["𑀠"] = "ḍh", ["𑀡"] = "ṇ", ["𑀢"] = "t", ["𑀣"] = "th", ["𑀤"] = "d", ["𑀥"] = "dh", ["𑀦"] = "n", ["𑀧"] = "p", ["𑀨"] = "ph", ["𑀩"] = "b", ["𑀪"] = "bh", ["𑀫"] = "m", ["𑀬"] = "y", ["𑀭"] = "r", ["𑀮"] = "l", ["𑀯"] = "v", ["𑀴"] = "ḷ", ["𑀰"] = "ś", ["𑀱"] = "ṣ", ["𑀲"] = "s", ["𑀳"] = "h"}

local diacritics = {["𑀸"] = "ā", ["𑀺"] = "i", ["𑀻"] = "ī", ["𑀼"] = "u", ["𑀽"] = "ū", ["𑀾"] = "ṛ", ["𑀿"] = "ṝ", ["𑁀"] = "ḷ", ["𑁁"] = "ḹ", ["𑁂"] = "e", ["𑁃"] = "ai", ["𑁄"] = "o", ["𑁅"] = "au", ["𑁆"] = ""}

local tt = {
    -- vowels
    ["𑀅"] = "a",
    ["𑀆"] = "ā",
    ["𑀇"] = "i",
    ["𑀈"] = "ī",
    ["𑀉"] = "u",
    ["𑀊"] = "ū",
    ["𑀋"] = "ṛ",
    ["𑀌"] = "ṝ",
    ["𑀍"] = "ḷ",
    ["𑀎"] = "ḹ",
    ["𑀏"] = "e",
    ["𑀐"] = "ai",
    ["𑀑"] = "o",
    ["𑀒"] = "au",
    -- chandrabindu    
    ["𑀀"] = "m̐", -- until a better method is found
    -- anusvara    
    ["𑀁"] = "ṃ", -- until a better method is found
    -- visarga    
    ["𑀂"] = "ḥ",
    -- avagraha
    ["ऽ"] = "’",
    -- numerals
    ["𑁦"] = "0",
    ["𑁧"] = "1",
    ["𑁨"] = "2",
    ["𑁩"] = "3",
    ["𑁪"] = "4",
    ["𑁫"] = "5",
    ["𑁬"] = "6",
    ["𑁭"] = "7",
    ["𑁮"] = "8",
    ["𑁯"] = "9",
    -- punctuation        
    ["𑁈"] = ".", -- double danda
    ["𑁇"] = ".", -- danda
    -- Vedic extensions
    ["𑀃"] = "x",
    ["𑀄"] = "f",
    -- Om
    ["𑀑𑀁"] = "oṃ",
    -- reconstructed
    ["*"] = ""
}

function export.tr(text, lang, sc)
    text = mw.ustring.gsub(text, "([𑀓𑀔𑀕𑀖𑀗𑀘𑀙𑀚𑀛𑀜𑀝𑀞𑀟𑀠𑀡𑀢𑀣𑀤𑀥𑀦𑀧𑀨𑀩𑀪𑀫𑀬𑀭𑀮𑀯𑀰𑀱𑀲𑀳])" .. "([𑀸𑀺𑀻𑀼𑀽𑀾𑀿𑁀𑁁𑁂𑁃𑁄𑁅𑁆]?)", function(c, d)
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
