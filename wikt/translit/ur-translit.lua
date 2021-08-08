local U = mw.ustring.char
local gsub = mw.ustring.gsub
local export = {}

local zabar = U(0x64E)
local zer = U(0x650)
local pesh = U(0x64F)
local tashdid = U(0x651) -- also called shadda
local jazm = "ْ"
local he = "ہ"

local consonants = "ببپتثجچحخدذرزژسشصضطظعغفقکگلࣇمنݨوہھٹڈڑ"
local consonantS = "ببپتثجچحخدذرزژسشصضطظعغفقکگلࣇمنݨہھٹڈڑ"
local consonantS2 = "یببپتثجچحخدذرزژسشصضطظعغفقکگلࣇمنݨوہھٹڈڑ"
local vowels = "ایئےۓوؤ"
local hes = "ہح"
local diacritics = "َُِّْٰ"
local ZZP = "َُِ"

local mapping = {
    ["آ"] = "ā",
    ["ب"] = "b",
    ["پ"] = "p",
    ["ت"] = "t",
    ["ٹ"] = "ṭ",
    ["ث"] = "s",
    ["ج"] = "j",
    ["چ"] = "c",
    ["ح"] = "h",
    ["خ"] = "x",
    ["د"] = "d",
    ["ڈ"] = "ḍ",
    ["ذ"] = "z",
    ["ر"] = "r",
    ["ڑ"] = "ṛ",
    ["ز"] = "z",
    ["ژ"] = "ž",
    ["س"] = "s",
    ["ش"] = "ś",
    ["ص"] = "s",
    ["ض"] = "z",
    ["ط"] = "t",
    ["ظ"] = "z",
    ["غ"] = "ġ",
    ["ف"] = "f",
    ["ق"] = "q",
    ["ک"] = "k",
    ["گ"] = "g",
    ["ݨ"] = "ṇ",
    ["ࣇ"] = "ḷ",
    ["ل"] = "l",
    ["م"] = "m",
    ["ن"] = "n",
    ["و"] = "ō",
    ["ہ"] = "h",
    ["ی"] = "y",
    ["ے"] = "ē",
    ["۔"] = ".",
    ["ں"] = "̃",

    ["ھ"] = "h",

    ["ع"] = "‘",
    ["ء"] = "’",
    ["ئ"] = "",
    ["ؤ"] = "ō",
    ["أ"] = "",

    -- diacritics
    [zabar] = "a",
    [zer] = "i",
    [pesh] = "u",
    [jazm] = "", -- also sukun - no vowel
    [U(0x200C)] = "-", -- ZWNJ (zero-width non-joiner)

    -- ligatures
    ["ﻻ"] = "lā",
    ["ﷲ"] = "allāh",

    -- kashida
    ["ـ"] = "-", -- kashida, no sound

    -- numerals
    ["۱"] = "1",
    ["۲"] = "2",
    ["۳"] = "3",
    ["۴"] = "4",
    ["۵"] = "5",
    ["۶"] = "6",
    ["۷"] = "7",
    ["۸"] = "8",
    ["۹"] = "9",
    ["۰"] = "0",

    -- punctuation (leave on separate lines)
    ["؟"] = "?", -- question mark
    ["،"] = ",", -- comma
    ["؛"] = ";", -- semicolon
    ["«"] = "“", -- quotation mark
    ["»"] = "”", -- quotation mark
    ["٪"] = "%", -- percent
    ["؉"] = "‰", -- per mille
    ["٫"] = ".", -- decimals
    ["٬"] = ",", -- thousand
    ["ۓ"] = "-ye",
    ["ۀ"] = "-e" -- he ye (in ezâfe)
}

local ain = "ع"
local alif = "ا"
local ye = "ی"
local ye2 = "ئ"
local ye3 = "ے"
local vao = "و"
local aspirate = "ھ"

