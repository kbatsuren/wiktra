local u = mw.ustring.char

-- UTF-8 encoded strings for some commonly used diacritics
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

m["oaa"] = {"Orok", 33928, "tuw", Latn}

m["oac"] = {"Oroch", 33650, "tuw", {"Latn", "Cyrl"}}

m["oav"] = {"Old Avar", nil, "cau-ava", {"Geor"}}

m["obi"] = {"Obispeño", 1288385, "nai-chu", Latn}

m["obk"] = {"Southern Bontoc", nil, "phi", Latn}

m["obl"] = {"Oblo", 36309}

m["obm"] = {"Moabite", 36385, "sem-can", {"Phnx"}, translit_module = "Phnx-translit"}

m["obo"] = {"Obo Manobo", 12953699, "mno", Latn}

m["obr"] = {
    "Old Burmese", 17006600, "tbq-brm", {"Mymr", "Latn"} -- and also Pallava
}

m["obt"] = {"Old Breton", 3558112, "cel-bry", Latn}

m["obu"] = {"Obulom", 3813403, "nic-cde", Latn}

m["oca"] = {"Ocaina", 3182577, "sai-wit", Latn}

m["och"] = {"Old Chinese", 35137, "zhx", {"Hani"}}

m["oco"] = {"Old Cornish", 48304520, "cel-bry", Latn}

m["ocu"] = {"Tlahuica", 10751739, "omq", Latn}

m["oda"] = {"Odut", 3915388, "nic-uce", Latn, ancestors = {"mfn"}}

m["odk"] = {"Od", 7077191, "inc-wes", {"Arab"}}

m["odt"] = {"Old Dutch", 443089, "gmw", {"Latn", "Runr"}, ancestors = {"gmw-pro"}, entry_name = {from = {"[ĀÂ]", "[āâ]", "[ĒÊ]", "[ēê]", "[ĪÎ]", "[īî]", "[ŌÔ]", "[ōô]", "[ŪÛ]", "[ūû]"}, to = {"A", "a", "E", "e", "I", "i", "O", "o", "U", "u"}}}

m["odu"] = {"Odual", 3813392, "nic-cde", Latn}

m["ofo"] = {"Ofo", 3349758, "sio-ohv"}

m["ofs"] = {"Old Frisian", 35133, "gmw-fri", Latn, entry_name = {from = {"[ĀÂ]", "[āâ]", "[ĒÊ]", "[ēê]", "[ĪÎ]", "[īî]", "[ŌÔ]", "[ōô]", "[ŪÛ]", "[ūû]"}, to = {"A", "a", "E", "e", "I", "i", "O", "o", "U", "u"}}}

m["ofu"] = {"Efutop", 35297, "nic-eko", Latn}

m["ogb"] = {"Ogbia", 3813400, "nic-cde", Latn}

m["ogc"] = {"Ogbah", 36291, "alv-igb", Latn}

m["oge"] = {"Old Georgian", 34834, "ccs-gzn", {"Geor"}, translit_module = "Geor-translit", override_translit = true, entry_name = {from = {"̂"}, to = {""}}}

m["ogg"] = {"Ogbogolo", 3813405, "nic-cde", Latn}

m["ogo"] = {"Khana", 3914409, "nic-ogo", Latn}

m["ogu"] = {"Ogbronuagum", 3914485, "nic-cde", Latn}

m["ohu"] = {"Old Hungarian", nil, "urj-ugr", Latn}

m["oia"] = {"Oirata", 56738, "ngf", Latn}

m["oin"] = {"Inebu One", 12953782, "qfa-tor"}

m["ojb"] = {"Northwestern Ojibwa", 7060356, "alg", Latn, ancestors = {"oj"}}

m["ojc"] = {"Central Ojibwa", 5061548, "alg", Latn, ancestors = {"oj"}}

m["ojg"] = {"Eastern Ojibwa", 5330342, "alg", Latn, ancestors = {"oj"}}

m["ojp"] = {"Old Japanese", 5736700, "jpx", {"Jpan"}}

m["ojs"] = {"Severn Ojibwa", 56494, "alg", Latn, ancestors = {"oj"}}

m["ojv"] = {"Ontong Java", 7095071, "poz-pnp", Latn}

m["ojw"] = {"Western Ojibwa", 3474222, "alg", Latn, ancestors = {"oj"}}

m["oka"] = {"Okanagan", 2984602, "sal", Latn}

m["okb"] = {"Okobo", 3813398, "nic-lcr", Latn}

m["okd"] = {"Okodia", 36300, "ijo"}

m["oke"] = {"Okpe (Southwestern Edo)", 268924, "alv-swd", Latn}

m["okg"] = {"Kok-Paponk", nil, "aus-pmn", Latn}

m["okh"] = {"Koresh-e Rostam", 6432160, "xme-ttc", ancestors = {"xme-ttc-cen"}}

m["oki"] = {"Okiek", 56367, "sdv-kln", Latn}

m["okj"] = {"Oko-Juwoi", 3436832, "qfa-adc"}

