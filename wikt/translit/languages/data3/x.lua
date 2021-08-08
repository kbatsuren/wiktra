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

m["xaa"] = {"Andalusian Arabic", 1137945, "sem-arb", scripts = {"Arab", "Latn"}, entry_name = {from = {u(0x0671), u(0x064B), u(0x064C), u(0x064D), u(0x064E), u(0x064F), u(0x0650), u(0x0651), u(0x0652), u(0x0670), u(0x0640)}, to = {u(0x0627)}}}

m["xab"] = {"Sambe", 36265, "nic-alu", scripts = Latn}

m["xac"] = {"Kachari", 3442442, "tbq-bdg"}

m["xad"] = {"Adai", 346744}

m["xae"] = {"Aequian", 930579, "itc"}

m["xag"] = {"Aghwan", 34931, "cau-lzg", scripts = {"Aghb"}, translit_module = "Aghb-translit", override_translit = true}

m["xai"] = {"Kaimbé", 6348017}

m["xaj"] = {"Ararandewára", nil, "tup-gua", scripts = Latn}

m["xak"] = {"Maku", 2032882, scripts = Latn}

m["xal"] = {"Kalmyk", 33634, "xgn", scripts = {"Cyrl"}, ancestors = {"xwo"}, translit_module = "xal-translit", override_translit = true}

m["xam"] = {"ǀXam", 2086145, "khi-tuu", scripts = Latn}

m["xan"] = {"Xamtanga", 56527, "cus"}

m["xao"] = {"Khao", 3196077, "mkh-pal"}

m["xap"] = {"Apalachee", 686501, "nai-mus", scripts = Latn}

m["xaq"] = {"Aquitanian", 500522, "euq", scripts = Latn}

m["xar"] = {"Karami", 11732281}

m["xas"] = {"Kamassian", 35991, "syd", scripts = {"Cyrl"}}

m["xat"] = {"Katawixi", 3440512, "sai-ktk"}

m["xau"] = {"Kauwera", 6378983, "paa-tkw"}

m["xav"] = {"Xavante", 36962, "sai-cje", scripts = Latn}

m["xaw"] = {"Kawaiisu", 56338, "azc-num", scripts = Latn}

m["xay"] = {"Kayan Mahakam", 25337171}

m["xbb"] = {"Lower Burdekin", 6693353}

m["xbc"] = {"Bactrian", 756651, "ira-sbc", scripts = {"Grek", "Mani"}, entry_name = {from = {"Þ", "þ"}, to = {"Ϸ", "ϸ"}}, translit_module = "xbc-translit"}

m["xbd"] = {"Bindal", 4913975}

m["xbe"] = {
    "Bigambal", 16841801, "aus-pam" -- unclassified within
}

m["xbg"] = {"Bunganditj", 4997615}

m["xbi"] = {"Kombio", 6428259, "qfa-tor", scripts = Latn}

m["xbj"] = {"Birrpayi", nil}

m["xbm"] = {"Middle Breton", 787610, "cel-bry", scripts = Latn, ancestors = {"obt"}}

m["xbn"] = {"Kenaboi", 6388752}

m["xbo"] = {"Bulgar", 36880, "trk-ogr", scripts = {"Grek"}}

m["xbp"] = {"Bibbulman", 22918391}

m["xbr"] = {"Kambera", 3053279, "poz-cet", scripts = Latn}

m["xbw"] = {"Kambiwá", 9006744}

m["xby"] = {"Butchulla", 31752631}

m["xcb"] = {"Cumbric", 35965, "cel-bry"}

m["xcc"] = {"Camunic", 489011, scripts = {"Ital"}, translit_module = "Ital-translit"}

m["xce"] = {"Celtiberian", 37012, "cel", scripts = Latn}

m["xch"] = {"Chemakum", 56397, "chi", scripts = Latn}

m["xcl"] = {"Old Armenian", 181074, "hyx", scripts = {"Armn"}, translit_module = "Armn-translit", override_translit = true, entry_name = {from = {"՞", "՜", "՛", "՟", "և"}, to = {"", "", "", "", "եւ"}}}

