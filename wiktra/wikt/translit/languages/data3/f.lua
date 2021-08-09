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

m["faa"] = {"Fasu", 3446687, "paa-kut", Latn}

m["fab"] = {"Annobonese", 34992, "crp", Latn, ancestors = {"pt"}}

m["fad"] = {"Wagi", 7959569, "ngf-mad", Latn}

m["faf"] = {"Fagani", 3063759, "poz-sls", Latn}

m["fag"] = {"Finongan", 3450761, "ngf-fin", Latn}

m["fah"] = {"Baissa Fali", 3446632, "nic-bco", Latn}

m["fai"] = {"Faiwol", 3501773, "ngf-okk", Latn}

m["faj"] = {"Faita", 976953, "ngf-mad", Latn}

m["fak"] = {"Fang (Beboid)", 5433811, "nic-beb", Latn}

m["fal"] = {"South Fali", 15637351, "alv-fli", Latn}

m["fam"] = {"Fam", 35290, "nic-mmb", Latn}

m["fan"] = {"Fang (Bantu)", 33484, "bnt-btb", Latn}

m["fap"] = {"Palor", 36318, "alv-cng", Latn}

m["far"] = {"Fataleka", 3067168, "poz-sls", Latn}

-- "fat" IS TREATED AS "ak", SEE WT:LT

m["fau"] = {"Fayu", 5439113, "paa-lkp", Latn}

m["fax"] = {"Fala", 300402, "roa-ibe", Latn, ancestors = {"roa-opt"}}

m["fay"] = {"Southwestern Fars", 5228140, "ira-swi"}

m["faz"] = {"Northwestern Fars", 7060307, "ira-swi"}

m["fbl"] = {"West Albay Bikol", 18603801, "phi", Latn}

m["fcs"] = {
    "Quebec Sign Language", 13193, "sgn", Latn -- when documented
}

m["fer"] = {"Feroge", 35287, "nic-ser", Latn}

m["ffi"] = {"Foia Foia", 8564176, "ngf", Latn}

-- "ffm" IS TREATED AS "ff", SEE WT:LT

m["fgr"] = {"Fongoro", 3437645, "csu", Latn}

m["fia"] = {"Nobiin", 36503, "nub", Latn, ancestors = {"onw"}}

m["fie"] = {"Fyer", 56273, "cdc-wst", Latn}

-- "fil" IS TREATED AS "tl", SEE WT:LT

m["fip"] = {"Fipa", 667747, "bnt-mwi", Latn}

m["fir"] = {"Firan", 3915847, "nic-plc", Latn}

m["fit"] = {"Meänkieli", 13357, "fiu-fin", Latn, ancestors = {"fi"}}

m["fiw"] = {"Fiwaga", 5456292, "paa-kut", Latn}

m["fkk"] = {"Kirya-Konzel", 6416310, "cdc-cbm", Latn}

m["fkv"] = {"Kven", 165795, "fiu-fin", Latn, ancestors = {"fi"}}

m["fla"] = {"Montana Salish", 3111983, "sal", Latn}

m["flh"] = {"Foau", 5463819, "paa-lkp", Latn}

m["fli"] = {"Fali", 56244, "cdc-cbm", Latn}

m["fll"] = {"North Fali", 12952419, "alv-fli", Latn}

m["fln"] = {"Flinders Island", 3915702, "aus-pmn", Latn}

m["flr"] = {"Fuliiru", 7166821, "bnt-shh", Latn}

m["fly"] = {"Tsotsitaal", 12643960, "crp", Latn, ancestors = {"af"}}

m["fmp"] = {"Fe'fe'", 35276, "bai", Latn}

m["fmu"] = {"Far Western Muria", 42589412, "dra", ancestors = {"gon"}}

m["fng"] = {"Fanagalo", 35727, "crp", Latn, ancestors = {"zu"}}

m["fni"] = {"Fania", 317642, "alv-bua", Latn}

