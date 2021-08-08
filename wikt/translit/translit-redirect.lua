local export = {}

function export.tr(text, lang, sc, debug_mode)
    if not sc then sc = require("scripts").findBestScript(text, require("languages").getByCode(lang)):getCode() end

    local language_data = mw.loadData("translit-redirect/data")[lang]

    if language_data then
        local script_data = language_data[sc]

        if script_data then
            if script_data.module then
                local success, translit_module = pcall(require, "Module:" .. script_data.module)

                if success then
                    return translit_module.tr(text, lang, sc, debug_mode)
                else
                    error(translit_module)
                end
            else
                return nil
            end
        else
            require("debug").track {"translit-redirect/incorrect-script/" .. lang, "translit-redirect/incorrect-script/" .. lang .. "/" .. sc}
            mw.log("script code (" .. sc .. ") for language code " .. lang .. " not found in Module:translit-redirect/data; text: " .. text)
        end
    end
end

return export
