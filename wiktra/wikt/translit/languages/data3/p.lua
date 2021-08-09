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

m["pab"] = {"Pareci", 3504312, "awd", Latn}

m["pac"] = {"Pacoh", 3441136, "mkh-kat", Latn}

m["pad"] = {"Paumarí", 389827, "auf", Latn}

m["pae"] = {"Pagibete", 7124357, "bnt-bta", Latn}

m["paf"] = {"Paranawát", 12953806, "tup-gua", Latn}

m["pag"] = {"Pangasinan", 33879, "phi", Latn}

m["pah"] = {"Tenharim", 10266010, "tup-gua", Latn}

m["pai"] = {"Pe", 3914871, "nic-tar", Latn}

m["pak"] = {"Parakanã", 12953804, "tup-gua", Latn}

m["pal"] = {
    "Middle Persian",
    32063,
    "ira-swi",
    {"Latn", "Phli", "pal-Avst", "Mani", "Phlp", "Phlv"}, -- Latn for translit; Phlv not in Unicode
    translit_module = "translit-redirect",
    ancestors = {"peo"}
}

m["pam"] = {
    "Kapampangan", 36121, "phi", Latn -- also Kulitan, which lacks a code
}

m["pao"] = {"Northern Paiute", 3360656, "azc-num", Latn}

m["pap"] = {"Papiamentu", 33856, "crp", Latn, ancestors = {"pt"}}

m["paq"] = {"Parya", 1135134, "inc-cen", ancestors = {"psu"}}

m["par"] = {"Panamint", 33926, "azc-num", Latn}

m["pas"] = {"Papasena", 7132508, "paa-lkp", Latn}

m["pat"] = {"Papitalai", 6528659, "poz-aay", Latn}

m["pau"] = {"Palauan", 33776, "poz-sus", Latn}

m["pav"] = {"Wari'", 3027909, "sai-cpc", Latn}

m["paw"] = {"Pawnee", 56751, "cdd", Latn}

m["pax"] = {"Pankararé", 25559779, nil, Latn}

m["pay"] = {"Pech", 4898889, "cba", Latn}

m["paz"] = {"Pankararú", 7131310, nil, Latn}

m["pbb"] = {"Páez", 33677, nil, Latn}

m["pbc"] = {"Patamona", 3915921, "sai-car", Latn}

m["pbe"] = {"Mezontla Popoloca", 42365630, "omq-pop", Latn}

m["pbf"] = {"Coyotepec Popoloca", 5180100, "omq-pop", Latn}

m["pbg"] = {"Paraujano", 3501747, "awd-taa", Latn, ancestors = {"awd-taa-pro"}}

m["pbh"] = {"Panare", 56610, "sai-car", Latn}

m["pbi"] = {"Podoko", 3515096, "cdc-cbm", Latn}

m["pbl"] = {"Mak (Nigeria)", 3915349, "alv-bwj", Latn}

m["pbm"] = {"Puebla Mazatec", nil, "omq-maz", Latn}

m["pbn"] = {"Kpasam", 3914902, "alv-mye", Latn}

m["pbo"] = {"Papel", 36314, "alv-pap", Latn}

m["pbp"] = {"Badyara", 35095, "alv-ten", Latn}

m["pbr"] = {"Pangwa", 3847550, "bnt-bki", Latn}

m["pbs"] = {"Central Pame", 3361763, "omq", Latn}

m["pbv"] = {"Pnar", 3501850, "aav-pkl", Latn}

m["pby"] = {"Pyu", 2567925, "paa-asa", Latn}

m["pca"] = {"Santa Inés Ahuatempan Popoloca", 42365276, "omq-pop", Latn}

m["pcb"] = {"Pear", 6583669, "mkh-pea", {"Khmr"}}

m["pcc"] = {"Bouyei", 35100, "tai-nor", {"Latn", "Hani"}, sort_key = {from = {"%p"}, to = {""}}}

