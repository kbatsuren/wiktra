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

m["baa"] = {"Babatana", 2877785, "poz-ocw", Latn}

m["bab"] = {"Bainouk-Gunyuño", 35508, "alv-bny", Latn}

m["bac"] = {"Badui", 3449885, "poz-msa", Latn}

m["bae"] = {"Baré", 3504087, "awd", Latn}

m["baf"] = {"Nubaca", 36270, "nic-ymb", Latn}

m["bag"] = {"Tuki", 36621, "nic-mba", Latn}

m["bah"] = {"Bahamian Creole", 2669229, "crp", Latn, ancestors = {"en"}}

m["baj"] = {"Barakai", 3502030, "poz-cet", Latn}

m["bal"] = {"Baluchi", 33049, "ira-nwi", {"fa-Arab"}}

m["ban"] = {"Balinese", 33070, "poz-mcm", {"Latn", "Bali"}}

m["bao"] = {"Waimaha", 2883738, "sai-tuc", Latn}

m["bap"] = {"Bantawa", 56500, "sit-kic", Deva}

m["bar"] = {"Bavarian", 29540, "gmw", Latn, ancestors = {"gmh"}}

m["bas"] = {"Basaa", 33093, "bnt-bsa", Latn}

m["bau"] = {"Badanchi", 11001650, "nic-jrw", Latn}

m["bav"] = {"Babungo", 34885, "nic-rnn", Latn}

m["baw"] = {"Bambili-Bambui", 34880, "nic-nge", Latn}

m["bax"] = {"Bamum", 35280, "nic-nun", {"Latn", "Bamu"}}

m["bay"] = {"Batuley", 8828787, "poz", Latn}

m["bba"] = {"Baatonum", 34889, "alv-sav", Latn}

m["bbb"] = {"Barai", 4858206, "ngf", Latn}

m["bbc"] = {"Toba Batak", 33017, "btk", {"Latn", "Batk"}}

m["bbd"] = {"Bau", 4873415, "ngf-mad", Latn}

m["bbe"] = {"Bangba", 34895, "nic-nke", Latn}

m["bbf"] = {"Baibai", 56902, "paa", Latn}

m["bbg"] = {"Barama", 34884, "bnt-sir", Latn}

m["bbh"] = {"Bugan", 3033554, "mkh-pkn", Latn}

m["bbi"] = {"Barombi", 34985, "bnt-bsa", Latn}

m["bbj"] = {"Ghomala'", 35271, "bai", Latn}

m["bbk"] = {"Babanki", 34790, "nic-rnc", Latn}

m["bbl"] = {"Bats", 33259, "cau-nkh", {"Geor"}, translit_module = "Geor-translit", entry_name = {from = {"̃", "<sup>ნ</sup>", MACRON, BREVE}, to = {"", "ნ"}}}

m["bbm"] = { -- name includes prefix
    "Babango", 34819, "bnt-bta", Latn
}

m["bbn"] = {"Uneapa", 7884126, "poz-ocw", Latn}

m["bbo"] = {"Konabéré", 35371, "dmn-snb", Latn}

m["bbp"] = {"West Central Banda", 7984377, "bad", Latn}

m["bbq"] = {"Bamali", 34901, "nic-nun", Latn}

m["bbr"] = {"Girawa", 5564185, "ngf-mad", Latn}

m["bbs"] = {"Bakpinka", 3515061, "nic-ucr", Latn}

m["bbt"] = {"Mburku", 3441324, "cdc-wst", Latn}

m["bbu"] = {"Bakulung", 35580, "nic-jrn", Latn}

m["bbv"] = {"Karnai", 6372803, "poz-ocw", Latn}

m["bbw"] = {"Baba", 34822, "nic-nun", Latn}

m["bbx"] = { -- cf bvb
    "Bubia",
    34953,
    "nic-bds",
    Latn,
    ancestors = {"bvb"}
}

m["bby"] = {"Befang", 34960, "nic-bds", Latn}

m["bca"] = {"Central Bai", 12628803, "zhx-gba", {"Hani", "Latn"}}

m["bcb"] = {"Bainouk-Samik", 36390, "alv-bny", Latn}

m["bcd"] = {"North Babar", 7054041, "poz-tim", Latn}

m["bce"] = {"Bamenyam", 34968, "nic-nun", Latn}

m["bcf"] = {"Bamu", 3503788, "paa-kiw", Latn}

m["bcg"] = {"Baga Pokur", 31172660, "alv-nal", Latn}

m["bch"] = {"Bariai", 2884502, "poz-ocw", Latn}

m["bci"] = {"Baoule", 35107, "alv-ctn", Latn}

m["bcj"] = {"Bardi", 3913852, "aus-nyu", Latn}

m["bck"] = {"Bunaba", 580923, "aus-bub", Latn}

m["bcl"] = {"Bikol Central", 33284, "phi", Latn}

m["bcm"] = {"Banoni", 2882857, "poz-ocw", Latn}

m["bcn"] = {"Bibaali", 34892, "alv-mye", Latn}

m["bco"] = {"Kaluli", 6354586, "ngf", Latn}

m["bcp"] = {"Bali", 3515074, "bnt-kbi", Latn}

m["bcq"] = {"Bench", 35108, "omv", Latn}

m["bcr"] = {"Babine-Witsuwit'en", 27864, "ath-nor", Latn}

m["bcs"] = {"Kohumono", 35590, "nic-ucn", Latn}

m["bct"] = {"Bendi", 8836662, "csu-mle", Latn}

m["bcu"] = {"Biliau", 2874658, "poz-ocw", Latn}

m["bcv"] = {"Shoo-Minda-Nye", 36548, "nic-jkn", Latn}

m["bcw"] = {"Bana", 56272, "cdc-cbm", Latn}

m["bcy"] = {"Bacama", 56274, "cdc-cbm", Latn}

m["bcz"] = {"Bainouk-Gunyaamolo", 35506, "alv-bny", Latn}

m["bda"] = {"Bayot", 35019, "alv-jol", Latn}

m["bdb"] = {"Basap", 3504208, "poz-bnn", Latn}

m["bdc"] = {"Emberá-Baudó", 11173166, "sai-chc", Latn}

m["bdd"] = {"Bunama", 4997416, "poz-ocw", Latn}

m["bde"] = {"Bade", 56239, "cdc-wst", Latn}

m["bdf"] = {"Biage", 48037487, "ngf", Latn}

m["bdg"] = {"Bonggi", 2910053, "poz-bnn", Latn}

m["bdh"] = {"Tara Baka", 2880165, "csu-bbk", Latn}

m["bdi"] = {"Burun", 35040, "sdv-niw", Latn}

