local export = {}

local floor = math.floor

local function errorf(first_arg, ...)
    if type(first_arg) == "number" then
        return error(string.format(...), first_arg + 1)
    else
        return error(string.format(first_arg, ...), 2)
    end
end

local function binary_range_search(codepoint, ranges)
    local low, mid, high
    low, high = 1, ranges.length or require"Module:table".length(ranges)
    while low <= high do
        mid = floor((low + high) / 2)
        local range = ranges[mid]
        if codepoint < range[1] then
            high = mid - 1
        elseif codepoint <= range[2] then
            return range, mid
        else
            low = mid + 1
        end
    end
    return nil, mid
end
export.binary_range_search = binary_range_search

local function linear_range_search(codepoint, ranges)
    for i, range in ipairs(ranges) do
        if codepoint < range[1] then
            break
        elseif codepoint <= range[2] then
            return range
        end
    end
end

-- Load a module by indexing "loader" with the name of the module minus the
-- "Module:Unicode data/" part. For instance, loader.blocks returns
-- [[Module:Unicode data/blocks]]. If a module cannot be loaded, false will be
-- returned.
local loader = setmetatable({}, {
    __index = function(self, key)
        local success, data = pcall(mw.loadData, "Module:Unicode data/" .. key)
        if not success then data = false end
        self[key] = data
        return data
    end
})

-- For the algorithm used to generate Hangul Syllable names,
-- see "Hangul Syllable Name Generation" in section 3.12 of the
-- Unicode Specification:
-- https://www.unicode.org/versions/latest/ch03.pdf
-- For most of the name rules given here, see the subsection
-- "Unicode Name Property" in section 4.8 (Name) and the table 4-8
-- (Name Derivation Rule Prefix Strings):
-- https://www.unicode.org/versions/latest/ch04.pdf
local name_hooks = {
    {0x00, 0x1F, "<control-%04X>"}, -- C0 control characters
    {0x7F, 0x9F, "<control-%04X>"}, -- DEL and C1 control characters
    {0x3400, 0x4DBF, "CJK UNIFIED IDEOGRAPH-%04X"}, -- CJK Ideograph Extension A
    {0x4E00, 0x9FFC, "CJK UNIFIED IDEOGRAPH-%04X"}, -- CJK Ideograph
    {
        0xAC00, 0xD7A3, function(codepoint) -- Hangul Syllables
            local Hangul_data = loader.Hangul
            local syllable_index = codepoint - 0xAC00

            return ("HANGUL SYLLABLE %s%s%s"):format(Hangul_data.leads[floor(syllable_index / Hangul_data.final_count)], Hangul_data.vowels[floor((syllable_index % Hangul_data.final_count) / Hangul_data.trail_count)], Hangul_data.trails[syllable_index % Hangul_data.trail_count])
        end
    }, -- High Surrogates, High Private Use Surrogates, Low Surrogates
    {0xD800, 0xDFFF, "<surrogate-%04X>"}, {0xE000, 0xF8FF, "<private-use-%04X>"}, -- Private Use
    -- CJK Compatibility Ideographs
    {0xF900, 0xFA6D, "CJK COMPATIBILITY IDEOGRAPH-%04X"}, {0xFA70, 0xFAD9, "CJK COMPATIBILITY IDEOGRAPH-%04X"}, {0x17000, 0x187F7, "TANGUT IDEOGRAPH-%04X"}, -- Tangut
    {0x18800, 0x18AFF, function(codepoint) return ("TANGUT COMPONENT-%03d"):format(codepoint - 0x187FF) end}, {0x18D00, 0x18D08, "TANGUT IDEOGRAPH-%04X"}, -- Tangut
    {0x18B00, 0x18CD5, "KHITAN SMALL SCRIPT CHARACTER-%04X"}, {0x1B170, 0x1B2FB, "NUSHU CHARACTER-%04X"}, -- Nushu
    {0x20000, 0x2A6DD, "CJK UNIFIED IDEOGRAPH-%04X"}, -- CJK Ideograph Extension B
    {0x2A700, 0x2B734, "CJK UNIFIED IDEOGRAPH-%04X"}, -- CJK Ideograph Extension C
    {0x2A740, 0x2B81D, "CJK UNIFIED IDEOGRAPH-%04X"}, -- CJK Ideograph Extension D
    {0x2B820, 0x2CEA1, "CJK UNIFIED IDEOGRAPH-%04X"}, -- CJK Ideograph Extension E
    {0x2CEB0, 0x2EBE0, "CJK UNIFIED IDEOGRAPH-%04X"}, -- CJK Ideograph Extension F
    -- CJK Compatibility Ideographs Supplement (Supplementary Ideographic Plane)
    {0x2F800, 0x2FA1D, "CJK COMPATIBILITY IDEOGRAPH-%04X"}, {0x30000, 0x3134A, "CJK UNIFIED IDEOGRAPH-%04X"}, -- CJK Ideograph Extension G
    {
        0xE0100, 0xE01EF, function(codepoint) -- Variation Selectors Supplement
            return ("VARIATION SELECTOR-%d"):format(codepoint - 0xE0100 + 17)
        end
    }, {0xF0000, 0xFFFFD, "<private-use-%04X>"}, -- Plane 15 Private Use
    {0x100000, 0x10FFFD, "<private-use-%04X>"} -- Plane 16 Private Use
}
name_hooks.length = #name_hooks

