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

m["raa"] = {"Dungmali", 56871, "sit-kic"}

m["rab"] = {"Chamling", 3436664, "sit-kic", scripts = {"Deva"}}

m["rac"] = {"Rasawa", 56443, "paa-lkp", scripts = Latn}

m["rad"] = {"Rade", 3429088, "cmc", scripts = Latn}

m["raf"] = {"Western Meohang", 17442461, "sit-kie"}

m["rag"] = {"Logooli", 6667767, "bnt-lok", scripts = Latn}

m["rah"] = {"Rabha", 7278686, "tbq-bdg", scripts = {"Beng", "Latn"}}

m["rai"] = {"Ramoaaina", 3418509, "poz-ocw", scripts = Latn}

m["raj"] = {"Rajasthani", 13196, "inc-wes", scripts = {"Deva"}, ancestors = {"inc-ogu"}}

m["rak"] = {"Tulu-Bohuai", 2908807, "poz-aay", scripts = Latn}

m["ral"] = {"Ralte", 7288392, "tbq-kuk", scripts = Latn}

m["ram"] = {"Canela", 2936334, "sai-nje", scripts = Latn}

m["ran"] = {"Riantana", 7322169, "ngf", scripts = Latn}

m["rao"] = {"Rao", 11732596, "paa", scripts = Latn}

m["rap"] = {"Rapa Nui", 36746, "poz-pep", scripts = Latn}

m["raq"] = {"Saam", 7395644, "sit-kic"}

m["rar"] = {"Rarotongan", 36745, "poz-pep", scripts = Latn}

m["ras"] = {"Tegali", 36522, "nic-ras", scripts = Latn}

m["rat"] = {"Razajerdi", 7299461, "xme-ttc", ancestors = {"xme-ttc-eas"}}

m["rau"] = {"Raute", 7296262, "sit-gma", scripts = {"Deva", "Latn"}}

m["rav"] = {"Sampang", 3449115, "sit-kic"}

m["raw"] = {"Rawang", 542564, "sit-nng", scripts = Latn, sort_key = {from = {"[áāà]", "[éēè]", "[íīì]", "[óōò]", "[úūù]", "ǿ", GRAVE, MACRON, ACUTE}, to = {"a", "e", "i", "o", "u", "ø"}}}

m["rax"] = {"Rang", 3913345, "alv-mum"}

m["ray"] = {"Rapa", 36417, "poz-pep"}

m["raz"] = {"Rahambuu", 3417555, "poz-btk"}

m["rbb"] = {"Rumai Palaung", 12953797, "mkh-pal"}

m["rbk"] = {"Northern Bontoc", nil, "phi"}

m["rbl"] = {"Miraya Bikol", 18664557, "phi"}

m["rcf"] = {"Réunion Creole French", 13198, "crp", scripts = Latn, ancestors = {"fr"}}

m["rdb"] = {"Rudbari", 12953072, "xme", ancestors = {"xme-mid"}}

m["rea"] = {"Rerau", 7314883, "ngf-mad"}

m["reb"] = {"Rembong", 7311570, "poz-cet"}

m["ree"] = {"Rejang Kayan", 3423957, "poz"}

m["reg"] = {"Kara (Tanzania)", 6367567, "bnt-haj"}

m["rei"] = {"Reli", 7310982}

m["rej"] = {"Rejang", 3056339, "poz-sus", scripts = {"Rjng"}}

m["rel"] = {"Rendille", 3447297, "cus"}

m["rem"] = {"Remo", 3501825, "sai-pan", scripts = Latn}

m["ren"] = {"Rengao", 6583692, "mkh"}

m["rer"] = {"Rer Bare", 12953857}

m["res"] = {"Reshe", 36258, "nic-knj"}

m["ret"] = {"Retta", 7317113, "ngf"}

m["rey"] = {"Reyesano", 3111857, "sai-tac", scripts = Latn}

m["rga"] = {"Roria", 7366825, "poz-vnc"}

m["rge"] = {"Romani Greek", 3915435}

m["rgk"] = {"Rangkas", 7292645, "sit-alm"}

m["rgn"] = {"Romagnol", 1641543, "roa-git", scripts = Latn, wikimedia_codes = {"eml"}}

m["rgr"] = {"Resígaro", 3450504, "awd", scripts = Latn}

m["rgs"] = {"Southern Roglai", 12953069}

m["rgu"] = {"Ringgou", 7334886, "poz-tim"}

m["rhg"] = {"Rohingya", 3241177, "inc-eas", scripts = {"Arab", "Rohg", "Mymr", "Latn", "Beng"}, ancestors = {"inc-obn"}, translit_module = "translit-redirect"}

