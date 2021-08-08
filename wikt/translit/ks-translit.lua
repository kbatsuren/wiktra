local export = {}

local u = mw.ustring.char

local conv = {
    -- regular consonants
    ["ب"] = "b",
    ["پ"] = "p",
    ["ت"] = "t",
    ["ٹ"] = "ṭ",
    ["ج"] = "j",
    ["چ"] = "c",
    ["د"] = "d",
    ["ڈ"] = "ḍ",
    ["ر"] = "r",
    ["ڑ"] = "ḍ",
    ["ز"] = "z",
    ["ژ"] = "ts",
    ["س"] = "s",
    ["ش"] = "sh",
    ["ف"] = "f",
    ["ک"] = "k",
    ["گ"] = "g",
    ["ل"] = "l",
    ["م"] = "m",
    ["ن"] = "n",
    ["ه"] = "h",
    ["ھ"] = "h",

    -- always word-final
    ["ے"] = "y",

    -- arabic specific letters
    ["ث"] = "th",
    ["ح"] = "ḥ",
    ["ح"] = "ẖ",
    ["ذ"] = "ḏ",
    ["ص"] = "ṣ",
    ["ض"] = "ḍ",
    ["ط"] = "ṭ",
    ["ظ"] = "ẓ",
    ["ع"] = "ʿ",
    ["غ"] = "ġ",
    ["ق"] = "q",

    -- palatalisation
    ["ۍ"] = "'",

    -- broken vowels
    ["ۄ"] = "wa",
    ["ؠ"] = "ya",

    -- a carries long vowels
    ["ٲ"] = "èa",
    ["آ"] = "aa",

    -- numerals
    ["۰"] = "0",
    ["۱"] = "1",
    ["۲"] = "2",
    ["۳"] = "3",
    ["۴"] = "4",
    ["۵"] = "5",
    ["۶"] = "6",
    ["۷"] = "7",
    ["۸"] = "8",
    ["۹"] = "9"
}

local short_vowels = {
    -- high vowels
    [u(0x0650)] = "i",
    [u(0x0655)] = "ì",
    [u(0x064F)] = "u",

    -- central vowels
    [u(0x0654)] = "è",

    -- low vowels
    [u(0x064E)] = "a"
}

local y_diacritics = {
    -- /e/
    [u(0x065B)] = "",

    -- /i:/
    [u(0x0656)] = ""
}

local w_diacritics = {
    -- /o/
    [u(0x065B)] = "",

    -- /u:/
    [u(0x0657)] = ""
}

local a_diacritics = {
    -- long closed central vowel 
    [u(0x065F)] = ""
}

local C_diacritics = { -- this is just the short vowel marker set
}

local n_diacritics = {
    -- /n/ nasalise preceding vowel, no following vowel
    [u(0x065B)] = ""
}

local r_diacritics = {
    -- /r/ cancel preceding vowel
    [u(0x065B)] = ""
}

local alif = "ا"
local waw = "و"
local ye = "ی"

function export.tr(text, lang, sc)
    text = mw.ustring.gsub(text, "([بپتٹجچدڈرڑزژسشفکگلمنهھےثححذصضطظعغقۍۄؠٲآيٖ]?)" .. "([short_vowels]?)", function(c, d)
        if d == "" then
            return conv[c]
        else
            return conv[c] .. short_vowels[d]
        end
    end)

    text = mw.ustring.gsub(text, ".", conv)

    return text
end

return export
