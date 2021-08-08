local export = {}

local namespace = mw.title.getCurrentTitle().nsText

local substring = mw.ustring.sub

local function log(...) if namespace == "Module" then mw.log(...) end end

--[[
	The number of characters or ideographic sequences that must follow each
	ideographic description character.
]]
local IDchars = {
    ["⿰"] = 2,
    ["⿱"] = 2,
    ["⿲"] = 3,
    ["⿳"] = 3,
    ["⿴"] = 2,
    ["⿵"] = 2,
    ["⿶"] = 2,
    ["⿷"] = 2,
    ["⿸"] = 2,
    ["⿹"] = 2,
    ["⿺"] = 2,
    ["⿻"] = 2

    --[[
	-- in future perhaps: https://www.unicode.org/L2/L2018/18012-irgn2273-four-new-idcs.pdf
	[mw.ustring.char(0x2FFC)] = 2,
	[mw.ustring.char(0x2FFD)] = 2,
	[mw.ustring.char(0x2FFE)] = 1,
	[mw.ustring.char(0x2FFF)] = 1,
	--]]
}

--[[
	Returns the index in the string where the ideographic description sequence
	(IDS) ends, or the index of the end of the string. Iterates whenever
	another ideographic description character (IDC) is found.
]]
local function findEndOfIDS(text, IDchar, i)
    if not (text and IDchar and i) then return nil end

    local j = i
    local component = 1

    -- Number of components expected after current IDC.
    local components = IDchars[IDchar]

    while component <= components do
        j = j + 1

        local char = substring(text, j, j)

        if char == "" then
            break
        elseif IDchars[char] then
            j = findEndOfIDS(text, char, j)
        end

        component = component + 1
    end

    --[[
		If the expected number of components has been found,
		return the current index in the text.
	]]
    if component - components == 1 then
        return j
    else
        return nil
    end
end

local function getFromModule(codepoint, start, returnModule)
    --[=[
		The sortkey modules handle two sets of codepoints.
		The first set runs from [[Module:zh-sortkey/data/001]]
		to [[Module:zh-sortkey/data/056]], then there is a gap
		of 90134 codepoints. The second set runs from
		[[Module:zh-sortkey/data/057]] to
		[[Module:zh-sortkey/data/177]].
	]=]
    local moduleStart = {[0x3400] = 1, [0x20000] = 57}

    local moduleName = string.format("Module:zh-sortkey/data/%03d", (codepoint - start) / 500 + moduleStart[start])
    --	log(codepoint .. ": data module: " .. moduleName)

    if returnModule then
        return moduleName
    else
        local success, data = pcall(mw.loadData, moduleName)

        if success then
            --		log("success! ... " .. codepoint .. ": " .. tostring(data[codepoint]))
            return data[codepoint]
        else
            --		log("failure: " .. codepoint .. " (" .. mw.ustring.char(codepoint) .. ")")
            return nil
        end
    end
end

function export.getData(char, returnModule)
    if type(char) == "string" then
        char = mw.ustring.codepoint(char)
    elseif type(char) ~= number then
        error("getData must operate on a single character or codepoint.")
    end

    --	log(char, mw.ustring.char(char))

    -- Between first code point of the CJK Unified Ideographs Extension A block
    -- and last assigned code point of the CJK Unified Ideographs block.
    if char >= 0x3400 and char <= 0x9FEA then
        return getFromModule(char, 0x3400, returnModule)
        -- In the Supplementary Ideographic Plane, between the first code point of
        -- the CJK Unified Ideographs Extension B block and the last assigned code
        -- point of the CJK Unified Ideographs Extension F block.
    elseif char >= 0x20000 and char <= 0x2EBE0 then
        return getFromModule(char, 0x20000, returnModule)
    else
        --		log("not in range: " .. char .. " (" .. mw.ustring.char(char) .. ")")
    end

    return nil
end

function export.makeSortKey(text, lang, sc)
    local allowed_langs = {zh = true, ja = true, ryu = true, vi = true, za = true}
    if lang and not allowed_langs[lang] then return text end

    if sc and sc ~= "Hani" then return text end

    local sort = {}

    local i = 1
    while i <= mw.ustring.len(text) do
        local character = substring(text, i, i)
        --[=[
			If we encounter an ideographic description character (IDC),
			find out if it begins a valid ideographic description sequence (IDS).
			
			If the IDS is valid and a sortkey for it is listed in
			[[Module:zh-sortkey/data/unsupported]], then return
			the sortkey, and move to the next character after the
			IDS.
			
			Otherwise, insert the IDC into the sortkey and move to the next
			character after the IDC.
			
			If the IDS is valid and no sortkey for it is found, track it.
		]=]
        if IDchars[character] then
            local j = findEndOfIDS(text, character, i)
            local IDS, data
            if j then
                IDS = substring(text, i, j)
                data = mw.loadData("zh-sortkey/data/unsupported")[IDS]
            end
            if not data then
                if IDS then
                    require("debug").track("zh-sortkey/IDS-without-sortkey")
                    mw.log("ideographic description sequence without sortkey: '" .. IDS .. "'")
                else
                    require("debug").track("zh-sortkey/invalid-IDS")
                    mw.log("invalid ideographic description sequence at the beginning of '" .. substring(text, i) .. "'")
                end
            end
            if IDS and data then
                table.insert(sort, data)
                i = j
            else
                table.insert(sort, character)
            end
        else
            table.insert(sort, export.getData(character) or character)
        end
        i = i + 1
    end

    sort = table.concat(sort)

    return sort
end

return export
