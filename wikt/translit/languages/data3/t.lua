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

-- Punctuation to be used for standardChars field
local PUNCTUATION = " !#$%&*+,-./:;<=>?@^_`|~'()"

local Latn = {"Latn"}

local m = {}

m["taa"] = {"Lower Tanana", 28565, "ath-nor", scripts = Latn}

m["tab"] = {"Tabasaran", 34079, "cau-lzg", scripts = {"Cyrl"}, translit_module = "tab-translit", override_translit = true, entry_name = {from = {ACUTE}, to = {}}}

m["tac"] = {"Lowland Tarahumara", 15616384, "azc-trc", scripts = Latn}

m["tad"] = {"Tause", 2356440, "paa-lkp", scripts = Latn}

m["tae"] = {"Tariana", 732726, "awd-nwk", scripts = Latn}

m["taf"] = {"Tapirapé", 7684673, "tup-gua", scripts = Latn}

m["tag"] = {"Tagoi", 36537, "nic-ras", scripts = Latn}

m["taj"] = {"Eastern Tamang", 12953177, "sit-tam", scripts = {"Deva"}}

m["tak"] = {"Tala", 3914494, "cdc-wst", scripts = Latn}

m["tal"] = {"Tal", 3440387, "cdc-wst", scripts = Latn}

m["tan"] = {"Tangale", 529921, "cdc-wst", scripts = Latn}

m["tao"] = {"Yami", 715760, "phi", scripts = Latn}

m["tap"] = {"Taabwa", 7673650, "bnt-sbi", scripts = Latn}

m["taq"] = {"Tamasheq", 4670066, "ber", scripts = {"Tfng", "Arab", "Latn"}, ancestors = {"tmh"}}

m["tar"] = {"Central Tarahumara", 20090009, "azc-trc", scripts = Latn, sort_key = {from = {"á", "é", "í", "ó", "ú", "ꞌ"}, to = {"a", "e", "i", "o", "u"}}}

m["tas"] = {"Tay Boi", 2233794, "crp", scripts = Latn, ancestors = {"fr"}}

m["tau"] = {"Upper Tanana", 28281, "ath-nor", scripts = Latn}

m["tav"] = {"Tatuyo", 2524007, "sai-tuc", scripts = Latn}

m["taw"] = {"Tai", 7675861, "ngf-mad", scripts = Latn}

m["tax"] = {"Tamki", 3449082, "cdc-est", scripts = Latn}

m["tay"] = {"Atayal", 715766, "map-ata", scripts = Latn}

m["taz"] = {"Tocho", 36680, "alv-tal", scripts = Latn}

m["tba"] = {"Aikanã", 3409307, "qfa-iso"}

m["tbb"] = {"Tapeba", 12953908}

m["tbc"] = {"Takia", 3514336, "poz-oce"}

m["tbd"] = {"Kaki Ae", 6349417, "poz-ocw", scripts = Latn}

m["tbe"] = {"Tanimbili", 3515188, "poz-oce", scripts = Latn}

m["tbf"] = {"Mandara", 3285424, "poz-ocw", scripts = Latn}

m["tbg"] = {"North Tairora", 20210398, "paa-kag"}

m["tbh"] = {"Thurawal", 3537135, "aus-yuk"}

m["tbi"] = {"Gaam", 35338, "sdv-eje", scripts = Latn}

m["tbj"] = {"Tiang", 3528020, "poz-ocw", scripts = Latn}

m["tbk"] = {"Calamian Tagbanwa", 3915487, "phi-kal"}

m["tbl"] = {"Tboli", 7690594, "phi"}

m["tbm"] = {"Tagbu", 7675188, "nic-ser"}

m["tbn"] = {"Barro Negro Tunebo", 12953943, "cba"}

m["tbo"] = {"Tawala", 7689206, "poz-ocw", scripts = Latn}

m["tbp"] = {"Taworta", 7689337, "paa-lkp", scripts = Latn}

m["tbr"] = {"Tumtum", 3407029, "qfa-kad"}

m["tbs"] = {"Tanguat", 7683166, "paa", scripts = Latn}

m["tbt"] = {"Kitembo", 13123561, "bnt-shh", scripts = Latn}

m["tbu"] = {"Tubar", 56730, "azc-trc", scripts = Latn}

m["tbv"] = {"Tobo", 7811712, "ngf"}

m["tbw"] = {"Tagbanwa", 3915475, "phi", scripts = Latn}

m["tbx"] = {"Kapin", 6366665, "poz-ocw", scripts = Latn}

m["tby"] = {"Tabaru", 11732670, "paa-wpa"}

m["tbz"] = {"Ditammari", 35186, "nic-eov"}

m["tca"] = {"Ticuna", 1815205, "sai-tyu", scripts = Latn}

m["tcb"] = {"Tanacross", 28268, "ath-nor", scripts = Latn}

m["tcc"] = {"Datooga", 35327, "sdv-nis", scripts = Latn}

m["tcd"] = {"Tafi", 36545, "alv-ktg"}

m["tce"] = {"Southern Tutchone", 31091048, "ath-nor", scripts = Latn}

m["tcf"] = {"Malinaltepec Tlapanec", 25559732, "omq", scripts = Latn}

m["tcg"] = {"Tamagario", 7680531, "ngf"}

m["tch"] = {"Turks and Caicos Creole English", 7855478, "crp", scripts = Latn, ancestors = {"en"}}

m["tci"] = {"Wára", 20825638, "paa-yam"}

m["tck"] = {"Tchitchege", 36595, "bnt-tek"}