m["rhp"] = {"Yahang", 8046792, "qfa-tor"}

m["ria"] = {"Reang", 12953063, "tbq-bdg"}

m["rif"] = {"Tarifit", 34174, "ber", scripts = {"Tfng", "Arab", "Latn"}, translit_module = "Tfng-translit"}

m["ril"] = {"Riang", 2741615, "mkh-pal"}

m["rim"] = {"Nyaturu", 7193418, "bnt-tkm", scripts = Latn}

m["rin"] = {"Nungu", 3913350, "nic-nin", scripts = Latn}

m["rir"] = {"Ribun", 7322443, "day", scripts = Latn}

m["rit"] = {"Ritarungo", 7336730, "aus-yol", scripts = Latn}

m["riu"] = {"Riung", 7336938, "poz-cet", scripts = Latn}

m["rjg"] = {"Rajong", 7286370, "poz-cet", scripts = Latn}

m["rji"] = {"Raji", 7286138, "sit-gma"}

m["rjs"] = {"Rajbanshi", 12640969, "inc-eas", scripts = {"Deva", "as-Beng"}, ancestors = {"inc-mgd"}}

m["rka"] = {
    "Kraol",
    3199593,
    "mkh-ban",
    scripts = {"Khmr"} -- also Latn?
}

m["rkb"] = {"Rikbaktsa", 2585357, "sai-mje", scripts = Latn}

m["rkh"] = {"Rakahanga-Manihiki", 3119695, "poz-pep", scripts = Latn}

m["rki"] = {"Rakhine", 3450749, "tbq-brm", scripts = {"Mymr"}, ancestors = {"obr"}}

m["rkm"] = {"Marka", 36030, "dmn-wmn", scripts = Latn}

m["rkt"] = {"Kamta", 3241618, "inc-eas", scripts = {"as-Beng"}, ancestors = {"inc-ork"}, translit_module = "as-translit"}

m["rkw"] = {"Arakwal", 34295800, "aus-pam", scripts = Latn}

m["rma"] = {"Rama", 3444486, "cba"}

m["rmb"] = {"Rembarunga", 7311553, "aus-gun", scripts = Latn}

m["rmc"] = {"Carpathian Romani", 5045611, "inc-rom"}

m["rmd"] = {"Traveller Danish", 12640779, "inc-rom"}

m["rme"] = {"Angloromani", 541279, "crp", scripts = Latn, ancestors = {"en", "rom"}}

m["rmf"] = {"Kalo Finnish Romani", 2093214, "inc-rom"}

m["rmg"] = {"Traveller Norwegian", 3177352, "inc-rom"}

m["rmh"] = {"Murkim", 4308074, "paa-pau"}

m["rmi"] = {"Lomavren", 2495696, "qfa-mix", ancestors = {"psu", "hy"}, scripts = {"Latn", "Armn"}, translit_module = "translit-redirect", override_translit = true}

m["rmk"] = {"Romkun", 7363236, "paa", scripts = Latn}

m["rml"] = {"Baltic Romani", 513736, "inc-rom"}

m["rmm"] = {"Roma", 4414831}

m["rmn"] = {"Balkan Romani", 1256701, "inc-rom"}

m["rmo"] = {"Sinte Romani", 1793299, "qfa-mix", scripts = Latn, ancestors = {"rom"}}

m["rmp"] = {"Rempi", 7312214, "ngf-mad"}

m["rmq"] = {"Caló", 35466, "qfa-mix", scripts = Latn, ancestors = {"rom", "la"}}

m["rms"] = {"Romanian Sign Language", 7362575, "sgn"}

m["rmt"] = {"Domari", 35394, "inc-cen", ancestors = {"psu"}}

m["rmu"] = {"Tavringer Romani", 27808413, "inc-rom"}

m["rmv"] = {"Romanova", 1298715, "art", type = "appendix-constructed"}

m["rmw"] = {"Welsh Romani", 2097387, "inc-rom"}

m["rmx"] = {"Romam", 22694600, "mkh"}

m["rmy"] = {"Vlax Romani", 2669199, "inc-rom"}

m["rmz"] = {"Marma", 21403256, "tbq-brm", ancestors = {"obr"}, scripts = {"Mymr"}}

m["rnd"] = {"Ruwund", 7383564, "bnt-lun"}

m["rng"] = {"Ronga", 2520717, "bnt-tsr", scripts = Latn}

m["rnl"] = {"Ranglong", 7292878}

