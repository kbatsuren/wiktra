-- TODO: long í support
-- TODO: sort out short e vs palatalisation
-- TODO: add rule for CẹC = CyaC
local u = mw.ustring.char
local gsub = mw.ustring.gsub

local export = {}

local vav = u(0x0648)
local ye = u(0x06CC)
local alif = u(0x0627)
local he = "ه"

local re = "ر"

local vw_s_cfu = u(0x0650) -- pesh (i)
local vw_s_ccu = u(0x0655) -- hamza below
local vw_s_cbr = u(0x064F) -- zer (u)
local vw_s_mcu = u(0x0654) -- hamza above
local vw_s_ocu = u(0x064E) -- zabar (a)

local vw_l_cbr = u(0x0657) -- inverted zer
local vw_l_cfu = u(0x0656) -- subscript alif

local hat = u(0x065A) -- V
local inverted_hat = u(0x065B) -- inverted V
local hats = hat .. inverted_hat

local short_vowels_list = vw_s_cfu .. vw_s_ccu .. vw_s_cbr .. vw_s_mcu .. vw_s_ocu

-- carrier + diacritic combos
local long_u = vav .. vw_l_cbr
local short_o = vav .. inverted_hat
local long_i = ye .. vw_l_cfu
local short_e = ye .. inverted_hat

local vocalised_carrier = long_u .. short_o .. long_i .. short_e .. "ۆ" .. "ێ" .. "ۆ" .. "اٟ"
local palatalisers = "ۍؠ"

local consonants = "بپتٹجچدڈرڑزژسشفکگلمنهھےثحخذصضطظعغقۍۄیٲآ"
local consonants_latn = "bptṭsjchxdḍzrċsśzʿġfqkglmnhv"

local conv = {
    -- consonants
    ["ب"] = "b",
    ["پ"] = "p",
    ["ت"] = "t",
    ["ٹ"] = "ṭ",
    ["ث"] = "s",
    ["ج"] = "j",
    ["چ"] = "c",
    ["ح"] = "h",
    ["خ‬"] = "x",
    ["د"] = "d",
    ["ڈ"] = "ḍ",
    ["ذ‬"] = "z",
    ["ر"] = "r",
    ["ڑ"] = "ḍ",
    ["ز"] = "z",
    ["ژ"] = "ċ",
    ["س"] = "s",
    ["ش"] = "ś",
    ["ص‬"] = "s",
    ["ض‬"] = "z",
    ["ط‬"] = "t",
    ["ظ"] = "z",
    ["ع"] = "ʿ",
    ["غ"] = "ġ",
    ["ف"] = "f",
    ["ق"] = "q",
    ["ک"] = "k",
    ["گ"] = "g",
    ["ل"] = "l",
    ["م"] = "m",
    ["ن"] = "n",
    ["ه"] = "h",
    ["ھ"] = "h",

    -- Why is this separate?
    ["خ"] = "kh",

    -- always word-final
    ["ے"] = "ē",

    -- short e to be treated separately

    -- incorrect palatalisation marker
    ["ۍ"] = "'",

    -- broken/open vowels 
    -- confirm if there are other use cases for these two
    ["ۄ"] = "ọ",
    ["ؠ"] = "ẹ", -- optionally ẹ = ya or used at the end to indicate palatalisation

    -- a carries long vowels
    ["ٲ"] = "ạ̄",
    ["آ"] = "ā",

    ["یٖ"] = "ī",
    ["اٟ"] = "ụ̄",

    -- vowels
    ["ۆ"] = "o",
    ["ێ"] = "e",
    ["أ"] = "ạ",

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
    [u(0x0655)] = "ụ",
    [u(0x064F)] = "u",
    [u(0x065F)] = "ụ̄",

    -- central vowels
    [u(0x0654)] = "ạ",

    -- low vowels
    [u(0x064E)] = "a"
}

local alif = "ا"
local waw = "و"
local ye = "ی"

function export.tr(text, lang, sc)
    text = gsub(text, "([" .. palatalisers .. "]%f[%s%z])", "'")

    -- short e at the end of words is ē with V sign
    text = gsub(text, "ے" .. hat, "e")

    -- ye with inverted hat is /j/
    -- always occurs after a consonant
    text = gsub(text, consonants .. ye .. inverted_hat, "%1y")

    -- interconsonantal vav is a long ō sound
    text = gsub(text, "([" .. consonants .. "]ھ?)" .. vav .. "([" .. consonants .. "])", "%1ō%2")

    -- intervocalic alif is a long a sound
    text = gsub(text, "([" .. consonants .. "و " .. "])" .. alif .. "([" .. consonants .. "و" .. "])", "%1ā%2")

    -- final he + short vowel disregards the he and transliterates the vowel
    text = gsub(text, "ہ([" .. short_vowels_list .. "])", short_vowels)

    -- word-initial alif + vowelled carrier drops the alif
    text = gsub(text, "^" .. alif .. "([" .. vocalised_carrier .. "])", "%1")

    -- word-initial alif + short vowel diacritic drops the alif
    text = gsub(text, "^" .. alif .. "([" .. short_vowels_list .. "])", "%1")

    -- re with inverted hat is just re
    text = gsub(text, re .. inverted_hat, re)

    -- long /u:/ and /i:/
    text = gsub(text, vav .. vw_s_cbr .. vav .. "([" .. consonants .. "])", vav .. "ū%1")
    text = gsub(text, "([" .. consonants .. "])" .. vw_s_cfu .. ye .. "([" .. consonants .. "])", "%1ī%2")

    -- vav with hat = short o
    text = gsub(text, vav .. "[" .. hats .. "]", "o")

    -- vav with short vowel
    text = gsub(text, vav .. "([" .. short_vowels_list .. "])", function(c) return "v" .. short_vowels[c] end)

    -- nun or re with hat
    -- TODO: add support for re -- done?
    text = gsub(text, "ن" .. "[" .. hats .. "]", "n")

    -- ye with hat = short e
    -- defunct?
    text = gsub(text, ye .. "[" .. hats .. "]", "e")

    -- vav with inverted pish = long u
    text = gsub(text, long_u, "ū")

    -- long i
    text = gsub(text, ye .. vw_l_cfu, "ī")

    -- intervocalic ye is a long a sound
    text = gsub(text, "([" .. consonants .. "])" .. ye .. "([" .. consonants .. "])", "%1ē%2")

    -- word-final alif and ye
    text = gsub(text, "([" .. consonants .. "])" .. ye .. "$", "%1ī")
    text = gsub(text, "([" .. consonants .. "])" .. alif .. "$", "%1ā")

    -- regard the consonant + short vowel combinations throughout
    text = gsub(text, ".", short_vowels)

    text = gsub(text, "[أإبپتٹجچدڈرڑزژسشفکگلمنهھےثحخذصضطظعغقۍۄؠٲآۆۆێ]", conv)

    -- normal consonants left over
    text = gsub(text, vav, "v")
    text = gsub(text, "ہ", "h")
    text = gsub(text, "ی", "y")

    -- CẹC = CyaC
    text = gsub(text, "([" .. consonants_latn .. "])ẹ([" .. consonants_latn .. "])", "%1ya%2")

    return text
end

return export