local name_range_cache

local function generate_name(data, codepoint)
    if type(data) == "string" then
        return data:format(codepoint)
    else
        return data(codepoint)
    end
end

--[[
-- Checks that the code point is a number and in range.
-- Does not check whether code point is an integer.
-- Not used
local function check_codepoint(funcName, argIdx, val)
	require 'libraryUtil'.checkType(funcName, argIdx, val, 'number')
	if codepoint < 0 or 0x10FFFF < codepoint then
		errorf("Codepoint %04X out of range", codepoint)
	end
end
--]]

-- https://www.unicode.org/versions/latest/ch04.pdf, section 4.8
function export.lookup_name(codepoint)
    -- U+FDD0-U+FDEF and all code points ending in FFFE or FFFF are Unassigned
    -- (Cn) and specifically noncharacters:
    -- https://www.unicode.org/faq/private_use.html#nonchar4
    if 0xFDD0 <= codepoint and (codepoint <= 0xFDEF or floor(codepoint % 0x10000) >= 0xFFFE) then return ("<noncharacter-%04X>"):format(codepoint) end

    if name_range_cache -- Check if previously used "name hook" applies to this code point.
    and codepoint >= name_range_cache[1] and codepoint <= name_range_cache[2] then return generate_name(name_range_cache[3], codepoint) end

    local range = binary_range_search(codepoint, name_hooks)
    if range then
        name_range_cache = range
        return generate_name(range[3], codepoint)
    end

    local data = loader[("names/%03X"):format(codepoint / 0x1000)]

    if data and data[codepoint] then
        return data[codepoint]

        -- Unassigned (Cn) consists of noncharacters and reserved characters.
        -- The character has been established not to be a noncharacter,
        -- and if it were assigned, its name would already been retrieved,
        -- so it must be reserved.
    else
        return ("<reserved-%04X>"):format(codepoint)
    end
end

function export.lookup_image(codepoint)
    local data = loader[("images/%03X"):format(codepoint / 0x1000)]

    if data then return data[codepoint] end
end

local planes = {[0] = "Basic Multilingual Plane", [1] = "Supplementary Multilingual Plane", [2] = "Supplementary Ideographic Plane", [3] = "Tertiary Ideographic Plane", [14] = "Supplementary Special-purpose Plane", [15] = "Supplementary Private Use Area-A", [16] = "Supplementary Private Use Area-B"}

-- Load [[Module:Unicode data/blocks]] if needed and assign it to this variable.
local blocks

local function block_iter(blocks, i)
    i = i + 1
    local data = blocks[i]
    if data then
        -- Unpack doesn't work on tables loaded with mw.loadData.
        return i, data[3], data[1], data[2]
    end
end

-- An ipairs-type iterator generator for the list of blocks.
function export.enum_blocks()
    local blocks = loader.blocks
    return block_iter, blocks, 0
end

function export.get_block_range(name)
    local range

    for i, block in ipairs(loader.blocks) do if block[3] == name then range = block end end

    if range then return range[1], range[2] end
end

function export.lookup_plane(codepoint)
    local i = floor(codepoint / 0x10000)
    return planes[i] or ("Plane %u"):format(i)
end

function export.lookup_block(codepoint)
    local blocks = loader.blocks
    local range = binary_range_search(codepoint, blocks)
    if range then
        return range[3]
    else
        return "No Block"
    end
end

function export.get_block_info(name) for i, block in ipairs(loader.blocks) do if block[3] == name then return block end end end

function export.is_valid_pagename(pagename)
    local has_nonws = false

    for cp in mw.ustring.gcodepoint(pagename) do
        if (cp == 0x0023) -- #
        or (cp == 0x005B) -- [
        or (cp == 0x005D) -- ]
        or (cp == 0x007B) -- {
        or (cp == 0x007C) -- |
        or (cp == 0x007D) -- }
        or (cp == 0x180E) -- MONGOLIAN VOWEL SEPARATOR
        or ((cp >= 0x2000) and (cp <= 0x200A)) -- spaces in General Punctuation block
        or (cp == 0xFFFD) -- REPLACEMENT CHARACTER
        then return false end

        local printable, result = export.is_printable(cp)
        if not printable then return false end

        if result ~= "space-separator" then has_nonws = true end
    end

    return has_nonws
