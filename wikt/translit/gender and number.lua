--[=[
	This module creates standardised displays for gender and number.
	It converts a gender specification into Wiki/HTML format.
	
	A gender/number specification consists of one or more gender/number elements, separated by hyphens.
	Examples are: "n" (neuter gender), "f-p" (feminine plural), "m-an-p" (masculine animate plural),
	"pf" (perfective aspect). Each gender/number element has the following properties:
	1. A code, as used in the spec, e.g. "f" for feminine, "p" for plural".
	2. A type, e.g. "gender", "number" or "animacy". Each element in a given spec must be of a different type.
	3. A display form, which in turn consists of a display code and a tooltip gloss. The display code
	   may not be the same as the spec code, e.g. the spec code "an" has display code "anim" and tooltip
	   gloss "animate".
    4. A category into which lemmas of the right part of speech are placed if they have a gender/number
	   spec containing the given element. For example, a noun with gender/number spec "m-an-p" is placed
	   into the categories "LANG masculine nouns", "LANG animate nouns" and "LANG pluralia tantum".
]=] --
local export = {}

local codes = {}

-- A list of all possible "parts" that a specification can be made out of. For each part, we list
-- the class it's in (gender, animacy, etc.), the associated category (if any) and the display form.
-- In a given gender/number spec, only one part of each class is allowed.

codes["?"] = {type = "other", display = "<abbr title=\"gender incomplete\">?</abbr>"}

-- Genders
codes["m"] = {type = "gender", cat = "masculine POS", display = "<abbr title=\"masculine gender\">m</abbr>"}
codes["f"] = {type = "gender", cat = "feminine POS", display = "<abbr title=\"feminine gender\">f</abbr>"}
codes["n"] = {type = "gender", cat = "neuter POS", display = "<abbr title=\"neuter gender\">n</abbr>"}
codes["c"] = {type = "gender", cat = "common-gender POS", display = "<abbr title=\"common gender\">c</abbr>"}

-- Animacy
codes["an"] = {type = "animacy", cat = "animate POS", display = "<abbr title=\"animate\">anim</abbr>"}
codes["in"] = {type = "animacy", cat = "inanimate POS", display = "<abbr title=\"inanimate\">inan</abbr>"}
-- Animal (for Ukrainian, Belarusian, Polish)
codes["anml"] = {type = "animacy", cat = "animal POS", display = "<abbr title=\"animal\">animal</abbr>"}
-- Personal (for Ukrainian, Belarusian, Polish)
codes["pr"] = {type = "animacy", cat = "personal POS", display = "<abbr title=\"personal\">pers</abbr>"}
-- Nonpersonal not currently used
codes["np"] = {type = "animacy", cat = "nonpersonal POS", display = "<abbr title=\"nonpersonal\">npers</abbr>"}

-- Virility (for Polish)
codes["vr"] = {type = "virility", cat = "virile POS", display = "<abbr title=\"virile\">vir</abbr>"}
codes["nv"] = {type = "virility", cat = "nonvirile POS", display = "<abbr title=\"nonvirile\">nvir</abbr>"}

-- Numbers
codes["s"] = {type = "number", display = "<abbr title=\"singular number\">sg</abbr>"}
codes["d"] = {type = "number", cat = "dualia tantum", display = "<abbr title=\"dual number\">du</abbr>"}
codes["p"] = {type = "number", cat = "pluralia tantum", display = "<abbr title=\"plural number\">pl</abbr>"}

-- Verb qualifiers
codes["impf"] = {type = "aspect", cat = "imperfective POS", display = "<abbr title=\"imperfective aspect\">impf</abbr>"}
codes["pf"] = {type = "aspect", cat = "perfective POS", display = "<abbr title=\"perfective aspect\">pf</abbr>"}

