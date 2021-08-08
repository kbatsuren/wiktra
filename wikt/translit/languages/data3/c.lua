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

m["caa"] = {"Ch'orti'", 35177, "myn", scripts = Latn}

m["cab"] = {"Garifuna", 35490, "awd-taa", ancestors = {"awd-taa-pro"}, scripts = Latn}

m["cac"] = {"Chuj", 35233, "myn", scripts = Latn}

m["cad"] = {"Caddo", 56756, "cdd", scripts = Latn}

m["cae"] = {"Laalaa", 35564, "alv-cng", scripts = Latn}

m["caf"] = {"Southern Carrier", 12953426, "ath-nor", scripts = Latn}

m["cag"] = {"Nivaclé", 3182557, "sai-mtc", scripts = Latn}

m["cah"] = {"Cahuarano", 2933175, "sai-zap", scripts = Latn}

m["caj"] = {"Chané", 56721, "awd", scripts = Latn}

m["cak"] = {"Kaqchikel", 35115, "myn", scripts = Latn}

m["cal"] = {"Carolinian", 28427, "poz-mic", scripts = Latn}

m["cam"] = {"Cemuhî", 3009690, "poz-cln", scripts = Latn}

m["can"] = {"Chambri", 5069707, "paa-lsp", scripts = Latn}

m["cao"] = {"Chácobo", 2591202, "sai-pan", scripts = Latn}

m["cap"] = {"Chipaya", 35235, "sai-ucp", scripts = Latn}

m["caq"] = {"Car Nicobarese", 35156, "aav-nic", scripts = Latn}

m["car"] = {"Galibi Carib", 56611, "sai-car", scripts = Latn}

m["cas"] = {"Tsimané", 35950, "qfa-iso", scripts = Latn}

m["cav"] = {"Cavineña", 524102, "sai-tac", scripts = Latn}

m["caw"] = {"Callawalla", 266417, "qfa-mix", scripts = Latn}

m["cax"] = {"Chiquitano", 1844993, "qfa-iso", scripts = Latn}

m["cay"] = {"Cayuga", 32967, "iro", scripts = Latn}

m["caz"] = {"Canichana", 2936374, "qfa-iso", scripts = Latn}

m["cbb"] = {"Cabiyarí", 3450660, "awd-nwk", scripts = Latn}

m["cbc"] = {"Carapana", 924405, "sai-tuc", scripts = Latn}

m["cbd"] = {"Carijona", 3446655, "sai-car", scripts = Latn}

m["cbg"] = {"Chimila", 2963680, "cba", scripts = Latn}

m["cbi"] = {"Chachi", 2591329, "sai-bar", scripts = Latn}

m["cbj"] = {"Ede Cabe", 33112829, "alv-ede", scripts = Latn}

m["cbk"] = {"Chavacano", 33281, "crp", ancestors = {"es"}, scripts = Latn}

m["cbl"] = {"Bualkhaw Chin", 9229830, "tbq-kuk", scripts = Latn}

m["cbn"] = {"Nyah Kur", 116849, "mkh-mnc", scripts = {"Thai"}, ancestors = {"omx"}, sort_key = {from = {"[%pๆ]", "[็-๎]", "([เแโใไ])([ก-ฮ])"}, to = {"", "", "%2%1"}}}

m["cbo"] = {"Izora", 3915454, "nic-jer", scripts = Latn}

m["cbq"] = {"Shuba", nil, "nic-knj", ancestors = {"lan"}, scripts = Latn}

m["cbr"] = {"Cashibo-Cacataibo", 5359560, "sai-pan", scripts = Latn}

m["cbs"] = {"Cashinahua", 2591230, "sai-pan", scripts = Latn}

m["cbt"] = {"Chayahuita", 1526525, "sai-cah", scripts = Latn}

m["cbu"] = {"Candoshi-Shapra", 642843, "qfa-iso", scripts = Latn}

m["cbv"] = {"Cacua", 3192052, "sai-nad", ancestors = {"mbr"}, scripts = Latn}

m["cbw"] = {"Kinabalian", 6410324, "phi", scripts = Latn}

m["cby"] = {"Carabayo", 3441762, "sai-tyu", scripts = Latn}

m["cca"] = {"Cauca", 5054242, "sai-chc", scripts = Latn}

