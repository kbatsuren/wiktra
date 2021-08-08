local export = {}
local u = mw.ustring.char

local consonants = {["ހ"] = "h", ["ށ"] = "ṣ", ["ނ"] = "n", ["ރ"] = "r", ["ބ"] = "b", ["ޅ"] = "ḷ", ["ކ"] = "k", ["އ"] = "", ["ވ"] = "v", ["މ"] = "m", ["ފ"] = "f", ["ދ"] = "d", ["ތ"] = "t", ["ލ"] = "l", ["ގ"] = "g", ["ޏ"] = "ñ", ["ސ"] = "s", ["ޑ"] = "ḍ", ["ޒ"] = "z", ["ޓ"] = "ṭ", ["ޔ"] = "y", ["ޕ"] = "p", ["ޖ"] = "j", ["ޗ"] = "c", ["ޱ"] = "ṇ", ["ޘ"] = "ṯ", ["ޙ"] = "ḥ", ["ޚ"] = "x", ["ޛ"] = "ź", ["ޜ"] = "ž", ["ޝ"] = "š", ["ޞ"] = "ş", ["ޟ"] = "ḋ", ["ޠ"] = "ţ", ["ޡ"] = "ẓ", ["ޢ"] = "ʿ", ["ޣ"] = "ġ", ["ޤ"] = "q", ["ޥ"] = "w"}

-- this controls prenasalized stop digraphs consisting of ނ and a voiced stop
local prenasal = {["ބ"] = "ᵐ", ["ދ"] = "ⁿ", ["ގ"] = "ⁿ", ["ޑ"] = "ⁿ"}

local diacritics = {
    [u(0x07A6)] = "a",
    [u(0x07A7)] = "ā",
    [u(0x07A8)] = "i",
    [u(0x07A9)] = "ī",
    [u(0x07AA)] = "u",
    [u(0x07AB)] = "ū",
    [u(0x07AC)] = "e",
    [u(0x07AD)] = "ē",
    [u(0x07AE)] = "o",
    [u(0x07AF)] = "ō",
    [u(0x07B0)] = "",
    -- no diacritic
    [""] = ""
}

function export.tr(text, lang, sc)
    -- final k
    text = mw.ustring.gsub(text, "އް$", "ކް")
    -- V + sukun + C -> CC
    text = mw.ustring.gsub(text, "އ" .. u(0x07B0) .. "([ހ-ޥޱ])", function(c) return c .. c end)
    -- prenasalized digraphs
    text = mw.ustring.gsub(text, "ނ([ހ-ޥޱ])", function(c) return (prenasal[c] or "n") .. c end)

    -- handle all standard akuru (C+V or C+virama) units
    text = mw.ustring.gsub(text, "([ހ-ޥޱ])([" .. u(0x07A6) .. "-" .. u(0x07B0) .. "]?)", function(c, d)
        if mw.ustring.match(c, "[ށނތކމ]") and d == u(0x07B0) then
            return consonants[c] .. "̊"
        else
            return consonants[c] .. diacritics[d]
        end
    end)
    return text
end

return export
