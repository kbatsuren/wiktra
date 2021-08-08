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

m["daa"] = {"Dangaléat", 942591, "cdc-est", Latn}

m["dac"] = {"Dambi", 12629491, "poz-ocw", Latn}

m["dad"] = {"Marik", 6763404, "poz-ocw", Latn}

m["dae"] = {"Duupa", 35263, "alv-dur", Latn}

m["dag"] = {"Dagbani", 32238, "nic-dag", Latn}

m["dah"] = {"Gwahatike", 5623246, "ngf-fin", Latn}

m["dai"] = {"Day", 35163, "alv-mbd", Latn}

m["daj"] = {"Dar Fur Daju", 56370, "sdv-daj", Latn}

m["dak"] = {"Dakota", 530384, "sio-dkt", Latn}

m["dal"] = {"Dahalo", 35143, "cus", Latn}

m["dam"] = {"Damakawa", 1158134, "nic-knn", Latn}

m["dao"] = {"Daai Chin", 860029, "tbq-kuk", Latn}

m["daq"] = {"Dandami Maria", 12952805, "dra", ancestors = {"gon"}}

m["dar"] = {"Dargwa", 32332, "cau-drg", {"Cyrl"}, translit_module = "dar-translit", override_translit = true}

m["das"] = {"Daho-Doo", 3915369, "kro-wee", Latn}

m["dau"] = {"Dar Sila Daju", 7514020, "sdv-daj", Latn}

m["dav"] = {"Taita", 2387274, "bnt-cht", Latn}

m["daw"] = {"Davawenyo", 5228174, "phi", Latn}

m["dax"] = {"Dayi", 10467281, "aus-yol", Latn}

m["daz"] = {"Dao", 5221513, "ngf", Latn}

m["dba"] = {"Bangi Me", 1982696, "qfa-iso", Latn}

m["dbb"] = {"Deno", 56275, "cdc-wst", Latn}

m["dbd"] = {"Dadiya", 3914436, "alv-wjk", Latn}

m["dbe"] = {"Dabe", 5207451, "paa-tkw", Latn}

m["dbf"] = {"Edopi", 12953516, "paa-lkp", Latn}

m["dbg"] = {"Dogul Dom", 3912880, "nic-npd", Latn}

m["dbi"] = {"Doka", 3913293, "nic-plc", Latn}

m["dbj"] = {"Ida'an", 3041552, "poz-san", Latn}

m["dbl"] = {"Dyirbal", 35465, "aus-dyb", Latn}

m["dbm"] = {"Duguri", 7194057, "nic-jrw", Latn}

m["dbn"] = {"Duriankere", 5316627, "ngf-sbh", Latn}

m["dbo"] = {"Dulbu", 5313310, "nic-jrn", Latn}

m["dbp"] = {"Duwai", 56301, "cdc-wst", Latn}

m["dbq"] = {"Daba", 3913342, "cdc-cbm", Latn}

m["dbr"] = {"Dabarre", 3447286, "cus"}

m["dbt"] = {"Ben Tey", 4886561, "nic-nwa", Latn}

m["dbu"] = {"Bondum Dom Dogon", 3912758, "nic-npd", Latn}

m["dbv"] = {"Dungu", 5315230, "nic-kau", Latn}

m["dbw"] = {"Bankan Tey Dogon", 4856243, "nic-nwa", Latn}

m["dby"] = {"Dibiyaso", 5272268, "ngf", Latn}

m["dcc"] = {"Deccani", 669431, "inc-hnd", {"ur-Arab"}, ancestors = {"ur"}}

m["dcr"] = {"Negerhollands", 1815830, "crp", Latn, ancestors = {"nl"}}

m["dda"] = {"Dadi Dadi", nil, "aus-pam", Latn}

m["ddd"] = {"Dongotono", 56676, "sdv-lma"}

m["dde"] = {"Doondo", 11003401, "bnt-kng", Latn}

m["ddg"] = {"Fataluku", 35353, "qfa-tap", Latn}

m["ddi"] = {"Diodio", 3028668, "poz-ocw", Latn}

m["ddj"] = {"Jaru", 3162806, "aus-pam", Latn}

m["ddn"] = {"Dendi", 35164, "son", Latn}

