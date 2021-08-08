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

-- Use these in "scripts" to save a little memory.
local Arab = {"Arab"}
local Cyrl = {"Cyrl"}
local Deva = {"Deva"}
local Latn = {"Latn"}

local m = {}

m["baa"] = {"Babatana", 2877785, "poz-ocw", scripts = Latn}

m["bab"] = {"Bainouk-Gunyuño", 35508, "alv-bny", scripts = Latn}

m["bac"] = {"Badui", 3449885, "poz-msa", scripts = Latn}

m["bae"] = {"Baré", 3504087, "awd", scripts = Latn}

m["baf"] = {"Nubaca", 36270, "nic-ymb", scripts = Latn}

m["bag"] = {"Tuki", 36621, "nic-mba", scripts = Latn}

m["bah"] = {"Bahamian Creole", 2669229, "crp", scripts = Latn, ancestors = {"en"}}

m["baj"] = {"Barakai", 3502030, "poz-cet", scripts = Latn}

m["bal"] = {"Baluchi", 33049, "ira-nwi", scripts = {"fa-Arab"}}

m["ban"] = {"Balinese", 33070, "poz-mcm", scripts = {"Latn", "Bali"}}

m["bao"] = {"Waimaha", 2883738, "sai-tuc", scripts = Latn}

m["bap"] = {"Bantawa", 56500, "sit-kic", scripts = Deva}

m["bar"] = {"Bavarian", 29540, "gmw", scripts = Latn, ancestors = {"gmh"}}

m["bas"] = {"Basaa", 33093, "bnt-bsa", scripts = Latn}

m["bau"] = {"Badanchi", 11001650, "nic-jrw", scripts = Latn}

m["bav"] = {"Babungo", 34885, "nic-rnn", scripts = Latn}

m["baw"] = {"Bambili-Bambui", 34880, "nic-nge", scripts = Latn}

m["bax"] = {"Bamum", 35280, "nic-nun", scripts = {"Latn", "Bamu"}}

m["bay"] = {"Batuley", 8828787, "poz", scripts = Latn}

m["bba"] = {"Baatonum", 34889, "alv-sav", scripts = Latn}

m["bbb"] = {"Barai", 4858206, "ngf", scripts = Latn}

m["bbc"] = {"Toba Batak", 33017, "btk", scripts = {"Latn", "Batk"}}

m["bbd"] = {"Bau", 4873415, "ngf-mad", scripts = Latn}

m["bbe"] = {"Bangba", 34895, "nic-nke", scripts = Latn}

m["bbf"] = {"Baibai", 56902, "paa", scripts = Latn}

m["bbg"] = {"Barama", 34884, "bnt-sir", scripts = Latn}

m["bbh"] = {"Bugan", 3033554, "mkh-pkn", scripts = Latn}

m["bbi"] = {"Barombi", 34985, "bnt-bsa", scripts = Latn}

m["bbj"] = {"Ghomala'", 35271, "bai", scripts = Latn}

m["bbk"] = {"Babanki", 34790, "nic-rnc", scripts = Latn}

m["bbl"] = {"Bats", 33259, "cau-nkh", scripts = {"Geor"}, translit_module = "Geor-translit", entry_name = {from = {"̃", "<sup>ნ</sup>", MACRON, BREVE}, to = {"", "ნ"}}}

m["bbm"] = { -- name includes prefix
    "Babango",
    34819,
    "bnt-bta",
    scripts = Latn
}

m["bbn"] = {"Uneapa", 7884126, "poz-ocw", scripts = Latn}

m["bbo"] = {"Konabéré", 35371, "dmn-snb", scripts = Latn}

m["bbp"] = {"West Central Banda", 7984377, "bad", scripts = Latn}

m["bbq"] = {"Bamali", 34901, "nic-nun", scripts = Latn}

m["bbr"] = {"Girawa", 5564185, "ngf-mad", scripts = Latn}

m["bbs"] = {"Bakpinka", 3515061, "nic-ucr", scripts = Latn}

m["bbt"] = {"Mburku", 3441324, "cdc-wst", scripts = Latn}

m["bbu"] = {"Bakulung", 35580, "nic-jrn", scripts = Latn}

m["bbv"] = {"Karnai", 6372803, "poz-ocw", scripts = Latn}

m["bbw"] = {"Baba", 34822, "nic-nun", scripts = Latn}

m["bbx"] = { -- cf bvb
    "Bubia",
    34953,
    "nic-bds",
    ancestors = {"bvb"},
    scripts = Latn
}

m["bby"] = {"Befang", 34960, "nic-bds", scripts = Latn}

m["bca"] = {"Central Bai", 12628803, "zhx-gba", scripts = {"Hani", "Latn"}}

m["bcb"] = {"Bainouk-Samik", 36390, "alv-bny", scripts = Latn}

m["bcd"] = {"North Babar", 7054041, "poz-tim", scripts = Latn}

m["bce"] = {"Bamenyam", 34968, "nic-nun", scripts = Latn}

m["bcf"] = {"Bamu", 3503788, "paa-kiw", scripts = Latn}

m["bcg"] = {"Baga Pokur", 31172660, "alv-nal", scripts = Latn}

m["bch"] = {"Bariai", 2884502, "poz-ocw", scripts = Latn}

m["bci"] = {"Baoule", 35107, "alv-ctn", scripts = Latn}

m["bcj"] = {"Bardi", 3913852, "aus-nyu", scripts = Latn}

m["bck"] = {"Bunaba", 580923, "aus-bub", scripts = Latn}

m["bcl"] = {"Bikol Central", 33284, "phi", scripts = Latn}

m["bcm"] = {"Banoni", 2882857, "poz-ocw", scripts = Latn}

m["bcn"] = {"Bibaali", 34892, "alv-mye", scripts = Latn}

m["bco"] = {"Kaluli", 6354586, "ngf", scripts = Latn}

m["bcp"] = {"Bali", 3515074, "bnt-kbi", scripts = Latn}

m["bcq"] = {"Bench", 35108, "omv", scripts = Latn}

m["bcr"] = {"Babine-Witsuwit'en", 27864, "ath-nor", scripts = Latn}

m["bcs"] = {"Kohumono", 35590, "nic-ucn", scripts = Latn}

m["bct"] = {"Bendi", 8836662, "csu-mle", scripts = Latn}

m["bcu"] = {"Biliau", 2874658, "poz-ocw", scripts = Latn}

m["bcv"] = {"Shoo-Minda-Nye", 36548, "nic-jkn", scripts = Latn}

m["bcw"] = {"Bana", 56272, "cdc-cbm", scripts = Latn}

m["bcy"] = {"Bacama", 56274, "cdc-cbm", scripts = Latn}

m["bcz"] = {"Bainouk-Gunyaamolo", 35506, "alv-bny", scripts = Latn}

m["bda"] = {"Bayot", 35019, "alv-jol", scripts = Latn}

m["bdb"] = {"Basap", 3504208, "poz-bnn", scripts = Latn}

m["bdc"] = {"Emberá-Baudó", 11173166, "sai-chc", scripts = Latn}

m["bdd"] = {"Bunama", 4997416, "poz-ocw", scripts = Latn}

m["bde"] = {"Bade", 56239, "cdc-wst", scripts = Latn}

m["bdf"] = {"Biage", 48037487, "ngf", scripts = Latn}

m["bdg"] = {"Bonggi", 2910053, "poz-bnn", scripts = Latn}

