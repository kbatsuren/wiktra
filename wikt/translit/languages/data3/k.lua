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

local Cyrl = {"Cyrl"}
local Deva = {"Deva"}
local Latn = {"Latn"}
local Latinx = {"Latinx"}

local m = {}

m["kaa"] = {"Karakalpak", 33541, "trk-kno", scripts = {"Latn", "Cyrl"}}

m["kab"] = {"Kabyle", 35853, "ber", scripts = Latn}

m["kac"] = {"Jingpho", 33332, "sit-jnp", scripts = {"Latn", "Mymr"}}

m["kad"] = {"Kadara", 3914011, "nic-plc", scripts = Latn}

m["kae"] = {"Ketangalan", 2779411, "map"}

m["kaf"] = {"Katso", 246122, "tbq-lol"}

m["kag"] = {"Kajaman", 6348863, "poz", scripts = Latn}

m["kah"] = {"Fer", 5443742, "csu-bgr", scripts = Latn}

m["kai"] = {"Karekare", 3438770, "cdc-wst", scripts = Latn}

m["kaj"] = {"Jju", 35401, "nic-plc", scripts = Latn}

m["kak"] = {"Kayapa Kallahan", 3192220, "phi", scripts = Latn}

m["kam"] = {"Kamba", 2574767, "bnt-kka", scripts = Latn}

m["kao"] = {"Kassonke", 36905, "dmn-wmn", scripts = Latn}

m["kap"] = {"Bezhta", 33054, "cau-tsz", scripts = Cyrl, translit_module = "kap-translit"}

m["kaq"] = {"Capanahua", 2937196, "sai-pan", scripts = Latn}

m["kaw"] = {
    "Old Javanese",
    49341,
    "poz-sus",
    scripts = {"Latn", "Java"},
    translit_module = "jv-translit" -- same as jv
}

m["kax"] = {"Kao", 3192799}

m["kay"] = {"Kamayurá", 3192336, "tup-gua", scripts = Latn}

m["kba"] = {"Kalarko", 5517764, "aus-pam", scripts = Latn}

m["kbb"] = {"Kaxuyana", 12953626, "sai-car", scripts = Latn}

m["kbc"] = {"Kadiwéu", 18168288, "sai-guc", scripts = Latn}

m["kbd"] = {"Kabardian", 33522, "cau-cir", scripts = Cyrl, translit_module = "kbd-translit", override_translit = true}

m["kbe"] = {"Kanju", 10543322, "aus-pam", scripts = Latn}

m["kbh"] = {"Camsá", 2842667, "qfa-iso", scripts = Latn}

m["kbi"] = {"Kaptiau", 6367294, "poz-oce", scripts = Latn}

m["kbj"] = {"Kari", 6370438, "bnt-boa", scripts = Latn}

m["kbk"] = {"Grass Koiari", 12952642, "ngf", scripts = Latn}

m["kbm"] = {"Iwal", 3156391, "poz-ocw", scripts = Latn}

m["kbn"] = {"Kare (Africa)", 35554, "alv-mbm", scripts = Latn}

m["kbo"] = {"Keliko", 11275553, "csu-mma"}

m["kbp"] = {"Kabiyé", 35475, "nic-gne", scripts = Latn}

m["kbq"] = {"Kamano", 11732272, "paa-kag", scripts = Latn}

m["kbr"] = {"Kafa", 35481, "omv-gon", scripts = {"Ethi", "Latn"}}

m["kbs"] = {"Kande", 35556, "bnt-tso", scripts = Latn}

m["kbt"] = {"Gabadi", 3291159, "poz-ocw", scripts = Latn}

m["kbu"] = {"Kabutra", 10966761, "inc-wes", ancestors = {"raj"}}

m["kbv"] = {"Kamberataro", 5261289, "paa", scripts = Latn}

m["kbw"] = {"Kaiep", 6347632, "poz-ocw", scripts = Latn}

m["kbx"] = {"Ap Ma", 56298, "paa-ram"}

m["kbz"] = {"Duhwa", 56295, "cdc-wst", scripts = Latn}

m["kca"] = {"Khanty", 33563, "urj-ugr", scripts = Cyrl, translit_module = "kca-translit", override_translit = true}

m["kcb"] = {"Kawacha", 11732302, "ngf"}

m["kcc"] = {"Lubila", 3914381, "nic-uce", scripts = Latn}

m["kcd"] = {"Ngkâlmpw Kanum", 12952566, "paa-yam"}

m["kce"] = {"Kaivi", 6348685, "nic-kau"}

m["kcf"] = {"Ukaan", 36651, "nic-bco"}

m["kcg"] = {"Tyap", 3912765, "nic-plc"}

m["kch"] = {"Vono", 3913920, "nic-kau"}

m["kci"] = {"Kamantan", 3914019, "nic-plc"}

m["kcj"] = {"Kobiana", 35609, "alv-nyn"}

m["kck"] = {"Kalanga", 33672, "bnt-sho", scripts = Latn}

m["kcl"] = {"Kala", 6349982, "poz-ocw", scripts = Latn}

m["kcm"] = {"Tar Gula", 277963, "csu-bba"}

m["kcn"] = {"Nubi", 36388, "crp", scripts = {"Latn", "Arab"}, ancestors = {"apd"}, entry_name = {from = {"Á", "á", "É", "é", "Í", "í", "Ó", "ó", "Ú", "ú"}, to = {"A", "a", "E", "e", "I", "i", "O", "o", "U", "u"}}}

m["kco"] = {"Kinalakna", 11732320, "ngf"}

m["kcp"] = {"Kanga", 6362384, "qfa-kad", scripts = Latn}

m["kcq"] = {"Kamo", 3914879, "alv-wjk"}

m["kcr"] = {"Katla", 35688, "nic-ktl"}

m["kcs"] = {"Koenoem", 3438755, "cdc-wst"}

m["kct"] = {"Kaian", 6347538, "paa-ram"}

m["kcu"] = {"Kikami", 3915212, "bnt-ruv", scripts = Latn}

m["kcv"] = {"Kete", 3195598, "bnt-lub"}

m["kcw"] = {"Kabwari", 6344539, "bnt-glb"}

m["kcx"] = {"Kachama-Ganjule", 12634070, "omv-eom"}

m["kcy"] = {"Korandje", 33427, "son"}

m["kcz"] = {"Konongo", 11732345, "bnt-tkm", scripts = Latn}

m["kda"] = {"Worimi", 3914062, "aus-pam", scripts = Latn}

m["kdc"] = {"Kutu", 6448634, "bnt-ruv"}

m["kdd"] = {"Yankunytjatjara", 34207, "aus-pam", scripts = Latn}

m["kde"] = {"Makonde", 35172, "bnt-rvm", scripts = Latn}

m["kdf"] = {"Mamusi", 6746036, "poz-ocw", scripts = Latn}

m["kdg"] = {"Seba", 7442316, "bnt-sbi", scripts = Latn}

