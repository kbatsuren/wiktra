local export = {}
local gsub = mw.ustring.gsub
local u = mw.ustring.char

local tt1 = {
    -- consonants
    ["က"] = "kə",
    ["ခ"] = "khə",
    ["ဂ"] = "ghə",
    ["ဃ"] = "xə",
    ["င"] = "ngə",
    ["စ"] = "sə",
    ["ဆ"] = "hsə",
    ["ၡ"] = "shə",
    ["ည"] = "nyə",
    ["တ"] = "tə",
    ["ထ"] = "hṭə",
    ["ဒ"] = "də",
    ["န"] = "nə",
    ["ပ"] = "pə",
    ["ဖ"] = "hpə",
    ["ဘ"] = "bə",
    ["မ"] = "mə",
    ["ယ"] = "yə",
    ["ရ"] = "rə",
    ["လ"] = "lə",
    ["ဝ"] = "wə",
    ["သ"] = "thə",
    ["ဟ"] = "hə",
    ["အ"] = "ʼə",
    ["ဧ"] = "ahh ",
    -- medials
    ["ှ"] = "ˣhgə",
    ["ၠ"] = "ˣyə",
    ["ြ"] = "ˣrə",
    ["ျ"] = "ˣlə",
    ["ွ"] = "ˣwə",
    -- dependent vowels
    ["ါ"] = "ah ",
    ["ံ"] = "ee ",
    ["ု"] = "u ",
    ["ူ"] = "oo ",
    ["ၢ"] = "uh ",
    ["့"] = "ay ",
    ["ဲ"] = "eh ",
    ["ိ"] = "oh ",
    ["ီ"] = "aw ",
    -- numerals
    ["၀"] = "0",
    ["၁"] = "1",
    ["၂"] = "2",
    ["၃"] = "3",
    ["၄"] = "4",
    ["၅"] = "5",
    ["၆"] = "6",
    ["၇"] = "7",
    ["၈"] = "8",
    ["၉"] = "9",
    -- zero-width space (display it if it hides in a word)
    [u(0x200B)] = "‼"
}

local adjust0 = {
    -- tones
    ["ၢ်"] = u(0x0331),
    ["ာ်"] = u(0x0323),
    ["း"] = u(0x0308),
    ["ၣ်"] = u(0x0300),
    ["ၤ"] = u(0x0304) -- prolonged
}

function export.tr(text, lang, sc, debug_mode)

    if type(text) == "table" then -- called directly from a template
        text = text.args[1]
    end

    for k, v in pairs(adjust0) do text = gsub(text, k, v) end
    text = gsub(text, ".", tt1)

    text = gsub(text, "əˣ", "")
    text = gsub(text, "ə([aeiou])", "%1")
    text = gsub(text, "ə", "a ")
    text = gsub(text, "%s([" .. u(0x0331) .. u(0x0323) .. u(0x0308) .. u(0x0300) .. u(0x0304) .. "])", "%1 ")
    text = gsub(text, "(.-)%s*$", "%1") -- remove space at the end

    return text

end

return export
