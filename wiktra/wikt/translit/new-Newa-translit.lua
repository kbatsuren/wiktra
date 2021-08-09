-- Transliteration for Newar in Newa script
local export = {}
local gsub = mw.ustring.gsub
local match = mw.ustring.match

local conv = {
    -- consonants
    ["𑐎"] = "k",
    ["𑐏"] = "kh",
    ["𑐐"] = "g",
    ["𑐑"] = "gh",
    ["𑐒"] = "ṅ",
    ["𑐓"] = "ṅh",
    ["𑐔"] = "c",
    ["𑐕"] = "ch",
    ["𑐖"] = "j",
    ["𑐗"] = "jh",
    ["𑐘"] = "ñ",
    ["𑐙"] = "ñh",
    ["𑐚"] = "ṭ",
    ["𑐛"] = "ṭh",
    ["𑐜"] = "ḍ",
    ["𑐝"] = "ḍh",
    ["𑐞"] = "ṇ",
    ["𑐟"] = "t",
    ["𑐠"] = "th",
    ["𑐡"] = "d",
    ["𑐢"] = "dh",
    ["𑐣"] = "n",
    ["𑐤"] = "nh",
    ["𑐥"] = "p",
    ["𑐦"] = "ph",
    ["𑐧"] = "b",
    ["𑐨"] = "bh",
    ["𑐩"] = "m",
    ["𑐪"] = "mh",
    ["𑐫"] = "y",
    ["𑐬"] = "r",
    ["𑐭"] = "rh",
    ["𑐮"] = "l",
    ["𑐯"] = "lh",
    ["𑐰"] = "w",
    ["𑐱"] = "ś",
    ["𑐲"] = "ṣ",
    ["𑐳"] = "s",
    ["𑐴"] = "h",
    -- vowel diacritics
    ["𑐶"] = "i",
    ["𑐸"] = "u",
    ["𑐾"] = "e",
    ["𑑀"] = "o",
    ["𑐵"] = "ā",
    ["𑐷"] = "ī",
    ["𑐹"] = "ū",
    ["𑐺"] = "r̥",
    ["𑐻"] = "r̥̄",
    ["𑐼"] = "l̥",
    ["𑐽"] = "l̥̄",
    ["𑐿"] = "ai",
    ["𑑁"] = "au",
    -- vowels
    ["𑐀"] = "a",
    ["𑐂"] = "i",
    ["𑐄"] = "u",
    ["𑐊"] = "e",
    ["𑐌"] = "o",
    ["𑐁"] = "ā",
    ["𑐃"] = "ī",
    ["𑐅"] = "ū",
    ["𑐆"] = "r̥",
    ["𑐇"] = "r̥̄",
    ["𑐈"] = "l̥",
    ["𑐉"] = "l̥̄",
    ["𑐋"] = "ai",
    ["𑐍"] = "au",
    -- chandrabindu
    ["𑑃"] = "̃",
    -- anusvara
    ["𑑄"] = "ṃ",
    ["𑑈"] = "ṃ",
    -- visarga
    ["𑑅"] = "ḥ",
    -- nuqta
    ["𑑆"] = "",
    -- virama
    ["𑑂"] = "",
    -- om
    ["𑑉"] = "om",
    -- avagraha
    ["𑑇"] = "’",
    -- numerals
    ["𑑐"] = "0",
    ["𑑑"] = "1",
    ["𑑓"] = "2",
    ["𑑓"] = "3",
    ["𑑔"] = "4",
    ["𑑕"] = "5",
    ["𑑖"] = "6",
    ["𑑗"] = "7",
    ["𑑘"] = "8",
    ["𑑙"] = "9",
    -- punctuation
    ["𑑋"] = ".", -- danda
    ["𑑌"] = ".", -- double danda
    ["𑑍"] = "", -- comma
    -- abbreviation sign
    ["𑑏"] = "."
}

local all_cons, special_cons = "𑐎𑐏𑐐𑐑𑐒𑐓𑐔𑐕𑐖𑐗𑐘𑐙𑐚𑐛𑐜𑐝𑐞𑐟𑐠𑐡𑐢𑐣𑐤𑐥𑐦𑐧𑐨𑐩𑐪𑐫𑐬𑐭𑐮𑐯𑐰𑐱𑐲𑐳𑐴", "𑐎𑐏𑐐𑐑𑐒𑐓𑐔𑐕𑐖𑐗𑐘𑐙𑐚𑐛𑐜𑐝𑐞𑐞𑐟𑐠𑐡𑐢𑐣𑐤𑐥𑐦𑐧𑐨𑐩𑐪𑐫𑐬𑐭𑐮𑐯𑐰𑐱𑐲𑐳𑐴"
local vowel, vowel_sign = "a𑐼𑐽𑐾𑐿𑑀𑑁𑐻𑐺𑐹𑐸𑐶𑐵𑐷", "𑐄𑐃𑐂𑐁𑐀𑐉𑐈𑐇𑐆𑐅𑐍𑐌𑐋𑐊"

local function rev_string(text)
    local result, length = {}, mw.ustring.len(text)
    for i = length, 1, -1 do table.insert(result, mw.ustring.sub(text, i, i)) end
    return table.concat(result)
end
function export.tr(text, lang, sc)
    text = gsub(text, "([" .. all_cons .. "]𑑆?)([" .. vowel .. "𑑂]?)", function(c, d) return c .. (d == "" and "a" or d) end)
    for word in mw.ustring.gmatch(text, "[𑑃-𑐧a]+") do
        local orig_word = word
        word = rev_string(word)
        word = gsub(word, "^a(𑑆?)([" .. all_cons .. "])(.)(.?)", function(opt, first, second, third) return (((match(first, "[" .. special_cons .. "]") and match(second, "𑑄") or match(first, "[" .. special_cons .. "]") and match(second, "𑑂") and not perm_cl[first .. second .. third]) or match(first .. second, "𑐫[𑐄𑐃𑐂𑐁𑐀𑐉𑐈𑐇𑐆𑐅𑐍𑐌𑐋𑐊a𑐼𑐽𑐾𑐿𑑀𑑁𑐻𑐺𑐹𑐸𑐶𑐵𑐷]") or match(first .. second, "𑐴[𑐄𑐃𑐂𑐁𑐀𑐉𑐈𑐇𑐆𑐅𑐍𑐌𑐋𑐊a𑐼𑐽𑐾𑐿𑑀𑑁𑐻𑐺𑐹𑐸𑐶𑐵𑐷]")) and "a" or "") .. opt .. first .. second .. third end)
        word = gsub(word, "(.?)𑑄(.)", function(succ, prev) return succ .. (succ .. prev == "" and "𑑂𑐩" or (succ == "" and match(prev, "[" .. vowel .. "]") and "̃" or nasal_assim[succ] or "ṃ")) .. prev end)

        local escaped_orig_word = gsub(orig_word, "%+", "")
        text = gsub(text, orig_word, rev_string(word))
        text = gsub(text, "𑐫𑑂", "y")
    end
    text = gsub(text, ".𑑆?", conv)
    text = gsub(text, "a([iu])̃", "a͠%1")
    text = gsub(text, "[<>]", "")
    return mw.ustring.toNFC(text)
end
return export
