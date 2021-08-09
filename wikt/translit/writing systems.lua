local export = {}

local System = {}

function System:getCode() return self._code end

function System:getCanonicalName() return self._rawData.canonicalName end

function System:getOtherNames() return self._rawData.otherNames or {} end

-- function System:getAllNames()
--	return self._rawData.names
-- end

function System:getType() return "Writing system" end

function System:getCategoryName() return self._rawData.category or mw.getContentLanguage():ucfirst(self:getCanonicalName() .. "s") end

function System:getRawData() return self._rawData end

function System:toJSON()
    local ret = {canonicalName = self:getCanonicalName(), categoryName = self:getCategoryName(), code = self._code, otherNames = self:getOtherNames(), type = self:getType()}

    return require("JSON").toJSON(ret)
end

System.__index = System

function export.makeObject(code, data) return data and setmetatable({_rawData = data, _code = code}, System) or nil end

function export.getByCode(code) return export.makeObject(code, mw.loadData("writing systems/data")[code]) end

return export
