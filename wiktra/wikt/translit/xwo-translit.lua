local export = {}
local MACRON = mw.ustring.char(0x0304)

local tt = {["ᠠ"] = "a", ["ᡄ"] = "e", ["ᡅ"] = "i", ["ᡆ"] = "o", ["ᡇ"] = "u", ["ᡈ"] = "ö", ["ᡉ"] = "ü", ["ᡋ"] = "b", ["ᡌ"] = "p", ["ᡏ"] = "m", ["ᠯ"] = "l", ["ᠰ"] = "s", ["ᠱ"] = "š", ["ᠨ"] = "n", ["ᡍ"] = "x", ["ᡎ"] = "ɣ", ["ᡐ"] = "t", ["ᡑ"] = "d", ["ᡔ"] = "c", ["ᡒ"] = "č", ["ᡓ"] = "ǰ", ["ᡕ"] = "y", ["ᠷ"] = "r", ["ᡖ"] = "w", ["ᡙ"] = "h", ["ᡘ"] = "gh", ["ᡗ"] = "q", ["ᡚ"] = "ž", ["ᡛ"] = "ń", ["ᡜ"] = "dz", ["ᡊ"] = "ng", ["ᠴ"] = "z", ["ᡃ"] = MACRON, ["᠎"] = "-", ["︖"] = "?", ["︕"] = "!", ["᠂"] = ",", ["᠃"] = ".", [" "] = "-", ["᠊"] = "-"}

function export.tr(text)
    local velar_conv = {["x"] = "k", ["ɣ"] = "g"}
    text = mw.ustring.gsub(text, ".", tt)
    text = mw.ustring.gsub(text, "([xɣ])(.?)", function(velar, vowel) return ((mw.ustring.match(vowel, "[eiöü ]") or vowel == "") and mw.ustring.gsub(velar, "[xɣ]", velar_conv) or velar) .. vowel end)
    text = mw.ustring.gsub(text, "zi", "ji")
    return text
end

return export
