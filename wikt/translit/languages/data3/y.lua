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

local Latn = {"Latn"}

local m = {}

m["yaa"] = {"Yaminahua", 3026110, "sai-pan", scripts = Latn}

m["yab"] = {"Yuhup", 3573115, "sai-nad", scripts = Latn}

m["yac"] = {"Pass Valley Yali", 12953309, "ngf", scripts = Latn}

m["yad"] = {"Yagua", 3182567, scripts = Latn}

m["yae"] = {"Pumé", 3121835, scripts = Latn}

m["yaf"] = {"Yaka", 35588, "bnt-yak", scripts = Latn}

m["yag"] = {"Yámana", 531826, "qfa-iso", scripts = Latn}

m["yah"] = {"Yazghulami", 34186, "ira-shy", scripts = {"Latn", "Cyrl"}, ancestors = {"ira-shy-pro"}}

m["yai"] = {"Yagnobi", 34247, "ira-sgc", scripts = {"Latn", "Cyrl"}, translit_module = "tg-translit"}

m["yaj"] = {"Banda-Yangere", 8048561, "bad"}

m["yak"] = {"Yakima", 35976053, "nai-shp", ancestors = {"nai-spt"}, scripts = Latn}

m["yal"] = {"Yalunka", 35524, "dmn-sya"}

m["yam"] = {"Yamba", 36904, "nic-nka", scripts = Latn}

m["yan"] = {"Mayangna", 3302929, "nai-min", scripts = Latn}

m["yao"] = {"Yao", 36902, "bnt-rvm", scripts = Latn}

m["yap"] = {"Yapese", 34029, "poz-oce", scripts = Latn}

m["yaq"] = {"Yaqui", 34191, "azc-trc", scripts = Latn}

m["yar"] = {"Yabarana", 3571238, "sai-car", scripts = Latn}

m["yas"] = {"Gunu", 36358, "nic-ymb", scripts = Latn}

m["yat"] = {"Yambeta", 8048020, "nic-mbw", scripts = Latn}

m["yau"] = {"Yuwana", 5876347}

m["yav"] = {"Yangben", 12953315, "nic-ymb", scripts = Latn}

m["yaw"] = {"Yawalapití", 3450709, "awd", scripts = Latn}

m["yay"] = {"Agwagwune", 34736, "nic-ucn", scripts = Latn}

m["yaz"] = {"Lokaa", 3914439, "nic-uce", scripts = Latn}

m["yba"] = {"Yala", 3914920, "alv-ido", scripts = Latn}

m["ybb"] = {"Yemba", 36917, "bai", scripts = Latn}

m["ybe"] = {"Western Yugur", 34224, "trk-sib", ancestors = {"oui"}}

m["ybh"] = {"Yakkha", 56666, "sit-kie", scripts = {"Deva"}}

m["ybi"] = {"Yamphu", 56316, "sit-kie", scripts = {"Deva"}, translit_module = "ybi-translit"}

m["ybj"] = {"Hasha", 3915338, "nic-alu"}

m["ybk"] = {"Bokha", nil, "tbq-lol"}

m["ybl"] = {"Yukuben", 3915846, "nic-ykb"}

m["ybm"] = {"Yaben", 8046372, "ngf-mad"}

m["ybn"] = {"Yabaâna", 3450534, "awd", scripts = Latn}

m["ybo"] = {"Yabong", 8046383, "ngf-mad"}

m["ybx"] = {"Yawiyo", 8050463, "paa-spk"}

m["yby"] = {"Yaweyuha", 3571231, "paa-kag"}

m["ych"] = {"Chesu", nil, "tbq-lol"}

m["ycl"] = {"Lolopo", 56441, "tbq-lol"}

m["ycn"] = {"Yucuna", 3438356, "awd-nwk", scripts = Latn}

m["ycp"] = {"Chepya", 46603077, "tbq-lol"}

m["yda"] = {"Yanda", 8048318, "aus-pam"}

m["yde"] = {"Yangum Dey", nil, "qfa-tor", scripts = Latn}

