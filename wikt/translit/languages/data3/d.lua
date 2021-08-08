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

-- Puncuation to be used for standardChars field
local PUNCTUATION = " !#$%&*+,-./:;<=>?@^_`|~'()"

local Deva = {"Deva"}
local Latn = {"Latn"}

local m = {}

m["daa"] = {"Dangaléat", 942591, "cdc-est", scripts = Latn}

m["dac"] = {"Dambi", 12629491, "poz-ocw", scripts = Latn}

m["dad"] = {"Marik", 6763404, "poz-ocw", scripts = Latn}

m["dae"] = {"Duupa", 35263, "alv-dur", scripts = Latn}

m["dag"] = {"Dagbani", 32238, "nic-dag", scripts = Latn}

m["dah"] = {"Gwahatike", 5623246, "ngf-fin", scripts = Latn}

m["dai"] = {"Day", 35163, "alv-mbd", scripts = Latn}

m["daj"] = {"Dar Fur Daju", 56370, "sdv-daj", scripts = Latn}

m["dak"] = {"Dakota", 530384, "sio-dkt", scripts = Latn}

m["dal"] = {"Dahalo", 35143, "cus", scripts = Latn}

m["dam"] = {"Damakawa", 1158134, "nic-knn", scripts = Latn}

m["dao"] = {"Daai Chin", 860029, "tbq-kuk", scripts = Latn}

m["daq"] = {"Dandami Maria", 12952805, "dra", ancestors = {"gon"}}

m["dar"] = {"Dargwa", 32332, "cau-drg", scripts = {"Cyrl"}, translit_module = "dar-translit", override_translit = true}

m["das"] = {"Daho-Doo", 3915369, "kro-wee", scripts = Latn}

m["dau"] = {"Dar Sila Daju", 7514020, "sdv-daj", scripts = Latn}

m["dav"] = {"Taita", 2387274, "bnt-cht", scripts = Latn}

m["daw"] = {"Davawenyo", 5228174, "phi", scripts = Latn}

m["dax"] = {"Dayi", 10467281, "aus-yol", scripts = Latn}

m["daz"] = {"Dao", 5221513, "ngf", scripts = Latn}

m["dba"] = {"Bangi Me", 1982696, "qfa-iso", scripts = Latn}

m["dbb"] = {"Deno", 56275, "cdc-wst", scripts = Latn}

m["dbd"] = {"Dadiya", 3914436, "alv-wjk", scripts = Latn}

m["dbe"] = {"Dabe", 5207451, "paa-tkw", scripts = Latn}

m["dbf"] = {"Edopi", 12953516, "paa-lkp", scripts = Latn}

m["dbg"] = {"Dogul Dom", 3912880, "nic-npd", scripts = Latn}

m["dbi"] = {"Doka", 3913293, "nic-plc", scripts = Latn}

m["dbj"] = {"Ida'an", 3041552, "poz-san", scripts = Latn}

m["dbl"] = {"Dyirbal", 35465, "aus-dyb", scripts = Latn}

m["dbm"] = {"Duguri", 7194057, "nic-jrw", scripts = Latn}

m["dbn"] = {"Duriankere", 5316627, "ngf-sbh", scripts = Latn}

m["dbo"] = {"Dulbu", 5313310, "nic-jrn", scripts = Latn}

m["dbp"] = {"Duwai", 56301, "cdc-wst", scripts = Latn}

m["dbq"] = {"Daba", 3913342, "cdc-cbm", scripts = Latn}

m["dbr"] = {"Dabarre", 3447286, "cus"}

m["dbt"] = {"Ben Tey", 4886561, "nic-nwa", scripts = Latn}

m["dbu"] = {"Bondum Dom Dogon", 3912758, "nic-npd", scripts = Latn}

m["dbv"] = {"Dungu", 5315230, "nic-kau", scripts = Latn}

m["dbw"] = {"Bankan Tey Dogon", 4856243, "nic-nwa", scripts = Latn}

m["dby"] = {"Dibiyaso", 5272268, "ngf", scripts = Latn}

