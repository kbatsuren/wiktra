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
local COMMA = u(0x0313) -- combining smooth breathing
local REV_COMMA = u(0x0314) -- combining rough breathing
local DOTBELOW = u(0x0323)
local RINGBELOW = u(0x0325)
local CEDILLA = u(0x0327)
local GRC_CIRC = u(0x0342)
local UNDERTIE = u(0x035C) -- actually "combining double breve below"
local RSQUO = u(0x2019)
local PSILI = u(0x1FBD)
local CORONIS = u(0x1FBF)

-- Puncuation to be used for standardChars field
local PUNCTUATION = " !#$%&*+,-./:;<=>?@^_`|~'()"

local Latn = {"Latn"}

local m = {}

m["gaa"] = {"Ga", 33287, "alv-gda", scripts = Latn}

m["gab"] = {"Gabri", 3441237, "cdc-est", scripts = Latn}

m["gac"] = {"Mixed Great Andamanese", nil, "qfa-adn", scripts = Latn}

m["gad"] = { -- not to be confused with gdk, gdg
    "Gaddang",
    3438830,
    "phi",
    scripts = Latn
}

m["gae"] = {"Warekena", 1091095, "awd-nwk", scripts = Latn}

m["gaf"] = {"Gende", 3100425, "paa-kag", scripts = Latn}

m["gag"] = {"Gagauz", 33457, "trk-ogz", scripts = {"Latn", "Cyrl"}, ancestors = {"trk-oat"}}

m["gah"] = {"Alekano", 3441595, "paa-kag", scripts = Latn}

m["gai"] = {"Borei", 6799756, "paa", scripts = Latn}

m["gaj"] = {"Gadsup", 5516467, "paa-kag", scripts = Latn}

m["gak"] = {"Gamkonora", 5520226, "paa-wpa", scripts = Latn}

m["gal"] = {"Galoli", 35322, "poz-tim", scripts = Latn}

m["gam"] = {"Kandawo", 6361369, "ngf", scripts = Latn}

m["gan"] = {"Gan", 33475, "zhx", scripts = {"Hani"}, ancestors = {"ltc"}}

m["gao"] = {"Gants", 5521529, "ngf-mad", scripts = Latn}

m["gap"] = {"Gal", 5517742, "ngf-mad", scripts = Latn}

m["gaq"] = {"Gata'", 3501920, "mun"}

m["gar"] = {"Galeya", 5518509, "poz-ocw", scripts = Latn}

m["gas"] = {"Adiwasi Garasia", 12953522, "inc-bhi", ancestors = {"bhb"}}

m["gat"] = {"Kenati", 4219330, "paa-kag", scripts = Latn}

m["gau"] = {"Kondekor", 12952433, "dra"}

m["gaw"] = {"Nobonob", 11732205, "paa", scripts = Latn}

m["gay"] = {"Gayo", 33286, "poz-nws", scripts = Latn}

m["gba"] = {"Gbaya", 3099986, "alv-gba", scripts = Latn}

m["gbb"] = {"Kaytetye", 6380709, "aus-rnd", scripts = Latn}

m["gbd"] = {"Karadjeri", 3913837, "aus-pam", scripts = Latn}

m["gbe"] = {"Niksek", 56375, "paa", scripts = Latn}

m["gbf"] = {"Gaikundi", 5517032, "paa-spk", scripts = Latn}

m["gbg"] = {"Gbanziri", 35306, "nic-nkg", scripts = Latn}

m["gbh"] = {"Defi Gbe", 12952446, "alv-gbe", scripts = Latn}

m["gbi"] = {"Galela", 3094570, "paa-wpa", scripts = Latn}

m["gbj"] = {"Bodo Gadaba", 3347070, "mun", scripts = {"Orya"}}

m["gbk"] = {"Gaddi", 17455500, "him", scripts = {"Deva", "Takr"}, translit_module = "hi-translit"}

m["gbl"] = {"Gamit", 2731717, "inc-bhi", scripts = {"Deva", "Gujr"}}

m["gbm"] = {"Garhwali", 33459, "inc-pah", scripts = {"Deva"}, translit_module = "hi-translit"}

