local export = {}

local tt = {["α"] = "a", ["ά"] = "á", ["β"] = "v", ["γ"] = "g", ["δ"] = "d", ["ε"] = "e", ["έ"] = "é", ["ζ"] = "z", ["η"] = "i", ["ή"] = "í", ["θ"] = "th", ["ι"] = "i", ["ί"] = "í", ["ϊ"] = "ï", ["ΐ"] = "ḯ", ["κ"] = "k", ["λ"] = "l", ["μ"] = "m", ["ν"] = "n", ["ξ"] = "x", ["ο"] = "o", ["ό"] = "ó", ["π"] = "p", ["ρ"] = "r", ["σ"] = "s", ["ς"] = "s", ["τ"] = "t", ["υ"] = "y", ["ύ"] = "ý", ["ϋ"] = "ÿ", ["ΰ"] = "ÿ́", ["φ"] = "f", ["χ"] = "ch", ["ψ"] = "ps", ["ω"] = "o", ["ώ"] = "ó", ["Α"] = "A", ["Ά"] = "Á", ["Β"] = "V", ["Γ"] = "G", ["Δ"] = "D", ["Ε"] = "E", ["Έ"] = "É", ["Ζ"] = "Z", ["Η"] = "I", ["Ή"] = "Í", ["Θ"] = "Th", ["Ι"] = "I", ["Ί"] = "Í", ["Κ"] = "K", ["Λ"] = "L", ["Μ"] = "M", ["Ν"] = "N", ["Ξ"] = "X", ["Ο"] = "O", ["Ό"] = "Ó", ["Π"] = "P", ["Ρ"] = "R", ["Σ"] = "S", ["Τ"] = "T", ["Υ"] = "Y", ["Ύ"] = "Ý", ["Φ"] = "F", ["Χ"] = "Ch", ["Ψ"] = "Ps", ["Ω"] = "O", ["Ώ"] = "Ó", ["·"] = ";"}

-- transliterates any words or phrases
function export.tr(text, lang, sc)
    local gsub = mw.ustring.gsub
    local U = mw.ustring.char
    local acute = mw.ustring.char(0x301)
    local diaeresis = mw.ustring.char(0x308)

    text = gsub(text, "([^A-Za-z0-9])[;" .. U(0x37E) .. "]", "%1?")

    text = gsub(text, "([αεηΑΕΗ])([υύ])(.?)", function(vowel, upsilon, following) return tt[vowel] .. (upsilon == "ύ" and acute or "") .. (("θκξπσςτφχψ"):find(following) and "f" or "v") .. following end)

    text = gsub(text, "([αεοωΑΕΟΩ])([ηή])", function(vowel, ita)
        if ita == "ή" then
            return tt[vowel] .. "i" .. diaeresis .. acute
        else
            return tt[vowel] .. "i" .. diaeresis
        end
    end)

    text = gsub(text, "[ωΩ][ιί]", {["ωι"] = "oï", ["ωί"] = "oḯ", ["Ωι"] = "Oï", ["Ωί"] = "Oḯ"})

    text = gsub(text, "[οΟ][υύ]", {["ου"] = "ou", ["ού"] = "oú", ["Ου"] = "Ou", ["Ού"] = "Oú"})

    text = gsub(text, "(.?)([μΜ])π", function(before, mi)
        if before == "" or before == " " or before == "-" then
            if mi == "Μ" then
                return before .. "B"
            else
                return before .. "b"
            end
        end
    end)

    text = gsub(text, "(.?)([νΝ])τ", function(before, ni)
        if before == "" or before == " " or before == "-" then
            if ni == "Ν" then
                return before .. "D"
            else
                return before .. "d"
            end
        end
    end)

    text = gsub(text, "γ([γξχ])", "n%1")

    text = gsub(text, ".", tt)

    return text
end

return export
