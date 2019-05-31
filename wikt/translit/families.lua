--[[This module is used to retrieve and manage Wiktionary's various language families and the information associated with them. See Wiktionary:Families for more information.

This module provides access to other modules. To access the information from within a template, see Module:families/templates.

The information itself is stored in Module:families/data. This module should not be used directly by any other module, the data should only be accessed through the functions provided by Module:families.]]
--[[
Finding and retrieving families
The module exports a number of functions that are used to find families.

getByCode
getByCode(code)

Finds the family whose code matches the one provided. If it exists, it returns a Family object representing the family. Otherwise, it returns nil.

getByCanonicalName
getByCanonicalName(name)

Looks for the family whose canonical name (the name used to represent that language on Wiktionary) matches the one provided. If it exists, it returns a Family object representing the family. Otherwise, it returns nil. The canonical name of families should always be unique (it is an error for two families on Wiktionary to share the same canonical name), so this is guaranteed to give at most one result.

Family objects
A Family object is returned from one of the functions above. It is a Lua representation of a family and the data associated with it. It has a number of methods that can be called on it, using the : syntax. For example:

local m_families = require("Module:families")
local fam = m_families.getByCode("ine")
local name = fam:getCanonicalName()
-- "name" will now be "Indo-European"
Family:getCode
:getCode()

Returns the family code of the family. Example: "ine" for the Indo-European languages.

Family:getCanonicalName
:getCanonicalName()

Returns the canonical name of the family. This is the name used to represent that language family on Wiktionary, and is guaranteed to be unique to that family alone. Example: "Indo-European" for the Indo-European languages.

Family:getAllNames
:getAllNames()

Returns a table of all names that the family is known by, including the canonical name. The names are not guaranteed to be unique, sometimes more than one family is known by the same name. Example: {"Slavic", "Slavonic"} for the Slavic languages.

Family:getFamily
:getFamily()

Returns a Family object for the parent family that the family is a part of.

Family:getProtoLanguage
:getProtoLanguage()

Returns a Language object (see Module:languages) for the proto-language of this family, if one exists.

Family:getCategoryName
:getCategoryName()

Returns the name of the main category of that family. Example: "Germanic languages" for the Germanic languages, whose category is at Category:Germanic languages.

Family:getWikidataItem
:getWikidataItem()

Returns the Wikidata item of that family.

Family:getWikipediaArticle
:getWikipediaArticle()

Returns the Wikipedia article of that family, usually derived from :getWikidataItem().
]]
local export = {}

local Family = {}


function Family:getCode()
	return self._code
end


function Family:getCanonicalName()
	return self._rawData.canonicalName
end


--function Family:getAllNames()
--	return self._rawData.names
--end


function Family:getOtherNames()
	return self._rawData.otherNames or {}
end


function Family:getType()
	return "family"
end


function Family:getFamily()
	if self._rawData.family and not self._familyObject then
		self._familyObject = export.getByCode(self._rawData.family)
	end
	
	return self._familyObject
end


function Family:getProtoLanguage()
	if not self._protoLanguage then
		self._protoLanguage = require("Module:languages").getByCode(self._rawData.protoLanguage or self._code .. "-pro")
	end
	
	return self._protoLanguage
end


function Family:getCategoryName()
	local name = self._rawData.canonicalName
	
	-- If the name already has "languages" in it, don't add it.
	if name:find("[Ll]anguages$") then
		return name
	else
		return name .. " languages"
	end
end

function Family:getWikidataItem()
	return self._rawData.wikidata_item
end

function Family:getWikipediaArticle()
	return (self:getWikidataItem() and mw.wikibase and mw.wikibase.sitelink(self:getWikidataItem(), 'enwiki')) or
		self:getCategoryName()
end
	
function Family:makeWikipediaLink()
	return "[[w:" .. self:getWikipediaArticle() .. "|" .. self:getCanonicalName() .. "]]"
end


function Family:toJSON()
	local ret = {
		canonicalName = self:getCanonicalName(),
		categoryName = self:getCategoryName(),
		code = self._code,
		family = self._rawData.family,
		otherNames = self:getOtherNames(),
		type = self:getType(),
		wikidataItem = self:getWikidataItem(),
		}
	
	return require("Module:JSON").toJSON(ret)
end


function Family:getRawData()
	return self._rawData
end


Family.__index = Family


function export.makeObject(code, data)
	return data and setmetatable({ _rawData = data, _code = code }, Family) or nil
end


function export.getByCode(code)
	if code == 'kdo' then
		require('Module:debug').track('Kordofanian')
	end
	
	return export.makeObject(code, mw.loadData("Module:families/data")[code])
end

function export.getByCanonicalName(name)
	local code = mw.loadData("Module:families/by name")[name]
	
	if not code then
		return nil
	end
	
	return export.makeObject(code, mw.loadData("Module:families/data")[code])
end

return export