-- Combined codes that are equivalent to giving multiple specs. `mf` is the same as specifying two separate specs,
-- one with `m` in it and the other with `f`. `mfbysense` is similar but is used for nouns that can be either masculine
-- or feminine according as to whether they refer to masculine or feminine beings.
local combined_codes = {}
combined_codes["mf"] = {codes = {"m", "f"}}
combined_codes["mfbysense"] = {codes = {"m", "f"}, cat = "masculine and feminine POS by sense"}

-- Categories when multiple gender/number specs of a given type occur in different 
local codetype_cats = {}
codetype_cats["gender"] = "POS with multiple genders"
codetype_cats["animacy"] = "POS with multiple animacies"
codetype_cats["aspect"] = "biaspectual POS"

-- Version of format_list that can be invoked from a template.
function export.show_list(frame)
    local args = frame.args
    local lang = args["lang"];
    if lang == "" then lang = nil end
    local list = {}
    local i = 1

    while args[i] and args[i] ~= "" do
        table.insert(list, args[i])
        i = i + 1
    end

    return export.format_list(list, lang)
end

-- Older entry point; equivalent to format_genders() except that it formats the
-- categories and returns them appended to the formatted gender text rather than
-- returning the formatted text and categories separately.
function export.format_list(specs, lang, pos_for_cat, sort_key)
    local text, cats = export.format_genders(specs, lang, pos_for_cat)
    if #cats == 0 then return text end
    return text .. require("utilities").format_categories(cats, lang, sort_key)
end