m["xcm"] = {"Comecrudo", 609808, "nai-pak"}

m["xcn"] = {"Cotoname", 56889, "nai-pak"}

m["xco"] = {"Khwarezmian", 33138, "ira-sbc", scripts = {"Arab", "Armi", "Chrs", "Phlv", "Sogd"}, translit_module = "Chrs-translit"}

m["xcr"] = {"Carian", 35929, "ine-ana", scripts = {"Cari"}}

m["xct"] = {"Classical Tibetan", 5128314, "sit-tib"}

m["xcu"] = {"Curonian", 35857, "bat", scripts = Latn}

m["xcv"] = {"Chuvan", 3516641, "qfa-yuk", scripts = Cyrl}

m["xcw"] = {"Coahuilteco", 2008062, "nai-pak"}

m["xcy"] = {"Cayuse", 2472016}

m["xda"] = {"Darkinjung", 5223660, "aus-yuk", scripts = Latn}

m["xdc"] = {"Dacian", 682547, "ine", scripts = Latn}

m["xdk"] = {"Dharug", 1166814, "aus-yuk", scripts = Latn}

m["xdm"] = {"Edomite", 2363529, "sem-can", scripts = {"Phnx"}, translit_module = "Phnx-translit"}

m["xdy"] = {"Malayic Dayak", 3514892}

m["xeb"] = {"Eblaite", 35345, "sem-eas", scripts = {"Xsux"}}

m["xed"] = {"Hdi", 56246, "cdc-cbm", scripts = Latn}

m["xeg"] = {"ǁXegwi", 3509732, "khi-tuu", scripts = Latn}

m["xel"] = {"Kelo", 6386412, "sdv-eje"}

m["xem"] = {"Kembayan", 6386874}

m["xep"] = {"Epi-Olmec", nil}

m["xer"] = {"Xerénte", 3073436, "sai-cje", scripts = Latn}

m["xes"] = {"Kesawai", 6394907, "ngf-mad", scripts = Latn}

m["xet"] = {"Xetá", 2980404, "tup-gua", scripts = Latn}

m["xeu"] = {"Keoru-Ahia", 11732313, "ngf"}

m["xfa"] = {"Faliscan", 35669, "itc", scripts = {"Ital", "Latn"}, translit_module = "Ital-translit", entry_name = {from = {"[ĀĂ]", "[āă]", "[ĒĔ]", "[ēĕë]", "[ĪĬÏ]", "[īĭï]", "[ŌŎ]", "[ōŏ]", "[ŪŬÜ]", "[ūŭü]", "Ȳ", "ȳ", MACRON, BREVE, DIAER}, to = {"A", "a", "E", "e", "I", "i", "O", "o", "U", "u", "Y", "y"}}}

m["xga"] = {"Galatian", 27403, "cel", ancestors = {"cel-gau"}, scripts = {"Latn", "Grek"}}

m["xgb"] = {"Gbin", 16934745, "dmn-mse", scripts = Latn}

m["xgd"] = {"Gudang", 5614528}

m["xgf"] = {"Gabrielino-Fernandeño", 56387, "azc-tak", scripts = Latn}

m["xgg"] = {"Goreng", nil}

m["xgi"] = {"Garingbal", nil}

m["xgl"] = {"Galindan", 1190494, "bat", scripts = Latn}

m["xgm"] = {"Darumbal", 16954400}

m["xgr"] = {"Garza", 3098656, "nai-pak"}

m["xgu"] = {"Unggumi", 62000004, "aus-wor", scripts = Latn}

m["xgw"] = {"Guwa", 5621992}

m["xha"] = {"Harami", 41506724, scripts = {"Sarb"}, translit_module = "Sarb-translit"}

m["xhc"] = {"Hunnic", 35959}

m["xhd"] = {"Hadrami", 1032453, scripts = {"Sarb"}, translit_module = "Sarb-translit"}

m["xhe"] = {"Khetrani", 2614111, "inc-pan", ancestors = {"lah"}}

m["xhr"] = {"Hernican", 5908773, "itc", scripts = {"Ital"}}

