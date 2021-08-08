local UnitTester = {}

local ustring = mw.ustring
local is_combining = require"Module:Unicode data".is_combining
local UTF8_char = "[\1-\127\194-\244][\128-\191]*"

local sorted_pairs = require("table").sortedPairs
local Array = require("array")

local tick, cross = "[[File:Yes check.svg|20px|alt=Passed|link=|Test passed]]", "[[File:X mark.svg|20px|alt=Failed|link=|Test failed]]"

local result_table_header = "{| class=\"unit-tests wikitable\"\n! class=\"unit-tests-img-corner\" style=\"cursor:pointer\" title=\"Only failed tests\"| !! Text !! Expected !! Actual"

local function iter_UTF8(str) return string.gmatch(str, UTF8_char) end

-- Skips over bytes that are not used by UTF-8, and will count overlong encodings.
local function len(str)
    local _, length = string.gsub(str, UTF8_char, "")
    return length
end

local function first_difference(s1, s2)
    if type(s1) ~= "string" or type(s2) ~= "string" then return "N/A" end
    if s1 == s2 then return "" end
    local next_char1, next_char2 = iter_UTF8(s1), iter_UTF8(s2)
    local max = math.min(len(s1), len(s2))
    for i = 1, max do
        local c1, c2 = next_char1(), next_char2()
        if c1 ~= c2 then return i end
    end
    return max + 1
end

local function highlight(str)
    if ustring.find(str, "%s") then
        return "<span style=\"background-color: pink;\">" .. string.gsub(str, " ", "&nbsp;") .. "</span>"
    else
        return "<span style=\"color: red;\">" .. str .. "</span>"
    end
end

local function find_noncombining(str, i, incr)
    local char = ustring.sub(str, i, i)
    while char ~= "" and is_combining(ustring.codepoint(char)) do
        i = i + incr
        char = ustring.sub(str, i, i)
    end
    return i
end

-- Highlight character where a difference was found. Start highlight at first
-- non-combining character before the position. End it after the first non-
-- combining characters after the position. Can specify a custom highlighing
-- function.
local function highlight_difference(actual, expected, differs_at, func)
    if type(differs_at) ~= "number" or not (actual and expected) then return actual end
    differs_at = find_noncombining(expected, differs_at, -1)
    local i = find_noncombining(actual, differs_at, -1)
    local j = find_noncombining(actual, differs_at + 1, 1)
    j = j - 1
    return ustring.sub(actual, 1, i - 1) .. (type(func) == "function" and func or highlight)(ustring.sub(actual, i, j)) .. ustring.sub(actual, j + 1, -1)
end

local function val_to_str(v)
    if type(v) == "string" then
        v = string.gsub(v, "\n", "\\n")
        if string.find(string.gsub(v, "[^'\"]", ""), "^\"+$") then return "'" .. v .. "'" end
        return "\"" .. string.gsub(v, "\"", "\\\"") .. "\""
    elseif type(v) == "table" then
        local result, done = Array(), {}
        for k, val in ipairs(v) do
            result:insert(val_to_str(val))
            done[k] = true
        end
        for k, val in sorted_pairs(v) do
            if not done[k] then
                if (type(k) ~= "string") or not string.find(k, "^[_%a][_%a%d]*$") then k = "[" .. val_to_str(k) .. "]" end
                result:insert(k .. "=" .. val_to_str(val))
            end
        end
        return "{" .. result:concat(", ") .. "}"
    else
        return tostring(v)
    end
end

local function deep_compare(t1, t2, ignore_mt)
    local ty1, ty2 = type(t1), type(t2)
    if ty1 ~= ty2 then
        return false
    elseif ty1 ~= "table" then
        return t1 == t2
    end

    local mt = getmetatable(t1)
    if not ignore_mt and mt and mt.__eq then return t1 == t2 end

    for k1, v1 in pairs(t1) do
        local v2 = t2[k1]
        if v2 == nil or not deep_compare(v1, v2) then return false end
    end
    for k2, v2 in pairs(t2) do
        local v1 = t1[k2]
        if v1 == nil or not deep_compare(v1, v2) then return false end
    end

    return true
end

