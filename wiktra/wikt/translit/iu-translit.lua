local export = {}

function export.tr(text, lang, sc)
    text = require("Cans-translit").tr(text, lang, sc)

    local repl = {["ī"] = "ii", ["ō"] = "uu", ["ā"] = "aa", ["š"] = "sh", ["ð"] = "th", ["e"] = "ai", ["o"] = "u", ["y"] = "j", ["f"] = "v", ["c"] = "g"}

    for char, replacement in pairs(repl) do text = mw.ustring.gsub(text, char, replacement) end

    return text
end

return export
