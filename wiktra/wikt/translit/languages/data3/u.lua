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

m["uam"] = {"Uamué", 3441418}

m["uan"] = {"Kuan", 6441085}

m["uar"] = {"Tairuma", 7676386, "ngf"}

m["uba"] = {"Ubang", 3914467, "nic-ben", Latn}

m["ubi"] = {"Ubi", 56264}

m["ubl"] = {"Buhi'non Bikol", 18664494, "phi"}

m["ubr"] = {"Ubir", 3547642, "poz-ocw", Latn}

m["ubu"] = {"Umbu-Ungu", 12953245, "ngf"}

m["uby"] = {"Ubykh", 36931, "cau-nwc", {"Latn", "Cyrl"}}

m["uda"] = {"Uda", 11011951, "nic-lcr"}

m["ude"] = {"Udihe", 13235, "tuw", {"Cyrl"}}

m["udg"] = {"Muduga", 16886762, "dra"}

m["udi"] = {"Udi", 36867, "cau-nec", {"Cyrl", "Latn", "Armn", "Geor"}, ancestors = {"xag"}, translit_module = "translit-redirect", override_translit = true}

m["udj"] = {"Ujir", 14916906, "poz-cet"}

m["udl"] = {"Uldeme", 3515078, "cdc-cbm"}

m["udm"] = {"Udmurt", 13238, "urj-prm", {"Cyrl"}, translit_module = "udm-translit", override_translit = true}

m["udu"] = {"Uduk", 3182573, "ssa-kom"}

m["ues"] = {"Kioko", 18343036}

m["ufi"] = {"Ufim", 7877531, "ngf-fin", Latn}

m["uga"] = {"Ugaritic", 36928, "sem-nwe", {"Ugar"}, translit_module = "uga-translit"}

m["ugb"] = {"Kuku-Ugbanh", 10549854}

m["uge"] = {"Ughele", 966303, "poz-ocw"}

m["ugn"] = {"Ugandan Sign Language", 7877677, "sgn"}

m["ugo"] = {"Gong", 3448919, "tbq-lob", {"Thai"}, sort_key = {from = {"[%pๆ]", "[็-๎]", "([เแโใไ])([ก-ฮ])"}, to = {"", "", "%2%1"}}}

m["ugy"] = {"Uruguayan Sign Language", 7901470, "sgn"}

m["uha"] = {"Uhami", 3913328, "alv-nwd", Latn}

m["uhn"] = {"Damal", 4748974}

m["uis"] = {"Uisai", 7878123, "paa-sbo"}

m["uiv"] = {"Iyive", 11128658, "nic-tvc", Latn}

m["uji"] = {"Tanjijili", 3914939, "nic-pls"}

m["uka"] = {"Kaburi", 6344482}

m["ukg"] = {"Ukuriguma", 7878623, "ngf-mad"}

m["ukh"] = {"Ukhwejo", 36623, "bnt-bek"}

m["ukk"] = {"Muak Sa-aak", nil, "mkh-pal"}

m["ukl"] = {"Ukrainian Sign Language", 10322106, "sgn"}

m["ukp"] = {"Ukpe-Bayobiri", 3914470, "nic-ben", Latn}

m["ukq"] = {"Ukwa", 7878635, "nic-ief"}

m["uks"] = {"Kaapor Sign Language", 3322101, "sgn"}

m["uku"] = {"Ukue", 3913387, "alv-nwd", Latn}

m["ukw"] = {"Ukwuani-Aboh-Ndoni", 36636, "alv", Latn}

m["uky"] = {"Kuuk Yak", 6448719, "aus-psw", Latn}

m["ula"] = {"Fungwa", 5509187, "nic-shi"}

m["ulb"] = {"Ulukwumi", 36722, "alv-yor"}

m["ulc"] = {"Ulch", 13239, "tuw", {"Cyrl", "Latn"}}

m["ule"] = {"Lule", 12635889, nil, Latn}

m["ulf"] = {"Afra", 4477735, "paa-pau"}

m["uli"] = {"Ulithian", 36842, "poz-mic"}

m["ulk"] = {"Meriam", 788174, "ngf", Latn}

m["ull"] = {"Ullatan", 8761579, "dra"}

m["ulm"] = {"Ulumanda'", 3501892}

m["uln"] = {"Unserdeutsch", 13244, "crp", Latn, ancestors = {"de"}}

m["ulu"] = {"Uma' Lung", 3548186, "poz-swa"}

m["ulw"] = {"Ulwa", 2405552}

m["uma"] = {"Umatilla", 12953952, "nai-shp", Latn, ancestors = {"nai-spt"}}

m["umb"] = {"Umbundu", 36983, "bnt", Latn}

m["umc"] = {"Marrucinian", 36110, "itc", {"Latn", "Ital"}}

m["umd"] = {"Umbindhamu", 7881346, "aus-pmn"}

m["umg"] = {"Umbuygamu", 3915677, "aus-pmn"}

m["umi"] = {"Ukit", 7878321}

m["umm"] = {"Umon", 3915448, "nic-ucn", Latn}

m["umn"] = {"Makyan Naga", 6740516, "sit-kch"}

m["umo"] = {"Umotína", 7881740, "sai-mje"}

m["ump"] = {"Umpila", 12953954, "aus-pmn", Latn}

m["umr"] = {"Umbugarla", 2980392}

m["ums"] = {"Pendau", 7162371, "poz-tot"}

