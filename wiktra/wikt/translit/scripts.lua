local export = {}
local Script = {}

function Script:getCode() return self._code end

function Script:getCanonicalName() return self._rawData.canonicalName end

function Script:getDisplayForm() return self:getCategoryName("nocap") end

function Script:getOtherNames(onlyOtherNames) return require("language-like").getOtherNames(self, onlyOtherNames) end

function Script:getAliases() return self._rawData.aliases or {} end

function Script:getVarieties(flatten) return require("language-like").getVarieties(self, flatten) end

function Script:getParent() return self._rawData.parent end

function Script:getSystems()
    if not self._systemObjects then
        local m_systems = require("writing systems")
        self._systemObjects = {}

        for _, sys in ipairs(self._rawData.systems or {}) do table.insert(self._systemObjects, m_systems.getByCode(sys)) end
    end

    return self._systemObjects
end

-- function Script:getAllNames()
--	return self._rawData.names
-- end

function Script:getType() return "script" end

function Script:getCategoryName(nocap)
    local name = self._rawData.canonicalName

    -- If the name already has "code" or "semaphore" in it, don't add it.
    -- No names contain "script".
    if not name:find("[Cc]ode$") and not name:find("[Ss]emaphore$") then name = name .. " script" end
    if not nocap then name = mw.getContentLanguage():ucfirst(name) end
    return name
end

function Script:makeCategoryLink() return "[[:Category:" .. self:getCategoryName() .. "|" .. self:getDisplayForm() .. "]]" end

function Script:getWikipediaArticle() return self._rawData.wikipedia_article or self:getCategoryName() end

function Script:getCharacters()
    if self._rawData.characters then
        return self._rawData.characters
    else
        return nil
    end
end

function Script:countCharacters(text)
    if not self._rawData.characters then
        return 0
    else
        local _, num = mw.ustring.gsub(text, "[" .. self._rawData.characters .. "]", "")
        return num
    end
end

function Script:getDirection()
    local direction = self._rawData.direction
    if not direction then
        return nil
    else
        return direction
    end
end

function Script:getRawData() return self._rawData end

function Script:toJSON()
    local ret = {canonicalName = self:getCanonicalName(), categoryName = self:getCategoryName("nocap"), code = self._code, otherNames = self:getOtherNames(true), aliases = self:getAliases(), varieties = self:getVarieties(), type = self:getType(), direction = self:getDirection(), characters = self:getCharacters(), parent = self:getParent(), systems = self._rawData.systems or {}, wikipediaArticle = self._rawData.wikipedia_article}

    return require("JSON").toJSON(ret)
end

Script.__index = Script

function export.makeObject(code, data) return data and setmetatable({_rawData = data, _code = code}, Script) or nil end

function export.getByCode(code, paramForError, disallowNil)
    if code == nil and not disallowNil then return nil end
    if code == "IPAchar" then require("debug").track("IPAchar") end
    local retval = export.makeObject(code, mw.loadData("scripts/data")[code])
    if not retval and paramForError then require("languages").err(code, paramForError, "script code", nil, "not real lang") end
    return retval
end

function export.getByCanonicalName(name)
    local code = mw.loadData("scripts/by name")[name]

    if not code then return nil end

    return export.makeObject(code, mw.loadData("scripts/data")[code])
end

-- Find the best script to use, based on the characters of a string.
-- If forceDetect is set, run the detection algorithm even if there's only one
-- possible script; in that case, if the text isn't in the script, the return
-- value will be None.
function export.findBestScript(text, lang, forceDetect)
    if not text or not lang or not lang.getScripts then return export.getByCode("None") end

    local scripts = lang:getScripts()

    if not scripts[2] and not forceDetect then return scripts[1] end

    --[=[
		Remove any HTML entities; catfix function in [[Module:utilities]]
		adds tagging to a no-break space (&nbsp;), which contains Latin characters;
		hence Latin was returned as the script if "Latn" is one of the language's scripts.
	]=]
    text = string.gsub(text, "&[a-zA-Z0-9]+;", "")

    -- Try to match every script against the text,
    -- and return the one with the most matching characters.
    local bestcount = 0
    local bestscript = nil

    -- Get length of text minus any spacing or punctuation characters.
    -- Counting instances of UTF-8 character pattern is faster than mw.ustring.len.
    local _, length = string.gsub(mw.ustring.gsub(text, "[%s%p]+", ""), "[\1-\127\194-\244][\128-\191]*", "")

    if length == 0 then return export.getByCode("None") end

    for i, script in ipairs(scripts) do
        local count = script:countCharacters(text)

        if count >= length then return script end

        if count > bestcount then
            bestcount = count
            bestscript = script
        end
    end

    if bestscript then return bestscript end

    -- No matching script was found. Return "None".
    return export.getByCode("None")
end

-- Copied from [[Module:Unicode data]].
local floor = math.floor
local function binaryRangeSearch(codepoint, ranges)
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

-- Copied from [[Module:Unicode data]].
local function linearRangeSearch(codepoint, ranges)
    for i, range in ipairs(ranges) do
        if codepoint < range[1] then
            break
        elseif codepoint <= range[2] then
            return range
        end
    end
end

local function compareRanges(range1, range2) return range1[1] < range2[1] end

-- Save previously used codepoint ranges in case another character is in the
-- same range.
local rangesCache = {}

--[=[
	Takes a codepoint or a character and finds the script code (if any) that is
	appropriate for it based on the codepoint, using the data module
	[[Module:scripts/recognition data]]. The data module was generated from the
	patterns in [[Module:scripts/data]] using [[Module:User:Erutuon/script recognition]].

	Converts the character to a codepoint. Returns a script code if the codepoint
	is in the list of individual characters, or if it is in one of the defined
	ranges in the 4096-character block that it belongs to, else returns "None".
]=]
local charToScriptData
function export.charToScript(char)
    charToScriptData = charToScriptData or mw.loadData("scripts/recognition data")
    local t = type(char)
    local codepoint
    if t == "string" then
        local etc
        codepoint, etc = mw.ustring.codepoint(char, 1, 2)
        if etc then error("bad argument #1 to 'charToScript' (expected a single character)") end
    elseif t == "number" then
        codepoint = char
    else
        error(("bad argument #1 to 'charToScript' (expected string or a number, got %s)"):format(t))
    end

    local individualMatch = charToScriptData.individual[codepoint]
    if individualMatch then
        return individualMatch
    else
        local range
        if rangesCache[1] then
            range = linearRangeSearch(codepoint, rangesCache)
            if range then return range[3] end
        end

        local index = floor(codepoint / 0x1000)

        range = linearRangeSearch(index, charToScriptData.blocks)
        if not range and charToScriptData[index] then
            range = binaryRangeSearch(codepoint, charToScriptData[index])
            if range then
                table.insert(rangesCache, range)
                table.sort(rangesCache, compareRanges)
            end
        end

        return range and range[3] or "None"
    end
end

function export.findBestScriptWithoutLang(text)
    local scripts = {}
    for character in text:gmatch("[%z\1-\127\194-\244][\128-\191]*") do
        local script = export.charToScript(character)
        scripts[script] = (scripts[script] or 0) + 1
    end

    local bestScript
    local greatestCount = 0
    for script, count in pairs(scripts) do
        if count > greatestCount then
            bestScript = script
            greatestCount = count
        end
    end

    return bestScript
end

return export
