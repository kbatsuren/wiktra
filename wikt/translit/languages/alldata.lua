local modules = {
    ["data2"] = true,
    ["data3/a"] = true,
    ["data3/b"] = true,
    ["data3/c"] = true,
    ["data3/d"] = true,
    ["data3/e"] = true,
    ["data3/f"] = true,
    ["data3/g"] = true,
    ["data3/h"] = true,
    ["data3/i"] = true,
    ["data3/j"] = true,
    ["data3/k"] = true,
    ["data3/l"] = true,
    ["data3/m"] = true,
    ["data3/n"] = true,
    ["data3/o"] = true,
    ["data3/p"] = true,
    ["data3/q"] = true,
    ["data3/r"] = true,
    ["data3/s"] = true,
    ["data3/t"] = true,
    ["data3/u"] = true,
    ["data3/v"] = true,
    ["data3/w"] = true,
    ["data3/x"] = true,
    ["data3/y"] = true,
    ["data3/z"] = true,
    ["datax"] = true
}

local m = {}

for mname in pairs(modules) do
    for key, value in pairs(require(mname)) do m[key] = value end
    local xname = mname:gsub("data", "extradata")
    for lkey, lvalue in pairs(require(xname)) do if m[lkey] then for key, value in pairs(lvalue) do m[lkey][key] = lvalue[key] end end end
end

return m
