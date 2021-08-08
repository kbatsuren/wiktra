local export = {}

function export.typecheck(labels)
    local errors = require "array"()
    for label, data in pairs(labels) do
        local languages, language = data["languages"], data["language"]
        if languages then
            if type(languages) ~= "table" then
                errors:insert("languages value for " .. label .. " is not a table")
            else
                for i, language in ipairs(languages) do
                    if type(language) ~= "string" then
                        errors:insert("value #" .. i .. " in languages value for " .. label .. " is not a string")
                    else
                        data["languages"][language] = true
                    end
                end
            end
        elseif language then
            if type(language) ~= "string" then
                errors:insert("language value for " .. label .. " is not a string")
            else
                data["languages"] = {}
                data["languages"][language] = true
            end
        end
    end
    if #errors > 0 then error(errors:concat ", ") end
end

function export.handle_languages(labels)
    if type(labels) ~= "table" then error("The function \"handle_languages\" requires a table as argument.") end

    if mw.title.getCurrentTitle().fullText:find "Module:labels" then return export.typecheck(labels) end

    for label, data in pairs(labels) do
        local languages, language = data["languages"], data["language"]
        if languages then
            for _, language in ipairs(languages) do languages[language] = true end
        elseif language and language ~= "" then
            data["languages"] = {}
            data["languages"][language] = true
        end
    end
end

return export
