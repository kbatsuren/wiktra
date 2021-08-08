local u = mw.ustring.char

-- UTF-8 encoded strings for some commonly-used diacritics
local GRAVE = u(0x0300)
local ACUTE = u(0x0301)
local CIRC = u(0x0302)
local TILDE = u(0x0303)
local MACRON = u(0x0304)
local OVERLINE = u(0x0305)
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

local Cyrl = {"Cyrl"}
local Deva = {"Deva"}
local Latn = {"Latn"}

local m = {}

m["caa"] = {"Ch'orti'", 35177, "myn", Latn}

m["cab"] = {"Garifuna", 35490, "awd-taa", Latn, ancestors = {"awd-taa-pro"}}

m["cac"] = {"Chuj", 35233, "myn", Latn}

m["cad"] = {"Caddo", 56756, "cdd", Latn}

m["cae"] = {"Laalaa", 35564, "alv-cng", Latn}

m["caf"] = {"Southern Carrier", 12953426, "ath-nor", Latn}

m["cag"] = {"Nivaclé", 3182557, "sai-mtc", Latn}

m["cah"] = {"Cahuarano", 2933175, "sai-zap", Latn}

m["caj"] = {"Chané", 56721, "awd", Latn}

m["cak"] = {"Kaqchikel", 35115, "myn", Latn}

m["cal"] = {"Carolinian", 28427, "poz-mic", Latn}

m["cam"] = {"Cemuhî", 3009690, "poz-cln", Latn}

m["can"] = {"Chambri", 5069707, "paa-lsp", Latn}

m["cao"] = {"Chácobo", 2591202, "sai-pan", Latn}

m["cap"] = {"Chipaya", 35235, "sai-ucp", Latn}

m["caq"] = {"Car Nicobarese", 35156, "aav-nic", Latn}

m["car"] = {"Galibi Carib", 56611, "sai-car", Latn}

m["cas"] = {"Tsimané", 35950, "qfa-iso", Latn}

m["cav"] = {"Cavineña", 524102, "sai-tac", Latn}

m["caw"] = {"Callawalla", 266417, "qfa-mix", Latn}

m["cax"] = {"Chiquitano", 1844993, "qfa-iso", Latn}

m["cay"] = {"Cayuga", 32967, "iro", Latn}

m["caz"] = {"Canichana", 2936374, "qfa-iso", Latn}

m["cbb"] = {"Cabiyarí", 3450660, "awd-nwk", Latn}

m["cbc"] = {"Carapana", 924405, "sai-tuc", Latn}

m["cbd"] = {"Carijona", 3446655, "sai-car", Latn}

m["cbg"] = {"Chimila", 2963680, "cba", Latn}

m["cbi"] = {"Chachi", 2591329, "sai-bar", Latn}

m["cbj"] = {"Ede Cabe", 33112829, "alv-ede", Latn}

m["cbk"] = {"Chavacano", 33281, "crp", Latn, ancestors = {"es"}}

m["cbl"] = {"Bualkhaw Chin", 9229830, "tbq-kuk", Latn}

m["cbn"] = {"Nyah Kur", 116849, "mkh-mnc", {"Thai"}, ancestors = {"omx"}, sort_key = {from = {"[%pๆ]", "[็-๎]", "([เแโใไ])([ก-ฮ])"}, to = {"", "", "%2%1"}}}

m["cbo"] = {"Izora", 3915454, "nic-jer", Latn}

m["cbq"] = {"Shuba", nil, "nic-knj", Latn, ancestors = {"lan"}}

m["cbr"] = {"Cashibo-Cacataibo", 5359560, "sai-pan", Latn}

m["cbs"] = {"Cashinahua", 2591230, "sai-pan", Latn}

m["cbt"] = {"Chayahuita", 1526525, "sai-cah", Latn}

m["cbu"] = {"Candoshi-Shapra", 642843, "qfa-iso", Latn}

m["cbv"] = {"Cacua", 3192052, "sai-nad", Latn, ancestors = {"mbr"}}

