local export = {}
local Script = {}

function Script:getCode()
	return self._code
end

function Script:getCanonicalName()
	return self._rawData.canonicalName
end

function Script:getOtherNames()
	return self._rawData.otherNames or {}
end

function Script:getParent()
	return self._rawData.parent
end

function Script:getSystems()
	if not self._systemObjects then
		local m_systems = require("Module:writing systems")
		self._systemObjects = {}
		
		for _, sys in ipairs(self._rawData.systems or {}) do
			table.insert(self._systemObjects, m_systems.getByCode(sys))
		end
	end
	
	return self._systemObjects
end

--function Script:getAllNames()
--	return self._rawData.names
--end


function Script:getType()
	return "script"
end


function Script:getCategoryName()
	local name = self._rawData.canonicalName
	
	-- If the name already has "code" or "semaphore" in it, don't add it.
	-- No names contain "script".
	if name:find("[Cc]ode$") or name:find("[Ss]emaphore$") then
		return name
	else
		return name .. " script"
	end
end


function Script:getWikipediaArticle()
	return self._rawData.wikipedia_article or self:getCategoryName()
end


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


function Script:getRawData()
	return self._rawData
end


function Script:toJSON()
	local ret = {
		canonicalName = self:getCanonicalName(),
		categoryName = self:getCategoryName(),
		code = self._code,
		otherNames = self:getOtherNames(),
		type = self:getType(),
		}
	
	return require("Module:JSON").toJSON(ret)
end


Script.__index = Script


function export.makeObject(code, data)
	return data and setmetatable({ _rawData = data, _code = code }, Script) or nil
end


function export.getByCode(code)
	if code == "IPAchar" then
		require("Module:debug").track("IPAchar")
	end
	return export.makeObject(code, mw.loadData("Module:scripts/data")[code])
end

function export.getByCanonicalName(name)
	local code = mw.loadData("Module:scripts/by name")[name]
	
	if not code then
		return nil
	end
	
	return export.makeObject(code, mw.loadData("Module:scripts/data")[code])
end

-- Find the best script to use, based on the characters of a string.
function export.findBestScript(text, lang)
	if not text or not lang or not lang.getScripts then
		return export.getByCode("None")
	end
	
	local scripts = lang:getScripts()
	
	if not scripts[2] then
		return scripts[1]
	end
	
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
	
	if length == 0 then
		return export.getByCode("None")
	end
	
	for i, script in ipairs(scripts) do
		local count = script:countCharacters(text)
		
		if count >= length then
			return script
		end
		
		if count > bestcount then
			bestcount = count
			bestscript = script
		end
	end
	
	if bestscript then
		return bestscript
	end
	
	-- No matching script was found. Return "None".
	return export.getByCode("None")
end

return export