m["ddo"] = {"Tsez", 34033, "cau-tsz", {"Cyrl"}, translit_module = "ddo-translit"}

m["ddr"] = {"Dhudhuroa", 5269842, "aus-pam", Latn}

m["dds"] = {"Donno So Dogon", 1234776, "nic-dge", Latn}

m["ddw"] = {"Dawera-Daweloor", 5242304, "poz-tim", Latn}

m["dec"] = {"Dagik", 35125, "alv-tal", Latn}

m["ded"] = {"Dedua", 5249850, "ngf", Latn}

m["dee"] = {"Dewoin", 3914892, "kro-wkr", Latn}

m["def"] = {"Dezfuli", 4115412, "ira-swi"}

m["deg"] = {"Degema", 35182, "alv-dlt", Latn}

m["deh"] = {"Dehwari", 5704314, "ira-swi", ancestors = {"fa"}}

m["dei"] = {"Demisa", 56380, "paa-egb", Latn}

m["dek"] = { -- called "unattested alleged language" by Wikipedia
    "Dek", 5252754, nil, Latn
}

m["dem"] = {"Dem", 5254989, "paa", Latn}

m["den"] = {"Slavey", 13272, "ath-nor", Latn}

m["dep"] = {"Pidgin Delaware", nil, "crp", Latn, ancestors = {"unm"}}

-- deq is not included, see [[WT:LT]]

m["der"] = {"Deori", 56478, "tbq-bdg", {"Beng", "Latn"}}

m["des"] = {"Desano", 962392, "sai-tuc", Latn}

m["dev"] = {"Domung", 5291378, "ngf-fin", Latn}

m["dez"] = {"Dengese", 2909984, "bnt-tet", Latn}

m["dga"] = {"Southern Dagaare", 35159, "nic-mre", Latn}

m["dgb"] = {"Bunoge", 4985178, "nic-dgw", Latn}

m["dgc"] = {"Casiguran Dumagat Agta", 5313599, "phi", Latn}

m["dgd"] = {"Dagaari Dioula", 11153465, "nic-mre", Latn}

m["dge"] = {"Degenan", 5251770, "ngf-fin", Latn}

m["dgg"] = {"Doga", 3033726, "poz-ocw", Latn}

m["dgh"] = {"Dghwede", 56293, "cdc-cbm", Latn}

m["dgi"] = {"Northern Dagara", 11004218, "nic-mre", Latn}

m["dgk"] = {"Dagba", 12952357, "csu-sar", Latn}

m["dgn"] = {"Dagoman", 10465931, "aus-yng", Latn}

m["dgo"] = {"Hindi Dogri", nil, "him", {"Deva", "Arab", "Takr"}, ancestors = {"doi"}}

m["dgr"] = {"Dogrib", 20979, "ath-nor", Latn}

m["dgs"] = {"Dogoso", 35343, "nic-gur"}

m["dgt"] = {"Ntra'ngith", 6983809, "aus-pam", Latn}

-- dgu is not a language; see [[w:Dhekaru]]

m["dgw"] = {"Daungwurrung", 5228050, "aus-pam", Latn}

m["dgx"] = {"Doghoro", 12952392, "ngf", Latn}

m["dgz"] = {"Daga", 5208442, "ngf", Latn}

m["dhg"] = {"Dhangu", 5268960, "aus-yol", Latn}

m["dhi"] = {"Dhimal", 35229, "sit-dhi", Deva}

m["dhl"] = {"Dhalandji", 5268787, "aus-psw", Latn}

m["dhm"] = {"Zemba", 3502283, "bnt-swb", Latn, ancestors = {"hz"}}

m["dhn"] = {"Dhanki", 5268992, "inc-bhi"}

m["dho"] = {"Dhodia", 5269658, "inc-bhi", Deva}

m["dhr"] = {"Tharrgari", 10470289, "aus-psw", Latn}

m["dhs"] = {"Dhaiso", 11001788, "bnt-kka", Latn}

m["dhu"] = {"Dhurga", 1285318, "aus-yuk", Latn}

m["dhv"] = {"Drehu", 3039319, "poz-occ", Latn}

m["dhw"] = {"Danuwar", 3522797, "inc-bhi", Deva}

