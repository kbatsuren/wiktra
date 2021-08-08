local export = {}

function export.tr(text, lang, sc)
    text = require("Cans-translit").tr(text, lang, sc)
    text = mw.ustring.gsub(text, "ī", "ii")
    text = mw.ustring.gsub(text, "ō", "oo")
    text = mw.ustring.gsub(text, "ā", "aa")
    text = mw.ustring.gsub(text, "š", "sh")
    text = mw.ustring.gsub(text, "ð", "th")
    return text
end

function export.transcribe(text)
    local replace = {"sh", "th", "hk", "kw", "sk"}
    local s = "ᐁᐃᐅᐊᐯᐱᐳᐸᑌᑎᑐᑕᑫᑭᑯᑲᒉᒋᒍᒐᒣᒥᒧᒪᓀᓂᓄᓇᓭᓯᓱᓴᔦᔨᔪᔭᖊᖋᖌᖍᕃᕆᕊᕍᔐᔑᔓᔕᕓᕕᕗᕙᘚᘛᘕᘔᓓᓕᓗᓚ"
    local s_tr1 = "0ptkcmnsyrl1f2z"
    local s_tr2 = "eioa"
    local w = "ᐍᐏᐓᐘᐻᐽᑁᑅᑘᑚᑞᑢᑵᑷᑻᑿᒓᒕᒙᒝᒭᒯᒳᒷᓊ ᓌ ᓷᓹᓽᔁᔰᔲᔶᔺᔘᔚᔞᔢᓝᓟᓣᓧ"
    local w_tr1 = "0ptkcmnsyrz"
    local w_tr2 = "eioa"
    local l = "ᐄᐆᐋᐲᐴᐹᑏᑑᑖᑮᑰᑳᒌᒎᒑᒦᒨᒫᓃᓅᓈᓰᓲᓵᔩᔫᔮᕇᕋᕎᔒᔔᔖᕖᕘᕚᓖᓘᓛᐐᐔᐙ"
    local l_tr1 = "0ptkcmnsyr1flw23"
    local l_tr2 = "īōā"
    local f = "ᐤᐦᕽᑉᑦᒡᒃᒻᓐᔅᔥᔾᓪᕐ‡ᒄᔉ"
    local f_tr = "wh3ptckmns1ylr45"
    text = mw.ustring.gsub(text, "ê", "e")
    text = mw.ustring.gsub(text, "u", "o")
    text = mw.ustring.gsub(text, "ii", "ī")
    text = mw.ustring.gsub(text, "oo", "ō")
    text = mw.ustring.gsub(text, "aa", "ā")
    text = mw.ustring.gsub(text, "([aeioīōā])(w?[aeioīōā])", "%1 0%2")
    text = mw.ustring.gsub(text, "^(w?[aeioīōā])", " 0%1")
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