m["ccc"] = {"Chamicuro", 2155119, "awd", scripts = Latn}

m["ccd"] = {"Cafundó", 3331506, "roa-ibe", scripts = Latn, ancestors = {"pt"}}

m["cce"] = {"Chopi", 3437616, "bnt-bso", scripts = Latn}

m["ccg"] = {"Chamba Daka", 33120805, "nic-dak", scripts = Latn}

m["cch"] = {"Atsam", 34794, "nic-kne", scripts = Latn}

m["ccj"] = {"Kasanga", 35542, "alv-nyn", scripts = Latn}

m["ccl"] = {"Cutchi-Swahili", 5196729, "crp", scripts = Latn, ancestors = {"sw"}}

m["ccm"] = {"Malaccan Creole Malay", 12636092, "crp", scripts = Latn, ancestors = {"ms"}}

m["cco"] = {"Comaltepec Chinantec", 2963735, "omq-chi", scripts = Latn}

m["ccp"] = {"Chakma", 32952, "inc-eas", scripts = {"Cakm"}, ancestors = {"inc-obn"}}

m["ccr"] = {"Cacaopera", 3438338, "nai-min", scripts = Latn}

m["cda"] = {"Choni", 2964447, "sit-tib"}

m["cde"] = {"Chenchu", 32981, "dra", scripts = {"Telu"}, ancestors = {"te"}}

m["cdf"] = {"Chiru", 5102016, "tbq-kuk", scripts = {"Latn", "Beng"}}

m["cdh"] = {"Chambeali", 12953424, "him", scripts = {"Deva", "Takr"}, translit_module = "hi-translit"}

m["cdi"] = {"Chodri", 5103788, "inc-bhi", scripts = {"Gujr"}}

m["cdj"] = {"Churahi", 12629039, "him", translit_module = "hi-translit"}

m["cdm"] = {"Chepang", 5091700, "sit-gma", scripts = Deva}

m["cdn"] = {"Chaudangsi", 5088056, "sit-alm"}

m["cdo"] = {"Min Dong", 36455, "zhx-min-hai", scripts = {"Hani"}}

m["cdr"] = {"Cinda-Regi-Tiyal", 35596, "nic-kmk", scripts = Latn}

m["cds"] = {
    "Chadian Sign Language",
    10322099,
    "sgn",
    scripts = Latn -- when documented
}

m["cdy"] = {"Chadong", 926742, "qfa-kms"}

m["cdz"] = {"Koda", 6425038, "mun", scripts = {"Beng"}}

m["cea"] = {"Lower Chehalis", 6693377, "sal", scripts = Latn}

m["ceb"] = {"Cebuano", 33239, "phi", scripts = Latn}

m["ceg"] = {"Chamacoco", 3436637, "sai-zam", scripts = Latn}

m["cen"] = {"Cen", 12628777, "nic-plc", ancestors = {"izr"}, scripts = Latn}

m["cet"] = {"Centúúm", 33608, "qfa-iso", scripts = Latn}

m["cfa"] = {"Dijim-Bwilim", 3438350, "alv-wjk", scripts = Latn}

m["cfd"] = {"Cara", 35048, "nic-beo", scripts = Latn}

m["cfg"] = {"Como Karim", 35304, "nic-jkn", scripts = Latn}

m["cfm"] = {"Falam Chin", 56815, "tbq-kuk", scripts = {"Beng", "Latn"}}

m["cga"] = {"Changriwa", 5072105, "paa-yua", scripts = Latn}

m["cgc"] = {"Kagayanen", 6346422, "mno", scripts = Latn}

m["cgg"] = {"Rukiga", 3270727, "bnt-nyg", scripts = Latn}

m["cgk"] = {"Chocangaca", 56604, "sit-tib", scripts = {"Tibt"}, ancestors = {"xct"}}

m["chb"] = {"Chibcha", 2356431, "cba"}

m["chc"] = {"Catawba", 5051602, "nai-cat", scripts = Latn}

m["chd"] = {"Highland Oaxaca Chontal", 2964457, "nai-tqn", scripts = Latn}

m["chf"] = {"Tabasco Chontal", 35175, "myn", scripts = Latn}