m["dhx"] = {"Dhungaloo", 16960599, "aus-pam", Latn}

m["dia"] = {"Dia", 3446591, "qfa-tor", Latn}

m["dib"] = {"South Central Dinka", 35154, "sdv-dnu", Latn, ancestors = {"din"}}

m["dic"] = {"Lakota Dida", 11001730, "kro-did", Latn}

m["did"] = {"Didinga", 56365, "sdv", Latn}

m["dif"] = {"Dieri", 25559563, "aus-kar", Latn}

m["dig"] = {"Digo", 3362072, "bnt-mij", Latn}

-- "dih" IS SPLIT INTO nai-ipa, nai-kum, nai-tip, SEE WT:LT

m["dii"] = {"Dimbong", 35196, "bnt-baf", Latn}

m["dij"] = {"Dai", 5209056, "poz-tim"}

m["dik"] = {"Southwestern Dinka", 36540, "sdv-dnu", Latn, ancestors = {"din"}}

m["dil"] = {"Dilling", 35152, "nub-hil", Latn}

m["dim"] = {"Dime", 35311, "omv-aro"}

m["din"] = {"Dinka", 56466, "sdv-dnu", Latn}

m["dio"] = {"Dibo", 3914891, "alv-ngb", Latn}

m["dip"] = {"Northeastern Dinka", 36246, "sdv-dnu", Latn, ancestors = {"din"}}

m["dir"] = {"Dirim", 11130804, "nic-dak", Latn}

m["dis"] = {"Dimasa", 56664, "tbq-bdg", {"Latn", "Beng"}}

m["diu"] = {"Gciriku", 3780954, "bnt-kav", Latn}

m["diw"] = {"Northwestern Dinka", 36249, "sdv-dnu", Latn, ancestors = {"din"}}

m["dix"] = {"Dixon Reef", 5284967, "poz-vnc", Latn}

m["diy"] = {"Diuwe", 5283765, "ngf"}

m["diz"] = {"Ding", 35202, "bnt-bdz", Latn}

m["dja"] = {"Djadjawurrung", 5285190, "aus-pam", Latn}

m["djb"] = {"Djinba", 5285351, "aus-yol", Latn}

m["djc"] = {"Dar Daju Daju", 5209890, "sdv-daj", Latn}

m["djd"] = {"Jaminjung", 6147825, "aus-mir", Latn}

m["dje"] = {"Zarma", 36990, "son", {"Latn", "Arab", "Brai"}}

m["djf"] = {"Djangun", 10474818, "aus-pmn", Latn}

m["dji"] = {"Djinang", 5285350, "aus-yol", Latn}

m["djj"] = {"Ndjébbana", 5285274, "aus-arn", Latn}

m["djk"] = {"Aukan", 2659044, "crp", {"Latn", "Afak"}, ancestors = {"en"}}

m["djl"] = {"Djiwarli", nil, "aus-psw", Latn}

m["djm"] = {"Jamsay", 3913290, "nic-pld", Latn}

m["djn"] = {"Djauan", 13553748, "aus-gun", Latn}

m["djo"] = {"Jangkang", 12952388, "day"}

m["djr"] = {"Djambarrpuyngu", 3915679, "aus-yol", Latn}

m["dju"] = {"Kapriman", 6367199, "paa-spk", Latn}

m["djw"] = {"Djawi", 3913844, "aus-nyu", Latn, ancestors = {"bcj"}}

m["dka"] = {"Dakpa", 3695189, "sit-ebo", {"Tibt"}}

m["dkk"] = {"Dakka", 5209962, "poz-ssw"}

m["dkr"] = {"Kuijau", 13580777, "poz-bnn"}

m["dks"] = {"Southeastern Dinka", 36538, "sdv-dnu", Latn, ancestors = {"din"}}

m["dkx"] = {"Mazagway", 6798209, "cdc-cbm", Latn}

m["dlg"] = {"Dolgan", 32878, "trk-sib", {"Cyrl"}}

m["dlk"] = {"Dahalik", 32260, "sem-eth", {"Ethi"}, translit_module = "Ethi-translit"}

m["dlm"] = {"Dalmatian", 35527, "roa-itd", Latn}