m["bdh"] = {"Tara Baka", 2880165, "csu-bbk", scripts = Latn}

m["bdi"] = {"Burun", 35040, "sdv-niw", scripts = Latn}

m["bdj"] = {"Bai", 34894, "nic-ser", scripts = Latn}

m["bdk"] = {"Budukh", 35397, "cau-lzg", translit_module = "bdk-translit", override_translit = true, scripts = Cyrl, entry_name = {from = {GRAVE, ACUTE}, to = {}}}

m["bdl"] = {"Indonesian Bajau", 2880038, "poz", scripts = Latn}

m["bdm"] = {"Buduma", 56287, "cdc-cbm", scripts = Latn}

m["bdn"] = {"Baldemu", 56280, "cdc-cbm", scripts = Latn}

m["bdo"] = {"Morom", 759770, "csu-bgr", scripts = Latn}

m["bdp"] = {"Bende", 8836490, "bnt", scripts = Latn}

m["bdq"] = {"Bahnar", 32924, "mkh-ban", scripts = Latn, ancestors = {"mkh-ban-pro"}}

m["bdr"] = {"West Coast Bajau", 2880037, "poz-sbj", scripts = Latn}

m["bds"] = {"Burunge", 56617, "cus", scripts = Latn}

m["bdt"] = {"Bokoto", 4938812, "alv-gbw", scripts = Latn}

m["bdu"] = {"Oroko", 36278, "bnt-saw", scripts = Latn}

m["bdv"] = {"Bodo Parja", 8845881, "inc-eas", scripts = {"Orya"}, ancestors = {"inc-mgd"}}

m["bdw"] = {"Baham", 3513309, "paa", scripts = Latn}

m["bdx"] = {"Budong-Budong", 4985158, "poz-ssw", scripts = Latn}

m["bdy"] = {"Bandjalang", 2980386, "aus-pam", scripts = Latn}

m["bdz"] = {"Badeshi", 33028, "inc-wes", ancestors = {"noe"}}

m["bea"] = {"Beaver", 20826, "ath-nor", scripts = Latn}

m["beb"] = {"Bebele", 34976, "bnt-btb", scripts = Latn}

m["bec"] = {"Iceve-Maci", 35449, "nic-tvc", scripts = Latn}

m["bed"] = {"Bedoanas", 4879330, "poz-hce", scripts = Latn}

m["bee"] = {"Byangsi", 56904, "sit-alm", scripts = Deva}

m["bef"] = {"Benabena", 2895638, "paa-kag", scripts = Latn}

m["beg"] = {"Belait", 2894198, "poz-swa", scripts = Latn}

m["beh"] = {"Biali", 34961, "nic-eov", scripts = Latn}

m["bei"] = {"Bekati'", 3441683, "day", scripts = Latn}

m["bej"] = {"Beja", 33025, "cus", scripts = {"Arab", "Latn"}}

m["bek"] = {"Bebeli", 4878430, "poz-ocw", scripts = Latn}

m["bem"] = {"Bemba", 33052, "bnt-sbi", scripts = Latn}

m["beo"] = {"Beami", 3504079, "paa", scripts = Latn}

m["bep"] = {"Besoa", 8840465, "poz-kal", scripts = Latn}

m["beq"] = {"Beembe", 3196320, "bnt-kng", scripts = Latn}

m["bes"] = {"Besme", 289832, "alv-kim", scripts = Latn}

m["bet"] = {"Guiberoua Bété", 11019185, "kro-bet", scripts = Latn}

m["beu"] = {"Blagar", 4923846, "ngf", scripts = Latn}

m["bev"] = {"Daloa Bété", 11155819, "kro-bet", scripts = Latn}

m["bew"] = {"Betawi", 33014, "crp", scripts = Latn, ancestors = {"ms"}}

m["bex"] = {"Jur Modo", 56682, "csu-bbk", scripts = Latn}

m["bey"] = {"Akuwagel", 3504170, "qfa-tor", scripts = Latn}

m["bez"] = {"Kibena", 2502949, "bnt-bki", scripts = Latn}

m["bfa"] = {"Bari", 35042, "sdv-bri", scripts = Latn}

m["bfb"] = {"Pauri Bareli", 7155462, "inc-bhi", scripts = Deva}

m["bfc"] = {"Northern Bai", 12642165, "zhx-gba", scripts = {"Hani", "Latn"}}

m["bfd"] = {"Bafut", 34888, "nic-nge", scripts = Latn}

m["bfe"] = {"Betaf", 4897329, "paa-tkw", scripts = Latn}

m["bff"] = {"Bofi", 34914, "alv-gbf", scripts = Latn}

m["bfg"] = {"Busang Kayan", 9231909, "poz", scripts = Latn}

m["bfh"] = {"Blafe", 12628007, "paa", scripts = Latn}

m["bfi"] = {
    "British Sign Language",
    33000,
    "sgn",
    scripts = Latn -- when documented
}

m["bfj"] = {"Bafanji", 34890, "nic-nun", scripts = Latn}

m["bfk"] = {"Ban Khor Sign Language", 3441103, "sgn"}

m["bfl"] = {"Banda-Ndélé", 34850, "bad-cnt", scripts = Latn}

m["bfm"] = {"Mmen", 36132, "nic-rnc", scripts = Latn}

m["bfn"] = {"Bunak", 35101, "ngf", scripts = Latn}

m["bfo"] = {"Malba Birifor", 11150710, "nic-mre", scripts = Latn}

m["bfp"] = {"Beba", 35050, "nic-nge", scripts = Latn}

m["bfq"] = {"Badaga", 33205, "dra", scripts = {"Knda"}}

m["bfr"] = {"Bazigar", 8829558, "dra"}

m["bfs"] = {"Southern Bai", 12952250, "zhx-gba", scripts = {"Hani", "Latn"}}

m["bft"] = {"Balti", 33086, "sit-lab", scripts = {"Arab", "Tibt"}}

m["bfu"] = {"Gahri", 5516952, "sit-whm", scripts = {"Takr", "Tibt"}}

m["bfw"] = {"Bondo", 2567942, "mun", scripts = {"Orya"}}

m["bfx"] = {"Bantayanon", 16837866, "phi", scripts = Latn}

m["bfy"] = {"Bagheli", 2356364, "inc-hie", scripts = Deva, ancestors = {"inc-pra"}, translit_module = "hi-translit"}

m["bfz"] = {"Mahasu Pahari", 6733460, "him", scripts = Deva, translit_module = "hi-translit"}

m["bga"] = {"Gwamhi-Wuri", 6707102, "nic-knn", scripts = Latn}

m["bgb"] = {"Bobongko", 4935896, "poz-slb", scripts = Latn}

m["bgc"] = {"Haryanvi", 33410, "inc-cen", scripts = Deva, ancestors = {"inc-ohi"}, translit_module = "hi-translit"}

m["bgd"] = {"Rathwi Bareli", 7295692, "inc-bhi", scripts = Deva}

m["bge"] = {"Bauria", 4873579, "inc-bhi", scripts = Deva}

m["bgf"] = {"Bangandu", 34938, "alv-gbs", scripts = Latn}

m["bgg"] = {"Bugun", 3514220, "sit-khb", scripts = Latn}

m["bgi"] = {"Giangan", 4842057, "phi", scripts = Latn}

m["bgj"] = {"Bangolan", 34862, "nic-nun", scripts = Latn}

