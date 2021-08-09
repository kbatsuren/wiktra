local export = {}

local tt_he_a2 = {["או"] = "y", ["אי"] = "e", ["אָ"] = "o", ["אַ"] = "a", ["אִ"] = "i"}

local tt_he_dg = {["כּ"] = "k", ["ךּ"] = "k", ["בּ"] = "b", ["פּ"] = "p", ["ףּ"] = "p", ["ג׳"] = "c", ["ז׳"] = "ç", ["ג'"] = "c", ["ז'"] = "ç"}

local tt_he = {["א"] = "ə", ["ב"] = "v", ["ג"] = "g", ["ד"] = "d", ["ה"] = "h", ["ז"] = "z", ["ח"] = "ħ", ["י"] = "j", ["כ"] = "x", ["ך"] = "x", ["ל"] = "l", ["מ"] = "m", ["ם"] = "m", ["נ"] = "n", ["ן"] = "n", ["ס"] = "s", ["ע"] = "ḩ", ["פ"] = "f", ["ף"] = "f", ["צ"] = "c", ["ץ"] = "c", ["ק"] = "q", ["ר"] = "r", ["ש"] = "ş", ["ת"] = "t", ["ת"] = "t", ["׃"] = ":", ["׳"] = "'", ["״"] = "\"", ["־"] = "-"}

local tt_cy_2 = {
    ["ГЬ"] = "H",
    ["Гь"] = "H",
    ["гЬ"] = "h",
    ["гь"] = "h",
    ["ГӀ"] = "Ḩ", -- palochka
    ["Гӏ"] = "Ḩ", -- palochka (rare lowercase)
    ["ГI"] = "Ḩ", -- Latn I
    ["ГІ"] = "Ḩ", -- Cyrl І
    ["Гi"] = "Ḩ", -- Latn i
    ["Гі"] = "Ḩ", -- Cyrl і
    ["гӀ"] = "ḩ", -- palochka
    ["гӏ"] = "ḩ", -- palochka (rare lowercase)
    ["гI"] = "ḩ", -- Latn I
    ["гІ"] = "ḩ", -- Cyrl І
    ["гi"] = "ḩ", -- Latn i
    ["гі"] = "ḩ", -- Cyrl і
    ["ХЬ"] = "Ħ",
    ["Хь"] = "Ħ",
    ["хЬ"] = "ħ",
    ["хь"] = "ħ",
    ["ГЪ"] = "Q",
    ["Гъ"] = "Q",
    ["гЪ"] = "q",
    ["гъ"] = "q",
    ["УЬ"] = "Y",
    ["Уь"] = "Y",
    ["уЬ"] = "y",
    ["уь"] = "y"
}

local tt_cy = {["А"] = "A", ["а"] = "a", ["Б"] = "B", ["б"] = "b", ["Ч"] = "C", ["ч"] = "c", ["Ж"] = "Ç", ["ж"] = "ç", ["Д"] = "D", ["д"] = "d", ["Е"] = "E", ["е"] = "e", ["Э"] = "Ə", ["э"] = "ə", ["Ф"] = "F", ["ф"] = "f", ["Г"] = "G", ["г"] = "g", ["И"] = "I", ["и"] = "i", ["Й"] = "J", ["й"] = "j", ["К"] = "K", ["к"] = "k", ["Л"] = "L", ["л"] = "l", ["М"] = "M", ["м"] = "m", ["Н"] = "N", ["н"] = "n", ["О"] = "O", ["о"] = "o", ["П"] = "P", ["п"] = "p", ["Р"] = "R", ["р"] = "r", ["С"] = "S", ["с"] = "s", ["Ш"] = "Ş", ["ш"] = "ş", ["Т"] = "T", ["т"] = "t", ["У"] = "U", ["у"] = "u", ["В"] = "V", ["в"] = "v", ["Х"] = "X", ["х"] = "x", ["З"] = "Z", ["з"] = "z"}

