local export = {}

local data = mw.loadData("utilities/data")
local notneeded = data.notneeded
local neededhassubpage = data.neededhassubpage

-- A helper function to escape magic characters in a string
-- Magic characters: ^$()%.[]*+-?
function export.pattern_escape(text)
    if type(text) == "table" then text = text.args[1] end
    text = mw.ustring.gsub(text, "([%^$()%%.%[%]*+%-?])", "%%%1")
    return text
end

function export.plain_gsub(text, pattern, replacement)
    local invoked = false

    if type(text) == "table" then
        invoked = true

        if text.args then
            local frame = text

            local params = {[1] = {}, [2] = {}, [3] = {allow_empty = true}}

            local args = require("parameters").process(frame.args, params)

            text = args[1]
            pattern = args[2]
            replacement = args[3]
        else
            error("If the first argument to plain_gsub is a table, it should be a frame object.")
        end
    else
        if not (type(pattern) == "string" or type(pattern) == "number") then error("The second argument to plain_gsub should be a string or a number.") end

        if not (type(replacement) == "string" or type(replacement) == "number") then error("The third argument to plain_gsub should be a string or a number.") end
    end

    pattern = export.pattern_escape(pattern)

    if invoked then
        text = mw.ustring.gsub(text, pattern, replacement)
        return text
    else
        return mw.ustring.gsub(text, pattern, replacement)
    end
end

