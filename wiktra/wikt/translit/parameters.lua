local export = {}

-- A helper function to escape magic characters in a string
-- Magic characters: ^$()%.[]*+-?
local plain = require("string").pattern_escape

-- A helper function that removes empty numeric indexes in a table,
-- so that the values are tightly packed like in a normal Lua table.
local remove_holes = require("table").compressSparseArray

function export.process(args, params, return_unknown)
    local args_new = {}

    -- Process parameters for specific properties
    local required = {}
    local patterns = {}
    local names_with_equal_sign = {}
    local list_from_index = nil

    for name, param in pairs(params) do
        if param.required then
            if param.alias_of then require("debug").track("parameters/required alias") end
            required[name] = true
        end

        if param.list then
            local key = name
            if type(name) == "string" then key = string.gsub(name, "=", "") end
            if param.default ~= nil then
                args_new[key] = {param.default, maxindex = 1}
            else
                args_new[key] = {maxindex = 0}
            end

            if type(param.list) == "string" then
                -- If the list property is a string, then it represents the name
                -- to be used as the prefix for list items. This is for use with lists
                -- where the first item is a numbered parameter and the
                -- subsequent ones are named, such as 1, pl2, pl3.
                if string.find(param.list, "=") then
                    patterns["^" .. string.gsub(plain(param.list), "=", "(%%d+)") .. "$"] = name
                else
                    patterns["^" .. plain(param.list) .. "(%d+)$"] = name
                end
            elseif type(name) == "number" then
                -- If the name is a number, then all indexed parameters from
                -- this number onwards go in the list.
                list_from_index = name
            else
                if string.find(name, "=") then
                    patterns["^" .. string.gsub(plain(name), "=", "(%%d+)") .. "$"] = string.gsub(name, "=", "")
                else
                    patterns["^" .. plain(name) .. "(%d+)$"] = name
                end
            end

            if string.find(name, "=") then
                -- DO NOT SIDE-EFFECT A TABLE WHILE ITERATING OVER IT.
                -- Some elements may be skipped or processed twice if you do.
                -- Instead, track the changes we want to make to `params`, and
                -- do them after the iteration over `params` is done.
                table.insert(names_with_equal_sign, name)
            end
        elseif param.default ~= nil then
            args_new[name] = param.default
        end
    end

    -- Process required changes to `params`
    for _, name in ipairs(names_with_equal_sign) do
        require("debug").track("parameters/name with equals")
        params[string.gsub(name, "=", "")] = params[name]
        params[name] = nil
    end

    -- Process the arguments
    local args_unknown = {}

    for name, val in pairs(args) do
        local index = nil

        if type(name) == "number" then
            if list_from_index ~= nil and name >= list_from_index then
                index = name - list_from_index + 1
                name = list_from_index
            end
        else
            -- Does this argument name match a pattern?
            for pattern, pname in pairs(patterns) do
                index = mw.ustring.match(name, pattern)

                -- It matches, so store the parameter name and the
                -- numeric index extracted from the argument name.
                if index then
                    index = tonumber(index)
                    name = pname
                    break
                end
            end
        end

        local param = params[name]

        -- If a parameter without the trailing index was found, and
        -- require_index is set on the param, set the param to nil to treat it
        -- as if it isn't recognized.
        if not index and param and param.require_index then param = nil end

        -- If no index was found, use 1 as the default index.
        -- This makes list parameters like g, g2, g3 put g at index 1.
        index = index or 1

        -- If the argument is not in the list of parameters, trigger an error.
        -- return_unknown suppresses the error, and stores it in a separate list instead.
        if not param then
            if return_unknown then
                args_unknown[name] = val
            else
                error("The parameter \"" .. name .. "\" is not used by this template.", 2)
            end
        else
            -- Remove leading and trailing whitespace unless allow_whitespace is true.
            if not param.allow_whitespace then val = mw.text.trim(val) end

            -- Empty string is equivalent to nil unless allow_empty is true.
            if val == "" and not param.allow_empty then val = nil end

            -- Convert to proper type if necessary.
            if param.type == "boolean" then
                val = not (not val or val == "" or val == "0" or val == "no" or val == "n" or val == "false")
            elseif param.type == "number" then
                val = tonumber(val)
            elseif param.type then
                require("debug").track {"parameters/unrecognized type", "parameters/unrecognized type/" .. tostring(param.type)}
            end

            -- Can't use "if val" alone, because val may be a boolean false.
            if val ~= nil then
                -- Mark it as no longer required, as it is present.
                required[param.alias_of or name] = nil

                -- Store the argument value.
                if param.list then
                    -- If the parameter is an alias of another, store it as the original,
                    -- but avoid overwriting it; the original takes precedence.
                    if not param.alias_of then
                        args_new[name][index] = val

                        -- Store the highest index we find.
                        args_new[name].maxindex = math.max(index, args_new[name].maxindex)
                    elseif args[param.alias_of] == nil then
                        if params[param.alias_of] and params[param.alias_of].list then
                            args_new[param.alias_of][index] = val

                            -- Store the highest index we find.
                            args_new[param.alias_of].maxindex = math.max(index, args_new[param.alias_of].maxindex)
                        else
                            args_new[param.alias_of] = val
                        end
                    end
                else
                    -- If the parameter is an alias of another, store it as the original,
                    -- but avoid overwriting it; the original takes precedence.
                    if not param.alias_of then
                        args_new[name] = val
                    elseif args[param.alias_of] == nil then
                        if params[param.alias_of] and params[param.alias_of].list then
                            args_new[param.alias_of][1] = val

                            -- Store the highest index we find.
                            args_new[param.alias_of].maxindex = math.max(1, args_new[param.alias_of].maxindex)
                        else
                            args_new[param.alias_of] = val
                        end
                    end
                end
            end
        end
    end

    -- The required table should now be empty.
    -- If any entry remains, trigger an error, unless we're in the template namespace.
    if mw.title.getCurrentTitle().nsText ~= "Template" then
        local list = {}
        for name, param in pairs(required) do table.insert(list, name) end

        local count = #list
        if count == 1 then
            error("The parameter \"" .. list[1] .. "\" is required.", 2)
        elseif count == 2 then
            error("The parameters \"" .. table.concat(list, "\" and \"") .. "\" are required.", 2)
        elseif count > 2 then
            error("The parameters \"" .. mw.text.listToText(list, "\", \"", "\", and \"") .. "\" are required.", 2)
        end
    end

    -- Remove holes in any list parameters if needed.
    for name, val in pairs(args_new) do if type(val) == "table" and not params[name].allow_holes then args_new[name] = remove_holes(val) end end

    if return_unknown then
        return args_new, args_unknown
    else
        return args_new
    end
end

return export