m["kdh"] = {"Tem", 36531, "nic-gne"}

m["kdi"] = {"Kumam", 6443410, "sdv-los"}

m["kdj"] = {"Karamojong", 56326, "sdv-ttu", scripts = Latn}

m["kdk"] = {"Numee", 3346774, "poz-cln"}

m["kdl"] = {"Tsikimba", 3914404, "nic-kam"}

m["kdm"] = {"Kagoma", 3914420, "nic-plc"}

m["kdn"] = {"Kunda", 4121130, "bnt-sna"}

m["kdp"] = {"Kaningdon-Nindem", 3914956, "nic-nin"}

m["kdq"] = {"Koch", 56431, "tbq-bdg"}

m["kdr"] = {"Karaim", 33725, "trk-kcu", scripts = {"Cyrl", "Latn", "Hebr"}}

m["kdt"] = {"Kuy", 56310, "mkh-kat"}

m["kdu"] = {"Kadaru", 35441, "nub-hil", scripts = Latn}

m["kdv"] = {"Kado", 7402721, "sit-luu"}

m["kdw"] = {"Koneraw", 11732341, "ngf"}

m["kdx"] = {"Kam", 36753, "alv-wjk"}

m["kdy"] = {"Keder", 6383641, "paa-tkw"}

m["kdz"] = {"Kwaja", 11128866, "nic-nka", scripts = Latn}

m["kea"] = {"Kabuverdianu", 35963, "crp", scripts = Latn, ancestors = {"pt"}}

m["keb"] = {"Kélé", 35559, "bnt-kel"}

m["kec"] = {"Keiga", 3409311, "qfa-kad", scripts = Latn}

m["ked"] = {"Kerewe", 6393846, "bnt-haj"}

m["kee"] = {"Eastern Keres", 15649021, "nai-ker", scripts = Latn}

m["kef"] = {"Kpessi", 35748, "alv-gbe"}

m["keg"] = {"Tese", 16887296, "sdv"}

m["keh"] = {"Keak", 6382110, "paa-spk"}

m["kei"] = {"Kei", 2410352}

m["kej"] = {"Kadar", 6345179, "dra"}

m["kek"] = {"Q'eqchi", 35536, "myn", scripts = Latn}

m["kel"] = {"Kela-Yela", 6385426, "bnt-mon", scripts = Latn}

m["kem"] = {"Kemak", 35549, "poz-tim"}

m["ken"] = {"Kenyang", 35650, "nic-mam", scripts = Latn}

m["keo"] = {"Kakwa", 3033547, "sdv-bri"}

m["kep"] = {"Kaikadi", 6347757, "dra"}

m["keq"] = {"Kamar", 14916877, "inc-eas", ancestors = {"inc-mgd"}}

m["ker"] = {"Kera", 56251, "cdc-est", scripts = Latn}

m["kes"] = {"Kugbo", 3813394, "nic-cde", scripts = Latn}

m["ket"] = {"Ket", 33485, "qfa-yen", scripts = Cyrl}

m["keu"] = {"Akebu", 35026, "alv-ktg"}

m["kev"] = {"Kanikkaran", 6363201, "dra"}

m["kew"] = {"Kewa", 12952619, "paa-eng", scripts = Latn}

m["kex"] = {"Kukna", 5031131, "inc-eas", ancestors = {"bh"}}

m["key"] = {"Kupia", 6445354, "inc-eas"}

m["kez"] = {"Kukele", 3915391, "nic-ucn", scripts = Latn}

m["kfa"] = {"Kodava", 33531, "dra", scripts = {"Knda"}}

m["kfb"] = {"Kolami", 33479, "dra", scripts = Deva}

m["kfc"] = {"Konda-Dora", 35679, "dra", scripts = {"Telu"}}

m["kfd"] = {"Korra Koraga", 12952655, "dra", scripts = {"Knda"}}

m["kfe"] = {"Kota (India)", 33483, "dra", scripts = {"Taml"}}

m["kff"] = {"Koya", 33471, "dra"}

m["kfg"] = {"Kudiya", 12952667, "dra"}

m["kfh"] = {"Kurichiya", 12952676, "dra"}

m["kfi"] = {"Kannada Kurumba", 56589, "dra"}

m["kfj"] = {"Kemiehua", 27144776, "mkh-pal"}

m["kfk"] = {"Kinnauri", 2383208, "sit-kin"}

m["kfl"] = {"Kung", 6444510, "nic-rnc", scripts = Latn}

m["kfn"] = {"Kuk", 6442398, "nic-rnc", scripts = Latn}

m["kfo"] = {"Koro (West Africa)", 11160588, "dmn-mnk", scripts = {"Latn", "Nkoo"}}

m["kfp"] = {"Korwa", 6432786, "mun"}

m["kfq"] = {"Korku", 33715, "mun"}

m["kfr"] = {"Kachchi", 56487, "inc-snd", translit_module = "gu-translit", scripts = {"Gujr", "sd-Arab"}, ancestors = {"inc-vra"}}

m["kfs"] = {"Bilaspuri", 12953397, "him", scripts = {"Deva", "Takr"}, translit_module = "hi-translit"}

m["kft"] = {"Kanjari", 12953610, "inc-pan", ancestors = {"pa"}}

m["kfu"] = {"Katkari", 6377671, "inc-sou", ancestors = {"pmh"}}

m["kfv"] = {"Kurmukar", 6446193, "inc-eas", ancestors = {"inc-mgd"}}

m["kfw"] = {"Kharam Naga", 12952906, "tbq-kuk"}

m["kfx"] = {"Kullu Pahari", 6443148, "him", scripts = Deva, translit_module = "hi-translit"}

m["kfy"] = {"Kumaoni", 33529, "inc-pah", scripts = {"Deva", "Shrd", "Takr"}}

m["kfz"] = {"Koromfé", 35701, "nic-gur", scripts = Latn}

m["kga"] = {"Koyaga", 11155632, "dmn-mnk"}

m["kgb"] = {"Kawe", 12952750, "poz-hce"}

m["kgd"] = {"Kataang", 12953622, "mkh"}

m["kge"] = {"Komering", 49224, "poz-lgx"}

m["kgf"] = {"Kube", 11732359, "ngf"}

m["kgg"] = {"Kusunda", 33630, "qfa-iso", scripts = Latn}

m["kgi"] = {"Selangor Sign Language", 33731, "sgn"}

m["kgj"] = {"Gamale Kham", 22236996, "sit-kha"}

m["kgk"] = {"Kaiwá", 3111883, "tup-gua", scripts = Latn}

m["kgl"] = {"Kunggari", 10550184, "aus-pam"}

m["kgm"] = {"Karipúna", 6371069}

m["kgn"] = {"Karingani", 6371041, "xme-ttc", ancestors = {"xme-ttc-nor"}}

m["kgo"] = {"Krongo", 6438927, "qfa-kad", scripts = Latn}

