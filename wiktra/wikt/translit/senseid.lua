local export = {}

-- Extract a Wikidata id from a sense id
local function Wikidata_id(id) return mw.ustring.match(id, "Q%d+") end

local function Wikidata_entity_is_any_of(id, ids)
    if not mw.wikibase then return false end
    -- P31: instance of
    for _, val in ipairs(mw.wikibase.getBestStatements(id, "P31")) do for _, sid in ipairs(ids) do if val["mainsnak"]["datavalue"] and val["mainsnak"]["datavalue"]["type"] == "wikibase-entityid" and val["mainsnak"]["datavalue"]["value"]["id"] == sid then return true end end end

    return false
end

local function Wikidata_entity_continents(id)
    if not mw.wikibase then return nil end
    local ret = {}

    local continent_names = {["Q15"] = "Africa", ["Q18"] = "South America", ["Q46"] = "Europe", ["Q48"] = "Asia", ["Q49"] = "North America", ["Q538"] = "Oceania", ["Q27611"] = "North America"}

    -- P30: continent
    for _, val in ipairs(mw.wikibase.getBestStatements(id, "P30")) do if val["mainsnak"]["datavalue"]["type"] == "wikibase-entityid" then for cid, name in pairs(continent_names) do if val["mainsnak"]["datavalue"]["value"]["id"] == cid then table.insert(ret, name) end end end end

    if #ret > 0 then
        return ret
    else
        return nil
    end
end

function export.anchor(lang, id)
    if not (type(id) == "string" or type(id) == "number") then error("The second argument to senseid should be a string or a number.") end

    return lang:getCanonicalName() .. ":_" .. mw.uri.encode(id, "WIKI")
end

function senseid_wikidata_track(lang, id)
    if Wikidata_id(id) then
        --[=[
		[[Special:WhatLinksHere/Template:tracking/senseid/Wikidata]]
		]=]
        require("debug").track("senseid/Wikidata")

        local tracking = {}

        -- Q30014: outer planet of the Solar System
        -- Q3504248: inner planet of the Solar System
        -- Q17362350: planet of the Solar System
        if Wikidata_entity_is_any_of(id, {"Q30014", "Q3504248", "Q17362350"}) then table.insert(tracking, "senseid/Wikidata/planet") end

        -- Q2199: dwarf planet
        if Wikidata_entity_is_any_of(id, {"Q2199"}) then table.insert(tracking, "senseid/Wikidata/dwarf planet") end

        -- Q5107: continent
        -- Q55833: supercontinent
        if Wikidata_entity_is_any_of(id, {"Q5107", "Q55833"}) then table.insert(tracking, "senseid/Wikidata/continent") end

        -- Q6256: country
        -- Q3024240: former country
        if Wikidata_entity_is_any_of(id, {"Q6256", "Q3024240"}) then
            table.insert(tracking, "senseid/Wikidata/country")

            local continents = Wikidata_entity_continents(id)

            if continents then for _, name in ipairs(continents) do table.insert(tracking, "senseid/Wikidata/country/" .. name) end end
        end

        -- Q82794: geographic region
        if Wikidata_entity_is_any_of(id, {"Q82794"}) then table.insert(tracking, "senseid/Wikidata/region") end

        -- Q23442: island
        if Wikidata_entity_is_any_of(id, {"Q23442"}) then table.insert(tracking, "senseid/Wikidata/island") end

        -- Q4022: river
        if Wikidata_entity_is_any_of(id, {"Q4022"}) then table.insert(tracking, "senseid/Wikidata/river") end

        -- Q515: city
        if Wikidata_entity_is_any_of(id, {"Q515"}) then table.insert(tracking, "senseid/Wikidata/city") end

        -- Q34770: language
        -- Q33742: natural language
        -- Q33215: constructed language
        if Wikidata_entity_is_any_of(id, {"Q34770", "Q33742", "Q33215"}) then table.insert(tracking, "senseid/Wikidata/language") end

        -- Q9779: alphabet
        -- Q335806: abugida
        if Wikidata_entity_is_any_of(id, {"Q9779", "Q335806"}) then table.insert(tracking, "senseid/Wikidata/writing system") end

        -- Q11344: chemical element
        if Wikidata_entity_is_any_of(id, {"Q11344"}) then table.insert(tracking, "senseid/Wikidata/chemical element") end

        -- Q16521: taxon
        if Wikidata_entity_is_any_of(id, {"Q16521"}) then table.insert(tracking, "senseid/Wikidata/taxon") end

        -- Q9415: emotion
        if Wikidata_entity_is_any_of(id, {"Q9415"}) then table.insert(tracking, "senseid/Wikidata/emotion") end

        -- Q11688446: Roman deity
        if Wikidata_entity_is_any_of(id, {"Q11688446"}) then table.insert(tracking, "senseid/Wikidata/Roman deity") end

        if #tracking > 0 then
            require("debug").track(tracking)
        else
            require("debug").track("senseid/Wikidata/nothing")
        end
    end
end

function export.senseid(lang, id, tag_name)
    -- Track which entries use Wikidata ids
    senseid_wikidata_track(lang, id)
    -- The following tag is opened but never closed, where is it supposed to be closed?
    --         with <li> it doesn't matter, as it is closed automatically.
    --         with <p> it is a problem
    return "<" .. tag_name .. " class=\"senseid\" id=\"" .. export.anchor(lang, id) .. "\">"
end

function export.etymid(lang, id)
    -- Track which entries use Wikidata ids
    senseid_wikidata_track(lang, id)
    return "<span class=\"etymid\" id=\"" .. export.anchor(lang, id) .. "\"></span>"
end

return export