m["dcc"] = {"Deccani", 669431, "inc-hnd", scripts = {"ur-Arab"}, ancestors = {"ur"}}

m["dcr"] = {"Negerhollands", 1815830, "crp", scripts = Latn, ancestors = {"nl"}}

m["dda"] = {"Dadi Dadi", nil, "aus-pam", scripts = Latn}

m["ddd"] = {"Dongotono", 56676, "sdv-lma"}

m["dde"] = {"Doondo", 11003401, "bnt-kng", scripts = Latn}

m["ddg"] = {"Fataluku", 35353, "qfa-tap", scripts = Latn}

m["ddi"] = {"Diodio", 3028668, "poz-ocw", scripts = Latn}

m["ddj"] = {"Jaru", 3162806, "aus-pam", scripts = Latn}

m["ddn"] = {"Dendi", 35164, "son", scripts = Latn}

m["ddo"] = {"Tsez", 34033, "cau-tsz", scripts = {"Cyrl"}, translit_module = "ddo-translit"}

m["ddr"] = {"Dhudhuroa", 5269842, "aus-pam", scripts = Latn}

m["dds"] = {"Donno So Dogon", 1234776, "nic-dge", scripts = Latn}

m["ddw"] = {"Dawera-Daweloor", 5242304, "poz-tim", scripts = Latn}

m["dec"] = {"Dagik", 35125, "alv-tal", scripts = Latn}

m["ded"] = {"Dedua", 5249850, "ngf", scripts = Latn}

m["dee"] = {"Dewoin", 3914892, "kro-wkr", scripts = Latn}

m["def"] = {"Dezfuli", 4115412, "ira-swi"}

m["deg"] = {"Degema", 35182, "alv-dlt", scripts = Latn}

m["deh"] = {"Dehwari", 5704314, "ira-swi", ancestors = {"fa"}}

m["dei"] = {"Demisa", 56380, "paa-egb", scripts = Latn}

m["dek"] = { -- called "unattested alleged language" by Wikipedia
    "Dek",
    5252754,
    scripts = Latn
}

m["dem"] = {"Dem", 5254989, "paa", scripts = Latn}

m["den"] = {"Slavey", 13272, "ath-nor", scripts = Latn}

m["dep"] = {"Pidgin Delaware", nil, "crp", scripts = Latn, ancestors = {"unm"}}

-- deq is not included, see [[WT:LT]]

m["der"] = {"Deori", 56478, "tbq-bdg", scripts = {"Beng", "Latn"}}

m["des"] = {"Desano", 962392, "sai-tuc", scripts = Latn}

m["dev"] = {"Domung", 5291378, "ngf-fin", scripts = Latn}

m["dez"] = {"Dengese", 2909984, "bnt-tet", scripts = Latn}

m["dga"] = {"Southern Dagaare", 35159, "nic-mre", scripts = Latn}

m["dgb"] = {"Bunoge", 4985178, "nic-dgw", scripts = Latn}

m["dgc"] = {"Casiguran Dumagat Agta", 5313599, "phi", scripts = Latn}

m["dgd"] = {"Dagaari Dioula", 11153465, "nic-mre", scripts = Latn}

m["dge"] = {"Degenan", 5251770, "ngf-fin", scripts = Latn}

m["dgg"] = {"Doga", 3033726, "poz-ocw", scripts = Latn}

m["dgh"] = {"Dghwede", 56293, "cdc-cbm", scripts = Latn}

m["dgi"] = {"Northern Dagara", 11004218, "nic-mre", scripts = Latn}

m["dgk"] = {"Dagba", 12952357, "csu-sar", scripts = Latn}

m["dgn"] = {"Dagoman", 10465931, "aus-yng", scripts = Latn}

m["dgo"] = {"Hindi Dogri", nil, "him", ancestors = {"doi"}, scripts = {"Deva", "Arab", "Takr"}}

m["dgr"] = {"Dogrib", 20979, "ath-nor", scripts = Latn}

