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

m["pab"] = {"Pareci", 3504312, "awd", scripts = Latn}

m["pac"] = {"Pacoh", 3441136, "mkh-kat", scripts = Latn}

m["pad"] = {"Paumarí", 389827, "auf", scripts = Latn}

m["pae"] = {"Pagibete", 7124357, "bnt-bta", scripts = Latn}

m["paf"] = {"Paranawát", 12953806, "tup-gua", scripts = Latn}

m["pag"] = {"Pangasinan", 33879, "phi", scripts = Latn}

m["pah"] = {"Tenharim", 10266010, "tup-gua", scripts = Latn}

m["pai"] = {"Pe", 3914871, "nic-tar", scripts = Latn}

m["pak"] = {"Parakanã", 12953804, "tup-gua", scripts = Latn}

m["pal"] = {
    "Middle Persian",
    32063,
    "ira-swi",
    scripts = {"Latn", "Phli", "pal-Avst", "Mani", "Phlp", "Phlv"}, -- Latn for translit; Phlv not in Unicode
    translit_module = "translit-redirect",
    ancestors = {"peo"}
}

m["pam"] = {
    "Kapampangan",
    36121,
    "phi",
    scripts = Latn -- also Kulitan, which lacks a code
}

m["pao"] = {"Northern Paiute", 3360656, "azc-num", scripts = Latn}

m["pap"] = {"Papiamentu", 33856, "crp", scripts = Latn, ancestors = {"pt"}}

m["paq"] = {"Parya", 1135134, "inc-cen", ancestors = {"psu"}}

m["par"] = {"Panamint", 33926, "azc-num", scripts = Latn}

m["pas"] = {"Papasena", 7132508, "paa-lkp", scripts = Latn}

m["pat"] = {"Papitalai", 6528659, "poz-aay", scripts = Latn}

m["pau"] = {"Palauan", 33776, "poz-sus", scripts = Latn}

m["pav"] = {"Wari'", 3027909, "sai-cpc", scripts = Latn}

m["paw"] = {"Pawnee", 56751, "cdd", scripts = Latn}

m["pax"] = {"Pankararé", 25559779, scripts = Latn}

m["pay"] = {"Pech", 4898889, "cba", scripts = Latn}

m["paz"] = {"Pankararú", 7131310, scripts = Latn}

m["pbb"] = {"Páez", 33677, scripts = Latn}

m["pbc"] = {"Patamona", 3915921, "sai-car", scripts = Latn}

m["pbe"] = {"Mezontla Popoloca", 42365630, "omq-pop", scripts = Latn}

m["pbf"] = {"Coyotepec Popoloca", 5180100, "omq-pop", scripts = Latn}

m["pbg"] = {"Paraujano", 3501747, "awd-taa", ancestors = {"awd-taa-pro"}, scripts = Latn}

m["pbh"] = {"Panare", 56610, "sai-car", scripts = Latn}

m["pbi"] = {"Podoko", 3515096, "cdc-cbm", scripts = Latn}

m["pbl"] = {"Mak (Nigeria)", 3915349, "alv-bwj", scripts = Latn}

m["pbm"] = {"Puebla Mazatec", nil, "omq-maz", scripts = Latn}

m["pbn"] = {"Kpasam", 3914902, "alv-mye", scripts = Latn}

m["pbo"] = {"Papel", 36314, "alv-pap", scripts = Latn}

m["pbp"] = {"Badyara", 35095, "alv-ten", scripts = Latn}

m["pbr"] = {"Pangwa", 3847550, "bnt-bki", scripts = Latn}

m["pbs"] = {"Central Pame", 3361763, "omq", scripts = Latn}

m["pbv"] = {"Pnar", 3501850, "aav-pkl", scripts = Latn}

m["pby"] = {"Pyu", 2567925, "paa-asa", scripts = Latn}

m["pca"] = {"Santa Inés Ahuatempan Popoloca", 42365276, "omq-pop", scripts = Latn}