m["bgk"] = {
    "Bit",
    2904868,
    "mkh-pal",
    scripts = Latn -- also Hani?
}

m["bgl"] = {"Bo", 8845514, "mkh-vie"}

m["bgo"] = {"Baga Koga", 35695, "alv-bag", scripts = Latn}

m["bgq"] = {"Bagri", 2426319, "inc-wes", scripts = Deva, ancestors = {"raj"}}

m["bgr"] = {"Bawm Chin", 56765, "tbq-kuk", scripts = Latn}

m["bgs"] = {"Tagabawa", 7675121, "mno", scripts = Latn}

m["bgt"] = {"Bughotu", 2927723, "poz-sls", scripts = Latn}

m["bgu"] = {"Mbongno", 36141, "nic-mmb", scripts = Latn}

m["bgv"] = {"Warkay-Bipim", 4915439, "ngf", scripts = Latn}

m["bgw"] = {"Bhatri", 8841054, "inc-eas", scripts = Deva, ancestors = {"inc-mgd"}}

m["bgx"] = {"Balkan Gagauz Turkish", 2360396, "trk-ogz", scripts = Latn, ancestors = {"trk-oat"}}

m["bgy"] = {"Benggoi", 4887742, "poz-cma", scripts = Latn}

m["bgz"] = {"Banggai", 3441692, "poz-slb", scripts = Latn}

m["bha"] = {"Bharia", 4901287, "dra", scripts = Deva}

m["bhb"] = {"Bhili", 33229, "inc-bhi", scripts = Deva}

m["bhc"] = {"Biga", 2902375, "poz-hce", scripts = Latn}

m["bhd"] = {"Bhadrawahi", 4900565, "him", scripts = {"Arab", "Deva"}, translit_module = "hi-translit"}

m["bhe"] = {"Bhaya", 8841168, "inc-wes", ancestors = {"raj"}}

m["bhf"] = {"Odiai", 56690, "paa-kwm", scripts = Latn}

m["bhg"] = {"Binandere", 3503802, "ngf", scripts = Latn}

m["bhh"] = {"Bukhari", 56469, "ira-swi", scripts = {"Cyrl", "Hebr", "Latn", "fa-Arab"}, ancestors = {"tg"}}

m["bhi"] = {"Bhilali", 4901729, "inc-bhi", scripts = Deva}

m["bhj"] = {"Bahing", 56442, "sit-kiw", scripts = {"Deva", "Latn"}}

m["bhl"] = {"Bimin", 4913743, "ngf-okk", scripts = Latn}

m["bhm"] = {"Bathari", 2586893, "sem-sar", scripts = {"Arab", "Latn"}}

m["bhn"] = {"Bohtan Neo-Aramaic", 33230, "sem-nna"}

m["bho"] = {"Bhojpuri", 33268, "inc-hie", scripts = {"Deva", "Kthi"}, ancestors = {"bh"}, translit_module = "translit-redirect"}

m["bhp"] = {"Bima", 2796873, "poz-cet", scripts = Latn}

m["bhq"] = {"Tukang Besi South", 12643975, "poz-mun", scripts = Latn}

m["bhs"] = {"Buwal", 3515065, "cdc-cbm", scripts = Latn}

m["bht"] = {"Bhattiyali", 4901452, "him", scripts = Deva}

m["bhu"] = {"Bhunjia", 8841766, "inc-eas", scripts = {"Deva", "Orya"}, ancestors = {"inc-mgd"}}

m["bhv"] = {"Bahau", 3502039, "poz", scripts = Latn}

m["bhw"] = {"Biak", 1961488, "poz-hce", scripts = Latn}

m["bhx"] = { -- spurious?
    "Bhalay", 8840773, "inc"
}

m["bhy"] = {"Bhele", 4901671, "bnt-kbi", scripts = Latn}

m["bhz"] = {"Bada", 4840520, "poz-kal", scripts = Latn}

m["bia"] = {"Badimaya", 3442745, "aus-psw", scripts = Latn}

m["bib"] = {"Bissa", 32934, "dmn-bbu", scripts = Latn}

m["bic"] = {"Bikaru", 56342, "paa-eng", scripts = Latn}

m["bid"] = {"Bidiyo", 56258, "cdc-est", scripts = Latn}

m["bie"] = {"Bepour", 4890914, "ngf-mad", scripts = Latn}

m["bif"] = {"Biafada", 35099, "alv-ten", scripts = Latn}

m["big"] = {"Biangai", 8842027, "paa", scripts = Latn}

m["bij"] = {"Kwanka", 35598, "nic-tar", scripts = Latn}

m["bil"] = {"Bile", 34987, "nic-jrn", scripts = Latn}

m["bim"] = {"Bimoba", 34971, "nic-grm", scripts = Latn}

m["bin"] = {"Edo", 35375, "alv-eeo", scripts = Latn}

m["bio"] = {"Nai", 3508074, "paa-kwm", scripts = Latn}

m["bip"] = {"Bila", 2902626, "bnt-kbi", scripts = Latn}

m["biq"] = {"Bipi", 2904312, "poz-aay", scripts = Latn}

m["bir"] = {"Bisorio", 8844749, "paa-eng", scripts = Latn}

m["bit"] = {"Berinomo", 56447, "paa-spk", scripts = Latn}

m["biu"] = {"Biete", 4904687, "tbq-kuk", scripts = Latn}

m["biv"] = {"Southern Birifor", 32859745, "nic-mre", scripts = Latn}

m["biw"] = {"Kol (Cameroon)", 35582, "bnt-mka", scripts = Latn}

m["bix"] = {"Bijori", 3450686, "mun", scripts = Deva}

m["biy"] = {"Birhor", 3450469, "mun", scripts = Deva}

m["biz"] = {"Baloi", 3450590, "bnt-ngn", scripts = Latn}

m["bja"] = {"Budza", 3046889, "bnt-bun", scripts = Latn}

m["bjb"] = {"Barngarla", 3439071, "aus-pam", scripts = Latn}

m["bjc"] = {"Bariji", 4690919, "ngf", scripts = Latn}

m["bje"] = {"Biao-Jiao Mien", 3503800, "hmx-mie", scripts = {"Hani", "Latn"}}

m["bjf"] = {
    "Barzani Jewish Neo-Aramaic",
    33234,
    "sem-nna",
    scripts = {"Hebr"} -- maybe others
}

m["bjg"] = {"Bidyogo", 35365, "alv-bak", scripts = Latn}

m["bjh"] = {"Bahinemo", 56361, "paa-spk", scripts = Latn}

m["bji"] = {"Burji", 34999, "cus", scripts = {"Latn", "Ethi"}}

m["bjj"] = {"Kannauji", 2726867, "inc-cen", scripts = Deva, ancestors = {"inc-ohi"}}

m["bjk"] = {"Barok", 2884743, "poz-ocw", scripts = Latn}

m["bjl"] = {"Bulu (New Guinea)", 4997162, "poz-ocw", scripts = Latn}

m["bjm"] = {"Bajelani", 4848866, "ira-zgr", scripts = {"Latn", "Arab"}, ancestors = {"hac"}}

m["bjn"] = {"Banjarese", 33151, "poz-mly", scripts = {"Latn", "Arab"}}

m["bjo"] = {"Mid-Southern Banda", 42303990, "bad-cnt", scripts = Latn}

m["bjp"] = {"Fanamaket", nil, "poz-oce", scripts = Latn}

