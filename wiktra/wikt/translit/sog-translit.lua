local export = {}

function export.tr(text, lang, sc)
    if not sc then sc = require("scripts").findBestScript(text, require("languages").getByCode(lang)):getCode() end
    if sc == "Sogd" then -- transliterate Sogdian
        return require("Sogd-translit").tr(text, lang, sc)
    elseif sc == "Mani" then -- transliterate Manichaean
        return require("Mani-translit").tr(text, lang, sc)
    else
        return nil
    end
end

return export
