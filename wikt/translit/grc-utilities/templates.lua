local export = {}

local m_table = require("table")
local m_utils = require("grc-utilities")
local m_data = require("grc-utilities/data")
local tag = m_utils.tag
local link = m_utils.link
local tokenize = m_utils.tokenize
local diacritic = m_data.diacritic

local U = mw.ustring.char
local toNFD = mw.ustring.toNFD
local gsub = mw.ustring.gsub

local dottedCircle = U(0x25CC)

export.addDottedCircle = require("Unicode data").add_dotted_circle

function export.printTokens(frame)
    text = frame.args[1]
    local token_format = "<span class=\"polytonic\" style=\"background-color: #E9E9E9;>%s</span>"
    local spacing = {["\n"] = "&para;", ["\r"] = "&para;", [" "] = "&ensp;"}

    if text then
        local tokens = m_table.shallowcopy(tokenize(text))
        for i, token in pairs(tokens) do tokens[i] = token_format:format(string.gsub(token, "%s", spacing)) end
        return "|-\n| " .. tag(text) .. " || " .. tag(table.concat(tokens, ", "))
    else
        error("Provide text to tokenize in first parameter.")
    end
end

function export.printDiacritics(frame)
    local functionToPrint = frame.args[1] or error("Specify a function in the first parameter.")
    local term = frame.args[2] or error("Add text in the second parameter.")

    local result = m_utils[functionToPrint](term)

    -- Show diacritics above or below a dotted circle.
    content = {term = tag(term), term_decomposition = tag(export.addDottedCircle(toNFD(term))), result = tag(result), result_decomposition = tag(export.addDottedCircle(result))}

    local output = [[ term (term_decomposition) → result (result_decomposition)]]

    local function addContent(item) return content[item] or "" end

    return (output:gsub("[%a_]+", addContent))
end

function export.decompose(frame)
    local params = {[1] = {}, ["link"] = {type = "boolean"}}

    args = require("parameters").process(frame.args, params)

    local text = args[1]
    text = toNFD(text)
    local link = args.link
    local composed

    if link then
        composed = link(text, nil, nil, "-")
    else
        composed = tag(text)
    end

    local decomposed = export.addDottedCircle(text)

    if link then
        local result = {}
        for seat, letter in gmatch(decomposed, "(" .. dottedCircle .. "?)(.)") do
            local link
            if letter then link = linkNoTag(letter, seat .. letter) end

            table.insert(result, link)
        end
        decomposed = table.concat(result)
    end

    decomposed = tag(decomposed)

    return composed .. " (" .. decomposed .. ")"
end

function export.tokenize(frame)
    local map = require("fun").map
    local token_format = "<span class=\"polytonic\" style=\"background-color: #EFEFEF;>%s</span>"
    local spacing = {["\n"] = "&para;", ["\r"] = "&para;", [" "] = "&ensp;"}
    local _tokenize = tokenize
    local function tokenize(word, ...) return _tokenize(word) end
    local function print_tokens(tokens)
        if type(tokens) == "string" then return tokens end
        local output = {}
        for i, token in ipairs(tokens) do output[i] = string.format(token_format, string.gsub(token, "%s", spacing)) end
        return table.concat(output, " ")
    end
    return table.concat(map(print_tokens, map(tokenize, frame.args)), "<br>")
end

return export
