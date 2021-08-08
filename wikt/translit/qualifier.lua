local export = {}

function export.format_qualifier(list)
    if type(list) ~= "table" then list = {list} end

    if #list == 0 then return "" end

    return "<span class=\"ib-brac qualifier-brac\">(</span>" .. "<span class=\"ib-content qualifier-content\">" .. table.concat(list, "<span class=\"ib-comma qualifier-comma\">,</span> ") .. "</span><span class=\"ib-brac qualifier-brac\">)</span>"
end

function export.qualifier_t(frame)
    local params = {[1] = {list = true, required = true}}

    local args = require("parameters").process(frame:getParent().args, params)

    local subvarieties = mw.loadData("qualifier/subvarieties")

    for i, label in ipairs(args[1]) do
        if subvarieties[label] then
            require("debug").track("qualifier/subvarieties")
            --[[
				currently not working:
			local lang = subvarieties[label].languages[1]
			require("debug").track("qualifier/subvarieties/" .. lang)
			]]
        end
    end

    return export.format_qualifier(args[1])
end

function export.sense(list) return export.format_qualifier(list) .. "<span class=\"ib-colon sense-qualifier-colon\">:</span>" end

function export.sense_t(frame)
    local params = {[1] = {list = true, required = true}}
    local args = require("parameters").process(frame:getParent().args, params)

    return export.sense(args[1])
end

function export.gloss_t(frame)
    local params = {[1] = {required = true}}
    local args = require("parameters").process(frame:getParent().args, params)

    return "<span class=\"gloss-brac\">(</span><span class=\"gloss-content\">" .. args[1] .. "</span><span class=\"gloss-brac\">)</span>"
end

function export.non_gloss_definition_t(frame)
    local params = {[1] = {required = true}}
    local args = require("parameters").process(frame:getParent().args, params)

    return "<span class=\"use-with-mention\">" .. require("links").english_links(args[1]) .. "</span>"
end

return export