m["dln"] = {"Darlong", 5224029, "tbq-kuk", Latn}

m["dma"] = {"Duma", 35319, "bnt-nze", Latn}

m["dmb"] = {"Mombo Dogon", 6897074, "nic-dgw", Latn}

m["dmc"] = {"Gavak", 5277406, "ngf-mad", Latn}

m["dmd"] = {"Madhi Madhi", 6727353, "aus-pam", Latn}

m["dme"] = {"Dugwor", 56313, "cdc-cbm", Latn}

m["dmf"] = {"Medefaidrin", 1519764, "art", {"Medf"}, type = "appendix-constructed"}

m["dmg"] = {"Upper Kinabatangan", 16109975, "poz-san", Latn}

m["dmk"] = {"Domaaki", 32900, "inc-dar"}

m["dml"] = {"Dameli", 32288, "inc-dar"}

m["dmm"] = {"Dama (Nigeria)", 5211865, "alv-mbm", Latn}

m["dmo"] = {"Kemezung", 35562, "nic-bbe", Latn}

m["dmr"] = {"East Damar", 5328200, "poz-cet", Latn}

m["dms"] = {"Dampelas", 5212928, "poz-tot", Latn}

m["dmu"] = {"Dubu", 7692059, "paa-pau", Latn}

m["dmv"] = {"Dumpas", 12953512, "poz-san", Latn}

m["dmw"] = {"Mudburra", 6931573, "aus-pam", Latn}

m["dmx"] = {"Dema", 3553423, "bnt-sho", Latn}

m["dmy"] = {"Demta", 14466283, "paa-sen", Latn}

m["dna"] = {"Upper Grand Valley Dani", 12952361, "ngf", Latn}

m["dnd"] = {"Daonda", 5221528, "paa-brd", Latn}

m["dne"] = {"Ndendeule", 6983725, "bnt-mbi", Latn}

m["dng"] = {"Dungan", 33050, "zhx", {"Cyrl", "Hani", "Arab"}, ancestors = {"cmn"}, translit_module = "dng-translit"}

m["dni"] = {"Lower Grand Valley Dani", 12635807, "ngf", Latn}

m["dnj"] = {"Dan", 1158971, "dmn-mda", Latn}

m["dnk"] = {"Dengka", 5256954, "poz-tim", Latn}

m["dnn"] = {"Dzuun", 10973260, "dmn-smg"}

m["dno"] = {"Ndrulo", 60785094, "csu-lnd"}

m["dnr"] = {"Danaru", 5214932, "ngf-mad", Latn}

m["dnt"] = {"Mid Grand Valley Dani", 12952359, "ngf", Latn}

m["dnu"] = {"Danau", 5013745, "mkh-pal"}

m["dnv"] = {"Danu", 5221251, "tbq-brm", ancestors = {"obr"}}

m["dnw"] = {"Western Dani", 7987774, "ngf", Latn}

m["dny"] = {"Dení", 56562, "auf", Latn}

m["doa"] = {"Dom", 5289770, "ngf", Latn}

m["dob"] = {"Dobu", 952133, "poz-ocw", Latn}

m["doc"] = {"Northern Kam", 17195499, "qfa-tak", Latn}

m["doe"] = {"Doe", 5288055, "bnt-ruv", Latn}

m["dof"] = {"Domu", 5291375, "ngf", Latn}

m["doh"] = {"Dong", 3438405, "nic-dak", Latn}

m["doi"] = {
    "Dogri",
    32730,
    "him",
    {"Deva", "Takr", "fa-Arab", "Dogr"},
    translit_module = "hi-translit" -- for now
}

m["dok"] = {"Dondo", 5295571, "poz-tot", Latn}

m["dol"] = {"Doso", 4167202, "paa", Latn}

m["don"] = {"Doura", 7829037, "poz-ocw", Latn}

m["doo"] = {"Dongo", 35303, "nic-mbc", Latn}

m["dop"] = {"Lukpa", 3258739, "nic-gne", Latn}

m["doq"] = {
    "Dominican Sign Language", 5290820, "sgn", Latn -- when documented
}

m["dor"] = {"Dori'o", 3037084, "poz-sls", Latn}