m["kgp"] = {"Kaingang", 2665734, "sai-sje", scripts = Latn}

m["kgq"] = {"Kamoro", 6359001, "ngf"}

m["kgr"] = {"Abun", 56657, "paa"}

m["kgs"] = {"Kumbainggar", 3915412, "aus-pam"}

m["kgt"] = {"Somyev", 3913354, "nic-mmb", scripts = Latn}

m["kgu"] = {"Kobol", 11732325, "ngf-mad"}

m["kgv"] = {"Karas", 6368621, "ngf"}

m["kgw"] = {"Karon Dori", 56817}

m["kgx"] = {"Kamaru", 12953604, "poz"}

m["kgy"] = {"Kyerung", 12952691, "sit-kyk"}

m["kha"] = {"Khasi", 33584, "aav-pkl", scripts = {"Latn", "as-Beng"}}

m["khb"] = {"Lü", 36948, "tai-swe", scripts = {"Talu", "Lana"}, translit_module = "translit-redirect", sort_key = {from = {"[%pᪧ]", "᧞", "᧟", "([ᦵᦶᦷᦺ])([ᦀ-ᦫ])", "[᩠ᩳ-᩿]", "ᩔ", "ᩕ", "ᩖ", "ᩘ", "([ᨭ-ᨱ])ᩛ", "([ᨷ-ᨾ])ᩛ", "ᩤ", u(0x200C)}, to = {"", "ᦶᦜ", "ᦶᦜᧁ", "%2%1", "", "ᩈᩈ", "ᩁ", "ᩃ", "ᨦ", "%1ᨮ", "%1ᨻ", "ᩣ"}}, entry_name = {from = {" ", u(0x200C)}, to = {}}}

m["khc"] = {"Tukang Besi North", 18611555, "poz"}

m["khd"] = {"Bädi Kanum", 20888004, "paa-yam"}

m["khe"] = {"Korowai", 6432598, "ngf"}

m["khf"] = {"Khuen", 27144893, "mkh"}

m["khh"] = {"Kehu", 10994953}

m["khj"] = {"Kuturmi", 3914490, "nic-plc", scripts = Latn}

m["khl"] = {"Lusi", 3267788, "poz-ocw", scripts = Latn}

m["khn"] = {"Khandeshi", 33726, "inc-sou", ancestors = {"pmh"}}

m["kho"] = {"Khotanese", 6583551, "xsc-sak", scripts = {"Brah", "Khar"}, translit_module = "Brah-translit"}

m["khp"] = {"Kapauri", 3502575, "paa-tkw"}

m["khq"] = {"Koyra Chiini", 33600, "son"}

m["khr"] = {"Kharia", 3915562, "mun"}

m["khs"] = {"Kasua", 6374863, "ngf"}

m["kht"] = {
    "Khamti",
    3915502,
    "tai-swe",
    scripts = {"Mymr"},
    entry_name = {
        from = {u(0xFE00)}, -- VS01
        to = {""}
    }
}

m["khu"] = {"Nkhumbi", 11019169, "bnt-swb"}

m["khv"] = {"Khvarshi", 56425, "cau-tsz", scripts = Cyrl, translit_module = "khv-translit"}

m["khw"] = {"Khowar", 938216, "inc-dar", scripts = {"Arab"}}

m["khx"] = {"Kanu", 12952571, "bnt-lgb"}

m["khy"] = {"Ekele", 6385549, "bnt-ske", scripts = Latn}

m["khz"] = {"Keapara", 12952603, "poz-ocw", scripts = Latn}

m["kia"] = {"Kim", 35685, "alv-kim"}

m["kib"] = {"Koalib", 35859, "alv-hei"}

m["kic"] = {"Kickapoo", 20162127, "alg-sfk", scripts = Latn}

m["kid"] = {"Koshin", 35632, "nic-beb", scripts = Latn}

m["kie"] = {"Kibet", 56893}

m["kif"] = {"Eastern Parbate Kham", 12953022, "sit-kha"}

m["kig"] = {"Kimaama", 11732321, "ngf"}

m["kih"] = {"Kilmeri", 6408020, "paa-brd"}

m["kii"] = {"Kitsai", 56627, "cdd", scripts = Latn}

m["kij"] = {"Kilivila", 3196601, "poz-ocw", scripts = Latn}

m["kil"] = {"Kariya", 3438708, "cdc-wst"}

m["kim"] = {"Tofa", 36848, "trk-sib", scripts = Cyrl}

m["kio"] = {"Kiowa", 56631, "nai-kta", scripts = Latn}

m["kip"] = {"Sheshi Kham", 12952622, "sit-kha"}

m["kiq"] = {"Kosadle", 6432994}

m["kis"] = {"Kis", 6416362, "poz-ocw", scripts = Latn}

m["kit"] = {"Agob", 3332143}

m["kiv"] = {"Kimbu", 10997740, "bnt-tkm"}

m["kiw"] = {"Northeast Kiwai", 11732324, "paa-kiw"}

m["kix"] = {"Khiamniungan Naga", 6401546, "sit-kch"}

m["kiy"] = {"Kirikiri", 6415159, "paa-lkp"}

m["kiz"] = {"Kisi", 3912772, "bnt-bki"}

m["kja"] = {"Mlap", 6885683, "paa-nim"}

m["kjb"] = {"Q'anjob'al", 35551, "myn", scripts = Latn}

m["kjc"] = {"Coastal Konjo", 3198689, "poz"}

m["kjd"] = {"Southern Kiwai", 11732322, "paa-kiw"}

m["kje"] = {"Kisar", 3197441, "poz"}

m["kjg"] = {"Khmu", 33335, "mkh", scripts = {"Laoo"}, sort_key = {from = {"[%pໆ]", "[່-ໍ]", "ຼ", "ຽ", "ໜ", "ໝ", "([ເແໂໃໄ])([ກ-ຮໞໟ])"}, to = {"", "", "ລ", "ຍ", "ຫນ", "ຫມ", "%2%1"}}}

m["kjh"] = {"Khakas", 33575, "trk-sib", scripts = Cyrl, translit_module = "kjh-translit", override_translit = true}

m["kji"] = {"Zabana", 379130, "poz-ocw", scripts = Latn}

m["kjj"] = {"Khinalug", 35278, "cau-nec", scripts = Cyrl, translit_module = "kjj-translit", override_translit = true, entry_name = {from = {ACUTE}, to = {}}}

m["kjk"] = {"Highland Konjo", 3198688, "poz"}

m["kjl"] = {"Kham", 22237017, "sit-kha"}

m["kjm"] = {"Kháng", 6403501, "mkh-pal"}

m["kjn"] = {"Kunjen", 3200468, "aus-pmn", scripts = Latn}

m["kjo"] = {"Harijan Kinnauri", 5657463, "him"}

m["kjp"] = {"Eastern Pwo", 5330390, "kar", scripts = {"Mymr", "Leke", "Thai"}}