m["dgs"] = {"Dogoso", 35343, "nic-gur"}

m["dgt"] = {"Ntra'ngith", 6983809, "aus-pam", scripts = Latn}

-- dgu is not a language; see [[w:Dhekaru]]

m["dgw"] = {"Daungwurrung", 5228050, "aus-pam", scripts = Latn}

m["dgx"] = {"Doghoro", 12952392, "ngf", scripts = Latn}

m["dgz"] = {"Daga", 5208442, "ngf", scripts = Latn}

m["dhg"] = {"Dhangu", 5268960, "aus-yol", scripts = Latn}

m["dhi"] = {"Dhimal", 35229, "sit-dhi", scripts = Deva}

m["dhl"] = {"Dhalandji", 5268787, "aus-psw", scripts = Latn}

m["dhm"] = {"Zemba", 3502283, "bnt-swb", ancestors = {"hz"}, scripts = Latn}

m["dhn"] = {"Dhanki", 5268992, "inc-bhi"}

m["dho"] = {"Dhodia", 5269658, "inc-bhi", scripts = Deva}

m["dhr"] = {"Tharrgari", 10470289, "aus-psw", scripts = Latn}

m["dhs"] = {"Dhaiso", 11001788, "bnt-kka", scripts = Latn}

m["dhu"] = {"Dhurga", 1285318, "aus-yuk", scripts = Latn}

m["dhv"] = {"Drehu", 3039319, "poz-occ", scripts = Latn}

m["dhw"] = {"Danuwar", 3522797, "inc-bhi", scripts = Deva}

m["dhx"] = {"Dhungaloo", 16960599, "aus-pam", scripts = Latn}

m["dia"] = {"Dia", 3446591, "qfa-tor", scripts = Latn}

m["dib"] = {"South Central Dinka", 35154, "sdv-dnu", ancestors = {"din"}, scripts = Latn}

m["dic"] = {"Lakota Dida", 11001730, "kro-did", scripts = Latn}

m["did"] = {"Didinga", 56365, "sdv", scripts = Latn}

m["dif"] = {"Dieri", 25559563, "aus-kar", scripts = Latn}

m["dig"] = {"Digo", 3362072, "bnt-mij", scripts = Latn}

-- "dih" IS SPLIT INTO nai-ipa, nai-kum, nai-tip, SEE WT:LT

m["dii"] = {"Dimbong", 35196, "bnt-baf", scripts = Latn}

m["dij"] = {"Dai", 5209056, "poz-tim"}

m["dik"] = {"Southwestern Dinka", 36540, "sdv-dnu", ancestors = {"din"}, scripts = Latn}

m["dil"] = {"Dilling", 35152, "nub-hil", scripts = Latn}

m["dim"] = {"Dime", 35311, "omv-aro"}

m["din"] = {"Dinka", 56466, "sdv-dnu", scripts = Latn}

m["dio"] = {"Dibo", 3914891, "alv-ngb", scripts = Latn}

m["dip"] = {"Northeastern Dinka", 36246, "sdv-dnu", ancestors = {"din"}, scripts = Latn}

m["dir"] = {"Dirim", 11130804, "nic-dak", scripts = Latn}

m["dis"] = {"Dimasa", 56664, "tbq-bdg", scripts = {"Latn", "Beng"}}

m["diu"] = {"Gciriku", 3780954, "bnt-kav", scripts = Latn}

m["diw"] = {"Northwestern Dinka", 36249, "sdv-dnu", ancestors = {"din"}, scripts = Latn}

m["dix"] = {"Dixon Reef", 5284967, "poz-vnc", scripts = Latn}

m["diy"] = {"Diuwe", 5283765, "ngf"}

m["diz"] = {"Ding", 35202, "bnt-bdz", scripts = Latn}

m["dja"] = {"Djadjawurrung", 5285190, "aus-pam", scripts = Latn}

m["djb"] = {"Djinba", 5285351, "aus-yol", scripts = Latn}

m["djc"] = {"Dar Daju Daju", 5209890, "sdv-daj", scripts = Latn}