m["gbn"] = {"Mo'da", 12755683, "csu-bbk", scripts = Latn}

m["gbo"] = {"Northern Grebo", 11157042, "kro-grb", ancestors = {"grb"}, scripts = Latn}

m["gbp"] = {"Gbaya-Bossangoa", 11011295, "alv-gbw", scripts = Latn}

m["gbq"] = {"Gbaya-Bozoum", 4952879, "alv-gbw", scripts = Latn}

m["gbr"] = {"Gbagyi", 11015105, "alv-ngb", scripts = Latn}

m["gbs"] = {"Gbesi Gbe", 12952448, "alv-pph", scripts = Latn}

m["gbu"] = {"Gagadu", 35677, "aus-arn", scripts = Latn}

m["gbv"] = {"Gbanu", 3914945, "alv-gbf", scripts = Latn}

m["gbw"] = {"Gabi", 5515391, "aus-pam", scripts = Latn}

m["gbx"] = {"Eastern Xwla Gbe", 18379975, "alv-pph", scripts = Latn}

m["gby"] = {"Gbari", 3915451, "alv-ngb", scripts = Latn}

m["gcc"] = {"Mali", 6743338, "paa-bng", scripts = Latn}

m["gcd"] = {"Ganggalida", 3913765, "aus-tnk", scripts = Latn}

m["gce"] = {"Galice", 20711, "ath-pco", scripts = Latn}

m["gcf"] = {"Antillean Creole", 3006280, "crp", scripts = Latn, ancestors = {"fr"}}

m["gcl"] = {"Grenadian Creole English", 4252500, "crp", scripts = Latn, ancestors = {"en"}}

m["gcn"] = {"Gaina", 11732195, "ngf", scripts = Latn}

m["gcr"] = {"Guianese Creole", 1363072, "crp", scripts = Latn, ancestors = {"fr"}}

m["gct"] = {"Colonia Tovar German", 1138351, "gmw", scripts = Latn, ancestors = {"gsw"}}

m["gdb"] = {"Ollari", 33906, "dra"}

m["gdc"] = {"Gugu Badhun", 10510360, "aus-pam", scripts = Latn}

m["gdd"] = {"Gedaged", 35292, "poz-ocw", scripts = Latn}

m["gde"] = {"Gude", 3441230, "cdc-cbm", scripts = Latn}

m["gdf"] = {"Guduf-Gava", 3441350, "cdc-cbm", scripts = Latn}

m["gdg"] = { -- not to be confused with gad, gdk
    "Ga'dang", 5515189, "phi"
}

m["gdh"] = {"Gadjerawang", 3913817, "aus-jar", scripts = Latn}

m["gdi"] = {"Gundi", 11137851, "nic-nkb", scripts = Latn}

m["gdj"] = {"Kurtjar", 5619931, "aus-pmn", scripts = Latn}

m["gdk"] = { -- not to be confused with gad, gdg
    "Gadang",
    56256,
    "cdc-est",
    scripts = Latn
}

m["gdl"] = {"Dirasha", 56809, "cus", scripts = {"Ethi"}}

m["gdm"] = {"Laal", 33436, scripts = Latn}

m["gdn"] = {"Umanakaina", 7881084, "ngf", scripts = Latn}

m["gdo"] = {"Godoberi", 56515, "cau-ava", scripts = {"Cyrl"}}

m["gdq"] = {"Mehri", 13361, "sem-sar", scripts = {"Arab", "Latn"}}

m["gdr"] = {"Wipi", 8026711, "paa", scripts = Latn}

m["gds"] = {"Ghandruk Sign Language", 15971577, "sgn"}

m["gdt"] = {"Kungardutyi", 6444517, "aus-kar", scripts = Latn}

m["gdu"] = {"Gudu", 3441172, "cdc-cbm", scripts = Latn}

m["gdx"] = {"Godwari", 3540922, "inc-wes", ancestors = {"mwr"}}

m["gea"] = {"Geruma", 3438789, "cdc-wst", scripts = Latn}

m["geb"] = {"Kire", 11129733, "paa", scripts = Latn}

