local export = {}
local U = mw.ustring.char
local gsub = mw.ustring.gsub

local cons_list = "ʾbgdhwbzḥṭyklmnsʿfpṣqršt"
local cons = "[" .. cons_list .. "]"

local tt = {
    [1] = {
        -- occlusion
        [U(0x0805, 0x0818)] = "b",
        [U(0x0805, 0x0810)] = "p"
    },
    [2] = {
        -- consonants
        [U(0x0800)] = "ʾ", -- ALAF
        [U(0x0801)] = "b", -- BIT
        [U(0x0802)] = "g", -- GAMAN
        [U(0x0803)] = "d", -- DALAT
        [U(0x0804)] = "h", -- IY
        [U(0x0805)] = "w", -- BAA
        [U(0x0806)] = "z", -- ZEN
        [U(0x0807)] = "ḥ", -- IT
        [U(0x0808)] = "ṭ", -- TIT
        [U(0x0809)] = "y", -- YUT
        [U(0x080A)] = "k", -- KAAF
        [U(0x080B)] = "l", -- LABAT
        [U(0x080C)] = "m", -- MIM
        [U(0x080D)] = "n", -- NUN
        [U(0x080E)] = "s", -- SINGAAT
        [U(0x080F)] = "ʿ", -- IN
        [U(0x0810)] = "f", -- FI
        [U(0x0811)] = "ṣ", -- TSAADIY
        [U(0x0812)] = "q", -- QUF
        [U(0x0813)] = "r", -- RISH
        [U(0x0814)] = "š", -- SHAN
        [U(0x0815)] = "t", -- TAAF
        -- consonant modifier
        [U(0x0816)] = "ʿ", -- IN
        [U(0x0817)] = "ʿ", -- IN-ALAF
        [U(0x081A)] = "ỹ", -- MODIFIER EPENTHETIC YUT
        [U(0x081B)] = "ỹ", -- EPENTHETIC YUT
        -- vowel signs
        [U(0x081C)] = "ê", -- LONG E
        [U(0x081D)] = "e", -- E
        [U(0x081E)] = "å̂ː", -- OVERLONG AA
        [U(0x081F)] = "å̂", -- LONG AA
        [U(0x0820)] = "å", -- AA
        [U(0x0821)] = "âː", -- OVERLONG A
        [U(0x0822)] = "â", -- LONG A
        [U(0x0823)] = "a", -- A
        [U(0x0824)] = "ă", -- MODIFIER SHORT A
        [U(0x0825)] = "ă", -- SHORT A
        [U(0x0826)] = "u", -- U
        [U(0x0827)] = "û", -- LONG U
        [U(0x0828)] = "i", -- MODIFIER LETTER I
        [U(0x0829)] = "î", -- LONG I
        [U(0x082A)] = "i", -- I
        [U(0x082B)] = "o", -- O
        [U(0x082C)] = "", -- SUKUN
        -- punctuation
        [U(0x0830)] = " " -- PUNCTUATION NEQUDAA
    },
    [3] = {
        -- consonant with dagesh
        ["(" .. cons .. ")" .. U(0x0819)] = "%1%1"
    }
}

function export.tr(text, lang, sc)
    for _, replacements in ipairs(tt) do for regex, replacement in pairs(replacements) do text = gsub(text, regex, replacement) end end

    return text
end

return export
