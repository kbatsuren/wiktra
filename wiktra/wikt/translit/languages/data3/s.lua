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

m["saa"] = {"Saba", 3914885, "cdc-est", Latn}

m["sab"] = {"Buglere", 3368506, "cba", Latn}

m["sac"] = {"Fox", 12714767, "alg-sfk", Latn}

m["sad"] = {"Sandawe", 34016, "qfa-iso", Latn}

m["sae"] = {"Sabanê", 3460478, "sai-nmk", Latn}

m["saf"] = {"Safaliba", 36432, "nic-mre", Latn}

m["sah"] = {"Yakut", 34299, "trk-sib", {"Cyrl"}, translit_module = "sah-translit", override_translit = true}

m["saj"] = {"Sahu", 7399757, "paa", Latn}

m["sak"] = {"Sake", 36425, "bnt-kel", Latn}

m["sam"] = {"Samaritan Aramaic", 56612, "sem-arw", {"Samr"}, entry_name = {from = {"[" .. u(0x0816) .. "-" .. u(0x082D) .. "]"}, to = {}}, translit_module = "Samr-translit"}

m["sao"] = {"Sause", 4409155, "paa-tkw", Latn}

m["saq"] = {"Samburu", 56536, "sdv-lma"}

m["sar"] = {"Saraveca", 3450556, "awd"}

m["sas"] = {"Sasak", 1294047, "poz-mcm", Latn}

m["sat"] = {"Santali", 33965, "mun", {"Olck"}, translit_module = "Olck-translit", override_translit = true}

m["sau"] = {"Saleman", 7404262, "poz-cet"}

m["sav"] = {"Saafi-Saafi", 36308, "alv-cng", {"Arab", "Latn"}}

m["saw"] = {"Sawi", 677064, "ngf", Latn}

m["sax"] = {"Sa", 3460352, "poz-vnc", Latn}

m["say"] = {"Saya", 3914431, "cdc-wst", Latn}

m["saz"] = {"Saurashtra", 13292, "inc-wes", {"Saur", "Latn", "Taml", "Deva"}, translit_module = "saz-translit", ancestors = {"inc-ogu"}}

m["sba"] = {"Ngambay", 2372207, "csu-sar"}

m["sbb"] = {"Simbo", 3484101, "poz-ocw"}

m["sbc"] = {"Gele'", 3194847, "poz-oce"}

m["sbd"] = {"Southern Samo", 33122730, "dmn-sam", Latn}

m["sbe"] = {"Saliba (New Guinea)", 3469737, "poz-ocw"}

m["sbf"] = {"Shabo", 36342, "ssa", Latn}

m["sbg"] = {"Seget", 7446237}

m["sbh"] = {"Sori-Harengan", 36515, "poz-aay", Latn}

m["sbi"] = {"Seti", 7456682, "qfa-tor", Latn}

m["sbj"] = {"Surbakhal", 759995}

m["sbk"] = {"Safwa", 4121160, "bnt-mby", Latn}

m["sbl"] = {"Botolan Sambal", 4095195, "phi"}

m["sbm"] = {"Sagala", 11732610, "bnt-ruv", Latn}

m["sbn"] = {"Sindhi Bhil", 25559289, "inc-nwe", {"Arab", "Deva", "Sind", "Guru"}, ancestors = {"sd"}}

m["sbo"] = {"Sabüm", 7396535, "mkh-asl"}

m["sbp"] = {"Sangu (Tanzania)", 7418149, "bnt-bki", Latn}

m["sbq"] = {"Sileibi", 7514337, "ngf-mad"}

m["sbr"] = {"Sembakung Murut", 7449148, "poz-san"}

m["sbs"] = {"Subiya", 6442073, "bnt-bot", Latn}

m["sbt"] = {"Kimki", 6410160, "paa-pau"}

m["sbu"] = {"Stod Bhoti", 15622700, "sit-las"}

m["sbv"] = {"Sabine", nil, "itc", Latn}

m["sbw"] = {"Simba", 36430, "bnt-tso", Latn}

m["sbx"] = {"Seberuang", 12473470, "poz-mly"}

m["sby"] = {"Soli", 7557754, "bnt-bot", Latn}

m["sbz"] = {"Sara Kaba", 25559318, "csu-kab", Latn}

m["scb"] = {"Chut", 2967709, "mkh-vie"}

m["sce"] = {"Dongxiang", 32947, "xgn", {"Arab", "Latn"}}

m["scf"] = {"San Miguel Creole French", 12953094, "crp", ancestors = {"gcf"}}

m["scg"] = {"Sanggau", 12473466, "day"}

m["sch"] = {"Sakachep", 37054, "tbq-kuk"}

m["sci"] = {"Sri Lankan Creole Malay", 1089151, "crp", Latn, ancestors = {"ms"}}

m["sck"] = {"Sadri", 765922, "inc-eas", ancestors = {"bh"}}

m["scl"] = {"Shina", 1353320, "inc-dar", {"ur-Arab", "Deva"}, ancestors = {"inc-dar-pro"}}

m["scn"] = {"Sicilian", 33973, "roa-itd", Latn}

m["sco"] = {"Scots", 14549, "gmw", Latn, ancestors = {"enm"}}

m["scp"] = {"Yolmo", 22662107, "sit-kyk", {"Deva"}}

m["scq"] = {"Sa'och", 6583617, "mkh-pea"}

m["scs"] = {"North Slavey", 20628, "ath-nor", Latn}

m["scu"] = {"Shumcho", 22077739, "sit-kin"}

