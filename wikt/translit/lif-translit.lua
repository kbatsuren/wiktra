local export = {}
local gsub = mw.ustring.gsub
local consonants = {["ᤁ"] = "k", ["ᤂ"] = "kh", ["ᤃ"] = "g", ["ᤄ"] = "gh", ["ᤅ"] = "ṅ", ["ᤆ"] = "c", ["ᤇ"] = "ch", ["ᤈ"] = "j", ["ᤉ"] = "jh", ["ᤊ"] = "ñ", ["ᤋ"] = "t", ["ᤌ"] = "th", ["ᤍ"] = "d", ["ᤎ"] = "dh", ["ᤏ"] = "n", ["ᤐ"] = "p", ["ᤑ"] = "ph", ["ᤒ"] = "b", ["ᤓ"] = "bh", ["ᤔ"] = "m", ["ᤕ"] = "y", ["ᤖ"] = "r", ["ᤗ"] = "l", ["ᤘ"] = "w", ["ᤙ"] = "ś", ["ᤚ"] = "ṣ", ["ᤛ"] = "s", ["ᤜ"] = "h", ["ᤝ"] = "gy", ["ᤞ"] = "tr", ["ᤀ"] = ""}
local diacritics = {["ᤠ"] = "a", ["ᤡ"] = "i", ["ᤢ"] = "u", ["ᤣ"] = "e", ["ᤤ"] = "ai", ["ᤥ"] = "o", ["ᤦ"] = "au", ["ᤧ"] = "ê", ["ᤨ"] = "ô"}

local special = {
    -- idk what to call these
    ["᤹"] = "’", -- mukphreng (glottalizer)
    ["ᤲ"] = "̃" -- anusvara (now obsolete)
}

local subjoined = {["ᤪ"] = "r", ["ᤫ"] = "w", ["ᤩ"] = "y"}

local finals = {["ᤰ"] = "k", ["ᤱ"] = "ṅ", ["ᤳ"] = "t", ["ᤴ"] = "n", ["ᤵ"] = "p", ["ᤶ"] = "m", ["ᤷ"] = "r", ["ᤸ"] = "l"}

local nonconsonants = {

    -- digits
    ["᥆"] = "0",
    ["᥇"] = "1",
    ["᥈"] = "2",
    ["᥉"] = "3",
    ["᥊"] = "4",
    ["᥋"] = "5",
    ["᥌"] = "6",
    ["᥍"] = "7",
    ["᥎"] = "8",
    ["᥏"] = "9",
    ["॥"] = ".",
    ["᥄"] = "!",
    ["᥅"] = "?",
    ["᥀"] = "lo"
}

-- translit any words or phrases
function export.tr(text, lang, sc)
    text = mw.ustring.gsub(text, "([ᤁᤂᤃᤄᤅᤆᤇᤈᤉᤊᤋᤌᤍᤎᤏᤐᤑᤒᤓᤔᤕᤖᤗᤘᤙᤚᤛᤜᤝᤞᤀ])᤻", "᤺%1⌫") -- treat underscore as kemphreng
    text = mw.ustring.gsub(text, "([ᤁᤂᤃᤄᤅᤆᤇᤈᤉᤊᤋᤌᤍᤎᤏᤐᤑᤒᤓᤔᤕᤖᤗᤘᤙᤚᤛᤜᤝᤞᤀ])" .. "([ᤪᤫᤩ]?)" .. "([ᤠᤡᤢᤣᤤᤥᤦᤧ	ᤨ]?)" .. "([᤹᤺ᤲ]?)" .. "([ᤰᤱᤳᤴᤵᤶᤷᤸ]?)", function(c, d, e, f, g)
        -- mw.log('match', c, d)
        return (consonants[c] or c) .. (subjoined[d] or d) .. (diacritics[e] or (e ~= "") and e or "ô") .. (special[f] or f) .. (finals[g] or g)
    end)

    text = gsub(text, "[<>]", "")
    text = mw.ustring.gsub(text, ".", nonconsonants)
    text = mw.ustring.gsub(text, "(.)⌫", "")
    text = gsub(text, "aᤣ", "o")
    text = gsub(text, "ᤣᤣ", "ai")
    text = gsub(text, "aᤣᤣ", "au")
    text = mw.ustring.gsub(text, "᤺", "̄")
    text = mw.ustring.gsub(text, "ᤰ", "k")
    text = mw.ustring.gsub(text, "ᤱ", "ṅ")
    text = mw.ustring.gsub(text, "ᤳ", "t")
    text = mw.ustring.gsub(text, "ᤴ", "n")
    text = mw.ustring.gsub(text, "ᤵ", "p")
    text = mw.ustring.gsub(text, "ᤶ", "m")
    text = mw.ustring.gsub(text, "ᤷ", "r")
    text = mw.ustring.gsub(text, "ᤸ", "l")
    text = gsub(text, "̄ᤣ", "ō")
    text = mw.ustring.gsub(text, "aō", "ō")
    return mw.ustring.toNFC(text)
end

return export
