local export = {}

local escape
do
    local escapes = {["\a"] = "a", ["\b"] = "b", ["\f"] = "f", ["\n"] = "n", ["\r"] = "r", ["\t"] = "t", ["\v"] = "v", ["\\"] = "\\", ["\""] = "\"", ["'"] = "'"}

    local function helper(char) return escapes[char] and "\\" .. escapes[char] or ("\\%03d"):format(char:byte()) end

    -- Escape control characters, backslash, double quote, and bytes that aren't
    -- used in UTF-8.
    -- Escape stuff that can't be saved in a MediaWiki page, like invalid UTF-8
    -- and NFD character sequences? Hard.
    -- Similar to string.format("%q", str), which does not use C-like simple
    -- escapes and does not escape bytes that are not used in UTF-8.
    escape = function(str) return (str:gsub("[%z\1-\31\\\"\127\192\193\245-\255]", helper)) end
end

export.escape = escape

-- Convert a value to a string
function export.dump(value, prefix, tsort)
    local t = type(value)

    prefix = prefix or ""

    if t == "string" then
        return "\"" .. escape(value) .. "\""
    elseif t == "table" then
        local str_table = {}

        table.insert(str_table, " {")

        for key, val in require("table").sortedPairs(value, tsort) do table.insert(str_table, " " .. prefix .. "\t[" .. export.dump(key, prefix .. "\t") .. "] = " .. export.dump(val, prefix .. "\t"):gsub("^ ", "") .. ",") end

        table.insert(str_table, " " .. prefix .. "}")

        return table.concat(str_table, "\n")
    else
        return tostring(value)
    end
end

function export.highlight_dump(value, prefix, tsort, options)
    options = options or {}

    local func = options.modified and "modified_dump" or "dump"

    local dump = export[func](value, prefix, tsort)

    -- Remove spaces at beginnings of lines (which are simply to force a <pre></pre> tag).
    dump = dump:gsub("^ ", "")
    dump = dump:gsub("\n ", "\n")

    return export.highlight(dump)
end

-- Returns true if table contains a table as one of its values
local function containsTable(t)
    for key, value in pairs(t) do if type(value) == "table" then return true end end
    return false
end

local function containsTablesWithSize(t, size)
    for key, value in pairs(t) do if type(value) == "table" and require("table").size(value) ~= size then return false end end
    return true
end

--[=[
	Convert a value to a string.
	Like dump below, but if a table has consecutive numbered keys and does not
	have a table as one of its values, it will be placed on a single line.
	Used by [[Module:User:Erutuon/script recognition]].
]=]
function export.modified_dump(value, prefix, tsort)
    local t = type(value)

    prefix = prefix or ""

    if t == "string" then
        return "\"" .. value .. "\""
    elseif t == "table" then
        local str_table = {}

        local containsTable = containsTable(value)
        local consecutive = require("table").isArray(value)
        if consecutive and not containsTable or containsTable and containsTablesWithSize(value, 3) then
            table.insert(str_table, "{")

            for key, val in require("table").sortedPairs(value, tsort) do
                if containsTable then
                    table.insert(str_table, "\n\t" .. prefix)
                else
                    table.insert(str_table, " ")
                end

                if type(key) == "string" then table.insert(str_table, "[" .. export.modified_dump(key) .. "] = ") end

                table.insert(str_table, type(key) == "number" and type(val) == "number" and string.format("0x%05X", val) or export.modified_dump(val))

                if not (consecutive and #value == 3) or type(key) == "number" and value[key + 1] then table.insert(str_table, ",") end
            end

            if containsTable then
                table.insert(str_table, "\n" .. prefix)
            else
                table.insert(str_table, " ")
            end

            table.insert(str_table, "}")
            return table.concat(str_table)
        end

        table.insert(str_table, " {")

        for key, val in require("table").sortedPairs(value, tsort) do table.insert(str_table, " " .. prefix .. "\t[" .. export.modified_dump(key, prefix .. "\t") .. "] = " .. export.modified_dump(val, prefix .. "\t"):gsub("^ ", "") .. ",") end

        table.insert(str_table, " " .. prefix .. "}")

        return table.concat(str_table, "\n")
    elseif t == "number" and value > 46 then
        return string.format("0x%05X", value)
    else
        return tostring(value)
    end
end

function export.track(key)
    local frame = mw.getCurrentFrame()
    if key then
        if type(key) ~= "table" then key = {key} end

        for i, value in pairs(key) do pcall(frame.expandTemplate, frame, {title = "tracking/" .. value}) end
    else
        error("No tracking key supplied to the function \"" .. track .. "\".")
    end
end

-- Trigger a script error from a template
function export.error(frame) error(frame.args[1] or "(no message specified)") end

--[[
	Convenience function for generating syntaxhighlight tags.
	Display defaults to block.
	Options is a table. To display inline text with HTML highlighting:
		{ inline = true, lang = "html" }
]]
function export.highlight(content, options)
    if type(content) == "table" then
        options = content
        options = {lang = options.lang or "lua", inline = options.inline and true}
        return function(content) return mw.getCurrentFrame():extensionTag{name = "syntaxhighlight", content = content, args = options} end
    else
        return mw.getCurrentFrame():extensionTag{name = "syntaxhighlight", content = content, args = {lang = options and options.lang or "lua", inline = options and options.inline and true or nil}}
    end
end

function export.track_unrecognized_args(args, template_name)
    local function track(code) export.track(template_name .. "/" .. code) end

    track("unrecognized arg")

    local arg_list = {}
    for arg, value in pairs(args) do
        track("unrecognized arg/" .. arg)
        table.insert(arg_list, ("|%s=%s"):format(arg, value))
    end

    mw.log(("Unrecognized parameter%s in {{%s}}: %s."):format(arg_list[2] and "s" or "", template_name, table.concat(arg_list, ", ")))
end

return export