m["scv"] = {"Sheni", 11015820, "nic-jer", Latn, ancestors = {"zir"}}

m["scw"] = {"Sha", 3438816, "cdc-wst", Latn}

m["scx"] = {"Sicel", 36667, "ine"}

m["sda"] = {"Toraja-Sa'dan", 36673, "poz-ssw"}

m["sdb"] = {"Shabak", 3289596, "ira-zgr", ancestors = {"hac"}}

m["sdc"] = {"Sassarese", 845441, "roa-itd", Latn}

m["sde"] = {"Surubu", 3913336, "nic-kau", Latn}

m["sdf"] = {"Sarli", 7424256, "ira-zgr", ancestors = {"hac"}}

m["sdg"] = {"Savi", 3474654, "inc-dar", ancestors = {"inc-dar-pro"}}

m["sdh"] = {"Southern Kurdish", 1496597, "ku", {"ku-Arab", "Latn"}, translit_module = "sdh-translit", link_tr = true, entry_name = {from = {u(0x0650), u(0x0652)}, to = {}}, ancestors = {"ku-pro"}}

m["sdj"] = {"Suundi", 7650407, "bnt-kng", Latn}

m["sdk"] = {"Sos Kundi", 7563811, "paa-spk", Latn}

m["sdl"] = {"Saudi Arabian Sign Language", 3504160, "sgn"}

m["sdm"] = {"Semandang", 7449012, "day"}

m["sdn"] = {"Gallurese", 612220, "roa-itd", Latn, ancestors = {"co"}}

m["sdo"] = {"Bukar-Sadung Bidayuh", 2927799, "day"}

m["sdp"] = {"Sherdukpen", 7494785, "sit-khb"}

m["sdr"] = {"Oraon Sadri", 12953860, "inc-eas", ancestors = {"bh"}}

m["sds"] = {"Sened", 56570, "ber"}

m["sdu"] = {"Sarudu", 7424700, "poz-cet"}

m["sdx"] = {"Sibu Melanau", 18642842, "poz-bnn"}

m["sea"] = {"Semai", 3135426, "mkh-asl", Latn}

-- seb is a duplicate code of spp

m["sec"] = {"Sechelt", 7442898, "sal", Latn}

m["sed"] = {"Sedang", 56448, "mkh-nbn"}

m["see"] = {"Seneca", 1185133, "iro", Latn}

m["sef"] = {"Cebaara Senoufo", 10975121, "alv-snr"}

m["seg"] = {"Segeju", 17584599, "bnt-mij", Latn}

m["seh"] = {"Sena", 2964008, "bnt-sna", Latn}

m["sei"] = {"Seri", 36583, "qfa-iso", Latn}

m["sej"] = {"Sene", 7450252}

m["sek"] = {"Sekani", 28562, "ath-nor", Latn}

m["sel"] = {"Selkup", 34008, "syd", {"Cyrl"}}

m["sen"] = {"Nanerigé Sénoufo", 36002, "alv-sma"}

m["seo"] = {"Suarmin", 7630513, "paa"}

m["sep"] = {"Sìcìté Sénoufo", 56787, "alv-sma"}

m["seq"] = {"Senara Sénoufo", 35210, "alv-snr"}

m["ser"] = {"Serrano", 3479942, "azc-tak", Latn}

m["ses"] = {"Koyraboro Senni", 35655, "son", Latn}

m["set"] = {"Sentani", 3441672, "paa-sen", Latn}

m["seu"] = {"Serui-Laut", 7455503, "poz-hce", Latn}

m["sev"] = {"Nyarafolo Senoufo", 36306, "alv-snr"}

m["sew"] = {"Sewa Bay", 7458126, "poz-ocw"}

m["sey"] = {"Secoya", 3477218, "sai-tuc", Latn}

m["sez"] = {"Senthang Chin", 7451223, "tbq-kuk"}

m["sfb"] = {"French Belgian Sign Language", 3217332, "sgn"}

m["sfm"] = {"Small Flowery Miao", 7542773, "hmn"}

m["sfs"] = {"South African Sign Language", 3322093, "sgn"}

m["sfw"] = {"Sehwi", 36593, "alv-ctn", Latn}

m["sga"] = {"Old Irish", 35308, "cel-gae", Latn, ancestors = {"pgl"}, entry_name = {from = {"ḟ", "ṁ", "ṅ", "ṡ", "Ḟ", "Ṁ", "Ṅ", "Ṡ", "ä", "ë", "ï", "ö", "ü", "·"}, to = {"f", "m", "n", "s", "F", "M", "N", "S", "a", "e", "i", "o", "u"}}, sort_key = {from = {"á", "é", "æ", "ǽ", "í", "ó", "ú", "^h", "-"}, to = {"a", "e", "e", "e", "i", "o", "u"}}, standardChars = "A-IL-PR-Ua-il-pr-u0-9ÁáÉéÍíÓóÚú" .. PUNCTUATION}

m["sgb"] = {"Mag-Anchi Ayta", 4356243, "phi"}

m["sgc"] = {"Kipsigis", 56339, "sdv-nma"}

m["sgd"] = {"Surigaonon", 34140, "phi", Latn}

m["sge"] = {"Segai", 7446180}

m["sgg"] = {"Swiss-German Sign Language", 35150, "sgn"}

m["sgh"] = {"Shughni", 34053, "ira-shy", {"Latn", "Cyrl"}, translit_module = "sgh-translit", override_translit = true, ancestors = {"ira-shr-pro"}}

m["sgi"] = {"Suga", 36475, "nic-mmb", Latn}