m["bdj"] = {"Bai", 34894, "nic-ser", Latn}

m["bdk"] = {"Budukh", 35397, "cau-lzg", Cyrl, translit_module = "bdk-translit", override_translit = true, entry_name = {from = {GRAVE, ACUTE}, to = {}}}

m["bdl"] = {"Indonesian Bajau", 2880038, "poz", Latn}

m["bdm"] = {"Buduma", 56287, "cdc-cbm", Latn}

m["bdn"] = {"Baldemu", 56280, "cdc-cbm", Latn}

m["bdo"] = {"Morom", 759770, "csu-bgr", Latn}

m["bdp"] = {"Bende", 8836490, "bnt", Latn}

m["bdq"] = {"Bahnar", 32924, "mkh-ban", Latn, ancestors = {"mkh-ban-pro"}}

m["bdr"] = {"West Coast Bajau", 2880037, "poz-sbj", Latn}

m["bds"] = {"Burunge", 56617, "cus", Latn}

m["bdt"] = {"Bokoto", 4938812, "alv-gbw", Latn}

m["bdu"] = {"Oroko", 36278, "bnt-saw", Latn}

m["bdv"] = {"Bodo Parja", 8845881, "inc-eas", {"Orya"}, ancestors = {"inc-mgd"}}

m["bdw"] = {"Baham", 3513309, "paa", Latn}

m["bdx"] = {"Budong-Budong", 4985158, "poz-ssw", Latn}

m["bdy"] = {"Bandjalang", 2980386, "aus-pam", Latn}

m["bdz"] = {"Badeshi", 33028, "inc-wes", ancestors = {"noe"}}

m["bea"] = {"Beaver", 20826, "ath-nor", Latn}

m["beb"] = {"Bebele", 34976, "bnt-btb", Latn}

m["bec"] = {"Iceve-Maci", 35449, "nic-tvc", Latn}

m["bed"] = {"Bedoanas", 4879330, "poz-hce", Latn}

m["bee"] = {"Byangsi", 56904, "sit-alm", Deva}

m["bef"] = {"Benabena", 2895638, "paa-kag", Latn}

m["beg"] = {"Belait", 2894198, "poz-swa", Latn}

m["beh"] = {"Biali", 34961, "nic-eov", Latn}

m["bei"] = {"Bekati'", 3441683, "day", Latn}

m["bej"] = {"Beja", 33025, "cus", {"Arab", "Latn"}}

m["bek"] = {"Bebeli", 4878430, "poz-ocw", Latn}

m["bem"] = {"Bemba", 33052, "bnt-sbi", Latn}

m["beo"] = {"Beami", 3504079, "paa", Latn}

m["bep"] = {"Besoa", 8840465, "poz-kal", Latn}

m["beq"] = {"Beembe", 3196320, "bnt-kng", Latn}

m["bes"] = {"Besme", 289832, "alv-kim", Latn}

m["bet"] = {"Guiberoua Bété", 11019185, "kro-bet", Latn}

m["beu"] = {"Blagar", 4923846, "ngf", Latn}

m["bev"] = {"Daloa Bété", 11155819, "kro-bet", Latn}

m["bew"] = {"Betawi", 33014, "crp", Latn, ancestors = {"ms"}}

m["bex"] = {"Jur Modo", 56682, "csu-bbk", Latn}

m["bey"] = {"Akuwagel", 3504170, "qfa-tor", Latn}

m["bez"] = {"Kibena", 2502949, "bnt-bki", Latn}

m["bfa"] = {"Bari", 35042, "sdv-bri", Latn}

m["bfb"] = {"Pauri Bareli", 7155462, "inc-bhi", Deva}

m["bfc"] = {"Northern Bai", 12642165, "zhx-gba", {"Hani", "Latn"}}

m["bfd"] = {"Bafut", 34888, "nic-nge", Latn}

m["bfe"] = {"Betaf", 4897329, "paa-tkw", Latn}

m["bff"] = {"Bofi", 34914, "alv-gbf", Latn}

m["bfg"] = {"Busang Kayan", 9231909, "poz", Latn}

m["bfh"] = {"Blafe", 12628007, "paa", Latn}

m["bfi"] = {
    "British Sign Language", 33000, "sgn", Latn -- when documented
}

m["bfj"] = {"Bafanji", 34890, "nic-nun", Latn}

m["bfk"] = {"Ban Khor Sign Language", 3441103, "sgn"}

m["bfl"] = {"Banda-Ndélé", 34850, "bad-cnt", Latn}

m["bfm"] = {"Mmen", 36132, "nic-rnc", Latn}

m["bfn"] = {"Bunak", 35101, "ngf", Latn}

m["bfo"] = {"Malba Birifor", 11150710, "nic-mre", Latn}

m["bfp"] = {"Beba", 35050, "nic-nge", Latn}

m["bfq"] = {"Badaga", 33205, "dra", {"Knda"}}

m["bfr"] = {"Bazigar", 8829558, "dra"}

m["bfs"] = {"Southern Bai", 12952250, "zhx-gba", {"Hani", "Latn"}}

m["bft"] = {"Balti", 33086, "sit-lab", {"Arab", "Tibt"}}

m["bfu"] = {"Gahri", 5516952, "sit-whm", {"Takr", "Tibt"}}

m["bfw"] = {"Bondo", 2567942, "mun", {"Orya"}}

m["bfx"] = {"Bantayanon", 16837866, "phi", Latn}

m["bfy"] = {"Bagheli", 2356364, "inc-hie", Deva, ancestors = {"inc-pra"}, translit_module = "hi-translit"}

m["bfz"] = {"Mahasu Pahari", 6733460, "him", Deva, translit_module = "hi-translit"}

m["bga"] = {"Gwamhi-Wuri", 6707102, "nic-knn", Latn}

m["bgb"] = {"Bobongko", 4935896, "poz-slb", Latn}

m["bgc"] = {"Haryanvi", 33410, "inc-cen", Deva, ancestors = {"inc-ohi"}, translit_module = "hi-translit"}

m["bgd"] = {"Rathwi Bareli", 7295692, "inc-bhi", Deva}

m["bge"] = {"Bauria", 4873579, "inc-bhi", Deva}

m["bgf"] = {"Bangandu", 34938, "alv-gbs", Latn}

m["bgg"] = {"Bugun", 3514220, "sit-khb", Latn}

m["bgi"] = {"Giangan", 4842057, "phi", Latn}

m["bgj"] = {"Bangolan", 34862, "nic-nun", Latn}

m["bgk"] = {
    "Bit", 2904868, "mkh-pal", Latn -- also Hani?
}

