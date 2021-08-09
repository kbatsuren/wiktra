local export = {}

local tt = {
    ["𐰀"] = "a", -- ORKHON A
    ["𐰃"] = "i", -- ORKHON I
    ["𐰆"] = "U", -- ORKHON O
    ["𐰇"] = "u", -- ORKHON OE
    ["𐰉"] = "B", -- ORKHON AB
    ["𐰋"] = "b", -- ORKHON AEB
    ["𐰍"] = "G", -- ORKHON AG
    ["𐰏"] = "g", -- ORKHON AEG
    ["𐰑"] = "D", -- ORKHON AD
    ["𐰓"] = "d", -- ORKHON AED
    ["𐰔"] = "z", -- ORKHON EZ
    ["𐰖"] = "J", -- ORKHON AY
    ["𐰘"] = "j", -- ORKHON AEY
    ["𐰚"] = "K", -- ORKHON AEK
    ["𐰜"] = "q", -- ORKHON OEK
    ["𐰞"] = "L", -- ORKHON AL
    ["𐰠"] = "l", -- ORKHON AEL
    ["𐰡"] = "w", -- ORKHON ELT
    ["𐰢"] = "m", -- ORKHON EM
    ["𐰣"] = "N", -- ORKHON AN
    ["𐰤"] = "n", -- ORKHON AEN
    ["𐰦"] = "O", -- ORKHON ENT
    ["𐰨"] = "W", -- ORKHON ENC
    ["𐰪"] = "F", -- ORKHON ENY
    ["𐰭"] = "y", -- ORKHON ENG
    ["𐰯"] = "p", -- ORKHON EP
    ["𐰲"] = "C", -- ORKHON EC
    ["𐰴"] = "Q", -- ORKHON AQ
    ["𐰶"] = "k", -- ORKHON IQ
    ["𐰸"] = "x", -- ORKHON OQ
    ["𐰺"] = "R", -- ORKHON AR
    ["𐰼"] = "r", -- ORKHON AER
    ["𐰽"] = "S", -- ORKHON AS
    ["𐰾"] = "s", -- ORKHON AES
    ["𐰿"] = "c", -- ORKHON ASH
    ["𐱁"] = "Y", -- ORKHON ESH
    ["𐱃"] = "T", -- ORKHON AT
    ["𐱅"] = "t", -- ORKHON AET
    ["𐱈"] = "V" -- ORKHON BASH
}

function export.tr(text, lang, sc)
    -- If the script is not Orkh, do not transliterate
    if sc ~= "Orkh" then return end

    -- Transliterate characters
    text = mw.ustring.gsub(text, ".", tt)

    return text
end

return export
