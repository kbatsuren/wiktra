local export = {}

--[=[
	[[Unsupported titles]] and pages with high
	memory usage are listed at [[Module:links/data]].

	Other modules used:
		[[Module:script utilities]]
		[[Module:scripts]]
		[[Module:languages]] and its submodules
		[[Module:gender and number]]
		[[Module:utilities]]
		[[Module:string]]
		[[Module:debug]]
]=]

-- These are prefixed with u to avoid confusion with the default string methods
-- of the same name.
local usub = mw.ustring.sub

local table_insert = table.insert
local table_concat = table.concat

local ignore_cap = {["ko"] = true}

local phonetic_extraction = {["th"] = "Module:th", ["km"] = "Module:km"}

local pos_tags = {["a"] = "adjective", ["adv"] = "adverb", ["int"] = "interjection", ["n"] = "noun", ["pron"] = "pronoun", ["v"] = "verb", ["vi"] = "intransitive verb", ["vt"] = "transitive verb", ["vti"] = "transitive and intransitive verb"}

local unsupported_titles
function export.getLinkPage(target, lang)
    unsupported_titles = unsupported_titles or mw.loadData("links/data").unsupported_titles
    if unsupported_titles[target] then return "Unsupported titles/" .. unsupported_titles[target] end

    -- If the link contains unexpanded template parameters, then don't create a link.
    if target:find("{{{") then return nil end

    if target:sub(1, 1) == ":" or target:sub(1, 2) == "w:" or target:sub(1, 10) == "wikipedia:" then return target end

    -- Remove diacritics from the page name
    target = lang:makeEntryName(target)

    if target:sub(1, 1) == "/" then
        return ":" .. target

        -- Link to appendix for reconstructed terms and terms in appendix-only languages
    elseif target:sub(1, 1) == "*" and #target > 1 then
        if lang:getCode() == "und" then return nil end

        target = "Reconstruction:" .. lang:getCanonicalName() .. "/" .. usub(target, 2)
    elseif lang:getType() == "reconstructed" then
        error("The specified language " .. lang:getCanonicalName() .. " is unattested, while the given word is not marked with '*' to indicate that it is reconstructed")
    elseif lang:getType() == "appendix-constructed" then
        target = "Appendix:" .. lang:getCanonicalName() .. "/" .. target
    end

    return target
end