m["bjr"] = {"Binumarien", 538364, "paa-kag", scripts = Latn}

m["bjs"] = {"Bajan", 2524014, "crp", scripts = Latn, ancestors = {"en"}}

m["bjt"] = {"Balanta-Ganja", 19359034, "alv-bak", scripts = {"Arab", "Latn"}}

m["bju"] = {"Busuu", 35046, "nic-fru", scripts = Latn}

m["bjv"] = {"Bedjond", 8829831, "csu-sar", scripts = Latn}

m["bjw"] = {"Bakwé", 34899, "kro-ekr", scripts = Latn}

m["bjx"] = {"Banao Itneg", 12627559, "phi", scripts = Latn}

m["bjy"] = {"Bayali", 4874263, "aus-pam", scripts = Latn}

m["bjz"] = {"Baruga", 2886189, "ngf", scripts = Latn}

m["bka"] = {"Kyak", 35653, "alv-bwj", scripts = Latn}

m["bkc"] = {"Baka", 34905, "nic-nkb", scripts = Latn}

m["bkd"] = {"Binukid", 4914553, "mno", scripts = Latn}

m["bkf"] = {"Beeke", 3441375, "bnt-kbi", scripts = Latn}

m["bkg"] = {"Buraka", 35066, "nic-nkg", scripts = Latn}

m["bkh"] = {"Bakoko", 34866, "bnt-bsa", scripts = Latn}

m["bki"] = {"Baki", 11024697, "poz-vnc", scripts = Latn}

m["bkj"] = {"Pande", 36263, "bnt-ngn", scripts = Latn}

m["bkk"] = { -- written in Balti script
    "Brokskat", 2925988, "inc-dar"
}

m["bkl"] = {"Berik", 378743, "paa-tkw", scripts = Latn}

m["bkm"] = {"Kom (Cameroon)", 1656595, "nic-rnc", scripts = Latn}

m["bkn"] = {"Bukitan", 3446774, "poz-bnn", scripts = Latn}

m["bko"] = {"Kwa'", 35567, "bai", scripts = Latn}

m["bkp"] = {"Iboko", 35089, "bnt-ngn", scripts = Latn}

m["bkq"] = {"Bakairí", 56846, "sai-car", scripts = Latn}

m["bkr"] = {"Bakumpai", 3436626, "poz-brw", scripts = Latn}

m["bks"] = {"Masbate Sorsogon", 16113356, "phi", scripts = Latn}

m["bkt"] = {"Boloki", 4144560, "bnt-zbi", ancestors = {"lse"}, scripts = Latn}

m["bku"] = {"Buhid", 1002956, "phi", scripts = {"Buhd"}}

m["bkv"] = {"Bekwarra", 34954, "nic-ben", scripts = Latn}

m["bkw"] = {"Bekwel", 34950, "bnt-bek", scripts = Latn}

m["bkx"] = {"Baikeno", 11200640, "poz-tim", scripts = Latn}

m["bky"] = {"Bokyi", 35087, "nic-ben", scripts = Latn}

m["bkz"] = {"Bungku", 2928207, "poz-btk", scripts = Latn}

m["bla"] = {"Blackfoot", 33060, "alg", scripts = {"Latn", "Cans"}}

m["blb"] = {"Bilua", 35003, "ngf", scripts = Latn}

m["blc"] = {"Bella Coola", 977808, "sal", scripts = Latn}

m["bld"] = {"Bolango", 3450578, "phi", scripts = Latn}

m["ble"] = {"Balanta-Kentohe", 56789, "alv-bak", scripts = Latn}

m["blf"] = {"Buol", 2928278, "phi", scripts = Latn}

m["blg"] = {"Balau", 4850134, "poz-mly", scripts = Latn}

m["blh"] = {"Kuwaa", 35579, "kro", scripts = Latn}

m["bli"] = {"Bolia", 34910, "bnt-mon", scripts = Latn}

m["blj"] = {"Bolongan", 9229310, "poz", scripts = Latn}

m["blk"] = {"Pa'o Karen", 7121294, "kar", scripts = {"Mymr"}}

m["bll"] = {"Biloxi", 2903780, "sio-ohv", scripts = Latn}

m["blm"] = {"Beli", 56821, "csu-bbk", scripts = Latn}

m["bln"] = {"Southern Catanduanes Bicolano", 7569754, "phi", scripts = Latn}

m["blo"] = {"Anii", 34838, "alv-ntg", scripts = Latn}

m["blp"] = {"Blablanga", 2905245, "poz-ocw", scripts = Latn}

m["blq"] = {"Baluan-Pam", 2881675, "poz-aay", scripts = Latn}

m["blr"] = {"Blang", 4925096, "mkh-pal", scripts = {"Latn", "Tale", "Lana", "Thai"}, sort_key = {from = {"[%pᪧๆ]", "[᩠ᩳ-᩿]", "ᩔ", "ᩕ", "ᩖ", "ᩘ", "([ᨭ-ᨱ])ᩛ", "([ᨷ-ᨾ])ᩛ", "ᩤ", "[็-๎]", "([เแโใไ])([ก-ฮ])"}, to = {"", "", "ᩈᩈ", "ᩁ", "ᩃ", "ᨦ", "%1ᨮ", "%1ᨻ", "ᩣ", "", "%2%1"}}}

m["bls"] = {"Balaesang", 4849796, "poz", scripts = Latn}

m["blt"] = {
    "Tai Dam",
    56407,
    "tai-swe",
    scripts = {"Tavt", "Latn"},
    -- translit_module = "Tavt-translit",
    sort_key = {from = {"[꪿ꫀ꫁ꫂ]", "([ꪵꪶꪹꪻꪼ])([ꪀ-ꪯ])"}, to = {"", "%2%1"}}
}

m["blv"] = {"Kibala", 4939959, "bnt-kmb", scripts = Latn}

m["blw"] = {"Balangao", 4850033, "phi", scripts = Latn}

m["blx"] = {"Mag-Indi Ayta", 1931221, "phi", scripts = Latn}

m["bly"] = {"Notre", 11009194, "nic-wov", scripts = Latn}

m["blz"] = {"Balantak", 4850053, "poz-slb", scripts = Latn}

m["bma"] = {"Lame", 3913997, "nic-jrn", scripts = Latn}

m["bmb"] = {"Bembe", 4885023, "bnt-lgb", scripts = Latn}

m["bmc"] = {"Biem", 4904523, "poz-ocw", scripts = Latn}

m["bmd"] = {"Baga Manduri", 35815, "alv-bag", scripts = Latn}

m["bme"] = {"Limassa", 11004666, "nic-nkb", scripts = Latn}

m["bmf"] = {"Bom", 35088, "alv-mel", scripts = Latn}

m["bmg"] = {"Bamwe", 34867, "bnt-bun", scripts = Latn}

m["bmh"] = {"Kein", 6383764, "ngf-mad", scripts = Latn}

m["bmi"] = {"Bagirmi", 34903, "csu-bgr", scripts = Latn}

m["bmj"] = {"Bote-Majhi", 9229570, "inc-eas", scripts = Deva, ancestors = {"bh"}}

m["bmk"] = {"Ghayavi", 5555976, "poz-ocw", scripts = Latn}

m["bml"] = {"Bomboli", 35055, "bnt-ngn", scripts = Latn}

m["bmn"] = {"Bina", 8843664, "poz-ocw", scripts = Latn}