m["tcl"] = {"Taman (Burma)", 15616518, "sit-jnp", scripts = Latn}

m["tcm"] = {"Tanahmerah", 3514927, "ngf"}

m["tco"] = {"Taungyo", 12953186, "tbq-brm", ancestors = {"obr"}}

m["tcp"] = {"Tawr Chin", 7689338, "tbq-kuk"}

m["tcq"] = {"Kaiy", 6348709, "paa-lkp"}

m["tcs"] = {"Torres Strait Creole", 36648, "crp", scripts = Latn, ancestors = {"en"}}

m["tct"] = {"T'en", 3442330, "qfa-kms"}

m["tcu"] = {"Southeastern Tarahumara", 36807, "azc-trc", scripts = Latn}

m["tcw"] = {"Tecpatlán Totonac", 7692795, "nai-ttn", scripts = Latn}

m["tcx"] = {"Toda", 34042, "dra"}

m["tcy"] = {"Tulu", 34251, "dra", scripts = {"Knda"}, translit_module = "kn-translit"}

m["tcz"] = {"Thado Chin", 6583558, "tbq-kuk"}

m["tda"] = {"Tagdal", 36570, "son"}

m["tdb"] = {"Panchpargania", 21946879, "inc-eas", ancestors = {"bh"}}

m["tdc"] = {"Emberá-Tadó", 3052041, "sai-chc"}

m["tdd"] = {"Tai Nüa", 36556, "tai-swe", scripts = {"Tale"}, translit_module = "Tale-translit"}

m["tde"] = {"Tiranige Diga Dogon", 5313387, "nic-dgw"}

m["tdf"] = {"Talieng", 37525108, "mkh-ban"}

m["tdg"] = {"Western Tamang", 12953178, "sit-tam"}

m["tdh"] = {"Thulung", 56553, "sit-kiw"}

m["tdi"] = {"Tomadino", 7818197, "poz-btk", scripts = Latn}

m["tdj"] = {"Tajio", 7676870, "poz"}

m["tdk"] = {"Tambas", 3440392, "cdc-wst"}

m["tdl"] = {"Sur", 3914453, "nic-tar"}

m["tdm"] = {"Taruma", nil}

m["tdn"] = {"Tondano", 3531514, "phi"}

m["tdo"] = {"Teme", 3913994, "alv-mye"}

m["tdq"] = {"Tita", 3914899, "nic-bco"}

m["tdr"] = {"Todrah", 7812881, "mkh"}

m["tds"] = {"Doutai", 5302331, "paa-lkp"}

m["tdt"] = {"Tetun Dili", 12643484, "crp", scripts = Latn, ancestors = {"tet"}}

m["tdu"] = {"Tempasuk Dusun", 3529155, "poz-san"}

m["tdv"] = {"Toro", 3438367, "nic-alu"}

m["tdy"] = {"Tadyawan", 7674700, "phi"}

m["tea"] = {"Temiar", 3914693, "mkh-asl"}

m["teb"] = {"Tetete", 7706087, "sai-tuc", scripts = Latn}

m["tec"] = {"Terik", 3518379, "sdv-nma"}

m["ted"] = {"Tepo Krumen", 11152243, "kro-grb"}

m["tee"] = {"Huehuetla Tepehua", 56455, "nai-ttn"}

m["tef"] = {"Teressa", 3518362, "aav-nic"}

m["teg"] = {"Teke-Tege", 36478, "bnt-tek"}

m["teh"] = {"Tehuelche", 33930, "sai-cho"}

m["tei"] = {"Torricelli", 3450788, "qfa-tor"}

m["tek"] = {"Ibali Teke", 2802914, "bnt-tek"}

m["tem"] = {"Temne", 36613, "alv-mel"}

m["ten"] = {"Tama (Colombia)", 3832969, "sai-tuc"}

m["teo"] = {"Ateso", 29474, "sdv-ttu", scripts = Latn}

m["tep"] = {"Tepecano", 3915525, "azc", scripts = Latn}

m["teq"] = {"Temein", 7698064, "sdv"}

m["ter"] = {"Tereno", 3314742, "awd", scripts = Latn}

m["tes"] = {"Tengger", 12473479, "poz"}

m["tet"] = {"Tetum", 34125, "poz-tim", scripts = Latn}

m["teu"] = {"Soo", 3437607, "ssa-klk"}

m["tev"] = {"Teor", 12953198, "poz-cma"}

m["tew"] = {"Tewa", 56492, "nai-kta", scripts = Latn}

m["tex"] = {"Tennet", 56346, "sdv"}

m["tey"] = {"Tulishi", 12911106, "qfa-kad", scripts = Latn}

m["tez"] = {"Tetserret", 7706841, "ber", scripts = Latn}

m["tfi"] = {"Tofin Gbe", 3530330, "alv-pph"}

m["tfn"] = {"Dena'ina", 27785, "ath-nor", scripts = Latn}

m["tfo"] = {"Tefaro", 7694618, "paa-egb"}

m["tfr"] = {"Teribe", 36533, "cba"}

m["tft"] = {"Ternate", 3518492, "paa-wpa", scripts = {"Latn", "Arab"}}

m["tga"] = {"Sagalla", 12953082, "bnt-cht"}

m["tgb"] = {"Tobilung", 12953913, "poz-san"}

m["tgc"] = {"Tigak", 3528276, "poz-ocw"}

m["tgd"] = {"Ciwogai", 3438799, "cdc-wst"}

m["tge"] = {"Eastern Gorkha Tamang", 12953175, "sit-tam"}

m["tgf"] = {"Chali", 3695197, "sit-ebo", scripts = {"Tibt"}}

