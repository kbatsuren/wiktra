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

m["ebg"] = {"Ebughu", 35294, "nic-lcr", Latn}

m["ebk"] = {"Eastern Bontoc", nil, "phi", Latn}

m["ebr"] = {"Ebrié", 36644, "alv-ptn", Latn}

m["ebu"] = {"Embu", 35318, "bnt-kka", Latn}

m["ecr"] = {"Eteocretan", 35461, nil, {"Grek"}}

m["ecs"] = {
    "Ecuadorian Sign Language", 3436769, "sgn", Latn -- when documented
}

m["ecy"] = {"Eteocypriot", 35309, nil, {"Cprt"}}

m["eee"] = {"E", 35386, "qfa-mix", {"Hani", "Latn"}}

m["efa"] = {"Efai", 3813297, "nic-ief", Latn}

m["efe"] = {"Efe", 56354, "csu-mle", Latn}

m["efi"] = {"Efik", 35377, "nic-ief", Latn}

m["ega"] = {"Ega", 3914927, "alv", Latn}

m["egl"] = {"Emilian", 1057898, "roa-git", Latn, wikimedia_codes = {"eml"}}

m["ego"] = {"Eggon", 35300, "nic-pls", Latn}

m["egy"] = {"Egyptian", 50868, "egx", {"Latinx", "Egyp", "Egyd"}}

m["ehu"] = {"Ehueun", 3441392, "alv-nwd", Latn}

m["eip"] = {"Eipomek", 5349839, "ngf", Latn}

m["eit"] = {"Eitiep", 5350030, "qfa-tor", Latn}

m["eiv"] = {"Askopan", 56324, "paa-nbo", Latn}

m["eja"] = {"Ejamat", 6269820, "alv-jfe", Latn}

m["eka"] = {"Ekajuk", 35250, "nic-eko", Latn}

m["eke"] = {"Ekit", 3509628, "nic-ief", Latn}

m["ekg"] = {"Ekari", 5350305, "ngf", Latn}

m["eki"] = {"Eki", 5350418, "nic-ief", Latn}

m["ekl"] = {"Kolhe", 6426945, "mun", Latn}

m["ekm"] = {"Elip", 12952414, "nic-ymb", Latn}

m["eko"] = {"Koti", 29930, "bnt-mak", Latn}

m["ekp"] = {"Ekpeye", 35254, "alv-igb", Latn}

m["ekr"] = {"Yace", 36901, "alv-ido", Latn}

m["eky"] = {"Eastern Kayah", 25559417, "kar", {"Kali"}}

m["ele"] = {"Elepi", 5359444, "qfa-tor", Latn}

m["elh"] = {"El Hugeirat", 5351410, "nub-hil", Latn}

m["eli"] = {"Nding", 36176, "alv-tal", Latn}

m["elk"] = {"Elkei", 5364210, "qfa-tor", Latn}

m["elm"] = {"Eleme", 3914427, "nic-ogo", Latn}

m["elo"] = {"El Molo", 56719, "cus", Latn}

m["elu"] = {"Elu", 3364594, "poz-aay", Latn}

m["elx"] = {"Elamite", 35470, "qfa-iso", {"Xsux"}}

m["ema"] = {"Emai", 35428, "alv-eeo", Latn}

m["emb"] = {"Embaloh", 5369424, "poz", Latn}

m["eme"] = {"Emerillon", 3588942, "tup-gua", Latn}

m["emg"] = {"Eastern Meohang", 12952840, "sit-kie", {"Deva"}}

m["emi"] = {"Mussau-Emira", 6943093, "poz-ocw", Latn}

m["emk"] = {"Eastern Maninkakan", 11002130, "dmn-mnk", {"Latn", "Arab", "Nkoo"}}

m["emm"] = {"Mamulique", 3285082, "nai-pak", Latn}

m["emn"] = {"Eman", 5368975, "nic-tvc", Latn}

m["emp"] = {"Northern Emberá", 2391297, "sai-chc", Latn}

m["ems"] = {"Alutiiq", 27992, "ypk", Latn}

m["emu"] = {"Eastern Muria", 12952883, "dra", ancestors = {"gon"}}

m["emw"] = {"Emplawas", 5374265, "poz-tim", Latn}

m["emx"] = {"Erromintxela", 1122188, "qfa-mix", Latn, ancestors = {"eu", "rom"}}

m["emy"] = {"Epigraphic Mayan", 301355, "myn", {"Maya"}}

m["ena"] = {"Apali", 3504201, "ngf-mad", Latn}

m["enb"] = {"Markweeta", 56874, "sdv-nma", Latn}

m["enc"] = {"En", 3504110, "qfa-buy", Latn}

m["end"] = {"Ende", 2067656, "poz-cet", Latn}

m["enf"] = {"Forest Enets", 30249597, "syd", Latn}

m["enh"] = {"Tundra Enets", 25559411, "syd", Latn}

m["enl"] = {"Enlhet", 15462671, "sai-mas", Latn}

