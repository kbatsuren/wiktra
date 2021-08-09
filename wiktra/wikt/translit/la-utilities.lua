local m_links = require("links")

local export = {}

local lang = require("languages").getByCode("la")

-- A wrapper function allowing the contents of this module to be called from
-- templates. For example, '{{#invoke:la-utilities|main|strip_macrons|mȳthos}}'
-- produces 'mythos'.
function export.main(frame)
    if (frame.args[1] == "strip_macrons") then return lang:makeEntryName(frame.args[2]) end
    if type(p[frame.args[1]]) == "function" then
        return p[frame.args[1]](frame.args[2], frame.args[3])
    else
        return p[frame.args[1]][frame.args[2]]
    end
end

function export.strip_macrons(frame_or_text)
    if type(frame_or_text) == "table" then frame_or_text = frame_or_text.args[1] end
    return lang:makeEntryName(frame_or_text)
end

local patterns = {{"tūdō", "tūdin"}, {"is", ""}, {"ēs", ""}, {"āns", "ant"}, {"ēns", "ent"}, {"ōns", "ont"}, {"ceps", "cipit"}, {"us", "or"}, {"ex", "ic"}, {"ma", "mat"}, {"e", ""}, {"al", "āl"}, {"ar", "ār"}, {"men", "min"}, {"er", "r"}, {"or", "ōr"}, {"gō", "gin"}, {"ō", "ōn"}, {"ps", "p"}, {"bs", "b"}, {"s", "t"}, {"x", "c"}}

function export.make_stem2(stem)
    for _, pattern in ipairs(patterns) do
        local key = pattern[1]
        local val = pattern[2]
        if mw.ustring.match(stem, key .. "$") then
            stem = mw.ustring.gsub(stem, key .. "$", val)
            require("debug").track("la-utilities/" .. key)
            return stem
        end
    end
    require("debug").track("la-utilities")
    return stem
end

return export
