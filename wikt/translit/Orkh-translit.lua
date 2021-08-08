local export = {}

local tt = {
    ["𐰀"] = "a", -- ORKHON A
    ["𐰃"] = "i", -- ORKHON I
    ["𐰆"] = "u", -- ORKHON O
    ["𐰇"] = "ü", -- ORKHON OE
    ["𐰉"] = "b¹", -- ORKHON AB
    ["𐰋"] = "b²", -- ORKHON AEB
    ["𐰍"] = "ǧ", -- ORKHON AG
    ["𐰏"] = "g", -- ORKHON AEG
    ["𐰑"] = "d¹", -- ORKHON AD
    ["𐰓"] = "d²", -- ORKHON AED
    ["𐰕"] = "z", -- ORKHON EZ
    ["𐰖"] = "y¹", -- ORKHON AY
    ["𐰘"] = "y²", -- ORKHON AEY
    ["𐰚"] = "k", -- ORKHON AEK
    ["𐰜"] = "k̥", -- ORKHON OEK
    ["𐰞"] = "l¹", -- ORKHON AL
    ["𐰠"] = "l²", -- ORKHON AEL
    ["𐰡"] = "lt", -- ORKHON ELT
    ["𐰢"] = "m", -- ORKHON EM
    ["𐰣"] = "n¹", -- ORKHON AN
    ["𐰤"] = "n²", -- ORKHON AEN
    ["𐰦"] = "nt", -- ORKHON ENT
    ["𐰨"] = "nč", -- ORKHON ENC
    ["𐰪"] = "ń", -- ORKHON ENY
    ["𐰭"] = "ŋ", -- ORKHON ENG
    ["𐰯"] = "p", -- ORKHON EP
    ["𐰰"] = "p̊", -- ORKHON OP
    ["𐰱"] = "č̥", -- ORKHO IC
    ["𐰲"] = "č", -- ORKHON EC
    ["𐰴"] = "q", -- ORKHON AQ
    ["𐰶"] = "q̊²", -- ORKHON IQ
    ["𐰸"] = "q̊¹", -- ORKHON OQ
    ["𐰺"] = "r¹", -- ORKHON AR
    ["𐰼"] = "r²", -- ORKHON AER
    ["𐰽"] = "s¹", -- ORKHON AS
    ["𐰾"] = "s²", -- ORKHON AES
    ["𐱁"] = "š", -- ORKHON ESH
    ["𐱃"] = "t¹", -- ORKHON AT
    ["𐱅"] = "t²", -- ORKHON AET
    ["𐱇"] = "t̥", -- ORKHON OT
    ["𐱈"] = "bš" -- ORKHON BASH
}

function export.tr(text, lang, sc)
    -- If the script is not Orkh, do not transliterate
    if sc ~= "Orkh" then return end

    -- Transliterate characters
    text = mw.ustring.gsub(text, ".", tt)

    return text
end

return export