m["gec"] = {"Gboloo Grebo", 11019342, "kro-grb", ancestors = {"grb"}, scripts = Latn}

m["ged"] = {"Gade", 3914459, "alv-nup", scripts = Latn}

m["geg"] = {"Gengle", 3438345, "alv-mye", ancestors = {"kow"}, scripts = Latn}

m["geh"] = {"Hutterisch", 33385, "gmw", scripts = Latn, ancestors = {"bar"}}

m["gei"] = {"Gebe", 3100032, "poz-hce", scripts = Latn}

m["gej"] = {"Gen", 33450, "alv-gbe", scripts = Latn}

m["gek"] = {"Gerka", 3441277, "cdc-wst", scripts = Latn}

m["gel"] = {"Fakkanci", 36627, "nic-knn", scripts = Latn}

m["geq"] = {"Geme", 3915851, "znd", scripts = Latn}

m["ges"] = {"Geser-Gorom", 5553579, "poz-cma", scripts = Latn}

m["gev"] = {"Viya", 7937974, "bnt-tso", scripts = Latn}

m["gew"] = {"Gera", 3438725, "cdc-wst", scripts = Latn}

m["gex"] = {"Garre", 56618, "cus", scripts = Latn}

m["gey"] = {"Enya", 5381452, "bnt-mbe", scripts = Latn}

m["gez"] = {"Ge'ez", 35667, "sem-eth", scripts = {"Ethi"}, translit_module = "Ethi-translit"}

m["gfk"] = {"Patpatar", 3368846, "poz-ocw", scripts = Latn}

m["gft"] = {"Gafat", 56910, "sem-eth", scripts = {"Ethi", "Latn"}}

m["gga"] = {"Gao", 3095228, "poz-ocw", scripts = Latn}

m["ggb"] = {"Gbii", 3914390, "kro-wkr", scripts = Latn}

m["ggd"] = {"Gugadj", 5615186, "aus-pmn", scripts = Latn}

m["gge"] = {"Guragone", 5619801, "aus-arn", scripts = Latn}

m["ggg"] = {"Gurgula", 5620032, "inc-wes", scripts = {"Arab"}, ancestors = {"mwr"}}

m["ggk"] = {"Kungarakany", 6444516, "aus-arn", scripts = Latn}

m["ggl"] = {"Ganglau", 5521140, "ngf-mad", scripts = Latn}

m["ggn"] = {"Eastern Gurung", 12952472, "sit-tam", scripts = {"Deva", "Latn"}}

m["ggt"] = {"Gitua", 3107865, "poz-ocw", scripts = Latn}

m["ggu"] = {"Gban", 3913317, "dmn-nbe", scripts = Latn}

m["ggw"] = {"Gogodala", 3512161, "paa-pag", scripts = Latn}

m["gha"] = {
    "Ghadames",
    56747,
    "ber",
    scripts = Latn -- and other scripts?
}

m["ghe"] = {"Southern Ghale", 12952453, "sit-tam", scripts = {"Deva"}}

m["ghh"] = {"Northern Ghale", 22662104, "sit-tam", scripts = {"Deva"}}

m["ghk"] = {"Geko Karen", 5530317, "kar"}

m["ghl"] = {
    "Ghulfan",
    16885737,
    "nub-hil",
    scripts = Latn -- and others?
}

m["ghn"] = {"Ghanongga", 3104772, "poz-ocw", scripts = Latn}

m["gho"] = {"Ghomara", 35315, "ber"}

m["ghr"] = {"Ghera", 22808992, "inc-hiw"}

m["ghs"] = {"Guhu-Samane", 11732219, "ngf", scripts = Latn}

m["ght"] = {"Kutang Ghale", 6448337, "sit-tam", scripts = {"Tibt"}}

m["gia"] = {"Kitja", 1284877, "aus-jar", scripts = Latn}

m["gib"] = {"Gibanawa", 12953530, "crp", ancestors = {"ha"}, scripts = Latn}

m["gid"] = {"Gidar", 35265, "cdc-cbm", scripts = Latn}

m["gie"] = {"Guébie", nil, "kro-did", scripts = Latn}

