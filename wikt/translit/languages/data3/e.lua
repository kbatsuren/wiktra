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

m["ebg"] = {"Ebughu", 35294, "nic-lcr", scripts = Latn}

m["ebk"] = {"Eastern Bontoc", nil, "phi", scripts = Latn}

m["ebr"] = {"Ebrié", 36644, "alv-ptn", scripts = Latn}

m["ebu"] = {"Embu", 35318, "bnt-kka", scripts = Latn}

m["ecr"] = {"Eteocretan", 35461, scripts = {"Grek"}}

m["ecs"] = {
    "Ecuadorian Sign Language",
    3436769,
    "sgn",
    scripts = Latn -- when documented
}

m["ecy"] = {"Eteocypriot", 35309, scripts = {"Cprt"}}

m["eee"] = {"E", 35386, "qfa-mix", scripts = {"Hani", "Latn"}}

m["efa"] = {"Efai", 3813297, "nic-ief", scripts = Latn}

m["efe"] = {"Efe", 56354, "csu-mle", scripts = Latn}

m["efi"] = {"Efik", 35377, "nic-ief", scripts = Latn}

m["ega"] = {"Ega", 3914927, "alv", scripts = Latn}

m["egl"] = {"Emilian", 1057898, "roa-git", scripts = Latn, wikimedia_codes = {"eml"}}

m["ego"] = {"Eggon", 35300, "nic-pls", scripts = Latn}

m["egy"] = {"Egyptian", 50868, "egx", scripts = {"Latinx", "Egyp", "Egyd"}}

m["ehu"] = {"Ehueun", 3441392, "alv-nwd", scripts = Latn}

m["eip"] = {"Eipomek", 5349839, "ngf", scripts = Latn}

m["eit"] = {"Eitiep", 5350030, "qfa-tor", scripts = Latn}

m["eiv"] = {"Askopan", 56324, "paa-nbo", scripts = Latn}

m["eja"] = {"Ejamat", 6269820, "alv-jfe", scripts = Latn}

m["eka"] = {"Ekajuk", 35250, "nic-eko", scripts = Latn}

m["eke"] = {"Ekit", 3509628, "nic-ief", scripts = Latn}

m["ekg"] = {"Ekari", 5350305, "ngf", scripts = Latn}

m["eki"] = {"Eki", 5350418, "nic-ief", scripts = Latn}

m["ekl"] = {"Kolhe", 6426945, "mun", scripts = Latn}

m["ekm"] = {"Elip", 12952414, "nic-ymb", scripts = Latn}

m["eko"] = {"Koti", 29930, "bnt-mak", scripts = Latn}

m["ekp"] = {"Ekpeye", 35254, "alv-igb", scripts = Latn}

m["ekr"] = {"Yace", 36901, "alv-ido", scripts = Latn}

m["eky"] = {"Eastern Kayah", 25559417, "kar", scripts = {"Kali"}}

m["ele"] = {"Elepi", 5359444, "qfa-tor", scripts = Latn}

m["elh"] = {"El Hugeirat", 5351410, "nub-hil", scripts = Latn}

m["eli"] = {"Nding", 36176, "alv-tal", scripts = Latn}

m["elk"] = {"Elkei", 5364210, "qfa-tor", scripts = Latn}

m["elm"] = {"Eleme", 3914427, "nic-ogo", scripts = Latn}

m["elo"] = {"El Molo", 56719, "cus", scripts = Latn}

m["elu"] = {"Elu", 3364594, "poz-aay", scripts = Latn}

m["elx"] = {"Elamite", 35470, "qfa-iso", scripts = {"Xsux"}}

m["ema"] = {"Emai", 35428, "alv-eeo", scripts = Latn}

m["emb"] = {"Embaloh", 5369424, "poz", scripts = Latn}

m["eme"] = {"Emerillon", 3588942, "tup-gua", scripts = Latn}

m["emg"] = {"Eastern Meohang", 12952840, "sit-kie", scripts = {"Deva"}}