m["chg"] = {"Chagatai", 36831, "trk-kar", scripts = {"Arab"}, translit_module = "ar-translit", entry_name = {from = {u(0x0671), u(0x064B), u(0x064C), u(0x064D), u(0x064E), u(0x064F), u(0x0650), u(0x0651), u(0x0652), u(0x0670), u(0x0640)}, to = {u(0x0627)}}}

m["chh"] = {"Chinook", 6693380, "nai-ckn", scripts = Latn}

m["chj"] = {"Ojitlán Chinantec", 5100110, "omq-chi", scripts = Latn}

m["chk"] = {"Chuukese", 33161, "poz-mic", scripts = Latn}

m["chl"] = {"Cahuilla", 56438, "azc-cup", scripts = Latn, entry_name = {from = {"Á", "á", "É", "é", "Í", "í", "Ó", "ó", "Ú", "ú", MACRON}, to = {"A", "a", "E", "e", "I", "i", "O", "o", "U", "u"}}}

m["chm"] = {"Eastern Mari", 973685, "urj", scripts = Cyrl, translit_module = "chm-translit", override_translit = true, wikimedia_codes = {"mhr"}, entry_name = {from = {GRAVE, ACUTE}, to = {}}}

m["chn"] = {"Chinook Jargon", 35173, "crp", scripts = {"Latn", "Dupl"}, ancestors = {"chh", "nuk"}}

m["cho"] = {"Choctaw", 32979, "nai-mus", scripts = Latn}

m["chp"] = {"Chipewyan", 27692, "ath-nor", scripts = {"Latn", "Cans"}}

m["chq"] = {"Quiotepec Chinantec", 5758709, "omq-chi", scripts = Latn}

m["chr"] = {"Cherokee", 33388, "iro", scripts = {"Cher"}, translit_module = "Cher-translit"}

m["cht"] = {"Cholón", 2591243, scripts = Latn}

m["chw"] = {"Chuabo", 5118412, "bnt-mak", scripts = Latn}

m["chx"] = {"Chantyal", 4926344, "sit-tam", scripts = Deva}

m["chy"] = {
    "Cheyenne",
    33265,
    "alg",
    scripts = Latn,
    sort_key = {from = {"[àáāȧ]", "[èéēė]", "[òóōȯ]", GRAVE, ACUTE, MACRON, DOTABOVE, "-"}, to = {"a", "e", "o"}},
    standardChars = "0-9'AEHKMNOPSŠTVXaehkmnopsštvxÀÁĀȦÈÉĒĖÒÓŌȮàáāȧèéēėòóōȯ" .. PUNCTUATION -- umlaut and circumflex not allowed
}

m["chz"] = {"Ozumacín Chinantec", 5100111, "omq-chi", scripts = Latn}

m["cia"] = {"Cia-Cia", 35284, "poz-mun", scripts = {"Hang", "Latn", "Arab"}}

m["cib"] = {"Ci Gbe", 12952445, "alv-gbe", scripts = Latn}

m["cic"] = {"Chickasaw", 33192, "nai-mus", scripts = Latn}

m["cid"] = {"Chimariko", 1294251, "qfa-iso", scripts = Latn}

m["cie"] = {"Cineni", 56243, "cdc-cbm", scripts = Latn}

m["cih"] = {"Chinali", 11855245, "inc", scripts = Deva, ancestors = {"sa"}}

m["cik"] = {"Chitkuli Kinnauri", 15615982, "sit-kin"}

m["cim"] = {"Cimbrian", 37053, "gmw", varieties = {"Luserna Cimbrian", "Sette Comuni Cimbrian", "Thirteen Communities Cimbrian"}, scripts = Latn, ancestors = {"bar"}, entry_name = {from = {"à", "ì", "ù"}, to = {"a", "i", "u"}}, sort_key = {from = {"å", "č", "[èé]", "[òóôö]", "ü"}, to = {"a", "c", "e", "o", "u"}}}

m["cin"] = {"Cinta Larga", 5121095, "tup", scripts = Latn}

m["cip"] = {"Chiapanec", 3364475, "omq", scripts = Latn}

m["cir"] = {"Tiri", 7862281, "poz-cln", scripts = Latn}

m["ciy"] = {"Chaima", 12628867, "sai-car", scripts = Latn}

m["cja"] = {
    "Western Cham",
    12645578,
    "cmc",
    scripts = {"Arab"} -- Western Cham script is not yet available.
}