m["ydg"] = {"Yidgha", 34179, "ira-mny", scripts = {"Arab"}, ancestors = {"ira-mny-pro"}}

m["ydk"] = {"Yoidik", 8054512, "ngf-mad"}

m["yea"] = {"Ravula", 7296830, "dra"}

m["yec"] = {"Yeniche", 1365342, "gmw", scripts = Latn, ancestors = {"gmh"}}

m["yee"] = {"Yimas", 36954, "paa-lsp"}

m["yei"] = {"Yeni", 34213, "nic-mmb"}

m["yej"] = {"Yevanic", 34200, "grk", scripts = {"Hebr"}, ancestors = {"grc"}, entry_name = {from = {"[" .. u(0x0591) .. "-" .. u(0x05BD) .. u(0x05BF) .. "-" .. u(0x05C5) .. u(0x05C7) .. "]"}, to = {}}}

m["yen"] = {"Yendang", nil, "alv-mye", scripts = Latn}

m["yer"] = {"Tarok", 3914953, "nic-tar", scripts = Latn}

m["yes"] = {"Yeskwa", 3914962, "nic-plc", scripts = Latn}

m["yet"] = {"Yetfa", 8053020, "paa-pau"}

m["yeu"] = {"Yerukula", 3535117, "dra"}

m["yev"] = {"Yapunda", 11044384, "qfa-tor", scripts = Latn}

m["yey"] = {"Yeyi", 8053347, "bnt"}

m["ygi"] = {"Yiningayi", nil, "aus-pam"}

m["ygl"] = {"Yangum Gel", nil, "qfa-tor", scripts = Latn}

m["ygm"] = {"Yagomi", 20771657, "ngf-fin", scripts = Latn}

m["ygp"] = {"Gepo", 5548692, "tbq-lol"}

m["ygr"] = {"Yagaria", 8046690, "paa-kag", scripts = Latn}

m["ygs"] = {"Yolngu Sign Language", 16211970, "sgn"}

m["ygu"] = {"Yugul", 8060437, "aus-arn"}

m["ygw"] = {"Yagwoia", 8046761, "ngf", scripts = Latn}

m["yha"] = {"Baha", 2879238, "qfa-kra"}

m["yhd"] = {"Judeo-Iraqi Arabic", 56599, "sem-arb", scripts = {"Hebr"}, ancestors = {"jrb"}}

m["yhl"] = {"Hlepho Phowa", nil, "tbq-lol"}

m["yia"] = {"Yinggarda", 3913777, "aus-psw", scripts = Latn}

m["yif"] = {"Ache", 10949828, "tbq-lol"}

m["yig"] = {"Wusa Nasu", 12953334, "tbq-lol"}

m["yii"] = {"Yidiny", 3053283, "aus-yid", scripts = Latn}

m["yij"] = {"Yindjibarndi", 3121073, "aus-nga", scripts = Latn}

m["yik"] = {"Dongshanba Lalo", 12953333, "tbq-lal"}

m["yil"] = {"Yindjilandji", 10723541, "aus-pam", scripts = Latn}

m["yim"] = {"Yimchungru Naga", 56348, "sit-aao", scripts = Latn}

m["yin"] = {"Yinchia", 12953981, "mkh-pal"}

m["yip"] = {"Pholo", 7187103, "tbq-lol"}

m["yiq"] = {"Miqie", 6827993, "tbq-lol"}

m["yir"] = {"North Awyu", 12642164, "ngf"}

m["yis"] = {"Yis", 8053831, "qfa-tor", scripts = Latn}

m["yit"] = {"Eastern Lalu", 12953328, "tbq-lal"}

m["yiu"] = {"Awu", 11163308, "tbq-lol"}

m["yiv"] = {"Northern Nisu", 25559454, "tbq-lol"}

m["yix"] = {"Axi Yi", 4830439, "tbq-lol"}

m["yiy"] = {"Yir-Yoront", 8053819, "aus-pmn", scripts = Latn}

