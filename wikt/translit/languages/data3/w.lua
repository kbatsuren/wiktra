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

m["waa"] = {"Walla Walla", 12953960, "nai-shp", ancestors = {"nai-spt"}, scripts = Latn}

m["wab"] = {"Wab", 11222271, "poz-ocw", scripts = Latn}

m["wac"] = {"Wasco-Wishram", 12645081, "nai-ckn", scripts = Latn}

m["wad"] = {"Wandamen", 2806128, "poz-hce", scripts = Latn}

m["waf"] = {"Wakoná", 7961205}

m["wag"] = {"Wa'ema", 12953264, "poz-ocw", scripts = Latn}

m["wah"] = {"Watubela", 7975070, "poz-cma", scripts = Latn}

m["waj"] = {"Waffa", 3565058, "paa-kag", scripts = Latn}

m["wal"] = {"Wolaytta", 36943, "omv-nom"}

m["wam"] = {"Massachusett", 56519, "alg-eas", scripts = Latn}

m["wan"] = {"Wan", 3913272, "dmn-nbe"}

m["wao"] = {"Wappo", 56530}

m["wap"] = {"Wapishana", 3450493, "awd", scripts = Latn}

m["waq"] = {"Wageman", 3436843, "aus-gun", scripts = Latn}

m["war"] = {"Waray-Waray", 34279, "phi", scripts = Latn}

m["was"] = {"Washo", 34198}

m["wat"] = {"Kaninuwa", 12952565, "poz-ocw", scripts = Latn}

m["wau"] = {"Wauja", 3450522, "awd", scripts = Latn}

m["wav"] = {"Waka", 3913394, "alv-mye"}

m["waw"] = {"Waiwai", 56632, "sai-car", scripts = Latn}

m["wax"] = {"Watam", 3566597, "paa", scripts = Latn}

m["way"] = {"Wayana", 5908753, "sai-car", scripts = Latn}

m["waz"] = {"Wampur", 7966957, "poz-ocw", scripts = Latn}

m["wba"] = {"Warao", 36946, "qfa-iso", scripts = Latn}

m["wbb"] = {"Wabo", 7958701, "poz-hce", scripts = Latn}

m["wbe"] = {"Waritai", 7969453, "paa-lkp", scripts = Latn}

m["wbf"] = {"Wara", 3914052, "alv-wan"}

m["wbh"] = {"Wanda", 7967153, "bnt-mwi"}

m["wbi"] = {"Wanji", 3376818, "bnt-bki", scripts = Latn}

m["wbj"] = {"Alagwa", 56621, "cus"}

m["wbk"] = {"Waigali", 34196, "nur-sou"}

m["wbl"] = {"Wakhi", 34208, "xsc-skw", scripts = {"Cyrl", "Latn", "Arab"}, translit_module = "translit-redirect"}

m["wbm"] = {"Wa", 12644869, "mkh-pal"}

m["wbp"] = {"Warlpiri", 1639998, "aus-pam", scripts = Latn}

m["wbq"] = {"Waddar", 6708569, "dra", ancestors = {"te"}}

m["wbr"] = {"Wagdi", 7959490, "inc-bhi"}

m["wbt"] = {"Wanman", 7967989}

m["wbv"] = {"Wajarri", 3913856, "aus-psw", scripts = Latn}

m["wbw"] = {"Woi", 8029092, "poz-hce", scripts = Latn}

m["wca"] = {"Yanomámi", 7960056}

m["wci"] = {"Waci Gbe", 36987, "alv-gbe"}

m["wdd"] = {"Wandji", 36976, "bnt-nze"}

m["wdg"] = {"Wadaginam", 7958930}

m["wdj"] = {"Wadjiginy", 7959489}

m["wdu"] = {"Wadjigu", 10719025}

m["wdy"] = {"Wadjabangayi", nil}

m["wea"] = {"Wewaw", 15895870}

m["wec"] = {"Wè Western", 11159067, "kro-wee"}

m["wed"] = {"Wedau", 12953294, "poz-ocw", scripts = Latn}

m["weh"] = {"Weh", 7979690, "nic-rnw"}

m["wei"] = {"Kiunum", 7983230}

m["wem"] = {"Weme Gbe", 18379970, "alv-gbe"}

m["weo"] = {"Wemale", 7982165, "poz-cma"}

m["wer"] = {"Weri", 11732752, "paa"}