m["cbw"] = {"Kinabalian", 6410324, "phi", Latn}

m["cby"] = {"Carabayo", 3441762, "sai-tyu", Latn}

m["cca"] = {"Cauca", 5054242, "sai-chc", Latn}

m["ccc"] = {"Chamicuro", 2155119, "awd", Latn}

m["ccd"] = {"Cafundó", 3331506, "roa-ibe", Latn, ancestors = {"pt"}}

m["cce"] = {"Chopi", 3437616, "bnt-bso", Latn}

m["ccg"] = {"Chamba Daka", 33120805, "nic-dak", Latn}

m["cch"] = {"Atsam", 34794, "nic-kne", Latn}

m["ccj"] = {"Kasanga", 35542, "alv-nyn", Latn}

m["ccl"] = {"Cutchi-Swahili", 5196729, "crp", Latn, ancestors = {"sw"}}

m["ccm"] = {"Malaccan Creole Malay", 12636092, "crp", Latn, ancestors = {"ms"}}

m["cco"] = {"Comaltepec Chinantec", 2963735, "omq-chi", Latn}

m["ccp"] = {"Chakma", 32952, "inc-eas", {"Cakm"}, ancestors = {"inc-obn"}}

m["ccr"] = {"Cacaopera", 3438338, "nai-min", Latn}

m["cda"] = {"Choni", 2964447, "sit-tib"}

m["cde"] = {"Chenchu", 32981, "dra", {"Telu"}, ancestors = {"te"}}

m["cdf"] = {"Chiru", 5102016, "tbq-kuk", {"Latn", "Beng"}}

m["cdh"] = {"Chambeali", 12953424, "him", {"Deva", "Takr"}, translit_module = "hi-translit"}

m["cdi"] = {"Chodri", 5103788, "inc-bhi", {"Gujr"}}

m["cdj"] = {"Churahi", 12629039, "him", translit_module = "hi-translit"}

m["cdm"] = {"Chepang", 5091700, "sit-gma", Deva}

m["cdn"] = {"Chaudangsi", 5088056, "sit-alm"}

m["cdo"] = {"Min Dong", 36455, "zhx-min-hai", {"Hani"}}

m["cdr"] = {"Cinda-Regi-Tiyal", 35596, "nic-kmk", Latn}

m["cds"] = {
    "Chadian Sign Language", 10322099, "sgn", Latn -- when documented
}

m["cdy"] = {"Chadong", 926742, "qfa-kms"}

m["cdz"] = {"Koda", 6425038, "mun", {"Beng"}}

m["cea"] = {"Lower Chehalis", 6693377, "sal", Latn}

m["ceb"] = {"Cebuano", 33239, "phi", Latn}

m["ceg"] = {"Chamacoco", 3436637, "sai-zam", Latn}

m["cen"] = {"Cen", 12628777, "nic-plc", Latn, ancestors = {"izr"}}

m["cet"] = {"Centúúm", 33608, "qfa-iso", Latn}

m["cfa"] = {"Dijim-Bwilim", 3438350, "alv-wjk", Latn}

m["cfd"] = {"Cara", 35048, "nic-beo", Latn}

m["cfg"] = {"Como Karim", 35304, "nic-jkn", Latn}

m["cfm"] = {"Falam Chin", 56815, "tbq-kuk", {"Beng", "Latn"}}

m["cga"] = {"Changriwa", 5072105, "paa-yua", Latn}

m["cgc"] = {"Kagayanen", 6346422, "mno", Latn}

m["cgg"] = {"Rukiga", 3270727, "bnt-nyg", Latn}

m["cgk"] = {"Chocangaca", 56604, "sit-tib", {"Tibt"}, ancestors = {"xct"}}

m["chb"] = {"Chibcha", 2356431, "cba"}

m["chc"] = {"Catawba", 5051602, "nai-cat", Latn}

m["chd"] = {"Highland Oaxaca Chontal", 2964457, "nai-tqn", Latn}

