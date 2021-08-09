local export = {}

local m_script_utils = require("script utilities")
local m_links = require("links")
local lang = require("languages").getByCode("grc")
local sc = require("scripts").getByCode("polytonic")

local m_data = mw.loadData("grc-utilities/data")
local groups = m_data.groups
local diacritic_order = m_data.diacritic_order
local conversions = m_data.conversions
local diacritics = m_data.diacritics
local diacritic = m_data.diacritic
local macron = diacritics.macron
local breve = diacritics.breve
local spacing_macron = diacritics.spacing_macron
local spacing_breve = diacritics.spacing_breve
local rough = diacritics.rough
local smooth = diacritics.smooth
local diaeresis = diacritics.diaeresis
local acute = diacritics.acute
local grave = diacritics.grave
local circumflex = diacritics.circum
local subscript = diacritics.subscript
local combining_diacritic = m_data.combining_diacritic

local UTF8_char = "[\1-\127\194-\244][\128-\191]*"
local basic_Greek = "[\206-\207][\128-\191]" -- excluding first line of Greek and Coptic block: ͰͱͲͳʹ͵Ͷͷͺͻͼͽ;Ϳ

local find = mw.ustring.find
local match = mw.ustring.match
local gmatch = mw.ustring.gmatch
local sub = mw.ustring.sub
local gsub = mw.ustring.gsub
local toNFC = mw.ustring.toNFC
local decompose = mw.ustring.toNFD

local info = {}
-- The tables are shared among different characters so that they can be checked
-- for equality if needed, and to use less space.
local vowel_t = {vowel = true}
local iota_t = {vowel = true, offglide = true}
local upsilon_t = {vowel = true, offglide = true}
-- These don't need any contents.
local rho_t = {}
-- local consonant_t = {}
local diacritic_t = {diacritic = true}
-- Needed for equality comparisons.
local breathing_t = {diacritic = true}

local function add_info(characters, t)
    if type(characters) == "string" then
        for character in string.gmatch(characters, UTF8_char) do info[character] = t end
    else
        for i, character in ipairs(characters) do info[character] = t end
    end
end

add_info({macron, breve, diaeresis, acute, grave, circumflex, subscript}, diacritic_t)

add_info({rough, smooth}, breathing_t)
add_info("ΑΕΗΟΩαεηοω", vowel_t)
add_info("Ιι", iota_t)
add_info("Υυ", upsilon_t)
-- add_info("ΒΓΔΖΘΚΛΜΝΞΠΡΣΤΦΧΨϜϘϺϷͶϠβγδζθκλμνξπρσςτφχψϝϙϻϸͷϡ", consonant_t)
add_info("Ρρ", rho_t)

local not_recognized = {}
setmetatable(info, {__index = function(t, key) return not_recognized end})

local sparseConcat = require("table").sparseConcat

local checkType = require"libraryUtil".checkType

local function _check(funcName) return function(argIndex, arg, expectType, nilOk) return checkType(funcName, argIndex, arg, expectType, nilOk) end end

-- Perform a function on each Unicode character in a string.
local function forEach(str, func) for char in string.gmatch(str, UTF8_char) do func(char) end end