m["pcb"] = {"Pear", 6583669, "mkh-pea", scripts = {"Khmr"}}

m["pcc"] = {"Bouyei", 35100, "tai-nor", scripts = {"Latn", "Hani"}, sort_key = {from = {"%p"}, to = {""}}}

m["pcd"] = {"Picard", 34024, "roa-oil", scripts = Latn, ancestors = {"fro"}, sort_key = {from = {"[áàâä]", "[éèêë]", "[íìîï]", "[óòôö]", "[úùûü]", "[ýỳŷÿ]", "ç", "'"}, to = {"a", "e", "i", "o", "u", "y", "c"}}}

m["pce"] = {"Ruching Palaung", 12953798, "mkh-pal"}

m["pcf"] = {"Paliyan", 7127643, "dra"}

m["pcg"] = {"Paniya", 7131211, "dra"}

m["pch"] = {"Pardhan", 7133207, "dra", ancestors = {"gon"}}

m["pci"] = {"Duruwa", 56753, "dra", scripts = {"Deva", "Orya"}}

m["pcj"] = {"Parenga", 3111396, "mun"}

m["pck"] = {"Paite", 12952337, "tbq-kuk"}

m["pcl"] = {"Pardhi", 7136554, "inc-bhi"}

m["pcm"] = {"Nigerian Pidgin", 33655, "crp", scripts = Latn, ancestors = {"en"}}

m["pcn"] = {"Piti", 3913375, "nic-kne", scripts = Latn}

m["pcp"] = {"Pacahuara", 2591165, "sai-pan", scripts = Latn}

m["pcw"] = {"Pyapun", 3438807, scripts = Latn}

m["pda"] = {"Anam", 3501930, "ngf-mad", scripts = Latn}

m["pdc"] = {"Pennsylvania German", 22711, "gmw", scripts = Latn, ancestors = {"gmw-rfr"}}

m["pdi"] = {"Pa Di", 3359940, scripts = Latn}

m["pdn"] = {"Fedan", 7206699, "poz-ocw", scripts = Latn}

m["pdo"] = {"Padoe", 3360370, "poz-btk", scripts = Latn}

m["pdt"] = {"Plautdietsch", 1751432, "gmw", scripts = Latn, ancestors = {"nds-de"}}

m["pdu"] = {"Kayan", 7123283}

m["pea"] = {"Peranakan Indonesian", 653415, scripts = Latn}

m["peb"] = {"Eastern Pomo", 3396032, "nai-pom", scripts = Latn}

m["ped"] = {"Mala (New Guinea)", 11732569, "ngf-mad", scripts = Latn}

m["pee"] = {"Taje", 12953902, scripts = Latn}

m["pef"] = {"Northeastern Pomo", 3396018, "nai-pom", scripts = Latn}

m["peg"] = {"Pengo", 56758, "dra", scripts = {"Orya"}}

m["peh"] = {"Bonan", 32983, "xgn"}

m["pei"] = {"Chichimeca-Jonaz", 3915427, "omq-otp", scripts = Latn}

m["pej"] = {"Northern Pomo", 3396021, "nai-pom", scripts = Latn}

m["pek"] = {"Penchal", 3374631, "poz-aay", scripts = Latn}

m["pel"] = {"Pekal", 3241781, scripts = Latn}

m["pem"] = {"Phende", 7162372, "bnt-pen", scripts = Latn}

m["peo"] = {"Old Persian", 35225, "ira-swi", scripts = {"Xpeo", "Latinx"}, translit_module = "peo-translit"}

m["pep"] = {"Kunja", 6444807, scripts = Latn}

m["peq"] = {"Southern Pomo", 3396023, "nai-pom", scripts = Latn}

-- "pes" IS TREATED AS "fa" (or as etymology-only), SEE WT:LT

m["pev"] = {"Pémono", 3439012, "sai-car", scripts = Latn}