m["emi"] = {"Mussau-Emira", 6943093, "poz-ocw", scripts = Latn}

m["emk"] = {"Eastern Maninkakan", 11002130, "dmn-mnk", scripts = {"Latn", "Arab", "Nkoo"}}

m["emm"] = {"Mamulique", 3285082, "nai-pak", scripts = Latn}

m["emn"] = {"Eman", 5368975, "nic-tvc", scripts = Latn}

m["emp"] = {"Northern Emberá", 2391297, "sai-chc", scripts = Latn}

m["ems"] = {"Alutiiq", 27992, "ypk", scripts = Latn}

m["emu"] = {"Eastern Muria", 12952883, "dra", ancestors = {"gon"}}

m["emw"] = {"Emplawas", 5374265, "poz-tim", scripts = Latn}

m["emx"] = {"Erromintxela", 1122188, "qfa-mix", ancestors = {"eu", "rom"}, scripts = Latn}

m["emy"] = {"Epigraphic Mayan", 301355, "myn", scripts = {"Maya"}}

m["ena"] = {"Apali", 3504201, "ngf-mad", scripts = Latn}

m["enb"] = {"Markweeta", 56874, "sdv-nma", scripts = Latn}

m["enc"] = {"En", 3504110, "qfa-buy", scripts = Latn}

m["end"] = {"Ende", 2067656, "poz-cet", scripts = Latn}

m["enf"] = {"Forest Enets", 30249597, "syd", scripts = Latn}

m["enh"] = {"Tundra Enets", 25559411, "syd", scripts = Latn}

m["enl"] = {"Enlhet", 15462671, "sai-mas", scripts = Latn}

m["enm"] = {"Middle English", 36395, "gmw", scripts = Latn, ancestors = {"ang"}, entry_name = {from = {"[ĀÁ]", "[āá]", "[ǢǼ]", "[ǣǽ]", "Ċ", "ċ", "[ĒÉĖ]", "[ēéė]", "Ġ", "ġ", "[ĪÍ]", "[īí]", "[ŌÓ]", "[ōó]", "[ŪÚ]", "[ūú]", "[ȲÝ]", "[ȳý]", MACRON, ACUTE, DOTABOVE}, to = {"A", "a", "Æ", "æ", "C", "c", "E", "e", "G", "g", "I", "i", "O", "o", "U", "u", "Y", "y"}}}

m["enn"] = {"Engenni", 3915365, "alv-dlt", scripts = Latn}

m["eno"] = {"Enggano", 2669164, "poz", scripts = Latn}

m["enq"] = {"Enga", 1143040, "paa-eng", scripts = Latn}

m["enr"] = {"Emem", 5370369, "paa-pau"}

m["enu"] = {"Enu", 5380858, "tbq-lol"}

m["env"] = {"Enwan", 3438334, "alv-yek", scripts = Latn}

m["enw"] = {"Enwang", 11134434, "nic-lcr", scripts = Latn}

m["enx"] = {"Enxet", 15462609, "sai-mas", scripts = Latn}

m["eot"] = {"Eotile", 3915347, "alv-ptn", scripts = Latn}

m["epi"] = {"Epie", 35291, "alv-dlt", scripts = Latn}

m["era"] = {"Eravallan", 5385061, "dra"}

m["erg"] = {"Sie", 426254, "poz-occ", scripts = Latn}

m["erh"] = {"Eruwa", 3441244, "alv-swd", scripts = Latn}

m["eri"] = {"Ogea", 7079984, "ngf-mad", scripts = Latn}

m["erk"] = {"South Efate", 3449070, "poz-vnc", scripts = Latn}

m["ero"] = {"Horpa", 56854, "sit-rgy"}

m["err"] = {"Erre", 10488401, "qfa-iso", scripts = Latn}

m["ers"] = {
    "Ersu",
    12952417,
    "sit-qia",
    scripts = Latn -- also Ersu Shaba
}