m["pcd"] = {"Picard", 34024, "roa-oil", Latn, ancestors = {"fro"}, sort_key = {from = {"[áàâä]", "[éèêë]", "[íìîï]", "[óòôö]", "[úùûü]", "[ýỳŷÿ]", "ç", "'"}, to = {"a", "e", "i", "o", "u", "y", "c"}}}

m["pce"] = {"Ruching Palaung", 12953798, "mkh-pal"}

m["pcf"] = {"Paliyan", 7127643, "dra"}

m["pcg"] = {"Paniya", 7131211, "dra"}

m["pch"] = {"Pardhan", 7133207, "dra", ancestors = {"gon"}}

m["pci"] = {"Duruwa", 56753, "dra", {"Deva", "Orya"}}

m["pcj"] = {"Parenga", 3111396, "mun"}

m["pck"] = {"Paite", 12952337, "tbq-kuk"}

m["pcl"] = {"Pardhi", 7136554, "inc-bhi"}

m["pcm"] = {"Nigerian Pidgin", 33655, "crp", Latn, ancestors = {"en"}}

m["pcn"] = {"Piti", 3913375, "nic-kne", Latn}

m["pcp"] = {"Pacahuara", 2591165, "sai-pan", Latn}

m["pcw"] = {"Pyapun", 3438807, nil, Latn}

m["pda"] = {"Anam", 3501930, "ngf-mad", Latn}

m["pdc"] = {"Pennsylvania German", 22711, "gmw", Latn, ancestors = {"gmw-rfr"}}

m["pdi"] = {"Pa Di", 3359940, nil, Latn}

m["pdn"] = {"Fedan", 7206699, "poz-ocw", Latn}

m["pdo"] = {"Padoe", 3360370, "poz-btk", Latn}

m["pdt"] = {"Plautdietsch", 1751432, "gmw", Latn, ancestors = {"nds-de"}}

m["pdu"] = {"Kayan", 7123283}

m["pea"] = {"Peranakan Indonesian", 653415, nil, Latn}

m["peb"] = {"Eastern Pomo", 3396032, "nai-pom", Latn}

m["ped"] = {"Mala (New Guinea)", 11732569, "ngf-mad", Latn}

m["pee"] = {"Taje", 12953902, nil, Latn}

m["pef"] = {"Northeastern Pomo", 3396018, "nai-pom", Latn}

m["peg"] = {"Pengo", 56758, "dra", {"Orya"}}

m["peh"] = {"Bonan", 32983, "xgn"}

m["pei"] = {"Chichimeca-Jonaz", 3915427, "omq-otp", Latn}

m["pej"] = {"Northern Pomo", 3396021, "nai-pom", Latn}

m["pek"] = {"Penchal", 3374631, "poz-aay", Latn}

m["pel"] = {"Pekal", 3241781, nil, Latn}

m["pem"] = {"Phende", 7162372, "bnt-pen", Latn}

m["peo"] = {"Old Persian", 35225, "ira-swi", {"Xpeo", "Latinx"}, translit_module = "peo-translit"}

m["pep"] = {"Kunja", 6444807, nil, Latn}

m["peq"] = {"Southern Pomo", 3396023, "nai-pom", Latn}

-- "pes" IS TREATED AS "fa" (or as etymology-only), SEE WT:LT

m["pev"] = {"Pémono", 3439012, "sai-car", Latn}

m["pex"] = {"Petats", 3376353, "poz-ocw", Latn}

m["pey"] = {"Petjo", 940486, nil, Latn}

m["pez"] = {"Eastern Penan", 18638342, "poz-swa", Latn}

m["pfa"] = {"Pááfang", 3063517, "poz-mic", Latn}

m["pfe"] = {"Peere", 36377, "alv-dur", Latn}

m["pga"] = {"Juba Arabic", 1262143, "crp", Latn, ancestors = {"apd"}}

m["pgd"] = {"Gandhari", nil, "inc-mid", {"Deva", "Khar"}, ancestors = {"inc-ash"}, translit_module = "Khar-translit"}