m["yiz"] = {"Azhe", 4832535, "tbq-lol"}

m["yka"] = {"Yakan", 3571351, "poz-sbj"}

m["ykg"] = {"Northern Yukaghir", 56319, "qfa-yuk", scripts = {"Cyrl"}, translit_module = "ykg-translit"}

m["yki"] = {"Yoke", 3832977}

m["ykk"] = {"Yakaikeke", 8047041, "poz-oce"}

m["ykl"] = {"Khlula", 6401849, "tbq-lol"}

m["ykm"] = {"Kap", 8047048, "poz-ocw", scripts = Latn}

m["ykn"] = {"Kua-nsi", 6440952, "tbq-lol"}

m["yko"] = {"Yasa", 36899, "bnt-yko", scripts = Latn}

m["ykr"] = {"Yekora", 11732781, "ngf"}

m["ykt"] = {"Kathu", 6377155, "sit-mnz"}

m["yku"] = {"Kuamasi", 6441074, "tbq-lol"}

m["yky"] = {"Yakoma", 3571364, "nic-ngd"}

m["yla"] = {"Yaul", 8050336, "paa", scripts = Latn}

m["ylb"] = {"Yaleba", 37710600, "poz-oce"}

m["yle"] = {"Yele", 36942}

m["ylg"] = {"Yelogu", 8052024, "paa-spk"}

m["yli"] = {"Angguruk Yali", 3514481, "ngf"}

m["yll"] = {"Yil", 3501797, "qfa-tor", scripts = Latn}

m["ylm"] = {"Limi", 12953327, "tbq-lol"}

m["yln"] = {"Langnian Buyang", 2929025, "qfa-buy"}

m["ylo"] = {"Naluo Yi", 6961032, "tbq-lol"}

m["ylr"] = {"Yalarnnga", 3915686, "aus-pam", scripts = Latn}

m["ylu"] = {"Aribwaung", 11044246, "poz-ocw", scripts = Latn}

m["yly"] = {"Nyâlayu", 303154, "poz-cln", scripts = Latn}

m["ymb"] = {"Yambes", 8048022, "qfa-tor", scripts = Latn}

m["ymc"] = {"Southern Muji", nil, "tbq-lol"}

m["ymd"] = {"Muda", 6931494, "tbq-lol"}

m["yme"] = {"Yameo", 3121032}

m["ymg"] = {"Yamongeri", 11008893, "bnt-mon", ancestors = {"lol"}, scripts = Latn}

m["ymh"] = {"Mili", 12953329, "tbq-lol"}

m["ymi"] = {"Moji", 6895060, "tbq-lol"}

m["ymk"] = {"Makwe", 6740513, "bnt-swh"}

m["yml"] = {"Iamalele", 8047849, "poz-ocw", scripts = Latn}

m["ymm"] = {"Maay", 36221, "cus", scripts = Latn}

m["ymn"] = {"Sunum", 8048083, "poz-ocw", scripts = Latn}

m["ymo"] = {"Yangum Mon", nil, "qfa-tor", scripts = Latn}

m["ymp"] = {"Yamap", 8047913, "poz-ocw", scripts = Latn}

m["ymq"] = {"Qila Muji", nil, "tbq-lol"}

m["ymr"] = {"Malasar", 16889525, "dra"}

m["yms"] = {"Mysian", 2577228, "ine"}

m["ymx"] = {"Northern Muji", nil, "tbq-lol"}

m["ymz"] = {"Muzi", 6944445, "tbq-lol"}

m["yna"] = {"Aluo", 4737539, "tbq-lol"}

m["ynd"] = {"Yandruwandha", 8048335, "aus-kar", scripts = Latn}

m["yne"] = {"Lang'e", 6485577, "tbq-lol"}

m["yng"] = {"Yango", 13123599, "nic-nkk", scripts = Latn}

m["ynk"] = {"Naukanski", 27963, "ypk", scripts = {"Cyrl", "Latn"}}

m["ynl"] = {"Yangulam", 8048663, "ngf-mad"}