m["ert"] = {"Eritai", 56376, "paa-lkp", scripts = Latn}

m["erw"] = {"Erokwanas", 5395296, "poz-hce", scripts = Latn}

m["ese"] = {"Ese Ejja", 2980381, "sai-tac", scripts = Latn}

m["esh"] = {"Eshtehardi", 12952418, "xme-ttc", scripts = {"fa-Arab", "Latn"}, ancestors = {"xme-ttc-sou"}}

m["esi"] = {"North Alaskan Inupiatun", nil, "esx-inu", scripts = Latn}

m["esk"] = {"Northwest Alaska Inupiatun", 25559714, "esx-inu", scripts = Latn}

m["esl"] = {"Egyptian Sign Language", 5348443, "sgn"}

m["esm"] = {"Esuma", 16927555, "alv-kwa", scripts = Latn}

m["esn"] = {
    "Salvadoran Sign Language",
    7406492,
    "sgn",
    scripts = Latn -- when documented
}

m["eso"] = {
    "Estonian Sign Language",
    3196221,
    "sgn",
    scripts = Latn -- when documented
}

m["esq"] = {"Esselen", 1294243, "qfa-iso", scripts = Latn}

m["ess"] = {"Central Siberian Yupik", 27993, "ypk", scripts = {"Cyrl"}}

m["esu"] = {"Yup'ik", 21117, "ypk", scripts = Latn}

m["esy"] = {
    "Eskayan",
    867086,
    "art",
    scripts = Latn -- also its own native script
}

m["etb"] = {"Etebi", 11002851, "nic-ief", scripts = Latn}

m["etc"] = {"Etchemin", 5402493, "alg-eas", scripts = Latn}

m["eth"] = {"Ethiopian Sign Language", 3501903, "sgn"}

m["etn"] = {"Eton (Vanuatu)", 3059362, "poz-oce", scripts = Latn}

m["eto"] = {"Eton (Cameroon)", 35317, "bnt-btb", scripts = Latn}

m["etr"] = {"Edolo", 5340184, "ngf", scripts = Latn}

m["ets"] = {"Yekhee", 3915848, "alv-yek", scripts = Latn}

m["ett"] = {"Etruscan", 35726, "qfa-tyn", scripts = {"Ital"}, translit_module = "Ital-translit"}

m["etu"] = {"Ejagham", 35296, "nic-eko", scripts = Latn}

m["etx"] = {"Eten", 3915392, "nic-beo", scripts = Latn}

m["etz"] = {"Semimi", 10950308, "paa-mai", scripts = Latn}

m["eve"] = {"Even", 29960, "tuw", scripts = {"Cyrl", "Latn"}, entry_name = {from = {"[Ӣ]", "[ӣ]", "[Ӯ]", "[ӯ]", MACRON, DOTBELOW, DOTABOVE}, to = {"И", "и", "У", "у"}}, translit_module = "eve-translit"}

m["evh"] = {"Uvbie", 3441344, "alv-swd", scripts = Latn}

m["evn"] = {"Evenki", 30004, "tuw", scripts = {"Cyrl"}, entry_name = {from = {"[Ӣ]", "[ӣ]", "[Ӯ]", "[ӯ]", MACRON, DOTBELOW, DOTABOVE}, to = {"И", "и", "У", "у"}}, translit_module = "evn-translit"}

m["ewo"] = {"Ewondo", 35459, "bnt-btb", scripts = Latn}

m["ext"] = {"Extremaduran", 30007, "roa-ibe", scripts = Latn}

m["eya"] = {"Eyak", 27480, "xnd", scripts = Latn}

m["eyo"] = {"Keiyo", 56856, "sdv-nma", scripts = Latn}

m["eza"] = {"Ezaa", 11921436, "alv-igb", ancestors = {"izi"}, scripts = Latn}

m["eze"] = {"Uzekwe", 3502244, "nic-ucn", scripts = Latn}

return m
