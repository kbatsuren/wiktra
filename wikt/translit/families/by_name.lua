local export = {}

for code, data in pairs(mw.loadData("families/data")) do export[data.canonicalName] = code end

return export
