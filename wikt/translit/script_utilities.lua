local export = {}

--[=[
	Modules used:
	[[Module:script utilities/data]]
	[[Module:scripts]]
	[[Module:senseid]] (only when id's present)
	[[Module:string utilities]] (only when hyphens in Korean text or spaces in vertical text)
	[[Module:languages]]
	[[Module:parameters]]
	[[Module:utilities]]
	[[Module:debug]]
]=]

function export.is_Latin_script(sc)
    -- Latn, Latf, Latinx, pjt-Latn
    return sc:getCode():find("Lat") and true or false
end

-- Used by [[Template:lang]]
function export.lang_t(frame)
    params = {[1] = {}, [2] = {allow_empty = true, default = ""}, ["sc"] = {}, ["face"] = {}, ["class"] = {}}

    local args = require("parameters").process(frame:getParent().args, params)
    local NAMESPACE = mw.title.getCurrentTitle().nsText

    local lang = args[1] or (NAMESPACE == "Template" and "und") or error("Language code has not been specified. Please pass parameter 1 to the template.")
    lang = require("languages").getByCode(lang) or require("languages").err(lang, 1)

    local text = args[2]

    local sc = args["sc"]
    sc = (sc and (require("scripts").getByCode(sc) or error("The script code \"" .. sc .. "\" is not valid.")) or nil)

    local face = args["face"]

    return export.tag_text(text, lang, sc, face, class)
end

-- Ustring turns on the codepoint-aware string matching. The basic string function
-- should be used for simple sequences of characters, Ustring function for
-- sets – [].
local function trackPattern(text, pattern, tracking, ustring)
    local find = ustring and mw.ustring.find or string.find
    if pattern and find(text, pattern) then require("debug").track("script/" .. tracking) end
end

local function track(text, lang, sc)
    local U = mw.ustring.char

    if lang and text then
        local langCode = lang:getCode()

        -- [[Special:WhatLinksHere/Template:tracking/script/ang/acute]]
        if langCode == "ang" then
            local decomposed = mw.ustring.toNFD(text)
            local acute = U(0x301)

            trackPattern(decomposed, acute, "ang/acute")

            --[=[
		[[Special:WhatLinksHere/Template:tracking/script/Greek/wrong-phi]]
		[[Special:WhatLinksHere/Template:tracking/script/Greek/wrong-theta]]
		[[Special:WhatLinksHere/Template:tracking/script/Greek/wrong-kappa]]
		[[Special:WhatLinksHere/Template:tracking/script/Greek/wrong-rho]]
			ϑ, ϰ, ϱ, ϕ should generally be replaced with θ, κ, ρ, φ.
		]=]
        elseif langCode == "el" or langCode == "grc" then
            trackPattern(text, "ϑ", "Greek/wrong-theta")
            trackPattern(text, "ϰ", "Greek/wrong-kappa")
            trackPattern(text, "ϱ", "Greek/wrong-rho")
            trackPattern(text, "ϕ", "Greek/wrong-phi")

            --[=[
			[[Special:WhatLinksHere/Template:tracking/script/Ancient Greek/spacing-coronis]]
			[[Special:WhatLinksHere/Template:tracking/script/Ancient Greek/spacing-smooth-breathing]]
			[[Special:WhatLinksHere/Template:tracking/script/Ancient Greek/wrong-apostrophe]]
				When spacing coronis and spacing smooth breathing are used as apostrophes, 
				they should be replaced with right single quotation marks (’).
			]=]
            if langCode == "grc" then
                trackPattern(text, U(0x1FBD), "Ancient Greek/spacing-coronis")
                trackPattern(text, U(0x1FBF), "Ancient Greek/spacing-smooth-breathing")
                trackPattern(text, "[" .. U(0x1FBD) .. U(0x1FBF) .. "]", "Ancient Greek/wrong-apostrophe", true)
            end

            -- [[Special:WhatLinksHere/Template:tracking/script/Russian/grave-accent]]
        elseif langCode == "ru" then
            local decomposed = mw.ustring.toNFD(text)

            trackPattern(decomposed, U(0x300), "Russian/grave-accent")

            -- [[Special:WhatLinksHere/Template:tracking/script/Tibetan/trailing-punctuation]]
        elseif langCode == "bo" then
            trackPattern(text, "[་།]$", "Tibetan/trailing-punctuation", true)
            trackPattern(text, "[་།]%]%]$", "Tibetan/trailing-punctuation", true)

            --[=[
		[[Special:WhatLinksHere/Template:tracking/script/Thai/broken-ae]]
		[[Special:WhatLinksHere/Template:tracking/script/Thai/broken-am]]
		[[Special:WhatLinksHere/Template:tracking/script/Thai/wrong-rue-lue]]
		]=]
        elseif langCode == "th" then
            trackPattern(text, "เ" .. "เ", "Thai/broken-ae")
            trackPattern(text, "ํ[่้๊๋]?า", "Thai/broken-am", true)
            trackPattern(text, "[ฤฦ]า", "Thai/wrong-rue-lue", true)

            --[=[
		[[Special:WhatLinksHere/Template:tracking/script/Lao/broken-ae]]
		[[Special:WhatLinksHere/Template:tracking/script/Lao/broken-am]]
		[[Special:WhatLinksHere/Template:tracking/script/Lao/possible-broken-ho-no]]
		[[Special:WhatLinksHere/Template:tracking/script/Lao/possible-broken-ho-mo]]
		[[Special:WhatLinksHere/Template:tracking/script/Lao/possible-broken-ho-lo]]
		]=]
        elseif langCode == "lo" then
            trackPattern(text, "ເ" .. "ເ", "Lao/broken-ae")
            trackPattern(text, "ໍ[່້໊໋]?າ", "Lao/broken-am", true)
            trackPattern(text, "ຫນ", "Lao/possible-broken-ho-no")
            trackPattern(text, "ຫມ", "Lao/possible-broken-ho-mo")
            trackPattern(text, "ຫລ", "Lao/possible-broken-ho-lo")

            --[=[
		[[Special:WhatLinksHere/Template:tracking/script/Lü/broken-ae]]
		[[Special:WhatLinksHere/Template:tracking/script/Lü/possible-wrong-sequence]]
		]=]
        elseif langCode == "khb" then
            trackPattern(text, "ᦵ" .. "ᦵ", "Lü/broken-ae")
            trackPattern(text, "[ᦀ-ᦫ][ᦵᦶᦷᦺ]", "Lü/possible-wrong-sequence", true)
        end
    end
end

-- Apply a function to `text`, but not to the target of wikilinks or to HTML tags.
local function munge_text(text, fn)
    local has_html = text:find("<")
    local has_two_part_link = text:find("%[%[.*|")
    if not has_html and not has_two_part_link then return fn(text) end

    local strutils = require("string utilities")

    local function munge_text_with_html(txt)
        local parts = strutils.capturing_split(txt, "(<[^>]->)")
        for i = 1, #parts, 2 do parts[i] = fn(parts[i]) end
        return table.concat(parts)
    end

    if has_two_part_link then
        -- The hard case is when both two-part links and HTML tags occur, because crippled Lua patterns
        -- don't support alternation. We need to first split on two-part links (which seem more likely
        -- to occur), then split odd-numbered fragments on HTML tags, then apply the function to
        -- odd-numbered subfragments. This is unlikely to be very efficient, but should occur rarely.
        local parts = strutils.capturing_split(text, "(%[%[[^%[%]|]-|)")
        for i = 1, #parts, 2 do
            if has_html then
                parts[i] = munge_text_with_html(parts[i])
            else
                parts[i] = fn(parts[i])
            end
        end
        return table.concat(parts)
    else -- HTML tags only
        return munge_text_with_html(text)
    end