m["ynn"] = {"Yana", 56419, "qfa-iso"}

m["yno"] = {"Yong", 8054978, "tai-swe"}

m["yns"] = {"Yansi", 36953, "bnt-yak"}

m["ynu"] = {"Yahuna", 8050347, "sai-tuc"}

m["yob"] = {"Yoba", 8054220, "poz-ocw", scripts = Latn}

m["yog"] = {"Yogad", 8054343, "phi"}

m["yoi"] = {"Yonaguni", 34243, "jpx-ryu", scripts = {"Jpan"}}

m["yol"] = {"Yola", 56395, "gmw", scripts = Latn, ancestors = {"enm"}}

m["yom"] = {"Yombe", 10961975, "bnt-kng", scripts = Latn}

m["yon"] = {"Yongkom", 8055002, "ngf-okk"}

m["yox"] = {"Yoron", 2424943, "jpx-ryu", scripts = {"Jpan"}}

m["yoy"] = {"Yoy", 3503717, "tai"}

m["ypa"] = {"Phala", 36211907, "tbq-lol"}

m["ypb"] = {"Labo Phowa", nil, "tbq-lol"}

m["ypg"] = {"Phola", nil, "tbq-lol"}

m["yph"] = {"Phupha", 7188378, "tbq-lol"}

m["ypm"] = {"Phuma", nil, "tbq-lol"}

m["ypn"] = {"Ani Phowa", 33590104, "tbq-lol"}

m["ypo"] = {"Alo Phola", 33522157, "tbq-lol"}

m["ypp"] = {"Phupa", 48565467, "tbq-lol"}

m["ypz"] = {"Phuza", 48565339, "tbq-lol"}

m["yra"] = {"Yerakai", 8052531}

m["yrb"] = {"Yareba", 3571876, "ngf"}

m["yre"] = {"Yaouré", 3913951, "dmn-mda"}

m["yri"] = {"Yarí", 8049616}

m["yrk"] = {"Tundra Nenets", 36452, "syd", scripts = {"Cyrl"}, entry_name = {from = {"Ӑ", "ӑ", "[ӖЀ]", "[ӗѐ]", "[ӢЍ]", "[ӣѝ]", "Ӯ", "ӯ", BREVE, MACRON, GRAVE, ACUTE, DOTABOVE}, to = {"А", "а", "Е", "е", "И", "и", "У", "у"}}}

m["yrl"] = {"Nheengatu", 34333, "tup-gua"}

m["yrn"] = {"Yerong", 3572191, "qfa-buy"}

m["yro"] = {"Yaroamë", 24190396, "sai-ynm", scripts = Latn}

m["yrw"] = {"Yarawata", 8049237, "ngf-mad"}

m["yry"] = {"Yarluyandi", 33061540, "aus-kar"}

m["ysc"] = {"Jassic", 2479368, "xsc", scripts = Latn, ancestors = {"oos"}}

m["ysd"] = {"Samatao", 7408902, "tbq-lol"}

m["ysg"] = {"Sonaga", 7560736, "tbq-lol"}

m["ysl"] = {"Yugoslavian Sign Language", 8060373, "sgn"}

m["ysn"] = {"Sani", 1055287, "tbq-lol", scripts = {"Yiii"}}

m["yso"] = {"Nisi", 12953326, "sit-mnz"}

m["ysp"] = {"Southern Lolopo", 12633989, "tbq-lol"}

m["ysr"] = {"Sirenik", 28156, "ypk", scripts = {"Cyrl"}}

m["yss"] = {"Yessan-Mayo", 8052927, "paa-spk", scripts = Latn}

m["ysy"] = {"Sanie", 7418287, "tbq-lol"}

m["yta"] = {"Talu", 16999095, "tbq-lol"}

m["ytl"] = {"Tanglang", 7786695, "tbq-lol"}

m["ytp"] = {"Thopho", 7796015, "tbq-lol"}

m["ytw"] = {"Yout Wam", nil, "ngf-fin", scripts = Latn}

