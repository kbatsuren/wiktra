local export = {}

local lang = require("languages").getByCode("sa")

function export.Deva_to_SLP_template(frame)
    local params = {[1] = {required = true}}
    local args = require("parameters").process(frame:getParent().args, params)
    return require("sa-utilities/translit/Deva-to-SLP1").tr(args[1])
end

--[=[
Converts Devanagari or IAST to SLP1.
]=]
function export.detect_to_SLP(text)
    local sc = require("scripts").findBestScript(text, lang):getCode()
    if sc == "None" then sc = "IAST" end
    return require("sa-utilities/translit/" .. sc .. "-to-SLP1").tr(text)
end

function export.retrieve_tr_modules(sc)
    local tr = require("sa-utilities/translit/" .. sc .. "-to-SLP1").tr
    local reverse_tr = require("sa-utilities/translit/SLP1-to-" .. sc).tr
    local IAST_tr = require("sa-utilities/translit/IAST-to-SLP1").tr

    local safe_tr = function(text)
        local sc = require("scripts").findBestScript(text, lang):getCode()
        if sc == "None" then
            return IAST_tr(text)
        else
            return tr(text)
        end
    end
    return safe_tr, reverse_tr
end

return export
