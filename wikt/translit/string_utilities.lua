local module_name = "string_utilities"
local export = {}

local rfind = mw.ustring.find

local format_escapes = {["op"] = "{", ["cl"] = "}"}

function export.format(str, tbl)
    return (string.gsub(str, "{(\\?)((\\?)[^{}]*)}", function(p1, name, p2)
        if #p1 + #p2 == 1 then
            return format_escapes[name] or error(module_name .. ".format: unrecognized escape sequence '{\\" .. name .. "}'")
        else
            if tbl[name] and type(tbl[name]) ~= "string" then error(module_name .. ".format: '" .. name .. "' is a " .. type(tbl[name]) .. ", not a string") end
            return tbl[name] or error(module_name .. ".format: '" .. name .. "' not found in table")
        end
    end))
end

-- Reimplementation of mw.ustring.split() that includes any capturing
-- groups in the splitting pattern. This works like Python's re.split()
-- function, except that it has Lua's behavior when the split pattern
-- is empty (i.e. advancing by one character at a time; Python returns the
-- whole remainder of the string).
function export.capturing_split(str, pattern)
    local ret = {}
    -- (.-) corresponds to (.*?) in Python or Perl; () captures the
    -- current position after matching.
    pattern = "(.-)" .. pattern .. "()"
    local start = 1
    while true do
        -- Did we reach the end of the string?
        if start > #str then
            table.insert(ret, "")
            return ret
        end
        -- match() returns all captures as multiple return values;
        -- we need to insert into a table to get them all.
        local captures = {mw.ustring.match(str, pattern, start)}
        -- If no match, add the remainder of the string.
        if #captures == 0 then
            table.insert(ret, mw.ustring.sub(str, start))
            return ret
        end
        local newstart = table.remove(captures)
        -- Special case: If we don't advance by any characters, then advance
        -- by one character; this avoids an infinite loop, and makes splitting
        -- by an empty string work the way mw.ustring.split() does. If we
        -- reach the end of the string this way, return immediately, so we
        -- don't get a final empty string.
        if newstart == start then
            table.insert(ret, mw.ustring.sub(str, start, start))
            table.remove(captures, 1)
            start = start + 1
            if start > #str then return ret end
        else
            table.insert(ret, table.remove(captures, 1))
            start = newstart
        end
        -- Insert any captures from the splitting pattern.
        for _, x in ipairs(captures) do table.insert(ret, x) end
    end
end

local function uclcfirst(text, dolower)
    local function douclcfirst(text)
        -- Actual function to re-case of the first letter.
        local first_letter = mw.ustring.sub(text, 1, 1)
        first_letter = dolower and mw.ustring.lower(first_letter) or mw.ustring.upper(first_letter)
        return first_letter .. mw.ustring.sub(text, 2)
    end
    -- If there's a link at the beginning, re-case the first letter of the
    -- link text. This pattern matches both piped and unpiped links.
    -- If the link is not piped, the second capture (linktext) will be empty.
    local link, linktext, remainder = mw.ustring.match(text, "^%[%[([^|%]]+)%|?(.-)%]%](.*)$")
    if link then return "[[" .. link .. "|" .. douclcfirst(linktext ~= "" and linktext or link) .. "]]" .. remainder end
    return douclcfirst(text)
end

function export.ucfirst(text) return uclcfirst(text, false) end

function export.lcfirst(text) return uclcfirst(text, true) end