m["yty"] = {"Yatay", nil, "aus-pmn"}

m["yua"] = {"Yucatec Maya", 13354, "myn", scripts = Latn}

m["yub"] = {"Yugambal", 3446663}

m["yuc"] = {"Yuchi", 34204, "qfa-iso"}

m["yud"] = {"Judeo-Tripolitanian Arabic", 56598, "sem-arb", scripts = {"Hebr"}, ancestors = {"jrb"}}

m["yue"] = {"Cantonese", 9186, "zhx", scripts = {"Hani", "Latn"}, wikimedia_codes = {"yue", "zh-yue"}, ancestors = {"ltc"}}

m["yuf"] = {"Havasupai-Walapai-Yavapai", 3565286, "nai-yuc", scripts = Latn}

m["yug"] = {"Yug", 56311, "qfa-yen"}

m["yui"] = {"Yurutí", 3573266, "sai-tuc", scripts = Latn}

m["yuj"] = {"Karkar-Yuri", 2992906, "paa-pau", scripts = Latn}

m["yuk"] = {"Yuki", 36993, scripts = Latn}

m["yul"] = {"Yulu", 3915595, "csu-bba"}

m["yum"] = {"Yuma", 3573199, "nai-yuc", scripts = Latn}

m["yun"] = {"Bena", 3913283, "alv-yun"}

m["yup"] = {"Yukpa", 3441447, "sai-car", scripts = Latn}

m["yuq"] = {"Yuqui", 8061440, "tup-gua", scripts = Latn}

m["yur"] = {"Yurok", 34685, "aql", scripts = Latn}

m["yut"] = {"Yopno", 12953338, "ngf-fin", scripts = Latn}

m["yuw"] = {"Finisterre Yau", 12953319, "ngf-fin", scripts = Latn}

m["yux"] = {"Southern Yukaghir", 56545, "qfa-yuk", scripts = {"Cyrl"}, translit_module = "yux-translit"}

m["yuy"] = {"East Yugur", 29902, "xgn"}

m["yuz"] = {"Yuracare", 2640646, "qfa-iso", scripts = Latn}

m["yva"] = {"Yawa", 3572020, "paa", scripts = Latn}

m["yvt"] = {"Yavitero", 3441427, "awd", scripts = Latn}

m["ywa"] = {"Kalou", 6354305, "paa-spk", scripts = Latn}

m["ywg"] = {"Yinhawangka", 8053734, "aus-nga", scripts = Latn}

m["ywl"] = {"Western Lalu", 12953325, "tbq-lal"}

m["ywn"] = {"Yawanawa", 10322118, "sai-pan", scripts = Latn}

m["ywq"] = {"Nasu", 25559456, "tbq-lol", scripts = {"Plrd", "Yiii"}}

m["ywr"] = {"Yawuru", 8050479, "aus-nyu", scripts = Latn}

m["ywt"] = {"Xishanba Lalo", 12953336, "tbq-lal"}

m["ywu"] = {"Wumeng Nasu", 25559442, "tbq-lol"}

m["yww"] = {"Yawarawarga", 10723454, "aus-kar", scripts = Latn}

m["yxa"] = {"Mayawali", 33060513, "aus-pam", scripts = Latn}

m["yxg"] = {"Yagara", nil, "aus-pam", scripts = Latn}

m["yxl"] = {"Yarli", 46264708, "aus-pam", scripts = Latn}

m["yxm"] = {"Yinwum", 8053763, "aus-pam", scripts = Latn}

m["yxu"] = {"Yuyu", 8062232, "aus-pam", scripts = Latn}

m["yxy"] = {"Yabula Yabula", 8046394, "aus-pam", scripts = Latn}

m["yyu"] = {"Torricelli Yau", 8050328, "qfa-tor", scripts = Latn}

m["yyz"] = {"Ayizi", 20527363, "tbq-lol"}

m["yzg"] = {"E'ma Buyang", 16115619, "qfa-buy"}

m["yzk"] = {"Zokhuo", 8073523, "tbq-lol"}

return m