--[[
Format the categories with the appropriate sort key. CATEGORIES is a list of
categories.
	-- LANG is an object encapsulating a language; if nil, the object for
	   language code 'und' (undetermined) will be used.
	-- SORT_KEY is placed in the category invocation, and indicates how the
	   page will sort in the respective category. Normally this should be nil,
	   and a default sort key based on the subpage name (the part after the
	   colon) will be used.
	-- SORT_BASE lets you override the default sort key used when SORT_KEY is
	   nil. Normally, this should be nil, and a language-specific default sort
	   key is computed from the subpage name (e.g. for Russian this converts
	   Cyrillic ё to a string consisting of Cyrillic е followed by U+10FFFF,
	   so that effectively ё sorts after е instead of the default Wikimedia
	   sort, which (I think) is based on Unicode sort order and puts ё after я,
	   the last letter of the Cyrillic alphabet.
	-- FORCE_OUTPUT forces normal output in all namespaces. Normally, nothing
	   is output if the page isn't in the main, Appendix:, Reconstruction: or
	   Citations: namespaces.
]]
function export.format_categories(categories, lang, sort_key, sort_base, force_output, sc)
    if type(lang) == "table" and not lang.getCode then error("The second argument to format_categories should be a language object.") end

    local title_obj = mw.title.getCurrentTitle()

    if force_output or data.allowedNamespaces[title_obj.nsText] or data.allowedPrefixedPages[title_obj.prefixedText] then
        local PAGENAME = title_obj.text
        local SUBPAGENAME = title_obj.subpageText

        if not lang then lang = require("languages").getByCode("und") end

        -- Generate a default sort key
        sort_base = lang:makeSortKey(sort_base or SUBPAGENAME, sc)

        if sort_key and sort_key ~= "" then
            -- Gather some statistics regarding sort keys
            if mw.ustring.upper(sort_key) == sort_base then table.insert(categories, "Sort key tracking/redundant") end
        else
            sort_key = sort_base
        end

        -- If the sortkey is empty, remove it.
        -- Leave the sortkey if it is equal to PAGENAME, because it still
        -- might be different from DEFAULTSORT and therefore have an effect; see
        -- [[Wiktionary:Grease pit/2020/April#Module:utilities#format categories]].
        if sort_key == "" then sort_key = nil end

        local out_categories = {}
        for key, cat in ipairs(categories) do out_categories[key] = "[[Category:" .. cat .. (sort_key and "|" .. sort_key or "") .. "]]" end

        return table.concat(out_categories, "")
    else
        return ""
    end
end

-- Used by {{categorize}}
function export.template_categorize(frame)
    local NAMESPACE = mw.title.getCurrentTitle().nsText
    local format = frame.args["format"]
    local args = frame:getParent().args

    local langcode = args[1];
    if langcode == "" then langcode = nil end
    local sort_key = args["sort"];
    if sort_key == "" then sort_key = nil end
    local categories = {}

    if not langcode then
        if NAMESPACE == "Template" then return "" end
        error("Language code has not been specified. Please pass parameter 1 to the template.")
    end

    local lang = require("languages").getByCode(langcode)

    if not lang then
        if NAMESPACE == "Template" then return "" end
        error("The language code \"" .. langcode .. "\" is not valid.")
    end

    local prefix = ""

    if format == "pos" then
        prefix = lang:getCanonicalName() .. " "
    elseif format == "topic" then
        prefix = lang:getCode() .. ":"
    end

    local i = 2
    local cat = args[i]

    while cat do
        if cat ~= "" then table.insert(categories, prefix .. cat) end

        i = i + 1
        cat = args[i]
    end

    return export.format_categories(categories, lang, sort_key)
end

function export.catfix(lang, sc)
    if not lang then
        require("debug").track("catfix/no lang")
        return nil
    elseif type(lang) ~= "table" then
        require("debug").track("catfix/lang not table")
        return nil
    end
    local canonicalName = lang:getCanonicalName() or error("The first argument to the function \"catfix\" should be a language object from Module:languages.")

    if sc and not sc.getCode then error("The second argument to the function \"catfix\" should be a script object from Module:scripts.") end

    -- To add script classes to links on pages created by category boilerplate templates.
    if not sc then
        sc = data.catfix_scripts[lang:getCode()]
        if sc then sc = require("scripts").getByCode(sc) end
    end

    return "<span id=\"catfix\" style=\"display:none;\" class=\"CATFIX-" .. mw.uri.anchorEncode(canonicalName) .. "\">" .. require("script utilities").tag_text("&nbsp;", lang, sc, nil) .. "</span>"
end

function export.catfix_template(frame)
    local params = {[1] = {}, [2] = {alias_of = "sc"}, ["sc"] = {}}

    local args = require("parameters").process(frame:getParent().args, params)

    local lang = require("languages").getByCode(args[1]) or require("languages").err(args[1], 1)

    local sc = args.sc
    if sc then sc = require("scripts").getByCode(sc) or error("The script code \"" .. sc .. "\", provided in the second parameter, is not valid.") end

    return export.catfix(lang, sc)
end

-- Not exporting because it is not used yet.
local function getDateTense(frame)
    local name_num_mapping = {["January"] = 1, ["February"] = 2, ["March"] = 3, ["April"] = 4, ["May"] = 5, ["June"] = 6, ["July"] = 7, ["August"] = 8, ["September"] = 9, ["October"] = 10, ["November"] = 11, ["December"] = 12, [1] = 1, [2] = 2, [3] = 3, [4] = 4, [5] = 5, [6] = 6, [7] = 7, [8] = 8, [9] = 9, [10] = 10, [11] = 11, [12] = 12}
    local month = name_num_mapping[frame.args[2]]
    local date = os.time({year = frame.args[1], day = frame.args[3], month = month})
    local today = os.time() -- 12 AM/PM
    local diff = os.difftime(date, today)
    local daylength = 24 * 3600

    if diff < -daylength / 2 then
        return "past"
    else
        if diff > daylength / 2 then
            return "future"
        else
            return "present"
        end
    end
end

function export.make_id(lang, str)
    --[[	If called with invoke, first argument is a frame object.
			If called by a module, first argument is a language object. ]]
    local invoked = false

    if type(lang) == "table" then
        if lang.args then
            invoked = true

            local frame = lang

            local params = {[1] = {}, [2] = {}}

            local args = require("parameters").process(frame:getParent().args, params)

            local langCode = args[1]
            str = args[2]

            local m_languages = require("languages")

            lang = m_languages.getByCode(langCode) or m_languages.err(langCode, 1)
        elseif not lang.getCanonicalName then
            error("The first argument to make_id should be a language object.")
        end
    end

    if not (type(str) == "string" or type(str) == "number") then error("The second argument to make_id should be a string or a number.") end

    local id = require("senseid").anchor(lang, str)

    if invoked then
        return "<li class=\"senseid\" id=\"" .. id .. "\">"
    else
        return id
    end
end

return export