m["gig"] = {"Goaria", 33269, "inc-wes", scripts = {"Arab"}, ancestors = {"mwr"}}

m["gih"] = {"Githabul", nil, "aus-pam", scripts = Latn}

m["gil"] = {"Gilbertese", 30898, "poz-mic", scripts = Latn}

m["gim"] = {"Gimi (Goroka)", 11732209, "paa", scripts = Latn}

m["gin"] = {"Hinukh", 33283, "cau-tsz", scripts = {"Cyrl"}, translit_module = "gin-translit"}

m["gio"] = {"Gelao", 56401, "qfa-tak"}

m["gip"] = {"Gimi (Austronesian)", 12952457, "poz-ocw"}

m["giq"] = {"Green Gelao", 12953525, "qfa-gel"}

m["gir"] = {"Red Gelao", 3100264, "qfa-gel"}

m["gis"] = {"North Giziga", 3515084, "cdc-cbm"}

m["git"] = {"Gitxsan", 3107862, "nai-tsi"}

m["giu"] = {"Mulao", 11092831, "qfa-gel"}

m["giw"] = {"White Gelao", 8843040, "qfa-gel"}

m["gix"] = {"Gilima", 10977716, "nic-nkm", scripts = Latn}

m["giy"] = {"Giyug", 5565906}

m["giz"] = {"South Giziga", 3502232, "cdc-cbm"}

m["gji"] = {"Geji", 3914890, "cdc-wst", scripts = Latn}

m["gjk"] = {"Kachi Koli", 12953646, "inc-wes"}

m["gjm"] = {"Gunditjmara", 6448731, "aus-pam"}

m["gjn"] = {"Gonja", 35267, "alv-gng", scripts = Latn}

m["gju"] = {"Gojri", 3241731, "inc-wes", ancestors = {"raj"}}

m["gka"] = {"Guya", 11732221, "ngf-fin", scripts = Latn}

m["gkd"] = {"Magɨ", nil, "ngf-mad", scripts = Latn}

m["gke"] = {"Ndai", 6983667, "alv-mbm"}

m["gkn"] = {"Gokana", 3075137, "nic-ogo", scripts = Latn}

m["gko"] = {"Kok-Nar", 6426526, "aus-pmn", scripts = Latn}

m["gkp"] = {"Guinea Kpelle", 11052867, "dmn-msw", ancestors = {"kpe"}}

m["glc"] = {"Bon Gula", 289816, "alv-bua"}

m["gld"] = {"Nanai", 13303, "tuw", scripts = {"Cyrl"}, entry_name = {from = {"[Ӣ]", "[ӣ]", "[Ӯ]", "[ӯ]", MACRON}, to = {"И", "и", "У", "у"}}}

m["glh"] = {"Northwest Pashayi", 23713532, "inc-dar"}

m["glj"] = {"Kulaal", 33360, "alv-bua"}

m["glk"] = {"Gilaki", 33657, "ira-csp", scripts = {"fa-Arab"}}

m["glo"] = {"Galambu", 2598797, "cdc-wst", scripts = Latn}

m["glr"] = {"Glaro-Twabo", 3915313, "kro-wee"}

m["glu"] = {"Gula", 5617176, "csu-bgr"}

m["glw"] = {"Glavda", 3441285, "cdc-cbm", scripts = Latn}

m["gly"] = {"Gule", 3120736, "ssa-kom"}

m["gma"] = {"Gambera", 10502327, "aus-wor"}

m["gmb"] = {"Gula'alaa", 3120733, "poz-sls", scripts = Latn}

m["gmd"] = {"Mághdì", 3914475, "alv-bwj"}

m["gmg"] = {"Magiyi", 16926155, "ngf-mad", scripts = Latn}

m["gmh"] = {"Middle High German", 837985, "gmw", scripts = Latn, ancestors = {"goh"}, entry_name = {from = {"[ĀÂ]", "[āâ]", "[ĒÊË]", "[ēêë]", "[ĪÎ]", "[īî]", "[ŌÔ]", "[ōô]", "[ŪÛ]", "[ūû]", "[ǣæ̂]", "[ǢÆ̂]"}, to = {"A", "a", "E", "e", "I", "i", "O", "o", "U", "u", "æ", "Æ"}}}

