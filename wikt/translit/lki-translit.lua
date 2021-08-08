-- Authors: JavaScript ئاسۆ; Lua Ghybu, Calak
local export = {}

local gsub = mw.ustring.gsub
local U = mw.ustring.char

local mapping = {
    ["ا"] = "a",
    ["ب"] = "b",
    ["چ"] = "ç",
    ["ج"] = "c",
    ["د"] = "d",
    ["ە"] = "e",
    ["ێ"] = "ê",
    ["ف"] = "f",
    ["گ"] = "g",
    ["ھ"] = "h",
    ["ه"] = "h",
    ["ح"] = "ḧ",
    ["ژ"] = "j",
    ["ک"] = "k",
    ["ڵ"] = "ll",
    ["ل"] = "l",
    ["م"] = "m",
    ["ن"] = "n",
    ["ۆ"] = "o",
    ["پ"] = "p",
    ["ق"] = "q",
    ["ر"] = "r",
    ["ڕ"] = "r",
    ["س"] = "s",
    ["ش"] = "ş",
    ["ت"] = "t",
    ["ۊ"] = "ü",
    ["ڤ"] = "v",
    ["خ"] = "x",
    ["غ"] = "ẍ",
    ["ز"] = "z",
    ["ئ"] = "",
    ["ع"] = "'",

    [U(0x200C)] = "", -- ZWNJ (zero-width non-joiner)
    ["ـ"] = "", -- kashida, no sound

    -- numerals
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
    -- persian variants to numerals
    ["۱"] = "1",
    ["۲"] = "2",
    ["۳"] = "3",
    ["۴"] = "4",
    ["۵"] = "5",
    ["۶"] = "6",
    ["۷"] = "7",
    ["۸"] = "8",
    ["۹"] = "9",
    ["۰"] = "0"
}

-- punctuation (leave on separate lines)
local punctuation = {
    ["؟"] = "?", -- question mark
    ["،"] = ",", -- comma
    ["؛"] = ";", -- semicolon
    ["«"] = "“", -- quotation mark
    ["»"] = "”", -- quotation mark
    ["٪"] = "%", -- percent
    ["؉"] = "‰", -- per mille
    ["٫"] = ".", -- decimals
    ["٬"] = "," -- thousand
}

