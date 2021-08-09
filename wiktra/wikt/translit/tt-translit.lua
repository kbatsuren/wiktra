local export = {}

local tt = {
    ["ү"] = "ü",
    ["Ү"] = "Ü",
    ["т"] = "t",
    ["Т"] = "T",
    ["р"] = "r",
    ["Р"] = "R",
    ["ф"] = "f",
    ["Ф"] = "F",
    ["ю"] = "yu",
    ["Ю"] = "Yu",
    ["ш"] = "ş",
    ["Ш"] = "Ş",
    ["ь"] = "’",
    ["Ь"] = "’",
    ["ъ"] = "ʺ",
    ["Ъ"] = "ʺ",
    ["н"] = "n",
    ["Н"] = "N",
    ["п"] = "p",
    ["П"] = "P",
    ["й"] = "y",
    ["Й"] = "Y",
    ["л"] = "l",
    ["Л"] = "L",
    ["з"] = "z",
    ["З"] = "Z",
    ["е"] = "e",
    ["Е"] = "E",
    ["г"] = "g",
    ["Г"] = "G",
    ["б"] = "b",
    ["Б"] = "B",
    ["у"] = "u",
    ["У"] = "U",
    ["с"] = "s",
    ["С"] = "S",
    ["х"] = "x",
    ["Х"] = "X",
    ["ч"] = "ç",
    ["Ч"] = "Ç",
    ["щ"] = "şç",
    ["Щ"] = "Şç",
    ["я"] = "ya",
    ["Я"] = "Ya",
    ["ы"] = "ı",
    ["Ы"] = "I",
    ["э"] = "e",
    ["Э"] = "E",
    ["м"] = "m",
    ["М"] = "M",
    ["о"] = "o",
    ["О"] = "O",
    ["ө"] = "ö",
    ["Ө"] = "Ö",
    ["и"] = "i",
    ["И"] = "İ",
    ["ё"] = "yo",
    ["Ё"] = "Yo",
    ["ж"] = "j",
    ["Ж"] = "J",
    ["к"] = "k",
    ["К"] = "K",
    ["д"] = "d",
    ["Д"] = "D",
    ["в"] = "w",
    ["В"] = "W",
    ["ц"] = "ts",
    ["Ц"] = "Ts",
    ["а"] = "a",
    ["А"] = "A",
    ["ң"] = "ñ",
    ["Ң"] = "Ñ",
    ["җ"] = "c",
    ["Җ"] = "C",
    ["һ"] = "h",
    ["Һ"] = "H",
    ["ә"] = "ä",
    ["Ә"] = "Ä"
};

function export.tr(text, lang, sc)
    text = mw.ustring.gsub(text, "([АОӘУЫЕЯЁЮИЕаоәуыэяёюиеъь%A][́̀]?)([Ее])", function(a, e) return a .. (e == "е" and "ye" or "Ye") end)

    text:gsub("^Е", "Ye"):gsub("^е", "ye"):gsub("ия$", "iyä") -- not last word end handled in code end

    -- Deal with dual nature of к, г, transliterated either to "front" variants
    -- k/g or "back" variants q/ğ. The back variants occur before hard signs
    -- (Ъ/ъ), which then disappear, and also in the vicinity of the back vowels
    -- а/о/у/ы (and their capital equivalents А/О/У/Ы). The code below that
    -- handles this appears to say that the sound of word-initial к/г is
    -- determined by the following vowel, and the sound of non-word-initial
    -- к/г is determined by the preceding vowel. FIXME: Not sure if this is
    -- correct.

    local t = {["К"] = "Q", ["к"] = "q", ["Г"] = "Ğ", ["г"] = "ğ"}
    text = mw.ustring.gsub(text, "([КкГг])([Ъъ])", function(a, b) return t[a] end)
    text = mw.ustring.gsub(text, "(%a?)([КкГг])(.?)", function(b, c, a) return b .. (mw.ustring.match(b > "" and b or a, "[АОУЫаоуы]") and t[c] or tt[c]) .. a end)

    return (mw.ustring.gsub(mw.ustring.gsub(text, "ия%A", "iyä"), ".", tt))
end

return export