m["gml"] = {"Middle Low German", 505674, "gmw", scripts = Latn, ancestors = {"osx"}, entry_name = {from = {"[ĀÂÄǞ]", "[āâäǟ]", "[ĒÊ]", "[ēê]", "[ĪÎ]", "[īî]", "[ŌÔÖȪ]", "[ōôöȫ]", "[ŪÛÜǕ]", "[ūûüǖ]", "[̂]"}, to = {"A", "a", "E", "e", "I", "i", "O", "o", "U", "u", ""}}}

m["gmm"] = {"Gbaya-Mbodomo", 6799713, "alv-gbf", scripts = Latn}

m["gmn"] = {"Gimnime", 11016905, "alv-dur"}

m["gmu"] = {"Gumalu", 5618027, "ngf-mad"}

m["gmv"] = {"Gamo", 16116386, "omv-nom", scripts = {"Latn", "Ethi"}}

m["gmx"] = {"Magoma", 16939552, "bnt-bki"}

m["gmy"] = {"Mycenaean Greek", 668366, "grk", scripts = {"Linb"}, translit_module = "Linb-translit", override_translit = true}

m["gmz"] = {"Mgbo", 6826835, "alv-igb", ancestors = {"izi"}}

m["gna"] = {"Kaansa", 56802, "nic-gur"}

m["gnb"] = {"Gangte", 12952442, "tbq-kuk"}

m["gnc"] = {"Guanche", 35762, "ber"}

m["gnd"] = {"Zulgo-Gemzek", 56800, "cdc-cbm", scripts = Latn}

m["gne"] = {"Ganang", nil, "nic-plc", ancestors = {"izr"}}

m["gng"] = {"Ngangam", 35888, "nic-grm"}

m["gnh"] = {"Lere", 3915319, "nic-jer"}

m["gni"] = {"Gooniyandi", 2669219, "aus-bub", scripts = Latn}

m["gnj"] = {"Ngen", nil, "dmn-nbe", scripts = Latn}

m["gnk"] = {"ǁGana", 1975199, "khi-kal"}

m["gnl"] = {"Gangulu", 4916329, "aus-pam"}

m["gnm"] = {"Ginuman", 11732210, "ngf"}

m["gnn"] = {"Gumatj", 10510745, "aus-yol", scripts = Latn}

m["gnq"] = {"Gana", 5520523, "poz-san"}

m["gnr"] = {"Gureng Gureng", 5619998, "aus-pam"}

m["gnt"] = {"Guntai", 12952475, "paa"}

m["gnu"] = {"Gnau", 3915810, "qfa-tor"}

m["gnw"] = {"Western Bolivian Guaraní", 3775037, "tup-gua", scripts = Latn, ancestors = {"gn"}}

m["gnz"] = {"Ganzi", 11137942, "nic-nkb", scripts = Latn}

m["goa"] = {"Guro", 35251, "dmn-mda", scripts = Latn}

m["gob"] = {"Playero", 3027923, "sai-guh"}

m["goc"] = {"Gorakor", 12952463, "poz-ocw", scripts = Latn}

m["god"] = {"Godié", 3914412, "kro-bet"}

m["goe"] = {"Gongduk", 2669221, "sit"}

m["gof"] = {"Gofa", 12631584, "omv-nom", scripts = {"Latn", "Ethi"}}

m["gog"] = {"Gogo", 3272630, "bnt-ruv", scripts = Latn}

m["goh"] = {"Old High German", 35218, "gmw", scripts = Latn, entry_name = {from = {"[ĀÂ]", "[āâ]", "[ĒÊË]", "[ēêë]", "[ĪÎ]", "[īî]", "[ŌÔ]", "[ōô]", "[ŪÛ]", "[ūû]", "ʒ"}, to = {"A", "a", "E", "e", "I", "i", "O", "o", "U", "u", "z"}}}

m["goi"] = {"Gobasi", 5575414, "ngf", scripts = Latn}

m["goj"] = {"Gowlan", 12953532, "inc-sou"}