end

-- Wrap text in the appropriate HTML tags with language and script class.
function export.tag_text(text, lang, sc, face, class, id)
    if not sc then sc = require("scripts").findBestScript(text, lang) end

    track(text, lang, sc)

    -- Replace space characters with newlines in Mongolian-script text, which is written top-to-bottom.
    if sc and sc:getDirection() == "down" and text:find(" ") then
        text = munge_text(text, function(txt)
            -- having extra parentheses makes sure only the first return value gets through
            return (txt:gsub(" +", "<br>"))
        end)
    end

    -- Hack Korean text to remove hyphens. This should be handled in a more general fashion, but needs to
    -- be efficient by not doing anything if no hyphens are present, and currently this is the only
    -- language needing such processing.
    if lang:getCode() == "ko" and text:find("%-") then
        text = munge_text(text, function(txt)
            -- having extra parentheses makes sure only the first return value gets through
            return (txt:gsub("%-", ""))
        end)
    end

    if sc:getCode() == "Imag" then face = nil end

    local function class_attr(classes)
        table.insert(classes, 1, sc:getCode())
        if class and class ~= "" then table.insert(classes, class) end
        return "class=\"" .. table.concat(classes, " ") .. "\""
    end

    local function tag_attr(...)
        local output = {}
        if id then table.insert(output, "id=\"" .. require("senseid").anchor(lang, id) .. "\"") end

        table.insert(output, class_attr({...}))

        if lang then table.insert(output, "lang=\"" .. lang:getCode() .. "\"") end

        return table.concat(output, " ")
    end

    if face == "hypothetical" then
        -- [[Special:WhatLinksHere/Template:tracking/script-utilities/face/hypothetical]]
        require("debug").track("script-utilities/face/hypothetical")
    end

    local data = mw.loadData("script utilities/data").faces[face or "nil"]

    local post = ""
    if sc:getDirection() == "rtl" and (face == "translation" or mw.ustring.find(text, "%p$")) then post = "&lrm;" end

    -- Add a script wrapper
    if data then
        return (data.prefix or "") .. "<" .. data.tag .. " " .. tag_attr(data.class) .. ">" .. text .. "</" .. data.tag .. ">" .. post
    else
        error("Invalid script face \"" .. face .. "\".")
    end
end

