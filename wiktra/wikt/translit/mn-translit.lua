local export = {}

local trfunc = {}

local tt_Cyrl = {
    ["Щ"] = "Sh",
    ["щ"] = "sh",
    ["Ы"] = "Y",
    ["ы"] = "y",
    ["Э"] = "E",
    ["э"] = "e",
    ["Я"] = "Ya",
    ["я"] = "ya",
    ["У"] = "U",
    ["у"] = "u",
    ["С"] = "S",
    ["с"] = "s",
    ["Ч"] = "Ch",
    ["ч"] = "ch",
    ["Х"] = "Kh",
    ["х"] = "kh",
    ["Ж"] = "J",
    ["ж"] = "j",
    ["Д"] = "D",
    ["д"] = "d",
    ["В"] = "V",
    ["в"] = "v",
    ["А"] = "A",
    ["а"] = "a",
    ["М"] = "M",
    ["м"] = "m",
    ["О"] = "O",
    ["о"] = "o",
    ["И"] = "I",
    ["и"] = "i",
    ["К"] = "K",
    ["к"] = "k",
    ["Ш"] = "Sh",
    ["ш"] = "sh",
    ["Ъ"] = "I",
    ["ъ"] = "i",
    ["Ё"] = "Yo",
    ["ё"] = "yo",
    ["Ь"] = "I",
    ["ь"] = "i",
    ["Ю"] = "Yu",
    ["ю"] = "yu",
    ["Т"] = "T",
    ["т"] = "t",
    ["Р"] = "R",
    ["р"] = "r",
    ["Ц"] = "Ts",
    ["ц"] = "ts",
    ["Ф"] = "F",
    ["ф"] = "f",
    ["З"] = "Z",
    ["з"] = "z",
    ["Е"] = "E",
    ["е"] = "e",
    ["Г"] = "G",
    ["г"] = "g",
    ["Б"] = "B",
    ["б"] = "b",
    ["Н"] = "N",
    ["н"] = "n",
    ["П"] = "P",
    ["п"] = "p",
    ["Й"] = "I",
    ["й"] = "i",
    ["Л"] = "L",
    ["л"] = "l",
    ["Ү"] = "Ü",
    ["ү"] = "ü",
    ["Ө"] = "Ö",
    ["ө"] = "ö"
}

local tt_Mong = {["ᠠ"] = "a", ["ᠡ"] = "e", ["ᠢ"] = "i", ["ᠣ"] = "o", ["ᠤ"] = "u", ["ᠥ"] = "ö", ["ᠦ"] = "ü", ["ᠧ"] = "ē", ["ᠨ"] = "n", ["ᠩ"] = "ng", ["ᠪ"] = "b", ["ᠫ"] = "p", ["ᠬ"] = "q", ["ᢉ"] = "k", ["ᠭ"] = "ɣ", ["ᢉ"] = "g", ["ᠮ"] = "m", ["ᠯ"] = "l", ["ᠰ"] = "s", ["ᠱ"] = "š", ["ᠲ"] = "t", ["ᠳ"] = "d", ["ᠴ"] = "č", ["ᠵ"] = "ǰ", ["ᠶ"] = "y", ["ᠷ"] = "r", ["ᠸ"] = "w", ["ᠹ"] = "f", ["ᠺ"] = "g", ["ᠻ"] = "k", ["ᠼ"] = "c", ["ᠽ"] = "z", ["ᠾ"] = "h", ["ᠿ"] = "ž", ["ᡀ"] = "lh", ["ᡁ"] = "zh", ["ᡂ"] = "ch", ["᠋"] = "", ["᠌"] = "", ["᠍"] = "", ["᠎"] = "-", ["︖"] = "?", ["︕"] = "!", ["᠂"] = ",", ["᠃"] = ".", [" "] = "-", ["᠊"] = "-"}

function trfunc.Cyrl(text)
    text = mw.ustring.gsub(text, "([АОУЫЕЯЁЮИЕЪЬаоуыэяёюиеъь%A][\204\129\204\128]?)([Ее])", function(a, e) return a .. (e == "е" and "ye" or "Ye") end):gsub("^Е", "Ye"):gsub("^е", "ye")
    return (mw.ustring.gsub(text, ".", tt_Cyrl))
end

function trfunc.Mong(text)
    local velar_conv = {["q"] = "k", ["ɣ"] = "g"}
    text = mw.ustring.gsub(text, ".", tt_Mong)
    text = mw.ustring.gsub(text, "([qɣ])(.?)", function(velar, vowel) return ((mw.ustring.match(vowel, "[eöü ]") or vowel == "") and mw.ustring.gsub(velar, "[qɣ]", velar_conv) or velar) .. vowel end)
    return text
end

function export.tr(text, lang, sc)
    if not sc then
        sc = require("scripts").findBestScript(text, require("languages").getByCode("mn"))
        if sc then
            sc = sc:getCode()
        else
            return nil
        end
    end

    local func = trfunc[sc]
    if func then return trfunc[sc](text) end
end

return export