m["sgk"] = {"Sangkong", 2945610, "tbq-lol"}

m["sgm"] = {"Singa", 7522797, "bnt-lok", Latn}

m["sgp"] = {"Singpho", 7524158, "sit-jnp"}

m["sgr"] = {"Sangisari", 3394363, "ira-kms"}

m["sgs"] = {"Samogitian", 213434, "bat", Latn, ancestors = {"olt"}, wikimedia_codes = {"bat-smg"}}

m["sgt"] = {"Brokpake", 56603, "sit-tib"}

m["sgu"] = {"Salas", 7403694, "poz-cma"}

m["sgw"] = {"Sebat Bet Gurage", 2707343, "sem-eth", {"Ethi"}}

m["sgx"] = {"Sierra Leone Sign Language", 7511448, "sgn"}

m["sgy"] = {"Sanglechi", 3472220, "ira-sgi", ancestors = {"ira-sgi-pro"}}

m["sgz"] = {"Sursurunga", 36511, "poz-ocw", Latn}

m["sha"] = {"Shall-Zwall", 3915355, "nic-beo"}

m["shb"] = {"Ninam", 3436586}

m["shc"] = {"Sonde", 7560881, "bnt-pen", Latn}

m["shd"] = {"Kundal Shahi", 6444265, "inc-dar"}

m["she"] = {"Sheko", 3183355, "omv-diz"}

m["shg"] = {"Shua", 3501092, "khi-kal", Latn}

m["shh"] = {"Shoshone", 33811, "azc-num", Latn}

m["shi"] = {"Tashelhit", 34152, "ber", {"Tfng", "Arab", "Latn"}, translit_module = "Tfng-translit"}

m["shj"] = {"Shatt", 56344, "sdv-daj"}

m["shk"] = {"Shilluk", 36486, "sdv-lon", Latn}

m["shl"] = {"Shendu", 22074616, "tbq-kuk"}

m["shm"] = {"Shahrudi", 7462280, "xme-ttc", ancestors = {"xme-ttc-cen"}}

m["shn"] = {"Shan", 56482, "tai-swe", {"Mymr"}, translit_module = "shn-translit", sort_key = {from = {"[ၢႃ]", "ဵ", "ႅ", "ႇ", "ႈ", "း", "ႉ", "ႊ"}, to = {"ာ", "ေ", "ႄ", "႒", "႓", "႔", "႕", "႖"}}}

m["sho"] = {"Shanga", 3913931, "dmn-bbu", Latn}

m["shp"] = {"Shipibo-Conibo", 2671988, "sai-pan", Latn}

m["shq"] = {"Sala", 10961665, "bnt-bot", Latn}

m["shr"] = {"Shi", 3481999, "bnt-shh", Latn}

m["shs"] = {"Shuswap", 3482685, "sal", Latn}

m["sht"] = {"Shasta", 56396, "nai-shs", Latn}

m["shu"] = {"Chadian Arabic", 56497, "sem-arb", {"Arab"}, entry_name = {from = {u(0x0671), u(0x064B), u(0x064C), u(0x064D), u(0x064E), u(0x064F), u(0x0650), u(0x0651), u(0x0652), u(0x0670), u(0x0640)}, to = {u(0x0627)}}}

m["shv"] = {"Shehri", 33445, "sem-sar", {"Arab", "Latn"}, ancestors = {"sem-pro"}}

m["shw"] = {"Shwai", 36527, "alv-hei"}

m["shx"] = {"She", 2605689, "hmn"}

m["shy"] = {"Tachawit", 33274, "ber"}

m["shz"] = {"Syenara Senoufo", 36316, "alv-snr"}

m["sia"] = {"Akkala Sami", 35241, "smi", Latn}

m["sib"] = {"Sebop", 7442799, "poz-swa", Latn}

m["sid"] = {"Sidamo", 33786, "cus", {"Latn", "Ethi"}}

m["sie"] = {"Simaa", 7517329, "bnt-kav", Latn}

m["sif"] = {"Siamou", 36252}

m["sig"] = {"Paasaal", 36426, "nic-sis", Latn}

m["sih"] = {"Zire", 8072753, "poz-cln"}

m["sii"] = {"Shom Peng", 1039346, "aav"}

m["sij"] = {"Numbami", 3346277, "poz-ocw"}

m["sik"] = {"Sikiana", 3443734, "sai-car", Latn}

m["sil"] = {"Tumulung Sisaala", 25383006, "nic-sis", Latn}

m["sim"] = {"Seim", 7446815, "paa-spk"}

m["sip"] = {"Sikkimese", 35285, "sit-tib", {"Tibt"}, ancestors = {"xct"}, translit_module = "bo-translit"}

m["siq"] = {"Sonia", 7561770}

m["sir"] = {"Siri", 3438729, "cdc-wst", Latn}

m["sis"] = {"Siuslaw", 2315424}

m["siu"] = {"Sinagen", 7521655, "qfa-tor", Latn}

m["siv"] = {"Sumariup", 7636966, "paa-spk", Latn}

m["siw"] = {"Siwai", 7532519, "paa-sbo"}

m["six"] = {"Sumau", 7637021, "ngf-mad", Latn}

m["siy"] = {"Sivandi", 13269, "xme", ancestors = {"xme-mid"}}

m["siz"] = {"Siwi", 36814, "ber", {"Tfng", "Arab", "Latn"}}

m["sja"] = {"Epena", 3055682, "sai-chc"}

m["sjb"] = {"Sajau Basap", 4684353, "poz-bnn"}