m["kjq"] = {"Western Keres", 12645568, "nai-ker", scripts = Latn}

m["kjr"] = {"Kurudu", 12952678, "poz-hce", scripts = Latn}

m["kjs"] = {"East Kewa", 20050949, "paa-eng"}

m["kjt"] = {"Phrae Pwo", 7187991, "kar", scripts = {"Thai"}}

m["kju"] = {"Kashaya", 3193689, "nai-pom", scripts = Latn}

m["kjx"] = {"Ramopa", 56830, "paa-nbo"}

m["kjy"] = {"Erave", 12952416, "paa-eng"}

m["kjz"] = {"Bumthangkha", 2786408, "sit-ebo", scripts = {"Tibt"}}

m["kka"] = {"Kakanda", 3915342, "alv-ngb"}

m["kkb"] = {"Kwerisa", 56881, "paa-lkp"}

m["kkc"] = {"Odoodee", 12952987}

m["kkd"] = {"Kinuku", 6414422, "nic-kau"}

m["kke"] = {"Kakabe", 3913966, "dmn-mok", scripts = Latn}

m["kkf"] = {"Kalaktang Monpa", nil, "sit-tsk"}

m["kkg"] = {"Mabaka Valley Kalinga", 18753304, "phi"}

m["kkh"] = {"Khün", 3545044, "tai-swe", scripts = {"Lana", "Thai"}, sort_key = {from = {"[%pᪧๆ]", "[᩠ᩳ-᩿]", "ᩔ", "ᩕ", "ᩖ", "ᩘ", "([ᨭ-ᨱ])ᩛ", "([ᨷ-ᨾ])ᩛ", "ᩤ", "[็-๎]", "([เแโใไ])([ก-ฮ])"}, to = {"", "", "ᩈᩈ", "ᩁ", "ᩃ", "ᨦ", "%1ᨮ", "%1ᨻ", "ᩣ", "", "%2%1"}}}

m["kki"] = {"Kagulu", 12952537, "bnt-ruv", scripts = Latn}

m["kkj"] = {"Kako", 35755, "bnt-kak"}

m["kkk"] = {"Kokota", 3198399, "poz-ocw", scripts = Latn}

m["kkl"] = {"Kosarek Yale", 6432995, "ngf"}

m["kkm"] = {"Kiong", 6414512, "nic-ucr", scripts = Latn}

m["kkn"] = {"Kon Keu", 6428686, "mkh-pal"}

m["kko"] = {"Karko", 35529, "nub-hil"}

m["kkp"] = {"Koko-Bera", 6426699, "aus-pmn", scripts = Latn}

m["kkq"] = {"Kaiku", 6347840, "bnt-kbi", scripts = Latn}

m["kkr"] = {"Kir-Balar", 3440527, "cdc-wst", scripts = Latn}

m["kks"] = {"Kirfi", 56242, "cdc-wst", scripts = Latn}

m["kkt"] = {"Koi", 6426194, "sit-kiw"}

m["kku"] = {"Tumi", 3913934, "nic-kau"}

m["kkv"] = {"Kangean", 2071325}

m["kkw"] = {"Teke-Kukuya", 36560, "bnt-tek"}

m["kkx"] = {"Kohin", 6425997, "poz-brw"}

m["kky"] = {"Guugu Yimidhirr", 56543, "aus-pam", scripts = Latn}

m["kkz"] = {"Kaska", 20823, "ath-nor", scripts = Latn}

m["kla"] = {"Klamath-Modoc", 2669248, "nai-plp", scripts = Latn}

m["klb"] = {"Kiliwa", 3182593, "nai-yuc", scripts = Latn}

m["klc"] = {"Kolbila", 6427122, "alv-lek"}

m["kld"] = {"Gamilaraay", 3111818, "aus-cww", scripts = Latn}

m["kle"] = {"Kulung", 6443304, "sit-kic"}

m["klf"] = {"Kendeje", 56895}

m["klg"] = {"Tagakaulu Kalagan", 18756514, "phi"}

m["klh"] = {"Weliki", 7981017, "ngf-fin", scripts = Latn}

m["kli"] = {"Kalumpang", 13561407, "poz"}

m["klj"] = {"Khalaj", 33455, "trk"}

m["klk"] = {"Kono (Nigeria)", 6429589, "nic-kau", scripts = Latn}

m["kll"] = {"Kagan Kalagan", 18748913, "phi"}

m["klm"] = {"Kolom", 6844970, "ngf-mad", scripts = Latn}

m["kln"] = {"Kalenjin", 637228, "sdv-nma", scripts = Latn}

m["klo"] = {"Kapya", 6367410, "nic-ykb"}

m["klp"] = {"Kamasa", 6356107, "ngf"}

m["klq"] = {"Rumu", 7379420, "ngf"}

m["klr"] = {"Khaling", 56381, "sit-kiw"}

m["kls"] = {"Kalasha", 33416, "inc-dar", scripts = {"Latn", "ks-Arab"}}

m["klt"] = {"Nukna", 7068874, "ngf-fin", scripts = Latn}

m["klu"] = {"Klao", 3914866, "kro-wkr"}

m["klv"] = {"Maskelynes", 3297282, "poz-vnc", scripts = Latn}

m["klw"] = {"Lindu", 18390055, "poz-kal"}

m["klx"] = {"Koluwawa", 6427954, "poz-ocw", scripts = Latn}

m["kly"] = {"Kalao", 6350643, "poz"}

m["klz"] = {"Kabola", 11732258, "qfa-tap"}

m["kma"] = {"Konni", 35680, "nic-buk"}

m["kmb"] = {"Kimbundu", 35891, "bnt-kmb", scripts = Latn}

m["kmc"] = {"Southern Kam", 35379, "qfa-kms", scripts = Latn}

m["kmd"] = {"Madukayang Kalinga", 18753305, "phi"}

m["kme"] = {"Bakole", 35068, "bnt-kpw"}

m["kmf"] = {"Kare (New Guinea)", 11732286, "ngf-mad", scripts = Latn}

m["kmg"] = {"Kâte", 3201059, "ngf"}

m["kmh"] = {"Kalam", 12952550, "ngf-mad"}

m["kmi"] = {"Kami", 3915372, "alv-ngb", scripts = Latn}

m["kmj"] = {"Kumarbhag Paharia", 3130374, "dra", scripts = {"Beng", "Deva"}}

m["kmk"] = {"Limos Kalinga", 18753303, "phi"}

m["kml"] = {"Tanudan Kalinga", 18753307, "phi", scripts = Latn}

m["kmm"] = {"Kom (India)", 12952647, "tbq-kuk"}

m["kmn"] = {"Awtuw", 3504217, "paa-spk"}

m["kmo"] = {"Kwoma", 11732376, "paa-spk"}

m["kmp"] = {"Gimme", 11152236, "alv-dur"}

m["kmq"] = {"Kwama", 2591184, "ssa-kom"}