m["wes"] = {"Cameroon Pidgin", 35541, "crp", scripts = Latn, ancestors = {"en"}}

m["wet"] = {"Perai", 12953035, "poz-tim"}

m["weu"] = {"Welaung", 7980503, "tbq-kuk"}

m["wew"] = {"Weyewa", 4314526, "poz-cet", scripts = Latn}

m["wfg"] = {"Yafi", 8074520, "paa-pau"}

m["wga"] = {"Wagaya", 7959487, "aus-pam"}

m["wgb"] = {"Wagawaga", 7959485}

m["wgg"] = {"Wangganguru", 7967859, "aus-kar", scripts = Latn}

m["wgi"] = {"Wahgi", 3565122}

m["wgo"] = {"Waigeo", 7959937, "poz-hce"}

m["wgu"] = {"Wirangu", 2092286, "aus-pam", scripts = Latn}

m["wgy"] = {"Warrgamay", 3915942, "aus-pam", scripts = Latn}

m["wha"] = {"Manusela", 3287127, "poz-cma"}

m["whg"] = {"North Wahgi", 12953273, "ngf"}

m["whk"] = {"Wahau Kenyah", 7959737, "poz-swa"}

m["whu"] = {"Wahau Kayan", 12473397}

m["wib"] = {"Southern Toussian", 11158982, "alv-sav"}

m["wic"] = {"Wichita", 56513, "cdd", scripts = Latn}

m["wie"] = {"Wik-Epa", 10720035, "aus-pmn"}

m["wif"] = {"Wik-Keyangan", 10720037, "aus-pmn"}

m["wig"] = {"Wik-Ngathana", 3915695, "aus-pmn"}

m["wih"] = {"Wik-Me'anha", 10720039, "aus-pmn"}

m["wii"] = {"Minidien", 6865237, "qfa-tor", scripts = Latn}

m["wij"] = {"Wik-Iiyanh", 10720036, "aus-pmn"}

m["wik"] = {"Wikalkan", 7999800, "aus-pmn"}

m["wil"] = {"Wilawila", 10720050, "aus-wor"}

m["wim"] = {"Wik-Mungkan", 2092246, "aus-pmn", scripts = Latn}

m["win"] = {"Winnebago", 1957108, "sio-msv", scripts = Latn}

m["wir"] = {"Wiraféd", 12953970, "tup-gua", scripts = Latn}

m["wiu"] = {"Wiru", 8027044, "paa"}

m["wiv"] = {"Muduapa", 3121040, "poz-ocw", scripts = Latn}

m["wiy"] = {"Wiyot", 36937, "aql", scripts = Latn}

m["wja"] = {"Waja", 3914415, "alv-wjk"}

m["wji"] = {"Warji", 3440381}

m["wka"] = {"Kw'adza", 3807652, "cus"}

m["wkb"] = {"Kumbaran", 16878146, "dra"}

m["wkd"] = {"Mo", 7960881, "poz-ocw", scripts = Latn}

m["wkl"] = {"Kalanadi", 6350515, "dra"}

m["wku"] = {"Kunduvadi", 6444383, "dra"}

m["wkw"] = {"Wakawaka", 10719110, "aus-pam"}

m["wky"] = {"Wangkayutyuru", 33060533, "aus-kar"}

m["wla"] = {"Walio", 7961958}

m["wlc"] = {"Mwali Comorian", 3319155, "bnt-com", scripts = Latn, sort_key = {from = {"ɓ", "ɗ"}, to = {"bz", "dz"}}}

m["wle"] = {"Wolane", 12645275, "sem-eth"}

m["wlg"] = {"Kunbarlang", 5618523, "aus-gun", scripts = Latn}

m["wli"] = {"Waioli", 7960241}

m["wlk"] = {"Wailaki", 20832, "ath-pco", scripts = Latn}

m["wll"] = {"Wali (Sudan)", 30597440, "nub-hil"}

m["wlm"] = {"Middle Welsh", 2487263, "cel-bry", scripts = Latn, entry_name = {from = {"Ð", "ð"}, to = {"D", "d"}}, sort_key = {from = {"K", "k"}, to = {"C", "c"}}, ancestors = {"owl"}}

m["wlo"] = {"Wolio", 1185114, "poz-wot", scripts = {"Latn", "Arab"}}