m["djd"] = {"Jaminjung", 6147825, "aus-mir", scripts = Latn}

m["dje"] = {"Zarma", 36990, "son", scripts = {"Latn", "Arab", "Brai"}}

m["djf"] = {"Djangun", 10474818, "aus-pmn", scripts = Latn}

m["dji"] = {"Djinang", 5285350, "aus-yol", scripts = Latn}

m["djj"] = {"Ndjébbana", 5285274, "aus-arn", scripts = Latn}

m["djk"] = {"Aukan", 2659044, "crp", scripts = {"Latn", "Afak"}, ancestors = {"en"}}

m["djl"] = {"Djiwarli", nil, "aus-psw", scripts = Latn}

m["djm"] = {"Jamsay", 3913290, "nic-pld", scripts = Latn}

m["djn"] = {"Djauan", 13553748, "aus-gun", scripts = Latn}

m["djo"] = {"Jangkang", 12952388, "day"}

m["djr"] = {"Djambarrpuyngu", 3915679, "aus-yol", scripts = Latn}

m["dju"] = {"Kapriman", 6367199, "paa-spk", scripts = Latn}

m["djw"] = {"Djawi", 3913844, "aus-nyu", ancestors = {"bcj"}, scripts = Latn}

m["dka"] = {"Dakpa", 3695189, "sit-ebo", scripts = {"Tibt"}}

m["dkk"] = {"Dakka", 5209962, "poz-ssw"}

m["dkr"] = {"Kuijau", 13580777, "poz-bnn"}

m["dks"] = {"Southeastern Dinka", 36538, "sdv-dnu", ancestors = {"din"}, scripts = Latn}

m["dkx"] = {"Mazagway", 6798209, "cdc-cbm", scripts = Latn}

m["dlg"] = {"Dolgan", 32878, "trk-sib", scripts = {"Cyrl"}}

m["dlk"] = {"Dahalik", 32260, "sem-eth", scripts = {"Ethi"}, translit_module = "Ethi-translit"}

m["dlm"] = {"Dalmatian", 35527, "roa-itd", scripts = Latn}

m["dln"] = {"Darlong", 5224029, "tbq-kuk", scripts = Latn}

m["dma"] = {"Duma", 35319, "bnt-nze", scripts = Latn}

m["dmb"] = {"Mombo Dogon", 6897074, "nic-dgw", scripts = Latn}

m["dmc"] = {"Gavak", 5277406, "ngf-mad", scripts = Latn}

m["dmd"] = {"Madhi Madhi", 6727353, "aus-pam", scripts = Latn}

m["dme"] = {"Dugwor", 56313, "cdc-cbm", scripts = Latn}

m["dmf"] = {"Medefaidrin", 1519764, "art", scripts = {"Medf"}, type = "appendix-constructed"}

m["dmg"] = {"Upper Kinabatangan", 16109975, "poz-san", scripts = Latn}

m["dmk"] = {"Domaaki", 32900, "inc-dar"}

m["dml"] = {"Dameli", 32288, "inc-dar"}

m["dmm"] = {"Dama (Nigeria)", 5211865, "alv-mbm", scripts = Latn}

m["dmo"] = {"Kemezung", 35562, "nic-bbe", scripts = Latn}

m["dmr"] = {"East Damar", 5328200, "poz-cet", scripts = Latn}

m["dms"] = {"Dampelas", 5212928, "poz-tot", scripts = Latn}

m["dmu"] = {"Dubu", 7692059, "paa-pau", scripts = Latn}

m["dmv"] = {"Dumpas", 12953512, "poz-san", scripts = Latn}

m["dmw"] = {"Mudburra", 6931573, "aus-pam", scripts = Latn}

m["dmx"] = {"Dema", 3553423, "bnt-sho", scripts = Latn}

m["dmy"] = {"Demta", 14466283, "paa-sen", scripts = Latn}

m["dna"] = {"Upper Grand Valley Dani", 12952361, "ngf", scripts = Latn}

