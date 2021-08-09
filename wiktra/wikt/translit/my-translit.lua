local export = {}
local gsub = mw.ustring.gsub

local symbols = {["၀"] = "0", ["၁"] = "1", ["၂"] = "2", ["၃"] = "3", ["၄"] = "4", ["၅"] = "5", ["၆"] = "6", ["၇"] = "7", ["၈"] = "8", ["၉"] = "9", ["၊"] = "&#124;", ["။"] = "&#124;&#124;"}

function export.tr(text, lang, sc, debug_mode)
    local m_pron = require("my-pron").get_romanisation
    text = gsub(text, ".", symbols)
    for word in mw.ustring.gmatch(text, "[က-႟ꩠ-ꩻ]+") do
        success, translit = pcall(m_pron, word, nil, {2, ["type"] = "orthographic", ["name"] = "MLCTS"}, 2, "translit_module")
        if success then
            text = gsub(text, word, translit, 1)
        else
            return nil
        end
    end
    if mw.ustring.match(text, "[က-႟ꩠ-ꩻ]") and not debug_mode then return nil end
    return text
end

return export