m["okk"] = {"Kwamtim One", 19830649, "qfa-tor", Latn}

m["okl"] = {"Old Kentish Sign Language", 7084319, "sgn"}

m["okm"] = {"Middle Korean", 715339, "qfa-kor", {"Kore"}, ancestors = {"oko"}, entry_name = {from = {"[〮〯]"}, to = {""}}}

m["okn"] = {"Oki-No-Erabu", 3350036, "jpx-ryu", {"Jpan"}}

m["oko"] = {"Old Korean", 715364, "qfa-kor", {"Kore"}}

m["okr"] = {"Kirike", 11006763, "ijo"}

m["oks"] = {"Oko-Eni-Osayen", 36302, "alv-von", Latn}

m["oku"] = {"Oku", 36289, "nic-rnc", Latn}

m["okv"] = {"Orokaiva", 7103752, "ngf", Latn}

m["okx"] = {"Okpe (Northwestern Edo)", 7082547, "alv-nwd", Latn}

m["old"] = {"Mochi", 12952852, "bnt-chg", Latn}

m["ole"] = {"Olekha", 3695204, "sit-bdi"}

m["olm"] = {"Oloma", 3441166, "alv-nwd", Latn}

m["olo"] = {"Livvi", 36584, "fiu-fin", Latn}

m["olr"] = {"Olrat", 3351562, "poz-vnc"}

m["olt"] = {"Old Lithuanian", 17417801, "bat", Latn, entry_name = {from = {"[áãà]", "[éẽè]", "[íĩì]", "[ýỹ]", "ñ", "[óõò]", "[úù]", ACUTE, GRAVE, TILDE}, to = {"a", "e", "i", "y", "n", "o", "u"}}}

m["olu"] = {"Kuvale", 6448765, "bnt-swb", Latn}

m["oma"] = {"Omaha-Ponca", 2917968, "sio-dhe", Latn}

m["omb"] = {"Omba", 2841471, "poz-vnc", Latn}

m["omc"] = {"Mochica", 1951641}

m["omg"] = {"Omagua", 33663, "tup-gua", Latn}

m["omi"] = {"Omi", 56795, "csu-mma"}

m["omk"] = {"Omok", 4334657, "qfa-yuk", {"Cyrl"}, translit_module = "omk-translit"}

m["oml"] = {"Ombo", 7089928, "bnt-tet", Latn}

m["omn"] = {"Minoan", 1669994, nil, {"Lina"}}

m["omo"] = {"Utarmbung", 7902577, "ngf", Latn}

m["omp"] = {"Old Manipuri", nil, "sit"}

m["omr"] = {"Old Marathi", nil, "inc-sou", {"Deva", "Modi"}, ancestors = {"pmh"}, translit_module = "translit-redirect"}

m["omt"] = {"Omotik", 36313, "sdv-nis"}

m["omu"] = {"Omurano", 1957612}

m["omw"] = {"South Tairora", 20210553, "paa-kag", Latn}

m["omx"] = {
    "Old Mon", nil, "mkh-mnc", {"Mymr", "Latn"} -- and also Pallava
}

m["ona"] = {"Selk'nam", 2721227, "sai-cho", Latn}

m["onb"] = {"Lingao", 7093790, "qfa-onb"}

m["one"] = {"Oneida", 857858, "iro", Latn}

m["ong"] = {"Olo", 592162, "qfa-tor", Latn}

m["oni"] = {"Onin", 7093910, "poz-cet", Latn}

m["onj"] = {"Onjob", 7093968, "ngf", Latn}

m["onk"] = {"Kabore One", 12953783, "qfa-tor", Latn}

m["onn"] = {"Onobasulu", 7094437, "ngf", Latn}

m["ono"] = {"Onondaga", 1077450, "iro", Latn}

m["onp"] = {"Sartang", 7424639, "sit-khb"}

m["onr"] = {"Northern One", 19830648, "qfa-tor", Latn}

m["ons"] = {"Ono", 11732548, "ngf", Latn}

m["ont"] = {"Ontenu", 3352827}

m["onu"] = {"Unua", 3552042, "poz-vnc", Latn}

m["onw"] = {"Old Nubian", 2268, "nub", {"Copt"}}

m["onx"] = {"Pidgin Onin", 12953788, "crp", Latn, ancestors = {"oni"}}

m["ood"] = {"O'odham", 2393095, "azc", Latn}

m["oog"] = {"Ong", 12953787, "mkh-kat"}

m["oon"] = {"Önge", 2475551, "qfa-ong"}

m["oor"] = {"Oorlams", 2484337}

m["oos"] = {"Old Ossetic", nil, "xsc", {"Grek", "Latn"}, translit_module = "grc-translit", ancestors = {"os-pro"}}

m["opa"] = {"Okpamheri", 3913331, "alv-nwd", Latn}

m["opk"] = {"Kopkaka", 6431129, "ngf-okk", Latn}

m["opm"] = {"Oksapmin", 1068097, "ngf", Latn}

m["opo"] = {"Opao", 7095585, "ngf", Latn}

m["opt"] = {"Opata", 2304583, "azc-trc", Latn}