m["bmo"] = {"Bambalang", 34868, "nic-nun", scripts = Latn}

m["bmp"] = {"Bulgebi", 4996380, "ngf-fin", scripts = Latn}

m["bmq"] = {"Bomu", 35065, "nic-bwa", scripts = Latn}

m["bmr"] = {"Muinane", 3027894, "sai-bor", scripts = Latn}

m["bmt"] = {"Biao Mon", 8842159, "hmx-mie"}

m["bmu"] = {"Somba-Siawari", 5000983, "ngf", scripts = Latn}

m["bmv"] = {"Bum", 35058, "nic-rnc", scripts = Latn}

m["bmw"] = {"Bomwali", 34984, "bnt-ndb", scripts = Latn}

m["bmx"] = {"Baimak", 3450546, "ngf-mad", scripts = Latn}

m["bmz"] = {"Baramu", 4858315, "ngf", scripts = Latn}

m["bna"] = {"Bonerate", 4941729, "poz-mun", scripts = Latn}

m["bnb"] = {"Bookan", 4943150, "poz-san", scripts = Latn}

m["bnd"] = {"Banda", 3504147, "poz-cma", scripts = Latn}

m["bne"] = {"Bintauna", 4914533, "phi", scripts = Latn}

m["bnf"] = {"Masiwang", 6783305, "poz-cma", scripts = Latn}

m["bng"] = {"Benga", 34952, "bnt-saw", scripts = Latn}

m["bni"] = {"Bangi", 34936, "bnt-bmo", scripts = Latn}

m["bnj"] = {"Eastern Tawbuid", 18757427, "phi", scripts = Latn}

m["bnk"] = {"Bierebo", 2902029, "poz-vnc", scripts = Latn}

m["bnl"] = {"Boon", 56616, "cus", scripts = Latn}

m["bnm"] = {"Batanga", 34979, "bnt-saw", scripts = Latn}

m["bnn"] = {"Bunun", 56505, "map", scripts = Latn}

m["bno"] = {"Asi", 29490, "phi", scripts = Latn}

m["bnp"] = {"Bola", 4938876, "poz-ocw", scripts = Latn}

m["bnq"] = {"Bantik", 2883521, "poz", scripts = Latn}

m["bnr"] = {"Butmas-Tur", 2928942, "poz-vnc", scripts = Latn}

m["bns"] = {"Bundeli", 56399, "inc-cen", scripts = Deva, ancestors = {"inc-ohi"}, translit_module = "hi-translit"}

m["bnu"] = {"Bentong", 4890644, "poz-ssw", scripts = Latn}

m["bnv"] = {"Beneraf", 4941733, "paa-tkw", scripts = Latn}

m["bnw"] = {"Bisis", 56356, "paa-spk", scripts = Latn}

m["bnx"] = {"Bangubangu", 3438330, "bnt-lbn", scripts = Latn}

m["bny"] = {"Bintulu", 3450775, "poz-swa", scripts = Latn}

m["bnz"] = {"Beezen", 35083, "nic-ykb", scripts = Latn}

m["boa"] = {"Bora", 2375468, "sai-bor", scripts = Latn}

m["bob"] = {"Aweer", 56526, "cus", scripts = Latn}

m["boe"] = {"Mundabli", 36127, "nic-beb", scripts = Latn}

m["bof"] = {"Bolon", 3913301, "dmn-emn", scripts = Latn}

m["bog"] = {"Bamako Sign Language", 4853284, "sgn"}

m["boh"] = {"North Boma", 35080, "bnt-bdz", scripts = Latn}

m["boi"] = {"Barbareño", 56391, "nai-chu", scripts = Latn}

m["boj"] = {"Anjam", 3504136, "ngf-mad", scripts = Latn}

m["bok"] = {"Bonjo", 34942, "alv", scripts = Latn}

m["bol"] = {"Bole", 3436680, "cdc-wst", scripts = Latn}

m["bom"] = {"Berom", 35013, "nic-beo", scripts = Latn}

m["bon"] = {"Bine", 4914077, "paa", scripts = Latn}

m["boo"] = {
    "Tiemacèwè Bozo",
    12643582,
    "dmn-snb",
    scripts = Latn -- and others?
}

m["bop"] = {"Bonkiman", 4942134, "ngf-fin", scripts = Latn}

m["boq"] = {"Bogaya", 7207578, "ngf", scripts = Latn}

m["bor"] = {"Borôro", 32986, "sai-mje", scripts = Latn}

m["bot"] = {"Bongo", 2910067, "csu-bbk", scripts = Latn}

m["bou"] = {"Bondei", 4941378, "bnt-seu", scripts = Latn}

m["bov"] = {"Tuwuli", 36974, "alv-ktg", scripts = Latn}

m["bow"] = {"Rema", 7311502, "paa", scripts = Latn}

m["box"] = {"Buamu", 35157, "nic-bwa", scripts = Latn}

m["boy"] = {"Bodo (Central Africa)", 4936715, "bnt-leb", scripts = Latn}

m["boz"] = {"Tiéyaxo Bozo", 32860401, "dmn-snb", scripts = Latn}

m["bpa"] = {"Dakaka", 1157729, "poz-vnc", scripts = Latn}

m["bpd"] = {"Banda-Banda", 3450674, "bad-cnt", scripts = Latn}

m["bpg"] = {"Bonggo", 4941860, "poz-ocw", scripts = Latn}

m["bph"] = {"Botlikh", 56560, "cau-ava", scripts = Cyrl}

m["bpi"] = {"Bagupi", 3450697, "ngf-mad", scripts = Latn}

m["bpj"] = {"Binji", 4914403, "bnt-lbn", scripts = Latn}

m["bpk"] = {"Orowe", 7103905, "poz-cln", scripts = Latn}

m["bpl"] = {"Broome Pearling Lugger Pidgin", 4975277, "crp", scripts = Latn, ancestors = {"ms"}}

m["bpm"] = {"Biyom", 4919327, "ngf-mad", scripts = Latn}

m["bpn"] = {"Dzao Min", 3042189, "hmx-mie"}

m["bpo"] = {"Anasi", 11207813, "paa-egb", scripts = Latn}

m["bpp"] = {"Kaure", 20526532, "paa", scripts = Latn}

m["bpq"] = {"Banda Malay", 12473442, "crp", scripts = Latn, ancestors = {"ms"}}

m["bpr"] = {"Koronadal Blaan", 16115430, "phi", scripts = Latn}

m["bps"] = {"Sarangani Blaan", 16117272, "phi", scripts = Latn}

m["bpt"] = {"Barrow Point", 2567916, "aus-pmn", scripts = Latn}

m["bpu"] = {"Bongu", 4941930, "ngf-mad", scripts = Latn}

m["bpv"] = {"Bian Marind", 8841889, "ngf", scripts = Latn}

m["bpx"] = {"Palya Bareli", 7128872, "inc-bhi", scripts = {"Deva"}, ancestors = {"psu"}, translit_module = "hi-translit"}

m["bpy"] = {"Bishnupriya Manipuri", 37059, "inc-eas", scripts = {"Beng"}, ancestors = {"inc-obn"}}

m["bpz"] = {"Bilba", 8843362, "poz-tim", scripts = Latn}

m["bqa"] = {"Tchumbuli", 11008162, "alv-ctn", ancestors = {"ak"}, scripts = Latn}