local tt_ipa = {["A"] = "a", ["a"] = "a", ["B"] = "b", ["b"] = "b", ["C"] = "tʃ", ["c"] = "tʃ", ["Ç"] = "dʒ", ["ç"] = "dʒ", ["D"] = "d", ["d"] = "d", ["E"] = "ɛ", ["e"] = "ɛ", ["Ə"] = "æ", ["ə"] = "æ", ["F"] = "f", ["f"] = "f", ["G"] = "ɡ", ["g"] = "ɡ", ["H"] = "h", ["h"] = "h", ["Ḩ"] = "ʕ", ["ḩ"] = "ʕ", ["Ħ"] = "ħ", ["ħ"] = "ħ", ["I"] = "ɪ", ["i"] = "ɪ", ["J"] = "j", ["j"] = "j", ["K"] = "k", ["k"] = "k", ["L"] = "l", ["l"] = "l", ["M"] = "m", ["m"] = "m", ["N"] = "n", ["n"] = "n", ["O"] = "o", ["o"] = "o", ["P"] = "p", ["p"] = "p", ["Q"] = "ɢ", ["q"] = "ɢ", ["R"] = "ɾ", ["r"] = "ɾ", ["S"] = "s", ["s"] = "s", ["Ş"] = "ʃ", ["ş"] = "ʃ", ["T"] = "t", ["t"] = "t", ["U"] = "u", ["u"] = "u", ["V"] = "v", ["v"] = "v", ["X"] = "χ", ["x"] = "χ", ["Y"] = "y", ["y"] = "y", ["Z"] = "z", ["z"] = "z"}

local tt_tocy = {["A"] = "А", ["a"] = "а", ["B"] = "Б", ["b"] = "б", ["C"] = "Ч", ["c"] = "ч", ["Ç"] = "Ж", ["ç"] = "ж", ["D"] = "d", ["d"] = "д", ["E"] = "Е", ["e"] = "е", ["Ə"] = "Э", ["ə"] = "э", ["F"] = "Ф", ["f"] = "ф", ["G"] = "Г", ["g"] = "г", ["H"] = "Гь", ["h"] = "гь", ["Ḩ"] = "ГӀ", ["ḩ"] = "гӀ", ["Ħ"] = "Хь", ["ħ"] = "хь", ["I"] = "И", ["i"] = "и", ["J"] = "Й", ["j"] = "й", ["K"] = "К", ["k"] = "к", ["L"] = "Л", ["l"] = "л", ["M"] = "М", ["m"] = "м", ["N"] = "Н", ["n"] = "н", ["O"] = "О", ["o"] = "о", ["P"] = "П", ["p"] = "п", ["Q"] = "Гъ", ["q"] = "гъ", ["R"] = "Р", ["r"] = "р", ["S"] = "С", ["s"] = "с", ["Ş"] = "Ш", ["ş"] = "ш", ["T"] = "Т", ["t"] = "т", ["U"] = "У", ["u"] = "у", ["V"] = "В", ["v"] = "в", ["X"] = "Х", ["x"] = "х", ["Y"] = "Уь", ["y"] = "уь", ["Z"] = "З", ["z"] = "з"}

local tt_tohe = {["A"] = "אַ", ["a"] = "אַ", ["B"] = "בּ", ["b"] = "בּ", ["C"] = "ג׳", ["c"] = "ג׳", ["Ç"] = "ז׳", ["ç"] = "ז׳", ["D"] = "ד", ["d"] = "ד", ["E"] = "אי", ["e"] = "אי", ["Ə"] = "א", ["ə"] = "א", ["F"] = "פ", ["f"] = "פ", ["G"] = "ג", ["g"] = "ג", ["H"] = "ה", ["h"] = "ה", ["Ḩ"] = "ע", ["ḩ"] = "ע", ["Ħ"] = "ח", ["ħ"] = "ח", ["I"] = "אִ", ["i"] = "אִ", ["J"] = "י", ["j"] = "י", ["K"] = "כּ", ["k"] = "כּ", ["L"] = "ל", ["l"] = "ל", ["M"] = "מ", ["m"] = "מ", ["N"] = "נ", ["n"] = "נ", ["O"] = "אָ", ["o"] = "אָ", ["P"] = "פּ", ["p"] = "פּ", ["Q"] = "ק", ["q"] = "ק", ["R"] = "ר", ["r"] = "ר", ["S"] = "ס", ["s"] = "ס", ["Ş"] = "ש", ["ş"] = "ש", ["T"] = "ת", ["t"] = "ת", ["U"] = "אוּ", ["u"] = "אוּ", ["V"] = "ב", ["v"] = "ב", ["X"] = "כ", ["x"] = "כ", ["Y"] = "או", ["y"] = "או", ["Z"] = "ז", ["z"] = "ז"}

