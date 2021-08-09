local export = {}

for code, data in pairs(require("languages/alldata")) do
    export[data[1]] = code

    if data.otherNames then for i, otherName in pairs(data.otherNames) do if not export[otherName] then export[otherName] = code end end end

    if data.aliases then for i, alias in pairs(data.aliases) do if not export[alias] then export[alias] = code end end end
end

return export