-- translit
local function tr_word(word)

    word = gsub(word, ".", punctuation)

    -- Remove punctuation at the end of the word.
    if mw.ustring.find(word, "[%.%!،؛»«٪؉٫٬%p]$") then
        ponct = mw.ustring.sub(word, -1)
        word = gsub(word, "[%.%!،؛»«٪؉٫٬%p]$", "")
    else
        word = word
        ponct = ""
    end

    word = gsub(word, "ه‌", "ە") -- correct unicode for letter ە
    -- U+0647 (Arabic letter heh) + U+200C (zero-width non-joiner) → U+06D5 (Arabic letter ae)

    -- diacritics
    word = gsub(word, "ْ", "i") -- U+0652, Arabic sukun
    word = gsub(word, "ِ", "i") -- U+0650, Arabic kasra

    -- managing 'و' and 'ی'
    word = gsub(word, "و([iاێۆۊە])", "w%1") -- و + vowel => w (e.g. wan)
    word = gsub(word, "ی([iاێۆۊە])", "y%1") -- ی + vowel => y (e.g. yas)
    word = gsub(word, "([iاێۆۊە])و", "%1w") -- vowel + و => w (e.g. kew)
    word = gsub(word, "([iاێۆۊە])ی", "%1y") -- vowel + ی => y (e.g. bey)
    word = gsub(word, "([iاێۆە])ۊ", "%1ẅ") -- vowel + و => ẅ (e.g. taẅ)
    word = gsub(word, "([iاۆۊە])ێ", "%1ÿ") -- vowel + ێ => ÿ (e.g.  şeÿtan)
    word = gsub(word, "^و$", "û") -- non-letter + 'و' + non-letter => û (=and)

    word = gsub(word, "([^ء-يٱ-ەiwẅyÿ])و", "%1w") -- non-letter + 'و' => w (e.g. wetar)
    word = gsub(word, "^و", "w") -- first 'و' => w (e.g. wetar)
    word = gsub(word, "یو", "îw") -- 'ی' + 'و' => îw (e.g. mîwe)
    word = gsub(word, "([^و])یی", "%1îy") -- 'ی' + 'ی' => îy (e.g. kanîy)
    word = gsub(word, "وی", "uy") -- 'و' + 'ی' => uy (e.g. buyn)
    word = gsub(word, "وو", "û") -- 'و' + 'و' => û (e.g. nû)
    word = gsub(word, "ی", "î")
    word = gsub(word, "و", "u")
    word = gsub(word, "uu", "û") -- 'و' + 'و' => û (e.g. nû)
    word = gsub(word, "([ء-يٱ-ەiîuûwẅyÿ])ڕ", "%1rr") -- when 'ڕ' not at the beginning of a word => rr
    word = gsub(word, "([ء-يٱ-ەiîuûwẅyÿ])ئ", "%1'") -- when 'ئ' not at the beginning of a word => '

    word = gsub(word, ".", mapping)

    -- insert i where applicable
    word = gsub(word, "ll", "Ľ") -- temporary conversion to avoid seeing ll as 2 letters
    word = gsub(word, "rr", "Ŕ") -- temporary conversion to avoid seeing rr as 2 letters

    word = gsub(word, "([bcçdfghḧjklĽmnpqrŔsştvwẅxẍz])([fjlĽmnrŔsşvwẅxẍyÿz])([fjlĽmnrŔsşvwẅxẍyÿz])([^aeêiîouûüy])", "%1%2i%3%4") -- e.g. grft -> grift
    word = gsub(word, "([aeêiîouûü])([bcçdfghḧjklĽmnpqrŔsştvwẅxẍz])([bcçdfghḧjklĽmnpqrŔsştvwẅxẍz])([bcçdfghḧjklĽmnpqrŔsştvwẅxẍz])$", "%1%2%3i%4") -- e.g. cejnt -> cejnit
    word = gsub(word, "([fjlĽrŔsşwyz])([fjlĽmnrŔsşvwẅxẍyÿz])([bcçdfghḧjklĽmnpqrŔsştvwẅxẍz])", "%1i%2%3") -- e.g. wrd -> wird

    word = gsub(word, "([bcçdghḧkmnpqtvxẍ])([fjlĽmnrŔsşvwẅxẍyÿz])([^aeêiîouûü])", "%1i%2%3") -- e.g. prd -> pird
    word = gsub(word, "([bcçdghḧkmnpqtvxẍ])([fjlĽmnrŔsşvwẅxẍyÿz])$", "%1i%2") -- like above

    word = gsub(word, "([^aeêiîouûü])([bcçdghḧkmnpqtvxẍ])([fjlĽmnrŔsşvwẅxẍyÿz])([^aeêiîouûü])", "%1%2i%3%4") -- repeat the latter expression, in case skipped
    word = gsub(word, "([^aeêiîouûü])([bcçdghḧkmnpqtvxẍ])([fjlĽmnrŔsşvwẅxẍyÿz])$", "%1%2i%3") -- repeat the latter expression, in case skipped

    word = gsub(word, "^([bcçdfghḧjklĽmnpqrŔsştvwẅxẍz])([bcçdfghḧjklĽmnpqrŔsştvwẅxẍz])([^aeêiîouûü])", "%1i%2%3") -- e.g. ktk -> kitk
    word = gsub(word, "^([bcçdfghḧjklĽmnpqrŔsştvwẅxẍz])([bcçdfghḧjklĽmnpqrŔsştvwẅxẍz])$", "%1i%2") -- e.g. ktk -> kitk
    word = gsub(word, "([^aeêiîouüy])([bcçdfghḧjklĽmnpqrŔsştvwẅxẍz])([bcçdfghḧjklĽmnpqrŔsştvwẅxẍz])([^aeêiîouûü])", "%1%2i%3%4") -- e.g. ktk -> kitk
    word = gsub(word, "([^aeêiîouüy])([bcçdfghḧjklĽmnpqrŔsştvwẅxẍz])([bcçdfghḧjklĽmnpqrŔsştvwẅxẍz])$", "%1%2i%3") -- e.g. ktk -> kitk

    word = gsub(word, "([^a-zçşêîûüĽŔ])([bcçdfghḧjklĽmnpqrŔsştvwẅxẍz])$", "%1%2i") -- e.g. j -> ji
    word = gsub(word, "^([bcçdfghḧjklĽmnpqrŔsştvwẅxẍz])$", "%1i") -- e.g. j -> ji	

    -- word = gsub(word, '([^a-zêîûçş0-9\'’])([bcçdfghḧjklĽmnpqrŔsştvwẅxẍz])([bcçdfghḧjklĽmnpqrŔsştvxẍz])', "%1%2i%3") --e.g. bra -> bira
    -- word = gsub(word, '^([bcçdfghḧjklĽmnpqrŔsştvwẅxẍz])([bcçdfghḧjklĽmnpqrŔsştvxẍz])', "%1i%2") --e.g. bra -> bira

    -- word = gsub(word, '([bcçdfghḧjklmnpqrsştvwẅxẍz][bcçdfghḧjklĽmnpqrŔsştvwẅxẍz])([bcçdfghḧjklĽmnpqrŔsştvwẅxẍz])', "%1i%2") --e.g. aşkra -> aşkira

    -- word = gsub(word, 'si([tp][aeêiîouû])', "s%1") -- sp, st cluster

    word = gsub(word, "Ľ", "ll") -- revert the temporary conversion
    word = gsub(word, "Ŕ", "rr") -- revert the temporary conversion

    -- Add the punctuation who had previously deleted.
    word = word .. ponct

    return word
end

function export.tr(text, lang, sc)
    local textTab = {}

    -- Create a word table separated by a space (%s).
    for _, word in ipairs(mw.text.split(text, "%s+")) do table.insert(textTab, word) end

    -- Tablo of translit.
    for key, word in ipairs(textTab) do textTab[key] = tr_word(word) end

    return table.concat(textTab, " ")
end

return export