m["kmr"] = {"Northern Kurdish", 36163, "ku", scripts = {"Latn", "Cyrl", "Armn", "ku-Arab"}, translit_module = "translit-redirect", entry_name = {from = {"'"}, to = {"’"}}, wikimedia_codes = {"ku"}, ancestors = {"ku-pro"}}

m["kms"] = {"Kamasau", 6356117, "qfa-tor", scripts = Latn}

m["kmt"] = {"Kemtuik", 6387179, "paa-nim"}

m["kmu"] = {"Kanite", 12952567, "paa-kag"}

m["kmv"] = {"Karipúna Creole French", 2523999, "crp", ancestors = {"fr"}}

m["kmw"] = {"Kumu", 6428450, "bnt-kbi", scripts = Latn}

m["kmx"] = {"Waboda", 7958705, "paa-kiw"}

m["kmy"] = {"Koma", 35634, "alv-dur"}

m["kmz"] = {"Khorasani Turkish", 35373, "trk-ogz", ancestors = {"trk-oat"}}

m["kna"] = {"Kanakuru", 56811, "cdc-wst", scripts = Latn}

m["knb"] = {"Lubuagan Kalinga", 12953602, "phi"}

m["knd"] = {"Konda", 11732340, "ngf-sbh", scripts = Latn}

m["kne"] = {"Kankanaey", 18753329, "phi", scripts = Latn}

m["knf"] = {"Mankanya", 35789, "alv-pap"}

m["kni"] = {"Kanufi", 3913297, "nic-nin", scripts = Latn}

m["knj"] = {"Akatek", 34923, "myn", scripts = Latn}

m["knk"] = {"Kuranko", 3198896, "dmn-mok", scripts = Latn}

m["knl"] = {"Keninjal", 6389309, "poz-mly"}

m["knm"] = { -- two unrelated lects have this name; this is the Katukinian one
    "Kanamari",
    3438373,
    "sai-ktk",
    scripts = Latn
}

m["kno"] = {"Kono (Sierra Leone)", 35675, "dmn-vak"}

m["knp"] = {"Kwanja", 35641, "nic-mmb", scripts = Latn}

m["knq"] = {"Kintaq", 6414335, "mkh-asl"}

m["knr"] = {"Kaningra", 6363253, "paa-spk"}

m["kns"] = {"Kensiu", 6391529, "mkh-asl"}

m["knt"] = {"Katukina", 3194265, "sai-pan", scripts = Latn}

m["knu"] = { -- a dialect of 'kpe'
    "Kono (Guinea)",
    3198703,
    "dmn-msw",
    scripts = Latn,
    ancestors = {"kpe"}
}

m["knv"] = {"Tabo", 7959888, "aav"}

m["knx"] = {"Kendayan", 6388963, "poz-mly", scripts = Latn}

m["kny"] = {"Kanyok", 11110766, "bnt-lub"}

m["knz"] = {"Kalamsé", 3914000, "nic-gnn"}

m["koa"] = {"Konomala", 3198732, "poz-ocw", scripts = Latn}

m["koc"] = {"Kpati", 3913279, "nic-nge", scripts = Latn}

m["kod"] = {"Kodi", 4577633}

m["koe"] = {"Kacipo-Balesi", 5364424, "sdv"}

m["kof"] = {"Kubi", 3438718, "cdc-wst", scripts = Latn}

m["kog"] = {"Cogui", 3198286, "cba"}

m["koh"] = {"Koyo", 35649, "bnt-mbo", scripts = Latn}

m["koi"] = {"Komi-Permyak", 56318, "urj-prm", scripts = {"Cyrl", "Perm"}, translit_module = "kv-translit", override_translit = true}

m["kok"] = {"Konkani", 34239, "inc-sou", scripts = {"Deva", "Knda", "Mlym", "fa-Arab", "Latn"}, ancestors = {"pmh"}, translit_module = "mr-translit"}

m["kol"] = {"Kol (New Guinea)", 4227542}

m["koo"] = {"Konzo", 2361829, "bnt-glb"}

m["kop"] = {"Waube", 11732373, "ngf-mad"}

m["koq"] = {"Kota (Gabon)", 35607, "bnt-kel", scripts = Latn}

m["kos"] = {"Kosraean", 33464, "poz-mic", scripts = Latn}

m["kot"] = {"Lagwan", 3502264, "cdc-cbm", scripts = Latn}

m["kou"] = {"Koke", 797249, "alv-bua"}

m["kov"] = {"Kudu-Camo", 3915850, "nic-jer"}

m["kow"] = {"Kugama", 3913307, "alv-mye"}

m["koy"] = {"Koyukon", 28304, "ath-nor", scripts = Latn}

m["koz"] = {"Korak", 6431365, "ngf-mad"}

m["kpa"] = {"Kutto", 3437656, "cdc-wst"}

m["kpb"] = {"Mullu Kurumba", 19573111, "dra"}

m["kpc"] = {"Curripaco", 2882543, "awd-nwk", scripts = Latn}

m["kpd"] = {"Koba", 6424249, "poz"}

m["kpe"] = {"Kpelle", 35673, "dmn-msw", scripts = Latn}

m["kpf"] = {"Komba", 6428239, "ngf"}

m["kpg"] = {"Kapingamarangi", 35771, "poz-pnp", scripts = Latn}

m["kph"] = {"Kplang", 35628, "alv-gng"}

m["kpi"] = {"Kofei", 6425665, "paa-egb"}

m["kpj"] = {"Karajá", 10322066, "sai-mje", scripts = Latn}

m["kpk"] = {"Kpan", 3915380, "nic-jkn", scripts = Latn}

m["kpl"] = {"Kpala", 11154769, "nic-nkk", scripts = Latn}

m["kpm"] = {"Koho", 3511919, "mkh-ban", scripts = Latn}

m["kpn"] = {"Kepkiriwát", 3195366, "tup", scripts = Latn}

m["kpo"] = {"Ikposo", 35029, "alv-ktg", scripts = Latn}

m["kpp"] = {"Paku Karen", nil}

m["kpq"] = {"Korupun-Sela", 6432769, "ngf"}

m["kpr"] = {"Korafe-Yegha", 11732347, "ngf"}

m["kps"] = {"Tehit", 7694851}

m["kpt"] = {"Karata", 56636, "cau-ava", scripts = Cyrl}

m["kpu"] = {"Kafoa", 6346151, "qfa-tap"}

m["kpv"] = {"Komi-Zyrian", 34114, "urj-prm", scripts = Cyrl, translit_module = "kv-translit", override_translit = true, wikimedia_codes = {"kv"}}

m["kpw"] = {"Kobon", 11732326, "ngf-mad"}

m["kpx"] = {"Mountain Koiari", 6925030, "ngf"}

m["kpy"] = {"Koryak", 36199, "qfa-cka", scripts = Cyrl}

m["kpz"] = {"Kupsabiny", 56445, "sdv-kln"}

