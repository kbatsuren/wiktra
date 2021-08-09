local export = {}

local tt = {["а"] = "a", ["б"] = "b", ["щ"] = "c", ["ч"] = "ç", ["д"] = "d", ["ә"] = "e", ["е"] = "ê", ["э"] = "ê", ["ф"] = "f", ["г"] = "g", ["h"] = "h", ["ь"] = "i", ["и"] = "î", ["ж"] = "j", ["к"] = "k", ["л"] = "l", ["м"] = "m", ["н"] = "n", ["о"] = "o", ["п"] = "p", ["ԛ"] = "q", ["р"] = "r", ["с"] = "s", ["ш"] = "ş", ["т"] = "t", ["ӧ"] = "u", ["у"] = "û", ["в"] = "v", ["ԝ"] = "w", ["х"] = "x", ["й"] = "y", ["з"] = "z", ["А"] = "A", ["Б"] = "B", ["Щ"] = "C", ["Ч"] = "Ç", ["Д"] = "D", ["Ә"] = "E", ["Е"] = "Ê", ["Э"] = "Ê", ["Ф"] = "F", ["Г"] = "G", ["H"] = "H", ["Ь"] = "I", ["И"] = "Î", ["Ж"] = "J", ["К"] = "K", ["Л"] = "L", ["М"] = "M", ["Н"] = "N", ["О"] = "O", ["П"] = "P", ["Ԛ"] = "Q", ["Р"] = "R", ["С"] = "S", ["Ш"] = "Ş", ["Т"] = "T", ["Ӧ"] = "U", ["У"] = "Û", ["В"] = "V", ["ԝ"] = "W", ["Х"] = "X", ["Й"] = "Y", ["З"] = "Z", ["г’"] = "ẍ", ["Г’"] = "Ẍ", ["h’"] = "ḧ", ["H’"] = "Ḧ"};

function export.tr(text, lang, sc)
    text = mw.ustring.gsub(text, "[ГгHh]’", tt)

    text = mw.ustring.gsub(text, ".", tt)

    text = mw.ustring.gsub(text, "^([rR])’", "%1") -- р’ож: roj
    text = mw.ustring.gsub(text, "([rR])’", "%1%1") -- пьр’: pirr

    local consonants = "bcçdfghḧjklmnpqrsştvwxẍzBCÇDFGHḦJKLMNPQRSŞTVWXẌZ"
    local vowels = "aeêiîouûAEÊIÎOUÛ"

    -- handle ә’
    text = mw.ustring.gsub(text, "()([eE])’", function(pos, e)
        if pos == 1 then -- ә’ at beginning of string
            local after1, after2 = mw.ustring.match(text, "^(.?)(.?)", pos + 2)
            if consonants:find(after1) and (after2 == "" -- followed by single consonant: ә’к → 'ek
            or consonants:find(after2)) then -- followed by two consonants: ә’скәр → 'esker
                return "'" .. e
            end
        else
            local before = mw.ustring.sub(text, pos - 1, pos - 1)
            if vowels:find(before) then -- preceded by vowel: щьмаә’т → cima'et
                return "'" .. e
            end
        end

        return e .. "'"
    end)

    return text
end

return export