-- gok is a spurious language, see [[w:Spurious languages]]

m["gol"] = {"Gola", 35482, "alv"}

m["gon"] = {"Gondi", 1775361, "dra", scripts = {"Telu", "Gonm", "Gong"}}

m["goo"] = {"Gone Dau", 3110470, "poz-occ", scripts = Latn}

m["gop"] = {"Yeretuar", 8052565, "poz-hce", scripts = Latn}

m["goq"] = {"Gorap", 3110816, "crp", ancestors = {"ms"}}

m["gor"] = {"Gorontalo", 2501174, "phi", scripts = Latn}

m["got"] = {"Gothic", 35722, "gme", scripts = {"Goth", "Runr"}, translit_module = "Goth-translit", link_tr = true, entry_name = {from = {"Ā", "ā", "Ē", "ē", "Ī", "ī", "Ō", "ō", "Ū", "ū"}, to = {"A", "a", "E", "e", "I", "i", "O", "o", "U", "u"}}}

m["gou"] = {"Gavar", 3441180, "cdc-cbm"}

m["gow"] = {"Gorowa", 3437626, "cus"}

m["gox"] = {"Gobu", 7194986, "bad-cnt"}

m["goy"] = {"Goundo", 317636, "alv-kim"}

m["goz"] = {"Gozarkhani", 5590235, "xme-ttc", ancestors = {"xme-ttc-eas"}}

m["gpa"] = {"Gupa-Abawa", 3915352, "alv-ngb"}

m["gpn"] = {"Taiap", 56237, "paa"}

m["gqa"] = {"Ga'anda", 56245, "cdc-cbm", scripts = Latn}

m["gqi"] = {"Guiqiong", 3120647, "sit-qia"}

m["gqn"] = { -- a variety of 'ter'
    "Kinikinao", nil, "awd"
}

m["gqr"] = {"Gor", 759992, "csu-sar"}

m["gqu"] = {"Qau", 17284874, "qfa-gel"}

m["gra"] = {"Rajput Garasia", 21041529, "inc-bhi", ancestors = {"bhb"}, scripts = {"Deva", "Gujr"}}

m["grb"] = {"Grebo", 35257, "kro-grb", scripts = Latn}

m["grc"] = {
    "Ancient Greek",
    35497,
    "grk",
    scripts = {"polytonic", "Cprt"},
    translit_module = "translit-redirect",
    override_translit = true,
    -- Keep this synchronized with el, cpg, pnt; compare ine-pae
    sort_key = {remove_diacritics = ACUTE .. GRAVE .. GRC_CIRC .. DIAER .. COMMA .. REV_COMMA},
    entry_name = {remove_diacritics = MACRON .. BREVE .. UNDERTIE, from = {"[" .. RSQUO .. PSILI .. CORONIS .. "]"}, to = {"'"}},
    standardChars = "ͺ;΄-ώϜϝ" .. PUNCTUATION .. "ἀ-῾𐠀-𐠿"
}

m["grd"] = {"Guruntum", 3441272, "cdc-wst", scripts = Latn}

m["grg"] = {"Madi", 6727664, "ngf-fin", scripts = Latn}

m["grh"] = {"Gbiri-Niragu", 3913936, "nic-kau", scripts = Latn}

m["gri"] = {"Ghari", 3104782, "poz-sls", scripts = Latn}

m["grj"] = {"Southern Grebo", 3914444, "kro-grb", ancestors = {"grb"}, scripts = Latn}

m["grm"] = {"Kota Marudu Talantang", 6433808, "poz-san", scripts = Latn}

m["gro"] = {"Groma", 56551, "sit-tib"}

m["grq"] = {"Gorovu", 56355, "paa", scripts = Latn}

m["grr"] = {"Taznatit", 3063974, "ber"}

m["grs"] = {"Gresi", 5607612, "paa-nim", scripts = Latn}

m["grt"] = {"Garo", 36137, "tbq-bdg", scripts = {"Latn", "Beng", "Brai"}}

m["gru"] = {"Kistane", 13273, "sem-eth", scripts = Latn}

m["grv"] = {"Central Grebo", 18385114, "kro-grb", ancestors = {"grb"}, scripts = Latn}

