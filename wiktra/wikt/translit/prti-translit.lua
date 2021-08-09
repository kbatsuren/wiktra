local export = {}

local tt = {["𐭀"] = "ʾ", ["𐭁"] = "b", ["𐭂"] = "g", ["𐭃"] = "d", ["𐭄"] = "h", ["𐭅"] = "w", ["𐭆"] = "z", ["𐭇"] = "ḥ", ["𐭈"] = "ṭ", ["𐭉"] = "y", ["𐭊"] = "k", ["𐭋"] = "l", ["𐭌"] = "m", ["𐭍"] = "n", ["𐭎"] = "s", ["𐭏"] = "ʿ", ["𐭐"] = "p", ["𐭑"] = "c", ["𐭒"] = "q", ["𐭓"] = "r", ["𐭔"] = "š", ["𐭕"] = "t"}

local numbers = {["𐭘"] = 1, ["𐭙"] = 2, ["𐭚"] = 3, ["𐭛"] = 4, ["𐭜"] = 10, ["𐭝"] = 20, ["𐭞"] = 100, ["𐭟"] = 1000}

function export.convert_numbers(numeric_str)
    local total = 0
    for c in mw.ustring.gmatch(numeric_str, ".") do total = total + numbers[c] end
    return total
end

function export.tr(text, lang, sc)
    -- If the script is not Prti, do not transliterate
    if sc ~= "Prti" then return end

    if mw.ustring.match(text, "[𐭘-𐭟]") then text = mw.ustring.gsub(text, "[𐭘-𐭟]+", export.convert_numbers) end

    -- Transliterate characters
    text = mw.ustring.gsub(text, ".", tt)

    return text
end

return export
