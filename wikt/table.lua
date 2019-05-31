local libraryUtil = require('libraryUtil')

local export = {}

-- Define often-used variables and functions.
local floor = math.floor
local infinity = math.huge
local checkType = libraryUtil.checkType
local checkTypeMulti = libraryUtil.checkTypeMulti

local function _check(funcName, expectType)
	if type(expectType) == "string" then
		return function(argIndex, arg, nilOk)
			checkType(funcName, argIndex, arg, expectType, nilOk)
		end
	else
		return function(argIndex, arg, expectType, nilOk)
			if type(expectType) == "table" then
				checkTypeMulti(funcName, argIndex, arg, expectType, nilOk)
			else
				checkType(funcName, argIndex, arg, expectType, nilOk)
			end
		end
	end
end

--[[
------------------------------------------------------------------------------------
-- isPositiveInteger
--
-- This function returns true if the given value is a positive integer, and false
-- if not. Although it doesn't operate on tables, it is included here as it is
-- useful for determining whether a given table key is in the array part or the
-- hash part of a table.
------------------------------------------------------------------------------------
--]]
function export.isPositiveInteger(v)
	if type(v) == 'number' and v >= 1 and floor(v) == v and v < infinity then
		return true
	else
		return false
	end
end

--[[
------------------------------------------------------------------------------------
-- isNan
--
-- This function returns true if the given number is a NaN value, and false
-- if not. Although it doesn't operate on tables, it is included here as it is
-- useful for determining whether a value can be a valid table key. Lua will
-- generate an error if a NaN is used as a table key.
------------------------------------------------------------------------------------
--]]
function export.isNan(v)
	if type(v) == 'number' and tostring(v) == '-nan' then
		return true
	else
		return false
	end
end

--[[
------------------------------------------------------------------------------------
-- shallowClone
--
-- This returns a clone of a table. The value returned is a new table, but all
-- subtables and functions are shared. Metamethods are respected, but the returned
-- table will have no metatable of its own.
------------------------------------------------------------------------------------
--]]
function export.shallowClone(t)
	local ret = {}
	for k, v in pairs(t) do
		ret[k] = v
	end
	return ret
end

--[[
Shallow copy
]]
function export.shallowcopy(orig)
	local orig_type = type(orig)
	local copy
	if orig_type == 'table' then
		copy = {}
		for orig_key, orig_value in pairs(orig) do
			copy[orig_key] = orig_value
		end
	else -- number, string, boolean, etc
		copy = orig
	end
	return copy
end

--[[
	Recursive deep copy function
	Equivalent to mw.clone?
]]
local function deepcopy(orig, includeMetatable, already_seen)
	-- Stores copies of tables indexed by the original table.
	already_seen = already_seen or {}
	
	local copy = already_seen[orig]
	if copy ~= nil then
		return copy
	end
	
	if type(orig) == 'table' then
		copy = {}
		for orig_key, orig_value in pairs(orig) do
			copy[deepcopy(orig_key, includeMetatable, already_seen)] = deepcopy(orig_value, includeMetatable, already_seen)
		end
		already_seen[orig] = copy
		
		if includeMetatable then
			local mt = getmetatable(orig)
			if mt ~= nil then
				local mt_copy = deepcopy(mt, includeMetatable, already_seen)
				setmetatable(copy, mt_copy)
				already_seen[mt] = mt_copy
			end
		end
	else -- number, string, boolean, etc
		copy = orig
	end
	return copy
end

function export.deepcopy(orig, noMetatable, already_seen)
	checkType("deepcopy", 3, already_seen, "table", true)
	
	return deepcopy(orig, not noMetatable, already_seen)
end

--[[
------------------------------------------------------------------------------------
-- removeDuplicates
--
-- This removes duplicate values from an array. Non-positive-integer keys are
-- ignored. The earliest value is kept, and all subsequent duplicate values are
-- removed, but otherwise the array order is unchanged.
------------------------------------------------------------------------------------
--]]
function export.removeDuplicates(t)
	checkType('removeDuplicates', 1, t, 'table')
	local isNan = export.isNan
	local ret, exists = {}, {}
	local index = 1
	for _, v in ipairs(t) do
		if isNan(v) then
			-- NaNs can't be table keys, and they are also unique, so we don't need to check existence.
			ret[index] = v
			index = index + 1
		else
			if not exists[v] then
				ret[index] = v
				index = index + 1
				exists[v] = true
			end
		end
	end
	return ret
end

--[[
------------------------------------------------------------------------------------
-- numKeys
--
-- This takes a table and returns an array containing the numbers of any numerical
-- keys that have non-nil values, sorted in numerical order.
------------------------------------------------------------------------------------
--]]
function export.numKeys(t)
	checkType('numKeys', 1, t, 'table')
	local isPositiveInteger = export.isPositiveInteger
	local nums = {}
	local index = 1
	for k, _ in pairs(t) do
		if isPositiveInteger(k) then
			nums[index] = k
			index = index + 1
		end
	end
	table.sort(nums)
	return nums
end

