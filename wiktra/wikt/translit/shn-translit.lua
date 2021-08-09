local export = {}
local u = mw.ustring.char
local gsub = mw.ustring.gsub
local match = mw.ustring.match

local initial_table = {["ၵ"] = "k", ["ၶ"] = "kh", ["ၷ"] = "g", ["ꧠ"] = "gh", ["င"] = "ng", ["ၸ"] = "ts", ["ꧡ"] = "tsh", ["ၹ"] = "z", ["ꧢ"] = "zh", ["ၺ"] = "ny", ["ꩦ"] = "tt", ["ꩧ"] = "tth", ["ꩨ"] = "dd", ["ꩩ"] = "ddh", ["ꧣ"] = "nn", ["တ"] = "t", ["ထ"] = "th", ["ၻ"] = "d", ["ꩪ"] = "dh", ["ၼ"] = "n", ["ပ"] = "p", ["ၽ"] = "ph", ["ၾ"] = "f", ["ၿ"] = "b", ["ꧤ"] = "bh", ["မ"] = "m", ["ယ"] = "y", ["ရ"] = "r", ["လ"] = "l", ["ဝ"] = "w", ["ႀ"] = "x", ["သ"] = "s", ["ႁ"] = "h", ["ꩮ"] = "ll", ["ဢ"] = "ʼ"}

local glide_table = {["ျ"] = "j", ["ြ"] = "r", ["ႂ"] = "w", [""] = ""}

local vowel_table = {[""] = "a", ["ၢ"] = "aa", ["ိ"] = "i", ["ဵ"] = "e", ["ႅ"] = "ae", ["ု"] = "u", ["ူ"] = "uu", ["ွ"] = "oa", ["ို"] = "ue", ["ိူ"] = "oe", ["ႃ"] = "aa", ["ီ"] = "ii", ["ေ"] = "ee", ["ႄ"] = "aae", ["ူဝ်"] = "o", ["ေႃ"] = "oa", ["ိုဝ်"] = "ue", ["ိူဝ်"] = "oe", ["ႆ"] = "ay", ["ႆၢ"] = "aay", ["ၢႆ"] = "aay", ["ုၺ်"] = "uy", ["ူၺ်"] = "oy", ["ွႆ"] = "oay", ["ိုၺ်"] = "uey", ["ိူၺ်"] = "oey", ["ဝ်"] = "aw", ["ၢဝ်"] = "aaw", ["ိဝ်"] = "iw", ["ဵဝ်"] = "ew", ["ႅဝ်"] = "aew", ["ႂ်"] = "aue"}

local coda_table = {["မ်"] = "m", ["ၼ်"] = "n", ["င်"] = "ng", ["ပ်"] = "p", ["တ်"] = "t", ["ၵ်"] = "k", [""] = ""}

local tone_table = {[""] = u(0x030C), ["ႇ"] = u(0x0300), ["ႈ"] = u(0x0304), ["း"] = u(0x0301), ["ႉ"] = u(0x0302) .. u(0x0330), ["ႊ"] = u(0x1DC8)}

local digits = {["႐"] = "0", ["႑"] = "1", ["႒"] = "2", ["႓"] = "3", ["႔"] = "4", ["႕"] = "5", ["႖"] = "6", ["႗"] = "7", ["႘"] = "8", ["႙"] = "9", ["၀"] = "0", ["၁"] = "1", ["၂"] = "2", ["၃"] = "3", ["၄"] = "4", ["၅"] = "5", ["၆"] = "6", ["၇"] = "7", ["၈"] = "8", ["၉"] = "9"}

local syllable_pattern = "^([ၵၶၷꧠငၸꧡၹꧢၺꩦꩧꩨꩩꧣတထၻꩪၼပၽၾၿꧤမယရလဝႀသႁꩮဢ])" .. "([ျြႂ]?)" .. "([ဝွႂႃိီုူေႄဵႅၢႆ်]*)" .. "([မၼငၺပတၵ]?်?)" .. "([ႇႈးႉႊ]?)$"

local repeat_syllabify = "([^ ])([ၵၶၷꧠငၸꧡၹꧢၺꩦꩧꩨꩩꧣတထၻꩪၼပၽၾၿꧤမယရလဝႀသႁꩮဢ][^်])"

function export.tr(text, lang, sc)
    text = gsub(text, ".", digits)
    while match(text, repeat_syllabify) do text = gsub(text, repeat_syllabify, "%1 %2") end
    for old in mw.text.gsplit(text, " ") do
        new = gsub(old, syllable_pattern, function(initial, glide, vowel, coda, tone)
            local untoned = initial_table[initial] .. (vowel_table[glide .. vowel .. coda] or glide_table[glide] .. (vowel_table[vowel .. coda] or (vowel_table[vowel] or vowel) .. (coda_table[coda] or coda)))
            return gsub(untoned, "([aeiou])", "%1" .. tone_table[tone], 1)
        end)
        text = gsub(text, old, new, 1)
    end
    if not match(text, "[က-႟ꩠ-ꩿꧠ-ꧾ]") then
        return text
    else
        return nil
    end
end

return export