m["sjd"] = {"Kildin Sami", 33656, "smi", {"Cyrl"}, translit_module = "sjd-translit", sort_key = {from = {"ӣ", "ӯ", MACRON}, to = {"и", "у"}}}

m["sje"] = {"Pite Sami", 56314, "smi", Latn, entry_name = {from = {"ū", "ˈ", MACRON}, to = {"u"}}, sort_key = {from = {"á", "đ", "ŋ", "ŧ"}, to = {"a²", "d²", "n²", "t²"}}}

m["sjg"] = {"Assangori", 3502255, "sdv-tmn"}

m["sjk"] = {"Kemi Sami", 35871, "smi", Latn}

m["sjl"] = {"Miji", 6845470, "sit-hrs"}

m["sjm"] = {"Mapun", 3287253, "poz-sbj"}

m["sjn"] = {"Sindarin", 56437, "art", {"Latn", "Teng"}, type = "appendix-constructed"}

m["sjo"] = {"Xibe", 13223, "tuw", {"Mong"}}

m["sjp"] = {"Surjapuri", 7645351, "inc-eas", ancestors = {"inc-mgd"}}

m["sjr"] = {"Siar-Lak", 3482907, "poz-ocw"}

m["sjs"] = {"Senhaja De Srair", 56744, "ber"}

m["sjt"] = {"Ter Sami", 36656, "smi", Latn}

m["sju"] = {"Ume Sami", 56415, "smi", Latn, entry_name = {from = {"ē", "ū", "ǖ", MACRON, "ˈ"}, to = {"e", "u", "ü"}}, sort_key = {from = {"á", "đ", "ï", "ŋ", "ŧ", "ü"}, to = {"a²", "d²", "i²", "n²", "t²", "u²"}}}

m["sjw"] = {"Shawnee", 2669206, "alg", Latn}

m["ska"] = {"Skagit", 25559652, "sal", Latn}

m["skb"] = {"Saek", 36437, "tai-nor", {"Thai"}, sort_key = {from = {"[%pๆ]", "[็-๎̱̄̂]", "([เแโใไ])([ก-ฮ])"}, to = {"", "", "%2%1"}}}

m["skc"] = {"Ma Manda", 6720783, "ngf-fin"}

m["skd"] = {"Southern Sierra Miwok", 3492334, "nai-utn", Latn}

m["ske"] = {"Ske", 7534244, "poz-vnc", Latn}

m["skf"] = {"Sakirabiá", 3304806, "tup", Latn}

m["skh"] = {"Sikule", 3121081, "poz-nws"}

m["ski"] = {"Sika", 33960, "poz-cet", Latn}

m["skj"] = { -- compare 'ths'
    "Seke", 30226846, "sit-tam"
}

m["skk"] = {"Sok", 12953887, "mkh-ban"}

m["skm"] = {"Sakam", 6448517, "ngf-fin"}

m["skn"] = {"Kolibugan Subanon", 18755617, "phi"}

m["sko"] = {"Seko Tengah", 15613270, "poz"}

m["skp"] = {"Sekapan", 7447132, "poz-bnn"}

m["skq"] = {"Sininkere", 3914896, "dmn-man", Latn}

m["skr"] = {"Saraiki", 33902, "inc-pan", {"ur-Arab", "Mult", "Deva"}, ancestors = {"lah"}, entry_name = {from = {u(0x064B), u(0x064C), u(0x064D), u(0x064E), u(0x064F), u(0x0650), u(0x0651), u(0x0652)}, to = {}}}

m["sks"] = {"Maia", 12952760, "ngf-mad", Latn}

m["skt"] = {"Sakata", 36691, "bnt-bnm", Latn}

m["sku"] = {"Sakao", 3298421, "poz-vnc", Latn}

m["skv"] = {"Skou", 3915200, "paa-msk", Latn}

m["skw"] = {"Skepi Creole Dutch", 2522153, "crp", ancestors = {"nl"}}

m["skx"] = {"Seko Padang", 15613282, "poz-ssw"}

m["sky"] = {"Sikaiana", 7439242, "poz-pnp", Latn}

m["skz"] = {"Sekar", 7447136, "poz-cet"}

m["slc"] = {"Saliba (Colombia)", 3441097}

m["sld"] = {"Sissala", 11020264, "nic-sis", Latn}

m["sle"] = {"Sholaga", 7500203, "dra", {"Knda"}}

m["slf"] = {"Swiss-Italian Sign Language", 12953479, "sgn"}

m["slg"] = {"Selungai Murut", 7448844, "poz-san"}

m["slh"] = {"Southern Puget Sound Salish", 12642471, "sal", Latn}

-- "sli" "Silesian German" IS SUBSUMED INTO "gmw-ecg" "East Central German"

m["slj"] = {"Salumá", 7406296, "sai-car", Latn}

m["sll"] = {"Salt-Yui", 7405785}

m["slm"] = {"Pangutaran Sama", 3362086, "poz-sbj"}

m["sln"] = {"Salinan", 1568938}

m["slp"] = {"Lamaholot", 6480777, "poz-cet", Latn}

m["slq"] = {"Salchuq", 56752, "trk"}

m["slr"] = {"Salar", 33963, "trk", {"Arab", "Latn"}}

m["sls"] = {"Singapore Sign Language", 7512563, "sgn"}

m["slt"] = {"Sila", 7514021, "tbq-lol"}

m["slu"] = {"Selaru", 7447500, "poz-cet"}

m["slw"] = {"Sialum", 7506694, "ngf"}

