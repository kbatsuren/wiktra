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

m["zaa"] = {"Sierra de Juárez Zapotec", 12953989, "omq-zap", Latn}

m["zab"] = {"San Juan Guelavía Zapotec", 5614751, "omq-zpc", Latn}

m["zac"] = {"Ocotlán Zapotec", 7076643, "omq-zap", Latn}

m["zad"] = {"Cajonos Zapotec", 5017997, "omq-zpc", Latn}

m["zae"] = {"Yareni Zapotec", 12645368, "omq-zap", Latn}

m["zaf"] = {"Ayoquesco Zapotec", 4831570, "omq-zpc", Latn}

m["zag"] = {
    "Zaghawa", 37007, "ssa-sah", Latn -- also Beria
}

m["zah"] = {"Zangwal", 3441387, "cdc-wst", Latn}

m["zai"] = {"Isthmus Zapotec", 56728, "omq-zpc", Latn}

m["zaj"] = {"Zaramo", 8066599, "bnt-ruv", Latn}

m["zak"] = {"Zanaki", 8066018, "bnt-lok", Latn}

m["zal"] = {"Zauzou", 3616358, "tbq-lol", {"Latn", "Hani"}}

m["zam"] = {"Central Mahuatlán Zapoteco", 13541830, "omq-zap", Latn}

m["zao"] = {"Ozolotepec Zapotec", 7116610, "omq-zap", Latn}

m["zap"] = {"Zapotec", 13214, "omq-zap", Latn}

m["zaq"] = {"Aloápam Zapotec", 4734726, "omq-zap", Latn}

m["zar"] = {"Rincón Zapotec", 7334628, "omq-zap", Latn}

m["zas"] = {"Santo Domingo Albarradas Zapotec", 4709425, "omq-zap", Latn}

m["zat"] = {"Tabaa Zapotec", 7672849, "omq-zap", Latn}

m["zau"] = {"Zangskari", 771203, "sit-lab", {"Tibt"}, ancestors = {"lbj"}}

m["zav"] = {"Yatzachi Zapotec", 8050301, "omq-zpc", Latn}

m["zaw"] = {"Mitla Zapotec", 3053288, "omq-zpc", Latn}

m["zax"] = {"Xadani Zapotec", 8042823, "omq-zap", Latn}

m["zay"] = {"Zayse-Zergulla", 673895, "omv-eom", Latn}

m["zaz"] = {"Zari", 3914398, "cdc-wst", Latn}

m["zbt"] = {"Batui", 16839143, "poz-slb", Latn}

m["zca"] = {"Coatecas Altas Zapotec", 5138603, "omq-zap", Latn}

m["zdj"] = {"Ngazidja Comorian", 3114653, "bnt-com", Latn, sort_key = {from = {"ɓ", "ɗ"}, to = {"bz", "dz"}}}

m["zea"] = {"Zealandic", 237409, "gmw", Latn, ancestors = {"dum"}, sort_key = {from = {"^'([aeiouy].*)$"}, to = {"%1'"}}}

m["zeg"] = {"Zenag", 12953345, "poz-ocw", Latn}

m["zen"] = {"Zenaga", 37005, "ber", Latn}

m["zga"] = {"Kinga", 11005332, "bnt-bki", Latn}

m["zgh"] = {"Moroccan Amazigh", 7598268, "ber", {"Tfng"}, translit_module = "Tfng-translit"}

m["zgr"] = {"Magori", 3277370, "poz-ocw", Latn}

m["zhb"] = {"Zhaba", 56334, "sit-qia"}

m["zhi"] = {"Zhire", 3914910, "nic-plc", Latn}

m["zhn"] = {"Nong Zhuang", 7049385, "tai-cen", {"Latn"}, sort_key = {from = {"%p"}, to = {""}}}

m["zhw"] = {"Zhoa", 8070885, "nic-rnw", Latn}

m["zia"] = {"Zia", 3038636, "ngf", Latn}

m["zib"] = {"Zimbabwe Sign Language", 8072097, "sgn"}

m["zik"] = {"Zimakani", 56740, "ngf", Latn}

m["zil"] = {"Zialo", 36991, "dmn-msw", Latn}

m["zim"] = {"Mesme", 56282, "cdc-mas", Latn}

m["zin"] = {"Zinza", 8072460, "bnt-haj", Latn}

m["zir"] = {"Ziriya", 3913943, "nic-jer", Latn}

m["ziw"] = {"Zigula", 37010, "bnt-seu", Latn}

m["ziz"] = {"Zizilivakan", 56300, "cdc-cbm", Latn}

m["zka"] = {"Kaimbulawa", 6348011, "poz-mun", Latn}

m["zkb"] = {"Koibal", 949259, "syd", {"Latn", "Cyrl"}}

m["zkg"] = {"Goguryeo", 706327, "qfa-kor", {"Hani"}}