m["pex"] = {"Petats", 3376353, "poz-ocw", scripts = Latn}

m["pey"] = {"Petjo", 940486, scripts = Latn}

m["pez"] = {"Eastern Penan", 18638342, "poz-swa", scripts = Latn}

m["pfa"] = {"Pááfang", 3063517, "poz-mic", scripts = Latn}

m["pfe"] = {"Peere", 36377, "alv-dur", scripts = Latn}

m["pga"] = {"Juba Arabic", 1262143, "crp", scripts = Latn, ancestors = {"apd"}}

m["pgd"] = {"Gandhari", nil, "inc-mid", scripts = {"Deva", "Khar"}, ancestors = {"inc-ash"}, translit_module = "Khar-translit"}

m["pgg"] = {"Pangwali", 13600429, "him", scripts = {"Deva", "Takr"}, translit_module = "hi-translit"}

m["pgi"] = {"Pagi", 7124354, "paa-brd", scripts = Latn}

m["pgk"] = {"Rerep", 586907, "poz-vnc", scripts = Latn}

m["pgl"] = {"Primitive Irish", 3320030, "cel-gae", scripts = {"Ogam"}, translit_module = "pgl-translit"}

m["pgn"] = {"Paelignian", nil, "itc", scripts = Latn}

m["pgs"] = {"Pangseng", 3914027, "alv-mum", scripts = Latn}

m["pgu"] = {"Pagu", 7124462, "paa-wpa", scripts = Latn}

m["pgz"] = {"Papua New Guinean Sign Language", 25044405, "sgn"}

m["pha"] = {"Pa-Hng", 2625410, "hmn"}

m["phd"] = {"Phudagi", 7188289}

m["phg"] = {"Phuong", 7188376, "mkh-kat"}

m["phh"] = {"Phukha", 7188298, "tbq-lol"}

m["phk"] = {
    "Phake",
    7675798,
    "tai-swe",
    scripts = {"Mymr"},
    entry_name = {
        from = {u(0xFE00)}, -- VS01
        to = {""}
    }
}

m["phl"] = {"Phalura", 2449549, "inc-dar"}

m["phm"] = {"Phimbi", 11007144, "bnt-sna", scripts = Latn}

m["phn"] = {"Phoenician", 36734, "sem-can", scripts = {"Phnx"}, translit_module = "Phnx-translit"}

m["pho"] = {"Phunoi", 7188361, "tbq-lol"}

m["phq"] = {"Phana'", 7180427, "tbq-lol"}

m["phr"] = {"Pahari-Potwari", 33739, "inc-pan", scripts = {"fa-Arab", "Latn"}, ancestors = {"lah"}}

m["pht"] = {"Phu Thai", 3626597, "tai-swe"}

m["phu"] = {"Phuan", 3915665}

m["phv"] = {"Pahlavani", 7124567}

m["phw"] = {"Phangduwali", 12953036, "sit-kie", ancestors = {"ybh"}}

m["pia"] = {"Pima Bajo", 3388544, "azc", scripts = Latn}

m["pib"] = {"Yine", 3135432, "awd", scripts = Latn}

m["pic"] = {"Pinji", 36296, "bnt-tso", scripts = Latn}

m["pid"] = {"Piaroa", 3382207, scripts = Latn}

m["pie"] = {"Piro", 7198055, "nai-kta", scripts = Latn}

m["pif"] = {"Pingelapese", 36421, "poz-mic", scripts = Latn}

m["pig"] = {"Pisabo", 966883, "sai-pan", scripts = Latn}

m["pih"] = {"Pitcairn-Norfolk", 36554, "crp", scripts = Latn, ancestors = {"en"}}

m["pii"] = {"Pini", 10631925}

m["pij"] = {"Pijao", 7193519}

m["pil"] = {"Yom", 36893, "nic-yon"}

m["pim"] = {"Powhatan", 2270532, "alg-eas", scripts = Latn}

m["pin"] = {"Piame", 7190042}

