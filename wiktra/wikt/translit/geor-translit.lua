local export = {}
-- Keep synchronized with [[Module:sva-translit]]
local gsub = mw.ustring.gsub
local tt = {["ა"] = "a", ["ბ"] = "b", ["გ"] = "g", ["დ"] = "d", ["ე"] = "e", ["ვ"] = "v", ["ზ"] = "z", ["ჱ"] = "ē", ["თ"] = "t", ["ი"] = "i", ["კ"] = "ḳ", ["ლ"] = "l", ["მ"] = "m", ["ნ"] = "n", ["ჲ"] = "y", ["ო"] = "o", ["პ"] = "ṗ", ["ჟ"] = "ž", ["რ"] = "r", ["ს"] = "s", ["ტ"] = "ṭ", ["ჳ"] = "wi", ["უ"] = "u", ["ფ"] = "p", ["ქ"] = "k", ["ღ"] = "ɣ", ["ყ"] = "q̇", ["შ"] = "š", ["ჩ"] = "č", ["ც"] = "c", ["ძ"] = "ʒ", ["წ"] = "c̣", ["ჭ"] = "č̣", ["ხ"] = "x", ["ჴ"] = "q", ["ჯ"] = "ǯ", ["ჰ"] = "h", ["ჵ"] = "ō", ["ჶ"] = "f", ["ჷ"] = "ə", ["ჸ"] = "ʾ", ["ჺ"] = "ʿ"};

function export.tr(text, lang, sc)
    -- Transliterating vowel nasalization in Bats
    text = gsub(text, "ჼ", "̃")
    text = gsub(text, "<sup>ნ</sup>", "̃")

    -- Transliterate uppercase characters from the Georgian Extended block as
    -- the uppercase version of the transliteration of the lowercase  characters
    -- from the Georgian block.
    -- U+10D0: start of Georgian block
    -- U+1C90: start of Georgian Extended block
    text = gsub(text, "[" .. mw.ustring.char(0x1C90) .. "-" .. mw.ustring.char(0x1CBF) .. "]", function(char)
        local translit = tt[mw.ustring.char(mw.ustring.codepoint(char) - 0x1C90 + 0x10D0)]
        return translit and mw.ustring.upper(translit)
    end)
    text = gsub(text, ".", tt)
    return text
end

return export