m["slx"] = {"Salampasu", 7403607, "bnt-lun", Latn}

m["sly"] = {"Selayar", 7447520, "poz-ssw"}

m["slz"] = {"Ma'ya", 2291492, "poz-hce"}

m["sma"] = {
    "Southern Sami",
    13293,
    "smi",
    Latn,
    sort_key = { -- Standardise on Norwegian orthography for sorting purposes
        from = {"ï", "ä", "ö"},
        to = {"i²", "æ", "ø"}
    }
}

m["smb"] = {"Simbari", 7517427, "ngf"}

m["smc"] = {"Som", 7559081, "ngf-fin", Latn}

m["smd"] = {"Sama", 6407456, "bnt-kmb", Latn}

m["smf"] = {"Auwe", 3502072, "paa-brd", ancestors = {"dnd"}}

m["smg"] = {"Simbali", 56692, "paa-bng"}

m["smh"] = {"Samei", 7409269, "tbq-lol"}

m["smj"] = {
    "Lule Sami",
    56322,
    "smi",
    Latn,
    entry_name = {from = {"ˈ", MACRON}, to = {}},
    sort_key = { -- Standardise on Swedish orthography for sorting purposes
        from = {"á", "ŋ", "æ"},
        to = {"a²", "n²", "ä"}
    }
}

m["smk"] = {"Bolinao", 2669235, "phi"}

m["sml"] = {"Central Sama", 3470593, "poz-sbj"}

m["smm"] = {"Musasa", 6940122, "inc-eas", ancestors = {"bh"}}

m["smn"] = {"Inari Sami", 33462, "smi", Latn, entry_name = {from = {"ḥ", "ḷ", "ṃ", "ṇ", "ṛ", "ṿ", DOTBELOW, "ˈ"}, to = {"h", "l", "m", "n", "r", "v"}}, sort_key = {from = {"â", "č", "đ", "ŋ", "š", "ž", "á"}, to = {"a˿", "c˿", "d˿", "n˿", "s˿", "z˿", "ä˿"}}}

m["smp"] = {"Samaritan Hebrew", 56502, "sem-can", {"Samr"}, entry_name = {from = {"[" .. u(0x0816) .. "-" .. u(0x082D) .. "]"}, to = {}}}

m["smq"] = {"Samo", 7409884, "ngf"}

m["smr"] = {"Simeulue", 2992833, "poz-nws", Latn}

m["sms"] = {"Skolt Sami", 13271, "smi", Latn, entry_name = {from = {"ẹ", "ˈ"}, to = {"e"}}, sort_key = {from = {"â", "č", "đ", "ǧ", "ǥ", "ǩ", "ŋ", "õ", "š", "ž"}, to = {"a²", "c²", "d²", "g²", "g³", "k˿", "n˿", "o˿", "s˿", "z˿"}}}

m["smt"] = {"Simte", 7521268, "tbq-kuk"}

m["smu"] = {"Somray", 6583612, "mkh-pea"}

m["smv"] = {"Samvedi", 6345632, "inc-sou", ancestors = {"pmh"}}

m["smw"] = {"Sumbawa", 3182585, "poz-mcm", Latn}

m["smx"] = {"Samba", 11120157, "bnt-pen", Latn}

m["smy"] = {"Semnani", 14531212, "xme", ancestors = {"xme-old"}}

m["smz"] = {"Simeku", 7517534, "paa-sbo"}

m["snb"] = {"Sebuyau", 7442836, "poz-mly"}

m["snc"] = {"Sinaugoro", 4170719, "poz-ocw"}

m["sne"] = {"Bau Bidayuh", 2891938, "day", Latn}

m["snf"] = {"Noon", 36304, "alv-cng", Latn}

m["sng"] = {"Sanga (Congo)", 3438316, "bnt-lub", Latn}

m["sni"] = {"Sensi", 7451029, "sai-pan", Latn}

m["snj"] = {"Riverain Sango", 25559751, "crp", Latn, ancestors = {"ngb"}}

m["snk"] = {"Soninke", 36660, "dmn-snb", Latn}

m["snl"] = {"Sangil", 3472206, "phi"}

m["snm"] = {"Southern Ma'di", 15637273, "csu-mma"}

m["snn"] = {"Siona", 3485116, "sai-tuc", Latn}

m["sno"] = {"Snohomish", 25559662, "sal", Latn}

m["snp"] = {"Siane", 7506812, "paa-kag", Latn}

m["snq"] = {"Sangu (Gabon)", 36609, "bnt-sir", Latn}

m["snr"] = {"Sihan", 7513400, "ngf-mad"}

m["sns"] = {"Nahavaq", 2160435, "poz-vnc"}

m["snu"] = {"Senggi", 7929052, "paa-brd"}

m["snv"] = {"Sa'ban", 3474891, "poz-swa", Latn}

m["snw"] = {"Selee", 36272, "alv-ntg", Latn}

m["snx"] = {"Sam", 7408387}

m["sny"] = {"Saniyo-Hiyewe", 7418302, "paa-spk", Latn}

m["snz"] = {
    "Kou", 7525035, -- also 4803639
    "ngf-mad", Latn
}

m["soa"] = {
    "Thai Song",
    7709159,
    "tai-swe",
    {"Tavt", "Thai"},
    -- translit_module = "Tavt-translit",
    sort_key = {from = {"([ꪵꪶꪹꪻꪼ])([ꪀ-ꪯ])", "([เแโใไ])([ก-ฮ])"}, to = {"%2%1", "%2%1"}}
}