m["zkh"] = {"Khorezmian Turkic", 25502, "trk", {"Arab"}}

m["zkk"] = {"Karankawa", 3192947, nil, Latn}

m["zko"] = {"Kott", 34163, "qfa-yen", Latn}

m["zkp"] = {"São Paulo Kaingáng", 7665661, "sai-jee", Latn}

m["zkr"] = {"Zakhring", 56996, "sit-mdz", {"Latn", "Hani"}}

m["zkt"] = {"Khitan", 1064482, "xgn", {"Kitl", "Kits"}}

m["zku"] = {"Kaurna", 6378899, "aus-psw", Latn}

m["zkv"] = {"Krevinian", 6436902, "fiu-fin", Latn, ancestors = {"vot"}}

m["zkz"] = {"Khazar", 1067986, "trk", {"Orkh"}}

m["zma"] = {"Manda (Australia)", 18650060, "aus-dal", Latn}

m["zmb"] = {"Zimba", 8071960, "bnt-lgb", Latn}

m["zmc"] = {"Margany", 10577017, "aus-pam", Latn}

m["zmd"] = {"Maridan", 10577273, "aus-dal", Latn}

m["zme"] = {"Mangerr", 10576387, nil, Latn}

m["zmf"] = {"Mfinu", 35915, "bnt-tek", Latn}

m["zmg"] = {"Marti Ke", 10577823, "aus-dal", Latn}

m["zmh"] = {"Makolkol", 12636052, "paa-bng", Latn}

m["zmi"] = {"Negeri Sembilan Malay", 3915909, "poz-mly", Latn}

m["zmj"] = {"Maridjabin", 10577274, "aus-dal", Latn}

m["zmk"] = {"Mandandanyi", 10576338, "aus-pam", Latn}

m["zml"] = {"Madngele", 10575155, "aus-dal", Latn}

m["zmm"] = {"Marimanindji", 10577424, "aus-dal", Latn}

m["zmn"] = {"Mbangwe", 35928, "bnt-kel", Latn}

m["zmo"] = {"Molo", 15974357, "sdv-eje", Latn}

m["zmp"] = {"Mbuun", 106249400, "bnt", Latn}

m["zmq"] = {"Mituku", 6883590, "bnt-mbe", Latn}

m["zmr"] = {"Maranungku", 6772792, "aus-dal", Latn}

m["zms"] = {"Mbesa", 6799676, "bnt-ske", Latn}

m["zmt"] = {"Maringarr", 10577443, "aus-dal", Latn}

m["zmu"] = {"Muruwari", 3915442, "aus-pam", Latn}

m["zmv"] = {"Mbariman-Gudhinma", 3915672, "aus-pmn", Latn}

m["zmw"] = {"Mbo (Congo)", 6799710, "bnt-nya", Latn}

m["zmx"] = {"Bomitaba", 35063, "bnt-ngn", Latn}

m["zmy"] = {"Mariyedi", 10577501, "aus-dal", Latn}

m["zmz"] = {"Mbandja", 3915310, "bad", Latn}

m["zna"] = {"Zan Gula", 863726, "alv-bua", Latn}

m["zne"] = {"Zande", 35015, "znd", Latn}

m["zng"] = {"Mang", 720192, "mkh-mng"}

m["znk"] = {"Manangkari", 6746906, "aus-wdj", Latn}

m["zns"] = {"Mangas", 3438780, "cdc-wst", Latn}

m["zoc"] = {"Copainalá Zoque", 12954017, "nai-miz", Latn}

m["zoh"] = {"Chimalapa Zoque", 5099289, "nai-miz", Latn}

m["zom"] = {"Zou", 37011, "tbq-kuk"}

m["zoo"] = {"Asunción Mixtepec Zapotec", 4811888, "omq-zap", Latn}

m["zoq"] = {"Tabasco Zoque", 323325, "nai-miz", Latn}

m["zor"] = {"Rayón Zoque", 12954015, "nai-miz", Latn}

m["zos"] = {"Francisco León Zoque", 12954011, "nai-miz", Latn}

m["zpa"] = {"Lachiguiri Zapotec", 6468403, "omq-zap", Latn}

m["zpb"] = {"Yautepec Zapotec", 7413392, "omq-zap", Latn}

m["zpc"] = {"Choapan Zapotec", 5103425, "omq-zap", Latn}

m["zpd"] = {"Southeastern Ixtlán Zapotec", 8050392, "omq-zap", Latn}

m["zpe"] = {"Petapa Zapotec", 7171675, "omq-zap", Latn}

m["zpf"] = {"San Pedro Quiatoni Zapotec", 7271640, "omq-zpc", Latn}

m["zpg"] = {"Guevea de Humboldt Zapotec", 13459953, "omq-zap", Latn}