m["xht"] = {"Hattic", 31107, "qfa-iso", scripts = {"Xsux"}}

m["xhu"] = {"Hurrian", 35740, "qfa-hur", scripts = {"Xsux", "Ugar"}}

m["xhv"] = {"Khua", 22970290, "mkh-kat"}

m["xib"] = {"Iberian", 855215, "qfa-iso", scripts = {"Latn", "Ibrn"}}

m["xii"] = {"Xiri", 36876}

m["xin"] = {"Xinca", 1546494, "nai-xin", scripts = Latn}

m["xil"] = {"Illyrian", 35976, "ine", type = "reconstructed"}

m["xir"] = {"Xiriâna", 2028772, "awd", scripts = Latn}

m["xis"] = {"Kisan", nil}

m["xiv"] = {"Indus Valley Language", 3428279, scripts = {"Inds"}}

m["xiy"] = {"Xipaya", 13226, "tup"}

m["xjb"] = {"Minjungbal", nil, "aus-pam", scripts = Latn}

m["xka"] = {"Kalkoti", 3877551}

m["xkb"] = {"Manigri-Kambolé Ede Nago", 36042, "alv-ede"}

m["xkc"] = {"Khoini", 6401919, "xme-ttc", ancestors = {"xme-ttc-wes"}}

m["xkd"] = {"Mendalam Kayan", 12952597}

m["xke"] = {"Kereho", 6437086, "poz", scripts = Latn}

m["xkf"] = {"Khengkha", 3695207, "sit-ebo"}

m["xkg"] = {"Kagoro", 11159524, "dmn-wmn"}

m["xki"] = {"Kenyan Sign Language", 6392859, "sgn"}

m["xkj"] = {"Kajali", 14916876, "xme-ttc", ancestors = {"xme-ttc-cen"}}

m["xkk"] = {"Kaco'", 6344767, "mkh"}

m["xkl"] = {"Bakung", 6736761, "poz-swa", scripts = Latn}

m["xkn"] = {"Kayan River Kayan", 12473395, "poz"}

m["xko"] = {"Kiorr", 6414519, "mkh-pal"}

m["xkp"] = {"Kabatei", 34165, "xme-ttc", ancestors = {"xme-ttc-cen"}}

m["xkq"] = {"Koroni", 3199000, "poz-btk"}

m["xkr"] = {"Xakriabá", 3073441, "sai-cje", scripts = Latn}

m["xks"] = {"Kumbewaha", 6443722}

m["xkt"] = {"Kantosi", 35651, "nic-dag"}

m["xku"] = {"Kaamba", 11042324, "bnt-kng"}

m["xkv"] = {"Kgalagadi", 2088743, "bnt-sts", scripts = Latn}

m["xkw"] = {"Kembra", 12953627, "paa-pau"}

m["xkx"] = {"Karore", 6373260, "poz-ocw"}

m["xky"] = {"Uma' Lasan", nil, "poz-swa"}

m["xkz"] = {"Kurtop", 3695193, "sit-ebo", scripts = {"Tibt", "Latn"}}

m["xla"] = {"Kamula", 10957277, "ngf"}

m["xlb"] = {"Loup B", 13108281, "alg-eas", scripts = Latn}

m["xlc"] = {"Lycian", 35969, "ine-ana", scripts = {"Lyci"}, translit_module = "Lyci-translit"}

m["xld"] = {"Lydian", 36095, "ine-ana", scripts = {"Lydi"}, translit_module = "Lydi-translit"}

m["xle"] = {"Lemnian", 36203, "qfa-tyn", scripts = {"Ital"}, translit_module = "Ital-translit"}

m["xlg"] = {"Ancient Ligurian", 36104, "ine"}

m["xli"] = {"Liburnian", 35835, "ine"}

-- xln is etymology-only

m["xlo"] = {"Loup A", 27921265, "alg-eas", scripts = Latn}

m["xlp"] = {"Lepontic", 35993, "cel", scripts = {"Ital"}, translit_module = "Ital-translit"}

m["xls"] = {"Lusitanian", 35960, "ine", scripts = Latn}

