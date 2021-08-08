local m_subvarieties = require("labels/data/subvarieties")

local labels = {}

for key, val in pairs(m_subvarieties.labels) do if val.languages then labels[key] = val end end

return labels