m["bgl"] = {"Bo", 8845514, "mkh-vie"}

m["bgo"] = {"Baga Koga", 35695, "alv-bag", Latn}

m["bgq"] = {"Bagri", 2426319, "inc-wes", Deva, ancestors = {"raj"}}

m["bgr"] = {"Bawm Chin", 56765, "tbq-kuk", Latn}

m["bgs"] = {"Tagabawa", 7675121, "mno", Latn}

m["bgt"] = {"Bughotu", 2927723, "poz-sls", Latn}

m["bgu"] = {"Mbongno", 36141, "nic-mmb", Latn}

m["bgv"] = {"Warkay-Bipim", 4915439, "ngf", Latn}

m["bgw"] = {"Bhatri", 8841054, "inc-eas", Deva, ancestors = {"inc-mgd"}}

m["bgx"] = {"Balkan Gagauz Turkish", 2360396, "trk-ogz", Latn, ancestors = {"trk-oat"}}

m["bgy"] = {"Benggoi", 4887742, "poz-cma", Latn}

m["bgz"] = {"Banggai", 3441692, "poz-slb", Latn}

m["bha"] = {"Bharia", 4901287, "dra", Deva}

m["bhb"] = {"Bhili", 33229, "inc-bhi", Deva}

m["bhc"] = {"Biga", 2902375, "poz-hce", Latn}

m["bhd"] = {"Bhadrawahi", 4900565, "him", {"Arab", "Deva"}, translit_module = "hi-translit"}

m["bhe"] = {"Bhaya", 8841168, "inc-wes", ancestors = {"raj"}}

m["bhf"] = {"Odiai", 56690, "paa-kwm", Latn}

m["bhg"] = {"Binandere", 3503802, "ngf", Latn}

m["bhh"] = {"Bukhari", 56469, "ira-swi", {"Cyrl", "Hebr", "Latn", "fa-Arab"}, ancestors = {"tg"}}

m["bhi"] = {"Bhilali", 4901729, "inc-bhi", Deva}

m["bhj"] = {"Bahing", 56442, "sit-kiw", {"Deva", "Latn"}}

m["bhl"] = {"Bimin", 4913743, "ngf-okk", Latn}

m["bhm"] = {"Bathari", 2586893, "sem-sar", {"Arab", "Latn"}}

m["bhn"] = {"Bohtan Neo-Aramaic", 33230, "sem-nna"}

m["bho"] = {"Bhojpuri", 33268, "inc-hie", {"Deva", "Kthi"}, ancestors = {"bh"}, translit_module = "translit-redirect"}

m["bhp"] = {"Bima", 2796873, "poz-cet", Latn}

m["bhq"] = {"Tukang Besi South", 12643975, "poz-mun", Latn}

m["bhs"] = {"Buwal", 3515065, "cdc-cbm", Latn}

m["bht"] = {"Bhattiyali", 4901452, "him", Deva}

m["bhu"] = {"Bhunjia", 8841766, "inc-eas", {"Deva", "Orya"}, ancestors = {"inc-mgd"}}

m["bhv"] = {"Bahau", 3502039, "poz", Latn}

m["bhw"] = {"Biak", 1961488, "poz-hce", Latn}

m["bhx"] = { -- spurious?
    "Bhalay", 8840773, "inc"
}

m["bhy"] = {"Bhele", 4901671, "bnt-kbi", Latn}

m["bhz"] = {"Bada", 4840520, "poz-kal", Latn}

m["bia"] = {"Badimaya", 3442745, "aus-psw", Latn}

m["bib"] = {"Bissa", 32934, "dmn-bbu", Latn}

m["bic"] = {"Bikaru", 56342, "paa-eng", Latn}

m["bid"] = {"Bidiyo", 56258, "cdc-est", Latn}

m["bie"] = {"Bepour", 4890914, "ngf-mad", Latn}

m["bif"] = {"Biafada", 35099, "alv-ten", Latn}

m["big"] = {"Biangai", 8842027, "paa", Latn}

m["bij"] = {"Kwanka", 35598, "nic-tar", Latn}

m["bil"] = {"Bile", 34987, "nic-jrn", Latn}

m["bim"] = {"Bimoba", 34971, "nic-grm", Latn}

m["bin"] = {"Edo", 35375, "alv-eeo", Latn}

m["bio"] = {"Nai", 3508074, "paa-kwm", Latn}

m["bip"] = {"Bila", 2902626, "bnt-kbi", Latn}

m["biq"] = {"Bipi", 2904312, "poz-aay", Latn}

m["bir"] = {"Bisorio", 8844749, "paa-eng", Latn}

m["bit"] = {"Berinomo", 56447, "paa-spk", Latn}

m["biu"] = {"Biete", 4904687, "tbq-kuk", Latn}

m["biv"] = {"Southern Birifor", 32859745, "nic-mre", Latn}

m["biw"] = {"Kol (Cameroon)", 35582, "bnt-mka", Latn}

m["bix"] = {"Bijori", 3450686, "mun", Deva}

m["biy"] = {"Birhor", 3450469, "mun", Deva}

m["biz"] = {"Baloi", 3450590, "bnt-ngn", Latn}

m["bja"] = {"Budza", 3046889, "bnt-bun", Latn}

m["bjb"] = {"Barngarla", 3439071, "aus-pam", Latn}

m["bjc"] = {"Bariji", 4690919, "ngf", Latn}

m["bje"] = {"Biao-Jiao Mien", 3503800, "hmx-mie", {"Hani", "Latn"}}

m["bjf"] = {
    "Barzani Jewish Neo-Aramaic", 33234, "sem-nna", {"Hebr"} -- maybe others
}

m["bjg"] = {"Bidyogo", 35365, "alv-bak", Latn}

m["bjh"] = {"Bahinemo", 56361, "paa-spk", Latn}

m["bji"] = {"Burji", 34999, "cus", {"Latn", "Ethi"}}

m["bjj"] = {"Kannauji", 2726867, "inc-cen", Deva, ancestors = {"inc-ohi"}}

m["bjk"] = {"Barok", 2884743, "poz-ocw", Latn}

m["bjl"] = {"Bulu (New Guinea)", 4997162, "poz-ocw", Latn}

m["bjm"] = {"Bajelani", 4848866, "ira-zgr", {"Latn", "Arab"}, ancestors = {"hac"}}

m["bjn"] = {"Banjarese", 33151, "poz-mly", {"Latn", "Arab"}}

m["bjo"] = {"Mid-Southern Banda", 42303990, "bad-cnt", Latn}

m["bjp"] = {"Fanamaket", nil, "poz-oce", Latn}

m["bjr"] = {"Binumarien", 538364, "paa-kag", Latn}

