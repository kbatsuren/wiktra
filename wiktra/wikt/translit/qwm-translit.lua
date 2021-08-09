local export = {}

function export.tr(text, lang, sc)
    if sc == "Latn" or sc == "Arab" then
        return nil
    elseif sc == "Armn" then
        return require("Armn-translit").tr(text, lang, sc)
    else
        error("Huệ nương!")
    end
end

return export
