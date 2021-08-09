-- Transliteration for Maithili in Tirhuta script
local export = {}
local gsub = mw.ustring.gsub
local match = mw.ustring.match

local conv = {
    -- consonants
    ["𑒏"] = "k",
    ["𑒐"] = "kh",
    ["𑒑"] = "g",
    ["𑒒"] = "gh",
    ["𑒓"] = "ṅ",
    ["𑒔"] = "c",
    ["𑒕"] = "ch",
    ["𑒖"] = "j",
    ["𑒗"] = "jh",
    ["𑒘"] = "ñ",
    ["𑒙"] = "ṭ",
    ["𑒚"] = "ṭ",
    ["𑒛"] = "ḍ",
    ["𑒜"] = "ḍh",
    ["𑒝"] = "ṇ",
    ["𑒞"] = "t",
    ["𑒟"] = "th",
    ["𑒠"] = "d",
    ["𑒡"] = "dh",
    ["𑒢"] = "n",
    ["𑒣"] = "p",
    ["𑒤"] = "ph",
    ["𑒥"] = "b",
    ["𑒦"] = "bh",
    ["𑒧"] = "m",
    ["𑒨"] = "y",
    ["𑒩"] = "r",
    ["𑒪"] = "l",
    ["𑒫"] = "v",
    ["𑒪𑓃"] = "ḷ",
    ["𑒬"] = "ś",
    ["𑒭"] = "ṣ",
    ["𑒮"] = "s",
    ["𑒯"] = "h",
    ["𑒛𑓃"] = "ṛ",
    ["𑒜𑓃"] = "ṛh",

    -- vowel diacritics
    ["𑒱"] = "i",
    ["𑒳"] = "u",
    ["𑒹"] = "ē",
    ["𑒺"] = "e",
    ["𑒼"] = "ō",
    ["𑒽"] = "o",
    ["𑒰"] = "ā",
    ["𑒲"] = "ī",
    ["𑒴"] = "ū",
    ["𑒵"] = "r̥",
    ["𑒶"] = "r̥̄",
    ["𑒻"] = "ai",
    ["𑒾"] = "au",
    ["𑒷"] = "l̥",
    ["𑒸"] = "l̥̄",
    ["ॏ"] = "ŏ",
    ["ऺ"] = "â",
    ["ॅ"] = "ĕ",

    -- vowels
    ["𑒁"] = "a",
    ["𑒂"] = "ā",
    ["𑒃"] = "i",
    ["𑒄"] = "ī",
    ["𑒅"] = "u",
    ["𑒆"] = "ū",
    ["𑒇"] = "r̥",
    ["𑒈"] = "r̥̄",
    ["𑒉"] = "l̥",
    ["𑒊"] = "l̥̄",
    ["𑒋"] = "ē",
    ["𑒌"] = "ai",
    ["𑒍"] = "ō",
    ["𑒎"] = "au",
    ["ऎ"] = "e",
    ["ऒ"] = "o",
    ["व़"] = "u",
    ["य़"] = "i",
    ["ॵ"] = "ŏ",
    ["ॴ"] = "â",
    ["ऍ"] = "ĕ",
    ["इऺ"] = "ï",
    ["उऺ"] = "ü",
    ["२"] = "’",
    ["ऽ"] = "ô",

    ["𑒿"] = "̃", -- chandrabindu
    ["𑓀"] = "̃", -- anusvara
    ["𑓅"] = "̃", -- gvang
    ["𑓁"] = "ḥ", -- visarga
    ["𑓂"] = "", -- virama
    ["𑓇"] = "om̐", -- om

    -- numerals
    ["𑓐"] = "0",
    ["𑓑"] = "1",
    ["𑓒"] = "2",
    ["𑓓"] = "3",
    ["𑓔"] = "4",
    ["𑓕"] = "5",
    ["𑓖"] = "6",
    ["𑓗"] = "7",
    ["𑓘"] = "8",
    ["𑓙"] = "9",

    -- punctuation
    ["।"] = ".", -- danda
    ["॥"] = ".", -- double danda
    ["+"] = "", -- compound separator
    -- abbreviation sign
    ["॰"] = "."
}