m["dos"] = {"Dogosé", 3913314, "nic-gur", Latn}

m["dot"] = {"Dass", 3441293, "cdc-wst", Latn}

m["dov"] = {"Toka-Leya", 11001779, "bnt-bot", Latn, ancestors = {"toi"}}

m["dow"] = {"Doyayo", 35299, "alv-dur", Latn}

m["dox"] = {"Bussa", 35123, "cus", Latn}

m["doy"] = {"Dompo", 35270, "alv-gng", Latn}

m["doz"] = {"Dorze", 56336, "omv-nom", Latn}

m["dpp"] = {"Papar", 7132487, "poz-san", Latn}

m["drb"] = {"Dair", 12952360, "nub-hil", Latn}

m["drc"] = {"Minderico", 6863806, "roa-ibe", Latn, ancestors = {"pt"}}

m["drd"] = {"Darmiya", 5224058, "sit-alm"}

m["drg"] = {"Rungus", 6897407, "poz-san", Latn}

m["dri"] = {"Lela", 3914004, "nic-knn", Latn}

m["drl"] = {"Baagandji", 5223941, "aus-pam", Latn}

m["drn"] = {"West Damar", 3450459, "poz-tim", Latn}

m["dro"] = {"Daro-Matu Melanau", 5224156, "poz-bnn", Latn}

m["drq"] = {"Dura", 3449842, "sit-gma"}

m["drs"] = {"Gedeo", 56622, "cus", {"Ethi"}}

m["dru"] = {"Rukai", 49232, "map", Latn, ancestors = {"dru-pro"}}

m["dry"] = {"Darai", 46995026, "inc-bhi", Deva}

m["dsb"] = {
    "Lower Sorbian",
    13286,
    "wen",
    Latn,
    sort_key = {from = {"b́", "č", "ć", "ě", "ł", "ḿ", "ń", "ó", "ṕ", "ŕ", "š", "ś", "ẃ", "[žż]", "ź"}, to = {"bj", "c~", "c~~", "e~", "l*", "mj", "n~", "o", "pj", "r~", "s~", "s~~", "wj", "z~", "z~~"}}, -- ł comes before l in alphabetic order
    standardChars = "A-PR-UWYZa-pr-uwyz0-9ÓóĆćČčĚěŁłŃńŔŕŚśŠšŹźŽž" .. PUNCTUATION
}

m["dse"] = {
    "Dutch Sign Language", 2201099, "sgn", Latn -- when documented
}

m["dsh"] = {"Daasanach", 56637, "cus", Latn}

m["dsi"] = {"Disa", 3914455, "csu-bgr", Latn}

m["dsl"] = {
    "Danish Sign Language", 2605298, "sgn", Latn -- when documented
}

m["dsn"] = {"Dusner", 5316948, "poz-hce", Latn}

m["dso"] = {"Desiya", 12629755, "inc-eas", {"Orya"}, ancestors = {"or"}}

m["dsq"] = {"Tadaksahak", 36568, "son", {"Arab", "Latn"}}

m["dta"] = {"Daur", 32430, "xgn", {"Latn", "Hani", "Cyrl", "Mong"}}

m["dtb"] = {"Labuk-Kinabatangan Kadazan", 5330240, "poz-san", Latn}

m["dtd"] = {"Ditidaht", 13728042, "wak", Latn}

m["dth"] = { -- contrast 'rrt'
    "Adithinngithigh", 4683034, "aus-pmn", Latn
}

m["dti"] = {"Ana Tinga Dogon", 4750346, "qfa-dgn", Latn}

m["dtk"] = {"Tene Kan Dogon", 11018863, "nic-pld", Latn}

m["dtm"] = {"Tomo Kan Dogon", 11137719, "nic-pld", Latn}

m["dto"] = {"Tommo So", 47012992, "nic-dge", Latn}

m["dtp"] = {"Central Dusun", 5317225, "poz-san", Latn}

m["dtr"] = {"Lotud", 6685078, "poz-san", Latn}

m["dts"] = {"Toro So Dogon", 11003311, "nic-dge", Latn}

m["dtt"] = {"Toro Tegu Dogon", 3913924, "nic-pld", Latn}

m["dtu"] = {"Tebul Ure Dogon", 7692089, "qfa-dgn", Latn}