m["chf"] = {"Tabasco Chontal", 35175, "myn", Latn}

m["chg"] = {"Chagatai", 36831, "trk-kar", {"Arab"}, translit_module = "ar-translit", entry_name = {from = {u(0x0671), u(0x064B), u(0x064C), u(0x064D), u(0x064E), u(0x064F), u(0x0650), u(0x0651), u(0x0652), u(0x0670), u(0x0640)}, to = {u(0x0627)}}}

m["chh"] = {"Chinook", 6693380, "nai-ckn", Latn}

m["chj"] = {"Ojitlán Chinantec", 5100110, "omq-chi", Latn}

m["chk"] = {"Chuukese", 33161, "poz-mic", Latn}

m["chl"] = {"Cahuilla", 56438, "azc-cup", Latn, entry_name = {from = {"Á", "á", "É", "é", "Í", "í", "Ó", "ó", "Ú", "ú", MACRON}, to = {"A", "a", "E", "e", "I", "i", "O", "o", "U", "u"}}}

m["chm"] = {"Eastern Mari", 973685, "urj", Cyrl, translit_module = "chm-translit", override_translit = true, wikimedia_codes = {"mhr"}, entry_name = {from = {GRAVE, ACUTE}, to = {}}}

m["chn"] = {"Chinook Jargon", 35173, "crp", {"Latn", "Dupl"}, ancestors = {"chh", "nuk"}}

m["cho"] = {"Choctaw", 32979, "nai-mus", Latn}

m["chp"] = {"Chipewyan", 27692, "ath-nor", {"Latn", "Cans"}}

m["chq"] = {"Quiotepec Chinantec", 5758709, "omq-chi", Latn}

m["chr"] = {"Cherokee", 33388, "iro", {"Cher"}, translit_module = "Cher-translit"}

m["cht"] = {"Cholón", 2591243, nil, Latn}

m["chw"] = {"Chuabo", 5118412, "bnt-mak", Latn}

m["chx"] = {"Chantyal", 4926344, "sit-tam", Deva}

m["chy"] = {
    "Cheyenne",
    33265,
    "alg",
    Latn,
    sort_key = {from = {"[àáāȧ]", "[èéēė]", "[òóōȯ]", GRAVE, ACUTE, MACRON, DOTABOVE, "-"}, to = {"a", "e", "o"}},
    standardChars = "0-9'AEHKMNOPSŠTVXaehkmnopsštvxÀÁĀȦÈÉĒĖÒÓŌȮàáāȧèéēėòóōȯ" .. PUNCTUATION -- umlaut and circumflex not allowed
}

m["chz"] = {"Ozumacín Chinantec", 5100111, "omq-chi", Latn}

m["cia"] = {"Cia-Cia", 35284, "poz-mun", {"Hang", "Latn", "Arab"}}

m["cib"] = {"Ci Gbe", 12952445, "alv-gbe", Latn}

m["cic"] = {"Chickasaw", 33192, "nai-mus", Latn}

m["cid"] = {"Chimariko", 1294251, "qfa-iso", Latn}

m["cie"] = {"Cineni", 56243, "cdc-cbm", Latn}

m["cih"] = {"Chinali", 11855245, "inc", Deva, ancestors = {"sa"}}

m["cik"] = {"Chitkuli Kinnauri", 15615982, "sit-kin"}

m["cim"] = {"Cimbrian", 37053, "gmw", Latn, varieties = {"Luserna Cimbrian", "Sette Comuni Cimbrian", "Thirteen Communities Cimbrian"}, ancestors = {"bar"}, entry_name = {from = {"à", "ì", "ù"}, to = {"a", "i", "u"}}, sort_key = {from = {"å", "č", "[èé]", "[òóôö]", "ü"}, to = {"a", "c", "e", "o", "u"}}}

m["cin"] = {"Cinta Larga", 5121095, "tup", Latn}

m["cip"] = {"Chiapanec", 3364475, "omq", Latn}

m["cir"] = {"Tiri", 7862281, "poz-cln", Latn}