m["pgg"] = {"Pangwali", 13600429, "him", {"Deva", "Takr"}, translit_module = "hi-translit"}

m["pgi"] = {"Pagi", 7124354, "paa-brd", Latn}

m["pgk"] = {"Rerep", 586907, "poz-vnc", Latn}

m["pgl"] = {"Primitive Irish", 3320030, "cel-gae", {"Ogam"}, translit_module = "pgl-translit"}

m["pgn"] = {"Paelignian", nil, "itc", Latn}

m["pgs"] = {"Pangseng", 3914027, "alv-mum", Latn}

m["pgu"] = {"Pagu", 7124462, "paa-wpa", Latn}

m["pgz"] = {"Papua New Guinean Sign Language", 25044405, "sgn"}

m["pha"] = {"Pa-Hng", 2625410, "hmn"}

m["phd"] = {"Phudagi", 7188289}

m["phg"] = {"Phuong", 7188376, "mkh-kat"}

m["phh"] = {"Phukha", 7188298, "tbq-lol"}

m["phk"] = {
    "Phake",
    7675798,
    "tai-swe",
    {"Mymr"},
    entry_name = {
        from = {u(0xFE00)}, -- VS01
        to = {""}
    }
}

m["phl"] = {"Phalura", 2449549, "inc-dar"}

m["phm"] = {"Phimbi", 11007144, "bnt-sna", Latn}

m["phn"] = {"Phoenician", 36734, "sem-can", {"Phnx"}, translit_module = "Phnx-translit"}

m["pho"] = {"Phunoi", 7188361, "tbq-lol"}

m["phq"] = {"Phana'", 7180427, "tbq-lol"}

m["phr"] = {"Pahari-Potwari", 33739, "inc-pan", {"fa-Arab", "Latn"}, ancestors = {"lah"}}

m["pht"] = {"Phu Thai", 3626597, "tai-swe"}

m["phu"] = {"Phuan", 3915665}

m["phv"] = {"Pahlavani", 7124567}

m["phw"] = {"Phangduwali", 12953036, "sit-kie", ancestors = {"ybh"}}

m["pia"] = {"Pima Bajo", 3388544, "azc", Latn}

m["pib"] = {"Yine", 3135432, "awd", Latn}

m["pic"] = {"Pinji", 36296, "bnt-tso", Latn}

m["pid"] = {"Piaroa", 3382207, nil, Latn}

m["pie"] = {"Piro", 7198055, "nai-kta", Latn}

m["pif"] = {"Pingelapese", 36421, "poz-mic", Latn}

m["pig"] = {"Pisabo", 966883, "sai-pan", Latn}

m["pih"] = {"Pitcairn-Norfolk", 36554, "crp", Latn, ancestors = {"en"}}

m["pii"] = {"Pini", 10631925}

m["pij"] = {"Pijao", 7193519}

m["pil"] = {"Yom", 36893, "nic-yon"}

m["pim"] = {"Powhatan", 2270532, "alg-eas", Latn}

m["pin"] = {"Piame", 7190042}

m["pio"] = {"Piapoco", 3382208, "awd-nwk", Latn}

m["pip"] = {"Pero", 2411063, "cdc-wst"}

m["pir"] = {"Piratapuyo", 3389119, "sai-tuc", Latn}

m["pis"] = {"Pijin", 36699, "crp", Latn, ancestors = {"en"}}

m["pit"] = {"Pitta-Pitta", 6433116, "aus-kar", Latn}

m["piu"] = {"Pintupi-Luritja", 2591175, "aus-pam"}

m["piv"] = {"Pileni", 2976736, "poz-pnp", Latn}

m["piw"] = {"Pimbwe", 3894132, "bnt-mwi"}

m["pix"] = {"Piu", 7199578}

m["piy"] = {"Piya-Kwonci", 3440492}

m["piz"] = {"Pije", 3388339, "poz-cln", Latn}

m["pjt"] = {"Pitjantjatjara", 2982063, "aus-pam", {"pjt-Latn"}}