m["bjs"] = {"Bajan", 2524014, "crp", Latn, ancestors = {"en"}}

m["bjt"] = {"Balanta-Ganja", 19359034, "alv-bak", {"Arab", "Latn"}}

m["bju"] = {"Busuu", 35046, "nic-fru", Latn}

m["bjv"] = {"Bedjond", 8829831, "csu-sar", Latn}

m["bjw"] = {"Bakwé", 34899, "kro-ekr", Latn}

m["bjx"] = {"Banao Itneg", 12627559, "phi", Latn}

m["bjy"] = {"Bayali", 4874263, "aus-pam", Latn}

m["bjz"] = {"Baruga", 2886189, "ngf", Latn}

m["bka"] = {"Kyak", 35653, "alv-bwj", Latn}

m["bkc"] = {"Baka", 34905, "nic-nkb", Latn}

m["bkd"] = {"Binukid", 4914553, "mno", Latn}

m["bkf"] = {"Beeke", 3441375, "bnt-kbi", Latn}

m["bkg"] = {"Buraka", 35066, "nic-nkg", Latn}

m["bkh"] = {"Bakoko", 34866, "bnt-bsa", Latn}

m["bki"] = {"Baki", 11024697, "poz-vnc", Latn}

m["bkj"] = {"Pande", 36263, "bnt-ngn", Latn}

m["bkk"] = { -- written in Balti script
    "Brokskat", 2925988, "inc-dar"
}

m["bkl"] = {"Berik", 378743, "paa-tkw", Latn}

m["bkm"] = {"Kom (Cameroon)", 1656595, "nic-rnc", Latn}

m["bkn"] = {"Bukitan", 3446774, "poz-bnn", Latn}

m["bko"] = {"Kwa'", 35567, "bai", Latn}

m["bkp"] = {"Iboko", 35089, "bnt-ngn", Latn}

m["bkq"] = {"Bakairí", 56846, "sai-car", Latn}

m["bkr"] = {"Bakumpai", 3436626, "poz-brw", Latn}

m["bks"] = {"Masbate Sorsogon", 16113356, "phi", Latn}

m["bkt"] = {"Boloki", 4144560, "bnt-zbi", Latn, ancestors = {"lse"}}

m["bku"] = {"Buhid", 1002956, "phi", {"Buhd"}}

m["bkv"] = {"Bekwarra", 34954, "nic-ben", Latn}

m["bkw"] = {"Bekwel", 34950, "bnt-bek", Latn}

m["bkx"] = {"Baikeno", 11200640, "poz-tim", Latn}

m["bky"] = {"Bokyi", 35087, "nic-ben", Latn}

m["bkz"] = {"Bungku", 2928207, "poz-btk", Latn}

m["bla"] = {"Blackfoot", 33060, "alg", {"Latn", "Cans"}}

m["blb"] = {"Bilua", 35003, "ngf", Latn}

m["blc"] = {"Bella Coola", 977808, "sal", Latn}

m["bld"] = {"Bolango", 3450578, "phi", Latn}

m["ble"] = {"Balanta-Kentohe", 56789, "alv-bak", Latn}

m["blf"] = {"Buol", 2928278, "phi", Latn}

m["blg"] = {"Balau", 4850134, "poz-mly", Latn}

m["blh"] = {"Kuwaa", 35579, "kro", Latn}

m["bli"] = {"Bolia", 34910, "bnt-mon", Latn}

m["blj"] = {"Bolongan", 9229310, "poz", Latn}

m["blk"] = {"Pa'o Karen", 7121294, "kar", {"Mymr"}}

m["bll"] = {"Biloxi", 2903780, "sio-ohv", Latn}

m["blm"] = {"Beli", 56821, "csu-bbk", Latn}

m["bln"] = {"Southern Catanduanes Bicolano", 7569754, "phi", Latn}

m["blo"] = {"Anii", 34838, "alv-ntg", Latn}

m["blp"] = {"Blablanga", 2905245, "poz-ocw", Latn}

m["blq"] = {"Baluan-Pam", 2881675, "poz-aay", Latn}

m["blr"] = {"Blang", 4925096, "mkh-pal", {"Latn", "Tale", "Lana", "Thai"}, sort_key = {from = {"[%pᪧๆ]", "[᩠ᩳ-᩿]", "ᩔ", "ᩕ", "ᩖ", "ᩘ", "([ᨭ-ᨱ])ᩛ", "([ᨷ-ᨾ])ᩛ", "ᩤ", "[็-๎]", "([เแโใไ])([ก-ฮ])"}, to = {"", "", "ᩈᩈ", "ᩁ", "ᩃ", "ᨦ", "%1ᨮ", "%1ᨻ", "ᩣ", "", "%2%1"}}}

m["bls"] = {"Balaesang", 4849796, "poz", Latn}

m["blt"] = {
    "Tai Dam",
    56407,
    "tai-swe",
    {"Tavt", "Latn"},
    -- translit_module = "Tavt-translit",
    sort_key = {from = {"[꪿ꫀ꫁ꫂ]", "([ꪵꪶꪹꪻꪼ])([ꪀ-ꪯ])"}, to = {"", "%2%1"}}
}

m["blv"] = {"Kibala", 4939959, "bnt-kmb", Latn}

m["blw"] = {"Balangao", 4850033, "phi", Latn}

m["blx"] = {"Mag-Indi Ayta", 1931221, "phi", Latn}

m["bly"] = {"Notre", 11009194, "nic-wov", Latn}

m["blz"] = {"Balantak", 4850053, "poz-slb", Latn}

m["bma"] = {"Lame", 3913997, "nic-jrn", Latn}

m["bmb"] = {"Bembe", 4885023, "bnt-lgb", Latn}

m["bmc"] = {"Biem", 4904523, "poz-ocw", Latn}

m["bmd"] = {"Baga Manduri", 35815, "alv-bag", Latn}

m["bme"] = {"Limassa", 11004666, "nic-nkb", Latn}

m["bmf"] = {"Bom", 35088, "alv-mel", Latn}

m["bmg"] = {"Bamwe", 34867, "bnt-bun", Latn}

m["bmh"] = {"Kein", 6383764, "ngf-mad", Latn}

m["bmi"] = {"Bagirmi", 34903, "csu-bgr", Latn}

m["bmj"] = {"Bote-Majhi", 9229570, "inc-eas", Deva, ancestors = {"bh"}}

m["bmk"] = {"Ghayavi", 5555976, "poz-ocw", Latn}

m["bml"] = {"Bomboli", 35055, "bnt-ngn", Latn}

m["bmn"] = {"Bina", 8843664, "poz-ocw", Latn}

