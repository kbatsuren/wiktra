local export = {}

function export.tr(text, lang, sc, debug_mode)

    local out_text
    if (sc == "Shah" or "pa-Arab") then
        out_text = require("pa-Arab-translit").tr(text, lang, sc, debug_mode)
        --	out_text = nil
    else
        local namespace = mw.title:getCurrentTitle().nsText
        if namespace == "Category" then
            out_text = nil
        else
            error("Invalid script for Punjabi language.")
        end
    end

    return out_text

end

return export