m["ciy"] = {"Chaima", 12628867, "sai-car", Latn}

m["cja"] = {
    "Western Cham", 12645578, "cmc", {"Arab"} -- Western Cham script is not yet available.
}

m["cje"] = {"Chru", 2967321, "cmc", Latn}

m["cjh"] = {"Upper Chehalis", 2962074, "sal", Latn}

m["cji"] = {"Chamalal", 56567, "cau-ava", Cyrl}

m["cjk"] = {"Chokwe", 2422065, "bnt-clu", Latn}

m["cjm"] = {"Eastern Cham", 2948019, "cmc", {"Cham", "Latn"}}

m["cjn"] = {"Chenapian", 5091044, "paa-spk", Latn}

m["cjo"] = {"Ashéninka Pajonal", 3450481, "awd", Latn}

m["cjp"] = {"Cabécar", 27878, "cba", Latn}

m["cjs"] = {"Shor", 34139, "trk-sib", Cyrl}

m["cjv"] = {"Chuave", 5115226, "ngf", Latn}

m["cjy"] = {"Jin", 56479, "zhx", {"Hani"}, ancestors = {"ltc"}}

m["ckb"] = {"Central Kurdish", 36811, "ku", {"ku-Arab"}, translit_module = "ckb-translit", entry_name = {from = {u(0x0650), u(0x0652)}, to = {}}, ancestors = {"ku-pro"}}

m["ckh"] = {"Chak", 12628870, "sit-luu", Latn, ancestors = {"kdv"}}

m["ckl"] = {"Cibak", 56279, "cdc-cbm", Latn}

m["ckn"] = {"Kaang Chin", 6343432, "tbq-kuk", Latn}

m["cko"] = {"Anufo", 34845, "alv-ctn", Latn}

m["ckq"] = {"Kajakse", 3440422, "cdc-est", Latn}

m["ckr"] = {"Kairak", 3503002, "paa-bng", Latn}

m["cks"] = {"Tayo", 1133089, "crp", Latn, ancestors = {"fr"}}

m["ckt"] = {"Chukchi", 33170, "qfa-cka", Cyrl}

m["cku"] = {"Koasati", 35162, "nai-mus", Latn}

m["ckv"] = {"Kavalan", 716627, "map", Latn}

m["ckx"] = {"Caka", 5018037, "nic-tvc", Latn}

m["cky"] = {"Cakfem-Mushere", 3441199, "cdc-wst", Latn}

m["ckz"] = {"Cakchiquel-Quiché Mixed Language", 5054550, "myn", Latn}

m["cla"] = {"Ron", 3440432, "cdc-wst", Latn}

m["clc"] = {"Chilcotin", 28535, "ath-nor", Latn}

m["cld"] = {"Chaldean Neo-Aramaic", 33236, "sem-are", {"Syrc"}}

m["cle"] = {"Lealao Chinantec", 6509365, "omq-chi", Latn}

m["clh"] = {"Chilisso", 3250629, "inc-dar"}

m["cli"] = {"Chakali", 35206, "nic-gnw", Latn}

m["clj"] = {"Laitu Chin", 6474196, "tbq-kuk"}

m["clk"] = {"Idu", 56412, "sit-gsi", {"Tibt"}}

m["cll"] = {"Chala", 35190, "nic-gne", Latn}

m["clm"] = {"Klallam", 33404, "sal", Latn}

m["clo"] = {"Lowland Oaxaca Chontal", 2964450, "nai-tqn", Latn}

m["clt"] = {"Lautu Chin", 6502107, "tbq-kuk"}

m["clu"] = {"Caluyanun", 32964, "phi", Latn}

m["clw"] = {"Chulym", 33125, "trk-sib", {"Latn", "Cyrl"}}

m["cly"] = {"Eastern Highland Chatino", 12642078, "omq-cha", Latn}

m["cma"] = {"Maa", 12953680, "mkh-ban", Latn}

m["cme"] = {"Cerma", 35074, "nic-gur", Latn}

