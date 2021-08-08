local library_util = require("libraryUtil")
local check_type = library_util.checkType

-- Allow examples to be a string in a sort of TSV format,
-- consisting of one or more lines with two or three non-empty arguments
-- separated by one or more tabs. Single-line Lua comments are stripped, as well as
-- whitespace at the beginning and end of each line.
-- Empty lines and lines consisting of whitespace are skipped.
local function examples_string_to_array(examples)
    examples = examples:gsub("%s*%-%-[^\n]*", "")
    local array = {}
    for line in examples:gmatch("[^\n]+") do
        line = mw.text.trim(line)
        if line ~= "" then
            local original, expected, sc = line:match("^([^\t]+)\t+([^\t]+)\t-([^\t]-)$")
            if not original then error("The following line did not consist of two or three arguments separated by tabs:\n" .. line) end
            if sc == "" then sc = nil end
            table.insert(array, {original, expected, sc})
        end
    end
    return array
end

local function _check(funcName, expectType) return function(argIndex, arg, expectType, nilOk) check_type(funcName, argIndex, arg, expectType, nilOk) end end

local function get_translit_function(module_name)
    local success, translit_module = pcall(require, "Module:" .. module_name)
    if not success then error("Module:" .. module_name .. " does not exist.") end
    translit_function = translit_module.tr
    if type(translit_function) ~= "function" then error("Module:" .. module_name .. " does not contain a function 'tr'.") end
    return translit_function
end

return function(translit_function, examples, sc_code, lang_code, options)
    local module_name
    if type(translit_function) == "table" then
        local args = translit_function
        module_name, examples, sc_code, lang_code = args.module, args.examples, args.sc, args.lang

        options = {}
        for k, v in pairs(args) do if not (k == "module" or k == "examples" or k == "sc" or k == "lang") then options[k] = v end end
    elseif type(translit_function) == "string" then
        module_name, translit_function = translit_function, nil
    end

    if module_name then translit_function = get_translit_function(module_name) end

    --  C H E C K   P A R A M E T E R S  --
    local check_type = _check("translit_module_testcases")
    check_type(1, translit_function, "function")
    check_type(3, sc_code, "string")
    check_type(4, lang_code, "string")
    check_type(5, options, "table", true)

    options = options or {}

    if type(examples) == "table" then
        if not require("table").isArray(examples) then error("Third argument or \"examples\" argument to translit_module_testcases should be an array.") end
    elseif type(examples) == "string" then
        examples = examples_string_to_array(examples)
    else
        error("Third argument or \"examples\" argument to translit_module_testcases should be an array or string.")
    end

    -- Get canonical name and validate language code.
    local lang_object = require("languages").getByCode(lang_code) or error("The language code " .. lang_code .. " is not valid.")
    local canonical_name = lang_object:getCanonicalName()

    -- Validate script code.
    if not mw.loadData("scripts/data")[sc_code] then error("The script code " .. sc_code .. " is not valid.") end

    --  M A K E   T E S T   F U N C T I O N  --
    local tests = require("UnitTests")

    local normalize = mw.ustring.toNFD

    local opening_tag = "<span class=\"" .. sc_code .. "\" lang=\"" .. lang_code .. "\">"
    local template
    if options.nolink then
        template = opening_tag .. "&</span>"
    else
        template = opening_tag .. "[[&#" .. canonical_name .. "|&]]</span>"
    end

    if options.func_with_link then
        format_text = options.func_with_link
        if type(format_text) ~= "function" then error("func_with_link in options table should be a function.") end
    elseif options.func_before_link then
        local func = options.func_before_link
        if type(func) ~= "function" then error("func_before_link in options table should be a function.") end
        function format_text(text) return template:gsub("&", (func(text))) end
    else
        function format_text(text) return template:gsub("&", text) end
    end

    local self_equals_options = {display = options.output_display}
    function tests:check(example, expected, manual_sc, manual_lang) self:equals(format_text(example, expected, manual_sc, manual_lang), normalize(translit_function(example, manual_lang or lang_code, manual_sc or sc_code)), expected and normalize(expected), self_equals_options) end

    function tests:test() self:iterate(examples, "check") end

    if module_name then tests["testcases for <code>tr</code> function in [[Module:" .. module_name .. "]]"], tests.test = tests.test, nil end

    return tests
end