m["dnd"] = {"Daonda", 5221528, "paa-brd", scripts = Latn}

m["dne"] = {"Ndendeule", 6983725, "bnt-mbi", scripts = Latn}

m["dng"] = {"Dungan", 33050, "zhx", scripts = {"Cyrl", "Hani", "Arab"}, ancestors = {"cmn"}, translit_module = "dng-translit"}

m["dni"] = {"Lower Grand Valley Dani", 12635807, "ngf", scripts = Latn}

m["dnj"] = {"Dan", 1158971, "dmn-mda", scripts = Latn}

m["dnk"] = {"Dengka", 5256954, "poz-tim", scripts = Latn}

m["dnn"] = {"Dzuun", 10973260, "dmn-smg"}

m["dno"] = {"Ndrulo", 60785094, "csu-lnd"}

m["dnr"] = {"Danaru", 5214932, "ngf-mad", scripts = Latn}

m["dnt"] = {"Mid Grand Valley Dani", 12952359, "ngf", scripts = Latn}

m["dnu"] = {"Danau", 5013745, "mkh-pal"}

m["dnv"] = {"Danu", 5221251, "tbq-brm", ancestors = {"obr"}}

m["dnw"] = {"Western Dani", 7987774, "ngf", scripts = Latn}

m["dny"] = {"Dení", 56562, "auf", scripts = Latn}

m["doa"] = {"Dom", 5289770, "ngf", scripts = Latn}

m["dob"] = {"Dobu", 952133, "poz-ocw", scripts = Latn}

m["doc"] = {"Northern Kam", 17195499, "qfa-tak", scripts = Latn}

m["doe"] = {"Doe", 5288055, "bnt-ruv", scripts = Latn}

m["dof"] = {"Domu", 5291375, "ngf", scripts = Latn}

m["doh"] = {"Dong", 3438405, "nic-dak", scripts = Latn}

m["doi"] = {
    "Dogri",
    32730,
    "him",
    scripts = {"Deva", "Takr", "fa-Arab", "Dogr"},
    translit_module = "hi-translit" -- for now
}

m["dok"] = {"Dondo", 5295571, "poz-tot", scripts = Latn}

m["dol"] = {"Doso", 4167202, "paa", scripts = Latn}

m["don"] = {"Doura", 7829037, "poz-ocw", scripts = Latn}

m["doo"] = {"Dongo", 35303, "nic-mbc", scripts = Latn}

m["dop"] = {"Lukpa", 3258739, "nic-gne", scripts = Latn}

m["doq"] = {
    "Dominican Sign Language",
    5290820,
    "sgn",
    scripts = Latn -- when documented
}

m["dor"] = {"Dori'o", 3037084, "poz-sls", scripts = Latn}

m["dos"] = {"Dogosé", 3913314, "nic-gur", scripts = Latn}

m["dot"] = {"Dass", 3441293, "cdc-wst", scripts = Latn}

m["dov"] = {"Toka-Leya", 11001779, "bnt-bot", ancestors = {"toi"}, scripts = Latn}

m["dow"] = {"Doyayo", 35299, "alv-dur", scripts = Latn}

m["dox"] = {"Bussa", 35123, "cus", scripts = Latn}

m["doy"] = {"Dompo", 35270, "alv-gng", scripts = Latn}

m["doz"] = {"Dorze", 56336, "omv-nom", scripts = Latn}

m["dpp"] = {"Papar", 7132487, "poz-san", scripts = Latn}

m["drb"] = {"Dair", 12952360, "nub-hil", scripts = Latn}

m["drc"] = {"Minderico", 6863806, "roa-ibe", scripts = Latn, ancestors = {"pt"}}

m["drd"] = {"Darmiya", 5224058, "sit-alm"}

m["drg"] = {"Rungus", 6897407, "poz-san", scripts = Latn}

m["dri"] = {"Lela", 3914004, "nic-knn", scripts = Latn}

m["drl"] = {"Baagandji", 5223941, "aus-pam", scripts = Latn}