m["cje"] = {"Chru", 2967321, "cmc", scripts = Latn}

m["cjh"] = {"Upper Chehalis", 2962074, "sal", scripts = Latn}

m["cji"] = {"Chamalal", 56567, "cau-ava", scripts = Cyrl}

m["cjk"] = {"Chokwe", 2422065, "bnt-clu", scripts = Latn}

m["cjm"] = {"Eastern Cham", 2948019, "cmc", scripts = {"Cham", "Latn"}}

m["cjn"] = {"Chenapian", 5091044, "paa-spk", scripts = Latn}

m["cjo"] = {"Ashéninka Pajonal", 3450481, "awd", scripts = Latn}

m["cjp"] = {"Cabécar", 27878, "cba", scripts = Latn}

m["cjs"] = {"Shor", 34139, "trk-sib", scripts = Cyrl}

m["cjv"] = {"Chuave", 5115226, "ngf", scripts = Latn}

m["cjy"] = {"Jin", 56479, "zhx", scripts = {"Hani"}, ancestors = {"ltc"}}

m["ckb"] = {"Central Kurdish", 36811, "ku", scripts = {"ku-Arab"}, translit_module = "ckb-translit", entry_name = {from = {u(0x0650), u(0x0652)}, to = {}}, ancestors = {"ku-pro"}}

m["ckh"] = {"Chak", 12628870, "sit-luu", scripts = Latn, ancestors = {"kdv"}}

m["ckl"] = {"Cibak", 56279, "cdc-cbm", scripts = Latn}

m["ckn"] = {"Kaang Chin", 6343432, "tbq-kuk", scripts = Latn}

m["cko"] = {"Anufo", 34845, "alv-ctn", scripts = Latn}

m["ckq"] = {"Kajakse", 3440422, "cdc-est", scripts = Latn}

m["ckr"] = {"Kairak", 3503002, "paa-bng", scripts = Latn}

m["cks"] = {"Tayo", 1133089, "crp", ancestors = {"fr"}, scripts = Latn}

m["ckt"] = {"Chukchi", 33170, "qfa-cka", scripts = Cyrl}

m["cku"] = {"Koasati", 35162, "nai-mus", scripts = Latn}

m["ckv"] = {"Kavalan", 716627, "map", scripts = Latn}

m["ckx"] = {"Caka", 5018037, "nic-tvc", scripts = Latn}

m["cky"] = {"Cakfem-Mushere", 3441199, "cdc-wst", scripts = Latn}

m["ckz"] = {"Cakchiquel-Quiché Mixed Language", 5054550, "myn", scripts = Latn}

m["cla"] = {"Ron", 3440432, "cdc-wst", scripts = Latn}

m["clc"] = {"Chilcotin", 28535, "ath-nor", scripts = Latn}

m["cld"] = {"Chaldean Neo-Aramaic", 33236, "sem-are", scripts = {"Syrc"}}

m["cle"] = {"Lealao Chinantec", 6509365, "omq-chi", scripts = Latn}

m["clh"] = {"Chilisso", 3250629, "inc-dar"}

m["cli"] = {"Chakali", 35206, "nic-gnw", scripts = Latn}

m["clj"] = {"Laitu Chin", 6474196, "tbq-kuk"}

m["clk"] = {"Idu", 56412, "sit-gsi", scripts = {"Tibt"}}

m["cll"] = {"Chala", 35190, "nic-gne", scripts = Latn}

m["clm"] = {"Klallam", 33404, "sal", scripts = Latn}

m["clo"] = {"Lowland Oaxaca Chontal", 2964450, "nai-tqn", scripts = Latn}

m["clt"] = {"Lautu Chin", 6502107, "tbq-kuk"}

m["clu"] = {"Caluyanun", 32964, "phi", scripts = Latn}

m["clw"] = {"Chulym", 33125, "trk-sib", scripts = {"Latn", "Cyrl"}}

m["cly"] = {"Eastern Highland Chatino", 12642078, "omq-cha", scripts = Latn}

m["cma"] = {"Maa", 12953680, "mkh-ban", scripts = Latn}

m["cme"] = {"Cerma", 35074, "nic-gur", scripts = Latn}

m["cmg"] = {"Classical Mongolian", 5128303, "xgn", scripts = {"Mong"}, ancestors = {"xng"}, translit_module = "mn-translit"}