m["pka"] = {"Ardhamagadhi Prakrit", 2652214, "inc-mid", {"Brah", "Deva"}, translit_module = "Brah-translit", ancestors = {"inc-pra"}}

m["pkb"] = {"Kipfokomo", 7208693, "bnt-sab", Latn}

m["pkc"] = {"Baekje", 4841264, "qfa-kor", {"Hani"}}

m["pkg"] = {"Pak-Tong", 3360711}

m["pkh"] = {"Pankhu", 7130962, "tbq-kuk"}

m["pkn"] = {"Pakanha", 954916, "aus-pmn"}

m["pko"] = {"Pökoot", 36323, "sdv-kln"}

m["pkp"] = {"Pukapukan", 36447, "poz-pnp", Latn}

m["pkr"] = {"Attapady Kurumba", 16835180, "dra"}

m["pks"] = {"Pakistan Sign Language", 22964057, "sgn"}

m["pkt"] = {"Maleng", 6583562, "mkh-vie"}

m["pku"] = {"Paku", 2932604}

m["pla"] = {"Miani", 12952844, nil, Latn}

m["plb"] = {"Polonombauk", 7225957, "poz-vnc", Latn}

m["plc"] = {"Central Palawano", 12953795, "phi", Latn}

m["ple"] = {"Palu'e", 2196866, "poz-cet", Latn}

m["plg"] = {"Pilagá", 2748259, "sai-guc", Latn}

m["plh"] = {"Paulohi", 7155331, "poz-cma"}

m["plj"] = {"Polci", 3914383}

m["plk"] = {"Kohistani Shina", 12953882, "inc-dar"}

m["pll"] = {"Shwe Palaung", 27941664, "mkh-pal"}

m["pln"] = {"Palenquero", 36665, "crp", Latn, ancestors = {"es"}}

m["plo"] = {"Oluta Popoluca", 5908687, "nai-miz", Latn}

m["plq"] = {"Palaic", 36582, "ine-ana", {"Xsux"}}

m["plr"] = {"Palaka Senoufo", 36346, "alv-snf", Latn}

m["pls"] = {"San Marcos Tlalcoyalco Popoloca", 12641692, "omq-pop", Latn}

m["plu"] = {"Palikur", 3073448, "awd", Latn}

m["plv"] = {"Southwest Palawano", 15614922, "phi", Latn}

m["plw"] = {"Brooke's Point Palawano", 12953796, "phi", Latn}

m["ply"] = {"Bolyu", 3361723, "mkh-pkn", Latn}

m["plz"] = {"Paluan", 7128795, nil, Latn}

m["pma"] = {"Paama", 3130286, "poz-vnc", Latn}

m["pmb"] = {"Pambia", 36267, "znd", Latn}

m["pmd"] = {"Pallanganmiddang", 7127734, "aus-pam", Latn}

m["pme"] = {"Pwaamei", 3411152, "poz-cln", Latn}

m["pmf"] = {"Pamona", 3513320, "poz-kal", Latn}

m["pmh"] = {"Maharastri Prakrit", 2586773, "inc-mid", {"Brah", "Deva"}, ancestors = {"inc-pra"}, translit_module = "Brah-translit"}

m["pmi"] = {"Northern Pumi", 3403245, "sit-qia"}

m["pmj"] = {"Southern Pumi", 3403246, "sit-qia"}

m["pmk"] = {"Pamlico", nil, "alg-eas", Latn}

m["pml"] = {"Sabir", 636479, "crp", Latn, ancestors = {"lij", "pro", "vec"}}

m["pmm"] = {"Pol", 36408, "bnt-kak", Latn}

m["pmn"] = {"Pam", 7129017, "alv-mbm"}

m["pmo"] = {"Pom", 7227178, "poz-hce", Latn}

m["pmq"] = {"Northern Pame", 3361762, "omq", Latn}

m["pmr"] = {"Paynamar", 3450824}

