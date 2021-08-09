local export = {}

local tt = {
    -- consonants
    ["𐴀"] = "",
    ["𐴁"] = "b",
    ["𐴃"] = "t",
    ["𐴄"] = "th",
    ["𐴅"] = "j",
    ["𐴆"] = "ch",
    ["𐴇"] = "h",
    ["𐴈"] = "kh",
    ["𐴉"] = "f",
    ["𐴂"] = "p",
    ["𐴊"] = "d",
    ["𐴋"] = "dh",
    ["𐴌"] = "r",
    ["𐴍"] = "ç",
    ["𐴎"] = "z",
    ["𐴏"] = "s",
    ["𐴐"] = "c",
    ["𐴑"] = "k",
    ["𐴒"] = "g",
    ["𐴓"] = "l",
    ["𐴔"] = "m",
    ["𐴕"] = "n",
    ["𐴖"] = "w",
    ["𐴗"] = "u̯",
    ["𐴘"] = "y",
    ["𐴙"] = "i̯",
    ["𐴚"] = "ng",
    ["𐴛"] = "ny",
    ["𐴜"] = "v",

    -- vowels
    ["𐴝"] = "a",
    ["𐴞"] = "i",
    ["𐴟"] = "u",
    ["𐴠"] = "e",
    ["𐴡"] = "o",
    ["𐴢"] = "",

    -- numerals
    ["𐴰"] = "0",
    ["𐴱"] = "1",
    ["𐴲"] = "2",
    ["𐴳"] = "3",
    ["𐴴"] = "4",
    ["𐴵"] = "5",
    ["𐴶"] = "6",
    ["𐴷"] = "7",
    ["𐴸"] = "8",
    ["𐴹"] = "9"
};

function export.tr(text, lang, sc)
    text = mw.ustring.gsub(text, ".", tt)
    text = mw.ustring.gsub(text, "(.)𐴤", "%1́")
    text = mw.ustring.gsub(text, "(.)𐴥", "%1́%1")
    text = mw.ustring.gsub(text, "(.)𐴦", "%1%1́")
    text = mw.ustring.gsub(text, "(.)𐴧", "%1%1")
    return text
end

return export
