local export = {}

local EtymologyLanguage = {}


function EtymologyLanguage:getCode()
	return self._code
end


function EtymologyLanguage:getCanonicalName()
	return self._rawData.canonicalName
end


function EtymologyLanguage:getOtherNames()
	return self._rawData.otherNames or {}
end


--function EtymologyLanguage:getAllNames()
--	return self._rawData.names
--end


function EtymologyLanguage:getCategoryName()
	return self:getCanonicalName()
end


function EtymologyLanguage:getType()
	return "etymology language"
end


function EtymologyLanguage:getParentCode()
	return self._rawData.parent
end


function EtymologyLanguage:getAncestors()
	if not self._ancestorObjects then
		self._ancestorObjects = {}
		
		for _, ancestor in ipairs(self._rawData.ancestors or {}) do
			table.insert(self._ancestorObjects, export.getByCode(ancestor) or require("Module:languages").getByCode(ancestor))
		end
	end
	
	return self._ancestorObjects
end

function EtymologyLanguage:getWikidataItem()
	return self._rawData.wikidata_item
end

function EtymologyLanguage:getWikipediaArticle()
	return self._rawData.wikipedia_article or 
		(self:getWikidataItem() and mw.wikibase and
	     mw.wikibase.sitelink(self:getWikidataItem(), 'enwiki')) or
	     self._rawData.canonicalName
end

function EtymologyLanguage:makeWikipediaLink()
	return "[[w:" .. self:getWikipediaArticle() .. "|" .. self:getCanonicalName() .. "]]"
end


function EtymologyLanguage:toJSON()
	local ret = {
		canonicalName = self:getCanonicalName(),
		categoryName = self:getCategoryName(),
		code = self._code,
		otherNames = self:getOtherNames(),
		parent = self._rawData.parent,
		type = self:getType(),
		}
	
	return require("Module:JSON").toJSON(ret)
end


function EtymologyLanguage:getRawData()
	return self._rawData
end


EtymologyLanguage.__index = EtymologyLanguage


function export.makeObject(code, data)
	return data and setmetatable({ _rawData = data, _code = code }, EtymologyLanguage) or nil
end


function export.getByCode(code)
	return export.makeObject(code, mw.loadData("Module:etymology languages/data")[code])
end


function export.getByCanonicalName(name)
	local code = mw.loadData("Module:etymology languages/by name")[name]
	
	if not code then
		return nil
	end
	
	return export.makeObject(code, mw.loadData("Module:etymology languages/data")[code])
end


return export