m["drn"] = {"West Damar", 3450459, "poz-tim", scripts = Latn}

m["dro"] = {"Daro-Matu Melanau", 5224156, "poz-bnn", scripts = Latn}

m["drq"] = {"Dura", 3449842, "sit-gma"}

m["drs"] = {"Gedeo", 56622, "cus", scripts = {"Ethi"}}

m["dru"] = {"Rukai", 49232, "map", scripts = Latn, ancestors = {"dru-pro"}}

m["dry"] = {"Darai", 46995026, "inc-bhi", scripts = Deva}

m["dsb"] = {
    "Lower Sorbian",
    13286,
    "wen",
    scripts = Latn,
    sort_key = {from = {"b́", "č", "ć", "ě", "ł", "ḿ", "ń", "ó", "ṕ", "ŕ", "š", "ś", "ẃ", "[žż]", "ź"}, to = {"bj", "c~", "c~~", "e~", "l*", "mj", "n~", "o", "pj", "r~", "s~", "s~~", "wj", "z~", "z~~"}}, -- ł comes before l in alphabetic order
    standardChars = "A-PR-UWYZa-pr-uwyz0-9ÓóĆćČčĚěŁłŃńŔŕŚśŠšŹźŽž" .. PUNCTUATION
}

m["dse"] = {
    "Dutch Sign Language",
    2201099,
    "sgn",
    scripts = Latn -- when documented
}

m["dsh"] = {"Daasanach", 56637, "cus", scripts = Latn}

m["dsi"] = {"Disa", 3914455, "csu-bgr", scripts = Latn}

m["dsl"] = {
    "Danish Sign Language",
    2605298,
    "sgn",
    scripts = Latn -- when documented
}

m["dsn"] = {"Dusner", 5316948, "poz-hce", scripts = Latn}

m["dso"] = {"Desiya", 12629755, "inc-eas", scripts = {"Orya"}, ancestors = {"or"}}

m["dsq"] = {"Tadaksahak", 36568, "son", scripts = {"Arab", "Latn"}}

m["dta"] = {"Daur", 32430, "xgn", scripts = {"Latn", "Hani", "Cyrl", "Mong"}}

m["dtb"] = {"Labuk-Kinabatangan Kadazan", 5330240, "poz-san", scripts = Latn}

m["dtd"] = {"Ditidaht", 13728042, "wak", scripts = Latn}

m["dth"] = { -- contrast 'rrt'
    "Adithinngithigh",
    4683034,
    "aus-pmn",
    scripts = Latn
}

m["dti"] = {"Ana Tinga Dogon", 4750346, "qfa-dgn", scripts = Latn}

m["dtk"] = {"Tene Kan Dogon", 11018863, "nic-pld", scripts = Latn}

m["dtm"] = {"Tomo Kan Dogon", 11137719, "nic-pld", scripts = Latn}

m["dto"] = {"Tommo So", 47012992, "nic-dge", scripts = Latn}

m["dtp"] = {"Central Dusun", 5317225, "poz-san", scripts = Latn}

m["dtr"] = {"Lotud", 6685078, "poz-san", scripts = Latn}

m["dts"] = {"Toro So Dogon", 11003311, "nic-dge", scripts = Latn}

m["dtt"] = {"Toro Tegu Dogon", 3913924, "nic-pld", scripts = Latn}

m["dtu"] = {"Tebul Ure Dogon", 7692089, "qfa-dgn", scripts = Latn}

m["dty"] = {"Doteli", 18415595, "inc-pah", scripts = Deva, translit_module = "ne-translit", ancestors = {"ne"}}

m["dua"] = {"Duala", 33013, "bnt-saw", scripts = Latn}

m["dub"] = {"Dubli", 5310792, "inc-bhi"}

m["duc"] = {"Duna", 5314039, "paa", scripts = Latn}

m["due"] = {"Umiray Dumaget Agta", 7881585, "phi", scripts = Latn}

m["duf"] = {"Dumbea", 6983819, "poz-cln", scripts = Latn}