m["enm"] = {"Middle English", 36395, "gmw", Latn, ancestors = {"ang"}, entry_name = {from = {"[ĀÁ]", "[āá]", "[ǢǼ]", "[ǣǽ]", "Ċ", "ċ", "[ĒÉĖ]", "[ēéė]", "Ġ", "ġ", "[ĪÍ]", "[īí]", "[ŌÓ]", "[ōó]", "[ŪÚ]", "[ūú]", "[ȲÝ]", "[ȳý]", MACRON, ACUTE, DOTABOVE}, to = {"A", "a", "Æ", "æ", "C", "c", "E", "e", "G", "g", "I", "i", "O", "o", "U", "u", "Y", "y"}}}

m["enn"] = {"Engenni", 3915365, "alv-dlt", Latn}

m["eno"] = {"Enggano", 2669164, "poz", Latn}

m["enq"] = {"Enga", 1143040, "paa-eng", Latn}

m["enr"] = {"Emem", 5370369, "paa-pau"}

m["enu"] = {"Enu", 5380858, "tbq-lol"}

m["env"] = {"Enwan", 3438334, "alv-yek", Latn}

m["enw"] = {"Enwang", 11134434, "nic-lcr", Latn}

m["enx"] = {"Enxet", 15462609, "sai-mas", Latn}

m["eot"] = {"Eotile", 3915347, "alv-ptn", Latn}

m["epi"] = {"Epie", 35291, "alv-dlt", Latn}

m["era"] = {"Eravallan", 5385061, "dra"}

m["erg"] = {"Sie", 426254, "poz-occ", Latn}

m["erh"] = {"Eruwa", 3441244, "alv-swd", Latn}

m["eri"] = {"Ogea", 7079984, "ngf-mad", Latn}

m["erk"] = {"South Efate", 3449070, "poz-vnc", Latn}

m["ero"] = {"Horpa", 56854, "sit-rgy"}

m["err"] = {"Erre", 10488401, "qfa-iso", Latn}

m["ers"] = {
    "Ersu", 12952417, "sit-qia", Latn -- also Ersu Shaba
}

m["ert"] = {"Eritai", 56376, "paa-lkp", Latn}

m["erw"] = {"Erokwanas", 5395296, "poz-hce", Latn}

m["ese"] = {"Ese Ejja", 2980381, "sai-tac", Latn}

m["esh"] = {"Eshtehardi", 12952418, "xme-ttc", {"fa-Arab", "Latn"}, ancestors = {"xme-ttc-sou"}}

m["esi"] = {"North Alaskan Inupiatun", nil, "esx-inu", Latn}

m["esk"] = {"Northwest Alaska Inupiatun", 25559714, "esx-inu", Latn}

m["esl"] = {"Egyptian Sign Language", 5348443, "sgn"}

m["esm"] = {"Esuma", 16927555, "alv-kwa", Latn}

m["esn"] = {
    "Salvadoran Sign Language", 7406492, "sgn", Latn -- when documented
}

m["eso"] = {
    "Estonian Sign Language", 3196221, "sgn", Latn -- when documented
}

m["esq"] = {"Esselen", 1294243, "qfa-iso", Latn}

m["ess"] = {"Central Siberian Yupik", 27993, "ypk", {"Cyrl"}}

m["esu"] = {"Yup'ik", 21117, "ypk", Latn}

m["esy"] = {
    "Eskayan", 867086, "art", Latn -- also its own native script
}

m["etb"] = {"Etebi", 11002851, "nic-ief", Latn}

m["etc"] = {"Etchemin", 5402493, "alg-eas", Latn}

m["eth"] = {"Ethiopian Sign Language", 3501903, "sgn"}

m["etn"] = {"Eton (Vanuatu)", 3059362, "poz-oce", Latn}

m["eto"] = {"Eton (Cameroon)", 35317, "bnt-btb", Latn}

m["etr"] = {"Edolo", 5340184, "ngf", Latn}

m["ets"] = {"Yekhee", 3915848, "alv-yek", Latn}

m["ett"] = {"Etruscan", 35726, "qfa-tyn", {"Ital"}, translit_module = "Ital-translit"}

m["etu"] = {"Ejagham", 35296, "nic-eko", Latn}

m["etx"] = {"Eten", 3915392, "nic-beo", Latn}

m["etz"] = {"Semimi", 10950308, "paa-mai", Latn}

m["eve"] = {"Even", 29960, "tuw", {"Cyrl", "Latn"}, entry_name = {from = {"[Ӣ]", "[ӣ]", "[Ӯ]", "[ӯ]", MACRON, DOTBELOW, DOTABOVE}, to = {"И", "и", "У", "у"}}, translit_module = "eve-translit"}

m["evh"] = {"Uvbie", 3441344, "alv-swd", Latn}

m["evn"] = {"Evenki", 30004, "tuw", {"Cyrl"}, entry_name = {from = {"[Ӣ]", "[ӣ]", "[Ӯ]", "[ӯ]", MACRON, DOTBELOW, DOTABOVE}, to = {"И", "и", "У", "у"}}, translit_module = "evn-translit"}

m["ewo"] = {"Ewondo", 35459, "bnt-btb", Latn}

m["ext"] = {"Extremaduran", 30007, "roa-ibe", Latn}

m["eya"] = {"Eyak", 27480, "xnd", Latn}

m["eyo"] = {"Keiyo", 56856, "sdv-nma", Latn}

m["eza"] = {"Ezaa", 11921436, "alv-igb", Latn, ancestors = {"izi"}}

m["eze"] = {"Uzekwe", 3502244, "nic-ucn", Latn}

return m
