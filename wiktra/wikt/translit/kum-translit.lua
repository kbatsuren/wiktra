local export = {}

local digraphs = {["гь"] = "h", ["Гь"] = "H", ["гъ"] = "ğ", ["Гъ"] = "Ğ", ["уь"] = "ü", ["Уь"] = "Ü", ["къ"] = "q", ["Къ"] = "Q", ["нг"] = "ñ", ["Нг"] = "Ñ", ["оь"] = "ö", ["Оь"] = "Ö"}

local single_letters = {["а"] = "a", ["А"] = "A", ["б"] = "b", ["Б"] = "B", ["в"] = "w", ["В"] = "w", ["г"] = "g", ["Г"] = "G", ["д"] = "d", ["Д"] = "D", ["е"] = "e", ["Е"] = "E", ["ё"] = "yo", ["Ё"] = "Yo", ["ж"] = "j", ["Ж"] = "J", ["з"] = "z", ["З"] = "Z", ["и"] = "i", ["И"] = "İ", ["й"] = "y", ["Й"] = "Y", ["к"] = "k", ["К"] = "K", ["л"] = "l", ["Л"] = "L", ["м"] = "m", ["М"] = "M", ["н"] = "n", ["Н"] = "N", ["о"] = "o", ["О"] = "O", ["п"] = "p", ["П"] = "P", ["р"] = "r", ["Р"] = "R", ["с"] = "s", ["С"] = "S", ["т"] = "t", ["Т"] = "T", ["у"] = "u", ["У"] = "U", ["ф"] = "f", ["Ф"] = "F", ["х"] = "x", ["Х"] = "X", ["ц"] = "ts", ["Ц"] = "Ts", ["ч"] = "ç", ["Ч"] = "Č", ["ш"] = "ş", ["Ш"] = "Ş", ["щ"] = "şç", ["Щ"] = "Şç", ["ъ"] = "", ["Ъ"] = "", ["ы"] = "ı", ["Ы"] = "I", ["ь"] = "ʹ", ["Ь"] = "ʹ", ["э"] = "e", ["Э"] = "E", ["ю"] = "yu", ["Ю"] = "Yu", ["я"] = "ya", ["Я"] = "Ya"}

function export.tr(text, lang, sc)
    for digraph, replacement in pairs(digraphs) do text = mw.ustring.gsub(text, digraph, replacement) end

    text = mw.ustring.gsub(text, "()([ЕеЮюЁё])", function(pos, iotated)
        -- modifier letter apostrophe or right single quotation mark
        local preceding = mw.ustring.sub(text, math.max(1, pos - 2), math.max(0, pos - 1))
        local capital = iotated == "Е" or iotated == "Ю"
        local lower = mw.ustring.lower(iotated)

        local translit
        if preceding == "" or mw.ustring.match(preceding, "[АОӨӘУЫЕЯЁЮИЕаоөәуыэяёюиеъь%A][́̀]?$") then
            if capital then
                if lower == "ю" then
                    return "Yu"
                elseif lower == "ё" then
                    return "Yo"
                else
                    return "Ye"
                end
            else
                if lower == "ю" then
                    return "yu"
                elseif lower == "ё" then
                    return "yo"
                else
                    return "ye"
                end
            end
        else
            if capital then
                if lower == "ю" then
                    return "Ü"
                elseif lower == "ё" then
                    return "Ö"
                else
                    return "E"
                end
            else
                if lower == "ю" then
                    return "ü"
                elseif lower == "ё" then
                    return "ö"
                else
                    return "e"
                end
            end
        end
        return translit
    end)

    return (mw.ustring.gsub(text, ".", single_letters))
end

return export
