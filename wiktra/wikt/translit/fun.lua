local export = {}

local ustring = mw.ustring
local libraryUtil = require "libraryUtil"
local checkType = libraryUtil.checkType
local checkTypeMulti = libraryUtil.checkTypeMulti

local iterableTypes = {"table", "string"}

local function _check(funcName, expectType)
    if type(expectType) == "string" then
        return function(argIndex, arg, nilOk) return checkType(funcName, argIndex, arg, expectType, nilOk) end
    else
        return function(argIndex, arg, expectType, nilOk)
            if type(expectType) == "table" then
                if not (nilOk and arg == nil) then return checkTypeMulti(funcName, argIndex, arg, expectType) end
            else
                return checkType(funcName, argIndex, arg, expectType, nilOk)
            end
        end
    end
end

-- Iterate over UTF-8-encoded codepoints in string.
local function iterString(str)
    local iter = string.gmatch(str, "[%z\1-\127\194-\244][\128-\191]*")
    local i = 0
    local function iterator()
        i = i + 1
        local char = iter()
        if char then return i, char end
    end

    return iterator
end

function export.chain(func1, func2, ...) return func1(func2(...)) end

--	map(function(number) return number ^ 2 end,
--		{ 1, 2, 3 })									--> { 1, 4, 9 }
--	map(function (char) return string.char(string.byte(char) - 0x20) end,
--		"abc")											--> { "A", "B", "C" }
function export.map(func, iterable, isArray)
    local check = _check "map"
    check(1, func, "function")
    check(2, iterable, iterableTypes)

    local array = {}
    local iterator = type(iterable) == "string" and iterString or (isArray or iterable[1] ~= nil) and ipairs or pairs
    for i_or_k, val in iterator(iterable) do array[i_or_k] = func(val, i_or_k, iterable) end
    return array
end

function export.mapIter(func, iter, iterable, initVal)
    local check = _check "mapIter"
    check(1, func, "function")
    check(2, iter, "function")
    check(3, iterable, iterableTypes, true)

    -- initVal could be anything

    local array = {}
    local i = 0
    for x, y in iter, iterable, initVal do
        i = i + 1
        array[i] = func(y, x, iterable)
    end
    return array
end

function export.forEach(func, iterable, isArray)
    local check = _check "forEach"
    check(1, func, "function")
    check(2, iterable, iterableTypes)

    local iterator = type(iterable) == "string" and iterString or (isArray or iterable[1] ~= nil) and ipairs or pairs
    for i_or_k, val in iterator(iterable) do func(val, i_or_k, iterable) end
    return nil
end

-------------------------------------------------
-- From http://lua-users.org/wiki/CurriedLua
-- reverse(...) : take some tuple and return a tuple of elements in reverse order
--
-- e.g. "reverse(1,2,3)" returns 3,2,1
local function reverse(...)
    -- reverse args by building a function to do it, similar to the unpack() example
    local function reverseHelper(acc, v, ...)
        if select("#", ...) == 0 then
            return v, acc()
        else
            return reverseHelper(function() return v, acc() end, ...)
        end
    end

    -- initial acc is the end of the list
    return reverseHelper(function() return end, ...)
end

function export.curry(func, numArgs)
    -- currying 2-argument functions seems to be the most popular application
    numArgs = numArgs or 2

    -- no sense currying for 1 arg or less
    if numArgs <= 1 then return func end

    -- helper takes an argTrace function, and number of arguments remaining to be applied
    local function curryHelper(argTrace, n)
        if n == 0 then
            -- kick off argTrace, reverse argument list, and call the original function
            return func(reverse(argTrace()))
        else
            -- "push" argument (by building a wrapper function) and decrement n
            return function(onearg) return curryHelper(function() return onearg, argTrace() end, n - 1) end
        end
    end

    -- push the terminal case of argTrace into the function first
    return curryHelper(function() return end, numArgs)
end

-------------------------------------------------

--	some(function(val) return val % 2 == 0 end,
--		{ 2, 3, 5, 7, 11 })						--> true
function export.some(func, t, isArray)
    if isArray or t[1] ~= nil then -- array
        for i, v in ipairs(t) do if func(v, i, t) then return true end end
    else
        for k, v in pairs(t) do if func(v, k, t) then return true end end
    end
    return false
end

--	all(function(val) return val % 2 == 0 end,
--		{ 2, 4, 8, 10, 12 })					--> true
function export.all(func, t, isArray)
    if isArray or t[1] ~= nil then -- array
        for i, v in ipairs(t) do if not func(v, i, t) then return false end end
    else
        for k, v in pairs(t) do if not func(v, k, t) then return false end end
    end
    return true
end

function export.filter(func, t, isArray)
    local new_t = {}
    if isArray or t[1] ~= nil then -- array
        local new_i = 0
        for i, v in ipairs(t) do
            if func(v, i, t) then
                new_i = new_i + 1
                new_t[new_i] = v
            end
        end
    else
        for k, v in pairs(t) do
            if func(v, k, t) then
                new_t[k] = v -- or create array?
            end
        end
    end
    return new_t
end

function export.fold(func, t, accum)
    for i, v in ipairs(t) do accum = func(accum, v, i, t) end
    return accum
end

-------------------------------
-- Fancy stuff
local function capture(...)
    local vals = {n = select("#", ...), ...}
    return function() return unpack(vals, 1, vals.n) end
end

-- Log input and output of function.
-- Receives a function and returns a modified form of that function.
function export.logReturnValues(func, prefix)
    return function(...)
        local inputValues = capture(...)
        local returnValues = capture(func(...))
        if prefix then
            mw.log(prefix, inputValues())
            mw.log(returnValues())
        else
            mw.log(inputValues())
            mw.log(returnValues())
        end
        return returnValues()
    end
end

export.log = export.logReturnValues

-- Convenience function to make all functions in a table log their input and output.
function export.logAll(t)
    for k, v in pairs(t) do if type(v) == "function" then t[k] = export.logReturnValues(v, tostring(k)) end end
    return t
end

----- M E M O I Z A T I O N-----
-- metamethod that does the work
-- Currently supports one argument and one return value.
local func_key = {}
local function callMethod(self, x)
    local output = self[x]
    if not output then
        output = self[func_key](x)
        self[x] = output
    end
    return output
end

-- shared metatable
local mt = {__call = callMethod}

-- Create callable table.
function export.memoize(func) return setmetatable({[func_key] = func}, mt) end

-------------------------------

return export