m["dug"] = {"Chiduruma", 35614, "bnt-mij", scripts = Latn}

m["duh"] = {"Dungra Bhil", 12953513, "inc-bhi", scripts = {"Deva", "Gujr"}}

m["dui"] = {"Dumun", 5314004, "ngf-mad", scripts = Latn}

m["duk"] = {"Uyajitaya", 7904085, "ngf-mad", scripts = Latn}

m["dul"] = {"Alabat Island Agta", 3399709, "phi", scripts = Latn}

m["dum"] = {"Middle Dutch", 178806, "gmw", scripts = Latn, ancestors = {"odt"}, entry_name = {from = {"[ĀÂ]", "[āâ]", "[ĒÊË]", "[ēêë]", "[ĪÎ]", "[īî]", "[ŌÔ]", "[ōô]", "[ŪÛ]", "[ūû]"}, to = {"A", "a", "E", "e", "I", "i", "O", "o", "U", "u"}}}

m["dun"] = {"Dusun Deyah", 2784033, "poz-bre", scripts = Latn}

m["duo"] = {"Dupaningan Agta", 5315912, "phi", scripts = Latn}

m["dup"] = {"Duano", 3040468, "poz-mly", scripts = Latn}

m["duq"] = {"Dusun Malang", 3041711, "poz-bre", scripts = Latn}

m["dur"] = {"Dii", nil, "alv-dur", scripts = Latn}

m["dus"] = {"Dumi", 56315, "sit-kiw", scripts = Deva}

m["duu"] = {"Drung", 56406, "sit-nng"}

m["duv"] = {"Duvle", 56364, "paa-lkp", scripts = Latn}

m["duw"] = {"Dusun Witu", 2381310, "poz-bre", scripts = Latn}

m["dux"] = {"Duun", 3914880, "dmn-smg", scripts = Latn}

m["duy"] = {"Dicamay Agta", 5272321, "phi", scripts = Latn}

m["duz"] = {"Duli", 5313405, "alv-ada", scripts = Latn}

m["dva"] = {"Duau", 5310448, "poz-ocw", scripts = Latn}

m["dwa"] = {"Diri", 56286, "cdc-wst", scripts = Latn}

m["dwr"] = {"Dawro", 12629647, "omv-nom", scripts = {"Ethi", "Latn"}}

m["dwu"] = {"Dhuwal", nil, "aus-yol", scripts = Latn}

m["dww"] = {"Dawawa", 5242286, "poz-ocw", scripts = Latn}

m["dwy"] = {"Dhuwaya", nil, "aus-yol", scripts = Latn}

m["dwz"] = {"Dewas Rai", 62663667, "inc-bhi"}

m["dya"] = {"Dyan", 35340, "nic-gur", scripts = Latn}

m["dyb"] = {"Dyaberdyaber", 5285185, "aus-nyu", scripts = Latn}

m["dyd"] = {"Dyugun", 3913785, "aus-nyu", scripts = Latn}

m["dyg"] = {"Villa Viciosa Agta", 12626611, "phi", scripts = Latn}

m["dyi"] = {"Djimini", 35336, "alv-tdj", scripts = Latn}

m["dym"] = {"Yanda Dogon", 8048316, "qfa-dgn", scripts = Latn}

m["dyn"] = {"Dyangadi", 3913820, "aus-cww", scripts = Latn}

m["dyo"] = {"Jola-Fonyi", 3507832, "alv-jol", scripts = Latn}

m["dyu"] = {"Dyula", 32706, "dmn-man", scripts = Latn}

m["dyy"] = {"Dyaabugay", 2591320, "aus-pmn", scripts = Latn}

m["dza"] = {"Tunzu", 3915845, "nic-jer", scripts = Latn}

m["dzg"] = {"Dazaga", 35244, "ssa-sah", scripts = Latn}

m["dzl"] = {"Dzala", 56607, "sit-ebo", scripts = {"Tibt"}}

m["dzn"] = {"Dzando", 5319622, "bnt-bun", scripts = Latn}

return m