m["zph"] = {"Totomachapan Zapotec", 7828390, "omq-zap", Latn}

m["zpi"] = {"Santa María Quiegolani Zapotec", 7271823, "omq-zpc", Latn}

m["zpj"] = {"Quiavicuzas Zapotec", 7271642, "omq-zap", Latn}

m["zpk"] = {"Tlacolulita Zapotec", 7810685, "omq-zpc", Latn}

m["zpl"] = {"Lachixío Zapotec", 6468420, "omq-zap", Latn}

m["zpm"] = {"Mixtepec Zapotec", 7414598, "omq-zpc", Latn}

m["zpn"] = {"Santa Inés Yatzechi Zapotec", 8050300, "omq-zap", Latn}

m["zpo"] = {"Amatlán Zapotec", 4740613, "omq-zpc", Latn}

m["zpp"] = {"El Alto Zapotec", 5350733, "omq-zap", Latn}

m["zpq"] = {"Zoogocho Zapotec", 8074100, "omq-zpc", Latn}

m["zpr"] = {"Santiago Xanica Zapotec", 8042924, "omq-zap", Latn}

m["zps"] = {"Coatlán Zapotec", 7420514, "omq-zap", Latn}

m["zpt"] = {"San Vicente Coatlán Zapotec", 13541831, "omq-zap", Latn}

m["zpu"] = {"Yalálag Zapotec", 8047534, "omq-zpc", Latn}

m["zpv"] = {"Chichicapan Zapotec", 5096050, "omq-zap", Latn}

m["zpw"] = {"Zaniza Zapotec", 8066220, "omq-zpc", Latn}

m["zpx"] = {"San Baltazar Loxicha Zapotec", 7413390, "omq-zap", Latn}

m["zpy"] = {"Mazaltepec Zapotec", 6798223, "omq-zap", Latn}

m["zpz"] = {"Texmelucan Zapotec", 7708357, "omq-zpc", Latn}

m["zra"] = {"Kaya", 5528695, "qfa-kor"}

m["zrg"] = {"Mirgan", 6873206, "inc-eas", ancestors = {"inc-mgd"}}

m["zrn"] = {"Zirenkel", 3441365, "cdc-est", Latn}

m["zro"] = {"Záparo", 10206, "sai-zap", Latn}

m["zrs"] = {"Mairasi", 3038645, "paa-mai", Latn}

m["zsa"] = {"Sarasira", nil, "poz-ocw"}

m["zsk"] = { -- attested?
    "Kaskean", 6374586
}

m["zsl"] = {"Zambian Sign Language", 8065713, "sgn"}

m["zsr"] = {"Southern Rincon Zapotec", 12954000, "omq-zpc", Latn}

m["zsu"] = {"Sukurum", nil, "poz-ocw"}

m["zte"] = {"Elotepec Zapotec", 5367223, "omq-zap", Latn}

m["ztg"] = {"Xanaguía Zapotec", 8042887, "omq-zpc", Latn}

m["ztl"] = {"Lapaguía-Guivini Zapotec", 6488084, "omq-zap", Latn}

m["ztm"] = {"San Agustín Mixtepec Zapotec", 7413220, "omq-zap", Latn}

m["ztn"] = {"Santa Catarina Albarradas Zapotec", 7419277, "omq-zap", Latn}

m["ztp"] = {"Loxicha Zapotec", 6694268, "omq-zap", Latn}

m["ztq"] = {"Quioquitani-Quierí Zapotec", 3574818, "omq-zpc", Latn}

m["zts"] = {"Tilquiapan Zapotec", 7802959, "omq-zpc", Latn}

m["ztt"] = {"Tejalapan Zapotec", 13510225, "omq-zap", Latn}

m["ztu"] = {"San Pablo Güilá Zapotec", 5626813, "omq-zap", Latn}

m["ztx"] = {"Zaachila Zapotec", 8063390, "omq-zap", Latn}

m["zty"] = {"Yatee Zapotec", 3574815, "omq-zpc", Latn}

m["zua"] = {"Zeem", 3450131, "cdc-wst", Latn}

m["zuh"] = {"Tokano", 7813481, "ngf", Latn}

m["zum"] = {"Kumzari", 36158, "ira-swi"}

m["zun"] = {"Zuni", 10188, "qfa-iso", Latn}

m["zuy"] = {"Zumaya", 56626, "cdc-mas", Latn}

m["zwa"] = {"Zay", 10195, "sem-eth"}

m["zyp"] = {"Zyphe", 57004, "tbq-kuk", Latn}

m["zza"] = {"Zazaki", 10199, "ira-zgr", Latn, wikimedia_codes = {"diq"}}

m["zzj"] = {"Zuojiang Zhuang", 13848149, "tai-cen", {"Latn"}, sort_key = {from = {"%p"}, to = {""}}}

return m
