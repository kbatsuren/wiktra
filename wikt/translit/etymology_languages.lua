local export = {}

local EtymologyLanguage = {}

function EtymologyLanguage:getCode() return self._code end

function EtymologyLanguage:getCanonicalName() return self._rawData.canonicalName end

function EtymologyLanguage:getDisplayForm() return self:getCanonicalName() end

function EtymologyLanguage:getOtherNames(onlyOtherNames) return require("language-like").getOtherNames(self, onlyOtherNames) end

function EtymologyLanguage:getAliases() return self._rawData.aliases or {} end

function EtymologyLanguage:getVarieties(flatten) return require("language-like").getVarieties(self, flatten) end

-- function EtymologyLanguage:getAllNames()
--	return self._rawData.names
-- end

function EtymologyLanguage:getCategoryName() return self:getCanonicalName() end

function EtymologyLanguage:makeCategoryLink() return "[[:Category:" .. self:getCategoryName() .. "|" .. self:getCanonicalName() .. "]]" end

function EtymologyLanguage:getType() return "etymology language" end

function EtymologyLanguage:getParentCode() return self._rawData.parent end

function EtymologyLanguage:getAncestors()
    if not self._ancestorObjects then
        self._ancestorObjects = {}

        for _, ancestor in ipairs(self._rawData.ancestors or {}) do table.insert(self._ancestorObjects, export.getByCode(ancestor) or require("languages").getByCode(ancestor)) end
    end

    return self._ancestorObjects
end

function EtymologyLanguage:getWikidataItem()
    local item = self._rawData.wikidata_item

    if type(item) == "number" then
        return "Q" .. item
    else
        return item
    end
end

function EtymologyLanguage:getWikipediaArticle() return self._rawData.wikipedia_article or (self:getWikidataItem() and mw.wikibase and mw.wikibase.sitelink(self:getWikidataItem(), "enwiki")) or self._rawData.canonicalName end

function EtymologyLanguage:makeWikipediaLink() return "[[w:" .. self:getWikipediaArticle() .. "|" .. self:getCanonicalName() .. "]]" end

function EtymologyLanguage:toJSON()
    local ret = {canonicalName = self:getCanonicalName(), categoryName = self:getCategoryName(), code = self._code, otherNames = self:getOtherNames(true), aliases = self:getAliases(), varieties = self:getVarieties(), parent = self._rawData.parent, type = self:getType()}

    return require("JSON").toJSON(ret)
end

function EtymologyLanguage:getRawData() return self._rawData end

EtymologyLanguage.__index = EtymologyLanguage

function export.makeObject(code, data) return data and setmetatable({_rawData = data, _code = code}, EtymologyLanguage) or nil end

function export.getByCode(code) return export.makeObject(code, mw.loadData("etymology languages/data")[code]) end

function export.getByCanonicalName(name)
    local code = mw.loadData("etymology languages/by name")[name]

    if not code then return nil end

    return export.makeObject(code, mw.loadData("etymology languages/data")[code])
end

return export
