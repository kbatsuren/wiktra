local export = {}
local gsub = mw.ustring.gsub
local consonants = {["ᤁ"] = "क", ["ᤂ"] = "ख", ["ᤃ"] = "ग", ["ᤄ"] = "घ", ["ᤅ"] = "ङ", ["ᤆ"] = "च", ["ᤇ"] = "छ", ["ᤈ"] = "ज", ["ᤉ"] = "झ", ["ᤊ"] = "ञ", ["ᤋ"] = "त", ["ᤌ"] = "थ", ["ᤍ"] = "द", ["ᤎ"] = "ध", ["ᤏ"] = "न", ["ᤐ"] = "प", ["ᤑ"] = "फ", ["ᤒ"] = "ब", ["ᤓ"] = "भ", ["ᤔ"] = "म", ["ᤕ"] = "य", ["ᤖ"] = "र", ["ᤗ"] = "ल", ["ᤘ"] = "व", ["ᤙ"] = "श", ["ᤚ"] = "ष", ["ᤛ"] = "स", ["ᤜ"] = "ह", ["ᤝ"] = "ज्ञ", ["ᤞ"] = "त्र", ["ᤀ"] = "अ"}
local diacritics = {["ᤠ"] = "ा", ["ᤡ"] = "ि", ["ᤢ"] = "ु", ["ᤣ"] = "े", ["ᤤ"] = "ै", ["ᤥ"] = "ो", ["ᤦ"] = "ौ", ["ᤧ"] = "े़", ["ᤨ"] = "ो़"}

-- ['ᤧ']='ॅ' , --['ᤨ']='',

local special = {
    ["᤹"] = "ॽ", -- mukphreng (glottalizer)
    ["ᤲ"] = "ं" -- anusvara (now obsolete)
}

local subjoined = {["ᤪ"] = "्र", ["ᤫ"] = "्व", ["ᤩ"] = "्य"}

local finals = {["ᤰ"] = "क्", ["ᤱ"] = "ङ्", ["ᤳ"] = "त्", ["ᤴ"] = "न्", ["ᤵ"] = "प्", ["ᤶ"] = "म्", ["ᤷ"] = "र्", ["ᤸ"] = "ल्"}

local nonconsonants = {

    -- digits
    ["᥆"] = "०",
    ["᥇"] = "१",
    ["᥈"] = "२",
    ["᥉"] = "३",
    ["᥊"] = "४",
    ["᥋"] = "५",
    ["᥌"] = "६",
    ["᥍"] = "७",
    ["᥎"] = "८",
    ["᥏"] = "९",
    ["॥"] = "॥",
    ["᥄"] = "!",
    ["᥅"] = "?",
    ["."] = ",",
    ["᥀"] = "लो"
}

-- translit any words or phrases
function export.tr(text, lang, sc)
    text = mw.ustring.gsub(text, "([ᤁᤂᤃᤄᤅᤆᤇᤈᤉᤊᤋᤌᤍᤎᤏᤐᤑᤒᤓᤔᤕᤖᤗᤘᤙᤚᤛᤜᤝᤞᤀ])᤻", "᤺%1") -- treat underscore as kemphreng
    text = mw.ustring.gsub(text, "([ᤁᤂᤃᤄᤅᤆᤇᤈᤉᤊᤋᤌᤍᤎᤏᤐᤑᤒᤓᤔᤕᤖᤗᤘᤙᤚᤛᤜᤝᤞᤀ])" .. "([ᤪᤫᤩ]?)" .. "([ᤠᤡᤢᤣᤤᤥᤦᤧ	ᤨ]?)" .. "([᤹᤺ᤲ]?)" .. "([ᤰᤱᤳᤴᤵᤶᤷᤸ]?)", function(c, d, e, f, g)
        -- mw.log('match', c, d)
        return (consonants[c] or c) .. (subjoined[d] or d) .. (diacritics[e] or (e ~= "") and e or "") .. (special[f] or f) .. (finals[g] or g)
    end)

    text = mw.ustring.gsub(text, ".", nonconsonants)
    text = mw.ustring.gsub(text, "(.)⌫", "")
    text = gsub(text, "ाᤣ", "ो")
    text = gsub(text, "ᤣᤣ", "ै")
    text = gsub(text, "ाᤣᤣ", "ौ")
    text = gsub(text, "ाःᤣ", "ओः")
    text = mw.ustring.gsub(text, "᤺", "ः")
    -- text = mw.ustring.gsub(text, 'िः', 'ी')
    -- text = mw.ustring.gsub(text, 'ुः', 'ू')
    text = mw.ustring.gsub(text, "ᤰ", "क्")
    text = mw.ustring.gsub(text, "ᤱ", "ङ्")
    text = mw.ustring.gsub(text, "ᤳ", "त्")
    text = mw.ustring.gsub(text, "ᤴ", "न्")
    text = mw.ustring.gsub(text, "ᤵ", "प्")
    text = mw.ustring.gsub(text, "ᤶ", "म्")
    text = mw.ustring.gsub(text, "ᤷ", "र्")
    text = mw.ustring.gsub(text, "ᤸ", "ल्")
    text = mw.ustring.gsub(text, "अा", "आ")
    text = mw.ustring.gsub(text, "अि", "इ")
    text = mw.ustring.gsub(text, "अी", "ई")
    text = mw.ustring.gsub(text, "अु", "उ")
    text = mw.ustring.gsub(text, "अू", "ऊ")
    text = mw.ustring.gsub(text, "अे", "ए")
    text = mw.ustring.gsub(text, "अै", "ऐ")
    text = mw.ustring.gsub(text, "अो", "ओ")
    text = mw.ustring.gsub(text, "अौ", "औ")
    text = mw.ustring.gsub(text, "अॅ", "ऍ")
    text = mw.ustring.gsub(text, "अे़", "ए़")
    text = mw.ustring.gsub(text, "अो़", "ओ़")
    text = gsub(text, "ाःᤣ", "ोः")
    text = mw.ustring.gsub(text, "ाःᤣ", "ोः")
    return mw.ustring.toNFC(text)
end

return export
