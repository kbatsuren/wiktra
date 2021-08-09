local export = {}

function export.tr(text, lang, sc)
    text = require("Cans-translit").tr(text, lang, sc)
    text = mw.ustring.gsub(text, "o", "u")
    text = mw.ustring.gsub(text, "ī", "ii")
    text = mw.ustring.gsub(text, "ō", "uu")
    text = mw.ustring.gsub(text, "ā", "aa")
    text = mw.ustring.gsub(text, "š", "sh")
    text = mw.ustring.gsub(text, "ð", "th")
    text = mw.ustring.gsub(text, "c", "ch")
    return text
end

function export.transcribe(text)
    local replace = {"ch", "sh", "th", "kw"}
    local s = "ᐁᐃᐅᐊᐯᐱᐳᐸᑌᑎᑐᑕᑫᑭᑯᑲᒉᒋᒍᒐᒣᒥᒧᒪᓀᓂᓄᓇᓓᓕᓗᓚᓭᓯᓱᓴᔐᔑᔓᔕᔦᔨᔪᔭᕃᕆᕊᕍᕓᕕᕗᕙᕞᕠᕤᕦ"
    local s_tr1 = "0ptk1mnls2yrv3"
    local s_tr2 = "eiua"
    local w = "ᐍᐏᐓᐘᐻ  ᑅᑘ  ᑢᑵ  ᑿᒓ  ᒝᒭ  ᒷᓊ  ᓌᓝ  ᓧᓷ  ᔁᔘ  ᔢᔰ  ᔺᣎ  ᕎᐧᕓ  ᕛᐧᕞ  ᕨ"
    local w_tr1 = "0ptk1mnls2yrv3"
    local w_tr2 = "eiua"
    local l = "ᐄᐆᐋᐲᐴᐹᑏᑑᑖᑮᑰᑳᒌᒎᒑᒦᒨᒫᓃᓅᓈᓖᓘᓛᓰᓲᓵᔒᔔᔖᔩᔫᔮᕇᕋᕎᕖᕘᕚᕢᕥᕧᐐᐔᐙ"
    local l_tr1 = "0ptk1mnls2yr1v3w"
    local l_tr2 = "īūā"
    local f = "ᐤᐦᑉᑦᒃᒄᒡᒻᓐᓪᔅᔥᔾᕐᕝᕪ"
    local f_tr = "uhptk41mnls2yrv3"
    text = mw.ustring.gsub(text, "ê", "e")
    text = mw.ustring.gsub(text, "u", "u")
    text = mw.ustring.gsub(text, "ii", "ī")
    text = mw.ustring.gsub(text, "uu", "ū")
    text = mw.ustring.gsub(text, "aa", "ā")
    text = mw.ustring.gsub(text, "([aeiuīūā])(w?[aeiuīūā])", "%1 0%2")
    text = mw.ustring.gsub(text, "^(w?[aeiuīūā])", " 0%1")
    text = mw.ustring.gsub(text, " 0", "0")
    mw.log(text)
    text = mw.ustring.gsub(text, "([" .. w_tr1 .. "])w([" .. w_tr2 .. "])", function(a, b)
        a = w_tr1:find(a)
        b = w_tr2:find(b)
        local i = a * 4 + b - 4
        return mw.ustring.sub(w, i, i)
    end)
    for i = 1, 3 do text = mw.ustring.gsub(text, replace[i], tostring(i)) end
    mw.log(text)
    text = mw.ustring.gsub(text, "([" .. s_tr1 .. "])([" .. s_tr2 .. "])", function(a, b)
        a = s_tr1:find(a)
        b = s_tr2:find(b)
        local i = a * 4 + b - 4
        return mw.ustring.sub(s, i, i)
    end)
    text = mw.ustring.gsub(text, "([" .. l_tr1 .. "])([" .. l_tr2 .. "])", function(a, b)
        a = l_tr1:find(a)
        b = l_tr2:find(b)
        local i = a * 3 + b - 3
        return mw.ustring.sub(l, i, i)
    end)
    for i = 4, 5 do text = mw.ustring.gsub(text, replace[i], tostring(i)) end
    mw.log(text)
    text = mw.ustring.gsub(text, "([" .. f_tr .. "])", function(a)
        a = f_tr:find(a)
        return mw.ustring.sub(f, a, a)
    end)
    return text
end

return export
