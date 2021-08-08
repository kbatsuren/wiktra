local U = mw.ustring.char
local gsub = mw.ustring.gsub
local export = {}

local fatHatan = U(0x64B) -- What is the Persian term for this?
local fathe = U(0x64E) -- also zabar
local kasre = U(0x650) -- also zir
local zamme = U(0x64F) -- also piš
local tashdid = U(0x651) -- also called shadda
local jazm = U(0x652)
local alif = "ا"
local zwnj = "‌"
local he = "ه"

local waw = U(0x0648)
local ye = U(0x06CC)

local group = "بپتثجچحخدذرزژسشصضطظغفقکگلمنوهی"
local ZZP = "َُِ"

local mapping = {
    ["ا"] = "â",
    ["ب"] = "b",
    ["پ"] = "p",
    ["ت"] = "t",
    ["ث"] = "s",
    ["ج"] = "j",
    ["چ"] = "č",
    ["ح"] = "h",
    ["خ"] = "x",
    ["د"] = "d",
    ["ذ"] = "z",
    ["ر"] = "r",
    ["ز"] = "z",
    ["ژ"] = "ž",
    ["س"] = "s",
    ["ش"] = "š",
    ["ص"] = "s",
    ["ض"] = "z",
    ["ط"] = "t",
    ["ظ"] = "z",
    ["غ"] = "ğ",
    ["ف"] = "f",
    ["ق"] = "q",
    ["ک"] = "k",
    ["گ"] = "g",
    ["ل"] = "l",
    ["م"] = "m",
    ["ن"] = "n",
    ["و"] = "u",
    ["ه"] = "h",
    ["ی"] = "i",
    ["آ"] = "â",
    ["‌"] = "-",

    ["َ"] = "a",
    ["ِ"] = "e",
    ["ُ"] = "o",

    -- displaying on separate lines as the viewing becomes distorted on these combinations
    ["ع"] = "’",
    ["ء"] = "’",
    ["ئ"] = "’",
    ["ؤ"] = "’",
    ["أ"] = "’",

    -- diacritics
    [fathe] = "a",
    [kasre] = "e",
    [zamme] = "o",
    [jazm] = "", -- also sokun - no vowel
    [U(0x200C)] = "-", -- ZWNJ (zero-width non-joiner)
    [fatHatan] = "n",
    ["‌"] = "-",
    -- ligatures
    ["ﻻ"] = "lâ",
    ["ﷲ"] = "llâh",
    -- kashida
    ["ـ"] = "", -- kashida, no sound
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
    -- normal arabic variants to numerals
    ["١"] = "1",
    ["٢"] = "2",
    ["٣"] = "3",
    ["٤"] = "4",
    ["٥"] = "5",
    ["٦"] = "6",
    ["٧"] = "7",
    ["٨"] = "8",
    ["٩"] = "9",
    ["٠"] = "0",
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
    ["ۀ"] = "-ye" -- he ye (in ezâfe)
}

function export.tr(text, lang, sc)

    text = mw.ustring.gsub(text, "([" .. group .. "]" .. tashdid .. "?)ه$", "%1e")
    text = gsub(text, alif .. fathe, "a")
    text = gsub(text, he .. zwnj, "e-")

    text = gsub(text, kasre .. ye .. "([" .. group .. "])", "ey%1")
    text = gsub(text, jazm .. alif, "a")

    text = mw.ustring.gsub(text, "ىٰ", "â")
    text = mw.ustring.gsub(text, "ٰ", "â")
    text = mw.ustring.gsub(text, "ا" .. fatHatan, "an")
    -- text = mw.ustring.gsub(text, 'الله', "ﷲ")
    -- text = mw.ustring.gsub(text, 'لا', "ﻻ")
    text = mw.ustring.gsub(text, ".", mapping)

    text = mw.ustring.gsub(text, "aâ", "â")
    text = mw.ustring.gsub(text, "âa", "a")

    text = mw.ustring.gsub(text, "u([aâeiou])", "v%1")
    text = mw.ustring.gsub(text, "i([aâeiou])", "y%1")
    text = mw.ustring.gsub(text, "([aâeiou])(" .. tashdid .. ")", "%2%1") -- swapping tašdid with vowels
    text = mw.ustring.gsub(text, "(.)" .. tashdid, "%1%1") -- implementing tašdid
    text = mw.ustring.gsub(text, "eh$", "e")
    text = mw.ustring.gsub(text, "eh([^aâeiouy’bdfghjklmnpqrstvyxzčğšž])", "e%1")

    return text
end

return export
