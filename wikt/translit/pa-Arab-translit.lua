-- To whoever decides to work on this, sorry for this code being such a mess ~~ User:Taimoorahmed11
local u = mw.ustring.char
local gsub = mw.ustring.gsub

local export = {}

local vav = u(0x0648)
local ye = u(0x06CC)
local alif = u(0x0627)
local he = "ہ"

local vw_s_cfu = u(0x0650) -- zer (i)
local vw_s_ccu = u(0x0655) -- hamza below
local vw_s_cbr = u(0x064F) -- pesh (u)
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

local vocalised_carrier = long_u .. short_o .. long_i .. short_e .. "و" .. "و" .. "ی" .. "ے"

local consonants_1 = "ببپتثہجچحخدذرزژسشصضطظعغفقکگلࣇمنݨوہىھٹڈڑ"
local consonants_2 = "ببھتھڈھجھدھٹھکھڑھ"
local vowels = "اِیاُوآے"
local consonants = gsub(consonants_1, consonants_2, "")

local conv = {
    -- consonants
    ["ب"] = "b",
    ["پ"] = "p",
    ["ت"] = "t",
    ["ث"] = "s",
    ["ج"] = "j",
    ["چ"] = "c",
    ["ح"] = "h",
    ["خ"] = "x",
    ["د"] = "d",
    ["ذ"] = "z",
    ["ر"] = "r",
    ["ز"] = "z",
    ["ژ"] = "ž",
    ["س"] = "s",
    ["ش"] = "ś",
    ["ص"] = "s",
    ["ض"] = "z",
    ["ط"] = "t",
    ["ظ"] = "z",
    ["ع"] = "",
    ["غ"] = "ġ",
    ["ف"] = "f",
    ["ق"] = "q",
    ["ک"] = "k",
    ["گ"] = "g",
    ["ل"] = "l",
    ["م"] = "m",
    ["ن"] = "n",
    ["ݨ"] = "ṇ",
    ["وَ"] = "v",
    ["ہ"] = "h",
    ["ى"] = "y",
    ["ھ"] = "h",
    ["ٹ"] = "ṭ",
    ["ڈ"] = "ḍ",
    ["ڑ"] = "ṛ",
    ["ࣇ"] = "ḷ",

    -- aspirated consonants
    ["بھ"] = "bh",
    ["تھ"] = "th",
    ["ڈھ"] = "ḍh",
    ["جھ"] = "jh",
    ["دھ"] = "dh",
    ["ٹھ"] = "ṭh",
    ["کھ"] = "kh",
    ["ڑھ"] = "ṛh",
    ["گھ"] = "gh",
    ["لھ"] = "lh",

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
    -- independent vowels
    [u(0x00627)] = "a", -- alif ا
    [u(0x00623)] = "ā", -- alif أ
    [u(0x00622)] = "ā", -- alif with madda آ
    [u(0x06D2)] = "ē", -- ye ے
    ["اُ "] = "u", -- alif with damma
    [u(0x0624)] = "au", -- vav with hamza ؤ	

    -- vowels
    [u(0x064E)] = "a", -- zabar َ◌
    [u(0x0670)] = "ā", -- khari zabar ◌ٰ
    [u(0x0650)] = "i", -- zer ◌ِ
    [u(0x064F)] = "u", -- pesh ُ◌

    -- other diacritics
    [u(0x06BA)] = "N", -- noon ghunna ں
    [u(0x0621)] = "i", -- hamza ء
    [u(0x0651)] = "ː", -- shad ◌ّ
    [u(0x064B)] = "n", -- do zabar ◌ً
    [u(0x064D)] = "ni" -- do zer ◌ٍ	
}

local alif = "ا"
local alif2 = "أ"
local vav = "و"
local ye = "ی"
local noon = u(0x06BA)
local shadda = u(0x0651)
local ghunna = u(0x06BA)
local aspirate = u(0x06BE)
local sukoon = u(0x0652)

