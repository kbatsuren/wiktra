local export = {}

for code, data in pairs(mw.loadData("etymology languages/data")) do export[data.canonicalName] = code end

return export