m["fod"] = {"Foodo", 5465566, "alv-gng", Latn}

m["foi"] = {"Foi", 5464146, "paa-kut", Latn}

m["fom"] = {"Foma", 5464911, "bnt-ske", Latn, ancestors = {"khy"}}

m["fon"] = {"Fon", 33291, "alv-gbe", Latn}

m["for"] = {"Fore", 3077126, "paa-kag", Latn}

m["fos"] = {"Siraya", 716604, "map", Latn}

m["fpe"] = {"Pichinglis", 35288, "crp", Latn, ancestors = {"en"}}

m["fqs"] = {"Fas", 56320, "paa", Latn}

-- "frc" IS TREATED AS "fr" (or as etymology-only), SEE WT:LT

m["frd"] = {"Fordata", 5468035, "poz", Latn}

m["frm"] = {"Middle French", 1473289, "roa-oil", Latn, ancestors = {"fro"}, sort_key = {from = {"[áàâä]", "[éèêë]", "[íìîï]", "[óòôö]", "[úùûü]", "[ýỳŷÿ]", "ç", "'"}, to = {"a", "e", "i", "o", "u", "y", "c"}}}

m["fro"] = {"Old French", 35222, "roa-oil", {"Latn", "Hebr"}, sort_key = {from = {"[áàâä]", "[éèêë]", "[íìîï]", "[óòôö]", "[úùûü]", "[ýỳŷÿ]", "ç", "'"}, to = {"a", "e", "i", "o", "u", "y", "c"}}}

m["frp"] = {"Franco-Provençal", 15087, "roa", Latn, sort_key = {from = {"[áàâä]", "[éèêë]", "[íìîï]", "[óòôö]", "[úùûü]", "[ýỳŷÿ]", "ç", "'"}, to = {"a", "e", "i", "o", "u", "y", "c"}}}

m["frq"] = {"Forak", 5467173, "ngf-fin", Latn}

m["frr"] = {"North Frisian", 28224, "gmw-fri", Latn}

-- "frs" IS NOT USED, SEE WT:LT

m["frt"] = {"Fortsenal", 2666835, "poz-vnc", Latn}

m["fse"] = {
    "Finnish Sign Language", 33225, "sgn", Latn -- when documented
}

m["fsl"] = {
    "French Sign Language", 33302, "sgn-fsl", Latn -- when documented
}

m["fss"] = {
    "Finnish-Swedish Sign Language", 5450448, "sgn", Latn -- when documented
}

-- "fub" IS TREATED AS "ff", SEE WT:LT

-- "fuc" IS TREATED AS "ff", SEE WT:LT

m["fud"] = {"East Futuna", 35334, "poz-pnp", Latn}

-- "fue" IS TREATED AS "ff", SEE WT:LT

-- "fuf" IS TREATED AS "ff", SEE WT:LT

-- "fuh" IS TREATED AS "ff", SEE WT:LT

-- "fui" IS TREATED AS "ff", SEE WT:LT

m["fuj"] = {"Ko", 35693, "alv-hei", Latn}

m["fum"] = {"Fum", 11011870, "nic-nka", Latn}

m["fun"] = {"Fulniô", 774441, "qfa-iso", Latn}

-- "fuq" IS TREATED AS "ff", SEE WT:LT

m["fur"] = {"Friulian", 33441, "roa-rhe", Latn}

m["fut"] = {"Futuna-Aniwa", 3064409, "poz-pnp", Latn}

m["fuu"] = {"Furu", 3441160, "csu-bkr", Latn}

-- "fuv" IS TREATED AS "ff", SEE WT:LT

m["fuy"] = {"Fuyug", 3073472, "ngf", Latn}

m["fvr"] = {"Fur", 33364, "ssa-fur", Latn}

m["fwa"] = {"Fwâi", 3091331, "poz-cln", Latn}

m["fwe"] = {"Fwe", 5511159, "bnt-bot", Latn}

return m