m["grw"] = {"Gweda", 5623387, "poz-ocw", scripts = Latn}

m["grx"] = {"Guriaso", 12631954, "paa-kwm", scripts = Latn}

m["gry"] = {"Barclayville Grebo", 11157342, "kro-grb", ancestors = {"grb"}, scripts = Latn}

m["grz"] = {"Guramalum", 3120935, "poz-ocw", scripts = Latn}

m["gse"] = {
    "Ghanaian Sign Language",
    35289,
    "sgn",
    scripts = Latn -- when documented
}

m["gsg"] = {"German Sign Language", 33282, "sgn-gsl", scripts = {"Sgnw"}}

m["gsl"] = {"Gusilay", 35439, "alv-jol", scripts = Latn}

m["gsm"] = {
    "Guatemalan Sign Language",
    2886781,
    "sgn",
    scripts = Latn -- when documented
}

m["gsn"] = {"Gusan", 11732224, "ngf-fin", scripts = Latn}

m["gso"] = {"Southwest Gbaya", 4919322, "alv-gbs", scripts = Latn}

m["gsp"] = {"Wasembo", 7971402, "ngf-mad", scripts = Latn}

m["gss"] = {"Greek Sign Language", 3565084, "sgn"}

m["gsw"] = {"Alemannic German", 131339, "gmw", scripts = Latn, ancestors = {"gmh"}, wikimedia_codes = {"als"}}

m["gta"] = {"Guató", 3027940, "qfa-iso", scripts = Latn}

m["gtu"] = {"Aghu Tharrnggala", 16825981, "aus-pmn", scripts = Latn}

m["gua"] = {"Shiki", 3913946, "nic-jrn", scripts = Latn}

m["gub"] = {"Guajajára", 7699720, "tup-gua", scripts = Latn}

m["guc"] = {"Wayuu", 891085, "awd-taa", ancestors = {"awd-taa-pro"}, scripts = Latn}

m["gud"] = {"Yocoboué Dida", 21074781, "kro-did", scripts = Latn}

m["gue"] = {"Gurindji", 10511016, "aus-pam", scripts = Latn}

m["guf"] = {"Gupapuyngu", 10511004, "aus-yol", scripts = Latn}

m["gug"] = {"Paraguayan Guaraní", 17478066, "tup-gua", scripts = Latn, ancestors = {"gn"}}

m["guh"] = {"Guahibo", 2669193, "sai-guh", scripts = Latn}

m["gui"] = {"Eastern Bolivian Guaraní", 2963912, "tup-gua", scripts = Latn, ancestors = {"gn"}}

m["guk"] = {"Gumuz", 2396970, "ssa", scripts = {"Latn", "Ethi"}}

m["gul"] = {"Gullah", 33395, "crp", scripts = Latn, ancestors = {"en"}}

m["gum"] = {"Guambiano", 2744745, "sai-bar", scripts = Latn}

m["gun"] = {"Mbyá Guaraní", 3915584, "tup-gua", scripts = Latn, ancestors = {"gn"}}

m["guo"] = {"Guayabero", 2980375, "sai-guh", scripts = Latn}

m["gup"] = {"Gunwinggu", 1406574, "aus-gun", scripts = Latn}

m["guq"] = {"Aché", 383701, "tup", scripts = Latn}

m["gur"] = {"Farefare", 35331, "nic-mre", scripts = Latn}

m["gus"] = {
    "Guinean Sign Language",
    15983937,
    "sgn",
    scripts = Latn -- when documented
}

m["gut"] = {"Maléku Jaíka", 3915782, "cba", scripts = Latn}

m["guu"] = {"Yanomamö", 8048928, "sai-ynm", scripts = Latn}

m["guv"] = {"Gey", nil, "alv-sav", scripts = Latn}

m["guw"] = {"Gun", 3111668, "alv-gbe", scripts = Latn}

m["gux"] = {"Gourmanchéma", 35474, "nic-grm", scripts = Latn}

m["guz"] = {"Gusii", 33603, "bnt-lok", scripts = Latn}

