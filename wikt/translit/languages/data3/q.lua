local u = mw.ustring.char

-- UTF-8 encoded strings for some commonly-used diacritics
local GRAVE = u(0x0300)
local ACUTE = u(0x0301)
local CIRC = u(0x0302)
local TILDE = u(0x0303)
local MACRON = u(0x0304)
local BREVE = u(0x0306)
local DOTABOVE = u(0x0307)
local DIAER = u(0x0308)
local CARON = u(0x030C)
local DGRAVE = u(0x030F)
local INVBREVE = u(0x0311)
local DOTBELOW = u(0x0323)
local RINGBELOW = u(0x0325)
local CEDILLA = u(0x0327)

local Latn = {"Latn"}

local m = {}

m["qua"] = {"Quapaw", 3412974, "sio-dhe", scripts = Latn}

m["quc"] = {"K'iche'", 36494, "myn", scripts = Latn}

m["qui"] = {"Quileute", 3414490, "chi", scripts = Latn}

m["qum"] = {"Sipakapense", 36589, "myn", scripts = Latn}

m["qun"] = {"Quinault", 3414522, "sal", scripts = Latn}

m["quq"] = { -- should this continue to be considered separate language?
    "Quinqui",
    5908714,
    scripts = Latn
}

m["quv"] = {"Sacapulteco", 36412, "myn", scripts = Latn}

m["qvy"] = {"Queyu", 3414352, "sit-qia"}

m["qwc"] = {"Classical Quechua", 35882, "qwe", scripts = Latn}

m["qwm"] = {"Kipchak", 1199226, "trk-kip", scripts = {"Latn", "Armn", "Arab"}, translit_module = "translit-redirect"}

m["qwt"] = {"Kwalhioqua-Tlatskanai", 20641, "ath-nor", scripts = Latn}

m["qxs"] = {"Southern Qiang", 56563, "sit-qia", scripts = Latn}

m["qya"] = {"Quenya", 56383, "art", type = "appendix-constructed", scripts = {"Latn", "Teng"}}

m["qyp"] = {"Quiripi", 3414714, "alg-eas", scripts = Latn}

return m