m["bmo"] = {"Bambalang", 34868, "nic-nun", Latn}

m["bmp"] = {"Bulgebi", 4996380, "ngf-fin", Latn}

m["bmq"] = {"Bomu", 35065, "nic-bwa", Latn}

m["bmr"] = {"Muinane", 3027894, "sai-bor", Latn}

m["bmt"] = {"Biao Mon", 8842159, "hmx-mie"}

m["bmu"] = {"Somba-Siawari", 5000983, "ngf", Latn}

m["bmv"] = {"Bum", 35058, "nic-rnc", Latn}

m["bmw"] = {"Bomwali", 34984, "bnt-ndb", Latn}

m["bmx"] = {"Baimak", 3450546, "ngf-mad", Latn}

m["bmz"] = {"Baramu", 4858315, "ngf", Latn}

m["bna"] = {"Bonerate", 4941729, "poz-mun", Latn}

m["bnb"] = {"Bookan", 4943150, "poz-san", Latn}

m["bnd"] = {"Banda", 3504147, "poz-cma", Latn}

m["bne"] = {"Bintauna", 4914533, "phi", Latn}

m["bnf"] = {"Masiwang", 6783305, "poz-cma", Latn}

m["bng"] = {"Benga", 34952, "bnt-saw", Latn}

m["bni"] = {"Bangi", 34936, "bnt-bmo", Latn}

m["bnj"] = {"Eastern Tawbuid", 18757427, "phi", Latn}

m["bnk"] = {"Bierebo", 2902029, "poz-vnc", Latn}

m["bnl"] = {"Boon", 56616, "cus", Latn}

m["bnm"] = {"Batanga", 34979, "bnt-saw", Latn}

m["bnn"] = {"Bunun", 56505, "map", Latn}

m["bno"] = {"Asi", 29490, "phi", Latn}

m["bnp"] = {"Bola", 4938876, "poz-ocw", Latn}

m["bnq"] = {"Bantik", 2883521, "poz", Latn}

m["bnr"] = {"Butmas-Tur", 2928942, "poz-vnc", Latn}

m["bns"] = {"Bundeli", 56399, "inc-cen", Deva, ancestors = {"inc-ohi"}, translit_module = "hi-translit"}

m["bnu"] = {"Bentong", 4890644, "poz-ssw", Latn}

m["bnv"] = {"Beneraf", 4941733, "paa-tkw", Latn}

m["bnw"] = {"Bisis", 56356, "paa-spk", Latn}

m["bnx"] = {"Bangubangu", 3438330, "bnt-lbn", Latn}

m["bny"] = {"Bintulu", 3450775, "poz-swa", Latn}

m["bnz"] = {"Beezen", 35083, "nic-ykb", Latn}

m["boa"] = {"Bora", 2375468, "sai-bor", Latn}

m["bob"] = {"Aweer", 56526, "cus", Latn}

m["boe"] = {"Mundabli", 36127, "nic-beb", Latn}

m["bof"] = {"Bolon", 3913301, "dmn-emn", Latn}

m["bog"] = {"Bamako Sign Language", 4853284, "sgn"}

m["boh"] = {"North Boma", 35080, "bnt-bdz", Latn}

m["boi"] = {"Barbareño", 56391, "nai-chu", Latn}

m["boj"] = {"Anjam", 3504136, "ngf-mad", Latn}

m["bok"] = {"Bonjo", 34942, "alv", Latn}

m["bol"] = {"Bole", 3436680, "cdc-wst", Latn}

m["bom"] = {"Berom", 35013, "nic-beo", Latn}

m["bon"] = {"Bine", 4914077, "paa", Latn}

m["boo"] = {
    "Tiemacèwè Bozo", 12643582, "dmn-snb", Latn -- and others?
}

m["bop"] = {"Bonkiman", 4942134, "ngf-fin", Latn}

m["boq"] = {"Bogaya", 7207578, "ngf", Latn}

m["bor"] = {"Borôro", 32986, "sai-mje", Latn}

m["bot"] = {"Bongo", 2910067, "csu-bbk", Latn}

m["bou"] = {"Bondei", 4941378, "bnt-seu", Latn}

m["bov"] = {"Tuwuli", 36974, "alv-ktg", Latn}

m["bow"] = {"Rema", 7311502, "paa", Latn}

m["box"] = {"Buamu", 35157, "nic-bwa", Latn}

m["boy"] = {"Bodo (Central Africa)", 4936715, "bnt-leb", Latn}

m["boz"] = {"Tiéyaxo Bozo", 32860401, "dmn-snb", Latn}

m["bpa"] = {"Dakaka", 1157729, "poz-vnc", Latn}

m["bpd"] = {"Banda-Banda", 3450674, "bad-cnt", Latn}

m["bpg"] = {"Bonggo", 4941860, "poz-ocw", Latn}

m["bph"] = {"Botlikh", 56560, "cau-ava", Cyrl}

m["bpi"] = {"Bagupi", 3450697, "ngf-mad", Latn}

m["bpj"] = {"Binji", 4914403, "bnt-lbn", Latn}

m["bpk"] = {"Orowe", 7103905, "poz-cln", Latn}

m["bpl"] = {"Broome Pearling Lugger Pidgin", 4975277, "crp", Latn, ancestors = {"ms"}}

m["bpm"] = {"Biyom", 4919327, "ngf-mad", Latn}

m["bpn"] = {"Dzao Min", 3042189, "hmx-mie"}

m["bpo"] = {"Anasi", 11207813, "paa-egb", Latn}

m["bpp"] = {"Kaure", 20526532, "paa", Latn}

m["bpq"] = {"Banda Malay", 12473442, "crp", Latn, ancestors = {"ms"}}

m["bpr"] = {"Koronadal Blaan", 16115430, "phi", Latn}

m["bps"] = {"Sarangani Blaan", 16117272, "phi", Latn}

m["bpt"] = {"Barrow Point", 2567916, "aus-pmn", Latn}

m["bpu"] = {"Bongu", 4941930, "ngf-mad", Latn}

m["bpv"] = {"Bian Marind", 8841889, "ngf", Latn}

m["bpx"] = {"Palya Bareli", 7128872, "inc-bhi", {"Deva"}, ancestors = {"psu"}, translit_module = "hi-translit"}

m["bpy"] = {"Bishnupriya Manipuri", 37059, "inc-eas", {"Beng"}, ancestors = {"inc-obn"}}

m["bpz"] = {"Bilba", 8843362, "poz-tim", Latn}

m["bqa"] = {"Tchumbuli", 11008162, "alv-ctn", Latn, ancestors = {"ak"}}