m["cmg"] = {"Classical Mongolian", 5128303, "xgn", {"Mong"}, ancestors = {"xng"}, translit_module = "mn-translit"}

m["cmi"] = {"Emberá-Chamí", 3052042, "sai-chc", Latn}

m["cml"] = {"Campalagian", 5027893, "poz-ssw", Latn}

m["cmm"] = {"Michigamea", 12636809, "sio-msv", Latn}

m["cmn"] = {"Mandarin", 9192, "zhx", {"Hani", "Latn"}, ancestors = {"ltc"}, wikimedia_codes = {"zh"}}

m["cmo"] = {"Central Mnong", 33369881, "mkh-ban"}

m["cmr"] = {"Mro Chin", 16889978, "tbq-kuk"}

m["cms"] = {
    "Messapic", 36383, "ine", Latn -- when documented here; otherwise written in a native script
}

m["cmt"] = {"Camtho", 10441336, "crp", Latn, ancestors = {"fly", "zu"}}

m["cna"] = {"Changthang", 12952322, "sit-lab", {"Tibt"}}

m["cnb"] = {"Chinbon Chin", 12952327, "tbq-kuk"}

m["cnc"] = {"Côông", 5202780, "tbq-lol"}

m["cng"] = {"Northern Qiang", 56559, "sit-qia"}

m["cnh"] = {"Lai", 3250286, "tbq-kuk"}

m["cni"] = {"Asháninka", 3437230, "awd", Latn}

m["cnk"] = {"Khumi Chin", 56308, "tbq-kuk"}

m["cnl"] = {"Lalana Chinantec", 12953437, "omq-chi", Latn}

m["cno"] = {"Con", 3440883, "mkh-pal"}

m["cns"] = {"Central Asmat", 11732048, "ngf", Latn}

m["cnt"] = {"Tepetotutla Chinantec", 5100113, "omq-chi", Latn}

m["cnu"] = {"Chenoua", 33276, "ber"}

m["cnw"] = {"Ngawn Chin", 6583675, "tbq-kuk"}

m["cnx"] = {"Middle Cornish", 12642603, "cel-bry", Latn, ancestors = {"oco"}}

m["coa"] = {"Cocos Islands Malay", 3441699, "crp", Latn, ancestors = {"ms"}}

m["cob"] = {"Chicomuceltec", 3307204, "myn", Latn}

m["coc"] = {"Cocopa", 33044, "nai-yuc", Latn}

m["cod"] = {"Cocama", 33317, "tup", Latn}

m["coe"] = {"Koreguaje", 3198924, "sai-tuc", Latn}

m["cof"] = {"Tsafiki", 2567055, "sai-bar", Latn}

m["cog"] = {"Chong", 3914630, "mkh-pea", {"Thai", "Khmr"}, sort_key = {from = {"[%pๆ]", "[็-๎]", "([เแโใไ])([ก-ฮ])"}, to = {"", "", "%2%1"}}}

m["coh"] = {"Chichonyi-Chidzihana-Chikauma", 12629011, "bnt-mij", Latn}

m["coj"] = {"Cochimi", 3915551, "nai-yuc", Latn}

m["cok"] = {"Santa Teresa Cora", 12641754, "azc", Latn}

m["col"] = {"Columbia-Wenatchi", 3324744, "sal", Latn}

m["com"] = {"Comanche", 32972, "azc-num", Latn}

m["con"] = {"Cofán", 2669254, "qfa-iso", Latn}

m["coo"] = {"Comox", 13583746, "sal", Latn}

m["cop"] = {
    "Coptic",
    36155,
    "egx",
    -- Don't include varieties in [[Module:etymology languages/data]]
    {"Copt"},
    translit_module = "Copt-translit",
    ancestors = {"egx-dem"},
    entry_name = {from = {"ˋ", GRAVE, MACRON, DIAER, OVERLINE}, to = {}},
    sort_key = "cop-sortkey"
}

m["coq"] = {"Coquille", 12953452, "ath-pco", Latn}