m["pio"] = {"Piapoco", 3382208, "awd-nwk", scripts = Latn}

m["pip"] = {"Pero", 2411063, "cdc-wst"}

m["pir"] = {"Piratapuyo", 3389119, "sai-tuc", scripts = Latn}

m["pis"] = {"Pijin", 36699, "crp", scripts = Latn, ancestors = {"en"}}

m["pit"] = {"Pitta-Pitta", 6433116, "aus-kar", scripts = Latn}

m["piu"] = {"Pintupi-Luritja", 2591175, "aus-pam"}

m["piv"] = {"Pileni", 2976736, "poz-pnp", scripts = Latn}

m["piw"] = {"Pimbwe", 3894132, "bnt-mwi"}

m["pix"] = {"Piu", 7199578}

m["piy"] = {"Piya-Kwonci", 3440492}

m["piz"] = {"Pije", 3388339, "poz-cln", scripts = Latn}

m["pjt"] = {"Pitjantjatjara", 2982063, "aus-pam", scripts = {"pjt-Latn"}}

m["pka"] = {"Ardhamagadhi Prakrit", 2652214, "inc-mid", scripts = {"Brah", "Deva"}, translit_module = "Brah-translit", ancestors = {"inc-pra"}}

m["pkb"] = {"Kipfokomo", 7208693, "bnt-sab", scripts = Latn}

m["pkc"] = {"Baekje", 4841264, "qfa-kor", scripts = {"Hani"}}

m["pkg"] = {"Pak-Tong", 3360711}

m["pkh"] = {"Pankhu", 7130962, "tbq-kuk"}

m["pkn"] = {"Pakanha", 954916, "aus-pmn"}

m["pko"] = {"Pökoot", 36323, "sdv-kln"}

m["pkp"] = {"Pukapukan", 36447, "poz-pnp", scripts = Latn}

m["pkr"] = {"Attapady Kurumba", 16835180, "dra"}

m["pks"] = {"Pakistan Sign Language", 22964057, "sgn"}

m["pkt"] = {"Maleng", 6583562, "mkh-vie"}

m["pku"] = {"Paku", 2932604}

m["pla"] = {"Miani", 12952844, scripts = Latn}

m["plb"] = {"Polonombauk", 7225957, "poz-vnc", scripts = Latn}

m["plc"] = {"Central Palawano", 12953795, "phi", scripts = Latn}

m["ple"] = {"Palu'e", 2196866, "poz-cet", scripts = Latn}

m["plg"] = {"Pilagá", 2748259, "sai-guc", scripts = Latn}

m["plh"] = {"Paulohi", 7155331, "poz-cma"}

m["plj"] = {"Polci", 3914383}

m["plk"] = {"Kohistani Shina", 12953882, "inc-dar"}

m["pll"] = {"Shwe Palaung", 27941664, "mkh-pal"}

m["pln"] = {"Palenquero", 36665, "crp", ancestors = {"es"}, scripts = Latn}

m["plo"] = {"Oluta Popoluca", 5908687, "nai-miz", scripts = Latn}

m["plq"] = {"Palaic", 36582, "ine-ana", scripts = {"Xsux"}}

m["plr"] = {"Palaka Senoufo", 36346, "alv-snf", scripts = Latn}

m["pls"] = {"San Marcos Tlalcoyalco Popoloca", 12641692, "omq-pop", scripts = Latn}

m["plu"] = {"Palikur", 3073448, "awd", scripts = Latn}

m["plv"] = {"Southwest Palawano", 15614922, "phi", scripts = Latn}

m["plw"] = {"Brooke's Point Palawano", 12953796, "phi", scripts = Latn}

m["ply"] = {"Bolyu", 3361723, "mkh-pkn", scripts = Latn}

m["plz"] = {"Paluan", 7128795, scripts = Latn}

m["pma"] = {"Paama", 3130286, "poz-vnc", scripts = Latn}