m["tgh"] = {"Tobagonian Creole English", 7811541, "crp", ancestors = {"en"}}

m["tgi"] = {"Lawunuia", 3219937, "poz-ocw"}

m["tgn"] = {"Tandaganon", nil, "phi"}

m["tgo"] = {"Sudest", 7675351, "poz-ocw"}

m["tgp"] = {"Tangoa", 2410276, "poz-vnc", scripts = Latn}

m["tgq"] = {"Tring", 7842360, "poz-swa"}

m["tgr"] = {"Tareng", 25559541, "mkh"}

m["tgs"] = {"Nume", 3346290, "poz-vnc"}

m["tgt"] = {"Central Tagbanwa", 3915515, "phi", scripts = {"Tagb"}}

m["tgu"] = {"Tanggu", 7682930, "paa", scripts = Latn}

m["tgv"] = {"Tingui-Boto", 7808195, "sai-mje"}

m["tgw"] = {"Tagwana Senoufo", 36514, "alv-tdj"}

m["tgx"] = {"Tagish", 28064, "ath-nor", scripts = Latn}

m["tgy"] = {"Togoyo", 36825, "nic-ser"}

m["thc"] = {"Tai Hang Tong", 7675753, "tai-nor"}

m["thd"] = {"Kuuk Thaayorre", 6448718, "aus-pmn", scripts = Latn}

m["the"] = {"Chitwania Tharu", 22083804, "inc-eas", ancestors = {"inc-mgd"}}

m["thf"] = {"Thangmi", 7710314, "sit-new"}

m["thh"] = {"Northern Tarahumara", 15616395, "azc-trc", scripts = Latn}

m["thi"] = {"Tai Long", 25559562, "tai-swe"}

m["thk"] = {"Tharaka", 15407179, "bnt-kka"}

m["thl"] = {"Dangaura Tharu", 22083815, "inc-eas", ancestors = {"inc-mgd"}}

m["thm"] = {
    "Thavung",
    34780,
    "mkh-vie",
    scripts = {"Thai"}, -- Laoo is feasible but no evidence yet.
    sort_key = {from = {"[%pๆ]", "[็-๎]", "([เแโใไ])([ก-ฮ])"}, to = {"", "", "%2%1"}}
}

m["thn"] = {"Thachanadan", 7708880, "dra"}

m["thp"] = {"Thompson", 1755054, "sal"}

m["thq"] = {"Kochila Tharu", 22083826, "inc-eas", ancestors = {"inc-mgd"}}

m["thr"] = {"Rana Tharu", 12953920, "inc-eas", ancestors = {"inc-mgd"}}

m["ths"] = {"Thakali", 7709348, "sit-tam"}

m["tht"] = {"Tahltan", 30125, "ath-nor", scripts = Latn}

m["thu"] = {"Thuri", 7799291, "sdv-lon"}

m["thv"] = {"Tahaggart Tamahaq", 56703, "ber", scripts = {"Tfng", "Arab", "Latn"}, ancestors = {"tmh"}}

m["thy"] = {"Tha", 3915849, "alv-bwj"}

m["thz"] = {"Tayart Tamajeq", 56388, "ber", scripts = {"Tfng", "Arab", "Latn"}}

m["tia"] = {"Tidikelt Tamazight", 56392, "ber"}

m["tic"] = {"Tira", 36677, "alv-hei"}

m["tif"] = {"Tifal", 11732691, "ngf-okk"}

m["tig"] = {"Tigre", 34129, "sem-eth", scripts = {"Ethi"}, translit_module = "Ethi-translit"}

m["tih"] = {"Timugon Murut", 7807680, "poz-san"}

m["tii"] = {"Tiene", 36469, "bnt-tek"}

m["tij"] = {"Tilung", 7803037, "sit-kiw"}

m["tik"] = {"Tikar", 36483, "nic-bdn", scripts = Latn}

m["til"] = {"Tillamook", 2109432, "sal"}

m["tim"] = {"Timbe", 7804599, "ngf"}

m["tin"] = {"Tindi", 36860, "cau-ava"}

m["tio"] = {"Teop", 3518239, "poz-ocw"}

m["tip"] = {"Trimuris", 7842270, "paa-tkw"}

m["tiq"] = {"Tiéfo", 3914874, "alv-sav"}

m["tis"] = {"Masadiit Itneg", 18748769, "phi"}

m["tit"] = {"Tinigua", 3029805}

m["tiu"] = {"Adasen", 11214797, "phi"}

m["tiv"] = {"Tiv", 34131, "nic-tvc", scripts = Latn}

m["tiw"] = {"Tiwi", 1656014, "qfa-iso", scripts = Latn}

m["tix"] = {"Southern Tiwa", 7570552, "nai-kta", scripts = Latn}

m["tiy"] = {"Tiruray", 7809425, "phi", scripts = Latn}

m["tiz"] = {"Tai Hongjin", 3915716, "tai-swe"}

m["tja"] = {"Tajuasohn", 3915326, "kro-wkr"}

m["tjg"] = {"Tunjung", 3542117, "poz"}

m["tji"] = {"Northern Tujia", 12953229, "sit-tja"}

m["tjm"] = {"Timucua", 638300, "qfa-iso"}

m["tjn"] = {"Tonjon", 3913372, "dmn-jje"}

m["tjo"] = {"Temacine Tamazight", 3507211, "ber"}

m["tjs"] = {"Southern Tujia", 12633994, "sit-tja", scripts = Latn}

m["tju"] = {"Tjurruru", 3913834, "aus-nga", scripts = Latn}