m["bqb"] = {"Bagusa", 4842178, "paa-tkw", scripts = Latn}

m["bqc"] = {"Boko", 34983, "dmn-bbu", scripts = Latn}

m["bqd"] = {"Bung", 3436612, "nic-bdn", scripts = Latn}

m["bqf"] = {"Baga Kaloum", 3502293, "alv-bag", scripts = Latn}

m["bqg"] = {"Bago-Kusuntu", 34878, "nic-gne"}

m["bqh"] = {"Baima", 674990, "sit-qia"}

m["bqi"] = {"Bakhtiari", 257829, "ira-swi", scripts = {"fa-Arab"}, ancestors = {"pal"}}

m["bqj"] = {"Bandial", 34872, "alv-jol", scripts = Latn}

m["bqk"] = {"Banda-Mbrès", 3450724, "bad-cnt", scripts = Latn}

m["bql"] = {"Bilakura", 4907504, "ngf-mad", scripts = Latn}

m["bqm"] = {"Wumboko", 37051, "bnt-kpw", scripts = Latn}

m["bqn"] = {"Bulgarian Sign Language", 3438325, "sgn"}

m["bqo"] = {"Balo", 34865, "nic-grs", scripts = Latn}

m["bqp"] = {"Busa", 35185, "dmn-bbu", scripts = Latn}

m["bqq"] = {"Biritai", 56382, "paa-lkp", scripts = Latn}

m["bqr"] = {"Burusu", 5001028, "poz-san", scripts = Latn}

m["bqs"] = {"Bosngun", 56838, "paa", scripts = Latn}

m["bqt"] = {"Bamukumbit", 35078, "nic-nge", scripts = Latn}

m["bqu"] = {"Boguru", 3438444, "bnt-boa", scripts = Latn}

m["bqv"] = {"Begbere-Ejar", 7194098, "nic-plc", scripts = Latn}

m["bqw"] = {"Buru (Nigeria)", 1017152, "nic-bds", scripts = Latn}

m["bqx"] = {"Baangi", 3450648, "nic-kam", scripts = Latn}

m["bqy"] = {"Bengkala Sign Language", 3322119, "sgn"}

m["bqz"] = {"Bakaka", 34855, "bnt-mne", scripts = Latn}

m["bra"] = {"Braj", 35243, "inc-cen", scripts = Deva, ancestors = {"inc-ohi"}, translit_module = "hi-translit"}

m["brb"] = {"Lave", 4957737, "mkh-ban"}

m["brc"] = {"Berbice Creole Dutch", 35215, "crp", scripts = Latn, ancestors = {"nl"}}

m["brd"] = {"Baraamu", 56804, "sit-new", scripts = Deva}

m["brf"] = {"Bera", 2896850, "bnt-kbi", scripts = Latn}

m["brg"] = {"Baure", 2839722, "awd", scripts = Latn}

m["brh"] = {"Brahui", 33202, "dra", scripts = {"Arab", "Latn"}}

m["bri"] = {"Mokpwe", 36428, "bnt-kpw", scripts = Latn}

m["brj"] = {"Bieria", 4904607, "poz-vnc", scripts = Latn}

m["brk"] = {"Birgid", 56823, "nub", scripts = Latn}

m["brl"] = {"Birwa", 3501019, "bnt-sts", scripts = Latn}

m["brm"] = {"Barambu", 34893, "znd", scripts = Latn}

m["brn"] = {"Boruca", 4946773, "cba", scripts = Latn}

m["bro"] = {"Brokkat", 56605, "sit-tib", scripts = {"Tibt", "Latn"}}

m["brp"] = {"Barapasi", 56995, "paa-egb", scripts = Latn}

m["brq"] = {"Breri", 4961835, "paa", scripts = Latn}

m["brr"] = {"Birao", 2904383, "poz-sls", scripts = Latn}

m["brs"] = {"Baras", 8827053, "poz", scripts = Latn}

m["brt"] = {"Bitare", 34946, "nic-tvn", scripts = Latn}

m["bru"] = {"Eastern Bru", 16115463, "mkh-kat", scripts = {"Latn", "Laoo", "Thai"}}

m["brv"] = {"Western Bru", 16113806, "mkh-kat", scripts = {"Latn", "Laoo"}}

m["brw"] = {"Bellari", 4883496, "dra"}

m["brx"] = {"Bodo (India)", 33223, "tbq-bdg", scripts = {"Deva", "Latn"}, translit_module = "brx-translit"}

m["bry"] = {"Burui", 5000976, "paa-spk", scripts = Latn}

m["brz"] = {"Bilbil", 4907473, "poz-ocw", scripts = Latn}

m["bsa"] = {"Abinomn", 56648, "qfa-iso", scripts = Latn}

m["bsb"] = {"Brunei Bisaya", 3450611, "poz-san", scripts = Latn}

m["bsc"] = {"Bassari", 35098, "alv-ten", scripts = Latn}

m["bse"] = {"Wushi", 36973, "nic-rnn", scripts = Latn}

m["bsf"] = {"Bauchi", 34974, "nic-shi", scripts = Latn}

m["bsg"] = {"Bashkardi", 33030, "ira-swi", scripts = {"fa-Arab", "Latn"}}

m["bsh"] = {"Kamkata-viri", 2605045, "nur-nor", ancestors = {"iir-nur-pro"}, scripts = {"Latn", "Arab"}}

m["bsi"] = {"Bassossi", 34940, "bnt-mne", scripts = Latn}

m["bsj"] = {"Bangwinji", 3446631, "alv-wjk", scripts = Latn}

m["bsk"] = {"Burushaski", 216286, "qfa-iso", scripts = Latn}

m["bsl"] = {"Basa-Gumna", 4866150, "nic-bas", scripts = Latn}

m["bsm"] = {"Busami", 5001255, "poz-hce", scripts = Latn}

m["bsn"] = {"Barasana", 2883843, "sai-tuc", scripts = Latn}

m["bso"] = {"Buso", 3441370, "cdc-est", scripts = Latn}

m["bsp"] = {"Baga Sitemu", 36466, "alv-bag", scripts = Latn}

m["bsq"] = {"Bassa", 34949, "kro-wkr", scripts = {"Latn", "Bass"}}

m["bsr"] = {"Bassa-Kontagora", 4866152, "nic-bas", scripts = Latn}

m["bss"] = {"Akoose", 34806, "bnt-mne", scripts = Latn}

m["bst"] = {"Basketo", 56531, "omv-ome", scripts = {"Ethi"}}

m["bsu"] = {"Bahonsuai", 2879298, "poz-btk", scripts = Latn}

m["bsv"] = {"Baga Sobané", 3450433, "alv-bag", scripts = Latn}

m["bsw"] = {"Baiso", 56615, "cus", scripts = Latn}

m["bsx"] = {"Yangkam", 36922, "nic-tar", scripts = Latn}

m["bsy"] = {"Sabah Bisaya", 12641557, "poz-san", scripts = Latn}

m["bta"] = {"Bata", 56254, "cdc-cbm", scripts = Latn}

m["btc"] = {"Bati (Cameroon)", 34944, "nic-mbw", scripts = Latn}

m["btd"] = {"Dairi Batak", 2891045, "btk", scripts = {"Latn", "Batk"}}

m["bte"] = {"Gamo-Ningi", 5520366, "nic-jer", scripts = Latn}

m["btf"] = {"Birgit", 56302, "cdc-est", scripts = Latn}