end

local function manual_unpack(what, from)
    if what[from + 1] == nil then return what[from] end

    local result = {}
    from = from or 1
    for i, item in ipairs(what) do if i >= from then table.insert(result, item) end end
    return unpack(result)
end

local function compare_ranges(range1, range2) return range1[1] < range2[1] end

-- Creates a function to look up data in a module that contains "singles" (a
-- code point-to-data map) and "ranges" (an array containing arrays that contain
-- the low and high code points of a range and the data associated with that
-- range).
-- "loader" loads and returns the "singles" and "ranges" tables.
-- "match_func" is passed the code point and either the data or the "dots", and
-- generates the final result of the function.
-- The varargs ("dots") describes the default data to be returned if there wasn't
-- a match.
-- In case the function is used more than once, "cache" saves ranges that have
-- already been found to match, or a range whose data is the default if there
-- was no match.
local function memo_lookup(data_module_subpage, match_func, ...)
    local dots = {...}
    local cache = {}
    local singles, ranges

    return function(codepoint)
        if not singles then
            local data_module = loader[data_module_subpage]
            singles, ranges = data_module.singles, data_module.ranges
        end

        if singles[codepoint] then return match_func(codepoint, singles[codepoint]) end

        local range = binary_range_search(codepoint, cache)
        if range then return match_func(codepoint, manual_unpack(range, 3)) end

        local range, index = binary_range_search(codepoint, ranges)
        if range then
            table.insert(cache, range)
            table.sort(cache, compare_ranges)
            return match_func(codepoint, manual_unpack(range, 3))
        end

        if ranges[index] then
            local dots_range
            if codepoint > ranges[index][2] then
                dots_range = {ranges[index][2] + 1, ranges[index + 1] and ranges[index + 1][1] - 1 or 0x10FFFF, unpack(dots)}
            else -- codepoint < range[index][1]
                dots_range = {ranges[index - 1] and ranges[index - 1][2] + 1 or 0, ranges[index][1] - 1, unpack(dots)}
            end
            table.sort(cache, compare_ranges)
        end

        return match_func(codepoint, unpack(dots))
    end
end

-- Get a code point's combining class value in [[Module:Unicode data/combining]],
-- and return whether this value is not zero. Zero is assigned as the default
-- if the combining class value is not found in this data module.
-- That is, return true if character is combining, or false if it is not.
-- See https://www.unicode.org/reports/tr44/#Canonical_Combining_Class_Values for
-- more information.
export.is_combining = memo_lookup("combining", function(codepoint, combining_class) return combining_class and combining_class ~= 0 or false end, 0)

function export.add_dotted_circle(str) return (mw.ustring.gsub(str, ".", function(char) if export.is_combining(mw.ustring.codepoint(char)) then return "◌" .. char end end)) end

local lookup_control = memo_lookup("control", function(codepoint, ccc) return ccc or "assigned" end, "assigned")
export.lookup_control = lookup_control

function export.is_assigned(codepoint) return lookup_control(codepoint) ~= "unassigned" end

function export.is_printable(codepoint)
    local result = lookup_control(codepoint)
    return (result == "assigned") or (result == "space-separator"), result
end

function export.is_whitespace(codepoint)
    local result = lookup_control(codepoint)
    return (result == "space-separator"), result
end

export.lookup_category = memo_lookup("category", function(codepoint, category) return category end, "Cn")

export.lookup_script = memo_lookup("scripts", function(codepoint, script) return script end, "Zzzz")

local unsupported_title = {[0x0020] = "Unsupported titles/Space", [0x0023] = "Unsupported titles/Number sign", [0x002E] = "Unsupported titles/Full stop", [0x003A] = "Unsupported titles/Colon", [0x003C] = "Unsupported titles/Less than", [0x003E] = "Unsupported titles/Greater than", [0x005B] = "Unsupported titles/Left square bracket", [0x005D] = "Unsupported titles/Right square bracket", [0x005F] = "Unsupported titles/Low line", [0x007B] = "Unsupported titles/Left curly bracket", [0x007C] = "Unsupported titles/Vertical line", [0x007D] = "Unsupported titles/Right curly bracket", [0x1680] = "Unsupported titles/Ogham space", [0xFFFD] = "Unsupported titles/Replacement character"}

function export.get_entry_title(codepoint)
    if unsupported_title[codepoint] then return unsupported_title[codepoint] end
    if lookup_control(codepoint) ~= "assigned" then return nil end
    return mw.ustring.char(codepoint)
end

return export
