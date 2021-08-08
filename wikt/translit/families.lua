local export = {}

local Family = {}

function Family:getCode() return self._code end

function Family:getCanonicalName() return self._rawData.canonicalName end

function Family:getDisplayForm() return self:getCategoryName() end

function Family:getOtherNames(onlyOtherNames) return require("language-like").getOtherNames(self, onlyOtherNames) end

function Family:getAliases() return self._rawData.aliases or {} end

function Family:getVarieties(flatten) return require("language-like").getVarieties(self, flatten) end

-- function Family:getAllNames()
--	return self._rawData.names
-- end

function Family:getType() return "family" end

function Family:getFamily()
    if self._rawData.family and not self._familyObject then self._familyObject = export.getByCode(self._rawData.family) end

    return self._familyObject
end

function Family:getProtoLanguage()
    if not self._protoLanguage then self._protoLanguage = require("languages").getByCode(self._rawData.protoLanguage or self._code .. "-pro") end

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

function Family:makeCategoryLink() return "[[:Category:" .. self:getCategoryName() .. "|" .. self:getCategoryName() .. "]]" end

function Family:getWikidataItem()
    local item = self._rawData.wikidata_item

    if type(item) == "number" then
        return "Q" .. item
    else
        return item
    end
end

function Family:getWikipediaArticle() return (self:getWikidataItem() and mw.wikibase and mw.wikibase.sitelink(self:getWikidataItem(), "enwiki")) or self:getCategoryName() end

function Family:makeWikipediaLink() return "[[w:" .. self:getWikipediaArticle() .. "|" .. self:getCanonicalName() .. "]]" end

function Family:toJSON()
    local ret = {canonicalName = self:getCanonicalName(), categoryName = self:getCategoryName(), code = self._code, family = self._rawData.family, protoLanguage = self._rawData.protoLanguage, otherNames = self:getOtherNames(true), aliases = self:getAliases(), varieties = self:getVarieties(), type = self:getType(), wikidataItem = self:getWikidataItem()}

    return require("JSON").toJSON(ret)
end

function Family:getRawData() return self._rawData end

Family.__index = Family

function export.makeObject(code, data) return data and setmetatable({_rawData = data, _code = code}, Family) or nil end

function export.getByCode(code)
    if code == "kdo" then require("debug").track("Kordofanian") end

    return export.makeObject(code, mw.loadData("families/data")[code])
end

function export.getByCanonicalName(name)
    local code = mw.loadData("families/by name")[name]

    if not code then return nil end

    return export.makeObject(code, mw.loadData("families/data")[code])
end

return export