m["cmi"] = {"Emberá-Chamí", 3052042, "sai-chc", scripts = Latn}

m["cml"] = {"Campalagian", 5027893, "poz-ssw", scripts = Latn}

m["cmm"] = {"Michigamea", 12636809, "sio-msv", scripts = Latn}

m["cmn"] = {"Mandarin", 9192, "zhx", scripts = {"Hani", "Latn"}, ancestors = {"ltc"}, wikimedia_codes = {"zh"}}

m["cmo"] = {"Central Mnong", 33369881, "mkh-ban"}

m["cmr"] = {"Mro Chin", 16889978, "tbq-kuk"}

m["cms"] = {
    "Messapic",
    36383,
    "ine",
    scripts = Latn -- when documented here; otherwise written in a native script
}

m["cmt"] = {"Camtho", 10441336, "crp", scripts = Latn, ancestors = {"fly", "zu"}}

m["cna"] = {"Changthang", 12952322, "sit-lab", scripts = {"Tibt"}}

m["cnb"] = {"Chinbon Chin", 12952327, "tbq-kuk"}

m["cnc"] = {"Côông", 5202780, "tbq-lol"}

m["cng"] = {"Northern Qiang", 56559, "sit-qia"}

m["cnh"] = {"Lai", 3250286, "tbq-kuk"}

m["cni"] = {"Asháninka", 3437230, "awd", scripts = Latn}

m["cnk"] = {"Khumi Chin", 56308, "tbq-kuk"}

m["cnl"] = {"Lalana Chinantec", 12953437, "omq-chi", scripts = Latn}

m["cno"] = {"Con", 3440883, "mkh-pal"}

m["cns"] = {"Central Asmat", 11732048, "ngf", scripts = Latn}

m["cnt"] = {"Tepetotutla Chinantec", 5100113, "omq-chi", scripts = Latn}

m["cnu"] = {"Chenoua", 33276, "ber"}

m["cnw"] = {"Ngawn Chin", 6583675, "tbq-kuk"}

m["cnx"] = {"Middle Cornish", 12642603, "cel-bry", scripts = Latn, ancestors = {"oco"}}

m["coa"] = {"Cocos Islands Malay", 3441699, "crp", scripts = Latn, ancestors = {"ms"}}

m["cob"] = {"Chicomuceltec", 3307204, "myn", scripts = Latn}

m["coc"] = {"Cocopa", 33044, "nai-yuc", scripts = Latn}

m["cod"] = {"Cocama", 33317, "tup", scripts = Latn}

m["coe"] = {"Koreguaje", 3198924, "sai-tuc", scripts = Latn}

m["cof"] = {"Tsafiki", 2567055, "sai-bar", scripts = Latn}

m["cog"] = {"Chong", 3914630, "mkh-pea", scripts = {"Thai", "Khmr"}, sort_key = {from = {"[%pๆ]", "[็-๎]", "([เแโใไ])([ก-ฮ])"}, to = {"", "", "%2%1"}}}

m["coh"] = {"Chichonyi-Chidzihana-Chikauma", 12629011, "bnt-mij", scripts = Latn}

m["coj"] = {"Cochimi", 3915551, "nai-yuc", scripts = Latn}

m["cok"] = {"Santa Teresa Cora", 12641754, "azc", scripts = Latn}

m["col"] = {"Columbia-Wenatchi", 3324744, "sal", scripts = Latn}

m["com"] = {"Comanche", 32972, "azc-num", scripts = Latn}

m["con"] = {"Cofán", 2669254, "qfa-iso", scripts = Latn}

m["coo"] = {"Comox", 13583746, "sal", scripts = Latn}

m["cop"] = {
    "Coptic",
    36155,
    "egx",
    -- Don't include varieties in [[Module:etymology languages/data]]
    scripts = {"Copt"},
    translit_module = "Copt-translit",
    ancestors = {"egx-dem"},
    entry_name = {from = {"ˋ", GRAVE, MACRON, DIAER, OVERLINE}, to = {}},
    sort_key = "cop-sortkey"
}

m["coq"] = {"Coquille", 12953452, "ath-pco", scripts = Latn}

m["cot"] = {"Caquinte", 3915557, "awd", scripts = Latn}

m["cou"] = {"Wamey", 36935, "alv-ten", scripts = Latn}

