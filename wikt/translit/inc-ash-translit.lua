local export = {}

function export.tr(text, lang, sc, debug_mode)

    local out_text
    if (sc == "Brah") then
        out_text = require("Brah-translit").tr(text, lang, sc, debug_mode)
    elseif (sc == "Khar") then
        out_text = require("Khar-translit").tr(text, lang, sc, debug_mode)
    else
        local namespace = mw.title:getCurrentTitle().nsText
        if namespace == "Category" then
            out_text = nil
        else
            error("Invalid script for Ashokan Prakrit language.")
        end
    end

    return out_text

end

return export