m["bqb"] = {"Bagusa", 4842178, "paa-tkw", Latn}

m["bqc"] = {"Boko", 34983, "dmn-bbu", Latn}

m["bqd"] = {"Bung", 3436612, "nic-bdn", Latn}

m["bqf"] = {"Baga Kaloum", 3502293, "alv-bag", Latn}

m["bqg"] = {"Bago-Kusuntu", 34878, "nic-gne"}

m["bqh"] = {"Baima", 674990, "sit-qia"}

m["bqi"] = {"Bakhtiari", 257829, "ira-swi", {"fa-Arab"}, ancestors = {"pal"}}

m["bqj"] = {"Bandial", 34872, "alv-jol", Latn}

m["bqk"] = {"Banda-Mbrès", 3450724, "bad-cnt", Latn}

m["bql"] = {"Bilakura", 4907504, "ngf-mad", Latn}

m["bqm"] = {"Wumboko", 37051, "bnt-kpw", Latn}

m["bqn"] = {"Bulgarian Sign Language", 3438325, "sgn"}

m["bqo"] = {"Balo", 34865, "nic-grs", Latn}

m["bqp"] = {"Busa", 35185, "dmn-bbu", Latn}

m["bqq"] = {"Biritai", 56382, "paa-lkp", Latn}

m["bqr"] = {"Burusu", 5001028, "poz-san", Latn}

m["bqs"] = {"Bosngun", 56838, "paa", Latn}

m["bqt"] = {"Bamukumbit", 35078, "nic-nge", Latn}

m["bqu"] = {"Boguru", 3438444, "bnt-boa", Latn}

m["bqv"] = {"Begbere-Ejar", 7194098, "nic-plc", Latn}

m["bqw"] = {"Buru (Nigeria)", 1017152, "nic-bds", Latn}

m["bqx"] = {"Baangi", 3450648, "nic-kam", Latn}

m["bqy"] = {"Bengkala Sign Language", 3322119, "sgn"}

m["bqz"] = {"Bakaka", 34855, "bnt-mne", Latn}

m["bra"] = {"Braj", 35243, "inc-cen", Deva, ancestors = {"inc-ohi"}, translit_module = "hi-translit"}

m["brb"] = {"Lave", 4957737, "mkh-ban"}

m["brc"] = {"Berbice Creole Dutch", 35215, "crp", Latn, ancestors = {"nl"}}

m["brd"] = {"Baraamu", 56804, "sit-new", Deva}

m["brf"] = {"Bera", 2896850, "bnt-kbi", Latn}

m["brg"] = {"Baure", 2839722, "awd", Latn}

m["brh"] = {"Brahui", 33202, "dra", {"Arab", "Latn"}}

m["bri"] = {"Mokpwe", 36428, "bnt-kpw", Latn}

m["brj"] = {"Bieria", 4904607, "poz-vnc", Latn}

m["brk"] = {"Birgid", 56823, "nub", Latn}

m["brl"] = {"Birwa", 3501019, "bnt-sts", Latn}

m["brm"] = {"Barambu", 34893, "znd", Latn}

m["brn"] = {"Boruca", 4946773, "cba", Latn}

m["bro"] = {"Brokkat", 56605, "sit-tib", {"Tibt", "Latn"}}

m["brp"] = {"Barapasi", 56995, "paa-egb", Latn}

m["brq"] = {"Breri", 4961835, "paa", Latn}

m["brr"] = {"Birao", 2904383, "poz-sls", Latn}

m["brs"] = {"Baras", 8827053, "poz", Latn}

m["brt"] = {"Bitare", 34946, "nic-tvn", Latn}

m["bru"] = {"Eastern Bru", 16115463, "mkh-kat", {"Latn", "Laoo", "Thai"}}

m["brv"] = {"Western Bru", 16113806, "mkh-kat", {"Latn", "Laoo"}}

m["brw"] = {"Bellari", 4883496, "dra"}

m["brx"] = {"Bodo (India)", 33223, "tbq-bdg", {"Deva", "Latn"}, translit_module = "brx-translit"}

m["bry"] = {"Burui", 5000976, "paa-spk", Latn}

m["brz"] = {"Bilbil", 4907473, "poz-ocw", Latn}

m["bsa"] = {"Abinomn", 56648, "qfa-iso", Latn}

m["bsb"] = {"Brunei Bisaya", 3450611, "poz-san", Latn}

m["bsc"] = {"Bassari", 35098, "alv-ten", Latn}

m["bse"] = {"Wushi", 36973, "nic-rnn", Latn}

m["bsf"] = {"Bauchi", 34974, "nic-shi", Latn}

m["bsg"] = {"Bashkardi", 33030, "ira-swi", {"fa-Arab", "Latn"}}

m["bsh"] = {"Kamkata-viri", 2605045, "nur-nor", {"Latn", "Arab"}, ancestors = {"iir-nur-pro"}}

m["bsi"] = {"Bassossi", 34940, "bnt-mne", Latn}

m["bsj"] = {"Bangwinji", 3446631, "alv-wjk", Latn}

m["bsk"] = {"Burushaski", 216286, "qfa-iso", Latn}

m["bsl"] = {"Basa-Gumna", 4866150, "nic-bas", Latn}

m["bsm"] = {"Busami", 5001255, "poz-hce", Latn}

m["bsn"] = {"Barasana", 2883843, "sai-tuc", Latn}

m["bso"] = {"Buso", 3441370, "cdc-est", Latn}

m["bsp"] = {"Baga Sitemu", 36466, "alv-bag", Latn}

m["bsq"] = {"Bassa", 34949, "kro-wkr", {"Latn", "Bass"}}

m["bsr"] = {"Bassa-Kontagora", 4866152, "nic-bas", Latn}

m["bss"] = {"Akoose", 34806, "bnt-mne", Latn}

m["bst"] = {"Basketo", 56531, "omv-ome", {"Ethi"}}

m["bsu"] = {"Bahonsuai", 2879298, "poz-btk", Latn}

m["bsv"] = {"Baga Sobané", 3450433, "alv-bag", Latn}

m["bsw"] = {"Baiso", 56615, "cus", Latn}

m["bsx"] = {"Yangkam", 36922, "nic-tar", Latn}

m["bsy"] = {"Sabah Bisaya", 12641557, "poz-san", Latn}

m["bta"] = {"Bata", 56254, "cdc-cbm", Latn}

m["btc"] = {"Bati (Cameroon)", 34944, "nic-mbw", Latn}

m["btd"] = {"Dairi Batak", 2891045, "btk", {"Latn", "Batk"}}

m["bte"] = {"Gamo-Ningi", 5520366, "nic-jer", Latn}

