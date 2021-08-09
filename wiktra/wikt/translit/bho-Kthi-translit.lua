-- Transliteration for Bhojpuri
local export = {}
local gsub = mw.ustring.gsub
local match = mw.ustring.match

local conv = {
    -- consonants
    ["𑂍"] = "k",
    ["𑂎"] = "kh",
    ["𑂏"] = "g",
    ["𑂐"] = "gh",
    ["𑂑"] = "ṅ",
    ["𑂒"] = "c",
    ["𑂓"] = "ch",
    ["𑂔"] = "j",
    ["𑂕"] = "jh",
    ["𑂖"] = "ñ",
    ["𑂗"] = "ṭ",
    ["𑂘"] = "ṭh",
    ["𑂙"] = "ḍ",
    ["𑂛"] = "ḍh",
    ["𑂝"] = "ṇ",
    ["𑂞"] = "t",
    ["𑂟"] = "th",
    ["𑂠"] = "d",
    ["𑂡"] = "dh",
    ["𑂢"] = "n",
    ["𑂣"] = "p",
    ["𑂤"] = "ph",
    ["𑂥"] = "b",
    ["𑂦"] = "bh",
    ["𑂧"] = "m",
    ["𑂨"] = "y",
    ["𑂩"] = "r",
    ["𑂪"] = "l",
    ["𑂫"] = "v",
    ["𑂫"] = "v",
    ["ळ"] = "ḷ",
    ["𑂬"] = "ś",
    ["𑂭"] = "ṣ",
    ["𑂮"] = "s",
    ["𑂯"] = "h",
    ["𑂚"] = "ṛ",
    ["𑂚"] = "ṛ",
    ["𑂜"] = "ṛh",
    ["𑂜"] = "ṛh",
    -- ['𑂔𑂹𑂖'] = 'gy',

    -- vowel diacritics
    ["𑂱"] = "i",
    ["𑂳"] = "u",
    ["𑂵"] = "e",
    ["𑂷"] = "o",
    ["𑂰"] = "ā",
    ["𑂲"] = "ī",
    ["𑂴"] = "ū",
    ["𑂶"] = "ai",
    ["𑂸"] = "au",

    -- vowel signs
    ["𑂃"] = "a",
    ["𑂅"] = "i",
    ["𑂇"] = "u",
    ["𑂉"] = "e",
    ["𑂋"] = "o",
    ["𑂄"] = "ā",
    ["𑂆"] = "ī",
    ["𑂈"] = "ū",
    ["𑂊"] = "ai",
    ["𑂌"] = "au",

    ["ॐ"] = "om",

    -- chandrabindu
    ["𑂀"] = "̃",

    -- anusvara
    ["𑂁"] = "ṁ",

    -- visarga
    ["𑂂"] = "ḥ",

    -- virama
    ["𑂹"] = "",

    -- numerals
    ["०"] = "0",
    ["१"] = "1",
    ["२"] = "2",
    ["३"] = "3",
    ["४"] = "4",
    ["५"] = "5",
    ["६"] = "6",
    ["७"] = "7",
    ["८"] = "8",
    ["९"] = "9",

    -- punctuation
    ["𑃀"] = ".", -- danda
    ["+"] = "", -- compound separator

    -- abbreviation sign
    ["𑂻"] = "."
}

local nasal_assim = {["𑂍"] = "𑂑", ["𑂎"] = "𑂑", ["𑂏"] = "𑂑", ["𑂐"] = "𑂑", ["𑂒"] = "𑂖", ["𑂓"] = "𑂖", ["𑂔"] = "𑂖", ["𑂕"] = "𑂖", ["𑂗"] = "𑂝", ["𑂘"] = "𑂝", ["𑂙"] = "𑂝", ["𑂛"] = "𑂝", ["𑂣"] = "𑂧", ["𑂤"] = "𑂧", ["𑂥"] = "𑂧", ["𑂦"] = "𑂧", ["𑂧"] = "𑂧"}

local perm_cl = {["𑂧𑂹𑂪"] = true, ["𑂫𑂹𑂪"] = true, ["𑂫𑂹𑂪"] = true, ["𑂢𑂹𑂪"] = true}

local all_cons, special_cons = "𑂍𑂎𑂏𑂐𑂑𑂒𑂓𑂔𑂕𑂖𑂗𑂘𑂙𑂚𑂛𑂜𑂞𑂟𑂠𑂡𑂣𑂤𑂥𑂦𑂬𑂭𑂮𑂨𑂩𑂪𑂫𑂯𑂝𑂢𑂧", "𑂨𑂩𑂪𑂥𑂫𑂯𑂢𑂧"
local vowel, vowel_sign = "a𑂰𑂱𑂲𑂳𑂴𑂵𑂶𑂷𑂸", "𑂃𑂄𑂅𑂆𑂇𑂈𑂉𑂊𑂋𑂌"
local syncope_pattern = "([" .. vowel .. vowel_sign .. "])(𑂺?[" .. all_cons .. "])a(𑂺?[" .. gsub(all_cons, "𑂨", "") .. "])([𑂁𑂀]?[" .. vowel .. vowel_sign .. "])"

local function rev_string(text)
    local result, length = {}, mw.ustring.len(text)
    for i = 1, length do table.insert(result, mw.ustring.sub(text, length - i + 1, length - i + 1)) end
    return table.concat(result)
end

function export.tr(text, lang, sc)
    text = gsub(text, "([" .. all_cons .. "]𑂺?)([" .. vowel .. "𑂹]?)", function(c, d) return c .. (d == "" and "a" or d) end)

    for word in mw.ustring.gmatch(text, "[𑂀-𑃁a]+") do
        local orig_word = word

        word = rev_string(word)

        word = gsub(word, "^a(𑂺?)([" .. all_cons .. "])(.)(.?)", function(opt, first, second, third)
            local a = ""
            if match(first, "[" .. special_cons .. "]") and match(second, "𑂹") and not perm_cl[first .. second .. third] or match(first .. second, "𑂨[𑂲𑂵𑂶]") then a = "a" end

            return a .. opt .. first .. second .. third
        end)

        while match(word, syncope_pattern) do word = gsub(word, syncope_pattern, "%1%2%3%4") end

        word = gsub(word, "(.?)𑂁(.)", function(succ, prev)
            local mid = nasal_assim[succ] or "n"
            if succ .. prev == "a" then
                mid = "𑂺𑂧"
            elseif succ == "" and match(prev, "[" .. vowel .. "]") then
                mid = "̃"
            end
            return succ .. mid .. prev
        end)

        text = gsub(text, orig_word, rev_string(word))
    end
    text = gsub(text, ".𑂺?", conv)
    text = gsub(text, "a([iu])̃", "a͠%1")
    text = gsub(text, "𑂔𑂹𑂖", conv)
    return mw.ustring.toNFC(text)
end

return export
