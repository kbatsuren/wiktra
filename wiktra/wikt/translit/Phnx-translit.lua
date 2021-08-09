local export = {}
local gsub = mw.ustring.gsub
local u = mw.ustring.char

-- Beware! Phnx is rtl
local tt = {["𐤀"] = "ʾ", ["𐤁"] = "b", ["𐤂"] = "g", ["𐤃"] = "d", ["𐤄"] = "h", ["𐤅"] = "w", ["𐤆"] = "z", ["𐤇"] = "ḥ", ["𐤈"] = "ṭ", ["𐤉"] = "y", ["𐤊"] = "k", ["𐤋"] = "l", ["𐤌"] = "m", ["𐤍"] = "n", ["𐤎"] = "s", ["𐤏"] = "ʿ", ["𐤐"] = "p", ["𐤑"] = "ṣ", ["𐤒"] = "q", ["𐤓"] = "r", ["𐤔"] = "š", ["𐤕"] = "t", ["𐤖"] = "[1]", ["𐤗"] = "[10]", ["𐤘"] = "[20]", ["𐤙"] = "[100]", ["𐤚"] = "[2]", ["𐤛"] = "[3]", ["𐤟"] = " "}

function export.tr(text, lang, sc, debug_mode)

    if type(text) == "table" then -- called directly from a template
        text = text.args[1]
    end

    return (text:gsub("[%z\1-\127\194-\244][\128-\191]*", tt)) -- UTF-8 character pattern
end

return export