-- Make a language-specific link from given link's parts
local function makeLangLink(link, lang, id, allow_self_link)
    -- Temporary tracking code
    local langCode = lang:getCode()
    if langCode == "se" or langCode == "sia" or langCode:find("^sm[ajns]$") or langCode:find("^sj[dektu]$") then
        if link.display and link.display:find("'") then
            require("debug").track("links/Sami apostrophe display")
        elseif link.target and link.target:find("'") then
            require("debug").track("links/Sami apostrophe target")
        end
    end

    -- Find fragments (when link didn't come from parseLink).
    -- Prevents {{l|en|word#Etymology 2|word}} from linking to [[word#Etymology 2#English]].
    if link.fragment == nil then
        -- Replace numeric character references with the corresponding character (&#29; → '),
        -- as they contain #, which causes the numeric character reference to be
        -- misparsed (wa'a → wa&#29;a → pagename wa&, fragment 29;a).
        link.target = link.target:gsub("&#(%d+);", function(number) return mw.ustring.char(tonumber(number)) end)
        local first, second = link.target:match("^([^#]+)#(.+)$")
        if first then link.target, link.fragment = first, second end
    end

    -- If there is no display form, then create a default one
    if not link.display then
        link.display = link.target

        -- Strip the prefix from the displayed form
        -- TODO: other interwiki links?
        if link.display:sub(1, 1) == ":" and not mw.loadData("links/data").unsupported_titles[link.display] then
            link.display = link.display:sub(2) -- remove colon from beginning
        else
            local prefix = link.display:match("^([^:]+):")
            local prefixes = {w = true, wikipedia = true}

            if prefixes[prefix] then
                link.display = link.display:sub(#prefix + 2) -- remove prefix plus colon
            end
        end
    end

    -- Process the target
    link.target = export.getLinkPage(link.target, lang)

    if not link.target then return link.display end

    -- If the target is the same as the current page and there is no sense id
    -- and linking to the same page hasn't been turned on, then return a "self-link"
    -- like the software does.
    if not (allow_self_link or id) and link.target:gsub("^:", "") == mw.title.getCurrentTitle().prefixedText then return "<strong class=\"selflink\">" .. link.display .. "</strong>" end

    --[[
		Add fragment
		Do not add a section link to "Undetermined", as such sections do not exist and are invalid.
		TabbedLanguages handles links without a section by linking to the "last visited" section,
		but adding "Undetermined" would break that feature.
		For localized prefixes that make syntax error, please use the format: ["xyz"] = true,
	]]
    local prefix = link.target:match("^:?([^:]+):")
    local prefixes = {w = true, wikipedia = true, Category = true}

    if not prefixes[prefix] then
        if link.fragment or link.target:find("#$") then require("debug").track {"links/fragment", "links/fragment/" .. lang:getCode()} end

        if not link.fragment and lang:getCode() ~= "und" then
            if id then
                link.fragment = require("senseid").anchor(lang, id)
            elseif not mw.ustring.find(link.target, "^Appendix:") and not mw.ustring.find(link.target, "^Reconstruction:") then
                link.fragment = lang:getCanonicalName()
            end
        end

        -- This allows linking to pages like [[sms:a]] without it being treated weirdly.
        link.target = link.target:gsub(":", "&#x3a;")
    end

    return "[[" .. link.target .. (link.fragment and "#" .. link.fragment or "") .. "|" .. link.display .. "]]"
end

-- Split a link into its parts
local function parseLink(linktext)
    local link = {target = linktext}
    local first, second = link.target:match("^([^|]+)|(.+)$")

    if first then
        link.target = first
        link.display = second
    else
        link.display = link.target
    end

    first, second = link.target:match("^(.+)#(.+)$")

    if first then
        link.target = first
        link.fragment = second
    else
        -- So that makeLangLink does not look for a fragment again
        link.fragment = false
    end

    return link
end

-- Creates a basic wikilink to the given term. If the text already contains
-- links, these are replaced with links to the correct section.
function export.language_link(data, allow_self_link)
    if type(data) ~= "table" then error("The first argument to the function language_link must be a table. See Module:links/documentation for more information.") end

    local text = data.term

    if ignore_cap[data.lang:getCode()] and text then text = text:gsub("%^", "") end

    -- If the text begins with * and another character,
    -- then act as if each link begins with *
    local allReconstructed = false

    if text:find("^*.") then allReconstructed = true end

    -- Do we have embedded wikilinks?
    if text:find("[[", nil, true) then
        --[=[
		[[Special:WhatLinksHere/Template:tracking/links/alt-ignored]]
		[[Special:WhatLinksHere/Template:tracking/links/id-ignored]]
		]=]

        if data.alt then
            require("debug").track("links/alt-ignored")
            mw.log("(from Module:links)", "text with embedded wikilinks:", text, "ignored alt:", data.alt, "lang:", data.lang:getCode())
        end

        if data.id then
            require("debug").track("links/id-ignored")
            mw.log("(from Module:links)", "text with embedded wikilinks:", text, "ignored id:", data.id, "lang:", data.lang:getCode())
        end

        -- Begins and ends with a wikilink tag
        if text:find("^%[%[(.+)%]%]$") then
            -- There are no [ ] in between.
            -- This makes the wikilink tag redundant.
            if text:find("^%[%[[^%[%]]+%]%]$") then
                require("debug").track("links/redundant wikilink")
            else
                local temp = text:gsub("^%[%[(.+)%]%]$", "%1")
                temp = temp:gsub("%]%], %[%[", "|")

                if not temp:find("[%[%]]") then require("debug").track("links/list") end
            end
        end

        text = text:gsub("%[%[([^%]]+)%]%]", function(linktext)
            local link = parseLink(linktext)

            if allReconstructed then link.target = "*" .. link.target end

            return makeLangLink(link, data.lang, data.id, allow_self_link)
        end)

        -- Remove the extra * at the beginning if it's immediately followed
        -- by a link whose display begins with * too
        if allReconstructed then text = text:gsub("^%*%[%[([^|%]]+)|%*", "[[%1|*") end
    else
        -- There is no embedded wikilink, make a link using the parameters.
        text = makeLangLink({target = text, display = data.alt}, data.lang, data.id, allow_self_link)
    end

    return text
end

function export.mark(text, itemType, face, lang)
    local tag = {"", ""}

    if itemType == "gloss" then
        tag = {"<span class=\"mention-gloss-double-quote\">“</span><span class=\"mention-gloss\">", "</span><span class=\"mention-gloss-double-quote\">”</span>"}
    elseif itemType == "tr" then
        if face == "term" then
            tag = {"<span lang=\"" .. lang:getCode() .. "\" class=\"tr mention-tr Latn\">", "</span>"}
        else
            tag = {"<span lang=\"" .. lang:getCode() .. "\" class=\"tr Latn\">", "</span>"}
        end
    elseif itemType == "ts" then
        tag = {"<span class=\"ts mention-ts Latn\">/", "/</span>"}
    elseif itemType == "pos" then
        tag = {"<span class=\"ann-pos\">", "</span>"}
    elseif itemType == "annotations" then
        tag = {"<span class=\"mention-gloss-paren annotation-paren\">(</span>", "<span class=\"mention-gloss-paren annotation-paren\">)</span>"}
    end

    if type(text) == "string" then
        return tag[1] .. text .. tag[2]
    else
        return ""
    end
end

-- Format the annotations (things following the linked term)
function export.format_link_annotations(data, face)
    local output = {}

    -- Interwiki link
    if data.interwiki then table_insert(output, data.interwiki) end

    -- Genders
    if type(data.genders) ~= "table" then data.genders = {data.genders} end

    if data.genders and #data.genders > 0 then
        local m_gen = require("gender and number")
        table_insert(output, "&nbsp;" .. m_gen.format_list(data.genders, data.lang))
    end

    local annotations = {}

    -- Transliteration and transcription
    if data.tr or data.ts then
        local kind
        if face == "term" then
            kind = face
        else
            kind = "default"
        end

        if data.tr and data.ts then
            table_insert(annotations, require("script utilities").tag_translit(data.tr, data.lang, kind) .. " " .. export.mark(data.ts, "ts"))
        elseif data.ts then
            table_insert(annotations, export.mark(data.ts, "ts"))
        else
            table_insert(annotations, require("script utilities").tag_translit(data.tr, data.lang, kind))
        end
    end

    -- Gloss/translation
    if data.gloss then table_insert(annotations, export.mark(data.gloss, "gloss")) end

    -- Part of speech
    if data.pos then
        -- debug category for pos= containing transcriptions
        if data.pos:find("/[^><]*/") then data.pos = data.pos .. "[[Category:links likely containing transcriptions in pos]]" end

        table_insert(annotations, export.mark(pos_tags[data.pos] or data.pos, "pos"))
    end

    -- Literal/sum-of-parts meaning
    if data.lit then table_insert(annotations, "literally " .. export.mark(data.lit, "gloss")) end

    if #annotations > 0 then table_insert(output, " " .. export.mark(table_concat(annotations, ", "), "annotations")) end

    return table_concat(output)
end

-- A version of {{l}} or {{m}} that can be called from other modules too
function export.full_link(data, face, allow_self_link, no_check_redundant_translit)
    if type(data) ~= "table" then error("The first argument to the function full_link must be a table. " .. "See Module:links/documentation for more information.") end

    -- Create the link
    local output = {}
    local categories = {}
    local link = ""
    local annotations

    -- local m_utilities = require("utilities")

    -- Is there any text to show?
    if (data.term or data.alt) then
        -- Try to detect the script if it was not provided
        if not data.sc then
            data.sc = require("scripts").findBestScript(data.alt or data.term, data.lang)
        else
            -- Track uses of sc parameter
            local best = require("scripts").findBestScript(data.alt or data.term, data.lang)
            require("debug").track("links/sc")

            if data.sc:getCode() == best:getCode() then
                require("debug").track("links/sc/redundant")
                require("debug").track("links/sc/redundant/" .. data.sc:getCode())
            else
                require("debug").track("links/sc/needed")
                require("debug").track("links/sc/needed/" .. data.sc:getCode())
            end
        end

        local class = ""

        local function encode_accel_param(prefix, param)
            -- This is decoded again by [[WT:ACCEL]].
            return param and prefix .. param:gsub("%%", "."):gsub(" ", "_") or ""
        end

        if data.accel then
            local form = data.accel.form and data.accel.form .. "-form-of" or ""
            local gender = encode_accel_param("gender-", data.accel.gender)
            local pos = encode_accel_param("pos-", data.accel.pos)
            local translit = encode_accel_param("transliteration-", data.accel.translit)
            local lemma = encode_accel_param("origin-", data.accel.lemma)
            local lemma_translit = encode_accel_param("origin_transliteration-", data.accel.lemma_translit)
            local no_store = data.accel.no_store and "form-of-nostore" or ""

            local accel = form .. " " .. gender .. " " .. pos .. " " .. translit .. " " .. lemma .. " " .. lemma_translit .. " " .. no_store .. " "

            class = "form-of lang-" .. data.lang:getCode() .. " " .. accel
        end

        -- Only make a link if the term has been given, otherwise just show the alt text without a link
        link = require("script utilities").tag_text(data.term and export.language_link(data, allow_self_link) or data.alt, data.lang, data.sc, face, class)
    else
        --[[	No term to show.
				Is there at least a transliteration we can work from?	]]
        link = require("script utilities").request_script(data.lang, data.sc)

        if link == "" or not data.tr or data.tr == "-" then
            -- No link to show, and no transliteration either. Show a term request.
            local category = ""

            if mw.title.getCurrentTitle().nsText ~= "Template" then table_insert(categories, "[[Category:" .. data.lang:getCanonicalName() .. " term requests]]") end

            link = "<small>[Term?]</small>"
        end
    end

    table_insert(output, link)

    if data.tr == "" or data.tr == "-" then
        data.tr = nil

    elseif phonetic_extraction[data.lang:getCode()] then
        local m_phonetic = require(phonetic_extraction[data.lang:getCode()])
        data.tr = data.tr or m_phonetic.getTranslit(export.remove_links(data.term))

    elseif (data.term or data.alt) and not data.sc:getCode():find("Lati?n") then

        -- Try to generate a transliteration, unless transliteration has been supplied and either
        -- no_check_redundant_translit is given or we are in a high-memory entry. (Checking for redundant
        -- transliteration can use up significant amounts of memory so we don't want to do it if memory
        -- is tight. `no_check_redundant_translit` is currently set when called ultimately from
        -- {{multitrans|...|no-check-redundant-translit=1}}.)
        if not (data.tr and (no_check_redundant_translit or mw.loadData("links/data").high_memory_entries[mw.title.getCurrentTitle().text])) then
            local automated_tr = data.lang:transliterate(export.remove_links(data.alt or data.term), data.sc)

            if automated_tr then
                local manual_tr = data.tr

                if manual_tr then
                    if manual_tr == automated_tr then
                        table_insert(categories, "[[Category:Terms with redundant transliterations]]" .. "[[Category:Terms with redundant transliterations/" .. data.lang:getCode() .. "]]")
                    else
                        -- Prevents Arabic root categories from flooding the tracking categories.
                        if mw.title.getCurrentTitle().nsText ~= "Category" then table_insert(categories, "[[Category:Terms with manual transliterations different from the automated ones]]" .. "[[Category:Terms with manual transliterations different from the automated ones/" .. data.lang:getCode() .. "]]") end
                    end
                end

                if (not manual_tr) or data.lang:overrideManualTranslit() then data.tr = automated_tr end
            end
        end
    end

    -- Link to the transliteration entry for languages that require this
    if data.tr and data.lang:link_tr() then data.tr = export.language_link {lang = data.lang, term = data.tr} end

    table_insert(output, export.format_link_annotations(data, face))

    return table_concat(output) .. table_concat(categories)
end

--[[	Strips links: deletes category links,
		the targets of piped links,
		and all double square brackets.			]]
function export.remove_links(text)
    if type(text) == "table" then text = text.args[1] end

    if not text or text == "" then return "" end

    text = mw.ustring.gsub(text, "%[%[Category:[^|%]]-|?[^|%]]-%]%]", "")
    text = text:gsub("%[%[[^|%]]-|", "")
    text = text:gsub("%[%[", "")
    text = text:gsub("%]%]", "")

    return text
end

function export.english_links(text)
    local lang = require("languages").getByCode("en")

    -- Parentheses around function call to remove second return value, the
    -- number of replacements.
    return (text:gsub("%[%[([^%]]+)%]%]", function(linktext)
        local link = parseLink(linktext)
        return makeLangLink(link, lang, nil, true, false)
    end))
end

--[=[
	For example, Norwegian_Bokm.C3.A5l → Norwegian_Bokmål. 0xC3 and 0xA5 are the
	hexadecimal-base representation of the two bytes used to encode the character
	å in the UTF-8 encoding:
		11000011 10100101

	Note that the bytes used to represent a character are actually different from
	the Unicode codepoint. For å, the codepoint is 0xE5. The bits (digits) that
	actually spell the codepoint are found in the brackets: 110[00011] 10[100101].
	For further explanation, see [[w:UTF-8#Description]].
]=]

-- The character class %x should not be used, as it includes the characters a-f,
-- which do not occur in these anchor encodings.
local capitalHex = "[0-9A-F]"

local function decodeAnchor(anchor) return (anchor:gsub("%.(" .. capitalHex .. capitalHex .. ")", function(hexByte) return string.char(tonumber(hexByte, 16)) end)) end

function export.section_link(link)
    if type(link) ~= "string" then error("The first argument to section_link was a " .. type(link) .. ", but it should be a string.") end

    link = link:gsub("_", " ")

    local numberSigns = require("string").count(link, "#")

    if numberSigns > 1 then error("The section link should only contain one number sign (#).") end

    link = mw.uri.decode(link, "WIKI")
    local page, section = link:match("^([^#]*)#(.+)$")
    if page == "" then page = nil end

    if section then
        section = decodeAnchor(section)

        -- URI-encode (percent-encode) section to allow square brackets and
        -- other dodgy characters in section name.
        -- If not percent-encoded, they prevent the parser from creating a link.
        -- Decode percent-encoding in the displayed text
        if page then
            return "[[" .. page .. "#" .. mw.uri.encode(section, "WIKI") .. "|" .. page .. " §&nbsp;" .. section .. "]]"
        else
            return "[[#" .. mw.uri.encode(section, "WIKI") .. "|§&nbsp;" .. section .. "]]"
        end
    else
        error("The function “section_link” could not find a number sign marking a section name.")
    end
end

return export