m["xlu"] = {"Luwian", 12634577, "ine-ana", scripts = {"Xsux", "Hluw"}}

m["xly"] = {"Elymian", 35329, scripts = {"Grek"}}

m["xmb"] = {"Mbonga", 36064, "nic-jrn", scripts = Latn}

m["xmc"] = {"Makhuwa-Marrevone", 11127231, "bnt-mak", ancestors = {"vmw"}}

m["xmd"] = {"Mbudum", 6799790, "cdc-cbm", scripts = Latn}

m["xmf"] = {"Mingrelian", 13359, "ccs-zan", scripts = {"Geor"}, translit_module = "Geor-translit", override_translit = true}

m["xmg"] = {"Mengaka", 36017, "bai", scripts = Latn}

m["xmh"] = {"Kugu-Muminh", 10549849, "aus-pmn", scripts = Latn}

m["xmj"] = {"Majera", 6737666, "cdc-cbm", scripts = Latn}

m["xmk"] = {
    "Ancient Macedonian",
    35974,
    "grk",
    scripts = {"polytonic"},
    translit_module = "grc-translit",
    sort_key = { -- Keep this synchronized with el, cpg, pnt
        from = {"[ᾳάᾴὰᾲᾶᾷἀᾀἄᾄἂᾂἆᾆἁᾁἅᾅἃᾃἇᾇᾱ]", "[έὲἐἔἒἑἕἓ]", "[ῃήῄὴῂῆῇἠᾐἤᾔἢᾒἦᾖἡᾑἥᾕἣᾓἧᾗ]", "[ίὶῖἰἴἲἶἱἵἳἷϊΐῒῗῑ]", "[όὸὀὄὂὁὅὃ]", "[ύὺῦὐὔὒὖὑὕὓὗϋΰῢῧῡ]", "[ῳώῴὼῲῶῷὠᾠὤᾤὢᾢὦᾦὡᾡὥᾥὣᾣὧᾧ]", "ῥ", "ς"},
        to = {"α", "ε", "η", "ι", "ο", "υ", "ω", "ρ", "σ"}
    },
    entry_name = {from = {"[ᾸᾹ]", "[ᾰᾱ]", "[ῘῙ]", "[ῐῑ]", "[ῨῩ]", "[ῠῡ]"}, to = {"Α", "α", "Ι", "ι", "Υ", "υ"}}
}

m["xml"] = {"Malaysian Sign Language", 33420, "sgn"}

m["xmm"] = {"Manado Malay", 1068112}

m["xmo"] = {"Morerebi", 12953749, "tup", scripts = Latn}

m["xmp"] = {"Kuku-Mu'inh", 10549852, scripts = Latn}

m["xmq"] = {"Kuku-Mangk", 10549851, "aus-pam", scripts = Latn}

m["xmr"] = {
    "Meroitic",
    13366,
    "afa",
    scripts = {"Mero", "Merc", "Latn"}, -- we have entries in Latn
    translit_module = "xmr-translit"
}

m["xms"] = {"Moroccan Sign Language", 6913107, "sgn"}

m["xmt"] = {"Matbat", 6786187, "poz-hce"}

m["xmu"] = {"Kamu", 6359779}

m["xmx"] = {"Maden", 12952756, "poz-hce"}

m["xmy"] = {"Mayaguduna", 3436736}

m["xmz"] = {"Mori Bawah", 3324069, "poz-btk", scripts = Latn}

m["xna"] = {"Ancient North Arabian", 1472213, "sem", scripts = {"Narb"}}

m["xnb"] = {"Kanakanabu", 172244, "map", scripts = Latn}

m["xng"] = {"Middle Mongolian", 2582455, "xgn", scripts = {"Mong", "Arab", "Phag"}, translit_module = "mn-translit"}

m["xnh"] = {"Kuanhua", 6441084, "mkh-pal"}

m["xni"] = {"Ngarigu", 7022072}

m["xnk"] = {"Nganakarti", 33087049}

m["xnn"] = {"Northern Kankanay", 12953609, "phi"}

m["xnr"] = {"Kangri", 2331560, "him", scripts = {"Deva", "Takr", "fa-Arab"}, ancestors = {"doi"}, translit_module = "hi-translit"}