m["pmb"] = {"Pambia", 36267, "znd", scripts = Latn}

m["pmd"] = {"Pallanganmiddang", 7127734, "aus-pam", scripts = Latn}

m["pme"] = {"Pwaamei", 3411152, "poz-cln", scripts = Latn}

m["pmf"] = {"Pamona", 3513320, "poz-kal", scripts = Latn}

m["pmh"] = {"Maharastri Prakrit", 2586773, "inc-mid", scripts = {"Brah", "Deva"}, ancestors = {"inc-pra"}, translit_module = "Brah-translit"}

m["pmi"] = {"Northern Pumi", 3403245, "sit-qia"}

m["pmj"] = {"Southern Pumi", 3403246, "sit-qia"}

m["pmk"] = {"Pamlico", nil, "alg-eas", scripts = Latn}

m["pml"] = {"Sabir", 636479, "crp", ancestors = {"lij", "pro", "vec"}, scripts = Latn}

m["pmm"] = {"Pol", 36408, "bnt-kak", scripts = Latn}

m["pmn"] = {"Pam", 7129017, "alv-mbm"}

m["pmo"] = {"Pom", 7227178, "poz-hce", scripts = Latn}

m["pmq"] = {"Northern Pame", 3361762, "omq", scripts = Latn}

m["pmr"] = {"Paynamar", 3450824}

m["pms"] = {"Piedmontese", 15085, "roa-git", scripts = Latn}

m["pmt"] = {"Tuamotuan", 36763, "poz-pep", scripts = Latn}

m["pmu"] = {"Mirpur Panjabi", 6874480}

m["pmw"] = {"Plains Miwok", 3391031, "nai-you", scripts = Latn}

m["pmx"] = {"Poumei Naga", 12952910, "tbq-anp"}

m["pmy"] = {"Papuan Malay", 12473446, scripts = Latn}

m["pmz"] = {"Southern Pame", 3361765, "omq", scripts = Latn}

m["pna"] = {"Punan Bah-Biau", 4842201}

m["pnb"] = {"Western Panjabi", 58635, "inc-pan", scripts = {"pa-Arab"}, ancestors = {"pa"}}

m["pnc"] = {"Pannei", 7131391}

m["pnd"] = {"Mpinda", 63308194, "bnt-kmb"}

m["pne"] = {"Western Penan", 12953808, "poz-swa", scripts = Latn}

m["png"] = {"Pongu", 36282, "nic-shi"}

m["pnh"] = {"Penrhyn", 3130301, "poz-pep", scripts = Latn}

m["pni"] = {"Aoheng", 4778608, "poz"}

m["pnj"] = {"Pinjarup", 33103591}

m["pnk"] = {"Paunaca", 2064378, "awd", scripts = Latn}

m["pnl"] = {"Paleni", 7127118, "alv-wan", scripts = Latn}

m["pnm"] = {"Punan Batu", 7259892}

m["pnn"] = {"Pinai-Hagahai", 5638511}

m["pno"] = {"Panobo", 3141869, "sai-pan", scripts = Latn}

m["pnp"] = {"Pancana", 7130204}

m["pnq"] = {"Pana (West Africa)", 7129739, "nic-gnn", scripts = Latn}

m["pnr"] = {"Panim", 11732562, "ngf-mad"}

m["pns"] = {"Ponosakan", 7227956, "phi"}

