local export = {}

local m_data = require("grc-utilities/data")
local tokenize = require("grc-utilities").tokenize

local ufind = mw.ustring.find
local ugsub = mw.ustring.gsub
local U = mw.ustring.char
local ulower = mw.ustring.lower
local uupper = mw.ustring.upper

local UTF8char = "[%z\1-\127\194-\244][\128-\191]*"

-- Diacritics
local diacritics = m_data.named

-- Greek
local acute = diacritics.acute
local grave = diacritics.grave
local circumflex = diacritics.circum
local diaeresis = diacritics.diaeresis
local smooth = diacritics.smooth
local rough = diacritics.rough
local macron = diacritics.macron
local breve = diacritics.breve
local subscript = diacritics.subscript

-- Latin
local hat = diacritics.Latin_circum

local macron_diaeresis = macron .. diaeresis .. "?" .. hat
local a_subscript = "^[αΑ].*" .. subscript .. "$"
local velar = "κγχξ"

local tt = {
    -- Vowels
    ["α"] = "a",
    ["ε"] = "e",
    ["η"] = "e" .. macron,
    ["ι"] = "i",
    ["ο"] = "o",
    ["υ"] = "u",
    ["ω"] = "o" .. macron,

    -- Consonants
    ["β"] = "b",
    ["γ"] = "g",
    ["δ"] = "d",
    ["ζ"] = "z",
    ["θ"] = "th",
    ["κ"] = "k",
    ["λ"] = "l",
    ["μ"] = "m",
    ["ν"] = "n",
    ["ξ"] = "x",
    ["π"] = "p",
    ["ρ"] = "r",
    ["σ"] = "s",
    ["ς"] = "s",
    ["τ"] = "t",
    ["φ"] = "ph",
    ["χ"] = "kh",
    ["ψ"] = "ps",

    -- Archaic letters
    ["ϝ"] = "w",
    ["ϻ"] = "ś",
    ["ϙ"] = "q",
    ["ϡ"] = "š",
    ["ͷ"] = "v",

    -- Incorrect characters: see [[Wiktionary:About Ancient Greek#Miscellaneous]].
    -- These are tracked by [[Module:script utilities]].
    ["ϐ"] = "b",
    ["ϑ"] = "th",
    ["ϰ"] = "k",
    ["ϱ"] = "r",
    ["ϲ"] = "s",
    ["ϕ"] = "ph",

    -- Diacritics
    -- unchanged: macron, diaeresis, grave, acute
    [breve] = "",
    [smooth] = "",
    [rough] = "",
    [circumflex] = hat,
    [subscript] = "i"
}

function export.tr(text, lang, sc)
    if text == "῾" then return "h" end

    --[[
		Replace semicolon or Greek question mark with regular question mark,
		except after an ASCII alphanumeric character (to avoid converting
		semicolons in HTML entities).
	]]
    text = ugsub(text, "([^A-Za-z0-9])[;" .. U(0x37E) .. "]", "%1?")

    -- Handle the middle dot. It is equivalent to semicolon or colon, but semicolon is probably more common.
    text = text:gsub("·", ";")

    local tokens = tokenize(text)

    -- now read the tokens
    local output = {}
    for i, token in pairs(tokens) do
        -- Convert token to lowercase and substitute each character
        -- for its transliteration
        local translit = ulower(token):gsub(UTF8char, tt)

        local next_token = tokens[i + 1]

        if token == "γ" and next_token and velar:find(next_token, 1, true) then
            -- γ before a velar should be <n>
            translit = "n"
        elseif token == "ρ" and tokens[i - 1] == "ρ" then
            -- ρ after ρ should be <rh>
            translit = "rh"
        elseif ufind(token, a_subscript) then
            -- add macron to ᾳ
            translit = ugsub(translit, "([aA])", "%1" .. macron)
        end

        if token:find(rough) then
            if ufind(token, "^[Ρρ]") then
                translit = translit .. "h"
            else -- vowel
                translit = "h" .. translit
            end
        end

        -- Remove macron from a vowel that has a circumflex.
        if ufind(translit, macron_diaeresis) then translit = translit:gsub(macron, "") end

        -- Capitalize first character of transliteration.
        if token ~= ulower(token) then translit = translit:gsub("^" .. UTF8char, uupper) end

        table.insert(output, translit)
    end
    output = table.concat(output)

    return output
end

return export