--[[
------------------------------------------------------------------------------------
-- affixNums
--
-- This takes a table and returns an array containing the numbers of keys with the
-- specified prefix and suffix.
-- affixNums({a1 = 'foo', a3 = 'bar', a6 = 'baz'}, "a")
--		↓
-- {1, 3, 6}.
------------------------------------------------------------------------------------
--]]
function export.affixNums(t, prefix, suffix)
	local check = _check('affixNums')
	check(1, t, 'table')
	check(2, prefix, 'string', true)
	check(3, suffix, 'string', true)
	
	local function cleanPattern(s)
		-- Cleans a pattern so that the magic characters ()%.[]*+-?^$ are interpreted literally.
		s = s:gsub('([%(%)%%%.%[%]%*%+%-%?%^%$])', '%%%1')
		return s
	end
	
	prefix = prefix or ''
	suffix = suffix or ''
	prefix = cleanPattern(prefix)
	suffix = cleanPattern(suffix)
	local pattern = '^' .. prefix .. '([1-9]%d*)' .. suffix .. '$'
	
	local nums = {}
	local index = 1
	for k, _ in pairs(t) do
		if type(k) == 'string' then
			local num = mw.ustring.match(k, pattern)
			if num then
				nums[index] = tonumber(num)
				index = index + 1
			end
		end
	end
	table.sort(nums)
	return nums
end

--[[
------------------------------------------------------------------------------------
-- numData
--
-- Given a table with keys like ("foo1", "bar1", "foo2", "baz2"), returns a table
-- of subtables in the format
-- { [1] = {foo = 'text', bar = 'text'}, [2] = {foo = 'text', baz = 'text'} }
-- Keys that don't end with an integer are stored in a subtable named "other".
-- The compress option compresses the table so that it can be iterated over with
-- ipairs.
------------------------------------------------------------------------------------
--]]
function export.numData(t, compress)
	local check = _check('numData')
	check(1, t, 'table')
	check(2, compress, 'boolean', true)
	
	local ret = {}
	for k, v in pairs(t) do
		local prefix, num = tostring(k):match('^([^0-9]*)([1-9][0-9]*)$')
		if num then
			num = tonumber(num)
			local subtable = ret[num] or {}
			if prefix == '' then
				-- Positional parameters match the blank string; put them at the start of the subtable instead.
				prefix = 1
			end
			subtable[prefix] = v
			ret[num] = subtable
		else
			local subtable = ret.other or {}
			subtable[k] = v
			ret.other = subtable
		end
	end
	if compress then
		local other = ret.other
		ret = export.compressSparseArray(ret)
		ret.other = other
	end
	return ret
end

--[[
------------------------------------------------------------------------------------
-- compressSparseArray
--
-- This takes an array with one or more nil values, and removes the nil values
-- while preserving the order, so that the array can be safely traversed with
-- ipairs.
------------------------------------------------------------------------------------
--]]
function export.compressSparseArray(t)
	checkType('compressSparseArray', 1, t, 'table')
	local ret = {}
	local index = 1
	local nums = export.numKeys(t)
	for _, num in ipairs(nums) do
		ret[index] = t[num]
		index = index + 1
	end
	return ret
end

--[[
------------------------------------------------------------------------------------
-- sparseIpairs
--
-- This is an iterator for sparse arrays. It can be used like ipairs, but can
-- handle nil values.
------------------------------------------------------------------------------------
--]]
function export.sparseIpairs(t)
	checkType('sparseIpairs', 1, t, 'table')
	local nums = export.numKeys(t)
	local i = 0
	return function()
		i = i + 1
		local key = nums[i]
		if key then
			return key, t[key]
		else
			return nil, nil
		end
	end
end

--[[
------------------------------------------------------------------------------------
-- size
--
-- This returns the size of a key/value pair table. It will also work on arrays,
-- but for arrays it is more efficient to use the # operator.
------------------------------------------------------------------------------------
--]]
function export.size(t)
	checkType('size', 1, t, 'table')
	local i = 0
	for _ in pairs(t) do
		i = i + 1
	end
	return i
end

--[[
-- This returns the length of a table, or the first integer key n counting from
-- 1 such that t[n + 1] is nil. It is similar to the operator #, but may return
-- a different value when there are gaps in the array portion of the table.
-- Intended to be used on data loaded with mw.loadData. For other tables, use #.
--]]
function export.length(t)
	local i = 0
	repeat
		i = i + 1
	until t[i] == nil
	return i - 1
end

--[[
Takes table and a value to be found.
If the value is in the array portion of the table, return true.
If the value is in the hashmap or not in the table, return false.
]]
function export.contains(list, x)
	for _, v in ipairs(list) do
		if v == x then return true end
	end
	return false
end

--[[
	Finds key for specified value in a given table.
	Roughly equivalent to reversing the key-value pairs in the table –
		reversed_table = { [value1] = key1, [value2] = key2, ... }
	– and then returning reversed_table[valueToFind].
	
	The value can only be a string or a number
	(not nil, a boolean, a table, or a function).
	
	Only reliable if there is just one key with the specified value.
	Otherwise, the function returns the first key found,
	and the output is unpredictable.
]]
function export.keyFor(t, valueToFind)
	local check = _check('keyFor')
	check(1, t, 'table')
	check(2, valueToFind, { 'string', 'number' })
	
	for key, value in pairs(t) do
		if value == valueToFind then
			return key
		end
	end
	
	return nil
