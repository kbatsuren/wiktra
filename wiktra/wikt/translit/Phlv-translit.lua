local export = {}

local U = mw.ustring.char

local gdy_pattern = "[" .. U(0x10BCB, 0x10BCD, 0x10BCC, 0x10BCE) .. "]" .. U(0x10BB2)

local gdy_map = {
    ["𐯋𐮲"] = "g", -- gimel-daleth-yodh with two dots above
    ["𐯌𐮲"] = "d", -- gimel-daleth-yodh with hat above
    ["𐯍𐮲"] = "y", -- gimel-daleth-yodh with two dots below
    ["𐯎𐮲"] = "j" -- gimel-daleth-yodh with dot below
}

local tt = {
    ["𐮰"] = "ʾ", -- aleph-het
    ["𐮱"] = "b", -- beth
    ["𐮲"] = "?", -- gimel-daleth-yodh (Should have been transliterated)
    ["𐮳"] = "ḍ", -- old daleth
    ["𐮴"] = "h", -- he
    ["𐮵"] = "'", -- waw-nun-ayin-resh
    ["𐮶"] = "z", -- zayin
    ["𐮷"] = "k", -- kaph
    ["𐮸"] = "k", -- old kaph
    ["𐮹"] = "l", -- lamedh
    ["𐮺"] = "ƚ", -- old lamedh
    ["𐮻"] = "ḷ", -- l-lamedh
    ["𐮼"] = "m", -- mem-qoph
    ["𐮽"] = "s", -- samekh
    ["𐮾"] = "p", -- pe
    ["𐮿"] = "c", -- sadhe
    ["𐯀"] = "š", -- shin
    ["𐯁"] = "t", -- taw
    ["𐯂"] = "yt", -- x1
    ["𐯃"] = "ty", -- x2
    ["𐯐"] = "", -- I
    ["𐯑"] = "" -- ahriman
}

function export.tr(text, lang, sc)
    -- If the script is not Phlv, do not transliterate
    if sc ~= "Phlv" then return end

    text = mw.ustring.gsub(text, gdy_pattern, gdy_map)

    -- Category to catch automatic transcriptions of waw-ayin-resh and mem-qoph
    -- [[Category:Automatic Book Pahlavi transliterations containing ambiguous characters]]
    local ambig_note = ""
    if mw.ustring.match(text, "[𐮲𐮵𐮼]") then ambig_note = "[[Category:Automatic Book Pahlavi transliterations containing ambiguous characters]]" end

    -- Transliterate characters
    text = mw.ustring.gsub(text, ".", tt)

    return text
end

return export
