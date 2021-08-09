local export = {}

local consonants = {
    -- consonants
    ["𑀓"] = "k",
    ["𑀔"] = "kh",
    ["𑀕"] = "g",
    ["𑀖"] = "gh",
    ["𑀗"] = "ṅ",
    ["𑀘"] = "c",
    ["𑀙"] = "ch",
    ["𑀚"] = "j",
    ["𑀛"] = "jh",
    ["𑀜"] = "ñ",
    ["𑀝"] = "ṭ",
    ["𑀞"] = "ṭh",
    ["𑀟"] = "ḍ",
    ["𑀠"] = "ḍh",
    ["𑀡"] = "ṇ",
    ["𑀢"] = "t",
    ["𑀣"] = "th",
    ["𑀤"] = "d",
    ["𑀥"] = "dh",
    ["𑀦"] = "n",
    ["𑀧"] = "p",
    ["𑀨"] = "ph",
    ["𑀩"] = "b",
    ["𑀪"] = "bh",
    ["𑀫"] = "m",
    ["𑀬"] = "y",
    ["𑀭"] = "r",
    ["𑀮"] = "l",
    ["𑀯"] = "v",
    ["𑀴"] = "ḷ",
    ["𑀰"] = "ś",
    ["𑀱"] = "ṣ",
    ["𑀲"] = "s",
    ["𑀳"] = "h"
}

local diacritics = {
    -- matras
    ["𑀸"] = "ā",
    ["𑀺"] = "i",
    ["𑀻"] = "ī",
    ["𑀼"] = "u",
    ["𑀽"] = "ū",
    ["𑀾"] = "ṛ",
    ["𑀿"] = "ṝ",
    ["𑁀"] = "l̥",
    ["𑁁"] = "l̥̄",
    ["𑁂"] = "e",
    ["𑁃"] = "ai",
    ["𑁄"] = "o",
    ["𑁅"] = "au",
    ["𑁆"] = "",
    -- bhattiprolu aa
    ["𑀹"] = "ā"
}

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
    ["𑀍"] = "l̥",
    ["𑀎"] = "l̥̄",
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
    ["𑁇"] = ".", -- danda
    ["𑁈"] = "." -- double danda
}

function export.tr(text, lang, sc)
    if sc ~= "Brah" then return nil end

    text = mw.ustring.gsub(text, "([𑀓-𑀴])" .. "([𑀸𑀺𑀺𑀻𑀼𑀽𑀾𑀿𑁀𑁁𑁂𑁃𑁄𑁅𑁆𑀹]?)" .. "([𑀅-𑀒]?)", function(c, d, e)
        if d == "" and e ~= "" then
            if tt[e] == "i" or tt[e] == "u" then
                return consonants[c] .. "a" .. tt[e] .. "̈"
            else
                return consonants[c] .. "a" .. tt[e]
            end
        elseif e ~= "" then
            return consonants[c] .. diacritics[d] .. tt[e]
        elseif d == "" then
            return consonants[c] .. "a"
        else
            return consonants[c] .. diacritics[d]
        end
    end)

    text = mw.ustring.gsub(text, ".", tt)
    if (lang == "sa" or lang == "pi") and mw.ustring.match(text, "l̥") then
        text = mw.ustring.gsub(text, "l̥", "ḷ")
        text = mw.ustring.toNFC(text)
    end

    return text
end

return export