m["umu"] = {"Munsee", 56547, "del", Latn, entry_name = {from = {"Á", "Ă", "É", "Í", "Ó", "Ú", "Ŭ", "á", "á", "ă", "é", "í", "ó", "ú", "ŭ"}, to = {"A", "A", "E", "I", "O", "U", "U", "a", "á", "a", "e", "i", "o", "u", "u"}}}

m["una"] = {"North Watut", 15887898, "poz-ocw", Latn}

m["und"] = {"Undetermined", nil, "qfa-not", {"Zyyy"}}

m["une"] = {"Uneme", 3913357, "alv-yek", Latn}

m["ung"] = {"Ngarinyin", 1284885, "aus-wor", Latn}

m["unk"] = {"Enawené-Nawé", 3307184, "awd", Latn}

m["unm"] = {
    "Unami", 3549180, "del", Latn
    -- Don't strip diacritics from entry names, per [[WT:Grease pit/2020/May]].
    -- entry_name = {
    --	from = {"À", "Ä", "È", "Ë", "Ì", "Ò", "Ù", "à", "ä", "è", "ë", "ì", "ò", "ù"},
    --	to   = {"A", "A", "E", "E", "I", "O", "U", "a", "a", "e", "e", "i", "o", "u"}} ,
}

m["unn"] = {"Kurnai", nil, "aus-pam", Latn}

m["unr"] = {
    "Mundari",
    3327828,
    "mun",
    {"Deva"},
    translit_module = "hi-translit" -- for now
}

m["unu"] = {"Unubahe", 7897776}

m["unx"] = {"Munda", 36264959, "mun", Latn}

m["unz"] = {"Unde Kaili", 12953596, "poz-kal", Latn}

m["uok"] = {"Uokha", 3441216, "alv-edo", Latn}

m["upi"] = {"Umeda", 7881465, "paa-brd"}

m["upv"] = {"Uripiv-Wala-Rano-Atchin", 13249, "poz-vnc", Latn}

m["ura"] = {"Urarina", 1579560}

m["urb"] = {"Urubú-Kaapor", 13893353, "tup-gua", Latn}

m["urc"] = {"Urningangg", 10710522}

m["ure"] = {"Uru", 2992892}

m["urf"] = {"Uradhi", 3915680, "aus-pam", Latn}

m["urg"] = {"Urigina", 7900603, "ngf", Latn}

m["urh"] = {"Urhobo", 36663, "alv-swd", Latn}

m["uri"] = {"Urim", 7900609, "qfa-tor", Latn}

m["urk"] = {"Urak Lawoi'", 7899573, "poz-mly", {"Thai"}, sort_key = {from = {"[%pๆ]", "[็-๎]", "([เแโใไ])([ก-ฮ])"}, to = {"", "", "%2%1"}}}

m["url"] = {"Urali", 7899602, "dra", {"Knda"}}

m["urm"] = {"Urapmin", 7899769, "ngf-okk"}

m["urn"] = {"Uruangnirin", 7901389, "poz-cet", Latn}

m["uro"] = {"Ura (New Guinea)", 3121049, "paa-bng", Latn}

m["urp"] = {"Uru-Pa-In", 7901376, "tup-gua", Latn}

m["urr"] = {"Lehalurup", 3272124}

m["urt"] = {"Urat", 3502084, "qfa-tor", Latn}

m["uru"] = {"Urumi", 7901530, "tup", Latn}

m["urv"] = {"Uruava", 36875, "poz-ocw", Latn}

m["urw"] = {"Sop", 7562808, "ngf-mad", Latn}

m["urx"] = {"Urimo", 7900611, "qfa-tor", Latn}

m["ury"] = {"Orya", 7105295, "paa-tkw", Latn}

m["urz"] = {"Uru-Eu-Wau-Wau", 10266012, "tup-gua", Latn}

m["usa"] = {"Usarufa", 7901714, "paa-kag", Latn}

m["ush"] = {"Ushojo", 3540446}

m["usi"] = {"Usui", 12644231}

m["usk"] = {"Usaghade", 3914048, "nic-lcr", Latn}

m["usp"] = {"Uspanteco", 36728, "myn", Latn}

m["uss"] = {"Saare", nil, "nic-knn", Latn}

m["usu"] = {"Uya", 7904082}

m["uta"] = {"Otank", 3913990, "nic-tvc", Latn}

m["ute"] = {"Ute", 13260, "azc-num", Latn}

m["uth"] = {"Hun", nil, "nic-knn", Latn}

m["utp"] = {"Aba", 2841465, "poz-oce", Latn}

m["utr"] = {"Etulo", 35262, "alv-ido", Latn}

m["utu"] = {"Utu", 7903469, "ngf-mad"}

m["uum"] = {"Urum", 13257, "trk-kcu", {"Cyrl"}}

m["uun"] = {"Kulon-Pazeh", 36435, "map", Latn}

m["uur"] = {"Ura (Vanuatu)", 7899531, "poz-oce", Latn}

m["uuu"] = {"U", 953082, "mkh-pal"}

m["uve"] = {"West Uvean", 36837, "poz-pnp", Latn}

m["uvh"] = {"Uri", 7900540, "ngf-fin", Latn}

m["uvl"] = {"Lote", 3259972, "poz-ocw", Latn}

m["uwa"] = {"Kuku-Uwanh", 3915687, "aus-pmn"}

m["uya"] = {"Doko-Uyanga", 7904095, "nic-ucr", Latn}

return m
