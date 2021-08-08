local export = {}

local tt = {
    ["𐭠"] = "ʾ", -- aleph
    ["𐭡"] = "b", -- beth
    ["𐭢"] = "g", -- gimil
    ["𐭣"] = "d", -- daleth
    ["𐭤"] = "h", -- he
    ["𐭥"] = "ʿ", -- waw-ayin-resh
    ["𐭦"] = "z", -- zayin
    ["𐭧"] = "ḥ", -- heth
    ["𐭨"] = "ṭ", -- teth
    ["𐭩"] = "y", -- yodh
    ["𐭪"] = "k", -- kaph
    ["𐭫"] = "l", -- lamedh
    ["𐭬"] = "m", -- mem-qoph
    ["𐭭"] = "n", -- nun
    ["𐭮"] = "s", -- samekh
    ["𐭯"] = "p", -- pe
    ["𐭰"] = "c", -- sadhe
    ["𐭱"] = "š", -- shin
    ["𐭲"] = "t" -- taw
}

local numbers = {["𐭸"] = 1, ["𐭹"] = 2, ["𐭺"] = 3, ["𐭻"] = 4, ["𐭼"] = 10, ["𐭽"] = 20, ["𐭾"] = 100, ["𐭿"] = 1000}

function export.convert_numbers(numeric_str)
    local total = 0
    for c in mw.ustring.gmatch(numeric_str, ".") do total = total + numbers[c] end
    return total
end

function export.tr(text, lang, sc)
    -- If the script is not Phli, do not transliterate
    if sc ~= "Phli" then return end

    -- Category to catch automatic transcriptions of waw-ayin-resh and mem-qoph
    -- [[Category:Automatic Inscriptional Pahlavi transliterations containing ambiguous characters]]
    local ambig_note = ""
    if mw.ustring.match(text, "[𐭬𐭥]") then ambig_note = "[[Category:Automatic Inscriptional Pahlavi transliterations containing ambiguous characters]]" end

    if mw.ustring.match(text, "[𐭠-𐭿]") then text = mw.ustring.gsub(text, "[𐭸-𐭿]+", export.convert_numbers) end

    -- Transliterate characters
    text = mw.ustring.gsub(text, ".", tt)

    return text .. ambig_note
end

return export
