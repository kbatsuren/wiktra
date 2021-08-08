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

m["jaa"] = {"Jamamadí", 3053275, "auf", Latn}

m["jab"] = {"Hyam", 35403, "nic-plc", Latn}

m["jac"] = {"Jakaltek", 33393, "myn", Latn}

m["jad"] = {"Jahanka", 3913992, "dmn-wmn", Latn}

m["jae"] = {"Jabem", 3571232, "poz-ocw", Latn}

m["jaf"] = {"Jara", 56289, "cdc", Latn}

m["jah"] = {"Jah Hut", 2742661, "mkh-asl"}

m["jaj"] = {"Zazao", 3574969, "poz-ocw", Latn}

-- "jak" IS TREATED AS "ms", SEE WT:LT

m["jal"] = {"Yalahatan", 8047298, "poz-cma", Latn}

m["jam"] = {"Jamaican Creole", 35939, "crp", Latn, ancestors = {"en"}}

m["jan"] = {"Janday", 6150919, "aus-pam", Latn}

m["jao"] = {"Yanyuwa", 34241, "aus-pam", Latn}

m["jaq"] = {"Yaqay", 8049134, "ngf", Latn}

m["jas"] = {"New Caledonian Javanese", 12953527, "poz-sus", Latn, ancestors = {"jv"}}

m["jat"] = {"Jakati", 4159744, "inc-pan", ancestors = {"lah"}}

m["jau"] = {"Yaur", 8050346, "poz-hce", Latn}

m["jax"] = {"Jambi Malay", 3915769, "poz-mly", Latn}

m["jay"] = {"Yan-nhangu", 10723405, "aus-yol", Latn}

m["jaz"] = {"Jawe", 3163200, "poz-cln", Latn}

m["jbe"] = {"Judeo-Berber", 35854, "ber", {"Hebr"}}

m["jbj"] = {"Arandai", 4784070, "ngf", Latn}

m["jbk"] = {"Barikewa", nil, "ngf", Latn}

m["jbn"] = {"Nefusa", 36151, "ber"}

m["jbo"] = {"Lojban", 36350, "art", Latn, type = "appendix-constructed"}

m["jbr"] = {"Jofotek-Bromnya", 16886849, "paa-tkw"}

m["jbt"] = {"Jabutí", 2060023, "sai-mje", Latn}

m["jbu"] = {"Jukun Takum", 35447, "nic-jkn", Latn}

m["jbw"] = {"Yawijibaya", 31722921, "aus-wor", Latn}

m["jcs"] = {
    "Jamaican Country Sign Language", 6127418, "sgn", Latn -- when documented
}

m["jct"] = {"Krymchak", 33723, "trk-kcu", {"Latn", "Cyrl"}}

m["jda"] = {"Jad", 12633440, "sit-las"}

m["jdg"] = {"Jadgali", 13560607, "inc-snd", ancestors = {"inc-vra"}}

m["jdt"] = {"Judeo-Tat", 56495, "ira-swi", {"Latn", "Cyrl", "Hebr"}, ancestors = {"fa"}, translit_module = "jdt-translit"}

m["jeb"] = {"Jebero", 967031, "sai-cah"}

m["jee"] = {"Jerung", 56372, "sit-kiw"}

m["jeg"] = {"Jeng", 5091274, "mkh-ban", Latn}

m["jeh"] = {"Jeh", 3914636, "mkh-ban", Latn}

m["jei"] = {"Yei", 8051326}

m["jek"] = {"Jeri Kuo", 11031936, "dmn-jje", Latn}

m["jel"] = {"Yelmek", 8052020}

m["jen"] = {"Dza", 35558, "alv-bwj"}

m["jer"] = {"Jere", 3915449, "nic-jer"}

m["jet"] = {"Manem", 6748412, "paa-brd"}

m["jeu"] = {"Jonkor Bourmataguil", 56269}

m["jgb"] = {"Ngbee", 7022243}

-- "jge" IS TREATED AS "ka", SEE WT:LT

m["jgk"] = {"Gwak", 17523694, "nic-jrw"}

m["jgo"] = {"Ngomba", 36287, "bai", Latn}

m["jhi"] = {"Jehai", 3176748, "mkh-asl"}

m["jhs"] = {"Jhankot Sign Language", 6190889, "sgn"}

m["jia"] = {"Jina", 56297}

m["jib"] = {"Jibu", 3914448, "nic-jkn", Latn}

m["jic"] = {"Tol", 3178609, "hok", Latn}

m["jid"] = {"Bu", 3913321, "nic-nin", Latn}

m["jie"] = {"Jilbe", 56281}

m["jig"] = {"Jingulu", 6202435, "aus-mir"}

m["jih"] = {"Shangzhai", 25559440, "sit-rgy"}

m["jii"] = {"Jiiddu", 56769, "cus"}

m["jil"] = {"Jilim", 6192674, "ngf-mad"}

m["jim"] = {"Jimjimen", 56288, "cdc-cbm", Latn}

m["jio"] = {"Jiamao", 3178570, nil, Latn}

m["jiq"] = {"Guanyinqiao", 3118757, "sit-rgy"}

m["jit"] = {"Jita", 6203228, "bnt-haj", Latn}

m["jiu"] = {"Youle Jinuo", 12952530, "tbq-lol"}

