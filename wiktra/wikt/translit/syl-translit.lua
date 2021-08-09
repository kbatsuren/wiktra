-- Transliteration for Sylheti in Sylheti Nagri script
local export = {}
local gsub = mw.ustring.gsub
local match = mw.ustring.match

local conv = {
    -- consonants
    ["ꠇ"] = "x",
    ["ꠈ"] = "x",
    ["ꠉ"] = "g",
    ["ꠊ"] = "g",
    ["ꠌ"] = "s",
    ["ꠍ"] = "s",
    ["ꠎ"] = "z",
    ["ꠏ"] = "z",
    ["ꠐ"] = "ṭ",
    ["ꠑ"] = "ṭ",
    ["ꠒ"] = "ḍ",
    ["ꠓ"] = "ḍ",
    ["ꠔ"] = "t",
    ["ꠕ"] = "t",
    ["ꠖ"] = "d",
    ["ꠗ"] = "d",
    ["ꠘ"] = "n",
    ["ꠙ"] = "f",
    ["ꠚ"] = "f",
    ["ꠛ"] = "b",
    ["ꠜ"] = "b",
    ["ꠝ"] = "m",
    ["ꠞ"] = "r",
    ["ꠟ"] = "l",
    ["ꠠ"] = "ṛ",
    ["ꠡ"] = "ś",
    ["ꠢ"] = "h",
    ["ꠋ"] = "ṅ",

    -- vowel diacritics
    ["ꠣ"] = "a",
    ["ꠤ"] = "i",
    ["ꠥ"] = "u",
    ["ꠦ"] = "e",
    ["ꠧ"] = "o",

    -- vowel signs
    ["ꠀ"] = "a",
    ["ꠁ"] = "i",
    ["ꠃ"] = "u",
    ["ꠄ"] = "e",
    ["ꠅ"] = "o",

    -- virama
    ["꠆"] = "",

    -- anusvar
    [" ꠋ"] = "ṅ",

    -- dvisvara
    ["ꠂ"] = "i",

    -- numerals
    ["০"] = "0",
    ["১"] = "1",
    ["২"] = "2",
    ["৩"] = "3",
    ["৪"] = "4",
    ["৫"] = "5",
    ["৬"] = "6",
    ["৭"] = "7",
    ["৮"] = "8",
    ["৯"] = "9",

    -- punctuation
    ["꠪"] = ".", -- dari/purn virama
    ["꠫"] = "."
}

local aspirates = "ꠈꠊꠍꠏꠑꠓꠕꠗꠚꠜ"
local consonant, vowel, vowel_sign = "ꠇ-ꠊꠌ-ꠢ", "ꠣ-ꠧ", "ꠀꠁꠃ-ꠅ"
local c = "[" .. consonant .. "]"
local v = "[" .. vowel .. vowel_sign .. "]"
local syncope_pattern = "(" .. v .. c .. v .. c .. ")ô(" .. c .. "ঁ?" .. v .. ")"

local function rev_string(text)
    local result, length = "", mw.ustring.len(text)
    for i = 1, length do result = result .. mw.ustring.sub(text, -i, -i) end
    return result
end

function export.tr(text, lang, sc)
    -- from [[MOD:as-translit]]
    text = gsub(text, "(" .. c .. ")([" .. vowel .. "’?꠆]?)", function(a, b)
        local res = a .. (b == "" and "ô" or b)
        if match(a, "[" .. aspirates .. "]") then res = res .. "’" end
        return res
    end)

    for word in mw.ustring.gmatch(text, "[ꠀ-ꠧô’]+") do
        local orig_word = word
        word = rev_string(word)
        word = gsub(word, "^ô(" .. c .. ")(" .. v .. ")", "%1%2")
        while match(word, syncope_pattern) do word = gsub(word, syncope_pattern, "%1%2") end
        text = gsub(text, orig_word, rev_string(word))
    end

    text = gsub(text, ".", conv)

    -- ô is really just o
    text = mw.ustring.gsub(text, "ô", "o")

    -- velars
    text = mw.ustring.gsub(text, "x([iu])", "k%1")
    text = mw.ustring.gsub(text, "([iu])x", "%1k")
    text = mw.ustring.gsub(text, "xx", "kk")

    -- palatals (I think?)
    text = mw.ustring.gsub(text, "ss", "cc")

    -- affricates (I'm just guessing now)
    text = mw.ustring.gsub(text, "jj", "zz")
    text = mw.ustring.gsub(text, "zs", "jc")

    -- final r/l
    text = mw.ustring.gsub(text, "([xrl])o$", "%1")
    text = mw.ustring.gsub(text, "([xrl])o ", "%1 ")

    -- tone
    text = gsub(text, "’", "́")

    return text
end

return export