m["dty"] = {"Doteli", 18415595, "inc-pah", Deva, translit_module = "ne-translit", ancestors = {"ne"}}

m["dua"] = {"Duala", 33013, "bnt-saw", Latn}

m["dub"] = {"Dubli", 5310792, "inc-bhi"}

m["duc"] = {"Duna", 5314039, "paa", Latn}

m["due"] = {"Umiray Dumaget Agta", 7881585, "phi", Latn}

m["duf"] = {"Dumbea", 6983819, "poz-cln", Latn}

m["dug"] = {"Chiduruma", 35614, "bnt-mij", Latn}

m["duh"] = {"Dungra Bhil", 12953513, "inc-bhi", {"Deva", "Gujr"}}

m["dui"] = {"Dumun", 5314004, "ngf-mad", Latn}

m["duk"] = {"Uyajitaya", 7904085, "ngf-mad", Latn}

m["dul"] = {"Alabat Island Agta", 3399709, "phi", Latn}

m["dum"] = {"Middle Dutch", 178806, "gmw", Latn, ancestors = {"odt"}, entry_name = {from = {"[ĀÂ]", "[āâ]", "[ĒÊË]", "[ēêë]", "[ĪÎ]", "[īî]", "[ŌÔ]", "[ōô]", "[ŪÛ]", "[ūû]"}, to = {"A", "a", "E", "e", "I", "i", "O", "o", "U", "u"}}}

m["dun"] = {"Dusun Deyah", 2784033, "poz-bre", Latn}

m["duo"] = {"Dupaningan Agta", 5315912, "phi", Latn}

m["dup"] = {"Duano", 3040468, "poz-mly", Latn}

m["duq"] = {"Dusun Malang", 3041711, "poz-bre", Latn}

m["dur"] = {"Dii", nil, "alv-dur", Latn}

m["dus"] = {"Dumi", 56315, "sit-kiw", Deva}

m["duu"] = {"Drung", 56406, "sit-nng"}

m["duv"] = {"Duvle", 56364, "paa-lkp", Latn}

m["duw"] = {"Dusun Witu", 2381310, "poz-bre", Latn}

m["dux"] = {"Duun", 3914880, "dmn-smg", Latn}

m["duy"] = {"Dicamay Agta", 5272321, "phi", Latn}

m["duz"] = {"Duli", 5313405, "alv-ada", Latn}

m["dva"] = {"Duau", 5310448, "poz-ocw", Latn}

m["dwa"] = {"Diri", 56286, "cdc-wst", Latn}

m["dwr"] = {"Dawro", 12629647, "omv-nom", {"Ethi", "Latn"}}

m["dwu"] = {"Dhuwal", nil, "aus-yol", Latn}

m["dww"] = {"Dawawa", 5242286, "poz-ocw", Latn}

m["dwy"] = {"Dhuwaya", nil, "aus-yol", Latn}

m["dwz"] = {"Dewas Rai", 62663667, "inc-bhi"}

m["dya"] = {"Dyan", 35340, "nic-gur", Latn}

m["dyb"] = {"Dyaberdyaber", 5285185, "aus-nyu", Latn}

m["dyd"] = {"Dyugun", 3913785, "aus-nyu", Latn}

m["dyg"] = {"Villa Viciosa Agta", 12626611, "phi", Latn}

m["dyi"] = {"Djimini", 35336, "alv-tdj", Latn}

m["dym"] = {"Yanda Dogon", 8048316, "qfa-dgn", Latn}

m["dyn"] = {"Dyangadi", 3913820, "aus-cww", Latn}

m["dyo"] = {"Jola-Fonyi", 3507832, "alv-jol", Latn}

m["dyu"] = {"Dyula", 32706, "dmn-man", Latn}

m["dyy"] = {"Dyaabugay", 2591320, "aus-pmn", Latn}

m["dza"] = {"Tunzu", 3915845, "nic-jer", Latn}

m["dzg"] = {"Dazaga", 35244, "ssa-sah", Latn}

m["dzl"] = {"Dzala", 56607, "sit-ebo", {"Tibt"}}

m["dzn"] = {"Dzando", 5319622, "bnt-bun", Latn}

return m