m["cot"] = {"Caquinte", 3915557, "awd", Latn}

m["cou"] = {"Wamey", 36935, "alv-ten", Latn}

m["cov"] = {"Cao Miao", 2936935, "qfa-tak"}

m["cow"] = {"Cowlitz", 3001877, "sal", Latn}

m["cox"] = {"Nanti", 15342275, "awd", Latn}

m["coy"] = {"Coyaima", 56450, "sai-car", Latn}

m["coz"] = {"Chochotec", 2964262, "omq-pop", Latn}

m["cpa"] = {"Palantla Chinantec", 5100112, "omq-chi", Latn}

m["cpb"] = {"Ucayali-Yurúa Ashéninka", 3501858, "awd", Latn}

m["cpc"] = {"Ajyíninka Apurucayali", 3327405, "awd", Latn}

m["cpg"] = {
    "Cappadocian Greek",
    853414,
    "grk",
    {"polytonic", "fa-Arab"},
    ancestors = {"grc"},
    translit_module = "grc-translit",
    sort_key = { -- Keep this synchronized with el, grc, pnt
        from = {"[ᾳάᾴὰᾲᾶᾷἀᾀἄᾄἂᾂἆᾆἁᾁἅᾅἃᾃἇᾇ]", "[έὲἐἔἒἑἕἓ]", "[ῃήῄὴῂῆῇἠᾐἤᾔἢᾒἦᾖἡᾑἥᾕἣᾓἧᾗ]", "[ίὶῖἰἴἲἶἱἵἳἷϊΐῒῗ]", "[όὸὀὄὂὁὅὃ]", "[ύὺῦὐὔὒὖὑὕὓὗϋΰῢῧ]", "[ῳώῴὼῲῶῷὠᾠὤᾤὢᾢὦᾦὡᾡὥᾥὣᾣὧᾧ]", "ῥ", "ς"},
        to = {"α", "ε", "η", "ι", "ο", "υ", "ω", "ρ", "σ"}
    }
}

m["cpi"] = {"Chinese Pidgin English", 3435078, "crp", Latn, ancestors = {"en"}}

m["cpn"] = {"Cherepon", 35181, "alv-gng", Latn}

m["cpo"] = {"Kpee", 6435722, "dmn-jje"}

m["cps"] = {"Capiznon", 2937525, "phi", Latn}

m["cpu"] = {"Pichis Ashéninka", 7190661, "awd", Latn}

m["cpx"] = {"Puxian", 56583, "zhx-min-hai", {"Hani"}}

m["cpy"] = {"South Ucayali Ashéninka", 3501868, "awd", Latn}

m["cqd"] = {"Chuanqiandian Cluster Miao", 3307894, "hmn", {"Latn", "Plrd"}}

m["cra"] = {"Chara", 5073694, "omv", Latn}

m["crb"] = {"Island Carib", 3450735, "awd-taa", Latn, ancestors = {"awd-taa-pro"}}

m["crc"] = {"Lonwolwol", 3259216, "poz-oce", Latn}

m["crd"] = {"Coeur d'Alene", 32915, "sal", Latn}

m["crf"] = {"Caramanta", 3504195, "sai-chc", Latn}

m["crg"] = {"Michif", 13315, "qfa-mix", Latn, ancestors = {"cr", "fr"}}

m["crh"] = {"Crimean Tatar", 33357, "trk-kcu", {"Latn", "Cyrl"}}

m["cri"] = {"Sãotomense", 36536, "crp", Latn, ancestors = {"pt"}}

m["crj"] = {"Southern East Cree", 12953464, "alg", {"Cans"}, ancestors = {"cr"}, translit_module = "cr-translit"}

m["crk"] = {"Plains Cree", 56699, "alg", {"Cans", "Latn"}, ancestors = {"cr"}}

m["crl"] = {"Northern East Cree", 12642195, "alg", {"Cans"}, ancestors = {"cr"}, translit_module = "cr-translit"}