m["wlr"] = {"Wailapa", 7960062, "poz-vnc", scripts = Latn}

m["wls"] = {"Wallisian", 36979, "poz-pnp", scripts = Latn}

m["wlu"] = {"Wuliwuli", 8039208}

m["wlv"] = {"Wichí Lhamtés Vejoz", 13526867, "sai-wic", scripts = Latn}

m["wlw"] = {"Walak", 7961258}

m["wlx"] = {"Wali (Ghana)", 36895, "nic-mre", scripts = Latn}

m["wly"] = {"Waling", 7961957, "sit-kic", ancestors = {"bap"}}

m["wmb"] = {"Wambaya", 2083197, "aus-mir"}

m["wmc"] = {"Wamas", 7966909, "ngf-mad"}

m["wmd"] = {"Mamaindé", 3284890, "sai-nmk", scripts = Latn}

m["wme"] = {"Wambule", 56785, "sit-kiw", scripts = Latn}

m["wmh"] = {"Waima'a", 7960132, "poz-tim", scripts = Latn}

m["wmi"] = {"Wamin", 7966934}

m["wmm"] = {"Maiwa (Indonesia)", 6737226, "poz", scripts = Latn}

m["wmn"] = {"Waamwang", 7958575, "poz-cln", scripts = Latn}

m["wmo"] = {"Wam", 8030620, "qfa-tor", scripts = Latn}

m["wms"] = {"Wambon", 7966922, "ngf", scripts = Latn}

m["wmt"] = {"Walmajarri", 2232696, "aus-pam", scripts = Latn}

m["wmw"] = {"Mwani", 3042206, "bnt-swh", scripts = Latn}

m["wmx"] = {"Womo", 8031646, "paa-msk", scripts = Latn}

m["wnb"] = {"Wanambre", 7967057, "ngf", scripts = Latn}

m["wnc"] = {"Wantoat", 7968184, "ngf-fin", scripts = Latn}

m["wnd"] = {"Wandarang", 3913767, "aus-arn", scripts = Latn}

m["wne"] = {"Waneci", 7967334, "ira-pat", scripts = {"ps-Arab"}, ancestors = {"ira-pat-pro"}}

m["wng"] = {"Wanggom", 11732736, "ngf", scripts = Latn}

m["wni"] = {"Ndzwani Comorian", 2850262, "bnt-com", scripts = Latn, sort_key = {from = {"ɓ", "ɗ"}, to = {"bz", "dz"}}}

m["wnk"] = {"Wanukaka", 2370136, "poz", scripts = Latn}

m["wnm"] = {"Wanggamala", 7967860, "aus-kar", scripts = Latn}

m["wno"] = {"Wano", 3566166, "ngf", scripts = Latn}

m["wnp"] = {"Wanap", 7967060, "qfa-tor", scripts = Latn}

m["wnu"] = {"Usan", 7901709, "ngf", scripts = Latn}

m["wnw"] = {"Wintu", 56754, "nai-wtq", scripts = Latn}

m["wny"] = {"Wanyi", 7968201, "aus-gar", scripts = Latn}

m["woa"] = {"Tyaraity", 10706951}

m["wob"] = {"Wè Northern", 3915363, "kro-wee"}

m["woc"] = {"Wogeo", 8029061, "poz-ocw", scripts = Latn}

m["wod"] = {"Wolani", 8029704, "ngf", scripts = Latn}

m["woe"] = {"Woleaian", 34037, "poz-mic", scripts = Latn}

m["wog"] = {"Wogamusin", 56991, "paa-spk", scripts = Latn}

m["woi"] = {"Kamang", 8029096, "ngf", scripts = Latn}

m["wok"] = {"Longto", 35795, "alv-dur", scripts = Latn}

m["wom"] = {"Perema", 3913378, "alv-lek", scripts = Latn}

m["won"] = {"Wongo", 8032058, "bnt-bsh", scripts = Latn}

m["woo"] = {"Manombai", 6751253, "poz", scripts = Latn}

m["wor"] = {"Woria", 8034514, "paa-egb", scripts = Latn}

m["wos"] = {"Hanga Hundi", 6450232, "paa-spk", scripts = Latn}

m["wow"] = {"Wawonii", 3566780, "poz-btk", scripts = Latn}

m["wpc"] = {"Wirö", 12953684, scripts = Latn}

m["wra"] = {"Warapu", 56739, "paa-msk", scripts = Latn}