m["kqa"] = {"Mum", 6935252, "ngf-mad"}

m["kqb"] = {"Kovai", 6434822, "ngf"}

m["kqc"] = {"Doromu-Koki", 5298175, "ngf"}

m["kqd"] = {"Koy Sanjaq Surat", 33463, "sem-nna"}

m["kqe"] = {"Kalagan", 18748906, "phi"}

m["kqf"] = {"Kakabai", 6349119, "poz-ocw", scripts = Latn}

m["kqg"] = {"Khe", 3914015, "nic-gur"}

m["kqh"] = {"Kisankasa", 6416409, "sdv"}

m["kqi"] = {"Koitabu", 6426363, "ngf"}

m["kqj"] = {"Koromira", 6432520, "paa-sbo"}

m["kqk"] = {"Kotafon Gbe", 12952447, "alv-pph"}

m["kql"] = {"Kyenele", 11732453, "paa-yua"}

m["kqm"] = {"Khisa", 3913955, "nic-gur"}

m["kqn"] = {"Kaonde", 33601, "bnt-lub", scripts = Latn}

m["kqo"] = {"Eastern Krahn", 3915374, "kro-wee"}

m["kqp"] = {"Kimré", 3441210, "cdc-est"}

m["kqq"] = {"Krenak", 6436747, "sai-cer"}

m["kqr"] = {"Kimaragang", 3196845, "poz-san", scripts = Latn}

m["kqs"] = {"Northern Kissi", 19921576, "alv-kis"}

m["kqt"] = {"Klias River Kadazan", 12953594, "poz-san"}

m["kqu"] = {"Seroa", 33127766, "khi-tuu"}

m["kqv"] = {"Okolod", 7082487, "poz-san"}

m["kqw"] = {"Kandas", 3192590, "poz-ocw", scripts = Latn}

m["kqx"] = {"Mser", 3502347, "cdc-cbm"}

m["kqy"] = {"Koorete", 6430753, "omv-eom"}

m["kqz"] = {"Korana", 2756709, "khi-khk", scripts = Latinx}

m["kra"] = {"Kumhali", 13580783, "inc-eas", ancestors = {"bh"}}

m["krb"] = {"Karkin", 3193345, "nai-you", scripts = Latn}

m["krc"] = {"Karachay-Balkar", 33714, "trk-kcu", scripts = Cyrl, translit_module = "krc-translit"}

m["krd"] = {"Kairui-Midiki", 12953277, "poz-tim"}

m["kre"] = {"Panará", 3361895, "sai-cer"}

m["krf"] = {"Koro (Vanuatu)", 3198995, "poz-oce", scripts = Latn}

m["krh"] = {"Kurama", 35593, "nic-kau"}

m["kri"] = {"Krio", 35744, "crp", scripts = Latn, ancestors = {"en"}}

m["krj"] = {"Kinaray-a", 33720, "phi", scripts = Latn}

m["krk"] = {"Kerek", 332792, "qfa-cka", scripts = Cyrl}

m["krl"] = {"Karelian", 33557, "fiu-fin", scripts = Latn}

m["krm"] = {"Krim", 35713, "alv"}

m["krn"] = {"Sapo", 3915386, "kro-wee"}

m["krp"] = {"Korop", 35626, "nic-ucr", scripts = Latn}

m["krr"] = {"Kru'ng", 12953650, "mkh-ban"}

m["krs"] = {"Kresh", 56674, "csu-bkr"}

m["kru"] = {"Kurukh", 33492, "dra", scripts = Deva}

m["krv"] = {"Kavet", 12953649, "sai-ktk", scripts = Latn}

m["krw"] = {"Western Krahn", 10975611, "kro-wee"}

m["krx"] = {"Karon", 35704, "alv-jol"}

m["kry"] = {"Kryts", 35861, "cau-lzg"}

m["krz"] = {"Sota Kanum", 12952568, "paa-yam"}

m["ksa"] = {"Shuwa-Zamani", 3913929, "nic-kau"}

m["ksb"] = {"Shambala", 3788739, "bnt-seu", scripts = Latn}

m["ksc"] = {"Southern Kalinga", 18753301, "phi"}

m["ksd"] = {"Tolai", 35870, "poz-ocw", scripts = Latn}

m["kse"] = {"Kuni", 6444619, "poz-ocw", scripts = Latn}

m["ksf"] = {"Bafia", 34930, "bnt-baf"}

m["ksg"] = {"Kusaghe", 3200638, "poz-ocw", scripts = Latn}

m["ksi"] = {"Krisa", 841704, "paa-msk", scripts = Latn}

m["ksj"] = {"Uare", 6450052, "ngf"}

m["ksk"] = {"Kansa", 3192772, "sio-dhe"}

m["ksl"] = {"Kumalu", 17584381, "poz-ocw", scripts = Latn}

m["ksm"] = {"Kumba", 3913972, "alv-mye"}

m["ksn"] = {"Kasiguranin", 6374525, "phi"}

m["kso"] = {"Kofa", 56278, "cdc-cbm"}

m["ksp"] = {"Kaba", 3915316, "csu-sar"}

m["ksq"] = {"Kwaami", 3440525, "cdc-wst"}

m["ksr"] = {"Borong", 4946263, "ngf"}

m["kss"] = {"Southern Kissi", 11028974, "alv-kis"}

m["kst"] = {"Winyé", 3913360, "nic-gnw"}

m["ksu"] = {"Khamyang", 6583541, "tai-swe"}

m["ksv"] = {"Kusu", 6448199, "bnt-tet"}

m["ksw"] = {"S'gaw Karen", 56410, "kar", scripts = {"Mymr"}, translit_module = "ksw-translit"}

m["ksx"] = {"Kedang", 6382520, "poz", scripts = Latn}

m["ksy"] = {"Kharia Thar", 6400661, "inc-eas", ancestors = {"inc-mgd"}}

m["ksz"] = {"Kodaku", 21179986, "mun"}

m["kta"] = {"Katua", 6378404, "mkh-ban"}

m["ktb"] = {"Kambaata", 35664, "cus"}

m["ktc"] = {"Kholok", 3440464, "cdc-wst"}

m["ktd"] = {"Kokata", 10547021, "aus-pam"}

m["ktf"] = {"Kwami", 12952687, "bnt-lgb"}

m["ktg"] = {"Kalkatungu", 3914057, "aus-pam", scripts = Latn}

m["kth"] = {"Karanga", 713643}

m["kti"] = {"North Muyu", 20857698, "ngf", scripts = Latn}

m["ktj"] = {"Plapo Krumen", 10975356, "kro-grb"}

m["ktk"] = {"Kaniet", 3399050, "poz-aay", scripts = Latn}

m["ktl"] = {"Koroshi", 3775265, "ira-nwi", ancestors = {"bal"}}

m["ktm"] = {"Kurti", 3200615, "poz-aay", scripts = Latn}