m["crm"] = {"Moose Cree", 3446671, "alg", {"Cans"}, ancestors = {"cr"}}

m["crn"] = {"Cora", 12953454, "azc", Latn}

m["cro"] = {"Crow", 1207611, "sio-mor", Latn}

m["crq"] = {"Iyo'wujwa Chorote", 3540927, "sai-mtc", Latn}

m["crr"] = {"Carolina Algonquian", 16113723, "alg-eas", Latn}

m["crs"] = {"Seychellois Creole", 34015, "crp", Latn, ancestors = {"fr"}}

m["crt"] = {"Iyojwa'ja Chorote", 3504118, "sai-mtc", Latn}

m["crv"] = {"Chaura", 2605680, "aav-nic"}

m["crw"] = {"Chrau", 5105629, "mkh-ban", Latn}

m["crx"] = {"Carrier", 12953431, "ath-nor", {"Latn", "Cans"}}

m["cry"] = {"Cori", 35204, "nic-plc", Latn}

m["crz"] = {"Cruzeño", 2967636, "nai-chu", Latn}

m["csa"] = {"Chiltepec Chinantec", 12953435, "omq-chi", Latn}

m["csb"] = {"Kashubian", 33690, "zlw-lch", Latn, ancestors = {"zlw-pom"}}

m["csc"] = {
    "Catalan Sign Language", 35768, "sgn", Latn -- when documented
}

m["csd"] = {"Chiangmai Sign Language", 5095211, "sgn"}

m["cse"] = {
    "Czech Sign Language", 5201809, "sgn", Latn -- when documented
}

m["csf"] = {
    "Cuban Sign Language", 5192046, "sgn", Latn -- when documented
}

m["csg"] = {
    "Chilean Sign Language", 3322112, "sgn", Latn -- when documented
}

m["csh"] = {"Asho Chin", 12627282, "tbq-kuk"}

m["csi"] = {"Coast Miwok", 2981109, "nai-you", Latn}

m["csj"] = {"Songlai Chin", 7561280, "tbq-kuk"}

m["csk"] = {"Jola-Kasa", 3446622, "alv-jol", Latn}

m["csl"] = {"Chinese Sign Language", 1094190, "sgn"}

m["csm"] = {"Central Sierra Miwok", 2944443, "nai-you", Latn}

m["csn"] = {
    "Colombian Sign Language", 2748229, "sgn", Latn -- when documented
}

m["cso"] = {"Sochiapam Chinantec", 7550388, "omq-chi", Latn}

m["csq"] = {"Croatian Sign Language", 3507506, "sgn"}

m["csr"] = {
    "Costa Rican Sign Language", 5174901, "sgn", Latn -- when documented
}

m["css"] = {"Southern Ohlone", 25559664, "nai-you", Latn}

m["cst"] = {"Northern Ohlone", 25559666, "nai-you", Latn}

m["csv"] = {"Sumtu Chin", 7638087, "tbq-kuk"}

m["csw"] = {"Swampy Cree", 56696, "alg", {"Latn", "Cans"}, ancestors = {"cr"}}

m["csy"] = {"Siyin Chin", 7533375, "tbq-kuk"}

m["csz"] = {"Coos", 3126783, "nai-coo", Latn}

m["cta"] = {"Tataltepec Chatino", 7687853, "omq-cha", Latn}

m["ctc"] = {"Chetco-Tolowa", 12628946, "ath-pco", Latn}

m["ctd"] = {"Tedim Chin", 56357, "tbq-kuk", {"Latn", "Pauc"}}

m["cte"] = {"Tepinapa Chinantec", 12953443, "omq-chi", Latn}

m["ctg"] = {"Chittagonian", 33173, "inc-eas", {"Beng"}, ancestors = {"inc-obn"}}

m["cth"] = {"Thaiphum Chin", 16912048, "tbq-kuk"}

m["ctl"] = {"Tlacoatzintepec Chinantec", 12643657, "omq-chi", Latn}

m["ctm"] = {"Chitimacha", 1294227, "qfa-iso", Latn}