m["pnt"] = {
    "Pontic Greek",
    36748,
    "grk",
    scripts = {"Grek", "Latn", "Cyrl"},
    ancestors = {"grc"},
    translit_module = "grc-translit",
    sort_key = { -- Keep this synchronized with el, grc, cpg
        from = {"[ᾳάᾴὰᾲᾶᾷἀᾀἄᾄἂᾂἆᾆἁᾁἅᾅἃᾃἇᾇ]", "[έὲἐἔἒἑἕἓ]", "[ῃήῄὴῂῆῇἠᾐἤᾔἢᾒἦᾖἡᾑἥᾕἣᾓἧᾗ]", "[ίὶῖἰἴἲἶἱἵἳἷϊΐῒῗ]", "[όὸὀὄὂὁὅὃ]", "[ύὺῦὐὔὒὖὑὕὓὗϋΰῢῧ]", "[ῳώῴὼῲῶῷὠᾠὤᾤὢᾢὦᾦὡᾡὥᾥὣᾣὧᾧ]", "ῥ", "ς"},
        to = {"α", "ε", "η", "ι", "ο", "υ", "ω", "ρ", "σ"}
    }
}

m["pnu"] = {"Jiongnai Bunu", 56325, "hmn"}

m["pnv"] = {"Pinigura", 10631927, "aus-psw", scripts = Latn}

m["pnw"] = {"Panyjima", 3913830, "aus-nga", scripts = Latn}

m["pnx"] = {"Phong-Kniang", 3914627, "mkh"}

m["pny"] = {"Pinyin", 36250, "nic-nge", scripts = Latn}

m["pnz"] = {"Pana (Central Africa)", 36241, "alv-mbm", scripts = Latn}

m["poc"] = {"Poqomam", 36416, scripts = Latn}

m["poe"] = {"San Juan Atzingo Popoloca", 12953819, "omq-pop", scripts = Latn}

m["pof"] = {"Poke", 7208577, "bnt-ske"}

m["pog"] = {"Potiguára", 56722, "tup-gua", scripts = Latn}

m["poh"] = {"Poqomchi'", 36414, scripts = Latn}

m["poi"] = {"Highland Popoluca", 7511556, "nai-miz", scripts = Latn}

m["pok"] = {"Pokangá", 25559704, "sai-tuc", scripts = Latn}

m["pom"] = {"Southeastern Pomo", 3396025, "nai-pom", scripts = Latn}

m["pon"] = {"Pohnpeian", 28422, "poz-mic", scripts = Latn}

m["poo"] = {"Central Pomo", 3396020, "nai-pom", scripts = Latn}

m["pop"] = {"Pwapwa", 3411153, "poz-cln", scripts = Latn}

m["poq"] = {"Texistepec Popoluca", 5908707, "nai-miz", scripts = Latn}

m["pos"] = {"Sayula Popoluca", 5908722, "nai-miz", scripts = Latn}

m["pot"] = {"Potawatomi", 56749, "alg", scripts = Latn}

m["pov"] = {"Guinea-Bissau Creole", 33339, "crp", scripts = Latn, ancestors = {"pt"}}

m["pow"] = {"San Felipe Otlaltepec Popoloca", 25559598, "omq-pop", scripts = Latn}

m["pox"] = {"Polabian", 36741, "zlw-lch", scripts = Latn}

m["poy"] = {"Pogolo", 2429648, "bnt-kil"}

m["ppa"] = {"Pao", 7132069}

m["ppe"] = {"Papi", 7132809}

m["ppi"] = {"Paipai", 56726, "nai-yuc", scripts = Latn}

m["ppk"] = {"Uma", 7881036, "poz-kal", scripts = Latn}

m["ppl"] = {"Pipil", 1186896, "azc-nah", scripts = Latn, entry_name = {from = {"Ā", "ā", "Ē", "ē", "Ī", "ī", "Ō", "ō", "Ū", "ū", "Ȳ", "ȳ", "Á", "á", "É", "é", "Í", "í", "Ó", "ó", "Ú", "ú"}, to = {"A", "a", "E", "e", "I", "i", "O", "o", "U", "u", "Y", "y", "A", "a", "E", "e", "I", "i", "O", "o", "U", "u"}}}

m["ppm"] = {"Papuma", 7133239, "poz-hce", scripts = Latn}

m["ppn"] = {"Papapana", 3362757, "poz-ocw", scripts = Latn}

m["ppo"] = {"Folopa", 5464843, "paa", scripts = Latn}