m["wrb"] = {"Warluwara", 3913761, "aus-pam", scripts = Latn}

m["wrg"] = {"Warungu", 7970854, "aus-pam", scripts = Latn}

m["wrh"] = {"Wiradhuri", 3913840, "aus-cww", scripts = Latn}

m["wri"] = {"Wariyangga", 10719289, "aus-psw", scripts = Latn}

m["wrk"] = {"Garawa", 2524022, "aus-gar", scripts = Latn}

m["wrl"] = {"Warlmanpa", 3913823, "aus-pam"}

m["wrm"] = {"Warumungu", 1764544}

m["wrn"] = {"Warnang", 36971, "alv-hei"}

m["wro"] = {"Worora", 3504106, "aus-wor"}

m["wrp"] = {"Waropen", 7969851, "poz-hce", scripts = Latn}

m["wrr"] = {"Wardaman", 3913842, "aus-yng"}

m["wrs"] = {"Waris", 3502610, "paa-brd"}

m["wru"] = {"Waru", 3566463}

m["wrv"] = {"Waruna", 7971078}

m["wrw"] = {"Gugu Warra", 5615286}

m["wrx"] = {"Wae Rana", 7959375}

m["wrz"] = {"Warray", 7969971, "aus-gun"}

m["wsa"] = {"Warembori", 56459}

m["wsi"] = {"Wusi", 8039349, "poz-vnc", scripts = Latn}

m["wsk"] = {"Waskia", 7972683, "ngf-mad", scripts = Latn}

m["wsr"] = {"Owenia", 7114727}

m["wss"] = {"Wasa", 36914, "alv-ctn", ancestors = {"ak"}}

m["wsu"] = {"Wasu", 7972892}

m["wsv"] = {"Wotapuri-Katarqalai", 3877569, "inc-dar"}

m["wtf"] = {"Watiwa", 35316, "ngf-mad", scripts = Latn}

m["wth"] = {"Wathaurong", 7974656, "aus-pam", scripts = Latn}

m["wti"] = {"Berta", 33178}

m["wtk"] = {"Watakataui", 7972975, "paa-spk"}

m["wtm"] = {"Mewati", 2605943, "inc-wes"}

m["wtw"] = {"Wotu", 12473488}

m["wua"] = {"Wikngenchera", 10720045, "aus-pmn"}

m["wub"] = {"Wunambal", 3913805, "aus-wor"}

m["wud"] = {"Wudu", 36972, "alv-gbe", scripts = Latn}

m["wuh"] = {"Wutunhua", 1012917}

m["wul"] = {"Silimo", 11732514, "ngf"}

m["wum"] = {"Wumbvu", 36891, "bnt-kel", scripts = Latn}

m["wun"] = {"Bungu", 4997686, "bnt-mby", scripts = Latn}

m["wur"] = {"Wurrugu", 8039305, "aus-wdj"}

m["wut"] = {"Wutung", 56743, "paa-msk", scripts = Latn}

m["wuu"] = {"Wu", 34290, "zhx", scripts = {"Hani"}, ancestors = {"ltc"}}

m["wuv"] = {"Wuvulu-Aua", 3062746, "poz-aay"}

m["wux"] = {"Wulna", 13591670}

m["wuy"] = {"Wauyai", 12953295, "poz-hce"}

m["wwa"] = {"Waama", 7958576, "nic-eov", scripts = Latn}

m["wwo"] = {"Dorig", 3037047, "poz-vnc"}

m["wwr"] = {"Warrwa", 7970852}

m["www"] = {"Wawa", 36889, "nic-mmb", scripts = Latn}

m["wxa"] = {"Waxianghua", 2252191}

m["wxw"] = {"Wardandi", nil}

m["wya"] = {"Wyandot", 1185119, "iro", scripts = Latn}

m["wyb"] = {"Ngiyambaa", 3913825, "aus-cww", scripts = Latn}

m["wyi"] = {"Woiwurrung", 8029099, "aus-pam", scripts = Latn}

m["wym"] = {"Vilamovian", 56485, "gmw", scripts = Latn, ancestors = {"gmh"}, entry_name = {from = {"ȧ", "ḱ"}, to = {"a", "k"}}}

m["wyr"] = {"Wayoró", 2875044, "tup"}

m["wyy"] = {"Western Fijian", 3062751, "poz-occ"}

return m
