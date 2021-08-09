local export = {}

local tt = {}

tt["Latn"] = {
    ["ka"] = "ᨀ",
    ["ki"] = "ᨀᨗ",
    ["ku"] = "ᨀᨘ",
    ["ke"] = "ᨀᨙ",
    ["ko"] = "ᨀᨚ",
    ["ga"] = "ᨁ",
    ["gi"] = "ᨁᨗ",
    ["gu"] = "ᨁᨘ",
    ["ge"] = "ᨁᨙ",
    ["go"] = "ᨁᨚ",
    ["pa"] = "ᨄ",
    ["pi"] = "ᨄᨗ",
    ["pu"] = "ᨄᨘ",
    ["pe"] = "ᨄᨙ",
    ["po"] = "ᨄᨚ",
    ["ba"] = "ᨅ",
    ["bi"] = "ᨅᨗ",
    ["bu"] = "ᨅᨘ",
    ["be"] = "ᨅᨙ",
    ["bo"] = "ᨅᨚ",
    ["ma"] = "ᨆ",
    ["mi"] = "ᨆᨗ",
    ["mu"] = "ᨆᨘ",
    ["me"] = "ᨆᨙ",
    ["mo"] = "ᨆᨚ",
    ["ta"] = "ᨈ",
    ["ti"] = "ᨈᨗ",
    ["tu"] = "ᨈᨘ",
    ["te"] = "ᨈᨙ",
    ["to"] = "ᨈᨚ",
    ["da"] = "ᨉ",
    ["di"] = "ᨉᨗ",
    ["du"] = "ᨉᨘ",
    ["de"] = "ᨉᨙ",
    ["do"] = "ᨉᨚ",
    ["na"] = "ᨊ",
    ["ni"] = "ᨊᨗ",
    ["nu"] = "ᨊᨘ",
    ["ne"] = "ᨊᨙ",
    ["no"] = "ᨊᨚ",
    ["ca"] = "ᨌ",
    ["ci"] = "ᨌᨗ",
    ["cu"] = "ᨌᨘ",
    ["ce"] = "ᨌᨙ",
    ["co"] = "ᨌᨚ",
    ["ja"] = "ᨍ",
    ["ji"] = "ᨍᨗ",
    ["ju"] = "ᨍᨘ",
    ["je"] = "ᨍᨙ",
    ["jo"] = "ᨍᨚ",
    ["ya"] = "ᨐ",
    ["yi"] = "ᨐᨗ",
    ["yu"] = "ᨐᨘ",
    ["ye"] = "ᨐᨙ",
    ["yo"] = "ᨐᨚ",
    ["ra"] = "ᨑ",
    ["ri"] = "ᨑᨗ",
    ["ru"] = "ᨑᨘ",
    ["re"] = "ᨑᨙ",
    ["ro"] = "ᨑᨚ",
    ["la"] = "ᨒ",
    ["li"] = "ᨒᨗ",
    ["lu"] = "ᨒᨘ",
    ["le"] = "ᨒᨙ",
    ["lo"] = "ᨒᨚ",
    ["wa"] = "ᨓ",
    ["wi"] = "ᨓᨗ",
    ["wu"] = "ᨓᨘ",
    ["we"] = "ᨓᨙ",
    ["wo"] = "ᨓᨚ",
    ["sa"] = "ᨔ",
    ["si"] = "ᨔᨗ",
    ["su"] = "ᨔᨘ",
    ["se"] = "ᨔᨙ",
    ["so"] = "ᨔᨚ",
    ["ha"] = "ᨖ",
    ["hi"] = "ᨖᨗ",
    ["hu"] = "ᨖᨘ",
    ["he"] = "ᨖᨙ",
    ["ho"] = "ᨖᨚ",
    ["a"] = "ᨕ",
    ["i"] = "ᨕᨗ",
    ["u"] = "ᨕᨘ",
    ["e"] = "ᨕᨙ",
    ["o"] = "ᨕᨚ",

    ["nga"] = "ᨂ",
    ["ngi"] = "ᨂᨗ",
    ["ngu"] = "ᨂᨘ",
    ["nge"] = "ᨂᨙ",
    ["ngo"] = "ᨂᨚ",
    ["nya"] = "ᨎ",
    ["nyi"] = "ᨎᨗ",
    ["nyu"] = "ᨎᨘ",
    ["nye"] = "ᨎᨙ",
    ["nyo"] = "ᨎᨚ"
};

function export.tr(text, lang, sc)
    if (sc == "Latn") then
        -- Lowercase
        text = mw.ustring.lower(text)
        -- Remove glottal stop
        text = mw.ustring.gsub(text, "\'", "")
        -- Replace character clusters
        text = mw.ustring.gsub(text, "ng[aeiou]", tt[sc])
        text = mw.ustring.gsub(text, "ny[aeiou]", tt[sc])
        -- Replace the rest of the characters
        text = mw.ustring.gsub(text, "[kgnpbmtdnrcjyclwsh][aeiou]", tt[sc])
        -- Replace one-vowel syllables
        text = mw.ustring.gsub(text, "[aeiou]", tt[sc])
        -- Remove left-overs
        text = mw.ustring.gsub(text, "[kgnpbmtdnrcjyclwsh-]", "")
    end
    return mw.ustring.toNFC(text)
end

return export