m["cov"] = {"Cao Miao", 2936935, "qfa-tak"}

m["cow"] = {"Cowlitz", 3001877, "sal", scripts = Latn}

m["cox"] = {"Nanti", 15342275, "awd", scripts = Latn}

m["coy"] = {"Coyaima", 56450, "sai-car", scripts = Latn}

m["coz"] = {"Chochotec", 2964262, "omq-pop", scripts = Latn}

m["cpa"] = {"Palantla Chinantec", 5100112, "omq-chi", scripts = Latn}

m["cpb"] = {"Ucayali-Yurúa Ashéninka", 3501858, "awd", scripts = Latn}

m["cpc"] = {"Ajyíninka Apurucayali", 3327405, "awd", scripts = Latn}

m["cpg"] = {
    "Cappadocian Greek",
    853414,
    "grk",
    scripts = {"polytonic", "fa-Arab"},
    ancestors = {"grc"},
    translit_module = "grc-translit",
    sort_key = { -- Keep this synchronized with el, grc, pnt
        from = {"[ᾳάᾴὰᾲᾶᾷἀᾀἄᾄἂᾂἆᾆἁᾁἅᾅἃᾃἇᾇ]", "[έὲἐἔἒἑἕἓ]", "[ῃήῄὴῂῆῇἠᾐἤᾔἢᾒἦᾖἡᾑἥᾕἣᾓἧᾗ]", "[ίὶῖἰἴἲἶἱἵἳἷϊΐῒῗ]", "[όὸὀὄὂὁὅὃ]", "[ύὺῦὐὔὒὖὑὕὓὗϋΰῢῧ]", "[ῳώῴὼῲῶῷὠᾠὤᾤὢᾢὦᾦὡᾡὥᾥὣᾣὧᾧ]", "ῥ", "ς"},
        to = {"α", "ε", "η", "ι", "ο", "υ", "ω", "ρ", "σ"}
    }
}

m["cpi"] = {"Chinese Pidgin English", 3435078, "crp", scripts = Latn, ancestors = {"en"}}

m["cpn"] = {"Cherepon", 35181, "alv-gng", scripts = Latn}

m["cpo"] = {"Kpee", 6435722, "dmn-jje"}

m["cps"] = {"Capiznon", 2937525, "phi", scripts = Latn}

m["cpu"] = {"Pichis Ashéninka", 7190661, "awd", scripts = Latn}

m["cpx"] = {"Puxian", 56583, "zhx-min-hai", scripts = {"Hani"}}

m["cpy"] = {"South Ucayali Ashéninka", 3501868, "awd", scripts = Latn}

m["cqd"] = {"Chuanqiandian Cluster Miao", 3307894, "hmn", scripts = {"Latn", "Plrd"}}

m["cra"] = {"Chara", 5073694, "omv", scripts = Latn}

m["crb"] = {"Island Carib", 3450735, "awd-taa", ancestors = {"awd-taa-pro"}, scripts = Latn}

m["crc"] = {"Lonwolwol", 3259216, "poz-oce", scripts = Latn}

m["crd"] = {"Coeur d'Alene", 32915, "sal", scripts = Latn}

m["crf"] = {"Caramanta", 3504195, "sai-chc", scripts = Latn}

m["crg"] = {"Michif", 13315, "qfa-mix", ancestors = {"cr", "fr"}, scripts = Latn}

m["crh"] = {"Crimean Tatar", 33357, "trk-kcu", scripts = {"Latn", "Cyrl"}}

m["cri"] = {"Sãotomense", 36536, "crp", ancestors = {"pt"}, scripts = Latn}

m["crj"] = {"Southern East Cree", 12953464, "alg", scripts = {"Cans"}, ancestors = {"cr"}, translit_module = "cr-translit"}

m["crk"] = {"Plains Cree", 56699, "alg", scripts = {"Cans", "Latn"}, ancestors = {"cr"}}

m["crl"] = {"Northern East Cree", 12642195, "alg", scripts = {"Cans"}, ancestors = {"cr"}, translit_module = "cr-translit"}

m["crm"] = {"Moose Cree", 3446671, "alg", scripts = {"Cans"}, ancestors = {"cr"}}

m["crn"] = {"Cora", 12953454, "azc", scripts = Latn}

