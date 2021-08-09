local export = {}

-- Implementation of getOtherNames() for languages, etymology languages,
-- families and scripts. If `onlyOtherNames` is passed in, only return
-- the names in the `otherNames` field, otherwise combine `otherNames`,
-- `aliases` and `varieties`.
function export.getOtherNames(self, onlyOtherNames)
    local data
    if self._extraData then
        data = self._extraData
    else
        data = self._rawData
    end
    if onlyOtherNames then return data.otherNames or {} end
    -- Combine otherNames, aliases and varieties. First try to optimize and not create any
    -- new memory. This is possible if exactly one of the three exist, and if it's `varieties`,
    -- there are no nested lists in `varieties`.
    if data.otherNames and not data.aliases and not data.varieties then
        return data.otherNames
    elseif data.aliases and not data.otherNames and not data.varieties then
        return data.aliases
    elseif data.varieties and not data.otherNames and not data.aliases then
        local saw_table = false
        for _, name in ipairs(data.varieties) do
            if type(name) == "table" then
                saw_table = true
                break
            end
        end
        if not saw_table then return data.varieties end
    end

    -- Have to do it the "hard way".
    local ret = {}
    if data.otherNames then for _, name in ipairs(data.otherNames) do table.insert(ret, name) end end
    if data.aliases then for _, name in ipairs(data.aliases) do table.insert(ret, name) end end
    if data.varieties then
        for _, name in ipairs(data.varieties) do
            if type(name) == "table" then
                for _, n in ipairs(name) do table.insert(ret, n) end
            else
                table.insert(ret, name)
            end
        end
    end
    return ret
end

-- Implementation of getVarieties() for languages, etymology languages,
-- families and scripts. If `flatten` is passed in, flatten down to a
-- list of stings; otherwise, keep the structure.
function export.getVarieties(self, flatten)
    local data
    if self._extraData then
        data = self._extraData
    else
        data = self._rawData
    end
    if data.varieties then
        -- If flattening not requested, just return them.
        if not flatten then return data.varieties end
        -- Check if no nested table; if so, just return the result.
        local saw_table = false
        for _, name in ipairs(data.varieties) do
            if type(name) == "table" then
                saw_table = true
                break
            end
        end
        if not saw_table then return data.varieties end
        -- At this point, we need to flatten the varieties.
        local ret = {}
        for _, name in ipairs(data.varieties) do
            if type(name) == "table" then
                for _, n in ipairs(name) do table.insert(ret, n) end
            else
                table.insert(ret, name)
            end
        end
        return ret
    else
        return {}
    end
end

-- Implementation of template-callable getByCode() function for languages,
-- etymology languages, families and scripts. `item` is the language,
-- family or script in question; `args` is the arguments passed in by the
-- module invocation; `extra_processing`, if specified, is a function of
-- one argument (the requested property) and should return the value to
-- be returned to the caller, or nil if the property isn't recognized.
-- `extra_processing` is called after special-cased properties are handled
-- and before general-purpose processing code that works for all string
-- properties.
function export.templateGetByCode(item, args, extra_processing)
    -- The item that the caller wanted to look up
    local itemname = args[2] or error("Function to call (parameter 2) has not been specified.")
    local list
    if itemname == "getOtherNames" then
        list = item:getOtherNames()
    elseif itemname == "getOnlyOtherNames" then
        list = item:getOtherNames(true)
    elseif itemname == "getAliases" then
        list = item:getAliases()
    elseif itemname == "getVarieties" then
        list = item:getVarieties(true)
    end
    if list then
        local index = args[3];
        if index == "" then index = nil end
        index = tonumber(index or error("Numeric index of the desired item in the list (parameter 3) has not been specified."))
        return list[index] or ""
    end

    if itemname == "getFamily" and item.getFamily then return item:getFamily():getCode() end

    if extra_processing then
        local retval = extra_processing(itemname)
        if retval then return retval end
    end

    if item[itemname] then
        local ret = item[itemname](item)

        if type(ret) == "string" then
            return ret
        else
            error("The function \"" .. itemname .. "\" did not return a string value.")
        end
    end

    error("Requested invalid item name \"" .. itemname .. "\".")
end

return export