local nasal_assim = {["𑒏"] = "𑒓", ["𑒐"] = "𑒓", ["𑒑"] = "𑒓", ["𑒒"] = "𑒓", ["𑒔"] = "𑒘", ["𑒕"] = "𑒘", ["𑒖"] = "𑒘", ["𑒗"] = "𑒘", ["𑒘"] = "𑒘", ["𑒙"] = "𑒝", ["𑒚"] = "𑒝", ["𑒛"] = "𑒝", ["𑒜"] = "𑒝", ["𑒞"] = "𑒢", ["𑒟"] = "𑒢", ["𑒠"] = "𑒢", ["𑒡"] = "𑒢", ["𑒢"] = "𑒢", ["𑒣"] = "𑒧", ["𑒤"] = "𑒧", ["𑒥"] = "𑒧", ["𑒦"] = "𑒧", ["𑒧"] = "𑒧"}
local perm_cl = {["𑒧𑓂𑒪"] = true}
local all_cons, special_cons = "𑒏𑒐𑒑𑒒𑒓𑒔𑒕𑒖𑒗𑒘𑒙𑒚𑒛𑒜𑒝𑒞𑒟𑒠𑒡𑒢𑒣𑒤𑒥𑒦𑒧𑒨𑒩𑒪𑒫𑒮𑒬𑒭𑒯", "𑒨𑒩𑒪𑒥𑒫𑒯𑒧𑒢"
local vowel, vowel_sign = "a𑒰𑒱𑒱𑒳𑒴𑒹𑒻𑒼𑒾ॉॅॆॊॏॊऺऻॅॉ𑒵𑒶𑒵𑒶𑒸𑒷𑒽𑒺", "𑒁𑒂𑒃𑒄𑒅𑒆𑒋𑒌𑒍𑒎ऍऑऎऒॵॳॴॲ𑒈𑒈𑒉𑒊"
local syncope_pattern = "([" .. vowel .. vowel_sign .. "])(𑓃?[" .. all_cons .. "])a(𑓃?[" .. gsub(all_cons, "𑒨", "") .. "])([𑓀𑒿]?[" .. vowel .. vowel_sign .. "])"

local function rev_string(text)
    local result, length = {}, mw.ustring.len(text)
    for i = 1, length do table.insert(result, mw.ustring.sub(text, length - i + 1, length - i + 1)) end
    return table.concat(result)
end

function export.tr(text, lang, sc)
    text = gsub(text, "([" .. all_cons .. "]𑓃?)([" .. vowel .. "𑓂]?)", function(c, d) return c .. (d == "" and "a" or d) end)

    for word in mw.ustring.gmatch(text, "[𑒿a]+") do
        local orig_word = word

        word = rev_string(word)

        word = gsub(word, "^a(𑓃?)([" .. all_cons .. "])(.)(.?)", function(opt, first, second, third)
            local a = ""
            if match(first, "[" .. special_cons .. "]") and match(second, "𑓂") and not perm_cl[first .. second .. third] or match(first .. second, "𑒨[𑒹𑒻𑒲]") then a = "a" end

            return a .. opt .. first .. second .. third
        end)

        while match(word, syncope_pattern) do word = gsub(word, syncope_pattern, "%1%2%3%4") end

        word = gsub(word, "(.?)𑓀(.)", function(succ, prev)
            local mid = nasal_assim[succ] or "n"
            if succ .. prev == "a" then
                mid = "𑓃𑓃𑒧"
            elseif succ == "" and match(prev, "[" .. vowel .. "]") then
                mid = "̃"
            end
            return succ .. mid .. prev
        end)

        local escaped_orig_word = gsub(orig_word, "%+", "")
        text = gsub(text, orig_word, rev_string(word))
        text = gsub(text, "𑒖𑓂𑒘", "gy")
    end
    text = gsub(text, "ā([iu])̃", "ā͠%1")
    text = gsub(text, "uu", "u")
    text = gsub(text, "aâ", "â")
    text = gsub(text, "ii", "i")
    text = gsub(text, "([iīaāuūeoâ])a", "%1")
    text = gsub(text, "[<>]", "")
    text = gsub(text, ".𑓃?", conv)
    return mw.ustring.toNFC(text)
end

return export