m["ppq"] = {"Pei", 7160903}

m["pps"] = {"San Luís Temalacayuca Popoloca", 25559602, "omq-pop", scripts = Latn}

m["ppt"] = {"Pa", 3504757, "ngf", scripts = Latn}

m["ppu"] = {"Papora", 2094884, "map", scripts = Latn}

m["pqa"] = {"Pa'a", 3441315, "cdc-wst"}

m["pqm"] = {"Malecite-Passamaquoddy", 3183144, "alg-eas", scripts = Latn}

m["prc"] = {"Parachi", 2640637, "ira-orp"}

-- "prd" IS NOT INCLUDED, SEE WT:LT

m["pre"] = {"Principense", 36520, "crp", scripts = Latn, ancestors = {"pt"}}

m["prf"] = {"Paranan", 7135433, "phi"}

m["prg"] = {"Old Prussian", 35501, "bat", scripts = Latn, entry_name = {remove_diacritics = MACRON}}

m["prh"] = {"Porohanon", 6583710, "phi"}

m["pri"] = {"Paicî", 732131, "poz-cln", scripts = Latn}

m["prk"] = {"Parauk", 3363719, "mkh-pal"}

m["prl"] = {"Peruvian Sign Language", 3915508, "sgn"}

m["prm"] = {"Kibiri", 56745, "paa"}

m["prn"] = {"Prasuni", 32689, "nur-nor"}

m["pro"] = {"Old Occitan", 2779185, "roa", scripts = Latn, sort_key = {from = {"ç"}, to = {"c"}}}

-- "prp" IS NOT INCLUDED, SEE WT:LT

m["prq"] = {"Ashéninka Perené", 3450601, "awd", scripts = Latn}

m["prr"] = {"Puri", 7261687}

-- "prs" IS TREATED AS "fa" (or as etymology-only), SEE WT:LT

m["prt"] = {"Phai", 7180184, "mkh"}

m["pru"] = {"Puragi", 7260800, "ngf-sbh"}

m["prw"] = {"Parawen", 7136291, "ngf-mad"}

m["prx"] = {"Purik", 567905, "sit-lab"}

m["prz"] = {"Providencia Sign Language", 3322084, "sgn"}

m["psa"] = {"Asue Awyu", 11266334}

m["psc"] = {"Persian Sign Language", 7170221, "sgn"}

m["psd"] = {"Plains Indian Sign Language", 2380124, "sgn"}

m["pse"] = {"Central Malay", 3367751, "poz-mly"}

m["psg"] = {"Penang Sign Language", 4924925, "sgn"}

m["psh"] = {"Southwest Pashayi", 16112270, "inc-dar"}

m["psi"] = {"Southeast Pashayi", 23713536, "inc-dar", scripts = {"Arab"}}

m["psl"] = {"Puerto Rican Sign Language", 7258608, "sgn-fsl"}

m["psm"] = {"Pauserna", 2912846, "tup-gua", scripts = Latn}

m["psn"] = {"Panasuan", 7130113, "poz"}

m["pso"] = {"Polish Sign Language", 3915194, "sgn-gsl"}

m["psp"] = {"Philippine Sign Language", 3551357, "sgn-fsl"}

m["psq"] = {"Pasi", 7142091}

m["psr"] = {"Portuguese Sign Language", 3915472, "sgn"}

m["pss"] = {"Kaulong", 3194294, "poz-ocw"}

m["psu"] = {"Sauraseni Prakrit", 2452885, "inc-psu", scripts = {"Deva", "Brah"}, translit_module = "Brah-translit", ancestors = {"inc-pra"}}

m["psw"] = {"Port Sandwich", 3398324, "poz-vnc", scripts = Latn}

m["psy"] = {"Piscataway", 3504233, "alg-eas"}

m["pta"] = {"Pai Tavytera", 7124619, "tup-gua", scripts = Latn}

m["pth"] = {"Pataxó Hã-Ha-Hãe", 7144304}