m["cro"] = {"Crow", 1207611, "sio-mor", scripts = Latn}

m["crq"] = {"Iyo'wujwa Chorote", 3540927, "sai-mtc", scripts = Latn}

m["crr"] = {"Carolina Algonquian", 16113723, "alg-eas", scripts = Latn}

m["crs"] = {"Seychellois Creole", 34015, "crp", scripts = Latn, ancestors = {"fr"}}

m["crt"] = {"Iyojwa'ja Chorote", 3504118, "sai-mtc", scripts = Latn}

m["crv"] = {"Chaura", 2605680, "aav-nic"}

m["crw"] = {"Chrau", 5105629, "mkh-ban", scripts = Latn}

m["crx"] = {"Carrier", 12953431, "ath-nor", scripts = {"Latn", "Cans"}}

m["cry"] = {"Cori", 35204, "nic-plc", scripts = Latn}

m["crz"] = {"Cruzeño", 2967636, "nai-chu", scripts = Latn}

m["csa"] = {"Chiltepec Chinantec", 12953435, "omq-chi", scripts = Latn}

m["csb"] = {"Kashubian", 33690, "zlw-lch", scripts = Latn, ancestors = {"zlw-pom"}}

m["csc"] = {
    "Catalan Sign Language",
    35768,
    "sgn",
    scripts = Latn -- when documented
}

m["csd"] = {"Chiangmai Sign Language", 5095211, "sgn"}

m["cse"] = {
    "Czech Sign Language",
    5201809,
    "sgn",
    scripts = Latn -- when documented
}

m["csf"] = {
    "Cuban Sign Language",
    5192046,
    "sgn",
    scripts = Latn -- when documented
}

m["csg"] = {
    "Chilean Sign Language",
    3322112,
    "sgn",
    scripts = Latn -- when documented
}

m["csh"] = {"Asho Chin", 12627282, "tbq-kuk"}

m["csi"] = {"Coast Miwok", 2981109, "nai-you", scripts = Latn}

m["csj"] = {"Songlai Chin", 7561280, "tbq-kuk"}

m["csk"] = {"Jola-Kasa", 3446622, "alv-jol", scripts = Latn}

m["csl"] = {"Chinese Sign Language", 1094190, "sgn"}

m["csm"] = {"Central Sierra Miwok", 2944443, "nai-you", scripts = Latn}

m["csn"] = {
    "Colombian Sign Language",
    2748229,
    "sgn",
    scripts = Latn -- when documented
}

m["cso"] = {"Sochiapam Chinantec", 7550388, "omq-chi", scripts = Latn}

m["csq"] = {"Croatian Sign Language", 3507506, "sgn"}

m["csr"] = {
    "Costa Rican Sign Language",
    5174901,
    "sgn",
    scripts = Latn -- when documented
}

m["css"] = {"Southern Ohlone", 25559664, "nai-you", scripts = Latn}

m["cst"] = {"Northern Ohlone", 25559666, "nai-you", scripts = Latn}

m["csv"] = {"Sumtu Chin", 7638087, "tbq-kuk"}

m["csw"] = {"Swampy Cree", 56696, "alg", scripts = {"Latn", "Cans"}, ancestors = {"cr"}}

m["csy"] = {"Siyin Chin", 7533375, "tbq-kuk"}

m["csz"] = {"Coos", 3126783, "nai-coo", scripts = Latn}

m["cta"] = {"Tataltepec Chatino", 7687853, "omq-cha", scripts = Latn}

m["ctc"] = {"Chetco-Tolowa", 12628946, "ath-pco", scripts = Latn}

m["ctd"] = {"Tedim Chin", 56357, "tbq-kuk", scripts = {"Latn", "Pauc"}}

m["cte"] = {"Tepinapa Chinantec", 12953443, "omq-chi", scripts = Latn}

m["ctg"] = {"Chittagonian", 33173, "inc-eas", scripts = {"Beng"}, ancestors = {"inc-obn"}}

m["cth"] = {"Thaiphum Chin", 16912048, "tbq-kuk"}

m["ctl"] = {"Tlacoatzintepec Chinantec", 12643657, "omq-chi", scripts = Latn}

m["ctm"] = {"Chitimacha", 1294227, "qfa-iso", scripts = Latn}

m["ctn"] = {"Chhintange", 32994, "sit-kie", scripts = Deva}