m["ktn"] = {"Karitiâna", 3112184, "tup", scripts = Latn}

m["kto"] = {"Kuot", 56537}

m["ktp"] = {"Kaduo", 769809, "tbq-lol"}

m["ktq"] = {"Katabaga", 3193895}

m["ktr"] = {"Kota Marudu Tinagas", 18642280}

m["kts"] = {"South Muyu", 42308820, "ngf", scripts = Latn}

m["ktt"] = {"Ketum", 12952616, "ngf"}

m["ktu"] = {"Kituba", 35746, "crp", scripts = Latn, ancestors = {"kg"}}

m["ktv"] = {"Eastern Katu", 22808951, "mkh-kat"}

m["ktw"] = {"Kato", 20831, "ath-pco", scripts = Latn}

m["ktx"] = {"Kaxararí", 6380124, "sai-pan", scripts = Latn}

m["kty"] = {"Kango", 6362818, "bnt-bta", scripts = Latn}

m["ktz"] = {"Juǀ'hoan", 1192295, "khi-kxa", scripts = Latn}

m["kub"] = {"Kutep", 35645, "nic-jkn"}

m["kuc"] = {"Kwinsu", 6450460, "paa-tkw"}

m["kud"] = {"Auhelawa", 5166, "poz-ocw", scripts = Latn}

m["kue"] = {"Kuman", 137525, "ngf", scripts = Latn}

m["kuf"] = {"Western Katu", 6378400, "mkh-kat", scripts = {"Laoo", "Tale"}}

m["kug"] = {"Kupa", 3915336, "alv-ngb"}

m["kuh"] = {"Kushi", 3438747, "cdc-wst"}

m["kui"] = {"Kuikúro", 3915522, "sai-car", scripts = Latn}

m["kuj"] = {"Kuria", 6445968, "bnt-lok", scripts = Latn}

m["kuk"] = {"Kepo'", 6393217, "poz"}

m["kul"] = {"Kulere", 3440506, "cdc-wst"}

m["kum"] = {"Kumyk", 36209, "trk-kcu", scripts = Cyrl, translit_module = "kum-translit"}

m["kun"] = {"Kunama", 36041}

m["kuo"] = {"Kumukio", 11732362, "ngf"}

m["kup"] = {"Kunimaipa", 6444696}

m["kuq"] = {"Karipuna", 6371071, "tup-gua", scripts = Latn}

m["kus"] = {"Kusaal", 35708, "nic-dag", scripts = Latn}

m["kut"] = {"Kutenai", 33434, "qfa-iso"}

m["kuu"] = {"Upper Kuskokwim", 28062, "ath-nor"}

m["kuv"] = {"Kur", 12635082, "poz-cma", scripts = Latn}

m["kuw"] = {"Kpagua", 11137573, "bad-cnt"}

m["kux"] = {"Kukatja", 10549839, "aus-pam"}

m["kuy"] = {"Kuuku-Ya'u", 10550697, "aus-pmn"}

m["kuz"] = {"Kunza", 2669181, "qfa-iso"}

m["kva"] = {"Bagvalal", 56638, "cau-ava"}

m["kvb"] = {"Kubu", 6441341, "poz-mly"}

m["kvc"] = {"Kove", 3199402, "poz-ocw", scripts = Latn}

m["kvd"] = {"Kui (Indonesia)", 6442230, "ngf"}

m["kve"] = {"Kalabakan", 6350003, "poz-san"}

m["kvf"] = {"Kabalai", 3440427, "cdc-est"}

m["kvg"] = {"Kuni-Boazi", 2907551, "ngf"}

m["kvh"] = {"Komodo", 3198565, "poz-cet"}

m["kvi"] = {"Kwang", 3440398, "cdc-est", scripts = Latn}

m["kvj"] = {"Psikye", 56304, "cdc-cbm"}

m["kvk"] = {"Korean Sign Language", 3073428, "sgn-jsl"}

m["kvl"] = {"Brek Karen", 12952577, "kar"}

m["kvm"] = {"Kendem", 35751, "nic-mam", scripts = Latn}

m["kvn"] = {"Border Kuna", 31777873, "cba"}

m["kvo"] = {"Dobel", 5286559, "poz"}

m["kvp"] = {"Kompane", 18343041, "poz"}

m["kvq"] = {"Geba Karen", 12952581, "kar"}

m["kvr"] = {"Kerinci", 3195442, "poz-mly"}

m["kvt"] = {"Lahta Karen", 12952582, "kar"}

m["kvu"] = {"Yinbaw Karen", 14426328, "kar"}

m["kvv"] = {"Kola", 6426967, "poz"}

m["kvw"] = {"Wersing", 7983599, "qfa-tap"}

m["kvx"] = {"Parkari Koli", 3244176, "inc-wes"}

m["kvy"] = {"Yintale Karen", 14426329, "kar"}

m["kvz"] = {"Tsakwambo", 7849438, "ngf"}

m["kwa"] = {"Dâw", 3042278, "sai-nad"}

m["kwb"] = {"Baa", 34842, "alv-ada"}

m["kwc"] = {"Likwala", 35597, "bnt-mbo"}

m["kwd"] = {"Kwaio", 3200796, "poz-sls", scripts = Latn}

m["kwe"] = {"Kwerba", 6450328, "paa-tkw"}

m["kwf"] = {"Kwara'ae", 3200829, "poz-oce"}

m["kwg"] = {"Sara Kaba Deme", 3915384, "csu-kab"}

m["kwh"] = {"Kowiai", 6435028, "poz"}

m["kwi"] = {"Awa-Cuaiquer", 2603103, "sai-bar", scripts = Latn}

m["kwj"] = {"Kwanga", 3438383, "paa-spk"}

m["kwk"] = {"Kwak'wala", 2640628, "wak", scripts = Latn}

m["kwl"] = {"Kofyar", 3441382, "cdc-wst", scripts = Latn}

m["kwm"] = {"Kwambi", 3487165, "bnt-ova"}

m["kwn"] = {"Kwangali", 36334, "bnt-kav", scripts = Latn}

m["kwo"] = {"Kwomtari", 3508116}

m["kwp"] = {"Kodia", 3914867, "kro-ekr"}

m["kwq"] = {"Kwak", 11014183, "nic-nka", ancestors = {"yam"}}

m["kwr"] = {"Kwer", 12635137, "ngf-okk"}

m["kws"] = {"Kwese", 3200846, "bnt-pen"}

m["kwt"] = {"Kwesten", 6450354, "paa-tkw"}

m["kwu"] = {"Kwakum", 35624, "bnt-kak"}

m["kwv"] = {"Sara Kaba Náà", 3915361, "csu-kab"}

m["kww"] = {"Kwinti", 721182}

m["kwx"] = {"Khirwar", 12976968, "dra"}

m["kwz"] = {"Kwadi", 2364661, "khi-kkw", scripts = Latn}