m["jiv"] = {"Shuar", 617291, "sai-jiv", Latn}

m["jiy"] = {"Buyuan Jinuo", 12952528, "tbq-lol"}

m["jje"] = {
    "Jeju", 129648, "qfa-kor", {"Kore"}
    -- translit_module = "ko-translit",
}

m["jjr"] = {"Zhár", 17523697, "nic-jrw"}

m["jka"] = {"Kaera", 16910923, "ngf", Latn}

m["jko"] = {"Kubo", 12952670, "ngf"}

m["jkr"] = {"Koro (India)", 36162, "sit-gsi"}

m["jku"] = {"Labir", 1990210, "nic-jrn"}

m["jle"] = {"Ngile", 36329, "alv-tal"}

m["jls"] = {
    "Jamaican Sign Language", 6127433, "sgn", Latn -- when documented
}

m["jma"] = {"Dima", 5277140}

m["jmb"] = {"Zumbun", 56252, "cdc-wst"}

m["jmc"] = {"Machame", 12952751, "bnt-chg", Latn}

m["jmd"] = {"Yamdena", 8048030, "poz-cet", Latn}

m["jmi"] = {"Jimi", 3502308, "cdc-wst", Latn}

m["jml"] = {"Jumli", 6310993, "inc-pah"}

m["jmn"] = {"Makuri Naga", 6740482, "sit-aao"}

m["jmr"] = {"Kamara", 35561, "nic-dag"}

-- "jms" IS TREATED AS "mff", SEE WT:LT

m["jmw"] = {"Mouwase", nil, "ngf", Latn}

m["jmx"] = {"Western Juxtlahuaca Mixtec", 12953731, "omq-mxt", Latn}

m["jna"] = {"Jangshung", 12633505, "sit-kin"}

m["jnd"] = {"Jandavra", 6150941}

m["jng"] = {"Yangman", 10723416, "aus-yng"}

m["jni"] = {"Janji", 3915330, "nic-jer"}

m["jnj"] = {"Yemsa", 36873, "omv"}

m["jnl"] = {"Rawat", 7296948, "sit-gma"}

m["jns"] = {"Jaunsari", 6164857, "him"}

m["job"] = {"Joba", 13123409, "bnt-shh"}

m["jod"] = {"Wojenaka", 11029540, "dmn-mnk"}

m["jor"] = {"Jorá", 5393974, "tup-gua", Latn}

m["jos"] = {"Jordanian Sign Language", 6534917, "sgn", {"Sgnw"}}

m["jow"] = {"Jowulu", 3914487, "dmn-mnw", Latn}

-- "jpa" IS NOT USED, SEE WT:LT

m["jpr"] = {"Judeo-Persian", 33367, "ira-swi", {"Hebr"}, ancestors = {"fa"}}

m["jqr"] = {"Jaqaru", 33443, "sai-aym", Latn}

m["jra"] = {"Jarai", 33370, "cmc", Latn}

m["jrb"] = {"Judeo-Arabic", 37733, "sem-arb", {"Hebr"}}

m["jrr"] = {"Jiru", 6203123, "nic-jkn"}

m["jru"] = {"Japrería", 3441409, "sai-car", Latn}

m["jsl"] = {"Japanese Sign Language", 35601, "sgn-jsl"}

m["jua"] = {"Júma", 12953587, "tup-gua", Latn}

m["jub"] = {"Wannu", 3914905, "nic-jkn"}

m["juc"] = {"Jurchen", 56731, "tuw", {"Latn"}}

m["jud"] = {"Worodougou", 11155821, "dmn-mnk"}

m["juh"] = {"Hone", 5964576, "nic-jkn", Latn}

m["jui"] = {"Ngadjuri", 16897028, "aus-pam", Latn}

m["juk"] = {"Wapan", 3914914, "nic-jkn"}

m["jul"] = {"Jirel", 56863, "sit-tib"}

m["jum"] = {"Jumjum", 11283696, "sdv"}

m["jun"] = {"Juang", 33362, "mun", {"Orya"}}

m["juo"] = {"Jiba", 6191995, "nic-jkn"}

m["jup"] = {"Hupdë", 3143384, "sai-nad", Latn}

m["jur"] = {"Jurúna", 4023175, "tup", Latn}

m["jus"] = {"Jumla Sign Language", 6310991, "sgn"}

m["jut"] = {"Jutish", 1340322, "gmq", Latn, ancestors = {"da"}}

m["juu"] = {"Ju", 3914897}

m["juw"] = {"Wãpha", 3914934, "nic-jkn", Latn}

m["juy"] = {"Juray", 6314963, "mun"}

m["jvd"] = {"Javindo", 2719893}

m["jvn"] = {"Caribbean Javanese", 11732256, "poz-sus", Latn, ancestors = {"jv"}}

m["jwi"] = {"Jwira-Pepesa", 35467, "alv-ctn", Latn}

-- "jya" IS TREATED AS "sit-sit", "sit-jap", "sit-tsh", "sit-zbu", SEE WT:LT

m["jye"] = {"Judeo-Yemeni Arabic", 56596, "sem-arb", {"Hebr"}, ancestors = {"jrb"}}

m["jyy"] = {"Jaya", 641720, "csu-bgr", Latn}

return m