-- Format one or more gender/number specifications. Each spec is either a string, e.g. "f-p", or
-- a table of the form {spec = "SPEC", qualifiers = {"QUALIFIER", "QUALIFIER", ...}} where `.spec`
-- is a gender/number spec such as "f-p" and `.qualifiers` is a list of qualifiers to display before
-- the formatted gender/number spec. `.spec` must be present but `.qualifiers` may be omitted.
-- The function returns two values:
-- (a) the formatted text;
-- (b) a list of the categories to add.
-- If `lang` and `pos_for_cat` are given, gender categories such as "German masculine nouns" or
-- "Russian imperfective verbs" are added to the categories. Otherwise, if only `lang` is given,
-- the only category that may be returned is "Requests for gender in LANG entries". If both are
-- omitted, the returned list is empty.
function export.format_genders(specs, lang, pos_for_cat)
    local formatted_specs = {}
    local categories = {}
    local seen_types = {}
    local category_text = ""
    local all_is_nounclass = nil

    local function do_gender_spec(spec, parts)
        local types = {}

        for key, code in ipairs(parts) do
            -- Is this code valid?
            if not codes[code] then error("The tag \"" .. code .. "\" in the gender specification \"" .. spec.spec .. "\" is not valid.") end

            -- Check for multiple genders/numbers/animacies in a single spec.
            local typ = codes[code].type
            if typ ~= "other" and types[typ] then
                -- require("debug").track("gender and number/multiple")
                -- require("debug").track("gender and number/multiple/" .. spec)
                error("The gender specification \"" .. spec.spec .. "\" contains multiple tags of type \"" .. typ .. "\".")
            end
            types[typ] = true

            if spec.qualifiers and #spec.qualifiers > 0 then
                parts[key] = require("qualifier").format_qualifier(spec.qualifiers) .. " " .. codes[code].display
            else
                parts[key] = codes[code].display
            end

            -- Generate categories if called for.
            if lang and pos_for_cat then
                local cat = codes[code].cat
                if cat then table.insert(categories, lang:getCanonicalName() .. " " .. cat) end
                if seen_types[typ] and seen_types[typ] ~= code then
                    cat = codetype_cats[typ]
                    if cat then table.insert(categories, lang:getCanonicalName() .. " " .. cat) end
                end
                seen_types[typ] = code
            end
        end

        -- Add the processed codes together with non-breaking spaces
        if #parts == 1 then return parts[1] end
        return table.concat(parts, "&nbsp;")
    end

    for _, spec in ipairs(specs) do
        if type(spec) ~= "table" then spec = {spec = spec} end
        local is_nounclass
        -- If the specification starts with cX, then it is a noun class specification.
        if spec.spec:find("^[1-9]") or spec.spec:find("^c[^-]") then
            is_nounclass = true
            code = spec.spec:gsub("^c", "")

            local text
            if code == "?" then
                text = "<abbr class=\"noun-class\" title=\"noun class missing\">?</abbr>"
            else
                text = "<abbr class=\"noun-class\" title=\"noun class " .. code .. "\">" .. code .. "</abbr>"
                if lang and pos_for_cat then table.insert(categories, lang:getCanonicalName() .. " class " .. code .. " POS") end
            end
            local text_with_qual
            if spec.qualifiers and #spec.qualifiers > 0 then
                text_with_qual = require("qualifier").format_qualifier(spec.qualifiers) .. " " .. text
            else
                text_with_qual = text
            end
            table.insert(formatted_specs, text_with_qual)
        else
            -- Split the parts and iterate over each part, converting it into its display form
            local parts = mw.text.split(spec.spec, "%-")
            local extra_cats = {}

            local has_combined = false
            for _, code in ipairs(parts) do
                if combined_codes[code] then
                    has_combined = true
                    break
                end
            end

            if not has_combined then
                table.insert(formatted_specs, do_gender_spec(spec, parts))
            else
                local all_parts = {{}}

                for i, code in ipairs(parts) do
                    if combined_codes[code] then
                        local new_all_parts = {}
                        for _, one_parts in ipairs(all_parts) do
                            for _, one_code in ipairs(combined_codes[code].codes) do
                                local new_combined_parts = mw.clone(one_parts)
                                table.insert(new_combined_parts, one_code)
                                table.insert(new_all_parts, new_combined_parts)
                            end
                        end
                        all_parts = new_all_parts
                        if lang and pos_for_cat then
                            local extra_cat = combined_codes[code].cat
                            if extra_cat then table.insert(extra_cats, lang:getCanonicalName() .. " " .. extra_cat) end
                        end
                    else
                        for _, one_parts in ipairs(all_parts) do table.insert(one_parts, code) end
                    end
                end

                for _, parts in ipairs(all_parts) do table.insert(formatted_specs, do_gender_spec(spec, parts)) end
            end

            if #extra_cats > 0 then for _, cat in ipairs(extra_cats) do table.insert(categories, cat) end end

            if lang then
                -- Do some additional gender checks if a language was given
                -- Is this an incomplete gender?
                if spec.spec:find("?") then table.insert(categories, "Requests for gender in " .. lang:getCanonicalName() .. " entries") end

                -- Check if the specification is valid
                -- elseif langinfo.genders then
                --	local valid_genders = {}
                --	for _, g in ipairs(langinfo.genders) do valid_genders[g] = true end
                --	
                --	if not valid_genders[spec.spec] then
                --		local valid_string = {}
                --		for i, g in ipairs(langinfo.genders) do valid_string[i] = g end
                --		error('The gender specification "' .. spec.spec .. '" is not valid for ' .. langinfo.names[1] .. ". Valid are: " .. table.concat(valid_string, ", "))
                --	end
                -- end
            end

            is_nounclass = false
        end

        -- Ensure that the specifications are either all noun classes, or none are.
        if all_is_nounclass == nil then
            all_is_nounclass = is_nounclass
        elseif all_is_nounclass ~= is_nounclass then
            error("Noun classes and genders cannot be mixed. Please use either one or the other.")
        end
    end

    if lang and pos_for_cat then for i, cat in ipairs(categories) do categories[i] = cat:gsub("POS", pos_for_cat) end end

    if is_nounclass then
        -- Add the processed codes together with slashes
        return "<span class=\"gender\">class " .. table.concat(formatted_specs, "/") .. "</span>", categories
    else
        -- Add the processed codes together with " or "
        return "<span class=\"gender\">" .. table.concat(formatted_specs, " or ") .. "</span>", categories
    end
end

return export