m["ctn"] = {"Chhintange", 32994, "sit-kie", Deva}

m["cto"] = {"Emberá-Catío", 3052039, "sai-chc", Latn}

m["ctp"] = {"Western Highland Chatino", 32861734, "omq-cha", Latn, sort_key = {from = {"á", "é", "í", "ó", "ú"}, to = {"a", "e", "i", "o", "u"}}, entry_name = {from = {"[¹²³⁴⁵]"}, to = {}}}

m["cts"] = {"Northern Catanduanes Bicolano", 7130477, "phi", Latn}

m["ctt"] = {"Wayanad Chetti", 7975850, "dra", {"Taml"}}

m["ctu"] = {"Chol", 35179, "myn", Latn}

m["ctz"] = {"Zacatepec Chatino", 8063754, "omq-cha", Latn}

m["cua"] = {"Cua", 3441115, "mkh-ban", Latn}

m["cub"] = {"Cubeo", 3006705, "sai-tuc", Latn}

m["cuc"] = {"Usila Chinantec", 7901979, "omq-chi", Latn}

m["cug"] = {"Cung", 35194, "nic-bbe", Latn}

m["cuh"] = {"Chuka", 12952344, "bnt-kka", Latn}

m["cui"] = {"Cuiba", 2980421, "sai-guh", Latn}

m["cuj"] = {"Mashco Piro", 3446596, "awd", Latn}

m["cuk"] = {"Kuna", 12953659, "cba", Latn}

m["cul"] = {"Culina", 2475442, "auf", Latn}

m["cuo"] = {"Cumanagoto", 5193784, "sai-cpc", Latn}

m["cup"] = {"Cupeño", 143130, "azc-cup", Latn}

m["cuq"] = {"Cun", 2475478, "qfa-lic", Latn}

m["cur"] = {"Chhulung", 5116126, "sit-kie", Deva}

m["cut"] = {"Teutila Cuicatec", 12953453, "omq-cui", Latn}

m["cuu"] = {"Tai Ya", 3441122, "qfa-tak", Latn}

m["cuv"] = {"Cuvok", 3515056, "cdc-cbm", Latn}

m["cuw"] = {"Chukwa", 12629033, "sit-kic"}

m["cux"] = {"Tepeuxila Cuicatec", 20527242, "omq-cui", Latn}

m["cuy"] = {"Cuitlatec", 2030998, "qfa-iso", Latn}

m["cvg"] = {"Chug", 47683644, "sit-khb"}

m["cvn"] = {"Valle Nacional Chinantec", 12953442, "omq-chi", Latn}

m["cwa"] = {"Kabwa", 6344537, "bnt-lok", Latn}

m["cwb"] = {"Maindo", 11002891, "bnt-mak", Latn, ancestors = {"chw"}}

m["cwd"] = {"Woods Cree", 56305, "alg", {"Latn", "Cans"}, ancestors = {"cr"}}

m["cwe"] = {"Kwere", 779632, "bnt-ruv", Latn}

m["cwg"] = {"Chewong", 646718, "mkh-asl", Latn}

m["cwt"] = {"Kuwaataay", 35699, "alv-jol", Latn}

m["cya"] = {"Nopala Chatino", 15616302, "omq-cha", Latn}

m["cyb"] = {"Cayubaba", 3183382, "qfa-iso", Latn}

m["cyo"] = {"Cuyunon", 33153, "phi", Latn}

m["czh"] = {
    "Huizhou",
    56546,
    "zhx",
    {"Hani"}, -- ?
    ancestors = {"ltc"}
}

m["czk"] = {"Knaanic", 56384, "zlw", {"Hebr"}, ancestors = {"zlw-ocs"}}

m["czn"] = {"Zenzontepec Chatino", 603106, "omq-cha", Latn}

m["czo"] = {"Min Zhong", 56435, "zhx-min-shn", {"Hani"}}

m["czt"] = {"Zotung Chin", 8074599, "tbq-kuk", Latn}

return m
