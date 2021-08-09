local Array = {}
local array_constructor

-- Copy table library so as not to unexpectedly change the behavior of code that
-- uses it.
local array_methods = mw.clone(table)

-- Create version of table.sort that returns the table.
array_methods.sort = function(t, comp)
    table.sort(t, comp)
    return t
end

-- ipairs and unpack operate on arrays.
array_methods.ipairs = ipairs
array_methods.unpack = unpack

function array_methods:type()
    local mt = getmetatable(self)
    return type(mt) == "table" and mt.__type or nil
end

function array_methods:adjustIndex(index)
    index = math.floor(index)
    if index < 0 then index = #self + index + 1 end
    return index
end

-- string.sub-style slicing.
function array_methods:slice(i, j)
    if i == nil then
        i = 1
    elseif type(i) == "number" then
        i = self:adjust_index(i)
    else
        error("Expected number, got " .. type(i))
    end

    if j == nil or type(j) == "number" then
        j = self:adjust_index(j or -1)
    else
        error("Expected number, got " .. type(j))
    end

    local new_arr = array_constructor()
    local k = 0
    for index = i, j do
        k = k + 1
        new_arr[k] = self[index]
    end
    return new_arr
end

-- A function to convert string key-table modules such
-- as [[Module:languages/data2]] into arrays.
-- "from" is a bad name.
-- field_for_key supplies the field name in which the
-- key will be stored.
local function to_array(map, field_for_key)
    m_table = m_table or require "table"

    local arr = {}
    local i = 0
    for key, val in pairs(map) do
        i = i + 1
        local new_val = m_table.shallowcopy(val)
        if field_for_key then new_val[field_for_key] = key end
        arr[i] = new_val
    end

    return array_constructor(arr)
end

-- Functions from [[Module:table]] that operate on arrays or sparse arrays.
-- List copied from [[Module:table/documentation]].
local operate_on_array = {
    -- non-sparse
    "removeDuplicates", "length", "contains", "serialCommaJoin", "reverseIpairs", "reverse", "invert", "listToSet", "isArray", -- sparse
    "numKeys", "maxIndex", "compressSparseArray", "sparseIpairs", -- tables in general
    "shallowcopy", "deepcopy"
}

-- Not all of these operate on arrays.
local create_new_array = {
    -- Functions from [[Module:table]] that create an array.
    -- List copied from [[Module:table/documentation]].
    "removeDuplicates", "numKeys", "affixNums", "compressSparseArray", "keysToList", "reverse", -- Functions from [[Module:table]] that create an table.
    "shallowcopy", "deepcopy", -- Functions from [[Module:fun]] that create an array.
    "map", "filter"
}

-- Functions from [[Module:fun]] that take an array in the second argument.
-- They just have to have the argument order reversed to work as methods of the
-- array object.
local second_argument_is_array = {"map", "some", "all", "filter"}

-- Add aliases for the functions from [[Module:table]] whose names
-- contain "array" or "list", which is redundant, and whose names don't conform
-- to the usual camel case.
-- The key redirects to the value.
local alias_of = {compress = "compressSparseArray", keys = "keysToList", toSet = "listToSet", deepCopy = "deepcopy", shallowCopy = "shallowcopy"}

local function get_module_function(key, module, module_name) return module[key] or error("No function named " .. tostring(key) .. " in Module:" .. module_name) end

local function wrap_in_array_constructor(func) return function(...) return array_constructor(func(...)) end end

local function create_array_generating_func(key, module, module_name) return wrap_in_array_constructor(get_module_function(key, module, module_name)) end

local function reverse_arguments(func) return function(a, b) return func(b, a, true) end end

local function underscore_to_camel_case(str)
    if type(str) ~= "string" then return str end
    str = str:gsub("_(.)", string.upper)
    return str
end

local m_table, m_fun
local Array = {}
Array.__type = "array"
function Array:__index(key)
    if type(key) ~= "string" then return nil end

    -- Convert underscores to camel case: num_keys -> numKeys.
    key = underscore_to_camel_case(key)

    local val = array_methods[key]
    if val then return val end

    key = alias_of[key] or key

    local func
    m_table = m_table or require "table"
    if m_table.contains(operate_on_array, key) then
        if m_table.contains(create_new_array, key) then
            func = create_array_generating_func(key, m_table, "table")
        else
            func = m_table[key]
        end
    elseif m_table.contains(second_argument_is_array, key) then
        m_fun = m_fun or require "fun"

        local raw_func = reverse_arguments(get_module_function(key, m_fun, "fun"))
        if m_table.contains(create_new_array, key) then
            func = wrap_in_array_constructor(raw_func)
        else
            func = raw_func
        end
    elseif key == "fold" then
        m_fun = m_fun or require "fun"

        local raw_func = get_module_function(key, m_fun, "fun")
        func = function(t, func, accum) return raw_func(func, t, accum) end
    end

    if func then
        array_methods[key] = func
        return func
    end
end

function Array.__add(a, b)
    if type(a) == "table" and type(b) == "table" then
        m_table = m_table or require "table"

        local new_arr = array_constructor(m_table.shallowcopy(a))

        for _, val in ipairs(b) do new_arr:insert(val) end

        return new_arr
    end
end

function Array:new(...)
    local arr
    if select("#", ...) == 1 and type((...)) == "table" then
        arr = ...

        local mt = getmetatable(arr)
        -- If table has been loaded with mw.loadData, copy it to avoid the
        -- limitations of it being a virtual table.
        if mt and mt.mw_loadData then
            m_table = m_table or require "table"
            arr = m_table.shallowcopy(arr)
        end
    else
        arr = {...}
    end
    return setmetatable(arr, self)
end

-- Declared as local above.
function array_constructor(...) return Array:new(...) end

local array_generating_funcs = {from = to_array}
local Array_library_mt = {__call = Array.new, __index = array_generating_funcs}
setmetatable(Array, Array_library_mt)

function Array_library_mt:__index(key)
    key = underscore_to_camel_case(key)
    key = alias_of[key] or key

    if array_generating_funcs[key] then return array_generating_funcs[key] end

    m_table = m_table or require "table"

    if m_table.contains(create_new_array, key) then
        local func = create_array_generating_func(key, m_table, "table")
        array_generating_funcs[key] = func
        return func
    end
end

return Array