m["pti"] = {"Pintiini", 10632026, "aus-pam"}

m["ptn"] = {"Patani", 7144242, "poz-hce", scripts = Latn}

m["pto"] = {"Zo'é", 8073148, "tup-gua", scripts = Latn}

m["ptp"] = {"Patep", 3368679, "poz-ocw", scripts = Latn}

m["ptq"] = {"Pattapu", nil, "dra"}

m["ptr"] = {"Piamatsina", 7190040, "poz-vnc", scripts = Latn}

m["ptt"] = {"Enrekang", 12953520}

m["ptu"] = {"Bambam", 4853321, "poz-ssw"}

m["ptv"] = {"Port Vato", 3398323, scripts = Latn}

m["ptw"] = {"Pentlatch", 2069475}

m["pty"] = {"Pathiya", 7144790, "dra"}

m["pua"] = {"Purepecha", 16114351, "qfa-iso", scripts = Latn, sort_key = {from = {"á", "é", "í", "ó", "ú"}, to = {"a", "e", "i", "o", "u"}}}

m["pub"] = {"Purum", 6400562, "tbq-kuk", scripts = Latn}

m["puc"] = {"Punan Merap", 7259895}

m["pud"] = {"Punan Aput", 4782333}

m["pue"] = {"Puelche", 33660}

m["puf"] = {"Punan Merah", 7259894}

m["pug"] = {"Phuie", 36375, "nic-gnw"}

m["pui"] = {"Puinave", 3027918}

m["puj"] = {"Punan Tubu", 7259896, "poz-swa"}

m["pum"] = {"Puma", 33736, "sit-kic"}

m["puo"] = {"Puoc", 6440803, "mkh"}

m["pup"] = {"Pulabu", 7259163, "ngf-mad"}

m["puq"] = {"Puquina", 1207739}

m["pur"] = {"Puruborá", 7261619, "tup"}

m["put"] = {"Putoh", 12953832, "poz-swa", scripts = Latn}

m["puu"] = {"Punu", 36401, "bnt-sir", scripts = Latn}

m["puw"] = {"Puluwat", 36397, "poz-mic", scripts = Latn}

m["pux"] = {"Puare", 3507983}

m["puy"] = {"Purisimeño", 2967638, "nai-chu", scripts = Latn}

m["pwa"] = {"Pawaia", 7156099, "paa", scripts = Latn}

m["pwb"] = {"Panawa", 47385077, "nic-jer", ancestors = {"jer"}, scripts = Latn}

m["pwg"] = {"Gapapaiwa", 3095245, "poz-ocw", scripts = Latn}

m["pwi"] = {"Patwin", 3370188, "nai-wtq", scripts = Latn}

m["pwm"] = {"Molbog", 6895718, "poz-san", scripts = Latn}

m["pwn"] = {"Paiwan", 715755, "map", scripts = Latn}

m["pwo"] = {"Western Pwo", 7988202, "kar", scripts = {"Mymr"}}

m["pwr"] = {"Powari", 12640277, "inc-hie", scripts = {"Deva"}}

m["pww"] = {"Northern Pwo", 7058885, "kar", scripts = {"Thai"}}

m["pxm"] = {"Quetzaltepec Mixe", 6842374, "nai-miz", scripts = Latn}

m["pye"] = {"Pye Krumen", 11157382, "kro-grb"}

m["pym"] = {"Fyam", 3914025, "nic-ple", scripts = Latn}

m["pyn"] = {"Poyanáwa", 3401023, "sai-pan"}

m["pys"] = {"Paraguayan Sign Language", 7134698, "sgn"}

m["pyu"] = {"Puyuma", 716690, "map", scripts = Latn}

m["pyx"] = {"Tircul", 36259, "sit"}

m["pyy"] = {"Pyen", 7262966, "tbq-lol"}

m["pzn"] = {"Para Naga", 7133667, "sit-aao"}

return m