m["xns"] = {"Kanashi", 6360672, "sit-whm"}

m["xnt"] = {"Narragansett", 3336118, "alg-eas", scripts = Latn}

m["xnu"] = {"Nukunul", 7068904}

m["xny"] = {"Nyiyaparli", 16919427, "aus-nga", scripts = Latn}

m["xoc"] = {"O'chi'chi'", 3813833, "nic-cde", scripts = Latn}

m["xod"] = {"Kokoda", 6426734, "ngf-sbh"}

m["xog"] = {"Soga", 33784, "bnt-nyg", scripts = Latn}

m["xoi"] = {"Kominimung", 6428352, "paa", scripts = Latn}

m["xok"] = {"Xokleng", 3027930, "sai-sje"}

m["xom"] = {"Komo", 56681, "ssa-kom"}

m["xon"] = {"Konkomba", 35674, "nic-grm", scripts = Latn}

m["xoo"] = { -- contrast kzw, sai-kat, sai-xoc
    "Xukurú", 9096758
}

m["xop"] = {"Kopar", 11732346}

m["xor"] = {"Korubo", 3199022}

m["xow"] = {"Kowaki", 6434920, "ngf-mad"}

m["xpa"] = {"Pirriya", 16978087}

m["xpb"] = {"Pyemmairre", 7262964, scripts = Latn}

m["xpc"] = {"Pecheneg", 877881, "trk"}

m["xpd"] = {"Paredarerme", 7136678, scripts = Latn}

m["xpe"] = {"Liberia Kpelle", 20527226, "dmn-msw", ancestors = {"kpe"}}

m["xpf"] = {"Southeast Tasmanian", 7068421, scripts = Latn}

m["xpg"] = {"Phrygian", 36751, "ine", scripts = {"Grek"}, translit_module = "grc-translit"}

m["xph"] = {"Tyerrernotepanner", 7859815, scripts = Latn}

m["xpi"] = {"Pictish", 856383, "cel", scripts = {"Ogam", "Latn"}}

m["xpj"] = {"Mpalitjanh", 6928192, "aus-pam"}

m["xpk"] = {"Kulina", 6443027, "sai-pan"}

m["xpl"] = {"Port Sorell", 7230944, scripts = Latn}

m["xpm"] = {"Pumpokol", 2991985, "qfa-yen", scripts = Latn}

m["xpn"] = {"Kapinawá", 6366667}

m["xpo"] = {"Pochutec", 2427341, "azc-nah", scripts = Latn}

m["xpp"] = {"Puyo-Paekche", nil}

m["xpq"] = {"Mohegan-Pequot", 3319130, "alg-eas", scripts = Latn}

m["xpr"] = {"Parthian", 25953, "ira-mpr", scripts = {"Prti", "Mani", "Phlv"}, translit_module = "translit-redirect"}

m["xps"] = {"Pisidian", 36580, "ine-ana"}

m["xpu"] = {"Punic", 535958, "sem-can", scripts = {"Phnx", "Latn", "Grek"}, ancestors = {"phn"}, translit_module = "translit-redirect"}

m["xpv"] = {"Tommeginne", 7819095, scripts = Latn}

m["xpw"] = {"Peerapper", 7160431, scripts = Latn}

m["xpx"] = {"Toogee", 7824008, scripts = Latn}

m["xpy"] = {"Buyeo", 5003359, "qfa-kor", scripts = {"Hani"}}

m["xpz"] = {"Bruny Island", 4979601, scripts = Latn}

m["xqa"] = {"Karakhanid", nil, "trk-kar", scripts = {"Arab"}}

m["xqt"] = {"Qatabanian", 384101, "sem-osa", scripts = {"Sarb"}, translit_module = "Sarb-translit"}

m["xra"] = {"Krahô", 3199549, "sai-nje"}

m["xrb"] = {"Eastern Karaboro", 35716, "alv-krb"}

m["xrd"] = {"Gundungurra", nil}

m["xre"] = {"Kreye", 3199686, "sai-nje"}

