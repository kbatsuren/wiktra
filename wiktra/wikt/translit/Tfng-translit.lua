local export = {}

local tt = {}

tt["Tfng"] = {
    ["common"] = {
        ["ⴰ"] = "a",
        ["ⴱ"] = "b",
        ["ⴲ"] = "b",
        ["ⴳ"] = "g",
        ["ⴴ"] = "g",
        ["ⴵ"] = "ǧ",
        ["ⴶ"] = "ǧ",
        ["ⴷ"] = "d",
        ["ⴸ"] = "d",
        ["ⴹ"] = "ḍ",
        ["ⴺ"] = "ḍ",
        ["ⴻ"] = "e",
        ["ⴼ"] = "f",
        ["ⴽ"] = "k",
        ["ⴾ"] = "k",
        ["ⴿ"] = "k",
        ["ⵀ"] = "h", -- tmh, thv, taq, ttq, thz: "b"
        ["ⵁ"] = "h",
        ["ⵂ"] = "h",
        ["ⵃ"] = "ḥ",
        ["ⵄ"] = "ɛ",
        ["ⵅ"] = "x",
        ["ⵆ"] = "x",
        ["ⵇ"] = "q",
        ["ⵈ"] = "q",
        ["ⵉ"] = "i",
        ["ⵊ"] = "j",
        ["ⵋ"] = "j",
        ["ⵌ"] = "j",
        ["ⵍ"] = "l",
        ["ⵎ"] = "m",
        ["ⵏ"] = "n",
        ["ⵐ"] = "ny",
        ["ⵑ"] = "ng",
        ["ⵒ"] = "p",
        ["ⵓ"] = "u", -- tmh, thv, taq, ttq, thz: "w"
        ["ⵔ"] = "r",
        ["ⵕ"] = "ṛ",
        ["ⵖ"] = "ɣ",
        ["ⵗ"] = "ɣ",
        ["ⵘ"] = "j", -- thz: "ɣ"
        ["ⵙ"] = "s",
        ["ⵚ"] = "ṣ",
        ["ⵛ"] = "š",
        ["ⵜ"] = "t",
        ["ⵝ"] = "t",
        ["ⵞ"] = "č",
        ["ⵟ"] = "ṭ",
        ["ⵠ"] = "v",
        ["ⵡ"] = "w",
        ["ⵢ"] = "y",
        ["ⵣ"] = "z",
        ["ⵤ"] = "z",
        ["ⵥ"] = "ẓ",
        ["ⵦ"] = "e",
        ["ⵧ"] = "o",
        ["ⵯ"] = "ʷ",
        ["⵰"] = ".",
        ["⵿"] = ""
    },
    ["tmh"] = {["ⵀ"] = "b", ["ⵓ"] = "w"},
    ["thv"] = {["ⵀ"] = "b", ["ⵓ"] = "w"},
    ["taq"] = {["ⵀ"] = "b", ["ⵓ"] = "w"},
    ["ttq"] = {["ⵀ"] = "b", ["ⵓ"] = "w"},
    ["thz"] = {["ⵀ"] = "b", ["ⵓ"] = "w", ["ⵘ"] = "ɣ"}
}

tt["Latn"] = {["common"] = {["a"] = "ⴰ", ["ā"] = "ⴰ", ["b"] = "ⴱ", ["g"] = "ⴳ", ["d"] = "ⴷ", ["ḏ"] = "ⴷ", ["ḍ"] = "ⴹ", ["e"] = "ⴻ", ["f"] = "ⴼ", ["ǧ"] = "ⴵ", ["k"] = "ⴽ", ["h"] = "ⵀ", ["ḥ"] = "ⵃ", ["ɛ"] = "ⵄ", ["x"] = "ⵅ", ["q"] = "ⵇ", ["i"] = "ⵉ", ["j"] = "ⵊ", ["l"] = "ⵍ", ["m"] = "ⵎ", ["n"] = "ⵏ", ["p"] = "ⵒ", ["u"] = "ⵓ", ["r"] = "ⵔ", ["ṛ"] = "ⵕ", ["ɣ"] = "ⵖ", ["s"] = "ⵙ", ["ṣ"] = "ⵚ", ["š"] = "ⵛ", ["t"] = "ⵜ", ["ṯ"] = "ⵜ", ["č"] = "ⵞ", ["ṭ"] = "ⵟ", ["v"] = "ⵠ", ["w"] = "ⵡ", ["y"] = "ⵢ", ["z"] = "ⵣ", ["ẓ"] = "ⵥ", ["o"] = "ⵧ", ["ʷ"] = "ⵯ", ["."] = "⵰"}, ["tmh"] = {["b"] = "ⵀ", ["w"] = "ⵓ"}, ["thv"] = {["b"] = "ⵀ", ["w"] = "ⵓ"}, ["taq"] = {["b"] = "ⵀ", ["w"] = "ⵓ"}, ["ttq"] = {["b"] = "ⵀ", ["w"] = "ⵓ"}, ["thz"] = {["b"] = "ⵀ", ["w"] = "wⵓ", ["ɣ"] = "ⵘ"}}

function export.tr_alt(text, lang, sc)
    if not sc then sc = require("scripts").findBestScript(text, require("languages").getByCode(lang or "ber")):getCode() end

    if sc == "Latn" then
        if tt[sc][lang] then text = mw.ustring.gsub(text, ".", tt[sc][lang]) end
        text = mw.ustring.gsub(text, ".", tt[sc]["common"])
    elseif sc == "Arab" then
        text = nil
    elseif sc == "Tfng" then
        text = nil
    end

    return text
end

function export.tr(text, lang, sc)
    if not sc then sc = require("scripts").findBestScript(text, require("languages").getByCode(lang or "ber")):getCode() end

    if sc == "Arab" then
        -- perhaps will be implemented in the future
        text = nil
    elseif sc == "Latn" then
        -- no need to transliterate
        text = nil
    elseif sc == "Tfng" then
        if tt[sc][lang] then text = mw.ustring.gsub(text, ".", tt[sc][lang]) end
        text = mw.ustring.gsub(text, ".", tt[sc]["common"])
    end

    return text
end

return export
