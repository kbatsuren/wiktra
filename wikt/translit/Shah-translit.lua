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

local vw_s_cfu = u(0x0650) -- pesh (i)
local vw_s_ccu = u(0x0655) -- hamza below
local vw_s_cbr = u(0x064F) -- zer (u)
local vw_s_mcu = u(0x0654) -- hamza above
local vw_s_ocu = u(0x064E) -- zabar (a)

local vw_l_cbr = u(0x0657) -- inverted zer
local vw_l_cfu = u(0x0656) -- subscript alif

local hat = u(0x065A)
local inverted_hat = u(0x065B)
local hats = hat .. inverted_hat

local short_vowels_list = vw_s_cfu .. vw_s_ccu .. vw_s_cbr .. vw_s_mcu .. vw_s_ocu

-- carrier + diacritic combos
local long_u = vav .. vw_l_cbr
local short_o = vav .. inverted_hat
local long_i = ye .. vw_l_cfu
local short_e = ye .. inverted_hat

local vocalised_carrier = short_a .. long_a .. short_i .. long_i .. short_e .. long_e .. short_o .. short_u .. "ا" .. "آ" .. " ِ◌" .. "ی" .. " ُ◌" .. "ے" .. "و"

local consonants = "بپتثجچحخدذرزژسشصضطظعغفقکگلمنڻوهىھٹڈڑھتھڈھجھدھٹھکھڑھ"