m["xrg"] = {"Minang", 22893424}

m["xri"] = {"Krikati-Timbira", 3199710}

m["xrm"] = {"Armazic", 7599646}

m["xrn"] = {"Arin", 34088, "qfa-yen", scripts = Latn}

m["xrq"] = {"Karranga", 6373349, scripts = Latn}

m["xrr"] = {"Raetic", 36689, scripts = {"Ital"}, translit_module = "Ital-translit"}

m["xrt"] = {"Aranama-Tamique", 2859505}

m["xru"] = {"Marriammu", 10577724, "aus-dal"}

m["xrw"] = {"Karawa", 6368857, "paa-spk"}

m["xsa"] = {"Sabaean", 1070391, "sem-osa", scripts = {"Sarb"}, translit_module = "Sarb-translit"}

m["xsb"] = {"Sambali", 2592378, "phi", scripts = Latn}

m["xsd"] = {"Sidetic", 36659, "ine-ana"}

m["xse"] = {"Sempan", 3504358}

m["xsh"] = {"Shamang", 3914876, "nic-plc"}

m["xsi"] = {"Sio", 3485100, "poz-ocw"}

m["xsj"] = {"Subi", 7631298, "bnt-haj"}

m["xsl"] = {"South Slavey", 28552, "ath-nor", scripts = Latn}

m["xsm"] = {"Kasem", 35552, "nic-gnn"}

m["xsn"] = {"Sanga (Nigeria)", 3915334, "nic-jer", scripts = Latn}

m["xso"] = {"Solano", 2474492, scripts = Latn}

m["xsp"] = {"Silopi", 7515533, "ngf-mad"}

m["xsq"] = {"Makhuwa-Saka", 11008159, "bnt-mak", ancestors = {"vmw"}}

m["xsr"] = {"Sherpa", 36612, "sit-tib", scripts = {"Tibt"}, ancestors = {"xct"}}

m["xss"] = {"Assan", 34089, "qfa-yen", scripts = Latn}

m["xsu"] = {"Sanumá", 251728, "sai-ynm"}

m["xsv"] = {"Sudovian", 35603, "bat", scripts = Latn}

m["xsy"] = {"Saisiyat", 716695, "map", scripts = Latn}

m["xta"] = {"Alcozauca Mixtec", 25559587, "omq-mxt", scripts = Latn}

m["xtb"] = {"Chazumba Mixtec", 12182838, "omq-mxt", scripts = Latn}

m["xtc"] = {"Kadugli", 3407136, "qfa-kad", scripts = Latn}

m["xtd"] = {"Diuxi-Tilantongo Mixtec", 7802048, "omq-mxt", scripts = Latn}

m["xte"] = {"Ketengban", 10990152}

m["xth"] = {"Yitha Yitha", nil}

m["xti"] = {"Sinicahua Mixtec", 12953733, "omq-mxt", scripts = Latn}

m["xtj"] = {"San Juan Teita Mixtec", 32093049, "omq-mxt", scripts = Latn}

m["xtl"] = {"Tijaltepec Mixtec", 12953738, "omq-mxt", scripts = Latn}

m["xtm"] = {"Magdalena Peñasco Mixtec", 7179700, "omq-mxt", scripts = Latn}

m["xtn"] = {"Northern Tlaxiaco Mixtec", 25559585, "omq-mxt", scripts = Latn}

m["xto"] = {
    "Tocharian A",
    2827041,
    "ine-toc",
    scripts = Latn,
    wikipedia_article = "Tocharian languages" -- wikidata id has no associated article
}

m["xtp"] = {"San Miguel Piedras Mixtec", 7414970, "omq-mxt", scripts = Latn}

m["xtq"] = {"Tumshuqese", nil, "xsc-sak", scripts = {"Brah", "Khar"}, translit_module = "Brah-translit"}

m["xtr"] = {"Early Tripuri", nil}

m["xts"] = {"Sindihui Mixtec", 13583581, "omq-mxt", scripts = Latn}

m["xtt"] = {"Tacahua Mixtec", 7673668, "omq-mxt", scripts = Latn}

