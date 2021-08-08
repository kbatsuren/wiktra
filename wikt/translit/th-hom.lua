local export = {}
local lang = require("languages").getByCode("th")
local PAGENAME = mw.title.getCurrentTitle().text

local function getHomophones(reading) return require("th-hom/data")[reading] or {} end

-- can be called from another module
function export.makeList(reading)

    local result = {}
    local categories = {}

    local homList = getHomophones(reading)
    if #homList > 1 then
        for _, term in ipairs(homList) do
            -- skip if same word
            if term ~= PAGENAME then table.insert(result, require("links").full_link({lang = lang, term = term, tr = "-"})) end
        end
        if mw.title.getCurrentTitle().namespace == 0 then table.insert(categories, "Thai terms with homophones") end
    end

    return table.concat(result, ", ") .. require("utilities").format_categories(categories, lang)

end

function export.show(frame)

    local args = frame:getParent().args
    local reading = args[1] or PAGENAME
    local output = export.makeList(reading)

    if output ~= "" then output = "Homophones: " .. output end
    return output

end

return export
