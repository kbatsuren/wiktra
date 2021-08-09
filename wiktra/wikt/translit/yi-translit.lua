local export = {}

local tt = {["א"] = "q", ["אָ"] = "o", ["אַ"] = "a", ["בּ"] = "b", ["ב"] = "b", ["בֿ"] = "v", ["גּ"] = "g", ["ג"] = "g", ["גֿ"] = "g", ["דּ"] = "d", ["ד"] = "d", ["דֿ"] = "d", ["ה"] = "H", ["ו"] = "w", ["וּ"] = "u", ["וו"] = "v", ["װ"] = "v", ["וי"] = "oy", ["ױ"] = "oy", ["ז"] = "z", ["ח"] = "kh", ["ט"] = "t", ["י"] = "y", ["יִ"] = "i", ["יִ"] = "i", ["יי"] = "ey", ["ײ"] = "ey", ["ייַ"] = "ay", ["ײַ"] = "ay", ["ײַ"] = "ay", ["כּ"] = "k", ["כ"] = "kh", ["כֿ"] = "kh", ["ךּ"] = "k", ["ך"] = "kh", ["ךֿ"] = "kh", ["ל"] = "l", ["מ"] = "m", ["ם"] = "m", ["נ"] = "n", ["ן"] = "n", ["ס"] = "s", ["ע"] = "e", ["פּ"] = "p", ["פ"] = "F", ["פֿ"] = "f", ["ףּ"] = "p", ["ף"] = "f", ["ףֿ"] = "f", ["צ"] = "ts", ["ץ"] = "ts", ["ק"] = "k", ["ר"] = "r", ["שׁ"] = "sh", ["ש"] = "sh", ["שׂ"] = "s", ["תּ"] = "t", ["ת"] = "s", ["תֿ"] = "s", ["־"] = "-", ["׳"] = "'", ["״"] = "\""}

-- in precedence order
local tokens = {"ייַ", "אָ", "אַ", "בּ", "בֿ", "גּ", "גֿ", "דּ", "דֿ", "וּ", "וו", "יִ", "יִ", "יי", "ײַ", "וי", "כּ", "כֿ", "ךּ", "ךֿ", "פּ", "פֿ", "ףּ", "ףֿ", "שׁ", "שׂ", "תּ", "תֿ", "א", "ב", "ג", "ד", "ה", "ו", "ױ", "װ", "ז", "ח", "ט", "י", "ײ", "ײַ", "כ", "ך", "ל", "מ", "ם", "נ", "ן", "ס", "ע", "פ", "ף", "צ", "ץ", "ק", "ר", "ש", "ת", "־", "׳", "״"}

hebrew_only_tokens = {"בֿ", "ח", "כּ", "שׂ", "ת"}

function export.tr(text, lang, sc)
    local hebrew_only = false
    for _, token in ipairs(hebrew_only_tokens) do
        if string.find(text, token) ~= nil then
            hebrew_only = true
            break
        end
    end

    for _, token in ipairs(tokens) do text = string.gsub(text, token, tt[token]) end

    local suffix = text ~= "-" and string.sub(text, 1, 1) == "-"
    local prefix = text ~= "-" and string.sub(text, -1, -1) == "-"

    if suffix then text = string.gsub(text, "^-", "-q") end
    if prefix then text = string.gsub(text, "-$", "q-") end
    text = string.gsub(text, "([bcdfFghHjklmnpqrstvwxz])y$", "%1i")
    text = string.gsub(text, "([bcdfFghHjklmnpqrstvwxz])y([^aeiouwy])", "%1i%2")
    text = string.gsub(text, "([bcdfFghHjklmnpqrstvwxz])y([^aeiouwy])", "%1i%2") -- repeated to handle overlapping cases
    text = string.gsub(text, "([abcdefFghHijklmnopqrstuvxyz])w", "%1u")
    hebrew_only = hebrew_only or (string.find(text, "w") ~= nil)
    text = string.gsub(text, "w", "v")
    hebrew_only = hebrew_only or (string.find(text, "F") ~= nil)
    text = string.gsub(text, "F$", "p")
    text = string.gsub(text, "F([^a-zFH])", "p%1")
    text = string.gsub(text, "F", "f")
    text = string.gsub(text, "zsh", "zh")
    if suffix then text = string.gsub(text, "^%-q", "-") end
    if prefix then text = string.gsub(text, "q%-$", "-") end
    text = string.gsub(text, "q([aeo]y)", "%1")
    text = string.gsub(text, "q([iu])", "%1")
    hebrew_only = hebrew_only or (string.find(text, "q") ~= nil)
    text = string.gsub(text, "q", "a")
    hebrew_only = hebrew_only or (string.find(text, "H[^aeiou]") ~= nil) or (string.find(text, "H$") ~= nil)
    text = string.gsub(text, "H", "h")

    local categories = ""
    if hebrew_only then
        local namespace = mw.title.getCurrentTitle().nsText
        if namespace == "" or namespace == "Appendix" then categories = "[[Category:Requests for transliteration of Yiddish terms with Hebrew-only letters]]" end
    end

    return text .. categories
end

return export