function export.pluralize(text)
    if type(text) == "table" then
        -- allow calling from a template
        text = text.args[1]
    end
    -- Pluralize a word in a smart fashion, according to normal English rules.
    -- 1. If word ends in consonant + -y, replace the -y with -ies.
    -- 2. If the word ends in -s, -x, -z, -sh, -ch, add -es.
    -- 3. Otherwise, add -s.
    -- This handles links correctly:
    -- 1. If a piped link, change the second part appropriately.
    -- 2. If a non-piped link and rule #1 above applies, convert to a piped link
    --    with the second part containing the plural.
    -- 3. If a non-piped link and rules #2 or #3 above apply, add the plural
    --    outside the link.

    local function word_ends_in_consonant_plus_y(text)
        -- FIXME, a subrule of rule #1 above says the -ies ending doesn't
        -- apply to proper nouns, hence "the Gettys", "the public Ivys".
        -- We should maybe consider applying this rule here; but it may not
        -- be important as this function is almost always called on common nouns
        -- (e.g. parts of speech, place types).
        return text:find("[^aeiouAEIOU ]y$")
    end

    local function word_takes_es_plural(text) return text:find("[sxz]$") or text:find("[cs]h$") end

    local function do_pluralize(text)
        if word_ends_in_consonant_plus_y(text) then
            -- avoid returning multiple values
            local hack_single_retval = text:gsub("y$", "ies")
            return hack_single_retval
        elseif word_takes_es_plural(text) then
            return text .. "es"
        else
            return text .. "s"
        end
    end

    -- Check for a link. This pattern matches both piped and unpiped links.
    -- If the link is not piped, the second capture (linktext) will be empty.
    local beginning, link, linktext = mw.ustring.match(text, "^(.*)%[%[([^|%]]+)%|?(.-)%]%]$")
    if link then
        if linktext ~= "" then return beginning .. "[[" .. link .. "|" .. do_pluralize(linktext) .. "]]" end
        if word_ends_in_consonant_plus_y(link) then return beginning .. "[[" .. link .. "|" .. link:gsub("y$", "ies") .. "]]" end
        return beginning .. "[[" .. link .. "]]" .. (word_takes_es_plural(link) and "es" or "s")
    end
    return do_pluralize(text)
end

function export.singularize(text)
    if type(text) == "table" then
        -- allow calling from a template
        text = text.args[1]
    end
    -- Singularize a word in a smart fashion, according to normal English rules.
    -- Works analogously to pluralize().
    -- NOTE: This doesn't always work as well as pluralize(). Beware. It will
    -- mishandle cases like "passes" -> "passe", "eyries" -> "eyry".
    -- 1. If word ends in -ies, replace -ies with -y.
    -- 2. If the word ends in -xes, -shes, -ches, remove -es. [Does not affect
    --    -ses, cf. "houses", "impasses".]
    -- 3. Otherwise, remove -s.
    -- This handles links correctly:
    -- 1. If a piped link, change the second part appropriately. Collapse the
    --    link to a simple link if both parts end up the same.
    -- 2. If a non-piped link, singularize the link.
    -- 3. A link like "[[parish]]es" will be handled correctly because the
    --    code that checks for -shes etc. allows ] characters between the
    --    'sh' etc. and final -es.
    local function do_singularize(text)
        local sing = text:match("^(.-)ies$")
        if sing then return sing .. "y" end
        -- Handle cases like "[[parish]]es"
        local sing = text:match("^(.-[sc]h%]*)es$")
        if sing then return sing end
        -- Handle cases like "[[box]]es"
        local sing = text:match("^(.-x%]*)es$")
        if sing then return sing end
        local sing = text:match("^(.-)s$")
        if sing then return sing end
        return text
    end

    local function collapse_link(link, linktext)
        if link == linktext then
            return "[[" .. link .. "]]"
        else
            return "[[" .. link .. "|" .. linktext .. "]]"
        end
    end

    -- Check for a link. This pattern matches both piped and unpiped links.
    -- If the link is not piped, the second capture (linktext) will be empty.
    local beginning, link, linktext = mw.ustring.match(text, "^(.*)%[%[([^|%]]+)%|?(.-)%]%]$")
    if link then
        if linktext ~= "" then return beginning .. collapse_link(link, do_singularize(linktext)) end
        return beginning .. "[[" .. do_singularize(link) .. "]]"
    end

    return do_singularize(text)
end

function export.add_indefinite_article(text, uppercase)
    local is_vowel = false
    -- If there's a link at the beginning, examine the first letter of the
    -- link text. This pattern matches both piped and unpiped links.
    -- If the link is not piped, the second capture (linktext) will be empty.
    local link, linktext, remainder = mw.ustring.match(text, "^%[%[([^|%]]+)%|?(.-)%]%](.*)$")
    if link then
        is_vowel = rfind(linktext ~= "" and linktext or link, "^[AEIOUaeiou]")
    else
        is_vowel = rfind(text, "^[AEIOUaeiou]")
    end
    return (is_vowel and (uppercase and "An " or "an ") or (uppercase and "A " or "a ")) .. text
end

return export
