local export = {}

local chars = {
    ["𐀀"] = "a",
    ["𐀁"] = "e",
    ["𐀂"] = "i",
    ["𐀃"] = "o",
    ["𐀄"] = "u",

    ["𐀅"] = "da",
    ["𐀆"] = "de",
    ["𐀇"] = "di",
    ["𐀈"] = "do",
    ["𐀉"] = "du",

    ["𐀊"] = "ja",
    ["𐀋"] = "je",
    -- ji not in Unicode
    ["𐀍"] = "jo",
    ["𐀎"] = "ju",

    ["𐀏"] = "ka",
    ["𐀐"] = "ke",
    ["𐀑"] = "ki",
    ["𐀒"] = "ko",
    ["𐀓"] = "ku",

    ["𐀔"] = "ma",
    ["𐀕"] = "me",
    ["𐀖"] = "mi",
    ["𐀗"] = "mo",
    ["𐀘"] = "mu",

    ["𐀙"] = "na",
    ["𐀚"] = "ne",
    ["𐀛"] = "ni",
    ["𐀜"] = "no",
    ["𐀝"] = "nu",

    ["𐀞"] = "pa",
    ["𐀟"] = "pe",
    ["𐀠"] = "pi",
    ["𐀡"] = "po",
    ["𐀢"] = "pu",

    ["𐀣"] = "qa",
    ["𐀤"] = "qe",
    ["𐀥"] = "qi",
    ["𐀦"] = "qo",
    -- qu not in Unicode

    ["𐀨"] = "ra",
    ["𐀩"] = "re",
    ["𐀪"] = "ri",
    ["𐀫"] = "ro",
    ["𐀬"] = "ru",

    ["𐀭"] = "sa",
    ["𐀮"] = "se",
    ["𐀯"] = "si",
    ["𐀰"] = "so",
    ["𐀱"] = "su",

    ["𐀲"] = "ta",
    ["𐀳"] = "te",
    ["𐀴"] = "ti",
    ["𐀵"] = "to",
    ["𐀶"] = "tu",

    ["𐀷"] = "wa",
    ["𐀸"] = "we",
    ["𐀹"] = "wi",
    ["𐀺"] = "wo",
    -- wu not in Unicode

    ["𐀼"] = "za",
    ["𐀽"] = "ze",
    -- zi not in Unicode
    ["𐀿"] = "zo",
    -- zu not in Unicode

    ["𐁀"] = "ha",
    ["𐁁"] = "ai",
    ["𐁂"] = "au",
    ["𐁃"] = "dwe",
    ["𐁄"] = "dwo",
    ["𐁅"] = "nwo",
    ["𐁆"] = "phu",
    ["𐁇"] = "pte",
    ["𐁈"] = "rya",
    ["𐁉"] = "rai",
    ["𐁊"] = "ryo",
    ["𐁋"] = "tya",
    ["𐁌"] = "twe",
    ["𐁍"] = "two",

    ["𐁐"] = "*18",
    ["𐁑"] = "*19",
    ["𐁒"] = "*22",
    ["𐁓"] = "*34",
    ["𐁔"] = "*47",
    ["𐁕"] = "*49",
    ["𐁖"] = "*56",
    ["𐁗"] = "*63",
    ["𐁘"] = "*64",
    ["𐁙"] = "*79",
    ["𐁚"] = "*82",
    ["𐁛"] = "*83",
    ["𐁜"] = "*86",
    ["𐁝"] = "*89",

    -- explicit morpheme boundary
    ["-"] = "`"
}

function export.tr(text, lang, sc)
    local ret = {}
    local i = 1

    for c in string.gmatch(text, "[%z\1-\127\194-\244][\128-\191]*") do -- UTF-8 character pattern
        ret[i] = chars[c] or c
        i = i + 1
    end

    text = string.gsub(table.concat(ret, "-"), "%- %-", " ")
    text = string.gsub(text, "%-?`%-?", "-")

    return text
end

return export