function export.tr(text, lang, sc)

    -- special cases (added 'mai' since in Punjabi 'میں' is only used for 'mai')
    text = gsub(text, "([" .. consonants .. "])" .. alif .. "([" .. consonants .. "])", "%1ā%2")
    text = gsub(text, "اللہ", "Allāh")
    text = gsub(text, "مَیں", "ma͠i")
    text = gsub(text, alif .. ye .. "([" .. consonants .. "])", "ē%1")
    text = gsub(text, "([" .. consonants .. "])" .. "ائی", "%1āī")
    -- Can't remember why the line below was added but it's messing up some of the translations | N2: It was added for 'Waheguru'
    -- text = gsub(text, '([' .. consonants .. '])' .. alif .. '([' .. consonants .. '])' .. vw_s_cfu .. '([' .. consonants .. '])', "%1ā%2e%3")
    text = gsub(text, "ن٘", "ṅ")
    text = gsub(text, alif .. vav .. "([" .. consonants .. "])", "ō%1")
    text = gsub(text, "([" .. consonants .. "])" .. vav, "%1ō")
    text = gsub(text, "([" .. consonants .. "])" .. vav .. "([" .. consonants .. "])", "%1ō%2")

    text = gsub(text, "وا" .. "([" .. consonants .. "])", "vā%1")

    -- full stop
    text = gsub(text, "۔", ".")
    text = gsub(text, "؟", "?")

    -- word-final alif
    text = gsub(text, alif .. ghunna, "ā̃")
    text = gsub(text, "([" .. consonants .. "])" .. alif, "%1ā")
    text = gsub(text, "([" .. consonants .. "])" .. shadda .. alif, "%1%1ā")
    -- if 'ا' is medial
    text = gsub(text, "([" .. consonants .. "])" .. "ا" .. "([" .. consonants .. "])", "%1ā%2")
    text = gsub(text, "([" .. consonants .. "])" .. ye .. alif, "%1iā")

    -- if choti ye at end + case if not at end
    text = gsub(text, "([" .. consonants .. "])" .. ye .. "([" .. consonants .. "])", "%1ē%2")
    text = gsub(text, "([" .. consonants .. "])" .. ye, "%1i")

    -- intervocalic alif is a long a sound
    text = gsub(text, "([" .. consonants .. "و " .. "])" .. alif2 .. "([" .. consonants .. "و" .. "])", "%1ā%2")

    -- schwa rules
    --- after do-chashme-he
    text = gsub(text, "([" .. consonants .. "])" .. aspirate .. "([" .. consonants .. "])", "%1ha%2")
    --- after zer | removed this, as it was realistically unecessary
    -- text = gsub(text, '([' .. consonants .. '])' .. vw_s_cfu .. '([' .. consonants .. '])' .. "ْ", "%1i%2")
    -- text = gsub(text, '([' .. consonants .. '])' .. vw_s_cfu .. '([' .. consonants .. '])', "%1i%2a")
    --- initial letter and second letter except with diacritics

    -- initial consonant + he sound = e/ê
    text = gsub(text, "([" .. consonants .. vowels .. "])" .. he .. "([" .. consonants .. "])", "%1eh%2")
    text = gsub(text, "([" .. consonants .. "])" .. "ح" .. "([" .. consonants .. "])", "%1êhê%2")

    -- word-initial alif + vowelled carrier drops the alif
    text = gsub(text, "^" .. alif .. "([" .. vocalised_carrier .. "])", "%1")

    -- word-initial alif + short vowel diacritic drops the alif
    text = gsub(text, "^" .. alif .. "([" .. short_vowels_list .. "])", "%1")

    -- do-chashme-he zabar, zer, pesh
    text = gsub(text, "([" .. consonants .. "])" .. vw_s_ocu .. aspirate, "%1ha")
    text = gsub(text, "([" .. consonants .. "])" .. vw_s_cfu .. aspirate, "%1hi")
    text = gsub(text, "([" .. consonants .. "])" .. vw_s_cbr .. aspirate, "%1hu")

    -- shadda
    text = gsub(text, "([" .. consonants .. "])" .. shadda, "%1%1")

    -- long /u:/ and /i:/ and /e:/ and /o:/
    text = gsub(text, "([" .. consonants .. "])" .. vw_s_cbr .. vav, "%1ū")
    text = gsub(text, "([" .. consonants .. "])" .. vw_s_cfu .. ye, "%1ī")
    text = gsub(text, "([" .. consonants .. "])" .. ye .. "([" .. consonants .. "])", "%1ē")
    text = gsub(text, "([" .. consonants .. "])" .. vav .. "([" .. consonants .. "])", "ō%2")

    --- nasalised
    text = gsub(text, "([" .. consonants .. "])" .. vw_s_cbr .. vav .. ghunna, "%1ū̃")
    text = gsub(text, "([" .. consonants .. "])" .. vw_s_cfu .. ye .. ghunna, "%1ī̃")
    text = gsub(text, "([" .. consonants .. "])" .. vav .. ghunna, "%1ō̃")
    text = gsub(text, "([" .. consonants .. "])" .. ye .. ghunna, "%1ē̃")

    -- final he + short vowel disregards the he and transliterates the vowel
    text = gsub(text, "([" .. vowels .. "])" .. he, "%1h")
    text = gsub(text, "([" .. consonants .. "])" .. he, "%1a")
    text = gsub(text, "([" .. consonants .. "])" .. he .. "([" .. consonants .. vowels .. "])", "%1h")

    -- sukoon diacritic
    text = gsub(text, "ْ", "​")
    -- vav with hat = short o
    text = gsub(text, vav .. "[" .. hats .. "]", "o")

    -- vav with short vowel
    text = gsub(text, vav .. "([" .. short_vowels_list .. "])", function(c) return "v" .. short_vowels[c] end)

    -- nun or re with hat
    -- TODO: add support for re
    text = gsub(text, "ن" .. "[" .. hats .. "]", "n")

    -- ye with hat = short e
    text = gsub(text, ye .. "[" .. hats .. "]", "e")

    -- long i
    text = gsub(text, ye .. vw_l_cfu, "ī")

    -- intervocalic ye is a long a sound
    text = gsub(text, "([" .. consonants .. "])" .. ye .. "([" .. consonants .. "])", "%1ē%2")

    -- regard the consonant + short vowel combinations throughout
    text = gsub(text, ".", short_vowels)

    text = gsub(text, "[بتجدکگٹڈڑ]ھ", conv)
    text = gsub(text, "[ببپتثجچحخدذرزژسشصضطظعغفقکگلࣇمنݨوہىھٹڈڑ]", conv)

    -- normal consonants left over
    text = gsub(text, vav, "v")
    text = gsub(text, "ہ", "h")
    text = gsub(text, "ی", "y")

    for key, val in pairs(nasal_assim) do text = mw.ustring.gsub(text, "N(" .. key .. ")", val .. "%1") end
    text = gsub(text, "([aiueēoāīū])N ", "%1̃ ")
    text = gsub(text, "(.?)N", "%1̃")

    text = gsub(text, "ː(.)", "%1%1")

    text = gsub(text, " ?।", ".")

    text = gsub(text, " $", "")

    text = gsub(text, "aā", "ā")
    text = gsub(text, "aê", "ê")
    text = gsub(text, "ah", "êh")
    text = gsub(text, "uō", "ū")
    text = gsub(text, "iō", "ī")
    text = gsub(text, "ĩ", "ē̃")
    text = gsub(text, "nj", "ñj")
    text = gsub(text, "nk", "ṅk")
    text = gsub(text, "ng", "ṅg")
    text = gsub(text, "ṅj", "ñj")

    return text
end

return export