m["pms"] = {"Piedmontese", 15085, "roa-git", Latn}

m["pmt"] = {"Tuamotuan", 36763, "poz-pep", Latn}

m["pmu"] = {"Mirpur Panjabi", 6874480}

m["pmw"] = {"Plains Miwok", 3391031, "nai-you", Latn}

m["pmx"] = {"Poumei Naga", 12952910, "tbq-anp"}

m["pmy"] = {"Papuan Malay", 12473446, nil, Latn}

m["pmz"] = {"Southern Pame", 3361765, "omq", Latn}

m["pna"] = {"Punan Bah-Biau", 4842201}

m["pnb"] = {"Western Panjabi", 58635, "inc-pan", {"pa-Arab"}, ancestors = {"pa"}}

m["pnc"] = {"Pannei", 7131391}

m["pnd"] = {"Mpinda", 63308194, "bnt-kmb"}

m["pne"] = {"Western Penan", 12953808, "poz-swa", Latn}

m["png"] = {"Pongu", 36282, "nic-shi"}

m["pnh"] = {"Penrhyn", 3130301, "poz-pep", Latn}

m["pni"] = {"Aoheng", 4778608, "poz"}

m["pnj"] = {"Pinjarup", 33103591}

m["pnk"] = {"Paunaca", 2064378, "awd", Latn}

m["pnl"] = {"Paleni", 7127118, "alv-wan", Latn}

m["pnm"] = {"Punan Batu", 7259892}

m["pnn"] = {"Pinai-Hagahai", 5638511}

m["pno"] = {"Panobo", 3141869, "sai-pan", Latn}

m["pnp"] = {"Pancana", 7130204}

m["pnq"] = {"Pana (West Africa)", 7129739, "nic-gnn", Latn}

m["pnr"] = {"Panim", 11732562, "ngf-mad"}

m["pns"] = {"Ponosakan", 7227956, "phi"}

m["pnt"] = {
    "Pontic Greek",
    36748,
    "grk",
    {"Grek", "Latn", "Cyrl"},
    ancestors = {"grc"},
    translit_module = "grc-translit",
    sort_key = { -- Keep this synchronized with el, grc, cpg
        from = {"[ᾳάᾴὰᾲᾶᾷἀᾀἄᾄἂᾂἆᾆἁᾁἅᾅἃᾃἇᾇ]", "[έὲἐἔἒἑἕἓ]", "[ῃήῄὴῂῆῇἠᾐἤᾔἢᾒἦᾖἡᾑἥᾕἣᾓἧᾗ]", "[ίὶῖἰἴἲἶἱἵἳἷϊΐῒῗ]", "[όὸὀὄὂὁὅὃ]", "[ύὺῦὐὔὒὖὑὕὓὗϋΰῢῧ]", "[ῳώῴὼῲῶῷὠᾠὤᾤὢᾢὦᾦὡᾡὥᾥὣᾣὧᾧ]", "ῥ", "ς"},
        to = {"α", "ε", "η", "ι", "ο", "υ", "ω", "ρ", "σ"}
    }
}

m["pnu"] = {"Jiongnai Bunu", 56325, "hmn"}

m["pnv"] = {"Pinigura", 10631927, "aus-psw", Latn}

m["pnw"] = {"Panyjima", 3913830, "aus-nga", Latn}

m["pnx"] = {"Phong-Kniang", 3914627, "mkh"}

m["pny"] = {"Pinyin", 36250, "nic-nge", Latn}

m["pnz"] = {"Pana (Central Africa)", 36241, "alv-mbm", Latn}

m["poc"] = {"Poqomam", 36416, nil, Latn}

m["poe"] = {"San Juan Atzingo Popoloca", 12953819, "omq-pop", Latn}

m["pof"] = {"Poke", 7208577, "bnt-ske"}

m["pog"] = {"Potiguára", 56722, "tup-gua", Latn}

m["poh"] = {"Poqomchi'", 36414, nil, Latn}

m["poi"] = {"Highland Popoluca", 7511556, "nai-miz", Latn}

