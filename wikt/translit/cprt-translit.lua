local export = {}

local chars = {
    ["𐠀"] = "a",
    ["𐠁"] = "e",
    ["𐠂"] = "i",
    ["𐠃"] = "o",
    ["𐠄"] = "u",

    ["𐠅"] = "ja",
    -- je not in Unicode
    -- ji not in Unicode
    ["𐠈"] = "jo",
    -- ju not in Unicode

    ["𐠊"] = "ka",
    ["𐠋"] = "ke",
    ["𐠌"] = "ki",
    ["𐠍"] = "ko",
    ["𐠎"] = "ku",

    ["𐠏"] = "la",
    ["𐠐"] = "le",
    ["𐠑"] = "li",
    ["𐠒"] = "lo",
    ["𐠓"] = "lu",

    ["𐠔"] = "ma",
    ["𐠕"] = "me",
    ["𐠖"] = "mi",
    ["𐠗"] = "mo",
    ["𐠘"] = "mu",

    ["𐠙"] = "na",
    ["𐠚"] = "ne",
    ["𐠛"] = "ni",
    ["𐠜"] = "no",
    ["𐠝"] = "nu",

    ["𐠞"] = "pa",
    ["𐠟"] = "pe",
    ["𐠠"] = "pi",
    ["𐠡"] = "po",
    ["𐠢"] = "pu",

    ["𐠣"] = "ra",
    ["𐠤"] = "re",
    ["𐠥"] = "ri",
    ["𐠦"] = "ro",
    ["𐠧"] = "ru",

    ["𐠨"] = "sa",
    ["𐠩"] = "se",
    ["𐠪"] = "si",
    ["𐠫"] = "so",
    ["𐠬"] = "su",

    ["𐠭"] = "ta",
    ["𐠮"] = "te",
    ["𐠯"] = "ti",
    ["𐠰"] = "to",
    ["𐠱"] = "tu",

    ["𐠲"] = "wa",
    ["𐠳"] = "we",
    ["𐠴"] = "wi",
    ["𐠵"] = "wo",
    -- wu not in Unicode

    ["𐠷"] = "ksa",
    ["𐠸"] = "kse",
    -- ksi not in Unicode
    ["𐠿"] = "kso",
    -- ksu not in Unicode

    ["𐠼"] = "za"
    -- ze not in Unicode
    -- zi not in Unicode
    -- zo not in Unicode
    -- zu not in Unicode
}

function export.tr(text, lang, sc)
    local ret = {}

    for c in mw.ustring.gmatch(text, ".") do table.insert(ret, chars[c] or c) end

    return table.concat(ret, "-")
end

return export