m["tjw"] = {"Chaap Wuurong", 5285187, "aus-pam", scripts = Latn}

m["tka"] = {"Truká", 7847648}

m["tkb"] = {"Buksa", 20983638, "inc-eas", ancestors = {"inc-mgd"}}

m["tkd"] = {"Tukudede", 36863, "poz-tim", scripts = Latn}

m["tke"] = {"Takwane", 11030092, "bnt-mak", ancestors = {"vmw"}}

m["tkf"] = {"Tukumanféd", 42330115, "tup-gua", scripts = Latn}

m["tkl"] = {"Tokelauan", 34097, "poz-pnp", scripts = Latn}

m["tkm"] = {"Takelma", 56710}

m["tkn"] = {"Toku-No-Shima", 3530484, "jpx-ryu", scripts = {"Jpan"}}

m["tkp"] = {"Tikopia", 36682, "poz-pnp", scripts = Latn}

m["tkq"] = {"Tee", 3075144, "nic-ogo", scripts = Latn}

m["tkr"] = {"Tsakhur", 36853, "cau-lzg", scripts = {"Cyrl"}}

m["tks"] = {"Ramandi", 25261947, "xme-ttc", ancestors = {"xme-ttc-sou"}}

m["tkt"] = {"Kathoriya Tharu", 22083822, "inc-eas", ancestors = {"inc-mgd"}}

m["tku"] = {"Upper Necaxa Totonac", 56343, "nai-ttn", scripts = Latn}

m["tkv"] = {"Mur Pano", nil, "poz-ocw", scripts = Latn}

m["tkw"] = {"Teanu", 3516731, "poz-oce", scripts = Latn}

m["tkx"] = {"Tangko", 7682993, "ngf-okk"}

m["tkz"] = {"Takua", 7678544, "mkh"}

m["tla"] = {"Southwestern Tepehuan", 3518245, "azc", scripts = Latn}

m["tlb"] = {"Tobelo", 1142333, "paa-wpa"}

m["tlc"] = {"Misantla Totonac", 56460, "nai-ttn", scripts = Latn}

m["tld"] = {"Talaud", 7678964, "phi"}

m["tlf"] = {"Telefol", 7696150, "ngf-okk"}

m["tlg"] = {"Tofanma", 4461493, "paa-pau"}

m["tlh"] = {"Klingon", 10134, "art", type = "appendix-constructed", scripts = Latn}

m["tli"] = {"Tlingit", 27792, "xnd", scripts = {"Latn", "Cyrl"}}

m["tlj"] = {"Talinga-Bwisi", 7679530, "bnt-haj"}

m["tlk"] = {"Taloki", 3514563, "poz-btk"}

m["tll"] = {"Tetela", 2613465, "bnt-tet"}

m["tlm"] = {"Tolomako", 3130514, "poz-vnc"}

m["tln"] = {"Talondo'", 7680293, "poz-ssw"}

m["tlo"] = {"Talodi", 36525, "alv-tal"}

m["tlp"] = {"Filomena Mata-Coahuitlán Totonac", 5449202, "nai-ttn", scripts = Latn}

m["tlq"] = {"Tai Loi", 7675784, "mkh-pal"}

m["tlr"] = {"Talise", 3514510, "poz-sls"}

m["tls"] = {"Tambotalo", 7681065, "poz-vnc"}

m["tlt"] = {"Teluti", 12953194, "poz-cma"}

m["tlu"] = {"Tulehu", 7852006, "poz-cma"}

m["tlv"] = {"Taliabu", 3514498, "poz-cma", scripts = Latn}

m["tlx"] = {"Khehek", 3196124, "poz-aay"}

m["tly"] = {"Talysh", 34318, "xme-ttc", scripts = {"Latn", "Cyrl", "fa-Arab"}, ancestors = {"xme-ttc-pro"}}

m["tma"] = {"Tama (Chad)", 57001, "sdv-tmn"}

m["tmb"] = {"Avava", 2157461, "poz-vnc"}

m["tmc"] = {"Tumak", 3121045, "cdc-est"}

m["tmd"] = {"Haruai", 12632146, "ngf-mad"}

m["tme"] = {"Tremembé", 5246937}

m["tmf"] = {"Toba-Maskoy", 3033544, "sai-mas"}

m["tmg"] = {"Ternateño", 7232597}

m["tmh"] = {"Tuareg", 34065, "ber", scripts = {"Tfng", "Arab", "Latn"}}

m["tmi"] = {"Tutuba", 7857052, "poz-vnc"}

m["tmj"] = {"Samarokena", 7408865, "paa-tkw"}

m["tmk"] = {"Northwestern Tamang", 15616509, "sit-tam"}

m["tml"] = {"Tamnim Citak", 12643315, "ngf"}

m["tmm"] = {"Tai Thanh", 7675842, "tai-swe"}

m["tmn"] = {"Taman (Indonesia)", 7680671, "poz", scripts = Latn}

m["tmo"] = {"Temoq", 7698205, "mkh-asl"}

m["tmp"] = {"Tai Mène", 7675790, "tai-nor"}

m["tmq"] = {"Tumleo", 7852641, "poz-ocw"}

m["tms"] = {"Tima", 36684, "nic-ktl"}

m["tmt"] = {"Tasmate", 7687571, "poz-vnc"}

m["tmu"] = {"Iau", 56867, "paa-lkp"}

m["tmv"] = {"Motembo", 11013108, "bnt-bun"}

m["tmy"] = {"Tami", 3514812, "poz-oce"}

m["tmz"] = {"Tamanaku", 3441435, "sai-car", scripts = Latn}