m["pok"] = {"Pokangá", 25559704, "sai-tuc", Latn}

m["pom"] = {"Southeastern Pomo", 3396025, "nai-pom", Latn}

m["pon"] = {"Pohnpeian", 28422, "poz-mic", Latn}

m["poo"] = {"Central Pomo", 3396020, "nai-pom", Latn}

m["pop"] = {"Pwapwa", 3411153, "poz-cln", Latn}

m["poq"] = {"Texistepec Popoluca", 5908707, "nai-miz", Latn}

m["pos"] = {"Sayula Popoluca", 5908722, "nai-miz", Latn}

m["pot"] = {"Potawatomi", 56749, "alg", Latn}

m["pov"] = {"Guinea-Bissau Creole", 33339, "crp", Latn, ancestors = {"pt"}}

m["pow"] = {"San Felipe Otlaltepec Popoloca", 25559598, "omq-pop", Latn}

m["pox"] = {"Polabian", 36741, "zlw-lch", Latn}

m["poy"] = {"Pogolo", 2429648, "bnt-kil"}

m["ppa"] = {"Pao", 7132069}

m["ppe"] = {"Papi", 7132809}

m["ppi"] = {"Paipai", 56726, "nai-yuc", Latn}

m["ppk"] = {"Uma", 7881036, "poz-kal", Latn}

m["ppl"] = {"Pipil", 1186896, "azc-nah", Latn, entry_name = {from = {"Ā", "ā", "Ē", "ē", "Ī", "ī", "Ō", "ō", "Ū", "ū", "Ȳ", "ȳ", "Á", "á", "É", "é", "Í", "í", "Ó", "ó", "Ú", "ú"}, to = {"A", "a", "E", "e", "I", "i", "O", "o", "U", "u", "Y", "y", "A", "a", "E", "e", "I", "i", "O", "o", "U", "u"}}}

m["ppm"] = {"Papuma", 7133239, "poz-hce", Latn}

m["ppn"] = {"Papapana", 3362757, "poz-ocw", Latn}

m["ppo"] = {"Folopa", 5464843, "paa", Latn}

m["ppq"] = {"Pei", 7160903}

m["pps"] = {"San Luís Temalacayuca Popoloca", 25559602, "omq-pop", Latn}

m["ppt"] = {"Pa", 3504757, "ngf", Latn}

m["ppu"] = {"Papora", 2094884, "map", Latn}

m["pqa"] = {"Pa'a", 3441315, "cdc-wst"}

m["pqm"] = {"Malecite-Passamaquoddy", 3183144, "alg-eas", Latn}

m["prc"] = {"Parachi", 2640637, "ira-orp"}

-- "prd" IS NOT INCLUDED, SEE WT:LT

m["pre"] = {"Principense", 36520, "crp", Latn, ancestors = {"pt"}}

m["prf"] = {"Paranan", 7135433, "phi"}

m["prg"] = {"Old Prussian", 35501, "bat", Latn, entry_name = {remove_diacritics = MACRON}}

m["prh"] = {"Porohanon", 6583710, "phi"}

m["pri"] = {"Paicî", 732131, "poz-cln", Latn}

m["prk"] = {"Parauk", 3363719, "mkh-pal"}

m["prl"] = {"Peruvian Sign Language", 3915508, "sgn"}

m["prm"] = {"Kibiri", 56745, "paa"}

m["prn"] = {"Prasuni", 32689, "nur-nor"}

m["pro"] = {"Old Occitan", 2779185, "roa", Latn, sort_key = {from = {"ç"}, to = {"c"}}}

-- "prp" IS NOT INCLUDED, SEE WT:LT

m["prq"] = {"Ashéninka Perené", 3450601, "awd", Latn}

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

m["psi"] = {"Southeast Pashayi", 23713536, "inc-dar", {"Arab"}}

m["psl"] = {"Puerto Rican Sign Language", 7258608, "sgn-fsl"}

