local export = {}

local U = mw.ustring.char

local acute = U(0x301) -- combining acute
local grave = U(0x300) -- combining grave

local tt = {
    [1] = {
        -- consonants
        ["K"] = "kh",
        ["G"] = "gh",
        ["N"] = "ṅ",
        ["C"] = "ch",
        ["J"] = "jh",
        ["Y"] = "ñ",
        ["w"] = "ṭ",
        ["W"] = "ṭh",
        ["q"] = "ḍ",
        ["Q"] = "ḍh",
        ["R"] = "ṇ",
        ["T"] = "th",
        ["D"] = "dh",
        ["P"] = "ph",
        ["B"] = "bh",
        ["L"] = "ḷ",
        ["S"] = "ś",
        ["z"] = "ṣ",

        -- vowels
        ["A"] = "ā",
        ["I"] = "ī",
        ["U"] = "ū",
        ["f"] = "ṛ",
        ["F"] = "ṝ",
        ["x"] = "ḷ",
        ["X"] = "ḹ",
        ["E"] = "ai",
        ["O"] = "au",

        -- chandrabindu
        ["~"] = "m̐", -- until a better method is found

        -- anusvara
        ["M"] = "ṃ", -- until a better method is found

        -- visarga
        ["H"] = "ḥ",

        -- avagraha
        ["'"] = "’",

        -- Vedic extensions
        ["/"] = acute,
        ["\\"] = grave
    },
    [2] = {
        -- Vedic extensions
        ["Z"] = "x",
        ["V"] = "f"
    }
}

function export.tr(text, lang, sc)

    text = mw.ustring.gsub(text, ".", tt[1])
    text = mw.ustring.gsub(text, ".", tt[2])

    return mw.ustring.toNFC(text)
end

return export
