local export = {}

local alphabetic_tt = {
    -- this should only contain alphabetic characters
    ["𐎠"] = "a",
    ["𐎡"] = "i",
    ["𐎢"] = "u",
    ["𐎣"] = "k",
    ["𐎤"] = "ku",
    ["𐎥"] = "g",
    ["𐎦"] = "gu",
    ["𐎧"] = "x",
    ["𐎨"] = "c",
    ["𐎩"] = "j",
    ["𐎪"] = "ji",
    ["𐎫"] = "t",
    ["𐎬"] = "tu",
    ["𐎭"] = "d",
    ["𐎮"] = "di",
    ["𐎯"] = "du",
    ["𐎰"] = "θ",
    ["𐎱"] = "p",
    ["𐎲"] = "b",
    ["𐎳"] = "f",
    ["𐎴"] = "n",
    ["𐎵"] = "nu",
    ["𐎶"] = "m",
    ["𐎷"] = "mi",
    ["𐎸"] = "mu",
    ["𐎹"] = "y",
    ["𐎺"] = "v",
    ["𐎻"] = "vi",
    ["𐎼"] = "r",
    ["𐎽"] = "ru",
    ["𐎾"] = "l",
    ["𐎿"] = "s",
    ["𐏀"] = "z",
    ["𐏁"] = "š",
    ["𐏂"] = "ç",
    ["𐏃"] = "h",
    ["𐏈"] = "AM", -- Auramazdā
    ["𐏉"] = "AM", -- Auramazdā
    ["𐏊"] = "AMha", -- Auramazdāha
    ["𐏋"] = "XŠ", -- xšāyathiya 
    ["𐏌"] = "DH", -- dahyāuš
    ["𐏍"] = "DH", -- dahyāuš
    ["𐏎"] = "BG", -- baga
    ["𐏏"] = "BU" -- būmiš
}

local nonalphabetic_tt = {
    ["𐏐"] = " : " -- word divider
}

local numbers = {["𐏑"] = 1, ["𐏒"] = 2, ["𐏓"] = 10, ["𐏔"] = 20, ["𐏕"] = 100}

function export.convert_numbers(numeric_str)
    local total = 0
    for c in mw.ustring.gmatch(numeric_str, ".") do total = total + numbers[c] end
    return total
end

function export.tr(text, lang, sc)
    -- If the script is not Xpeo, do not transliterate
    if sc ~= "Xpeo" then return end

    local t = {}
    local preceding_num = false
    local need_hyphen = false
    -- Transliterate characters
    text = mw.ustring.gsub(text, ".", function(c)
        if alphabetic_tt[c] then
            if need_hyphen then t[#t + 1] = "-" end
            t[#t + 1] = alphabetic_tt[c]
            need_hyphen = true
        else
            need_hyphen = false
            if numbers[c] then
                if preceding_num then
                    t[#t] = t[#t] + numbers[c]
                else
                    t[#t + 1] = numbers[c]
                end
                preceding_num = true
            else
                preceding_num = false
                t[#t + 1] = nonalphabetic_tt[c] or c
            end
        end
    end)

    return table.concat(t)
end

return export