m["sob"] = {"Sobei", 3121035, "poz-ocw"}

m["soc"] = {"Soko", 7555138, "bnt-ske", Latn}

m["sod"] = {"Songoora", 7561296, "bnt-lgb", Latn}

m["soe"] = {"Songomeno", 5713543, "bnt-bsh", Latn}

m["sog"] = {"Sogdian", 205979, "ira-sgc", {"Sogd", "Mani", "Syrc", "Sogo"}, translit_module = "translit-redirect"}

m["soh"] = {"Aka (Sudan)", 3450949, "sdv-eje", Latn}

m["soi"] = {"Sonha", 12953890, "inc-eas", ancestors = {"inc-mgd"}}

m["sok"] = {"Sokoro", 3441303, "cdc-est", Latn}

m["sol"] = {"Solos", 3489591, "poz-ocw"}

m["soo"] = {"Nsong", 12953148, "bnt-bdz", Latn}

m["sop"] = {"Songe", 3130911, "bnt-lbn", Latn}

m["soq"] = {"Kanasi", 11732656}

m["sor"] = {"Somrai", 3123566, "cdc-est", Latn}

m["sos"] = {"Seenku", 36274, "dmn-smg"}

m["sou"] = {"Southern Thai", 56508, "tai-swe", {"Thai"}, sort_key = {from = {"[%pๆ]", "[็-๎]", "([เแโใไ])([ก-ฮ])"}, to = {"", "", "%2%1"}}}

m["sov"] = {"Sonsorolese", 13281, "poz-mic", Latn}

m["sow"] = {"Sowanda", 7571845, "paa-brd"}

m["sox"] = {"Swo", 36604, "bnt-mka", Latn}

m["soy"] = {"Miyobe", 35913, "alv-sav", Latn}

m["soz"] = {"Temi", 13278, "bnt-kka", Latn}

m["spb"] = {"Sepa (Indonesia)", 18603687, "poz-cma", Latn}

m["spc"] = {"Sapé", 2888158, nil, Latn}

m["spd"] = {"Saep", 7398312, "ngf-mad"}

m["spe"] = {"Sepa (New Guinea)", 7451725, "poz-ocw", Latn}

m["spg"] = {"Sian", 7506806, "poz-bnn"}

m["spi"] = {"Saponi", 3915418, "paa"}

m["spk"] = {"Sengo", 7450584, "paa-spk", Latn}

m["spl"] = {"Selepet", 7447917, "ngf"}

m["spm"] = {"Sepen", 4701931, "paa", Latn}

m["spn"] = {"Sanapaná", 3033556, "sai-mas", Latn}

m["spo"] = {"Spokane", 3493704, "sal"}

m["spp"] = {"Supyire", 56284, "alv-sma", Latn}

m["spr"] = {"Saparua", 7420921, "poz-cma"}

m["sps"] = {"Saposa", 3473187, "poz-ocw"}

m["spt"] = {"Spiti Bhoti", 22080879, "sit-las"}

m["spu"] = {"Sapuan", 7421168, "mkh-ban"}

m["spv"] = {"Sambalpuri", 6433240, "inc-eas", {"Orya"}, translit_module = "or-translit", ancestors = {"or"}}

m["spx"] = {"South Picene", 36688, "itc", {"Ital", "Latn"}, translit_module = "Ital-translit"}

m["spy"] = {"Sabaot", 7395896, "sdv-kln"}

m["sqa"] = {"Shama-Sambuga", 3914392, "nic-kmk", Latn}

m["sqh"] = {"Shau", 3913925, "nic-jer", Latn}

m["sqk"] = {"Albanian Sign Language", 4709168, "sgn"}

m["sqm"] = {"Suma", 11008431, "alv-gbw"}

m["sqn"] = {"Susquehannock", 3505736, "iro"}

m["sqo"] = {"Sorkhei", 3491964, "ira-kms"}

m["sqq"] = {"Sou", 16979751, "mkh-ban"}

m["sqr"] = {"Siculo-Arabic", 1069489, "sem-arb"}

m["sqs"] = {"Sri Lankan Sign Language", 3915466, "sgn"}

m["sqt"] = {"Soqotri", 13283, "sem-sar", {"Arab", "Latn"}}

m["squ"] = {"Squamish", 2484579, "sal", Latn}

m["sra"] = {"Saruga", 7424699, "ngf-mad", Latn}

m["srb"] = {"Sora", 13284, "mun", {"Sora"}}

m["sre"] = {"Sara", 33957, "day"}

m["srf"] = {"Nafi", 6958174, "poz-ocw"}

m["srg"] = {"Sulod", 7636489, "phi"}

m["srh"] = {"Sarikoli", 33873, "ira-shy", {"Latn", "ug-Arab", "Cyrl"}, ancestors = {"ira-shr-pro"}}

m["sri"] = {"Siriano", 3485264, "sai-tuc", Latn}

m["srk"] = {"Serudung Murut", 7455497, "poz-san"}

m["srl"] = {"Isirawa", 4203802, "paa-tkw"}

m["srm"] = {"Saramaccan", 33779, "crp", Latn, ancestors = {"en", "pt"}}

m["srn"] = {"Sranan Tongo", 33989, "crp", Latn}

m["srq"] = {"Sirionó", 3027953, "tup-gua", Latn}

m["srr"] = {"Serer", 36284, "alv-fwo", Latn}

m["srs"] = {"Sarcee", 20825, "ath-nor", Latn}

m["srt"] = {"Sauri", 7427547, "paa-egb"}

m["sru"] = {"Suruí", 7646993, "tup", Latn}

