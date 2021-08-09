local export = {}

local correspondences = {["𐩠"] = "h", ["𐩡"] = "l", ["𐩢"] = "ḥ", ["𐩣"] = "m", ["𐩤"] = "q", ["𐩥"] = "w", ["𐩦"] = "s²", ["𐩧"] = "r", ["𐩨"] = "b", ["𐩩"] = "t", ["𐩪"] = "s¹", ["𐩫"] = "k", ["𐩬"] = "n", ["𐩭"] = "ḫ", ["𐩮"] = "ṣ", ["𐩯"] = "s³", ["𐩰"] = "f", ["𐩱"] = "ʾ", ["𐩲"] = "ʿ", ["𐩳"] = "ḍ", ["𐩴"] = "g", ["𐩵"] = "d", ["𐩶"] = "ġ", ["𐩷"] = "ṭ", ["𐩸"] = "z", ["𐩹"] = "ḏ", ["𐩺"] = "y", ["𐩻"] = "ṯ", ["𐩼"] = "ẓ", ["𐩽"] = " "}

local numbers = {["𐩽"] = "1", ["𐩭"] = "5", ["𐩲"] = "10", ["𐩾"] = "50", ["𐩣"] = "100", ["𐩱"] = "1000"}

function export.tr(text, lang, sc)
    -- Interpret numbers.
    -- Will not work for thousands!
    text = text:gsub("𐩿(..-)𐩿", function(number)
        local value = 0
        for digit in mw.ustring.gmatch(number, ".") do value = value + numbers[digit] or error("The character " .. digit .. " in " .. number .. " does not have a numeric value.") end
        return value
    end)

    text = mw.ustring.gsub(text, ".", correspondences)

    return text
end

return export
