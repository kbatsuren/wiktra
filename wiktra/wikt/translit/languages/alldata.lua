local modules = {
    ["languages/data2"] = true,
    ["languages/data3/a"] = true,
    ["languages/data3/b"] = true,
    ["languages/data3/c"] = true,
    ["languages/data3/d"] = true,
    ["languages/data3/e"] = true,
    ["languages/data3/f"] = true,
    ["languages/data3/g"] = true,
    ["languages/data3/h"] = true,
    ["languages/data3/i"] = true,
    ["languages/data3/j"] = true,
    ["languages/data3/k"] = true,
    ["languages/data3/l"] = true,
    ["languages/data3/m"] = true,
    ["languages/data3/n"] = true,
    ["languages/data3/o"] = true,
    ["languages/data3/p"] = true,
    ["languages/data3/q"] = true,
    ["languages/data3/r"] = true,
    ["languages/data3/s"] = true,
    ["languages/data3/t"] = true,
    ["languages/data3/u"] = true,
    ["languages/data3/v"] = true,
    ["languages/data3/w"] = true,
    ["languages/data3/x"] = true,
    ["languages/data3/y"] = true,
    ["languages/data3/z"] = true,
    ["languages/datax"] = true
}

local m = {}

for mname in pairs(modules) do
    for key, value in pairs(require(mname)) do m[key] = value end
    local xname = mname:gsub("data", "data")
    for lkey, lvalue in pairs(require(xname)) do if m[lkey] then for key, value in pairs(lvalue) do m[lkey][key] = lvalue[key] end end end
end

return m
