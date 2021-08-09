local export = {}

local vowel = {["a"] = "ᠠ", ["e"] = "ᡝ", ["i"] = "ᡳ", ["y"] = "ᡟ", ["o"] = "ᠣ", ["u"] = "ᡠ", ["ū"] = "ᡡ"}

local consonant = {["n"] = "ᠨ", ["ng"] = "ᠩ", ["k"] = "ᡴ", ["g"] = "ᡤ", ["h"] = "ᡥ", ["b"] = "ᠪ", ["p"] = "ᡦ", ["s"] = "ᠰ", ["š"] = "ᡧ", ["t"] = "ᡨ", ["d"] = "ᡩ", ["l"] = "ᠯ", ["m"] = "ᠮ", ["c"] = "ᠴ", ["j"] = "ᠵ", ["y"] = "ᠶ", ["r"] = "ᡵ", ["f"] = "ᡶ", ["w"] = "ᠸ", ["k'"] = "ᠺ", ["g'"] = "ᡬ", ["h'"] = "ᡭ", ["ts'"] = "ᡮ", ["ts"] = "ᡮᡟ", ["dz"] = "ᡯ", ["ž"] = "ᡰ", ["sy"] = "ᠰᡟ", ["c'"] = "ᡱ", ["c'y"] = "ᡱᡳ", ["j"] = "ᡷ", ["jy"] = "ᡷᡳ"}

function export.tr(text)
    if type(text) == "table" then text = text:getParent().args[1] end
    text = mw.ustring.gsub(text, "ng", consonant)
    text = mw.ustring.gsub(text, "ts", consonant)
    text = mw.ustring.gsub(text, "dz", consonant)
    text = mw.ustring.gsub(text, "[^aeiouūy]'?y?", consonant)
    text = mw.ustring.gsub(text, ".", vowel)
    return text
end

return export