m["btf"] = {"Birgit", 56302, "cdc-est", Latn}

m["btg"] = {"Gagnoa Bété", 11005602, "kro-bet", Latn}

m["bth"] = {"Biatah Bidayuh", 2900881, "day", Latn}

m["bti"] = {"Burate", 56900, "paa-egb", Latn}

m["btj"] = {"Bacanese Malay", 8828608, "poz-mly", Latn}

m["btm"] = {"Mandailing Batak", 2891049, "btk", {"Latn", "Batk"}}

m["btn"] = {"Ratagnon", 13197, "phi", Latn}

m["bto"] = {"Iriga Bicolano", 12633026, "phi", Latn}

m["btp"] = {"Budibud", 4985086, "poz-ocw", Latn}

m["btq"] = {"Batek", 860315, "mkh-asl", Latn}

m["btr"] = {"Baetora", 2878874, "poz-vnc", Latn}

m["bts"] = {"Simalungun Batak", 2891054, "btk", {"Latn", "Batk"}}

m["btt"] = {"Bete-Bendi", 4887064, "nic-ben", Latn}

m["btu"] = {"Batu", 34964, "nic-tvn", Latn}

m["btv"] = {"Bateri", 3812564, "inc-dar", Deva}

m["btw"] = {"Butuanon", 5003156, "phi", Latn}

m["btx"] = {"Karo Batak", 33012, "btk", {"Latn", "Batk"}}

m["bty"] = {"Bobot", 3446788, "poz-cma", Latn}

m["btz"] = {"Alas-Kluet Batak", 2891042, "btk", {"Latn", "Batk"}}

m["bua"] = {"Buryat", 33120, "xgn", {"Cyrl", "Mong"}, translit_module = "bua-translit", override_translit = true, wikimedia_codes = {"bxr"}}

m["bub"] = {"Bua", 32928, "alv-bua", Latn}

m["bud"] = {"Ntcham", 36266, "nic-grm", Latn}

m["bue"] = {"Beothuk", 56234, nil, Latn}

m["buf"] = {"Bushoong", 3449964, "bnt-bsh", Latn}

m["bug"] = {"Buginese", 33190, "poz-ssw", {"Bugi", "Latn"}}

m["buh"] = {"Younuo Bunu", 56299, "hmn", Latn}

m["bui"] = {"Bongili", 35084, "bnt-ngn", Latn}

m["buj"] = {"Basa-Gurmana", 6432515, "nic-bas", Latn}

m["buk"] = {"Bukawa", 35043, "poz-ocw", Latn}

m["bum"] = {"Bulu (Cameroon)", 35028, "bnt-btb", Latn}

m["bun"] = {"Sherbro", 36339, "alv-mel", Latn}

m["buo"] = {"Terei", 56831, "paa-sbo", Latn}

m["bup"] = {"Busoa", 5002001, "poz", Latn}

m["buq"] = {"Brem", 4960502, "ngf", Latn}

m["bus"] = {"Bokobaru", 9228931, "dmn-bbu", Latn}

m["but"] = {"Bungain", 3450623, "qfa-tor", Latn}

m["buu"] = {"Budu", 3450207, "bnt-nya", Latn}

m["buv"] = {"Bun", 56351, "paa-yua", Latn}

m["buw"] = {"Bubi", 35017, "bnt-tso", Latn}

m["bux"] = {"Boghom", 3440412, "cdc-wst", Latn}

m["buy"] = {"Mmani", 35061, "alv-mel", Latn}

m["bva"] = {"Barein", 56285, "cdc-est", Latn}

m["bvb"] = {"Bube", 35110, "nic-bds", Latn}

m["bvc"] = {"Baelelea", 2878833, "poz-sls", Latn}

m["bvd"] = {"Baeggu", 2878850, "poz-sls", Latn}

m["bve"] = {"Berau Malay", 3915770, "poz-mly", Latn}

m["bvf"] = {"Boor", 56250, "cdc-est", Latn}

m["bvg"] = {"Bonkeng", 34958, "bnt-bbo", Latn}

m["bvh"] = {"Bure", 56294, "cdc-wst", Latn}

m["bvi"] = {"Belanda Viri", 35247, "nic-ser", Latn}

m["bvj"] = {"Baan", 3515067, "nic-ogo", Latn}

m["bvk"] = {"Bukat", 4986814, "poz-bnn", Latn}

m["bvl"] = {
    "Bolivian Sign Language", 1783590, "sgn", Latn -- when documented
}

m["bvm"] = {"Bamunka", 34882, "nic-rnn", Latn}

m["bvn"] = {"Buna", 3450516, "qfa-tor", Latn}

m["bvo"] = {"Bolgo", 35038, "alv-bua", Latn}

m["bvp"] = {"Bumang", 4997235, "mkh-pal"}

m["bvq"] = {"Birri", 56514, "csu-bkr", Latn}

m["bvr"] = {"Burarra", 4998124, "aus-arn", Latn}

m["bvt"] = {"Bati (Indonesia)", 4869253, "poz-cma", Latn}

m["bvu"] = {"Bukit Malay", 9230148, "poz-mly", Latn}

m["bvv"] = {"Baniva", 3515198, "awd", Latn}

m["bvw"] = {"Boga", 56262, "cdc-cbm", Latn}

m["bvx"] = {"Babole", 35180, "bnt-ngn", Latn}

m["bvy"] = {"Baybayanon", 16839275, "phi", Latn}

m["bvz"] = {"Bauzi", 56360, "paa-egb", Latn}

m["bwa"] = {"Bwatoo", 9232446, "poz-cln", Latn}

m["bwb"] = {"Namosi-Naitasiri-Serua", 3130290, "poz-occ", Latn}

m["bwc"] = {"Bwile", 3447440, "bnt-sbi", Latn}

m["bwd"] = {"Bwaidoka", 2929111, "poz-ocw", Latn}

m["bwe"] = {"Bwe Karen", 56994, "kar"}

m["bwf"] = {"Boselewa", 4947229, "poz-ocw", Latn}

m["bwg"] = {"Barwe", 8826802, "bnt-sna", Latn}

m["bwh"] = {"Bishuo", 34973, "nic-fru", Latn}

m["bwi"] = {"Baniwa", 3501735, "awd-nwk", Latn}

m["bwj"] = {"Láá Láá Bwamu", 11017275, "nic-bwa", Latn}

m["bwk"] = {"Bauwaki", 4873607, "ngf", Latn}

m["bwl"] = {"Bwela", 5003678, "bnt-bun", Latn}

m["bwm"] = {"Biwat", 56352, "paa-yua", Latn}

m["bwn"] = {"Wunai Bunu", 56452, "hmn"}