m["kxa"] = {"Kairiru", 3398785, "poz-ocw", scripts = Latn}

m["kxb"] = {"Krobu", 35586, "alv-ptn", scripts = Latn}

m["kxc"] = {"Khonso", 56624, "cus"}

m["kxd"] = {"Brunei Malay", 3182878, "poz-mly", scripts = Latn}

m["kxe"] = {"Kakihum", 3914433, "nic-kam", ancestors = {"tvd"}}

m["kxf"] = {"Manumanaw Karen", 12952592, "kar", scripts = {"Mymr", "Latn"}}

m["kxh"] = {"Karo", 3447116, "omv-aro"}

m["kxi"] = {"Keningau Murut", 6389308, "poz-san", scripts = Latn}

m["kxj"] = {"Kulfa", 713654, "csu-kab"}

m["kxk"] = {"Zayein Karen", 14352960, "kar"}

m["kxl"] = {"Nepali Kurux", 3200624, "dra", scripts = Deva}

m["kxm"] = {"Northern Khmer", 3502234, "mkh-kmr", scripts = {"Thai", "Khmr"}, ancestors = {"mkh-mkm"}, sort_key = {from = {"[%pๆ]", "[็-๎]", "([เแโใไ])([ก-ฮ])"}, to = {"", "", "%2%1"}}}

m["kxn"] = {"Kanowit", 6364300, "poz-bnn", scripts = Latn}

m["kxo"] = {"Kanoé", 4356223, "qfa-iso"}

m["kxp"] = {"Wadiyara Koli", 12953645, "inc-wes"}

m["kxq"] = {"Smärky Kanum", 12952569, "paa-yam"}

m["kxr"] = {"Koro (New Guinea)", 3198994, "poz-oce", scripts = Latn}

m["kxs"] = {"Kangjia", 3182570, "xgn"}

m["kxt"] = {"Koiwat", 6426388, "paa-spk"}

m["kxu"] = {"Kui (India)", 33919, "dra", scripts = {"Orya"}}

m["kxv"] = {"Kuvi", 3200721, "dra", scripts = {"Orya"}}

m["kxw"] = {"Konai", 11732339}

m["kxx"] = {"Likuba", 35646, "bnt-bmo"}

m["kxy"] = {"Kayong", 6380673, "mkh"}

m["kxz"] = {"Kerewo", 6393847, "paa-kiw"}

m["kya"] = {"Kwaya", 6450276, "bnt-haj", scripts = Latn}

m["kyb"] = {"Butbut Kalinga", 18753300, "phi"}

m["kyc"] = {"Kyaka", 12952690, "paa-eng"}

m["kyd"] = {"Karey", 6370196, "poz"}

m["kye"] = {"Krache", 35658, "alv-gng"}

m["kyf"] = {"Kouya", 35595, "kro-bet"}

m["kyg"] = {"Keyagana", 6398208, "paa-kag"}

m["kyh"] = {"Karok", 1288440, "qfa-iso", scripts = Latn}

m["kyi"] = {"Kiput", 3038653, "poz-swa", scripts = Latn}

m["kyj"] = {"Karao", 3192950, "phi"}

m["kyk"] = {"Kamayo", 3192339, "phi"}

m["kyl"] = {"Kalapuya", 3192120, "nai-klp"}

m["kym"] = {"Kpatili", 3913982, "znd"}

m["kyn"] = {"Karolanos", 6373093, "phi"}

m["kyo"] = {"Kelon", 6386414, "ngf"}

m["kyp"] = {"Kang", 25559558, "tai"}

m["kyq"] = {"Kenga", 35707, "csu-bgr"}

m["kyr"] = {"Kuruáya", 3200633, "tup", scripts = Latn}

m["kys"] = {"Baram Kayan", 2883794, "poz"}

m["kyt"] = {"Kayagar", 6380394, "ngf"}

m["kyu"] = {"Western Kayah", 12952596, "kar", scripts = {"Kali", "Mymr", "Latn"}, translit_module = "translit-redirect"}

m["kyv"] = {"Kayort", 6380675, "inc-eas", scripts = {"as-Beng"}, ancestors = {"inc-mgd"}}

m["kyw"] = {"Kudmali", 6446173, "inc-eas", ancestors = {"bh"}}

m["kyx"] = {"Rapoisi", 7294279, "paa-nbo"}

m["kyy"] = {"Kambaira", 6356254, "paa-kag"}

m["kyz"] = {"Kayabí", 6380372, "tup-gua", scripts = Latn}

m["kza"] = {"Western Karaboro", 36601, "alv-krb"}

m["kzb"] = {"Kaibobo", 6347565, "poz-cma"}

m["kzc"] = {"Bondoukou Kulango", 11031321, "alv-kul"}

m["kzd"] = {"Kadai", 7679471, "poz-cma", scripts = Latn}

m["kze"] = {"Kosena", 12952663, "ngf", scripts = Latn}

m["kzf"] = {"Da'a Kaili", 33103997, "poz-kal", scripts = Latn}

m["kzg"] = {"Kikai", 3196527, "jpx-ryu", scripts = {"Jpan"}}

m["kzh"] = {"Dongolawi", 5295991, "nub", scripts = Latn}

m["kzi"] = {"Kelabit", 6385445, "poz-swa", scripts = Latn}

m["kzj"] = {"Coastal Kadazan", 3307195, "poz-san", scripts = Latn}

m["kzk"] = {"Kazukuru", 1089069, "poz-ocw"}

m["kzl"] = {"Kayeli", 4207444, "poz-cma", scripts = Latn}

m["kzm"] = {"Kais", 6348319, "paa", scripts = Latn}

m["kzn"] = {"Kokola", 11128329, "bnt-mak", ancestors = {"vmw"}, scripts = Latn}

m["kzo"] = {"Kaningi", 35683, "bnt-mbt"}

m["kzp"] = {"Kaidipang", 6347611, "phi"}

m["kzq"] = {"Kaike", 10951226, "sit-tam"}

m["kzr"] = {"Karang", 35681, "alv-mbm", scripts = Latn}

m["kzs"] = {"Sugut Dusun", 12953510, "poz-san", scripts = Latn}

m["kzt"] = {"Tambunan Dusun", 12953514, "poz-san", scripts = Latn}

m["kzu"] = {"Kayupulau", 6380723, "poz-ocw"}

m["kzv"] = {"Komyandaret", 6428671, "ngf-okk", scripts = Latn}

m["kzw"] = { -- contrast xoo, sai-kat, sai-xoc, the last of which the ISO conflated into this code
    "Kariri",
    12953620,
    "sai-mje",
    scripts = Latn
}

m["kzx"] = {"Kamarian", 6356040, "poz-cma", scripts = Latn}

m["kzy"] = {"Kango-Sua", 11008360, "bnt-kbi", ancestors = {"bip"}, scripts = Latn}

m["kzz"] = {"Kalabra", 6350038, "paa", scripts = Latn}

return m