function export.tag_translit(translit, lang, kind, attributes, is_manual)
    if type(lang) == "table" then lang = lang.getCode and lang:getCode() or error("Second argument to tag_translit should be a language code or language object.") end

    local data = mw.loadData("script utilities/data").translit[kind or "default"]

    local opening_tag = {}

    table.insert(opening_tag, data.tag)
    if lang == "ja" then
        table.insert(opening_tag, "class=\"" .. (data.classes and data.classes .. " " or "") .. (is_manual and "manual-tr " or "") .. "tr\"")
    else
        table.insert(opening_tag, "lang=\"" .. lang .. "-Latn\"")
        table.insert(opening_tag, "class=\"" .. (data.classes and data.classes .. " " or "") .. (is_manual and "manual-tr " or "") .. "tr Latn\"")
    end

    if data.dir then table.insert(opening_tag, "dir=\"" .. data.dir .. "\"") end

    table.insert(opening_tag, attributes)

    return "<" .. table.concat(opening_tag, " ") .. ">" .. translit .. "</" .. data.tag .. ">"
end

function export.tag_transcription(transcription, lang, kind, attributes)
    if type(lang) == "table" then lang = lang.getCode and lang:getCode() or error("Third argument to tag_translit should be a language code or language object.") end

    local data = mw.loadData("script utilities/data").transcription[kind or "default"]

    local opening_tag = {}

    table.insert(opening_tag, data.tag)
    if lang == "ja" then
        table.insert(opening_tag, "class=\"" .. (data.classes and data.classes .. " " or "") .. "ts\"")
    else
        table.insert(opening_tag, "lang=\"" .. lang .. "-Latn\"")
        table.insert(opening_tag, "class=\"" .. (data.classes and data.classes .. " " or "") .. "ts Latn\"")
    end

    if data.dir then table.insert(opening_tag, "dir=\"" .. data.dir .. "\"") end

    table.insert(opening_tag, attributes)

    return "<" .. table.concat(opening_tag, " ") .. ">" .. transcription .. "</" .. data.tag .. ">"
end

-- Add a notice to request the native script of a word
function export.request_script(lang, sc, usex, nocat, sort_key)
    local scripts = lang.getScripts and lang:getScripts() or error("The language \"" .. lang:getCode() .. "\" does not have the method getScripts. It may be unwritten.")

    -- By default, request for "native" script
    local cat_script = "native"
    local disp_script = "script"

    -- If the script was not specified, and the language has only one script, use that.
    if not sc and #scripts == 1 then sc = scripts[1] end

    -- Is the script known?
    if sc then
        -- If the script is Latin, return nothing.
        if export.is_Latin_script(sc) then return "" end

        if sc:getCode() ~= scripts[1]:getCode() then disp_script = sc:getCanonicalName() end

        -- The category needs to be specific to script only if there is chance
        -- of ambiguity. This occurs when lang=und, or when the language has
        -- multiple scripts.
        if lang:getCode() == "und" or scripts[2] then cat_script = sc:getCanonicalName() end
    else
        -- The script is not known.
        -- Does the language have at least one non-Latin script in its list?
        local has_nonlatin = false

        for i, val in ipairs(scripts) do
            if not export.is_Latin_script(val) then
                has_nonlatin = true
                break
            end
        end

        -- If there are no non-Latin scripts, return nothing.
        if not has_nonlatin then return "" end
    end

    local category

    if usex then
        category = "Requests for " .. cat_script .. " script in " .. lang:getCanonicalName() .. " usage examples"
    else
        category = "Requests for " .. cat_script .. " script for " .. lang:getCanonicalName() .. " terms"
    end

    return "<small>[" .. disp_script .. " needed]</small>" .. (nocat and "" or require("utilities").format_categories({category}, lang, sort_key))
end

function export.template_rfscript(frame)
    params = {[1] = {required = true, default = "und"}, ["sc"] = {}, ["usex"] = {type = "boolean"}, ["nocat"] = {type = "boolean"}, ["sort"] = {}}

    local args = require("parameters").process(frame:getParent().args, params)

    local lang = require("languages").getByCode(args[1], 1)
    local sc = args.sc and require("scripts").getByCode(args.sc, true)

    local ret = export.request_script(lang, sc, args.usex, args.nocat, args.sort)

    if ret == "" then
        error("This language is written in the Latin alphabet. It does not need a native script.")
    else
        return ret
    end
end

function export.checkScript(text, scriptCode, result)
    local scriptObject = require("scripts").getByCode(scriptCode)

    if not scriptObject then error("The script code \"" .. scriptCode .. "\" is not recognized.") end

    local originalText = text

    -- Remove non-letter characters.
    text = mw.ustring.gsub(text, "[%A]", "")

    -- Remove all characters of the script in question.
    text = mw.ustring.gsub(text, "[" .. scriptObject:getCharacters() .. "]", "")

    if text ~= "" then
        if type(result) == "string" then
            error(result)
        else
            error("The text \"" .. originalText .. "\" contains the letters \"" .. text .. "\" that do not belong to the " .. scriptObject:getCategoryName() .. ".", 2)
        end
    end
end

return export