m["btg"] = {"Gagnoa Bété", 11005602, "kro-bet", scripts = Latn}

m["bth"] = {"Biatah Bidayuh", 2900881, "day", scripts = Latn}

m["bti"] = {"Burate", 56900, "paa-egb", scripts = Latn}

m["btj"] = {"Bacanese Malay", 8828608, "poz-mly", scripts = Latn}

m["btm"] = {"Mandailing Batak", 2891049, "btk", scripts = {"Latn", "Batk"}}

m["btn"] = {"Ratagnon", 13197, "phi", scripts = Latn}

m["bto"] = {"Iriga Bicolano", 12633026, "phi", scripts = Latn}

m["btp"] = {"Budibud", 4985086, "poz-ocw", scripts = Latn}

m["btq"] = {"Batek", 860315, "mkh-asl", scripts = Latn}

m["btr"] = {"Baetora", 2878874, "poz-vnc", scripts = Latn}

m["bts"] = {"Simalungun Batak", 2891054, "btk", scripts = {"Latn", "Batk"}}

m["btt"] = {"Bete-Bendi", 4887064, "nic-ben", scripts = Latn}

m["btu"] = {"Batu", 34964, "nic-tvn", scripts = Latn}

m["btv"] = {"Bateri", 3812564, "inc-dar", scripts = Deva}

m["btw"] = {"Butuanon", 5003156, "phi", scripts = Latn}

m["btx"] = {"Karo Batak", 33012, "btk", scripts = {"Latn", "Batk"}}

m["bty"] = {"Bobot", 3446788, "poz-cma", scripts = Latn}

m["btz"] = {"Alas-Kluet Batak", 2891042, "btk", scripts = {"Latn", "Batk"}}

m["bua"] = {"Buryat", 33120, "xgn", scripts = {"Cyrl", "Mong"}, translit_module = "bua-translit", override_translit = true, wikimedia_codes = {"bxr"}}

m["bub"] = {"Bua", 32928, "alv-bua", scripts = Latn}

m["bud"] = {"Ntcham", 36266, "nic-grm", scripts = Latn}

m["bue"] = {"Beothuk", 56234, scripts = Latn}

m["buf"] = {"Bushoong", 3449964, "bnt-bsh", scripts = Latn}

m["bug"] = {"Buginese", 33190, "poz-ssw", scripts = {"Bugi", "Latn"}}

m["buh"] = {"Younuo Bunu", 56299, "hmn", scripts = Latn}

m["bui"] = {"Bongili", 35084, "bnt-ngn", scripts = Latn}

m["buj"] = {"Basa-Gurmana", 6432515, "nic-bas", scripts = Latn}

m["buk"] = {"Bukawa", 35043, "poz-ocw", scripts = Latn}

m["bum"] = {"Bulu (Cameroon)", 35028, "bnt-btb", scripts = Latn}

m["bun"] = {"Sherbro", 36339, "alv-mel", scripts = Latn}

m["buo"] = {"Terei", 56831, "paa-sbo", scripts = Latn}

m["bup"] = {"Busoa", 5002001, "poz", scripts = Latn}

m["buq"] = {"Brem", 4960502, "ngf", scripts = Latn}

m["bus"] = {"Bokobaru", 9228931, "dmn-bbu", scripts = Latn}

m["but"] = {"Bungain", 3450623, "qfa-tor", scripts = Latn}

m["buu"] = {"Budu", 3450207, "bnt-nya", scripts = Latn}

m["buv"] = {"Bun", 56351, "paa-yua", scripts = Latn}

m["buw"] = {"Bubi", 35017, "bnt-tso", scripts = Latn}

m["bux"] = {"Boghom", 3440412, "cdc-wst", scripts = Latn}

m["buy"] = {"Mmani", 35061, "alv-mel", scripts = Latn}

m["bva"] = {"Barein", 56285, "cdc-est", scripts = Latn}

m["bvb"] = {"Bube", 35110, "nic-bds", scripts = Latn}

m["bvc"] = {"Baelelea", 2878833, "poz-sls", scripts = Latn}

m["bvd"] = {"Baeggu", 2878850, "poz-sls", scripts = Latn}

m["bve"] = {"Berau Malay", 3915770, "poz-mly", scripts = Latn}

m["bvf"] = {"Boor", 56250, "cdc-est", scripts = Latn}

m["bvg"] = {"Bonkeng", 34958, "bnt-bbo", scripts = Latn}

m["bvh"] = {"Bure", 56294, "cdc-wst", scripts = Latn}

m["bvi"] = {"Belanda Viri", 35247, "nic-ser", scripts = Latn}

m["bvj"] = {"Baan", 3515067, "nic-ogo", scripts = Latn}

m["bvk"] = {"Bukat", 4986814, "poz-bnn", scripts = Latn}

m["bvl"] = {
    "Bolivian Sign Language",
    1783590,
    "sgn",
    scripts = Latn -- when documented
}

m["bvm"] = {"Bamunka", 34882, "nic-rnn", scripts = Latn}

m["bvn"] = {"Buna", 3450516, "qfa-tor", scripts = Latn}

m["bvo"] = {"Bolgo", 35038, "alv-bua", scripts = Latn}

m["bvp"] = {"Bumang", 4997235, "mkh-pal"}

m["bvq"] = {"Birri", 56514, "csu-bkr", scripts = Latn}

m["bvr"] = {"Burarra", 4998124, "aus-arn", scripts = Latn}

m["bvt"] = {"Bati (Indonesia)", 4869253, "poz-cma", scripts = Latn}

m["bvu"] = {"Bukit Malay", 9230148, "poz-mly", scripts = Latn}

m["bvv"] = {"Baniva", 3515198, "awd", scripts = Latn}

m["bvw"] = {"Boga", 56262, "cdc-cbm", scripts = Latn}

m["bvx"] = {"Babole", 35180, "bnt-ngn", scripts = Latn}

m["bvy"] = {"Baybayanon", 16839275, "phi", scripts = Latn}

m["bvz"] = {"Bauzi", 56360, "paa-egb", scripts = Latn}

m["bwa"] = {"Bwatoo", 9232446, "poz-cln", scripts = Latn}

m["bwb"] = {"Namosi-Naitasiri-Serua", 3130290, "poz-occ", scripts = Latn}

m["bwc"] = {"Bwile", 3447440, "bnt-sbi", scripts = Latn}

m["bwd"] = {"Bwaidoka", 2929111, "poz-ocw", scripts = Latn}

m["bwe"] = {"Bwe Karen", 56994, "kar"}

m["bwf"] = {"Boselewa", 4947229, "poz-ocw", scripts = Latn}

m["bwg"] = {"Barwe", 8826802, "bnt-sna", scripts = Latn}

m["bwh"] = {"Bishuo", 34973, "nic-fru", scripts = Latn}

m["bwi"] = {"Baniwa", 3501735, "awd-nwk", scripts = Latn}

m["bwj"] = {"Láá Láá Bwamu", 11017275, "nic-bwa", scripts = Latn}

m["bwk"] = {"Bauwaki", 4873607, "ngf", scripts = Latn}

m["bwl"] = {"Bwela", 5003678, "bnt-bun", scripts = Latn}

m["bwm"] = {"Biwat", 56352, "paa-yua", scripts = Latn}

m["bwn"] = {"Wunai Bunu", 56452, "hmn"}