m["rnn"] = {"Roon", 7366335, "poz-hce"}

m["rnp"] = {"Rongpo", 7365672, "sit-whm"}

m["rnw"] = {"Rungwa", 7379873, "bnt-mwi", scripts = Latn}

m["rob"] = {"Tae'", 12473476, "poz-ssw", scripts = Latn}

m["roc"] = {"Cacgia Roglai", 2932485}

m["rod"] = {"Rogo", 3914894, "nic-kmk"}

m["roe"] = {"Ronji", 3441763, "poz-ocw"}

m["rof"] = {"Rombo", 33330, "bnt-chg", scripts = Latn}

m["rog"] = {"Northern Roglai", 3439680, "cmc", scripts = Latn}

m["rol"] = {"Romblomanon", 13202, "phi"}

m["rom"] = {"Romani", 13201, "inc-rom", scripts = {"Latn", "Cyrl"}, ancestors = {"psu"}}

m["roo"] = {"Rotokas", 13203, "paa-nbo", scripts = Latn}

m["rop"] = {"Kriol", 35671, "crp", scripts = Latn, ancestors = {"en"}}

m["ror"] = {"Rongga", 12473464}

m["rou"] = {"Runga", 56793}

m["row"] = {"Dela-Oenale", 5253046, "poz-tim"}

m["rpn"] = {"Repanbitip", 7313900, "poz-vnc"}

m["rpt"] = {"Rapting", 7294362, "ngf-mad"}

m["rri"] = {"Ririo", 2404190, "poz-ocw"}

m["rro"] = {"Roro", 34197, "poz-ocw", scripts = Latn}

m["rrt"] = {"Arritinngithigh", 4796002, scripts = Latn}

m["rsb"] = {"Romano-Serbian", 1268244}

m["rsl"] = {"Russian Sign Language", 13210, "sgn"}

m["rsm"] = {"Miriwoong Sign Language", 24090240, "sgn"}

m["rtc"] = {"Rungtu", 7379867, "tbq-kuk"}

m["rth"] = {"Ratahan", 3420026, "phi", scripts = Latn}

m["rtm"] = {"Rotuman", 36754, "poz-occ", scripts = Latn}

m["rtw"] = {"Rathawi", 12953854, "inc-bhi"}

m["rub"] = {"Gungu", 11165235, "bnt-glb"}

m["ruc"] = {"Ruuli", 7383562, "bnt-nyg"}

m["rue"] = {"Rusyn", 26245, "zle", scripts = {"Cyrl"}, ancestors = {"orv"}, translit_module = "rue-translit", entry_name = {from = {GRAVE, ACUTE}, to = {}}}

m["ruf"] = {"Luguru", 3437661, "bnt-ruv", scripts = Latn}

m["rug"] = {"Roviana", 3445546, "poz-ocw", scripts = Latn}

m["ruh"] = {"Ruga", 7378127}

m["rui"] = {"Rufiji", 7377946, "bnt-mbi"}

m["ruk"] = {"Che", 3915445, "nic-nin"}

m["ruo"] = {"Istro-Romanian", 33622, "roa-eas", scripts = Latn}

m["rup"] = {"Aromanian", 29316, "roa-eas", scripts = Latn, wikimedia_codes = {"roa-rup"}}

m["ruq"] = {"Megleno-Romanian", 13358, "roa-eas", scripts = Latn}

m["rut"] = {"Rutul", 36757, "cau-lzg", scripts = {"Cyrl"}}

m["ruu"] = {"Lanas Lobu", 12953676}

m["ruy"] = {"Mala (Nigeria)", 3913381, "nic-kau"}

m["ruz"] = {"Ruma", 3913326, "nic-kau"}

m["rwa"] = {"Rawo", 3504269}

m["rwk"] = {"Rwa", 7985624, "bnt-chg"}

m["rwm"] = {"Amba", 788423, "bnt-kbi", scripts = Latn}

m["rwo"] = {"Rawa", 11732598, "ngf-fin", scripts = Latn}

m["rxd"] = {"Ngardi", 7022063}

m["rxw"] = {"Karuwali", 6881575}

m["ryn"] = {"Northern Amami-Oshima", 2840988, "jpx-ryu", scripts = {"Jpan"}}

m["rys"] = {"Yaeyama", 34203, "jpx-ryu", scripts = {"Jpan"}}

m["ryu"] = {"Okinawan", 34233, "jpx-ryu", scripts = {"Jpan"}}

m["rzh"] = {"Razihi", 16911222, "sem-osa", scripts = {"Arab"}, ancestors = {"sem-srb"}}

return m