m["tna"] = {"Tacana", 3182551, "sai-tac", scripts = Latn}

m["tnb"] = {"Western Tunebo", 3181238, "cba"}

m["tnc"] = {"Tanimuca-Retuarã", 36535, "sai-tuc", scripts = Latn}

m["tnd"] = {"Angosturas Tunebo", 25559604, "cba"}

m["tne"] = {"Tinoc Kallahan", 3192219}

m["tng"] = {"Tobanga", 3440501, "cdc-est"}

m["tnh"] = {"Maiani", 6735243, scripts = Latn, "ngf-mad"}

m["tni"] = {"Tandia", 7682454, "poz-hce", scripts = Latn}

m["tnk"] = {"Kwamera", 3200806, "poz-oce"}

m["tnl"] = {"Lenakel", 3229429, "poz-oce"}

m["tnm"] = {"Tabla", 7673105, "paa-sen"}

m["tnn"] = {"North Tanna", 957945, "poz-oce"}

m["tno"] = {"Toromono", 510544, "sai-tac", scripts = Latn}

m["tnp"] = {"Whitesands", 3063761, "poz-oce"}

m["tnq"] = {"Taíno", 5232952, "awd-taa", ancestors = {"awd-taa-pro"}, scripts = Latn}

m["tnr"] = {"Bedik", 35096, "alv-ten"}

m["tns"] = {"Tenis", 7699870, "poz-ocw"}

m["tnt"] = {"Tontemboan", 3531666, "phi", scripts = Latn}

m["tnu"] = {"Tay Khang", 6362363, "tai"}

m["tnv"] = {"Tangchangya", 7682361, "inc-eas", scripts = {"Cakm"}, ancestors = {"inc-obn"}}

m["tnw"] = {"Tonsawang", 3531660, "phi"}

m["tnx"] = {"Tanema", 2106984, "poz-oce"}

m["tny"] = {"Tongwe", 7821200, "bnt"}

m["tnz"] = {"Ten'edn", 3073453, "mkh-asl", scripts = Latn}

m["tob"] = {"Toba", 3113756, "sai-guc", scripts = Latn}

m["toc"] = {"Coyutla Totonac", 15615591, "nai-ttn", scripts = Latn}

m["tod"] = {"Toma", 11055484, "dmn-msw"}

m["tof"] = {"Gizrra", 5565941}

m["tog"] = {"Tonga (Malawi)", 3847648, "bnt-nys", scripts = Latn}

m["toh"] = {"Tonga (Mozambique)", 7820988, "bnt-bso"}

m["toi"] = {"Tonga (Zambia)", 34101, "bnt-bot"}

m["toj"] = {"Tojolabal", 36762, "myn"}

m["tol"] = {"Tolowa", 20827, "ath-pco", scripts = Latn}

m["tom"] = {"Tombulu", 3531199, "phi"}

m["too"] = {"Xicotepec de Juárez Totonac", 8044353, "nai-ttn", scripts = Latn}

m["top"] = {"Papantla Totonac", 56329, "nai-ttn", scripts = Latn}

m["toq"] = {"Toposa", 3033588, "sdv-ttu"}

m["tor"] = {"Togbo-Vara Banda", 11002922, "bad-cnt"}

m["tos"] = {"Highland Totonac", 13154149, "nai-ttn", scripts = Latn}

m["tou"] = {"Tho", 22694631, "mkh-vie"}

m["tov"] = {"Upper Taromi", 12953183, "xme-ttc", ancestors = {"xme-ttc-cen"}}

m["tow"] = {"Jemez", 3912876, "nai-kta", scripts = Latn}

m["tox"] = {"Tobian", 34022, "poz-mic"}

m["toy"] = {"Topoiyo", 7824977, "poz-kal"}

m["toz"] = {"To", 7811216, "alv-mbm"}

m["tpa"] = {"Taupota", 7688832, "poz-ocw"}

m["tpc"] = {"Azoyú Me'phaa", 25559730, "omq"}

m["tpe"] = {"Tippera", 16115423, "tbq-bdg"}

m["tpf"] = {"Tarpia", 12953185, "poz-ocw"}

m["tpg"] = {"Kula", 6442714, "qfa-tap"}

m["tpi"] = {"Tok Pisin", 34159, "crp", scripts = Latn, ancestors = {"en"}}

m["tpj"] = {"Tapieté", 3121063}

m["tpk"] = {"Tupinikin", 33924, "tup-gua"}

m["tpl"] = {"Tlacoapa Me'phaa", 16115511, "omq"}

m["tpm"] = {"Tampulma", 36590, "nic-gnw"}

m["tpn"] = {"Tupinambá", 31528147, "tup-gua", scripts = Latn}

m["tpo"] = {"Tai Pao", 7675795, "tai-nor"}

m["tpp"] = {"Pisaflores Tepehua", 56349, "nai-ttn"}

m["tpq"] = {"Tukpa", 12953230, "sit-las"}

m["tpr"] = {"Tuparí", 3542217, "tup", scripts = Latn}

m["tpt"] = {"Tlachichilco Tepehua", 56330, "nai-ttn"}

m["tpu"] = {"Tampuan", 3514882, "mkh-ban"}

m["tpv"] = {"Tanapag", 3397371, "poz-mic"}

m["tpw"] = {"Old Tupi", 56944, "tup-gua", scripts = Latn}

m["tpx"] = {"Acatepec Me'phaa", 31157882, "omq"}

m["tpy"] = {"Trumai", 12294279, "qfa-iso"}

m["tpz"] = {"Tinputz", 3529205, "poz-ocw"}