m["opy"] = {"Ofayé", 3446691, "sai-mje", Latn}

m["ora"] = {"Oroha", 36298, "poz-sls"}

m["ore"] = {"Orejón", 3355834, "sai-tuc", Latn}

m["org"] = {"Oring", 3915308, "nic-ucn", Latn}

m["orh"] = {"Oroqen", 1367309, "tuw", Latn}

m["oro"] = {"Orokolo", 7103758, "ngf", Latn}

m["orr"] = {"Oruma", 36299, "ijo", Latn}

m["ort"] = {"Adivasi Oriya", 12953791, "inc-eas", {"Orya"}, ancestors = {"or"}}

m["oru"] = {"Ormuri", 33740, "ira-orp", {"fa-Arab"}}

m["orv"] = {
    "Old East Slavic",
    35228,
    "zle",
    {"Cyrs"},
    translit_module = "Cyrs-Glag-translit",
    entry_name = {
        from = {u(0x0484)}, -- kamora
        to = {}
    },
    sort_key = {from = {"оу", "є"}, to = {"у", "е"}}
}

m["orw"] = {"Oro Win", 3450423, "sai-cpc", Latn}

m["orx"] = {"Oro", 3813396, "nic-lcr", Latn}

m["orz"] = {"Ormu", 7103494, "poz-ocw", Latn}

m["osa"] = {"Osage", 2600085, "sio-dhe", {"Latn", "Osge"}}

m["osc"] = {"Oscan", 36653, "itc", {"Ital", "Latn"}, translit_module = "Ital-translit"}

m["osi"] = {"Osing", 2701322, "poz-sus", Latn}

m["oso"] = {"Ososo", 3913398, "alv-yek", Latn}

m["osp"] = {"Old Spanish", 1088025, "roa-ibe", Latn}

m["ost"] = {"Osatu", 36243, "nic-grs", Latn}

m["osu"] = {"Southern One", 12953785, "qfa-tor", Latn}

m["osx"] = {"Old Saxon", 35219, "gmw", Latn, entry_name = {from = {"[ĀÂ]", "[āâ]", "[ĒÊ]", "[ēê]", "[ĪÎ]", "[īî]", "[ŌÔ]", "[ōô]", "[ŪÛ]", "[ūû]"}, to = {"A", "a", "E", "e", "I", "i", "O", "o", "U", "u"}}}

m["ota"] = {"Ottoman Turkish", 36730, "trk-ogz", {"ota-Arab", "Armn"}, ancestors = {"trk-oat"}}

m["otd"] = {"Ot Danum", 3033781, "poz-brw", Latn}

m["ote"] = {"Mezquital Otomi", 23755711, "oto-otm", Latn}

m["oti"] = {"Oti", 3357881}

m["otk"] = {"Old Turkic", 34988, "trk", {"Orkh"}, translit_module = "Orkh-translit"}

m["otl"] = {"Tilapa Otomi", 7802050, "oto-otm", Latn}

m["otm"] = {"Eastern Highland Otomi", 13581718, "oto-otm", Latn}

m["otn"] = {"Tenango Otomi", 25559589, "oto-otm", Latn}

m["otq"] = {"Querétaro Otomi", 23755688, "oto-otm", Latn}

m["otr"] = {"Otoro", 36328, "alv-hei"}

m["ots"] = {"Estado de México Otomi", 7413841, "oto-otm", Latn}

m["ott"] = {"Temoaya Otomi", 7698191, "oto-otm", Latn}

m["otu"] = {"Otuke", 7110049, "sai-mje", Latn}

m["otw"] = {"Ottawa", 133678, "alg", Latn, ancestors = {"oj"}}

m["otx"] = {"Texcatepec Otomi", 25559590, "oto-otm", Latn}

m["oty"] = {"Old Tamil", 20987452, "dra", {"Brah"}, translit_module = "Brah-translit"}

m["otz"] = {"Ixtenco Otomi", 6101171, "oto-otm", Latn}

m["oua"] = {"Tagargrent", 56586, "ber"}

m["oub"] = {"Glio-Oubi", 3914977, "kro-grb"}

m["oue"] = {"Oune", 7110521, "paa-sbo"}

m["oui"] = {"Old Uyghur", nil, "trk-sib", {"Latn", "Brah", "Mani", "Syrc"}}

m["oum"] = {"Ouma", 7110494, "poz-ocw", Latn}

m["ovd"] = {"Elfdalian", 254950, "gmq", Latn, ancestors = {"non"}}

m["owi"] = {"Owiniga", 56454, "qfa-mal", Latn}

m["owl"] = {"Old Welsh", 2266723, "cel-bry", Latn}

m["oyb"] = {"Oy", 13593748, "mkh-ban"}

m["oyd"] = {"Oyda", 7116251, "omv-nom"}

m["oym"] = {"Wayampi", 7975842, "tup-gua", Latn}

m["oyy"] = {"Oya'oya", 7116243, "poz-ocw", Latn}

m["ozm"] = {"Koonzime", 35566, "bnt-ndb", Latn}

return m