end

--[[
	The default sorting function used in export.keysToList if no keySort
	is defined.
]]
local function defaultKeySort(key1, key2)
	-- "number" < "string", so numbers will be sorted before strings.
	local type1, type2 = type(key1), type(key2)
	if type1 ~= type2 then
		return type1 < type2
	else
		return key1 < key2
	end
end

--[[
	Returns a list of the keys in a table, sorted using either the default
	table.sort function or a custom keySort function.
	If there are only numerical keys, numKeys is probably more efficient.
]]
function export.keysToList(t, keySort, checked)
	if not checked then
		local check = _check('keysToList')
		check(1, t, 'table')
		check(2, keySort, 'function', true)
	end
	
	local list = {}
	local index = 1
	for key, _ in pairs(t) do
		list[index] = key
		index = index + 1
	end
	
	-- Place numbers before strings, otherwise sort using <.
	if not keySort then
		keySort = defaultKeySort
	end
	
	table.sort(list, keySort)
	
	return list
end

--[[
	Iterates through a table, with the keys sorted using the keysToList function.
	If there are only numerical keys, sparseIpairs is probably more efficient.
]]
function export.sortedPairs(t, keySort)
	local check = _check('keysToList')
	check(1, t, 'table')
	check(2, keySort, 'function', true)
	
	local list = export.keysToList(t, keySort, true)
	
	local i = 0
	return function()
		i = i + 1
		local key = list[i]
		if key ~= nil then
			return key, t[key]
		else
			return nil, nil
		end
	end
end

function export.reverseIpairs(list)
	checkType('reverse_ipairs', 1, list, 'table')
	
	local i = #list + 1
	return function()
		i = i - 1
		if list[i] ~= nil then
			return i, list[i]
		else
			return nil, nil
		end
	end
end

--[=[
	Joins an array with serial comma and serial "and". An improvement on
	mw.text.listToText, which doesn't properly handle serial commas.
	
	Options:
		- italicizeConj
			Italicize conjunction: for [[Module:Template:also]]
		- dontTag
			Don't tag the serial comma and serial "and". For error messages, in
			which HTML cannot be used.
]=]
function export.serialCommaJoin(seq, options)
	local check = _check("serialCommaJoin", "table")
	check(1, seq)
	check(2, options, true)
	
	local length = #seq
	
	if not options then
		options = {}
	end
	
	local conj
	if length > 1 then
		conj = "and"
		if options.italicizeConj then
			conj = "''" .. conj .. "''"
		end
	end
	
	if length == 0 then
		return ""
	elseif length == 1 then
		return seq[1] -- nothing to join
	elseif length == 2 then
		return seq[1] .. " " .. conj .. " " .. seq[2]
	else
		local comma = options.dontTag and "," or '<span class="serial-comma">,</span>'
		conj = options.dontTag and ' ' .. conj .. " " or '<span class="serial-and"> ' .. conj .. '</span> '
		return table.concat(seq, ", ", 1, length - 1) ..
				comma .. conj .. seq[length]
	end
end

--[[
	Concatenates all values in the table that are indexed by a number, in order.
	sparseConcat{ a, nil, c, d }  =>  "acd"
	sparseConcat{ nil, b, c, d }  =>  "bcd"
]]
function export.sparseConcat(t, sep, i, j)
	local list = {}
	
	local list_i = 0
	for _, v in export.sparseIpairs(t) do
		list_i = list_i + 1
		list[list_i] = v
	end
	
	return table.concat(list, sep, i, j)
end

--[[
	Values of numberic keys in array portion of table are reversed:
	{ "a", "b", "c" } -> { "c", "b", "a" }
--]]
function export.reverse(t)
	checkType("reverse", 1, t, "table")
	
	local new_t = {}
	local new_t_i = 1
	for i = #t, 1, -1 do
		new_t[new_t_i] = t[i]
		new_t_i = new_t_i + 1
	end
	return new_t
end

function export.reverseConcat(t, sep, i, j)
	return table.concat(export.reverse(t), sep, i, j)
end

-- { "a", "b", "c" } -> { a = 1, b = 2, c = 3 }
function export.invert(array)
	checkType("invert", 1, array, "table")
	
	local map = {}
	for i, v in ipairs(array) do
		map[v] = i
	end
	
	return map
end

--[[
	{ "a", "b", "c" } -> { ["a"] = true, ["b"] = true, ["c"] = true }
--]]
function export.listToSet(t)
	checkType("listToSet", 1, t, "table")
	
	local set = {}
	for _, item in ipairs(t) do
		set[item] = true
	end
	return set
end

--[[
	Returns true if all keys in the table are consecutive integers starting at 1.
--]]
function export.isArray(t)
	checkType("isArray", 1, t, "table")
	
	local i = 0
	for _ in pairs(t) do
		i = i + 1
		if t[i] == nil then
			return false
		end
	end
	return true
end

return export