m["psm"] = {"Pauserna", 2912846, "tup-gua", Latn}

m["psn"] = {"Panasuan", 7130113, "poz"}

m["pso"] = {"Polish Sign Language", 3915194, "sgn-gsl"}

m["psp"] = {"Philippine Sign Language", 3551357, "sgn-fsl"}

m["psq"] = {"Pasi", 7142091}

m["psr"] = {"Portuguese Sign Language", 3915472, "sgn"}

m["pss"] = {"Kaulong", 3194294, "poz-ocw"}

m["psu"] = {"Sauraseni Prakrit", 2452885, "inc-psu", {"Deva", "Brah"}, translit_module = "Brah-translit", ancestors = {"inc-pra"}}

m["psw"] = {"Port Sandwich", 3398324, "poz-vnc", Latn}

m["psy"] = {"Piscataway", 3504233, "alg-eas"}

m["pta"] = {"Pai Tavytera", 7124619, "tup-gua", Latn}

m["pth"] = {"Pataxó Hã-Ha-Hãe", 7144304}

m["pti"] = {"Pintiini", 10632026, "aus-pam"}

m["ptn"] = {"Patani", 7144242, "poz-hce", Latn}

m["pto"] = {"Zo'é", 8073148, "tup-gua", Latn}

m["ptp"] = {"Patep", 3368679, "poz-ocw", Latn}

m["ptq"] = {"Pattapu", nil, "dra"}

m["ptr"] = {"Piamatsina", 7190040, "poz-vnc", Latn}

m["ptt"] = {"Enrekang", 12953520}

m["ptu"] = {"Bambam", 4853321, "poz-ssw"}

m["ptv"] = {"Port Vato", 3398323, nil, Latn}

m["ptw"] = {"Pentlatch", 2069475}

m["pty"] = {"Pathiya", 7144790, "dra"}

m["pua"] = {"Purepecha", 16114351, "qfa-iso", Latn, sort_key = {from = {"á", "é", "í", "ó", "ú"}, to = {"a", "e", "i", "o", "u"}}}

m["pub"] = {"Purum", 6400562, "tbq-kuk", Latn}

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

m["put"] = {"Putoh", 12953832, "poz-swa", Latn}

m["puu"] = {"Punu", 36401, "bnt-sir", Latn}

m["puw"] = {"Puluwat", 36397, "poz-mic", Latn}

m["pux"] = {"Puare", 3507983}

m["puy"] = {"Purisimeño", 2967638, "nai-chu", Latn}

m["pwa"] = {"Pawaia", 7156099, "paa", Latn}

m["pwb"] = {"Panawa", 47385077, "nic-jer", Latn, ancestors = {"jer"}}

m["pwg"] = {"Gapapaiwa", 3095245, "poz-ocw", Latn}

m["pwi"] = {"Patwin", 3370188, "nai-wtq", Latn}

m["pwm"] = {"Molbog", 6895718, "poz-san", Latn}

m["pwn"] = {"Paiwan", 715755, "map", Latn}

m["pwo"] = {"Western Pwo", 7988202, "kar", {"Mymr"}}

m["pwr"] = {"Powari", 12640277, "inc-hie", {"Deva"}}

m["pww"] = {"Northern Pwo", 7058885, "kar", {"Thai"}}

m["pxm"] = {"Quetzaltepec Mixe", 6842374, "nai-miz", Latn}

m["pye"] = {"Pye Krumen", 11157382, "kro-grb"}

m["pym"] = {"Fyam", 3914025, "nic-ple", Latn}

m["pyn"] = {"Poyanáwa", 3401023, "sai-pan"}

m["pys"] = {"Paraguayan Sign Language", 7134698, "sgn"}

m["pyu"] = {"Puyuma", 716690, "map", Latn}

m["pyx"] = {"Tircul", 36259, "sit"}

m["pyy"] = {"Pyen", 7262966, "tbq-lol"}

m["pzn"] = {"Para Naga", 7133667, "sit-aao"}

return m