local conv = {
    -- consonants
    ["ب"] = "b",
    ["پ"] = "p",
    ["ت"] = "t",
    ["ث"] = "s",
    ["ج"] = "j",
    ["چ"] = "ch",
    ["ح"] = "h",
    ["خ"] = "kḥ",
    ["د"] = "d",
    ["ذ"] = "z",
    ["ر"] = "r",
    ["ز"] = "z",
    ["ژ"] = "z",
    ["س"] = "s",
    ["ش"] = "sh",
    ["ص"] = "s",
    ["ض"] = "z",
    ["ط"] = "t",
    ["ظ"] = "z",
    ["ع"] = "a",
    ["غ"] = "ġ",
    ["ف"] = "f",
    ["ق"] = "q",
    ["ک"] = "k",
    ["گ"] = "g",
    ["ل"] = "l",
    ["م"] = "m",
    ["ن"] = "n",
    ["ڻ"] = "ṅ",
    ["و"] = "v",
    ["ه"] = "h",
    ["ى"] = "y",
    ["ھ"] = "h",
    ["ٹ"] = "ṭ",
    ["ڈ"] = "ḍ",
    ["ڑ"] = "ṛ",
    ["ھ"] = "bh",
    ["تھ"] = "th",
    ["ڈھ"] = "ḍh",
    ["جھ"] = "jh",
    ["دھ"] = "dh",
    ["ٹھ"] = "ṭh",
    ["کھ"] = "kh",
    ["ڑھ"] = "ṛh",
    ["وا"] = "wā",

    -- vowels
    [u(0x0627)] = "ā", -- alif
    [" ِ◌"] = "i",
    ["ی"] = "ī",
    [" ُ◌"] = "u",
    ["ے"] = "e",
    ["ے"] = "ē",

    -- other diacritics
    ["ں"] = "N", -- noon ghunna: nasalize
    ["ء"] = "ʔ", -- hamza:glottal t
    [" ّ◌"] = "ː", -- shad: emphasise
    [u(0x0670)] = "ā", -- khari zabar
    [u(0x064B)] = "N", -- do zabar
    [" ٍ◌"] = "in", -- do zer

    -- digits
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

local nasal_assim = {["[kg]h?"] = "ṅ", ["[cj]h?"] = "ñ", ["[ṭḍ]h?"] = "ṇ", ["[td]h?"] = "n", ["[pb]h?"] = "m", ["n"] = "n", ["m"] = "m", ["s"] = "n"}

local short_vowels = {
    -- high vowels
    [u(0x0627)] = "ā",
    [u(0x0650)] = "i",
    [u(0x0655)] = "ụ",
    [u(0x064F)] = "u",
    [u(0x065F)] = "ụ̄",
    [u(0x0648)] = "ū",
    -- central vowels
    [u(0x0654)] = "ạ",

    -- low vowels
    [u(0x064E)] = "a"

}

function export.tr(text, lang, sc)
    local waw = "و"
    local ye = "ی"
    local noon = "[ًں]?"
    local shadda = " ّ"

    text = text .. " "

    -- two consonants

    text = mw.ustring.gsub(text, consonants .. consonants, "%1a%2") -- example ਕਰ

    text = mw.ustring.gsub(text, consonants .. short_vowel .. consonants, "%1%2%3") -- example ਸ਼ੇਰ

    text = mw.ustring.gsub(text, consonants .. consonants .. short_vowel, "%1a%2%3") -- example ਦਰੀ

    text = mw.ustring.gsub(text, consonants .. short_vowel .. consonants .. short_vowel, "%1%2%3%4") -- example ਖੀਰਾ 

    -- shadda
    text = mw.ustring.gsub(text, consonants .. shadda .. consonants, "%1a%2%3") -- example ਰੱਬ

    text = mw.ustring.gsub(text, consonants .. short_vowel .. shadda .. consonants, "%1%2%3%4") -- example ਸਿੱਖ 

    text = mw.ustring.gsub(text, consonants .. shadda .. consonants .. short_vowel, "%1a%2%3%4") -- example ਗੱਡੀ 

    text = mw.ustring.gsub(text, consonants .. short_vowel .. shadda .. consonants .. short_vowel, "%1%2%3%4%5") -- example ਤਿੱਖਾ 

    -- noon
    text = mw.ustring.gsub(text, consonants .. noon .. consonants, "%1a%2%3") -- example ਬੰਦ

    text = mw.ustring.gsub(text, consonants .. short_vowel .. noon .. consonants, "%1%2%3%4") -- example ਜਿੰਦ 

    text = mw.ustring.gsub(text, consonants .. noon .. consonants .. short_vowel, "%1a%2%3%4") -- example ਬੰਦੀ

    text = mw.ustring.gsub(text, consonants .. short_vowel .. noon .. consonants .. short_vowel, "%1%2%3%4%5") -- example ਜ਼ਿੰਦਾ

    -- three consonants

    text = mw.ustring.gsub(text, consonants .. "a" .. consonants .. consonants, "%1a%2a%3") -- example ਕਦਰ 

    text = mw.ustring.gsub(text, consonants .. short_vowel .. consonants .. consonants, "%1%2%3a%4") -- example ਜਿਸਮ

    text = mw.ustring.gsub(text, consonants .. consonants .. short_vowel .. consonants, "%1a%2%3%4") -- example ਤਸੀਰ

    text = mw.ustring.gsub(text, consonants .. consonants .. consonants .. short_vowel, "%1a%2%3%4") -- example ਤਸਬੀ

    text = mw.ustring.gsub(text, consonants .. short_vowel .. consonants .. "a" .. consonants .. short_vowel, "%1%2%3%4%5") -- example ਖ਼ਾਲਸਾ 

    text = mw.ustring.gsub(text, consonants .. short_vowel .. consonants .. short_vowel .. consonants .. short_vowel, "%1%2%3%4%5%6") -- example ਖ਼ੁਲਾਸਾ

    -- shadda

    text = mw.ustring.gsub(text, consonants .. shadda .. consonants .. "a" .. consonants .. short_vowel, "%1%2%3%4%5%6") -- example ਨੱਠਣਾ

    text = mw.ustring.gsub(text, consonants .. short_vowel .. shadda .. consonants .. "a" .. consonants .. short_vowel, "%1%2%3%4%5%6") -- example ਸਿੱਖਣਾ

    -- noon

    text = mw.ustring.gsub(text, consonants .. noon .. consonants .. consonants, "%1a%2%3a%4") -- example ਜੰਗਲ

    text = mw.ustring.gsub(text, consonants .. noon .. consonants .. short_vowel, "%1a%2%3%4") -- example ਰੰਗਲਾ

    text = mw.ustring.gsub(text, consonants .. short_vowel .. noon .. consonants .. consonants .. short_vowel, "%1%2%3%4a%5%6") -- example ਜ਼ਿੰਦਗੀ

    -- four consonants

    text = mw.ustring.gsub(text, consonants .. consonants .. consonants .. consonants, "%1a%2%3a%4") -- example ਸਰਬਤ

    text = mw.ustring.gsub(text, consonants .. short_vowel .. consonants .. consonants .. consonants, "%1%2%3%4a%5") -- example ਕੁਦਰਤ

    text = mw.ustring.gsub(text, consonants .. "a" .. consonants .. short_vowel .. consonants .. consonants, "%1a%2%3%4a%5") -- example ਕਬੂਤਰ

    text = mw.ustring.gsub(text, consonants .. consonants .. consonants .. short_vowel .. consonants, "%1a%2%3%4%5") -- example 

    text = mw.ustring.gsub(text, consonants .. consonants .. consonants .. consonants .. short_vowel, "%1a%2%3%4%5") -- example 

    text = mw.ustring.gsub(text, consonants .. consonants .. consonants .. short_vowel .. consonants .. short_vowel, "%1a%2%3%4%5%6") -- example ਦਰਵਾਜ਼ਾ

    -- noon

    text = mw.ustring.gsub(text, consonants .. "a" .. noon .. consonants .. "a" .. consonants .. short_vowel .. consonants, "%1a%2%3%4%5%6") -- example ਧੰਨਵਾਦ 

    text = mw.ustring.gsub(text, consonants .. noon .. consonants .. consonants .. short_vowel .. consonants, "%1a%2%3%4%5") -- example ਫ਼ਰਜ਼ੰਦ

    -- shadda

    text = mw.ustring.gsub(text, consonants .. "a" .. shadda .. consonants .. "a" .. consonants .. consonants, "%1a%2%3%4a%5") -- example ਯੱਕਦਮ

    -- five consonants

    text = mw.ustring.gsub(text, consonants .. short_vowel .. consonants .. consonants .. "a" .. consonants .. short_vowel .. consonants, "%1%2%3a%4%5%6%7") -- example ਵੇਪਰਵਾਹ

    text = mw.ustring.gsub(text, consonants .. short_vowel .. consonants .. "a" .. consonants .. consonants .. "a" .. consonants .. short_vowel, "%1%2%3%4a%5%6%7") -- example ਪਾਰਦਰਸ਼ੀ

    -- shadda

    text = mw.ustring.gsub(text, consonants .. short_vowel .. shadda .. consonants .. consonants .. consonants .. short_vowel .. consonants, "%1%2%3%4a%5%6%7%8") -- example ਸ਼ੁੱਕਰਵਾਰ

    text = mw.ustring.gsub(text, consonants .. "a" .. consonants .. consonants .. "a" .. consonants .. "a" .. shadda .. consonants, "%1a%2a%3%4a%5%6") -- example ਮਗਰਮੱਛ

    text = mw.ustring.gsub(text, consonants .. short_vowel .. consonants .. short_vowel .. consonants .. consonants .. "a" .. consonants .. consonants .. short_vowel, "%1%2%3%4%5a%6a%7%8%9") -- example ਯੂਨੀਵਰਸਟੀ

    -- vocalised_carrier

    text = mw.ustring.gsub(text, vocalised_carrier .. consonants .. consonants, "%1%2a%3") -- example ਅਦਬ

    text = mw.ustring.gsub(text, vocalised_carrier .. consonants .. "a" .. consonants .. short_vowel, "%1%2%3%4") -- example ਆਖਣਾ

    text = mw.ustring.gsub(text, vocalised_carrier .. noon .. consonants .. "a" .. consonants .. short_vowel, "%1%2%3%4%5") -- example ਅੰਤੜੀ

    text = mw.ustring.gsub(text, vocalised_carrier .. consonants .. "a" .. consonants .. consonants, "%1%2%3a%4") -- example ਅਫ਼ਸਰ

    text = mw.ustring.gsub(text, vocalised_carrier .. consonants .. "a" .. consonants .. short_vowel .. consonants .. short_vowel, "%1%2%3%4%5%6") -- example ਅਲਮਾਰੀ

    text = mw.ustring.gsub(text, vocalised_carrier .. consonants .. "a" .. consonants .. short_vowel .. consonants, "%1%2%3%4%5") -- example ਇਕਰਾਰ

    text = mw.ustring.gsub(text, vocalised_carrier .. " ص" .. " ت" .. "a" .. consonants .. short_vowel, "%1st%2%3") -- example ਉਸਤਰਾ

    text = mw.ustring.gsub(text, consonants .. short_vowel .. vocalised_carrier .. consonants .. consonants, "%1%2%3%4a%5") -- example ਸਾਈਕਲ

    text = mw.ustring.gsub(text, consonants .. short_vowel .. consonants .. short_vowel .. vocalised_carrier .. consonants .. "a" .. consonants .. short_vowel, "%1%2%3%4%5%6%7%8") -- example ਵਿਦਿਆਰਥੀ

    for key, val in pairs(nasal_assim) do text = mw.ustring.gsub(text, "N(" .. key .. ")", val .. "%1") end
    text = mw.ustring.gsub(text, "([aiueēoāīū])N ", "%1̃ ")
    text = mw.ustring.gsub(text, "(.?)N", "%1̃")

    text = mw.ustring.gsub(text, "ː(.)", "%1%1")

    text = mw.ustring.gsub(text, " ?।", ".")

    text = mw.ustring.gsub(text, " $", "")

    return text
end

return export