m["gva"] = {"Kaskihá", 3033534, "sai-mas", scripts = Latn}

m["gvc"] = {"Guanano", 3566001, "sai-tuc", scripts = Latn}

m["gve"] = {"Duwet", 5317647, "poz-ocw", scripts = Latn}

m["gvf"] = {"Golin", 3110291, "ngf", scripts = Latn}

m["gvj"] = {"Guajá", 3915506, "tup", scripts = Latn}

m["gvl"] = {"Gulay", 641737, "csu-sar", scripts = Latn}

m["gvm"] = {"Gurmana", 3913363, "nic-shi", scripts = Latn}

m["gvn"] = {"Kuku-Yalanji", 5621973, "aus-pam", scripts = Latn}

m["gvo"] = {"Gavião do Jiparaná", 5528335, "tup", scripts = Latn}

m["gvp"] = {"Pará Gavião", 3365443, "sai-nje", scripts = Latn}

m["gvr"] = {"Western Gurung", 2392342, "sit-tam", scripts = {"Deva"}}

m["gvs"] = {"Gumawana", 5618041, "poz-ocw", scripts = Latn}

m["gvy"] = {"Guyani", 10511230, "aus-pam", scripts = Latn}

m["gwa"] = {"Mbato", 3914941, "alv-ptn", scripts = Latn}

m["gwb"] = {"Gwa", 5623219, "nic-jrn", scripts = Latn}

m["gwc"] = {"Kalami", 1675961, "inc-dar", scripts = {"Arab"}}

m["gwd"] = {"Gawwada", 3032135, "cus"}

m["gwe"] = {"Gweno", 3358211, "bnt-chg", scripts = Latn}

m["gwf"] = {"Gowro", 3812403, "inc-dar"}

m["gwg"] = {"Moo", 6907057, "alv-bwj", scripts = Latn}

m["gwi"] = {"Gwich'in", 21057, "ath-nor", scripts = Latn}

m["gwj"] = {"Gcwi", 12631978, "khi-kal", scripts = {"Latinx"}}

m["gwm"] = {"Awngthim", 4830109, "aus-pmn", scripts = Latn}

m["gwn"] = {"Gwandara", 56521, "cdc-wst", scripts = Latn}

m["gwr"] = {"Gwere", 5623559, "bnt-nyg", scripts = Latn}

m["gwt"] = {"Gawar-Bati", 33894, "inc-dar"}

m["gwu"] = {"Guwamu", 10511225, "aus-pam", scripts = Latn}

m["gww"] = {"Kwini", 10551249, "aus-wor", scripts = Latn}

m["gwx"] = {"Gua", 35422, "alv-gng", scripts = Latn}

m["gxx"] = {"Wè Southern", 19921582, "kro-wee", scripts = Latn}

m["gya"] = {"Northwest Gbaya", 36594, "alv-gbw", scripts = Latn}

m["gyb"] = {"Garus", 5524492, "ngf-mad", scripts = Latn}

m["gyd"] = {"Kayardild", 3913770, "aus-tnk", scripts = Latn}

m["gye"] = {"Gyem", 5624046, "nic-jer", scripts = Latn}

m["gyf"] = {"Gungabula", 10510783, "aus-pam", scripts = Latn}

m["gyg"] = {"Gbayi", 11137618, "nic-ngd", scripts = Latn}

m["gyi"] = {"Gyele", 35434, "bnt-mnj", scripts = Latn}

m["gyl"] = {"Gayil", 5528771, "omv-aro", scripts = Latn}

m["gym"] = {"Ngäbere", 3915581, "cba", scripts = Latn}

m["gyn"] = {"Guyanese Creole English", 3305477, "crp", scripts = Latn, ancestors = {"en"}}

m["gyo"] = {"Gyalsumdo", 53575940, "sit-kyk"}

m["gyr"] = {"Guarayu", 3118779, "tup", scripts = Latn}

m["gyy"] = {"Gunya", 10511001, "aus-pam", scripts = Latn}

m["gza"] = {"Ganza", 5521556, "omv-mao", scripts = Latn}

m["gzn"] = {"Gane", 3095108, "poz-hce", scripts = Latn}

return m