m["xtu"] = {"Cuyamecalco Mixtec", 12953726, "omq-mxt", scripts = Latn}

m["xtv"] = {"Thawa", 7711494}

m["xtw"] = {"Tawandê", nil, "sai-nmk", scripts = Latn}

m["xty"] = {"Yoloxochitl Mixtec", 8054817, "omq-mxt", scripts = Latn}

m["xtz"] = {"Tasmanian", 530739, scripts = Latn}

m["xua"] = {"Alu Kurumba", 12952679, "dra"}

m["xub"] = {"Betta Kurumba", 16841033, "dra", scripts = {"Knda", "Mlym", "Taml"}}

m["xud"] = {"Umiida", 61999874, "aus-wor", scripts = Latn}

m["xug"] = {"Kunigami", 56558, "jpx-ryu", scripts = {"Jpan"}}

m["xuj"] = {"Jennu Kurumba", 21282543, "dra"}

m["xul"] = {"Ngunawal", 7022712, "aus-yuk", scripts = Latn}

m["xum"] = {"Umbrian", 36957, "itc", scripts = {"Ital", "Latn"}, translit_module = "Ital-translit"}

m["xun"] = {"Unggaranggu", 61999823, "aus-wor", scripts = Latn}

m["xuo"] = {"Kuo", 6445233, "alv-mbm"}

m["xup"] = {"Upper Umpqua", 20607, "ath-pco", scripts = Latn}

m["xur"] = {"Urartian", 36934, "qfa-hur", scripts = {"Xsux"}}

m["xut"] = {"Kuthant", 6448417}

m["xuu"] = {"Khwe", 28305, "khi-kal", scripts = Latn}

m["xve"] = {"Venetic", 36871, "ine", scripts = {"Ital"}, translit_module = "Ital-translit"}

-- m["xvi"] = { "Kamviri", 1193495, "nur-nor", scripts = {"Arab"} } moved to etym-only code

m["xvn"] = {"Vandalic", 36835, "gme", scripts = Latn}

m["xvo"] = {"Volscian", 622110, "itc", scripts = Latn}

m["xvs"] = {"Vestinian", 2576407, "itc", scripts = Latn}

m["xwa"] = {"Kwaza", 3200839}

m["xwc"] = {"Woccon", 3569569, "nai-cat", scripts = Latn}

m["xwd"] = {"Wadi Wadi", 7959249}

m["xwe"] = {"Xwela Gbe", 36887, "alv-pph"}

m["xwg"] = {"Kwegu", 56723, "sdv"}

m["xwj"] = {"Wajuk", 33110188}

m["xwk"] = {"Wangkumara", 7967891, "aus-pam", scripts = Latn}

m["xwl"] = {"Western Xwla Gbe", 36924, "alv-pph", scripts = Latn}

m["xwo"] = {"Written Oirat", 56959, "xgn", translit_module = "xwo-translit", scripts = {"Mong"}}

m["xwr"] = {"Kwerba Mamberamo", 6450325, "paa-tkw"}

m["xww"] = {"Wemba-Wemba", 18472819, "aus-pam", scripts = Latn}

m["xxb"] = {"Boro", 16844787, scripts = Latn}

m["xxk"] = {"Ke'o", 3195346}

m["xxm"] = {"Minkin", 6867836}

m["xxr"] = {"Koropó", 6432560}

m["xxt"] = {"Tambora", 36711, "paa", scripts = Latn}

m["xya"] = {"Yaygir", 8050525, "aus-pam"}

m["xyb"] = {"Yandjibara", nil, scripts = Latn}

m["xyl"] = {"Yalakalore", 12645352, "sai-nmk", scripts = Latn}

m["xyt"] = {"Mayi-Thakurti", 47004719, "aus-pam", scripts = Latn}

m["xyy"] = {"Yorta Yorta", 8055849, "aus-pam", scripts = Latn}

m["xzh"] = {"Zhang-Zhung", 3437292, "sit-alm", scripts = {"xzh-Tibt", "Marc"}}

m["xzm"] = {"Zemgalian", 47631, "bat"}

m["xzp"] = {"Ancient Zapotec", nil}

return m
