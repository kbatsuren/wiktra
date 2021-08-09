local export = {}
-- to be discussed: not to create this module, but create individual modules instead?

local UTF8_char = "[%z\1-\127\194-\244][\128-\191]*"

local function iter_char(str) return string.gmatch(str, UTF8_char) end

local function len(str)
    local _, length = string.gsub(str, UTF8_char, "")
    return length
end

local function fetch(str, index)
    local i = 0
    for char in iter_char(str) do
        i = i + 1
        if i == index then return char end
    end
    return ""
end

function export.tr(text, lang, sc)
    local data = {
        { -- short-vowel
            "ᐁᐃᐅᐊᐯᐱᐳᐸᑌᑎᑐᑕᑫᑭᑯᑲᒉᒋᒍᒐᒣᒥᒧᒪᓀᓂᓄᓇᓭᓯᓱᓴᔦᔨᔪᔭᖊᖋᖌᖍᕃᕆᕈᕍᕂᕄᕊᕋᔐᔑᔓᔕᕓᕕᕗᕙᕞᕠᕤᕦᘚᘛᘕᘔᓓᓕᓗᓚᙯᕿᖁᖃᙰᖏᖑᖓ ᙱᙳᙵᕴᕵᕷᕹ", "1ptkcmnsyrrršfðzlq23h", {"", "ng", "nng"}, "eioa", function(a, b) return a .. b end
        }, { -- w
            "ᐌᐍᐎᐏᐒᐓᐗᐘᐺᐻᐼᐽᑀᑁᑄᑅᑗᑘᑙᑚᑝᑞᑡᑢᑴᑵᑶᑷᑺᑻᑾᑿᒒᒓᒔᒕᒘᒙᒜᒝᒬᒭᒮᒯᒲᒳᒶᒷ" .. "ᓉᓊ  ᓋᓌ  ᓶᓷᓸᓹᓼᓽᔀᔁᔯᔰᔱᔲᔵᔶᔹᔺᔗᔘᔙᔚᔝᔞᔡᔢᓜᓝᓞᓟᓢᓣᓦᓧ", "1ptkcmnsyrz", {""}, "eeiiooaa", function(a, b) return a .. "w" .. b end
        }, { -- long-vowel
            "ᐄᐆᐋᐲᐴᐹᑏᑑᑖᑮᑰᑳᒌᒎᒑᒦᒨᒫᓃᓅᓈᓰᓲᓵᔩᔫᔮᕇᕉᕌᔒᔔᔖᕖᕘᕚᕢᕥᕧᓖᓘᓛᐐᐔᐙᖀᖂᖄᕶᕸᕺ", "1ptkcmnsyršfðlwqh", {""}, "īōā", function(a, b) return a .. b end
        }, { -- w-long
            "ᐐᐑᐔᐕᐖᐙᐚᐛᐾᐿᑂᑃ ᑆᑇᑈᑛᑜᑟᑠ ᑣᑤᑥᑸᑹᑼᑽ ᒀᒁᒂᒖᒗᒚᒛ ᒞᒟᒠᒰᒱᒴᒵ ᒸᒹᒺ     ᓍᓎᓏ" .. "ᓠᓡᓤᓥ ᓨᓩ ᓺᓻᓾᓿ ᔂᔃᔄᔛᔜᔟᔠ ᔣᔤ ᔳᔴᔷᔸ ᔻᔼᔽ     ᕎᕏ      ᕛᕜ      ᕨᕩ ", "1ptkcmnlsšyrfð", {""}, "īīōōōāāā", function(a, b) return a .. "w" .. b end
        }, { -- individual
            "ᑊᐟᐠᐨᒼᐣᐢᐧᐤᐦᕁᕽᓫᕑᑉᑦᒡᒃᒻᓐᔅᔥᔾᓪᕐᕪ‡ᒄᔉᖅᖕᖖᕝᖦᕀᕻᕼ", "ptkcmnsywh11lrptckmnsšylrðð23q45vlyhh", {"hk", "kw", "sk", "ng", "nng"}
        }
    }

    for i, item in pairs(data) do
        if item[4] then
            local length = len(item[4])
            local c = 0
            for s in iter_char(item[1]) do
                c = c + 1
                local index = math.ceil(c / length)
                local a = fetch(item[2], index)
                if tonumber(a) then a = item[3][tonumber(a)] end
                index = (c - 1) % length + 1
                local b = fetch(item[4], index)
                if s ~= " " then text = string.gsub(text, s, item[5](a, b)) end
            end
        else
            local iter1, iter2 = iter_char(item[1]), iter_char(item[2])
            while true do
                local s, a = iter1(), iter2()
                if not (s and a) then break end
                if tonumber(a) then a = item[3][tonumber(a)] end
                text = string.gsub(text, s, a)
            end
        end
    end
    return text
end

return export