m["tqb"] = {"Tembé", 10322157, "tup-gua", scripts = Latn}

m["tql"] = {"Lehali", 3229119, "poz-oce"}

m["tqm"] = {"Turumsa", 7856508, "paa"}

m["tqn"] = {"Tenino", 15699255, "nai-shp", ancestors = {"nai-spt"}, scripts = Latn}

m["tqo"] = {"Toaripi", 7811403, "ngf"}

m["tqp"] = {"Tomoip", 3531388, "poz-ocw"}

m["tqq"] = {"Tunni", 3514343, "cus"}

m["tqr"] = {"Torona", 36679, "alv-tal"}

m["tqt"] = {"Western Totonac", 7116691, "nai-ttn", scripts = Latn}

m["tqu"] = {"Touo", 56750}

m["tqw"] = {"Tonkawa", 2454881, "qfa-iso"}

m["tra"] = {"Tirahi", 3812406, "inc-dar"}

m["trb"] = {"Terebu", 7701797, "poz-ocw"}

m["trc"] = {"Copala Triqui", 12953935, "omq-tri", scripts = Latn}

m["trd"] = {"Turi", 7854914, "mun"}

m["tre"] = {"East Tarangan", 18609750, "poz"}

m["trf"] = {"Trinidadian Creole English", 7842493, "crp", ancestors = {"en"}}

m["trg"] = {"Lishán Didán", 56473, "sem-nna"}

m["trh"] = {"Turaka", 12953237, "ngf"}

m["tri"] = {"Trió", 56885, "sai-car", scripts = Latn}

m["trj"] = {"Toram", 3441225, "cdc-est"}

m["trl"] = {"Traveller Scottish", 3915671}

m["trm"] = {"Tregami", 34081, "nur-sou"}

m["trn"] = {"Trinitario", 3539279, "awd"}

m["tro"] = {"Tarao", 3515603, "tbq-kuk", scripts = Latn}

m["trp"] = {"Kokborok", 35947, "tbq-bdg"}

m["trq"] = {"San Martín Itunyoso Triqui", 12953934, "omq-tri", scripts = Latn}

m["trr"] = {"Taushiro", 1957508}

m["trs"] = {"Chicahuaxtla Triqui", 3539587, "omq-tri", scripts = Latn}

m["trt"] = {"Tunggare", 615071, "paa-egb"}

m["tru"] = {"Turoyo", 34040, "sem-cna", scripts = {"Syrc", "Latn"}, entry_name = {from = {"[" .. u(0x0711, 0x0730, ("-"):byte(), 0x074A) .. "]"}, to = {}}}

m["trv"] = {"Taroko", 716686, "map-ata", scripts = Latn}

m["trw"] = {"Torwali", 2665246, "inc-dar", scripts = {"ur-Arab"}}

m["trx"] = {"Tringgus", 7842365, "day"}

m["try"] = {"Turung", 7856514, "tai-swe", scripts = {"as-Beng"}}

m["trz"] = {"Torá", 7827518, "sai-cpc"}

m["tsa"] = {"Tsaangi", 36675, "bnt-nze"}

m["tsb"] = {"Tsamai", 2371358, "cus"}

m["tsc"] = {"Tswa", 2085051, "bnt-tsr"}

m["tsd"] = {
    "Tsakonian",
    220607,
    "grk",
    scripts = {"Grek"},
    sort_key = { -- Keep this synchronized with el, grc, cpg, pnt
        from = {"[ᾳάᾴὰᾲᾶᾷἀᾀἄᾄἂᾂἆᾆἁᾁἅᾅἃᾃἇᾇ]", "[έὲἐἔἒἑἕἓ]", "[ῃήῄὴῂῆῇἠᾐἤᾔἢᾒἦᾖἡᾑἥᾕἣᾓἧᾗ]", "[ίὶῖἰἴἲἶἱἵἳἷϊΐῒῗ]", "[όὸὀὄὂὁὅὃ]", "[ύὺῦὐὔὒὖὑὕὓὗϋΰῢῧ]", "[ῳώῴὼῲῶῷὠᾠὤᾤὢᾢὦᾦὡᾡὥᾥὣᾣὧᾧ]", "ῥ", "ς"},
        to = {"α", "ε", "η", "ι", "ο", "υ", "ω", "ρ", "σ"}
    },
    ancestors = {"grc"}
}

m["tse"] = {"Tunisian Sign Language", 7853191, "sgn"}

m["tsf"] = {"Southwestern Tamang", 12953176, "sit-tam"}

m["tsg"] = {"Tausug", 34142, "phi", scripts = {"Latn", "Arab"}}

m["tsh"] = {"Tsuvan", 3502326, "cdc-cbm"}

m["tsi"] = {"Tsimshian", 20085721, "nai-tsi"}

m["tsj"] = {"Tshangla", 36840, "sit-tsk", scripts = {"Latn", "Deva", "Tibt"}}

m["tsl"] = {"Ts'ün-Lao", 3446675, "tai"}

m["tsm"] = {"Turkish Sign Language", 36885, "sgn"}

m["tsp"] = {"Northern Toussian", 11155635, "alv-sav"}

m["tsq"] = {"Thai Sign Language", 7709156, "sgn"}

m["tsr"] = {"Akei", 2828964, "poz-vnc"}

m["tss"] = {"Taiwan Sign Language", 34019, "sgn-jsl"}

m["tsu"] = {"Tsou", 716681, "map", scripts = Latn}

m["tsv"] = {"Tsogo", 36674, "bnt-tso"}

m["tsw"] = {"Tsishingini", 13123571, "nic-kam"}