m["cto"] = {"Emberá-Catío", 3052039, "sai-chc", scripts = Latn}

m["ctp"] = {"Western Highland Chatino", 32861734, "omq-cha", scripts = Latn, sort_key = {from = {"á", "é", "í", "ó", "ú"}, to = {"a", "e", "i", "o", "u"}}, entry_name = {from = {"[¹²³⁴⁵]"}, to = {}}}

m["cts"] = {"Northern Catanduanes Bicolano", 7130477, "phi", scripts = Latn}

m["ctt"] = {"Wayanad Chetti", 7975850, "dra", scripts = {"Taml"}}

m["ctu"] = {"Chol", 35179, "myn", scripts = Latn}

m["ctz"] = {"Zacatepec Chatino", 8063754, "omq-cha", scripts = Latn}

m["cua"] = {"Cua", 3441115, "mkh-ban", scripts = Latn}

m["cub"] = {"Cubeo", 3006705, "sai-tuc", scripts = Latn}

m["cuc"] = {"Usila Chinantec", 7901979, "omq-chi", scripts = Latn}

m["cug"] = {"Cung", 35194, "nic-bbe", scripts = Latn}

m["cuh"] = {"Chuka", 12952344, "bnt-kka", scripts = Latn}

m["cui"] = {"Cuiba", 2980421, "sai-guh", scripts = Latn}

m["cuj"] = {"Mashco Piro", 3446596, "awd", scripts = Latn}

m["cuk"] = {"Kuna", 12953659, "cba", scripts = Latn}

m["cul"] = {"Culina", 2475442, "auf", scripts = Latn}

m["cuo"] = {"Cumanagoto", 5193784, "sai-cpc", scripts = Latn}

m["cup"] = {"Cupeño", 143130, "azc-cup", scripts = Latn}

m["cuq"] = {"Cun", 2475478, "qfa-lic", scripts = Latn}

m["cur"] = {"Chhulung", 5116126, "sit-kie", scripts = Deva}

m["cut"] = {"Teutila Cuicatec", 12953453, "omq-cui", scripts = Latn}

m["cuu"] = {"Tai Ya", 3441122, "qfa-tak", scripts = Latn}

m["cuv"] = {"Cuvok", 3515056, "cdc-cbm", scripts = Latn}

m["cuw"] = {"Chukwa", 12629033, "sit-kic"}

m["cux"] = {"Tepeuxila Cuicatec", 20527242, "omq-cui", scripts = Latn}

m["cuy"] = {"Cuitlatec", 2030998, "qfa-iso", scripts = Latn}

m["cvg"] = {"Chug", 47683644, "sit-khb"}

m["cvn"] = {"Valle Nacional Chinantec", 12953442, "omq-chi", scripts = Latn}

m["cwa"] = {"Kabwa", 6344537, "bnt-lok", scripts = Latn}

m["cwb"] = {"Maindo", 11002891, "bnt-mak", ancestors = {"chw"}, scripts = Latn}

m["cwd"] = {"Woods Cree", 56305, "alg", scripts = {"Latn", "Cans"}, ancestors = {"cr"}}

m["cwe"] = {"Kwere", 779632, "bnt-ruv", scripts = Latn}

m["cwg"] = {"Chewong", 646718, "mkh-asl", scripts = Latn}

m["cwt"] = {"Kuwaataay", 35699, "alv-jol", scripts = Latn}

m["cya"] = {"Nopala Chatino", 15616302, "omq-cha", scripts = Latn}

m["cyb"] = {"Cayubaba", 3183382, "qfa-iso", scripts = Latn}

m["cyo"] = {"Cuyunon", 33153, "phi", scripts = Latn}

m["czh"] = {
    "Huizhou",
    56546,
    "zhx",
    scripts = {"Hani"}, -- ?
    ancestors = {"ltc"}
}

m["czk"] = {"Knaanic", 56384, "zlw", scripts = {"Hebr"}, ancestors = {"zlw-ocs"}}

m["czn"] = {"Zenzontepec Chatino", 603106, "omq-cha", scripts = Latn}

m["czo"] = {"Min Zhong", 56435, "zhx-min-shn", scripts = {"Hani"}}

m["czt"] = {"Zotung Chin", 8074599, "tbq-kuk", scripts = Latn}

return m