function UnitTester:preprocess_equals(text, expected, options)
    local actual = self.frame:preprocess(text)
    if actual == expected then
        self.result_table:insert("|- class=\"unit-test-pass\"\n | " .. tick)
    else
        self.result_table:insert("|- class=\"unit-test-fail\"\n | " .. cross)
        self.num_failures = self.num_failures + 1
    end
    local differs_at = self.differs_at and (" || " .. first_difference(expected, actual)) or ""
    local comment = self.comments and (" || " .. (options and options.comment or "")) or ""
    actual = tostring(actual)
    expected = tostring(expected)
    if self.nowiki or options and options.nowiki then
        expected = mw.text.nowiki(expected)
        actual = mw.text.nowiki(actual)
    end
    self.result_table:insert(" || " .. mw.text.nowiki(text) .. " || " .. expected .. " || " .. actual .. differs_at .. comment .. "\n")
    self.total_tests = self.total_tests + 1
end

function UnitTester:preprocess_equals_many(prefix, suffix, cases, options) for _, case in ipairs(cases) do self:preprocess_equals(prefix .. case[1] .. suffix, case[2], options) end end

function UnitTester:preprocess_equals_preprocess(text1, text2, options)
    local actual = self.frame:preprocess(text1)
    local expected = self.frame:preprocess(text2)
    if actual == expected then
        self.result_table:insert("|- class=\"unit-test-pass\"\n | " .. tick)
    else
        self.result_table:insert("|- class=\"unit-test-fail\"\n | " .. cross)
        self.num_failures = self.num_failures + 1
    end
    if self.nowiki or options and options.nowiki then
        expected = mw.text.nowiki(expected)
        actual = mw.text.nowiki(actual)
    end
    local differs_at = self.differs_at and (" || " .. first_difference(expected, actual)) or ""
    local comment = self.comments and (" || " .. (options and options.comment or "")) or ""
    self.result_table:insert(" || " .. mw.text.nowiki(text1) .. " || " .. expected .. " || " .. actual .. differs_at .. comment .. "\n")
    self.total_tests = self.total_tests + 1
end

function UnitTester:preprocess_equals_preprocess_many(prefix1, suffix1, prefix2, suffix2, cases, options) for _, case in ipairs(cases) do self:preprocess_equals_preprocess(prefix1 .. case[1] .. suffix1, prefix2 .. (case[2] and case[2] or case[1]) .. suffix2, options) end end

function UnitTester:equals(name, actual, expected, options)
    if actual == expected then
        self.result_table:insert("|- class=\"unit-test-pass\"\n | " .. tick)
    else
        self.result_table:insert("|- class=\"unit-test-fail\"\n | " .. cross)
        self.num_failures = self.num_failures + 1
    end
    local difference = first_difference(expected, actual)
    if options and options.show_difference and type(difference) == "number" then actual = highlight_difference(actual, expected, difference, type(options.show_difference) == "function" and options.show_difference) end
    local differs_at = self.differs_at and (" || " .. difference) or ""
    local comment = self.comments and (" || " .. (options and options.comment or "")) or ""
    if expected == nil then
        expected = "(nil)"
    else
        expected = tostring(expected)
    end
    if actual == nil then
        actual = "(nil)"
    else
        actual = tostring(actual)
    end
    if self.nowiki or options and options.nowiki then
        expected = mw.text.nowiki(expected)
        actual = mw.text.nowiki(actual)
    end

    if options and type(options.display) == "function" then
        expected = options.display(expected)
        actual = options.display(actual)
    end

    self.result_table:insert(" || " .. name .. " || " .. expected .. " || " .. actual .. differs_at .. comment .. "\n")
    self.total_tests = self.total_tests + 1
end

function UnitTester:equals_deep(name, actual, expected, options)
    if deep_compare(actual, expected) then
        self.result_table:insert("|- class=\"unit-test-pass\"\n | " .. tick)
    else
        self.result_table:insert("|- class=\"unit-test-fail\"\n | " .. cross)
        self.num_failures = self.num_failures + 1
    end
    local actual_str = val_to_str(actual)
    local expected_str = val_to_str(expected)

    if self.nowiki or options and options.nowiki then
        expected_str = mw.text.nowiki(expected_str)
        actual_str = mw.text.nowiki(actual_str)
    end

    if options and type(options.display) == "function" then
        expected_str = options.display(expected_str)
        actual_str = options.display(actual_str)
    end

    local differs_at = self.differs_at and (" || " .. first_difference(expected_str, actual_str)) or ""
    local comment = self.comments and (" || " .. (options and options.comment or "")) or ""
    self.result_table:insert(" || " .. name .. " || " .. expected_str .. " || " .. actual_str .. differs_at .. comment .. "\n")
    self.total_tests = self.total_tests + 1
