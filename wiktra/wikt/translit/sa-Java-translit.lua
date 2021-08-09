local export = {}
local gsub = mw.ustring.gsub

local consonants = {
    ["ꦏ"] = "k",
    ["ꦑ"] = "kh",
    ["ꦒ"] = "g",
    ["ꦓ"] = "gh",
    ["ꦔ"] = "ṅ",
    ["ꦕ"] = "c",
    ["ꦖ"] = "ch",
    ["ꦗ"] = "j",
    ["ꦙ"] = "jh",
    ["ꦚ"] = "ñ",
    ["ꦛ"] = "ṭ",
    ["ꦜ"] = "ṭh",
    ["ꦝ"] = "ḍ",
    ["ꦞ"] = "ḍh",
    ["ꦟ"] = "ṇ",
    ["ꦠ"] = "t",
    ["ꦡ"] = "th",
    ["ꦢ"] = "d",
    ["ꦣ"] = "dh",
    ["ꦤ"] = "n",
    ["ꦥ"] = "p",
    ["ꦦ"] = "ph",
    ["ꦧ"] = "b",
    ["ꦨ"] = "bh",
    ["ꦩ"] = "m",
    ["ꦪ"] = "y",
    ["ꦫ"] = "r",
    ["ꦭ"] = "l",
    ["ꦮ"] = "v", -- ['ળ']='ḷ',
    ["ꦯ"] = "ś",
    ["ꦰ"] = "ṣ",
    ["ꦱ"] = "s",
    ["ꦲ"] = "h",
    -- Include subscript ('medial') consonants for translation only.
    ["ꦿ"] = "r",
    ["ꦾ"] = "y"
}

local diacritics = {
    ["ꦴ"] = "ā",
    ["ꦶ"] = "i",
    ["ꦷ"] = "ī",
    ["ꦸ"] = "u",
    ["ꦹ"] = "ū",
    ["ꦽ"] = "ṛ",
    ["ꦽꦴ"] = "ṝ",
    ["꧀ꦊ"] = "ḷ",
    ["꧀ꦋ"] = "ḹ",
    ["ꦺ"] = "e",
    ["ꦻ"] = "ai",
    ["ꦺꦴ"] = "o",
    ["ꦵ"] = "o",
    ["ꦻꦴ"] = "au",
    ["꧀"] = ""
    -- In general, include results of second level diacritics.  I think not needed for Javanese.
    --	['y']='y', ['r']='r',
}

local tt = {
    -- vowels
    ["ꦄ"] = "a",
    ["ꦄꦴ"] = "ā",
    ["ꦆ"] = "i",
    ["ꦇ"] = "ī",
    ["ꦈ"] = "u",
    ["ꦈꦴ"] = "ū",
    ["ꦉ"] = "ṛ",
    ["ꦉꦴ"] = "ṝ",
    ["ꦊ"] = "ḷ",
    ["ꦋ"] = "ḹ",
    ["ꦌ"] = "e",
    ["ꦍ"] = "ai",
    ["ꦎ"] = "o",
    ["ꦎꦴ"] = "au",
    -- chandrabindu    
    ["ꦀ"] = "m̐", -- until a better method is found
    -- anusvara    
    ["ꦁ"] = "ṃ", -- until a better method is found
    -- visarga    
    ["ꦃ"] = "ḥ",
    -- avagraha
    -- ['ઽ']='’',
    -- others
    ["ꦂ"] = "r",
    -- numerals
    ["꧐"] = "0",
    ["꧑"] = "1",
    ["꧒"] = "2",
    ["꧓"] = "3",
    ["꧔"] = "4",
    ["꧕"] = "5",
    ["꧖"] = "6",
    ["꧗"] = "7",
    ["꧘"] = "8",
    ["꧙"] = "9",
    ["꧇"] = "",
    -- punctuation        
    ["꧉"] = ".", -- double danda
    ["꧈"] = ".", -- danda
    -- Vedic extensions
    -- ['ᳵ']='x', ['ᳶ']='f',
    -- Om
    ["ꦎꦴꦀ"] = "oṃ",
    -- reconstructed
    ["*"] = ""
}
-- List the consonants
local S = "ꦾꦿ" -- Subscript y and r.
local C = "ꦏꦑꦒꦓꦔꦕꦖꦗꦙꦚꦛꦜꦝꦞꦟꦠꦡꦢꦣꦤꦥꦦꦧꦨꦩꦪꦫꦭꦮꦯꦰꦱꦲ" .. S

function export.tr(text, lang, sc)
    -- Handle subscript consonants
    local fn = function(c, d) return consonants[c] .. d end
    local search = "([" .. C .. "])([" .. S .. "])"
    text = gsub(text, search, fn);
    text = gsub(text, search, fn); -- and again
    text = gsub(text, "([" .. C .. S .. "])" .. "(꧀?[ꦴꦶꦷꦸꦹꦽꦊꦋꦺꦻꦵ꧀]?ꦴ?)", function(c, d)
        if d == "" then
            return consonants[c] .. "a"
        else
            return consonants[c] .. diacritics[d]
        end
    end)

    text = mw.ustring.gsub(text, ".ꦴ", tt) -- Two part independent vowels.
    text = mw.ustring.gsub(text, ".", tt)

    return text
end

return export
