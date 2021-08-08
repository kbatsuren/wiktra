local export = {}
local gsub = mw.ustring.gsub
local match = mw.ustring.match

function export.tr(word, lang, sc)
    -- remove hanja
    word = gsub(word, " *%([一-鿿㐀-䶿]+%)", "")
    word = gsub(word, " *%([一-鿿㐀-䶿]*'''[一-鿿㐀-䶿]+'''[一-鿿㐀-䶿]*%)", "")

    -- transform em-dash to plain hyphen-minus
    word = gsub(word, "—", "-")

    if match(word, "^[ㅂㅈㄷㄱㅅㅁㄴㅇㄹㅎㅋㅌㅊㅍㄸㅃㅉㄲㅆㅛㅕㅑㅐㅔㅗㅓㅏㅣㅠㅜㅡㅖㅒ%-]+$") then return (gsub(word, "[ㅂㅈㄷㄱㅅㅁㄴㅇㄹㅎㅋㅌㅊㅍㄸㅃㅉㄲㅆㅛㅕㅑㅐㅔㅗㅓㅏㅣㅠㅜㅡㅖㅒ]", {["ㅂ"] = "b", ["ㅈ"] = "j", ["ㄷ"] = "d", ["ㄱ"] = "g", ["ㅅ"] = "s", ["ㅁ"] = "m", ["ㄴ"] = "n", ["ㅇ"] = "/", ["ㄹ"] = "l", ["ㅎ"] = "h", ["ㅋ"] = "k", ["ㅌ"] = "t", ["ㅊ"] = "ch", ["ㅍ"] = "p", ["ㄸ"] = "tt", ["ㅃ"] = "pp", ["ㅉ"] = "jj", ["ㄲ"] = "kk", ["ㅆ"] = "ss", ["ㅛ"] = "yo", ["ㅕ"] = "yeo", ["ㅑ"] = "ya", ["ㅐ"] = "ae", ["ㅔ"] = "e", ["ㅗ"] = "o", ["ㅓ"] = "eo", ["ㅏ"] = "a", ["ㅣ"] = "i", ["ㅠ"] = "yu", ["ㅜ"] = "u", ["ㅡ"] = "eu", ["ㅖ"] = "ye", ["ㅒ"] = "yae"})) end

    if not match(word, "[가-힣]") then return nil end

    -- transform compat jamo into a form [[Module:ko-pron]] can handle
    -- for [[-ㅂ니까]] [[-ㅁ둥]] etc.
    -- could be moved to [[Module:ko-pron]]
    if match(word, "%-[ㅂㅈㄷㄱㅅㅁㄴㅇㄹㅎㅋㅌㅊㅍㄲㅆ]") then word = gsub(word, "[ㅂㅈㄷㄱㅅㅁㄴㅇㄹㅎㅋㅌㅊㅍㄲㅆ]", {["ㅂ"] = "ᆸ", ["ㅈ"] = "ᆽ", ["ㄷ"] = "ᆮ", ["ㄱ"] = "ᆨ", ["ㅅ"] = "ᆺ", ["ㅁ"] = "ᆷ", ["ㄴ"] = "ᆫ", ["ㅇ"] = "ᆼ", ["ㄹ"] = "ᆯ", ["ㅎ"] = "ᇂ", ["ㅋ"] = "ᆿ", ["ㅌ"] = "ᇀ", ["ㅊ"] = "ᆾ", ["ㅍ"] = "ᇁ", ["ㄲ"] = "ᆩ", ["ㅆ"] = "ᆻ"}) end

    local m_pron = require("ko-pron")
    local revised = m_pron.romanise(word, 2, {}, true)

    if not revised then return nil end

    if match(revised, "[%.%?%!]") then
        revised = mw.ustring.upper(mw.ustring.sub(revised, 1, 1)) .. mw.ustring.sub(revised, 2, -1)
        revised = gsub(revised, "([%.%?%!]) ([a-z%'])", "%1 ^%2")
        revised = gsub(revised, "^%'%'%'", "'''^")
    end
    revised = gsub(revised, "%^%'%'%'", "'''^")
    revised = gsub(revised, "%^%l", mw.ustring.upper)
    revised = gsub(revised, "%^", "")
    revised = gsub(revised, "%-'''%-", "'''-")
    revised = gsub(revised, "%-%-", "-")

    return revised
end

export.tr_revised = export.tr

return export