end

function UnitTester:iterate(examples, func)
    require"libraryUtil".checkType("iterate", 1, examples, "table")
    if type(func) == "string" then
        func = self[func]
    elseif type(func) ~= "function" then
        error(("bad argument #2 to 'iterate' (expected function or string, got %s)"):format(type(func)), 2)
    end

    for i, example in ipairs(examples) do
        if type(example) == "table" then
            func(self, unpack(example))
        elseif type(example) == "string" then
            self:heading(example)
        else
            error(("bad example #%d (expected table or string, got %s)"):format(i, type(example)), 2)
        end
    end
end

function UnitTester:heading(text) self.result_table:insert((" |-\n ! colspan=\"%u\" style=\"text-align: left\" | %s\n"):format(self.columns, text)) end

function UnitTester:run(frame)
    self.num_failures = 0

    local output = Array()

    self.frame = frame
    self.nowiki = frame.args["nowiki"]
    self.differs_at = frame.args["differs_at"]
    self.comments = frame.args["comments"]
    self.summarize = frame.args["summarize"]
    self.total_tests = 0
    self.result_table = Array()

    self.columns = 4
    local table_header = result_table_header
    if self.differs_at then
        self.columns = self.columns + 1
        table_header = table_header .. " !! Differs at"
    end
    if self.comments then
        self.columns = self.columns + 1
        table_header = table_header .. " !! Comments"
    end

    -- Sort results into alphabetical order.
    local self_sorted = Array()
    for key, value in pairs(self) do if key:find("^test") then self_sorted:insert(key) end end
    self_sorted:sort()

    -- Add results to the results table.
    for _, key in ipairs(self_sorted) do
        self.result_table:insert(table_header .. "\n")
        self.result_table:insert("|+ style=\"text-align: left; font-weight: bold;\" | " .. key .. ":\n|-\n")
        local traceback = "(no traceback)"
        local success, mesg = xpcall(function() return self[key](self) end, function(mesg)
            traceback = debug.traceback("", 2)
            return mesg
        end)
        if not success then
            self.result_table:insert((" |-\n | colspan=\"%u\" style=\"text-align: left\" | <strong class=\"error\">Script error during testing: %s</strong>%s\n"):format(self.columns, mw.text.nowiki(mesg), frame:extensionTag("pre", traceback)))
            self.num_failures = self.num_failures + 1
        end
        self.result_table:insert("|}")
        output:insert(self.result_table:concat())
        self.result_table = Array()
    end

    local refresh_link = tostring(mw.uri.fullUrl(mw.title.getCurrentTitle().fullText, "action=purge&forcelinkupdate"))

    local failure_cat = "[[Category:Failing module unit tests]]"
    if mw.title.getCurrentTitle().text:find("/documentation$") then failure_cat = "" end

    local num_successes = self.total_tests - self.num_failures

    if (self.summarize) then
        if (self.num_failures == 0) then
            return "<strong class=\"success\">" .. self.total_tests .. "/" .. self.total_tests .. " tests passed</strong>"
        else
            return "<strong class=\"error\">" .. num_successes .. "/" .. self.total_tests .. " tests passed</strong>"
        end
    else
        return (self.num_failures == 0 and "<strong class=\"success\">All tests passed.</strong>" or "<strong class=\"error\">" .. self.num_failures .. " test" .. (self.num_failures == 1 and "" or "s") .. " failed.</strong>" .. failure_cat) .. " <span class='plainlinks unit-tests-refresh'>[" .. refresh_link .. " (refresh)]</span>\n\n" .. output:concat("\n\n")
    end
end

function UnitTester:new()
    local o = {}
    setmetatable(o, self)
    self.__index = self
    return o
end

local p = UnitTester:new()
function p.run_tests(frame) return p:run(frame) end
return p