m["bwo"] = {"Shinasha", 56260, "omv-gon", Latn}

m["bwp"] = {"Mandobo Bawah", 12636155, "ngf", Latn}

m["bwq"] = {"Southern Bobo", 11001714, "dmn-snb", Latn}

m["bwr"] = {"Bura", 56552, "cdc-cbm", Latn}

m["bws"] = {"Bomboma", 9229429, "bnt-bun", Latn}

m["bwt"] = {"Bafaw", 34853, "bnt-bbo", Latn}

m["bwu"] = {"Buli (Ghana)", 35085, "nic-buk", Latn}

m["bww"] = {"Bwa", 3515058, "bnt-bta", Latn}

m["bwx"] = {"Bu-Nao Bunu", 56411, "hmn", Latn}

m["bwy"] = {"Cwi Bwamu", 11150714, "nic-bwa", Latn}

m["bwz"] = {"Bwisi", 35067, "bnt-sir", Latn}

m["bxa"] = {"Bauro", 2892068, "poz-sls", Latn}

m["bxb"] = {"Belanda Bor", 56678, "sdv-lon", Latn}

m["bxc"] = {"Molengue", 13345, "bnt-kel", Latn}

m["bxd"] = {"Pela", 57000, "tbq-brm"}

m["bxe"] = {"Ongota", 36344, "cus", Latn}

m["bxf"] = {"Bilur", 2903788, "poz-ocw", Latn}

m["bxg"] = {"Bangala", 34989, "bnt-bmo", Latn}

m["bxh"] = {"Buhutu", 4986329, "poz-ocw", Latn}

m["bxi"] = {"Pirlatapa", 10632195, "aus-kar", Latn}

m["bxj"] = {"Bayungu", 10427485, "aus-psw", Latn}

m["bxk"] = {"Bukusu", 32930, "bnt-msl", Latn}

m["bxl"] = {"Jalkunan", 11009787, "dmn-jje", Latn}

m["bxn"] = {"Burduna", 4998313, "aus-psw", Latn}

m["bxo"] = {"Barikanchi", 3450802, "crp", Latn, ancestors = {"ha"}}

m["bxp"] = {"Bebil", 34941, "bnt-btb", Latn}

m["bxq"] = {"Beele", 56238, "cdc-wst", Latn}

m["bxs"] = {"Busam", 35189, "nic-grs", Latn}

m["bxv"] = {"Berakou", 56796, "csu-bgr", Latn}

m["bxw"] = {"Banka", 3438402, "dmn-smg", Latn}

m["bxz"] = {"Binahari", 4913840, "ngf", Latn}

m["bya"] = {"Palawan Batak", 3450443, "phi", {"Tagb"}}

m["byb"] = {"Bikya", 33257, "nic-fru", Latn}

m["byc"] = {"Ubaghara", 36625, "nic-ucn", Latn}

m["byd"] = {"Benyadu'", 11173588, "day", Latn}

m["bye"] = {"Pouye", 7235814, "paa-spk", Latn}

m["byf"] = {"Bete", 32932, "nic-ykb", Latn}

m["byg"] = {"Baygo", 56836, "sdv-daj", Latn}

m["byh"] = {"Bujhyal", 56317, "sit-gma", Deva}

m["byi"] = {"Buyu", 5003401, "bnt-nyb", Latn}

m["byj"] = {"Binawa", 4913807, "nic-kau", Latn}

m["byk"] = {
    "Biao", 4902547, "qfa-tak", Latn -- also Hani?
}

m["byl"] = {"Bayono", 3503856, "ngf", Latn}

m["bym"] = {"Bidyara", 8842355, "aus-pam", Latn}

m["byn"] = {"Blin", 56491, "cus", {"Ethi", "Latn"}, translit_module = "translit-redirect"}

m["byo"] = {"Biyo", 56848, "tbq-lol", {"Latn", "Hani"}}

m["byp"] = {"Bumaji", 4997234, "nic-ben", Latn}

m["byq"] = {"Basay", 716647, "map", Latn}

m["byr"] = {"Baruya", 3450812, "ngf", Latn}

m["bys"] = {"Burak", 4998097, "alv-bwj", Latn}

m["byt"] = {"Berti", 35008, "ssa-sah", Latn}

m["byv"] = {"Medumba", 36019, "bai", Latn}

m["byw"] = {"Belhariya", 32961, "sit-kie", Deva}

m["byx"] = {"Qaqet", 3503009, "paa-bng", Latn}

m["byz"] = {"Banaro", 56858, "paa", Latn}

m["bza"] = {"Bandi", 34912, "dmn-msw", Latn}

m["bzb"] = {"Andio", 4754487, "poz-slb", Latn}

m["bzd"] = {"Bribri", 28400, "cba", Latn}

m["bze"] = {"Jenaama Bozo", 10950633, "dmn-snb", Latn}

m["bzf"] = {"Boikin", 56829, "paa-spk", Latn}

m["bzg"] = {"Babuza", 716615, "map"}

m["bzh"] = {"Mapos Buang", 2927370, "poz-ocw", Latn}

m["bzi"] = {"Bisu", 56852, "tbq-lol", {"Latn", "Thai"}}

m["bzj"] = {"Belizean Creole", 1363055, "crp", Latn, ancestors = {"en"}}

m["bzk"] = {"Nicaraguan Creole", 3504097, "crp", Latn, ancestors = {"en"}}

m["bzl"] = { -- supposedly also called "Bolano", but I can find no evidence of that
    "Boano (Sulawesi)", 4931258, "poz", Latn
}

m["bzm"] = {"Bolondo", 35071, "bnt-bun", Latn}

m["bzn"] = {"Boano (Maluku)", 4931255, "poz-cma", Latn}

m["bzo"] = {"Bozaba", 4952785, "bnt-ngn", Latn}

m["bzp"] = {"Kemberano", 12634399, "ngf-sbh", Latn}

m["bzq"] = {"Buli (Indonesia)", 2927952, "poz-hce", Latn}

m["bzr"] = {"Biri", 4087011, "aus-pam", Latn}

m["bzs"] = {"Brazilian Sign Language", 3436689, "sgn", Latn}

m["bzu"] = {"Burmeso", 56746, "paa-wpa", Latn}

m["bzv"] = {"Bebe", 34977, "nic-bbe", Latn}

m["bzw"] = {"Basa", 34898, "nic-bas", Latn}

m["bzx"] = {"Hainyaxo Bozo", 11159536, "dmn-snb", Latn}

m["bzy"] = {"Obanliku", 36276, "nic-ben", Latn}

m["bzz"] = {"Evant", 35259, "nic-tvc", Latn}

return m
