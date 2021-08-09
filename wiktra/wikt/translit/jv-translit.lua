local export = {}

local conv = {
    -- finals (U+A980 - U+A983):

    ["ꦀ"] = "m",
    ["ꦁ"] = "ng",
    ["ꦂ"] = "r",
    ["ꦃ"] = "h",

    -- independent vowels (U+A984 - U+A98E):

    ["ꦄ"] = "a",
    ["ꦄꦴ"] = "a",
    ["ꦅ"] = "i",
    ["ꦆ"] = "i",
    ["ꦇ"] = "i",
    ["ꦈ"] = "u",
    ["ꦈꦴ"] = "u",
    ["ꦉ"] = "re",
    ["ꦉꦴ"] = "reu",
    ["ꦊ"] = "le",
    ["ꦋ"] = "leu",
    ["ꦌ"] = "e",
    ["ꦍ"] = "ai",
    ["ꦎ"] = "o",

    -- independent consonants (U+A98F - U+A9B2):

    ["ꦏ"] = "k",
    ["ꦏ꦳"] = "kh",
    ["ꦐ"] = "q",
    ["ꦑ"] = "kh",
    ["ꦒ"] = "g",
    ["ꦒ꦳"] = "gh",
    ["ꦓ"] = "gh",
    ["ꦔ"] = "ng",
    ["ꦔ꦳"] = "'",

    ["ꦕ"] = "c",
    ["ꦖ"] = "ch",
    ["ꦗ"] = "j",
    ["ꦗ꦳"] = "z",
    ["ꦘ"] = "jny",
    ["ꦙ"] = "jh",
    ["ꦚ"] = "ny",

    ["ꦛ"] = "th",
    ["ꦜ"] = "th",
    ["ꦝ"] = "dh",
    ["ꦞ"] = "dh",
    ["ꦟ"] = "nn",

    ["ꦠ"] = "t",
    ["ꦡ"] = "th",
    ["ꦢ"] = "d",
    ["ꦢ꦳"] = "dz",
    ["ꦣ"] = "dh",
    ["ꦤ"] = "n",

    ["ꦥ"] = "p",
    ["ꦥ꦳"] = "f",
    ["ꦦ"] = "ph",
    ["ꦧ"] = "b",
    ["ꦨ"] = "bh",
    ["ꦩ"] = "m",

    ["ꦪ"] = "y",
    ["ꦫ"] = "r",
    ["ꦬ"] = "r",
    ["ꦭ"] = "l",
    ["ꦮ"] = "w",
    ["ꦮ꦳"] = "v",
    ["ꦯ"] = "sh",
    ["ꦰ"] = "ss",
    ["ꦱ"] = "s",
    ["ꦱ꦳"] = "sy",
    ["ꦲ"] = "h",
    ["ꦲ꦳"] = "h",

    -- cecak_telu/nukta (U+A9B3):

    ["꦳"] = "",

    -- dependent vowels (U+A9B4 - A9BD):

    ["ꦴ"] = "a", -- tarung
    ["ꦵ"] = "o",
    ["ꦶ"] = "i",
    ["ꦷ"] = "i",
    ["ꦸ"] = "u",
    ["ꦹ"] = "ū",
    ["ꦺ"] = "é",
    ["ꦺꦴ"] = "o",
    ["ꦻ"] = "ai",
    ["ꦻꦴ"] = "au",
    ["ꦼ"] = "e",
    ["ꦽ"] = "re",
    ["ꦽꦴ"] = "reu",

    -- medials (U+A9BE - U+A9BF):
    ["ꦾ"] = "y",
    ["ꦿ"] = "r",

    -- pangkon/virama (U+A9C0):

    ["꧀"] = "",

    -- punctuation (U+A9C1 - U+A9CF):

    ["꧁"] = "(starts title)",
    ["꧂"] = "(ends title)",
    ["꧃"] = "(letter to younger age or lower rank)",
    ["꧄"] = "(letter to equal age or equal rank)",
    ["꧅"] = "(letter to older age or higher rank)",
    ["꧆"] = "(pada windu)",
    ["꧇"] = ":", -- number indicator
    ["꧈"] = ",",
    ["꧉"] = ".",
    ["꧊"] = "\"",
    ["꧋"] = "//",
    ["꧌"] = "(",
    ["꧍"] = ")",
    ["ꧏ"] = "<sup>2</sup>",

    -- digits (U+A9D0 - U+A9D9):

    ["꧐"] = "0",
    ["꧑"] = "1",
    ["꧒"] = "2",
    ["꧓"] = "3",
    ["꧔"] = "4",
    ["꧕"] = "5",
    ["꧖"] = "6",
    ["꧗"] = "7",
    ["꧘"] = "8",
    ["꧙"] = "9",

    -- ellipsis (U+A9DE - U+A9DF):

    ["꧞"] = "-",
    ["꧟"] = "-"
}

function export.tr(text, lang, sc)
    local CSVC = {initial = "([ꦏ-ꦲ]꦳?)", medial = "([ꦾꦿ]?)", nucleus = "([ꦴ-ꦽ꧀]?ꦴ?)", final = "([ꦀ-ꦃ]?)"}
    local VC = {nucleus = "([ꦄ-ꦎ]ꦴ?)", final = "([ꦀ-ꦃ]*)"}

    local number_indicator = "꧇"
    local digits = "[꧐-꧙]"

    local initial = true

    text = mw.ustring.gsub(text, CSVC.initial .. CSVC.medial .. CSVC.nucleus .. CSVC.final, function(a, b, c, d)
        a = conv[a] or error("Initial not recognized: " .. a)
        b = b == "" and "" or conv[b] or error("Medial not recognized: " .. b)
        c = c == "" and "a" or conv[c] or error("Nucleus not recognized: " .. c)
        d = d == "" and "" or conv[d] or error("Final not recognized: " .. d)
        if initial and a == "h" then a = "" end
        initial = false
        return a .. b .. c .. d
    end)

    text = mw.ustring.gsub(text, VC.nucleus .. VC.final, function(a, b)
        a = conv[a]
        b = (b == "" and "" or conv[b])
        initial = false
        return a .. b
    end)

    text = mw.ustring.gsub(text, number_indicator .. "(" .. digits .. "+)" .. number_indicator, function(a)
        a = mw.ustring.gsub(a, ".", conv)
        initial = true
        return a
    end)

    text = mw.ustring.gsub(text, ".", conv)

    return text
end

return export