-- Keep in mind RTL issues when viewing the following:
local he_to_final = {["כ"] = "ך", ["מ"] = "ם", ["נ"] = "ן", ["פ"] = "ף", ["צ"] = "ץ"}

local function tr_he(text)
    text = mw.ustring.gsub(text, "אוּ", "u")
    text = mw.ustring.gsub(text, ".%f[^א].", tt_he_a2)
    text = mw.ustring.gsub(text, ".%f[׳ּ'].", tt_he_dg)
    text = mw.ustring.gsub(text, ".", tt_he)
    return text
end

local function tr_cy(text)
    text = mw.ustring.gsub(text, ".%f[ӀIІӏiіЬьЪъ].", tt_cy_2)
    text = mw.ustring.gsub(text, ".", tt_cy)
    return text
end

function export.tr(text, lang, sc)
    if not sc then sc = require("scripts").findBestScript(text, require("languages").getByCode(lang or "jdt")):getCode() end

    if sc == "Hebr" then
        text = tr_he(text)
    elseif sc == "Cyrl" then
        text = tr_cy(text)
    else
        text = nil
    end

    return text
end

function export.ipa(text, lang, sc)
    if type(text) == "table" then
        local args = text:getParent().args
        text = args[1] ~= "" and args[1] or mw.title.getCurrentTitle().subpageText
        lang = args["lang"] ~= "" and args["lang"] or "jdt"
        sc = args["sc"] ~= "" and args["sc"]
    end
    return (mw.ustring.gsub(export.tr(text, lang, sc) or text, ".", tt_ipa))
end

function export.la(text, lang, sc)
    if type(text) == "table" then
        local args = text:getParent().args
        text = args[1] ~= "" and args[1] or mw.title.getCurrentTitle().subpageText
        lang = args["lang"] ~= "" and args["lang"] or "jdt"
        sc = args["sc"] ~= "" and args["sc"]
    end
    return (export.tr(text, lang, sc) or text)
end

function export.cy(text, lang, sc)
    if type(text) == "table" then
        local args = text:getParent().args
        text = args[1] ~= "" and args[1] or mw.title.getCurrentTitle().subpageText
        lang = args["lang"] ~= "" and args["lang"] or "jdt"
        sc = args["sc"] ~= "" and args["sc"]
    end
    return (mw.ustring.gsub(export.tr(text, lang, sc) or text, ".", tt_tocy))
end

local function he_finals_replacer(letter, rest) return (he_to_finals[letter] .. rest) end

local function he_finals(text)
    -- Keep in mind RTL issues when viewing the following pattern:
    text = mw.ustring.gsub(text, "([כמנפצ])([^א-ת]-%f[%s־-])", he_finals_replacer)
    return text
end

function export.he(text, lang, sc)
    if type(text) == "table" then
        local args = text:getParent().args
        text = args[1] ~= "" and args[1] or mw.title.getCurrentTitle().subpageText
        lang = args["lang"] ~= "" and args["lang"] or "jdt"
        sc = args["sc"] ~= "" and args["sc"]
    end
    return he_finals(mw.ustring.gsub(export.tr(text, lang, sc) or text, ".", tt_tohe))
end

return export