m["srv"] = {"Waray Sorsogon", 18755610, "phi"}

m["srw"] = {"Serua", 14916905, "poz-cet"}

m["srx"] = {"Sirmauri", 7530505, "him"}

m["sry"] = {"Sera", 7452602, "poz-ocw", Latn}

m["srz"] = {"Shahmirzadi", 12953126, "ira-msh", {"fa-Arab"}}

m["ssb"] = {"Southern Sama", 3470594, "poz-sbj", Latn}

m["ssc"] = {"Suba-Simbiti", 7630687, "bnt-lok", Latn}

m["ssd"] = {"Siroi", 10771067, "ngf-mad", Latn}

m["sse"] = {"Balangingi", 2880535, "poz-sbj", Latn}

m["ssf"] = {"Thao", 676492, "map", Latn}

m["ssg"] = {"Seimat", 3182581, "poz-aay"}

m["ssh"] = {"Shihhi Arabic", 56571, "sem-arb", {"Arab"}, entry_name = {from = {u(0x0671), u(0x064B), u(0x064C), u(0x064D), u(0x064E), u(0x064F), u(0x0650), u(0x0651), u(0x0652), u(0x0670), u(0x0640)}, to = {u(0x0627)}}}

m["ssi"] = {"Sansi", 3309366, "inc-nwe", ancestors = {"psu"}}

m["ssj"] = {"Sausi", 7427605, "ngf-mad", Latn}

m["ssk"] = {"Sunam", 11002210, "sit-kin"}

m["ssl"] = {"Western Sisaala", 11154776, "nic-sis", Latn}

m["ssm"] = {"Semnam", 7449713, "mkh-asl"}

m["ssn"] = {"Waata", 3501553, "cus"}

m["sso"] = {"Sissano", 7530937, "poz-ocw", Latn}

m["ssp"] = {"Spanish Sign Language", 3100814, "sgn"}

m["ssq"] = {"So'a", 7572120, "poz-cet", Latn}

m["ssr"] = {"Swiss-French Sign Language", 12953483, "sgn"}

m["sss"] = {"Sô", 3082037, "mkh-kat"}

m["sst"] = {"Sinasina", 7521813, "ngf", Latn}

m["ssu"] = {"Susuami", 7649752, "ngf", Latn}

m["ssv"] = {"Shark Bay", 7489783, "poz-vnc"}

m["ssx"] = {"Samberigi", 7409020, "paa-eng", Latn}

m["ssy"] = {"Saho", 36353, "cus", {"Latn", "Ethi", "Arab"}, entry_name = {remove_diacritics = ACUTE}}

m["ssz"] = {"Sengseng", 7450601, "poz-ocw", Latn}

m["stb"] = {"Northern Subanen", 12953892, "phi"}

m["std"] = {"Sentinelese", 568377}

m["ste"] = {"Liana-Seti", 6539924, "poz-cma"}

m["stf"] = {"Seta", 7456326, "qfa-tor", Latn}

m["stg"] = {"Trieng", 22694648, "mkh-ban"}

m["sth"] = {"Shelta", 36705, "crp", Latn, ancestors = {"en"}}

m["sti"] = {"Bulo Stieng", 15771431, "mkh-ban"}

m["stj"] = {"Matya Samo", 10974879, "dmn-sam", Latn}

m["stk"] = {"Arammba", 3502094, "ngf"}

m["stm"] = {"Setaman", 7456333, "ngf-okk", Latn}

m["stn"] = {"Owa", 1324132, "poz-sls", Latn}

m["sto"] = {"Stoney", 3033570, "sio-dkt"}

m["stp"] = {"Southeastern Tepehuan", 12953917, "azc", Latn}

m["stq"] = {"Saterland Frisian", 27154, "gmw-fri", Latn}

m["str"] = {"Saanich", 36444, "sal", Latn}

m["sts"] = {"Shumashti", 33777, "inc-dar"}

m["stt"] = {"Budeh Stieng", 12953891, "mkh-ban"}

m["stu"] = {"Samtao", 25559550, "mkh-pal"}

m["stv"] = {"Silt'e", nil, "sem-eth", {"Ethi"}}

m["stw"] = {"Satawalese", 28477, "poz-mic"}

m["sty"] = {"Siberian Tatar", 4418344, "trk-kno", {"Cyrl"}}

m["sua"] = {"Sulka", 7636341, "qfa-iso"}

m["sub"] = {"Suku", 12953160, "bnt-yak", Latn}

m["suc"] = {"Western Subanon", 16113894, "phi"}

m["sue"] = {"Suena", 7634386, "ngf", Latn}

m["sug"] = {"Suganga", 7634706, "ngf-okk", Latn}

m["sui"] = {"Suki", 2089984, "ngf", Latn}

m["suk"] = {"Sukuma", 2638144, "bnt-tkm", Latn}

m["suq"] = {"Suri", 5364172, "sdv"}

m["sur"] = {"Mwaghavul", 3440486, "cdc-wst", Latn}

m["sus"] = {"Susu", 33990, "dmn-sya", Latn}

m["sut"] = {"Subtiaba", 3915405, "omq", Latn}

m["suv"] = {"Sulung", 56408, "sit-khb"}

m["suw"] = {"Sumbwa", 7637055, "bnt-glb", Latn}

m["sux"] = {"Sumerian", 36790, "qfa-iso", {"Xsux"}}

m["suy"] = {"Suyá", 3505859, "sai-nje", Latn}

m["suz"] = {"Sunwar", 56549, "sit-kiw"}

