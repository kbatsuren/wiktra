local export = {}

local consonants = {
    ["𑊺"] = "k",
    ["𑊻"] = "kh",
    ["𑊼"] = "g",
    ["𑊽"] = "g̈",
    ["𑊾"] = "gh",
    ["𑊿"] = "ṅ",
    ["𑋀"] = "c",
    ["𑋁"] = "ch",
    ["𑋂"] = "j",
    ["𑋃"] = "j̈",
    ["𑋄"] = "jh",
    ["𑋅"] = "ñ",
    ["𑋆"] = "ṭ",
    ["𑋇"] = "ṭh",
    ["𑋈"] = "ḍ",
    ["𑋉"] = "d̤",
    ["𑋊"] = "ṛ",
    ["𑋋"] = "ḍh",
    ["𑋌"] = "ṇ",
    ["𑋍"] = "t",
    ["𑋎"] = "th",
    ["𑋏"] = "d",
    ["𑋐"] = "dh",
    ["𑋑"] = "n",
    ["𑋒"] = "p",
    ["𑋓"] = "ph",
    ["𑋔"] = "b",
    ["𑋕"] = "b̤",
    ["𑋖"] = "bh",
    ["𑋗"] = "m",
    ["𑋘"] = "y",
    ["𑋙"] = "r",
    ["𑋚"] = "l",
    ["𑋛"] = "v",
    ["𑋜"] = "ś",
    ["𑋝"] = "s",
    ["𑋞"] = "h",

    -- consonants with nukta
    ["𑊻𑋩"] = "x",
    ["𑊼𑋩"] = "ġ",
    ["𑋂𑋩"] = "z",
    ["𑋓𑋩"] = "f"
}

local diacritics = {["𑋠"] = "ā", ["𑋡"] = "i", ["𑋢"] = "ī", ["𑋣"] = "u", ["𑋤"] = "ū", ["𑋥"] = "e", ["𑋦"] = "ai", ["𑋧"] = "o", ["𑋨"] = "au", ["𑋪"] = ""}

local nonconsonants = {
    -- vowels
    ["𑊰"] = "a",
    ["𑊱"] = "ā",
    ["𑊲"] = "i",
    ["𑊳"] = "ī",
    ["𑊴"] = "u",
    ["𑊵"] = "ū",
    ["𑊶"] = "e",
    ["𑊷"] = "ai",
    ["𑊸"] = "o",
    ["𑊹"] = "au",
    -- other symbols
    ["𑋟"] = "ṁ", -- anusvara
    ["𑋩"] = ".", -- nukta
    -- digits
    ["𑋰"] = "0",
    ["𑋱"] = "1",
    ["𑋲"] = "2",
    ["𑋳"] = "3",
    ["𑋴"] = "4",
    ["𑋵"] = "5",
    ["𑋶"] = "6",
    ["𑋷"] = "7",
    ["𑋸"] = "8",
    ["𑋹"] = "9"
}

local nasal_assim = {["[kg]h?"] = "ṅ", ["[cj]h?"] = "ñ", ["[ṭḍ]h?"] = "ṇ", ["[td]h?"] = "n", ["[pb]h?"] = "m", ["n"] = "n", ["m"] = "m", ["s"] = "n"}

-- translit any words or phrases
function export.tr(text, lang, sc)
    local nukta = "([𑊻𑊼𑋂𑋓]𑋩)"
    text = mw.ustring.gsub(text, "([𑊺𑊻𑊼𑊽𑊾𑊿𑋀𑋁𑋂𑋃𑋄𑋅𑋆𑋇𑋈𑋉𑋊𑋋𑋌𑋍𑋎𑋏𑋐𑋑𑋒𑋓𑋔𑋕𑋖𑋗𑋘𑋙𑋚𑋛𑋜𑋝𑋞][𑋩]?)" .. "([𑋠𑋡𑋢𑋣𑋤𑋥𑋦𑋧𑋨]?)", function(c, d)
        -- mw.log('match', c, d)
        c = consonants[c] or c
        if d == "" then
            return c .. "a"
        else
            return c .. (diacritics[d] or d)
        end
    end)

    text = mw.ustring.gsub(text, nukta, consonants)
    text = mw.ustring.gsub(text, ".", nonconsonants)
    for key, val in pairs(nasal_assim) do text = mw.ustring.gsub(text, "ṁ(" .. key .. ")", val .. "%1") end
    text = mw.ustring.gsub(text, "([aiueēoāīū])ṁ ", "%1̃ ")
    text = mw.ustring.gsub(text, "(.?)ṁ", "%1̃")
    return text
end

return export