m["tsx"] = {"Mubami", 6930815, "ngf"}

m["tsy"] = {"Tebul Sign Language", 7692090, "sgn"}

m["tta"] = {"Tutelo", 2311602, "sio-ohv"}

m["ttb"] = {"Gaa", 3438361, "nic-dak"}

m["ttc"] = {"Tektiteko", 36686, "myn"}

m["ttd"] = {"Tauade", 7688634}

m["tte"] = {"Bwanabwana", 5003667, "poz-ocw", scripts = Latn}

m["ttf"] = {"Tuotomb", 7853459, "nic-mbw", scripts = Latn}

m["ttg"] = {"Tutong", 3507990, "poz-swa"}

m["tth"] = {"Upper Ta'oih", 3512660, "mkh-kat"}

m["tti"] = {"Tobati", 7811556, "poz-ocw"}

m["ttj"] = {"Tooro", 7824218, "bnt-nyg"}

m["ttk"] = {"Totoro", 3532756, "sai-bar"}

m["ttl"] = {"Totela", 10962316, "bnt-bot"}

m["ttm"] = {"Northern Tutchone", 20822, "ath-nor", scripts = Latn}

m["ttn"] = {"Towei", 7829606, "paa-pau"}

m["tto"] = {"Lower Ta'oih", 25559539, "mkh-kat"}

m["ttp"] = {"Tombelala", 6799663, "poz-kal"}

m["ttq"] = {"Tawallammat Tamajaq", 56390, "ber", scripts = {"Tfng", "Arab", "Latn"}, ancestors = {"tmh"}}

m["ttr"] = {"Tera", 56267, "cdc-cbm"}

m["tts"] = {"Isan", 33417, "tai-swe", scripts = {"Thai"}, sort_key = {from = {"[%pๆ]", "[็-๎]", "([เแโใไ])([ก-ฮ])"}, to = {"", "", "%2%1"}}}

m["ttt"] = {"Tat", 56489, "ira-swi", scripts = {"Cyrl", "Latn", "Armn", "fa-Arab"}, ancestors = {"fa"}}

m["ttu"] = {"Torau", 3532208, "poz-ocw"}

m["ttv"] = {"Titan", 3445811, "poz-aay"}

m["ttw"] = {"Long Wat", 7856961, "poz-swa"}

m["tty"] = {"Sikaritai", 7513600, "paa-lkp"}

m["ttz"] = {"Tsum", 12953223, "sit-kyk"}

m["tua"] = {"Wiarumus", 7998045, "qfa-tor", scripts = Latn}

m["tub"] = {"Tübatulabal", 56704, "azc", scripts = Latn}

m["tuc"] = {"Mutu", 3331003, "poz-ocw", scripts = Latn}

m["tud"] = {"Tuxá", 7857217}

m["tue"] = {"Tuyuca", 2520538, "sai-tuc", scripts = Latn}

m["tuf"] = {"Central Tunebo", 12953942, "cba"}

m["tug"] = {"Tunia", 863721, "alv-bua"}

m["tuh"] = {"Taulil", 3516141, "paa-bng"}

m["tui"] = {"Tupuri", 36646, "alv-mbm", scripts = Latn}

m["tuj"] = {"Tugutil", 12953228}

m["tul"] = {"Tula", 3914907, "alv-wjk"}

m["tum"] = {"Tumbuka", 34138, "bnt-nys", scripts = Latn}

m["tun"] = {"Tunica", 56619, "qfa-iso", scripts = Latn}

m["tuo"] = {"Tucano", 3541834, "sai-tuc", scripts = Latn}

m["tuq"] = {"Tedaga", 36639, "ssa-sah"}

m["tus"] = {"Tuscarora", 36944, "iro", scripts = {"Latinx"}}

m["tuu"] = {"Tututni", 20627, "ath-pco", scripts = Latn}

m["tuv"] = {"Turkana", 36958, "sdv-ttu", scripts = Latn}

m["tux"] = {"Tuxináwa", 7857204, "sai-pan", scripts = Latn}

m["tuy"] = {"Tugen", 3541935, "sdv-nma"}

m["tuz"] = {"Turka", 36643, "nic-gur", scripts = Latn}

m["tva"] = {"Vaghua", 3553248, "poz-ocw", scripts = Latn}

m["tvd"] = {"Tsuvadi", 3914936, "nic-kam"}

m["tve"] = {"Te'un", 7690709, "poz-cet", scripts = Latn}

m["tvk"] = {"Southeast Ambrym", 252411, "poz-vnc", scripts = Latn}

m["tvl"] = {"Tuvaluan", 34055, "poz-pnp", scripts = Latn}

m["tvm"] = {"Tela-Masbuar", 7695666, "poz-tim"}

m["tvn"] = {"Tavoyan", 7689158, "tbq-brm", scripts = {"Mymr"}, ancestors = {"obr"}}

m["tvo"] = {"Tidore", 3528199, "paa-wpa"}

m["tvs"] = {"Taveta", 15632387, "bnt-par"}

m["tvt"] = {"Tutsa Naga", 7856987, "sit-tno"}

m["tvu"] = {"Tunen", 36632, "nic-mbw"}

m["tvw"] = {"Sedoa", 7445362, "poz-kal"}

m["tvx"] = {"Taivoan", 1975271, "map", scripts = Latn}

m["tvy"] = {"Timor Pidgin", 4904029, "crp", ancestors = {"pt"}}

m["twa"] = {"Twana", 7857412, "sal"}

m["twb"] = {"Western Tawbuid", 12953912, "phi"}

m["twc"] = {"Teshenawa", 3436597, "phi"}