m["sva"] = {"Svan", 34067, "ccs", {"Geor", "Cyrl"}, translit_module = "sva-translit", override_translit = true, entry_name = {from = {DIAER, MACRON}, to = {}}}

m["svb"] = {"Ulau-Suain", 7878769, "poz-ocw", Latn}

m["svc"] = {"Vincentian Creole English", 3501785, "crp", Latn, ancestors = {"en"}}

m["sve"] = {"Serili", 7454834, "poz-tim"}

m["svk"] = {"Slovakian Sign Language", 7541557, "sgn"}

m["svm"] = {"Slavomolisano", 36254, "zls", Latn, ancestors = {"sh"}}

m["svs"] = {"Savosavo", 3130296, "paa", Latn}

m["svx"] = {"Skalvian", 3486125, "bat", Latn}

m["swb"] = {"Maore Comorian", 34075, "bnt-com", Latn, sort_key = {from = {"ɓ", "ɗ"}, to = {"bz", "dz"}}}

m["swf"] = {"Sere", 7453056, "nic-ser", Latn}

m["swg"] = {"Swabian", 327274, "gmw", Latn, ancestors = {"gsw"}}

m["swi"] = {
    "Sui", 3112388, "qfa-kms", {"Latn", "Hani"} -- Shui is not available yet.
}

m["swj"] = {"Sira", 36599, "bnt-sir", Latn}

m["swl"] = {"Swedish Sign Language", 36558, "sgn"}

m["swm"] = {"Samosa", 7410037, "ngf-mad", Latn}

m["swn"] = {"Sokna", 2988323, "ber"}

m["swo"] = {"Shanenawa", nil, "sai-pan", Latn}

m["swp"] = {"Suau", 3502368, "poz-ocw"}

m["swq"] = {"Sharwa", 56791, "cdc-cbm", Latn}

m["swr"] = {"Saweru", 3474649}

m["sws"] = {"Seluwasan", 7448845, "poz-cet"}

m["swt"] = {"Sawila", 7428639}

m["swu"] = {"Suwawa", 7650588, "phi"}

m["sww"] = {"Sowa", 7571843, "poz-vnc"}

m["swx"] = {"Suruahá", 3114402, "auf"}

m["swy"] = {"Sarua", 56261, "cdc-est", Latn}

m["sxb"] = {"Suba", 33916, "bnt-lok", Latn}

m["sxc"] = {"Sicanian", 36335}

m["sxe"] = {"Sighu", 36431, "bnt-kel", Latn}

m["sxg"] = {"Shixing", 56337, "sit-nax"}

m["sxk"] = {"Southern Kalapuya", 3192122, "nai-klp"}

m["sxl"] = {"Selonian", 36491, "bat", Latn}

m["sxm"] = {"Samre", 6583615, "mkh-pea"}

m["sxn"] = {"Sangir", 25714758, "phi", Latn}

m["sxo"] = {"Sorothaptic", 2762254}

m["sxr"] = {"Saaroa", 716599, "map", Latn}

m["sxs"] = {"Sasaru", 3913384, "alv-yek", Latn}

-- "sxu" "Upper Saxon" IS SUBSUMED INTO "gmw-ecg" "East Central German"

m["sxw"] = {"Saxwe Gbe", 7428892, "alv-pph"}

m["sya"] = {"Siang", 3482903}

m["syb"] = {"Central Subanen", 12953893, "phi", Latn}

m["syc"] = {"Classical Syriac", 33538, "sem-are", {"Syrc"}, entry_name = {from = {"[" .. u(0x0304) .. u(0x0308) .. u(0x0331) .. u(0x0730) .. "-" .. u(0x0748) .. "]"}, to = {}}}

m["syi"] = {"Seki", 36547, "bnt-kel", Latn}

m["syk"] = {"Sukur", 56292, "cdc-cbm", Latn}

m["syl"] = {"Sylheti", 2044560, "inc-eas", {"Sylo", "Beng"}, ancestors = {"inc-obn"}, translit_module = "syl-translit"}

m["sym"] = {"Maya Samo", 10950421, "dmn-sam", Latn}

m["syn"] = {"Senaya", 33914, "sem-nna"}

m["syo"] = {"Suoy", 7641864, "mkh-pea"}

m["sys"] = {"Sinyar", 56840, "csu", Latn}

m["syw"] = {"Kagate", 12952538, "sit-kyk", {"Deva"}}

m["syx"] = {"Osamayi", 7408415, "bnt-kel", {"Latn"}}

m["syy"] = {"Al-Sayyid Bedouin Sign Language", 2915457, "sgn"}

m["sza"] = {"Semelai", 3111827, "mkh-asl"}

m["szb"] = {"Ngalum", 11732516, "ngf-okk", Latn}

m["szc"] = {"Semaq Beri", 7449119, "mkh-asl"}

m["szd"] = {"Seru", 7455488, "poz-bnn", Latn}

m["sze"] = {"Seze", 373683, "omv-mao", Latn}

m["szg"] = {"Sengele", 7450555, "bnt-mon", Latn}

m["szl"] = {"Silesian", 30319, "zlw-lch", Latn}

m["szn"] = {"Sula", 3503403, "poz-cma", Latn}

m["szp"] = {"Suabo", 7630429, "ngf-sbh", Latn}

m["szv"] = {"Isubu", 35431, "bnt-saw", Latn}

m["szw"] = {"Sawai", 3447258, "poz-hce", Latn}

m["szy"] = {"Sakizaya", 718269, "map", Latn}

return m
