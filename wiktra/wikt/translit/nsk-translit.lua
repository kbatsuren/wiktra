local export = {}

local replacements = {["c"] = "ch", ["ī"] = "ii", ["ō"] = "oo", ["ā"] = "aa", ["o"] = "u", ["š"] = "sh", ["ð"] = "th", ["(.)ː"] = "%1%1", "[ᔌᔍᔎᔏ]", {["ᔌ"] = "spwaa", ["ᔍ"] = "stwaa", ["ᔎ"] = "skwaa", ["ᔏ"] = "schwaa"}}

function export.tr(text, lang, sc)
    text = require("Cans-translit").tr(text, lang, sc)

    for regex, replacement in pairs(replacements) do text = mw.ustring.gsub(text, regex, replacement) end

    return text
end

return export