m["twe"] = {"Teiwa", 3519302, "ngf", scripts = Latn}

m["twf"] = {"Taos", 7684320, "nai-kta", scripts = Latn}

m["twg"] = {"Tereweng", 12953200, "qfa-tap"}

m["twh"] = {
    "Tai Dón",
    7675751,
    "tai-swe",
    scripts = {"Tavt"},
    -- translit_module = "Tavt-translit",
    sort_key = {from = {"[꪿ꫀ꫁ꫂ]", "([ꪵꪶꪹꪻꪼ])([ꪀ-ꪯ])"}, to = {"", "%2%1"}}
}

m["twm"] = {"Tawang Monpa", 36586, "sit-ebo"}

m["twn"] = {"Twendi", 7857682, "nic-mmb"}

m["two"] = {"Tswapong", 3446241, "bnt-sts"}

m["twp"] = {"Ere", 3056045, "poz-aay", scripts = Latn}

m["twq"] = {"Tasawaq", 36564, "son"}

m["twr"] = {"Southwestern Tarahumara", 12953909, "azc-trc", scripts = Latn}

m["twt"] = {"Turiwára", 3542307, "tup-gua", scripts = Latn}

m["twu"] = {"Termanu", 7702572, "poz-tim"}

m["tww"] = {"Tuwari", 7857159, "paa-spk"}

m["twy"] = {"Tawoyan", 3513542, "poz-bre"}

m["txa"] = {"Tombonuo", 7818692, "poz-san"}

m["txb"] = {
    "Tocharian B",
    3199353,
    "ine-toc",
    scripts = Latn,
    wikipedia_article = "Tocharian languages", -- wikidata id has no associated article
    standardChars = "ACEIK-PR-UWYaceik-pr-uwyÄäĀāṂṃṄṅÑñŚśṢṣ" .. PUNCTUATION
}

m["txc"] = {"Tsetsaut", 20829, "ath-nor", scripts = Latn}

m["txe"] = {"Totoli", 7828387, "poz-tot", scripts = Latn}

m["txg"] = {"Tangut", 2727930, "sit-qia", scripts = {"Tang"}}

m["txj"] = {"Tarjumo", nil, "ssa-sah", scripts = {"Latn", "Arab"}}

m["txh"] = {"Thracian", 36793, "ine", scripts = {"Grek"}, translit_module = "el-translit"}

m["txi"] = {"Ikpeng", 9344891, "sai-car", scripts = Latn}

m["txm"] = {"Tomini", 7818911, "poz"}

m["txn"] = {"West Tarangan", 3515594, "poz"}

m["txo"] = {"Toto", 36709, "sit-dhi"}

m["txq"] = {"Tii", 7801784, "poz-tim"}

m["txr"] = {"Tartessian", 36795}

m["txs"] = {"Tonsea", 3531659, "phi"}

m["txt"] = {"Citak", 3447279, "ngf"}

m["txu"] = {"Kayapó", 3101212, "sai-nje", scripts = Latn}

m["txx"] = {"Tatana", 18643518, "poz-san"}

m["tya"] = {"Tauya", 7688978, "ngf-mad"}

m["tye"] = {"Kyenga", 3913304, "dmn-bbu", scripts = Latn}

m["tyh"] = {"O'du", 3347428, "mkh"}

m["tyi"] = {"Teke-Tsaayi", 33123613, "bnt-nze"}

m["tyj"] = {"Tai Do", 7675746, "tai-nor"}

m["tyl"] = {"Thu Lao", 12953921, "tai-cen"}

m["tyn"] = {"Kombai", 6428241, "ngf"}

m["typ"] = {"Kuku-Thaypan", 3915693, "aus-pmn", scripts = Latn}

m["tyr"] = {"Tai Daeng", 3915207, "tai-swe"}

m["tys"] = {"Sapa", 3446668, "tai-sap", scripts = Latn}

m["tyt"] = {"Tày Tac", 7862029, "tai-swe"}

m["tyu"] = {"Kua", 3832933, "khi-kal"}

m["tyv"] = {"Tuvan", 34119, "trk-sib", scripts = {"Cyrl"}, translit_module = "tyv-translit", override_translit = true}

m["tyx"] = {"Teke-Tyee", 36634, "bnt-nze"}

m["tyz"] = {
    "Tày", -- This does not mean its umbrella "Tai" languages.
    2511476,
    "tai-tay",
    scripts = Latn
}

m["tza"] = {"Tanzanian Sign Language", 7684177, "sgn"}

m["tzh"] = {"Tzeltal", 36808, "myn", scripts = Latn}

m["tzj"] = {"Tz'utujil", 36941, "myn", scripts = Latn}

m["tzl"] = {
    "Talossan",
    1063911,
    "art",
    type = "appendix-constructed",
    scripts = Latn,
    sort_key = {from = {"[àáâäå]", "ç", "ð", "[ëèéê]", "[ìíîï]", "ñ", "[öòóô]", "ß", "[üùúû]", "þ"}, to = {"a", "c", "d∙", "e", "i", "n", "o", "s", "u", "z∙"}} -- bullet so ð and þ are sorted after all other words with d and z, respectively
}

m["tzm"] = {"Central Atlas Tamazight", 49741, "ber", scripts = {"Tfng", "Arab", "Latn"}, translit_module = "Tfng-translit"}

m["tzn"] = {"Tugun", 12953225, "poz-tim"}

m["tzo"] = {"Tzotzil", 36809, "myn", scripts = Latn}

m["tzx"] = {"Tabriak", 56872, "paa-lsp", scripts = Latn}

return m