-- This concatenates or inserts a character, then removes it from the text.
local function add(list, index, chars, text)
    if not chars then error("The function add cannot act on a nil character.") end
    if list[index] then
        list[index] = list[index] .. chars
    else
        list[index] = chars
    end
    -- Basic string function works here.
    return text:sub(#chars + 1)
end

function export.tag(term, face) return m_script_utils.tag_text(term, lang, sc, face) end

function export.link(term, face, alt, tr) return m_links.full_link({term = term, alt = alt, lang = lang, sc = sc, tr = tr}, face) end

local function linkNoTag(term, alt) return m_links.language_link {term = term, lang = lang, alt = alt} end

-- Convert spacing to combining diacritics, and nonstandard to standard polytonic Greek.
function export.standardDiacritics(text)
    text = decompose(text)

    text = text:gsub(UTF8_char, conversions)

    return text
end

--[=[	This function arranges diacritics in the following order:
			1. macron or breve
			2. breathings or diaeresis
			3. acute, circumflex, or grave
			4. iota subscript
		Used by [[Module:typing-aids]].
		
		Returns an error if a sequence of diacritics contains more than one
		of each category.
]=]
local function reorderDiacriticSequence(diacritics)
    local output = {}
    forEach(diacritics, function(diacritic)
        local index = diacritic_order[diacritic]
        if not output[index] then
            output[index] = diacritic
        else
            -- Place breve after macron.
            if diacritic == breve then index = index + 1 end
            -- The following might have odd results when there
            -- are three or more diacritics.
            table.insert(output, index, diacritic)
            -- [[Special:WhatLinksHere/Template:tracking/grc-utils/too many diacritics]]
            require("debug").track("grc-utils/too many diacritics")
            --[[
				local m_templates = require("grc-utilities/templates")
				error("There are two diacritics, " ..
						m_templates.addDottedCircle(output[index]) .. " and " ..
						m_templates.addDottedCircle(diacritic) ..
						" that belong in the same position. There should be only one."
				)
				--]]
        end
    end)
    return sparseConcat(output)
end

function export.reorderDiacritics(text)
    local d = diacritics

    return (gsub(decompose(text), combining_diacritic .. combining_diacritic .. "+", reorderDiacriticSequence))
end

--[=[
		This breaks a word into meaningful "tokens", which are
		individual letters or diphthongs with their diacritics.
		Used by [[Module:grc-accent]] and [[Module:grc-pronunciation]].
--]=]
local function make_tokens(text)
    local tokens, prev_info = {}, {}
    local token_i, vowel_count = 1, 0 -- Vowel count tracks .
    local prev
    for character in string.gmatch(decompose(text), UTF8_char) do
        local curr_info = info[character]
        -- Split vowels between tokens if not a diphthong.
        if curr_info.vowel then
            vowel_count = vowel_count + 1
            if prev and (not (vowel_count == 2 and curr_info.offglide and prev_info.vowel) -- υυ → υ, υ
            -- ιυ → ι, υ
            or prev_info.offglide and curr_info == upsilon_t or curr_info == prev_info) then
                token_i = token_i + 1
                if prev_info.vowel then vowel_count = 1 end
            elseif vowel_count == 2 then
                vowel_count = 0
            end
            tokens[token_i] = (tokens[token_i] or "") .. character
        elseif curr_info.diacritic then
            vowel_count = 0
            tokens[token_i] = (tokens[token_i] or "") .. character
            if prev_info.diacritic or prev_info.vowel then
                if character == diaeresis then
                    -- Split the diphthong in the current token if a diaeresis was found:
                    -- the first letter, then the second letter plus any diacritics.
                    local previous_vowel, vowel_with_diaeresis = string.match(tokens[token_i], "^(" .. basic_Greek .. ")(" .. basic_Greek .. ".+)")
                    if previous_vowel then
                        tokens[token_i], tokens[token_i + 1] = previous_vowel, vowel_with_diaeresis
                        token_i = token_i + 1
                    else
                        -- The vowel preceding the vowel with the diaeresis will already be
                        -- placed in the previous token if it has a diacritic:
                        -- Περικλῆῐ̈ → Π ε ρ ι κ λ ῆ ῐ̈
                        --[[
						mw.log('Diaeresis was found in ' .. text .. ', but the previous token ' ..
							require("Unicode data").add_dotted_circle(tokens[token_i]) ..
							' couldn’t be split because it does not consist of two Basic Greek characters followed by other characters.')
						--]]
                    end
                end
            elseif prev_info == rho_t then
                if curr_info ~= breathing_t then mw.log(string.format("The character %s in %s should not have the accent %s on it.", prev, text, require("grc-utilities/templates").addDottedCircle(character))) end
            else
                mw.log("The character " .. prev .. " cannot have a diacritic on it.")
            end
        else
            vowel_count = 0
            if prev then token_i = token_i + 1 end
            tokens[token_i] = (tokens[token_i] or "") .. character
        end
        prev = character
        prev_info = curr_info
    end
    return tokens
end

local cache = {}
function export.tokenize(text)
    local decomposed = decompose(text)
    if not cache[decomposed] then cache[decomposed] = make_tokens(text) end
    return cache[decomposed]
end

--[=[	Places diacritics in the following order:
			1. breathings or diaeresis
			2. acute, circumflex, or grave
			3. macron or breve
			4. iota subscript
		Used by [[Module:grc-pronunciation]].		]=]
function export.pronunciationOrder(text)
    text = export.standardDiacritics(text)

    if find(text, groups[1]) then

        text = gsub(text, diacritic .. diacritic .. "+", function(sequence)
            -- Put breathing and diaeresis first, then accents, then macron or breve
            return table.concat {match(sequence, groups[2]) or "", match(sequence, groups[3]) or "", match(sequence, groups[1]) or "", match(sequence, groups[4]) or ""}
        end)

        text = gsub(text, macron, spacing_macron) -- combining to spacing macron
        text = gsub(text, breve, spacing_breve) -- combining to spacing breve
    end

    return toNFC(text)
end

-- Returns a table of any ambiguous vowels in the text, language-tagged.
function export.findAmbig(text, noTag)
    if (not text) or type(text) ~= "string" then error("The input to function findAmbig is nonexistent or not a string") end

    local lengthDiacritic = "[" .. macron .. breve .. circumflex .. subscript .. "]"
    local aiu_diacritic = "^([" .. "αιυ" .. "])(" .. diacritic .. "*)$"

    -- breaks the word into units
    local output, vowels = {}, {}
    for _, token in ipairs(export.tokenize(text)) do
        if not find(token, m_data.consonant) then
            local vowel, diacritics = match(token, aiu_diacritic)

            if vowel and (diacritics == "" or not find(diacritics, lengthDiacritic)) then
                local diacriticked_vowel
                if not noTag then
                    diacriticked_vowel = export.tag(vowel .. diacritics)
                else
                    diacriticked_vowel = vowel
                end

                table.insert(output, diacriticked_vowel)

                -- Lists the vowel letters that are ambiguous, for categorization purposes.
                vowels[mw.ustring.lower(vowel)] = true
            end
        end
    end

    return output, vowels
end

return export