m["bwo"] = {"Shinasha", 56260, "omv-gon", scripts = Latn}

m["bwp"] = {"Mandobo Bawah", 12636155, "ngf", scripts = Latn}

m["bwq"] = {"Southern Bobo", 11001714, "dmn-snb", scripts = Latn}

m["bwr"] = {"Bura", 56552, "cdc-cbm", scripts = Latn}

m["bws"] = {"Bomboma", 9229429, "bnt-bun", scripts = Latn}

m["bwt"] = {"Bafaw", 34853, "bnt-bbo", scripts = Latn}

m["bwu"] = {"Buli (Ghana)", 35085, "nic-buk", scripts = Latn}

m["bww"] = {"Bwa", 3515058, "bnt-bta", scripts = Latn}

m["bwx"] = {"Bu-Nao Bunu", 56411, "hmn", scripts = Latn}

m["bwy"] = {"Cwi Bwamu", 11150714, "nic-bwa", scripts = Latn}

m["bwz"] = {"Bwisi", 35067, "bnt-sir", scripts = Latn}

m["bxa"] = {"Bauro", 2892068, "poz-sls", scripts = Latn}

m["bxb"] = {"Belanda Bor", 56678, "sdv-lon", scripts = Latn}

m["bxc"] = {"Molengue", 13345, "bnt-kel", scripts = Latn}

m["bxd"] = {"Pela", 57000, "tbq-brm"}

m["bxe"] = {"Ongota", 36344, "cus", scripts = Latn}

m["bxf"] = {"Bilur", 2903788, "poz-ocw", scripts = Latn}

m["bxg"] = {"Bangala", 34989, "bnt-bmo", scripts = Latn}

m["bxh"] = {"Buhutu", 4986329, "poz-ocw", scripts = Latn}

m["bxi"] = {"Pirlatapa", 10632195, "aus-kar", scripts = Latn}

m["bxj"] = {"Bayungu", 10427485, "aus-psw", scripts = Latn}

m["bxk"] = {"Bukusu", 32930, "bnt-msl", scripts = Latn}

m["bxl"] = {"Jalkunan", 11009787, "dmn-jje", scripts = Latn}

m["bxn"] = {"Burduna", 4998313, "aus-psw", scripts = Latn}

m["bxo"] = {"Barikanchi", 3450802, "crp", scripts = Latn, ancestors = {"ha"}}

m["bxp"] = {"Bebil", 34941, "bnt-btb", scripts = Latn}

m["bxq"] = {"Beele", 56238, "cdc-wst", scripts = Latn}

m["bxs"] = {"Busam", 35189, "nic-grs", scripts = Latn}

m["bxv"] = {"Berakou", 56796, "csu-bgr", scripts = Latn}

m["bxw"] = {"Banka", 3438402, "dmn-smg", scripts = Latn}

m["bxz"] = {"Binahari", 4913840, "ngf", scripts = Latn}

m["bya"] = {"Palawan Batak", 3450443, "phi", scripts = {"Tagb"}}

m["byb"] = {"Bikya", 33257, "nic-fru", scripts = Latn}

m["byc"] = {"Ubaghara", 36625, "nic-ucn", scripts = Latn}

m["byd"] = {"Benyadu'", 11173588, "day", scripts = Latn}

m["bye"] = {"Pouye", 7235814, "paa-spk", scripts = Latn}

m["byf"] = {"Bete", 32932, "nic-ykb", scripts = Latn}

m["byg"] = {"Baygo", 56836, "sdv-daj", scripts = Latn}

m["byh"] = {"Bujhyal", 56317, "sit-gma", scripts = Deva}

m["byi"] = {"Buyu", 5003401, "bnt-nyb", scripts = Latn}

m["byj"] = {"Binawa", 4913807, "nic-kau", scripts = Latn}

m["byk"] = {
    "Biao",
    4902547,
    "qfa-tak",
    scripts = Latn -- also Hani?
}

m["byl"] = {"Bayono", 3503856, "ngf", scripts = Latn}

m["bym"] = {"Bidyara", 8842355, "aus-pam", scripts = Latn}

m["byn"] = {"Blin", 56491, "cus", scripts = {"Ethi", "Latn"}, translit_module = "translit-redirect"}

m["byo"] = {"Biyo", 56848, "tbq-lol", scripts = {"Latn", "Hani"}}

m["byp"] = {"Bumaji", 4997234, "nic-ben", scripts = Latn}

m["byq"] = {"Basay", 716647, "map", scripts = Latn}

m["byr"] = {"Baruya", 3450812, "ngf", scripts = Latn}

m["bys"] = {"Burak", 4998097, "alv-bwj", scripts = Latn}

m["byt"] = {"Berti", 35008, "ssa-sah", scripts = Latn}

m["byv"] = {"Medumba", 36019, "bai", scripts = Latn}

m["byw"] = {"Belhariya", 32961, "sit-kie", scripts = Deva}

m["byx"] = {"Qaqet", 3503009, "paa-bng", scripts = Latn}

m["byz"] = {"Banaro", 56858, "paa", scripts = Latn}

m["bza"] = {"Bandi", 34912, "dmn-msw", scripts = Latn}

m["bzb"] = {"Andio", 4754487, "poz-slb", scripts = Latn}

m["bzd"] = {"Bribri", 28400, "cba", scripts = Latn}

m["bze"] = {"Jenaama Bozo", 10950633, "dmn-snb", scripts = Latn}

m["bzf"] = {"Boikin", 56829, "paa-spk", scripts = Latn}

m["bzg"] = {"Babuza", 716615, "map"}

m["bzh"] = {"Mapos Buang", 2927370, "poz-ocw", scripts = Latn}

m["bzi"] = {"Bisu", 56852, "tbq-lol", scripts = {"Latn", "Thai"}}

m["bzj"] = {"Belizean Creole", 1363055, "crp", scripts = Latn, ancestors = {"en"}}

m["bzk"] = {"Nicaraguan Creole", 3504097, "crp", scripts = Latn, ancestors = {"en"}}

m["bzl"] = { -- supposedly also called "Bolano", but I can find no evidence of that
    "Boano (Sulawesi)",
    4931258,
    "poz",
    scripts = Latn
}

m["bzm"] = {"Bolondo", 35071, "bnt-bun", scripts = Latn}

m["bzn"] = {"Boano (Maluku)", 4931255, "poz-cma", scripts = Latn}

m["bzo"] = {"Bozaba", 4952785, "bnt-ngn", scripts = Latn}

m["bzp"] = {"Kemberano", 12634399, "ngf-sbh", scripts = Latn}

m["bzq"] = {"Buli (Indonesia)", 2927952, "poz-hce", scripts = Latn}

m["bzr"] = {"Biri", 4087011, "aus-pam", scripts = Latn}

m["bzs"] = {"Brazilian Sign Language", 3436689, "sgn", scripts = Latn}

m["bzu"] = {"Burmeso", 56746, "paa-wpa", scripts = Latn}

m["bzv"] = {"Bebe", 34977, "nic-bbe", scripts = Latn}

m["bzw"] = {"Basa", 34898, "nic-bas", scripts = Latn}

m["bzx"] = {"Hainyaxo Bozo", 11159536, "dmn-snb", scripts = Latn}

m["bzy"] = {"Obanliku", 36276, "nic-ben", scripts = Latn}

m["bzz"] = {"Evant", 35259, "nic-tvc", scripts = Latn}

return m