function export.tr(text, lang, sc)

    -- EXCEPTIONS - leave as they are, unless they have been sorted out elsewhere
    text = gsub(text, "([" .. consonants .. "])" .. ye .. "ں", "%1ē̃")
    text = gsub(text, zabar .. aspirate .. "(ی)", "hɛ̄")
    text = gsub(text, zabar .. aspirate .. "(و)", "hɔ̄")
    text = gsub(text, "ؤ" .. pesh, "ū")
    text = gsub(text, "وہ", "vo")
    text = gsub(text, alif .. ye2 .. "([" .. consonants .. "])", "ā'ya%1")

    -- Tashdeed
    text = gsub(text, "([" .. consonantS2 .. "])" .. tashdid, "%1%1")
    text = gsub(text, "([" .. consonantS2 .. "])" .. tashdid .. "([" .. ZZP .. "])", "%1%1%2")
    text = gsub(text, "([" .. ZZP .. "])" .. ye .. "([" .. ZZP .. "])" .. tashdid, "%1yy%2")
    text = gsub(text, "([" .. ZZP .. "])" .. vao .. "([" .. ZZP .. "])" .. tashdid, "%1vv%2")
    -- For some reason the tashdeed gets pushed after the other diacritics, so this line is necessary for tashdeed to work with other diacritics
    text = gsub(text, "([" .. consonants .. "])" .. "([" .. ZZP .. "])" .. tashdid, "%1%1%2")

    -- e, instead of i
    text = gsub(text, alif .. zer .. ain .. jazm .. "([" .. consonants .. "])" .. zer, "ē‘%1e")
    text = gsub(text, jazm .. "([" .. consonants .. "])" .. zer .. "([" .. consonants .. "])" .. alif, "%1e%2ā")
    text = gsub(text, alif .. zer .. ain .. jazm, "ē‘")

    -- tanween diacritic
    text = gsub(text, "([" .. consonants .. "])" .. "ً" .. alif, "%1an")
    text = gsub(text, alif .. "ً", "an")
    text = gsub(text, "([" .. consonants .. "])" .. "ً", "%1an")

    -- khari zabar --
    text = gsub(text, "([" .. vowels .. "])" .. "ٰ", "ā")
    text = gsub(text, "([" .. consonants .. "])" .. "ٰ" .. "([" .. vowels .. "])", "%1ā")

    -- ‘ain
    text = gsub(text, alif .. ain, "ā‘")
    text = gsub(text, ain .. alif .. "([" .. consonants .. "])", "‘ā%1")
    text = gsub(text, "([" .. consonants .. "])" .. ain .. he, "%1‘a")
    text = gsub(text, "([" .. consonants .. "])" .. "([" .. zer .. pesh .. "]?)" .. ain, "%1%2‘")
    text = gsub(text, ain .. zabar .. vao .. "([" .. consonants .. "])", "‘ɔ̄%1")
    text = gsub(text, ain .. zabar .. ye .. "([" .. consonants .. "])", "‘ɛ̄%1")
    text = gsub(text, ain .. zer .. "([" .. consonants .. "])", "‘i%1")
    text = gsub(text, ain .. pesh .. "([" .. consonants .. "])", "‘u%1")
    text = gsub(text, ain .. zer .. ye .. "([" .. consonants .. "])", "‘ī%1")
    text = gsub(text, ain .. pesh .. vao .. "([" .. consonantS .. "])", "‘ū%1")

    -- Vao
    text = gsub(text, vao .. "([" .. ZZP .. "])", "v%1")
    text = gsub(text, "([" .. consonants .. "])" .. zabar .. vao .. alif, "%1avā")

    -- Fatha Majhool --
    text = gsub(text, "([" .. consonants .. "])" .. zabar .. aspirate .. "([" .. hes .. "])" .. "([" .. ZZP .. "])" .. jazm, "%1hêh%3")
    text = gsub(text, "([" .. consonants .. "])" .. zabar .. "([" .. hes .. "])" .. jazm .. "([" .. ZZP .. "])", "%1êh%3")
    text = gsub(text, "([" .. consonants .. "])" .. zabar .. "([" .. hes .. "])" .. jazm, "%1êh")

    -- medial/final consonants.
    text = gsub(text, zabar .. he .. zer .. ye, "ahī")
    text = gsub(text, zabar .. he .. alif, "ahā")
    text = gsub(text, zabar .. he .. "([" .. consonants .. vowels .. "])", "ah%1")
    text = gsub(text, "([" .. consonants .. "])" .. alif, "%1ā")
    text = gsub(text, "([" .. consonants .. "])" .. tashdid .. alif, "%1%1ā")

    text = gsub(text, "([" .. consonants .. "])" .. vao, "%1ō")
    text = gsub(text, "([" .. consonants .. "])" .. tashdid .. vao, "%1%1ō")

    text = gsub(text, zer .. ye .. alif, "iyā")
    text = gsub(text, "([" .. consonants .. "])" .. ye .. "([" .. consonants .. "])", "%1ē%2")
    text = gsub(text, ye2 .. ye, "ï")
    text = gsub(text, ye2 .. "ے", "ë")
    text = gsub(text, "([" .. consonants .. "])" .. ye .. ye3, "%1ië")
    text = gsub(text, alif .. zabar .. ye3, "ɛ̄")
    text = gsub(text, "([" .. consonants .. alif .. "])" .. ye2 .. ye, "%1aï")
    text = gsub(text, "([" .. consonants .. "])" .. ye2 .. ye3, "%1aë")
    text = gsub(text, zabar .. ye3, "ɛ̄")
    text = gsub(text, "([" .. consonants .. "])" .. zer .. " ", "%1-e ")

    -- Initial alif
    text = gsub(text, "" .. alif .. "([" .. consonantS .. "])", "ā%1")
    text = gsub(text, alif .. "([" .. consonantS .. "])", "a%1")
    text = gsub(text, alif .. zabar .. "([" .. consonantS .. "])", "a%1")
    text = gsub(text, alif .. zabar .. vao .. "([" .. consonants .. "])", "ɔ̄%1")
    text = gsub(text, alif .. vao .. "([" .. consonants .. "])", "ō%1")
    text = gsub(text, alif .. ye .. "([" .. consonants .. "])", "ai%1")
    text = gsub(text, alif .. zabar .. ye .. "([" .. consonants .. "])", "ɛ̄%1")
    text = gsub(text, alif .. pesh .. "([" .. consonantS .. "])", "u%1")
    text = gsub(text, alif .. zer .. "([" .. consonants .. "])", "i%1")
    text = gsub(text, pesh .. vao, "ū")
    text = gsub(text, alif .. zer .. ye .. "([" .. consonants .. "])", "ī%1")

    -- do-chashme-he zabar, zer, pesh
    text = gsub(text, "([" .. consonants .. "])" .. "([" .. ZZP .. "])" .. aspirate, "%1h%2")

    -- diacritics
    text = gsub(text, "([" .. consonants .. "])" .. zabar .. vao, "%1ɔ̄")
    text = gsub(text, "([" .. consonants .. "])" .. zabar .. ye, "%1ɛ̄")
    text = gsub(text, "([" .. consonants .. "])" .. zabar .. ye3, "%1ɛ̄")
    text = gsub(text, "([" .. consonants .. "])" .. ye, "%1ī")
    text = gsub(text, "([" .. consonants .. "])" .. zer .. ye, "%1ī")

    -- final he + short vowel disregards the he and transliterates the vowel
    text = gsub(text, ye .. he, "ye")
    text = gsub(text, "([" .. consonants .. "])" .. he, "%1e")

    --
    text = gsub(text, zabar .. he .. "([" .. ZZP .. "])", "ah%1")
    text = gsub(text, zabar .. he, "a")
    --

    text = gsub(text, "ۂ", "a-e")
    text = mw.ustring.gsub(text, "ahē", "hɛ̄")
    text = mw.ustring.gsub(text, "ahō", "hɔ̄")
    text = mw.ustring.gsub(text, ".", mapping)

    text = mw.ustring.gsub(text, "ōā", "vā")
    text = mw.ustring.gsub(text, "ɔ̄ā", "vā")
    text = mw.ustring.gsub(text, "ōا", "vā")
    text = mw.ustring.gsub(text, "ɔ̄aاa", "avā")
    text = mw.ustring.gsub(text, "ɔ̄ا", "vā")
    text = mw.ustring.gsub(text, "ɔ̄ا", "vā")

    -- Changed these to 'iy(*)', because they will be used for with ی, which are normally written as 'iy'
    text = mw.ustring.gsub(text, "īā", "iyā")
    text = mw.ustring.gsub(text, "īa", "iya")
    --

    text = mw.ustring.gsub(text, "aا", "ā")
    text = mw.ustring.gsub(text, "اē", "ē")
    text = mw.ustring.gsub(text, "īا", "yā")
    text = mw.ustring.gsub(text, "yا", "yā")
    text = mw.ustring.gsub(text, "huō", "hū")
    text = mw.ustring.gsub(text, "hiē", "hī")
    text = mw.ustring.gsub(text, "êha", "êhê")

    -- vao as a medial consonant
    text = mw.ustring.gsub(text, "ūa", "uva")
    text = mw.ustring.gsub(text, "ɔ̄([aiu])", "av%1")
    --

    -- Final corrections
    text = mw.ustring.gsub(text, "āa", "ā")
    text = mw.ustring.gsub(text, "aaa", "ā")
    text = mw.ustring.gsub(text, "āā", "ā")
    text = mw.ustring.gsub(text, "aa", "ā")
    text = mw.ustring.gsub(text, "ë", "ē")
    text = mw.ustring.gsub(text, "ï", "ī")
    text = mw.ustring.gsub(text, "’alle", "’allāh")
    return text
end
return export
