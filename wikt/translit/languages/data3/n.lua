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

local Deva = {"Deva"}
local Latn = {"Latn"}

local m = {}

m["naa"] = {"Namla", 3508760, "paa-pau", scripts = Latn}

m["nab"] = {"Nambikwara", 2068190, "sai-nmk", scripts = Latn}

m["nac"] = {"Narak", 6965295, "ngf", scripts = Latn}

m["nae"] = {"Naka'ela", 6960073, "poz", scripts = Latn}

m["naf"] = {"Nabak", 11732491, "ngf", scripts = Latn}

m["nag"] = {"Naga Pidgin", 3503454, "crp", scripts = Latn, ancestors = {"as"}}

m["nah"] = {"Nahuatl", 13300, "azc-nah", scripts = Latn}

m["naj"] = {"Nalu", 36026, "alv-nal", scripts = Latn}

m["nak"] = {"Nakanai", 6528669, "poz-ocw", scripts = Latn}

m["nal"] = {"Nalik", 3335387, "poz-ocw", scripts = Latn}

m["nam"] = {"Ngan'gityemerri", 3298041, "aus-dal", scripts = Latn}

m["nan"] = {"Min Nan", 36495, "zhx-min-hai", scripts = {"Hani", "Latn"}, wikimedia_codes = {"zh-min-nan"}}

m["nao"] = {"Naaba", 11883865, "sit", ancestors = {"xct"}}

m["nap"] = {"Neapolitan", 33845, "roa-itd", scripts = Latn}

m["naq"] = {"Khoekhoe", 13301, "khi-khk", scripts = Latn}

m["nar"] = {"Iguta", 5621686, "nic-jer", scripts = Latn}

m["nas"] = {"Nasioi", 56772, "paa-sbo", scripts = Latn}

m["nat"] = {"Hungworo", 3914395, "nic-kmk", scripts = Latn}

m["naw"] = {"Nawuri", 35906, "alv-gng", scripts = Latn}

m["nax"] = {"Nakwi", 3504178, "qfa-mal", scripts = Latn}

m["nay"] = {"Ngarrindjeri", 7022091, "aus-pam", scripts = Latn}

m["naz"] = {"Coatepec Nahuatl", 5138605, "azc-nah", scripts = Latn}

m["nba"] = {"Nyemba", 3346655, "bnt-clu", ancestors = {"lch"}, scripts = Latn}

m["nbb"] = {"Ndoe", 36134, "nic-eko", scripts = Latn}

m["nbc"] = {"Chang", 5071694, "sit-kch", scripts = Latn}

m["nbd"] = {"Ngbinda", 11132859, "bnt-boa", scripts = Latn}

m["nbe"] = {"Konyak Naga", 6430448, "sit-kch", scripts = Latn}

m["nbg"] = {"Nagarchal", 13299, "dra", ancestors = {"gon"}}

m["nbh"] = {"Ngamo", 3438705, "cdc-wst", scripts = Latn}

m["nbi"] = {"Mao Naga", 12952905, "tbq-anp", scripts = Latn}

m["nbj"] = {"Ngarinman", 10600380, scripts = Latn}

m["nbk"] = {"Nake", 11732496, "ngf-mad", scripts = Latn}

m["nbm"] = {"Ngbaka Ma'bo", 3915331, "nic-nkm", scripts = Latn}

m["nbn"] = {"Kuri", 3200540, "poz", scripts = Latn}

m["nbo"] = {"Nkukoli", 3914482, "nic-uce", scripts = Latn}

m["nbp"] = {"Nnam", 36138, "nic-eko", scripts = Latn}

m["nbq"] = {"Nggem", 12952956, "ngf", scripts = Latn}

m["nbr"] = {"Numana", 5529310, "nic-nin", scripts = Latn}

m["nbs"] = {
    "Namibian Sign Language",
    6961792,
    "sgn",
    scripts = Latn -- when documented
}

m["nbt"] = {"Na", 12952895, "sit-tan", scripts = {"Deva", "Latn"}}

m["nbu"] = {"Rongmei Naga", 12952912, "sit-zem", scripts = Latn}

m["nbv"] = {"Ngamambo", 11129694, "nic-mom", scripts = Latn}

m["nbw"] = {"Southern Ngbandi", 17522635, "nic-ngd", scripts = Latn}

m["nby"] = {"Ningera", 11732524, "paa-brd", scripts = Latn}

m["nca"] = {"Iyo", 6101336, "ngf-fin", scripts = Latn}

m["ncb"] = {"Central Nicobarese", 3335553, "aav-nic", scripts = {"Deva", "Latn"}}

m["ncc"] = {"Ponam", 3396122, "poz-aay", scripts = Latn}

m["ncd"] = {"Nachering", 6957144, "sit-kic", scripts = Deva}

m["nce"] = {
    "Yale",
    2992915,
    "paa", -- kwomtari or isolate
    scripts = Latn
}

m["ncf"] = {"Notsi", 3344784, "poz-ocw", scripts = Latn}

m["ncg"] = {"Nisga'a", 3342138, "nai-tsi", scripts = Latn}

m["nch"] = {"Central Huasteca Nahuatl", 2194290, "azc-nah", scripts = Latn}

m["nci"] = {"Classical Nahuatl", 559242, "azc-nah", scripts = Latn, entry_name = {from = {"Ā", "ā", "Ē", "ē", "Ī", "ī", "Ō", "ō", "Ū", "ū", "Ȳ", "ȳ"}, to = {"A", "a", "E", "e", "I", "i", "O", "o", "U", "u", "Y", "y"}}}

m["ncj"] = {"Northern Puebla Nahuatl", 15705671, "azc-nah", scripts = Latn}

m["nck"] = {"Nakara", 6960662, "aus-arn", scripts = Latn}

m["ncl"] = {"Michoacán Nahuatl", 2896217, "azc-nah", scripts = Latn}

m["ncm"] = {"Nambo", 42173731, scripts = Latn}

m["ncn"] = {"Nauna", 3337158, "poz-aay", scripts = Latn}

m["nco"] = {"Sibe", 56806, "paa-sbo", scripts = Latn}

m["ncr"] = {"Ncane", 11297920, "nic-bbe", ancestors = {"nhu"}, scripts = Latn}

m["ncs"] = {"Nicaraguan Sign Language", 33765, "sgn", scripts = {"Sgnw"}}

m["nct"] = {"Chothe Naga", 5105385, "tbq-kuk", scripts = {"Beng", "Latn"}}

m["ncu"] = {"Chumburung", 35198, "alv-gng", scripts = Latn}

m["ncx"] = {"Central Puebla Nahuatl", 5061727, "azc-nah", scripts = Latn}

m["ncz"] = {"Natchez", 3111838, scripts = Latn}

m["nda"] = {"Ndasa", 35904, "bnt-kel", scripts = Latn}

m["ndb"] = {"Kenswei Nsei", 7067553, "nic-rnn", scripts = Latn}

m["ndc"] = {"Ndau", 13311, "bnt-sho", scripts = Latn}

m["ndd"] = {"Nde-Nsele-Nta", 36131, "nic-eko", scripts = Latn}

m["ndf"] = {"Nadruvian", 6957967, scripts = Latn}

m["ndg"] = {"Ndengereko", 6983726, "bnt-mbi", scripts = Latn}

m["ndh"] = {"Ndali", 6983678, "bnt-run", scripts = Latn}

m["ndi"] = {"Chamba Leko", 36381, "alv-lek", scripts = Latn}

m["ndj"] = {"Ndamba", 6983684, "bnt-kil", scripts = Latn}

m["ndk"] = {"Ndaka", 11164947, "bnt-nya", scripts = Latn}

m["ndl"] = {"Ndolo", 6983788, "bnt-zbi", ancestors = {"lse"}, scripts = Latn}

m["ndm"] = {"Ndam", 56283, "cdc-est", scripts = Latn}

m["ndn"] = {"Ngundi", 35916, "bnt-ngn", scripts = Latn}

m["ndp"] = {"Ndo", 6983774, "csu-mle", scripts = Latn}

m["ndq"] = {"Ndombe", 6983792, "bnt-swb", scripts = Latn}

m["ndr"] = {"Ndoola", 35837, "nic-mmb", scripts = Latn}

m["nds"] = {"Low German", 25433, "gmw", scripts = Latn, ancestors = {"gml"}}

m["ndt"] = {"Ndunga", 6983857, "nic-mbc", scripts = Latn}

m["ndu"] = {"Dugun", 11015189, "alv-dur", scripts = Latn}

m["ndv"] = {"Ndut", 36028, "alv-cng", scripts = Latn}

m["ndw"] = {"Ndobo", 11008568, "bnt-ngn", scripts = Latn}

m["ndx"] = {"Nduga", 6983833, scripts = Latn}

m["ndy"] = {"Lutos", 6705910, "csu-val", scripts = Latn}

m["ndz"] = {"Ndogo", 35983, "nic-ser", scripts = Latn}

m["nea"] = {"Eastern Ngad'a", 12473454, "poz-cet"}

m["neb"] = {"Toura", 7853636, "dmn-mda", scripts = Latn}

m["nec"] = {"Nedebang", 4925378, "ngf"}

m["ned"] = {"Nde-Gbite", 11010279, "nic-grf"}

m["nee"] = {"Kumak", 3347266, "poz-cln", scripts = Latn}

m["nef"] = {"Nefamese", 6987002, "crp"}

m["neg"] = {"Negidal", 33676, "tuw", scripts = {"Cyrl"}}

m["neh"] = {"Nyenkha", 3695185, "sit-ebo", scripts = {"Tibt", "Latn"}}

m["nej"] = {"Neko", 6989840, "ngf-fin", scripts = Latn}

m["nek"] = {"Neku", 14916900, "poz-cln"}

m["nem"] = {"Nemi", 3338008, "poz-cln", scripts = Latn}

m["nen"] = {"Nengone", 3338052, "poz-occ", scripts = Latn}

m["neo"] = {"Ná-Meo", 15977293, "hmn"}

m["neq"] = {"North Central Mixe", 25559729, scripts = Latn}

m["ner"] = {"Yahadian", 8046778, scripts = Latn}

m["nes"] = {"Bhoti Kinnauri", 21179921, "sit-las"}

m["net"] = {"Nete", 6998869, "paa-eng"}

m["neu"] = {"Neo", 606917, "art", type = "appendix-constructed", scripts = Latn}

m["nev"] = {"Nyaheun", 7070801, "mkh-ban"}

m["new"] = {"Newar", 33979, "sit-new", scripts = {"Deva", "Newa"}, ancestors = {"nwx"}, translit_module = "translit-redirect"}

m["nex"] = {"Neme", 12952941}

m["ney"] = {"Neyo", 36410, "kro"}

m["nez"] = {"Nez Perce", 3339226, "nai-shp", scripts = Latn}

m["nfa"] = {"Dhao", 2053828, "poz"}

m["nfd"] = {"Ahwai", 3913957, "nic-plt", scripts = Latn}

m["nfl"] = {"Aiwoo", 56742, "poz-oce", scripts = Latn}

m["nfr"] = {"Nafaanra", 13297, "alv-snf", scripts = Latn}

m["nfu"] = {"Mfumte", 6826794, "nic-nka", scripts = Latn}

m["nga"] = {"Ngbaka", 36022, "alv-gbf", scripts = Latn}

m["ngb"] = {"Northern Ngbandi", 17522631, "nic-ngd", scripts = Latn}

m["ngc"] = {"Ngombe (Congo)", 3123524, "bnt-bun"}

m["ngd"] = {"Ngando (Central African Republic)", 35910, "bnt-ngn"}

m["nge"] = {"Ngemba", 6750551, "nic-nge", scripts = Latn}

m["ngg"] = { -- compare 'aiy'
    "Ngbaka Manza",
    11033316,
    "alv-gbf",
    scripts = Latn
}

m["ngh"] = {"Nǀuu", 2618974, "khi-tuu", scripts = Latn}

m["ngi"] = {"Ngizim", 3914924, "cdc-wst", scripts = Latn}

m["ngj"] = {"Ngie", 36361, "nic-mom", scripts = Latn}

m["ngk"] = {"Ngalkbun", 3913790, "aus-gun", scripts = Latn}

m["ngl"] = {"Lomwe", 35824, "bnt-mak", scripts = Latn}

m["ngm"] = {"Ngatik Men's Creole", 36400, "crp", ancestors = {"en", "pon"}}

m["ngn"] = {"Ngwo", 36051, "nic-mom", scripts = Latn}

m["ngo"] = {"Ngoni", 7022547, "bnt-ngu", scripts = Latn}

m["ngp"] = {"Ngulu", 7193332, "bnt-seu", scripts = Latn}

m["ngq"] = {"Ngoreme", 7022573, "bnt-lok", scripts = Latn}

m["ngr"] = {"Nagu", 3063524, "poz-oce", scripts = Latn}

m["ngs"] = {"Gvoko", 3441188, "cdc-cbm", scripts = Latn}

m["ngt"] = {"Ngeq", 25559548, "mkh-kat"}

m["ngu"] = {"Guerrero Nahuatl", 5614980, "azc-nah", scripts = Latn}

m["ngv"] = {"Nagumi", 35842, "nic-jrn"}

m["ngw"] = {"Ngwaba", 3440480, "cdc-cbm", scripts = Latn}

m["ngx"] = {"Nggwahyi", 56265, "cdc-cbm", scripts = Latn}

m["ngy"] = {"Tibea", 36598, "bnt-baf", scripts = Latn}

m["ngz"] = {"Ngungwel", 35920, "bnt-tkc", scripts = Latn}

m["nha"] = {"Nhanda", 3339380, "aus-psw", scripts = Latn}

m["nhb"] = {"Beng", 3913311, "dmn-nbe", scripts = Latn}

m["nhc"] = {"Tabasco Nahuatl", 6047326, "azc-nah", scripts = Latn}

m["nhd"] = {"Chiripá", 2873230, "tup-gua", ancestors = {"gn"}}

m["nhe"] = {"Eastern Huasteca Nahuatl", 4358289, "azc-nah", scripts = Latn}

m["nhf"] = {"Nhuwala", 10600396, "aus-nga", scripts = Latn}

m["nhg"] = {"Tetelcingo Nahuatl", 3450252, "azc-nah", scripts = Latn}

m["nhh"] = {"Nahari", 6583560, "inc-eas", ancestors = {"inc-mgd"}}

m["nhi"] = {"Zacatlán-Ahuacatlán-Tepetzintla Nahuatl", 12953764, "azc-nah", scripts = Latn}

m["nhk"] = {"Cosoleacaque Nahuatl", 12953757, "azc-nah", scripts = Latn}

m["nhm"] = {"Morelos Nahuatl", 4800819, "azc-nah", scripts = Latn}

m["nhn"] = {"Central Nahuatl", 6047309, "azc-nah", scripts = Latn}

m["nho"] = {"Takuu", 3409818, "poz-pnp", scripts = Latn}

m["nhp"] = {"Pajapan Nahuatl", 12953760, "azc-nah", scripts = Latn}

m["nhq"] = {"Huaxcaleca Nahuatl", 12953758, "azc-nah", scripts = Latn}

m["nhr"] = {"Naro", 2164778, "khi-kal", scripts = Latn}

m["nht"] = {"Ometepec Nahuatl", 7090132, "azc-nah", scripts = Latn}

m["nhu"] = {"Noone", 36072, "nic-bbe", scripts = Latn}

m["nhv"] = {"Temascaltepec Nahuatl", 2379405, "azc-nah", scripts = Latn}

m["nhw"] = {"Western Huasteca Nahuatl", 2678840, "azc-nah", scripts = Latn}

m["nhx"] = {"Mecayapan Nahuatl", 12953756, "azc-nah", scripts = Latn}

m["nhy"] = {"Northern Oaxaca Nahuatl", 12953763, "azc-nah", scripts = Latn}

m["nhz"] = {"Santa María La Alta Nahuatl", 15705753, "azc-nah", scripts = Latn}

m["nia"] = {"Nias", 2407831, "poz-nws", scripts = Latn}

m["nib"] = {"Nakame", 11732495, "ngf-fin", scripts = Latn}

m["nid"] = {"Ngandi", 7021977, "aus-arn", scripts = Latn}

m["nie"] = {"Niellim", 33662, "alv-bua"}

m["nif"] = {"Nek", 6989781, "ngf-fin", scripts = Latn}

m["nig"] = {"Ngalakan", 3913796, "aus-gun", scripts = Latn}

m["nih"] = {"Nyiha", 11128374, "bnt-mby", scripts = Latn}

m["nii"] = {"Nii", 35237, "ngf", scripts = Latn}

m["nij"] = {"Ngaju", 2992872, "poz-brw", scripts = Latn}

m["nik"] = {"Southern Nicobarese", 7570194, "aav-nic"}

m["nil"] = {"Nila", 7036821}

m["nim"] = {"Nilamba", 4121200, "bnt-tkm", scripts = Latn}

m["nin"] = {"Ninzo", 3914021, "nic-nin"}

m["nio"] = {"Nganasan", 36743, "syd", scripts = {"Cyrl"}}

m["niq"] = {"Nandi", 6956591, "sdv-nma"}

m["nir"] = {"Nimboran", 301116, "paa-nim"}

m["nis"] = {"Nimi", 11732523, "ngf-fin", scripts = Latn}

m["nit"] = {"Southeastern Kolami", 56767, "dra"}

m["niu"] = {"Niuean", 33790, "poz-pol", scripts = Latn}

m["niv"] = {"Nivkh", 36464, "qfa-iso", scripts = {"Cyrl"}, translit_module = "niv-translit"}

m["niw"] = {"Nimo", 3504126, "paa-asa"}

m["nix"] = {"Hema", 5710904, "bnt-nyg", scripts = Latn}

m["niy"] = {"Ngiti", 7022396, "csu-lnd"}

m["niz"] = {"Ningil", 11732527, "qfa-tor"}

m["nja"] = {"Nzanyi", 3441299, "cdc-cbm", scripts = Latn}

m["njb"] = {"Nocte Naga", 7046410, "sit-tno"}

m["njh"] = {"Lotha Naga", 33590, "sit-aao"}

m["nji"] = {"Gudanji", 3915692, "aus-mir"}

m["njj"] = {"Njen", 36112, "nic-mom", scripts = Latn}

m["njl"] = {"Njalgulgule", 7071229, "sdv-daj"}

m["njm"] = {"Angami", 56761, "tbq-anp"}

m["njn"] = {"Liangmai Naga", 14194500, "sit-zem"}

m["njo"] = {"Ao", 28433, "sit-aao", scripts = Latn}

m["njr"] = {"Njerep", 35844, "nic-mmb", scripts = Latn}

m["njs"] = {"Nisa", 13593518, "paa-egb"}

m["njt"] = {"Ndyuka-Trio Pidgin", 13591205, "crp", ancestors = {"djk", "tri"}}

m["nju"] = {"Ngadjunmaya", 7021846}

m["njx"] = {"Kunyi", 3196559, "bnt-kng", scripts = Latn}

m["njy"] = {"Njyem", 35898, "bnt-ndb", scripts = Latn}

m["njz"] = {"Nyishi", 56870, "sit-tan", scripts = Latn}

m["nka"] = {"Nkoya", 7042633, "bnt-lbn", scripts = Latn}

m["nkb"] = {"Khoibu Naga", 21481876, "sit-mar"}

m["nkc"] = {"Nkongho", 35863, "bnt-saw", scripts = Latn}

m["nkd"] = {"Koireng", 6426342, "sit-zem"}

m["nke"] = {"Duke", 3041075, "poz-ocw"}

m["nkf"] = {"Inpui Naga", 21481817, "sit-zem"}

m["nkg"] = {"Nekgini", 11732509, "ngf-fin", scripts = Latn}

m["nkh"] = {"Khezha Naga", 6401519, "tbq-anp"}

m["nki"] = {"Thangal Naga", 56374, "sit-zem"}

m["nkj"] = {"Nakai", 14916897, "ngf-okk", scripts = Latn}

m["nkk"] = {"Nokuku", 7048122, "poz-vnc"}

m["nkm"] = {"Namat", 15634505}

m["nkn"] = {"Nkangala", 10962292, "bnt-clu", ancestors = {"mck"}, scripts = Latn}

m["nko"] = {"Nkonya", 35867, "alv-gng", scripts = Latn}

m["nkp"] = {"Niuatoputapu", 3399095, "poz-pnp"}

m["nkq"] = {"Nkami", 7042522, "alv-gng", scripts = Latn}

m["nkr"] = {"Nukuoro", 2635961, "poz-pnp", scripts = Latn}

m["nks"] = {"North Asmat", 11732049}

m["nkt"] = {"Nyika", 16917497, "bnt-mwi", scripts = Latn}

m["nku"] = {"Bouna Kulango", 20668241, "alv-kul"}

-- nkv is treated as nkt, see WT:LT

m["nkw"] = {"Nkutu", 7193313, "bnt-tet", scripts = Latn}

m["nkx"] = {"Nkoroo", 36000, "ijo"}

m["nkz"] = {"Nkari", 11130307, "nic-ief", ancestors = {"ibr"}}

m["nla"] = {"Ngombale", 36292, "bai", scripts = Latn}

m["nlc"] = {"Nalca", 6960839, "ngf", scripts = Latn}

m["nle"] = {"East Nyala", 25559347, "bnt-msl", ancestors = {"luy"}, scripts = Latn}

m["nlg"] = {"Gela", 3063531, "poz-sls", scripts = Latn}

m["nli"] = {"Grangali", 3444203, "inc-dar"}

m["nlj"] = {"Nyali", 7070830, "bnt-nya", scripts = Latn}

m["nlk"] = {"Ninia Yali", 12953310}

m["nll"] = {"Nihali", 33904, "qfa-iso", scripts = {"Deva", "Latn"}}

m["nlm"] = {"Mankiyali", 47522426, "inc-dar"}

m["nlo"] = {"Ngul", 35894, "bnt-bdz", scripts = Latn}

m["nlq"] = {"Lao Naga", 63283609, "sit-tno"}

m["nlu"] = {"Nchumbulu", 36143, "alv-gng", scripts = Latn}

m["nlv"] = {"Orizaba Nahuatl", 3086050, "azc-nah", scripts = Latn}

m["nlw"] = {"Walangama", 7961277}

m["nlx"] = {"Nahali", 33361, "inc-bhi"}

m["nly"] = {"Nyamal", 7070837, "aus-nga", scripts = Latn}

m["nlz"] = {"Nalögo", 20527138, "poz-oce"}

m["nma"] = {"Maram Naga", 56378, "sit-zem"}

m["nmb"] = {"Big Nambas", 2902304, "poz-vnc"}

m["nmc"] = {"Ngam", 3915446, "csu-sar", scripts = Latn}

m["nmd"] = {"Ndumu", 35901, "bnt-mbt", scripts = Latn}

m["nme"] = {"Mzieme Naga", 6949473, "sit-zem"}

m["nmf"] = {"Tangkhul Naga", 7682992, "sit-tng"}

m["nmg"] = {"Kwasio", 34098, "bnt-mnj", scripts = Latn}

m["nmh"] = {"Monsang Naga", 6902496}

m["nmi"] = {"Nyam", 3438738, "cdc-wst", scripts = Latn}

m["nmj"] = {"Ngombe (Central African Republic)", 3913949, "alv-gbs"}

m["nmk"] = {"Namakura", 3335410, "poz-vnc"}

m["nml"] = {"Ndemli", 36089, "nic-grf", scripts = Latn}

m["nmm"] = {"Manangba", 6746900, "sit-tam", scripts = {"Tibt", "Deva"}}

m["nmn"] = {"ǃXóõ", 13229, "khi-tuu", scripts = Latn}

m["nmo"] = {"Moyon Naga", 6927748, "tbq-kuk"}

m["nmp"] = {"Nimanbur", nil}

m["nmq"] = {"Nambya", 11008869, "bnt-sho", scripts = Latn}

m["nmr"] = {"Nimbari", 36069, "alv-lni"}

m["nms"] = {"Letemboi", 3236886, "poz-vnc"}

m["nmt"] = {"Namonuito", 12908815, "poz-mic"}

m["nmu"] = {"Northeast Maidu", 3278074, "nai-mdu", scripts = Latn}

m["nmv"] = {"Ngamini", 7021944, "aus-kar", scripts = Latn}

m["nmw"] = {"Nimoa", 7037729, "poz-ocw"}

m["nmy"] = {"Namuyi", 56844, "sit-nax"}

m["nmz"] = {"Nawdm", 36085, "nic-yon", scripts = Latn}

m["nna"] = {"Nyangumarta", 33653}

m["nnb"] = {"Nande", 3196953, "bnt-glb", scripts = Latn}

m["nnc"] = {"Nancere", 3140491, "cdc-est", scripts = Latn}

m["nnd"] = {"West Ambae", 2841479, "poz-vnc", scripts = Latn}

m["nne"] = {"Ngandyera", 10961003, "bnt-ova", scripts = Latn}

m["nnf"] = {"Ngaing", 11732510, "ngf-fin", scripts = Latn}

m["nng"] = {"Maring Naga", 12952908, "sit-mar"}

m["nnh"] = {"Ngiemboon", 36286, "bai", scripts = Latn}

m["nni"] = {"North Nuaulu", 12952968, "poz-cma"}

m["nnj"] = {"Nyangatom", 4662604, "sdv-ttu"}

m["nnk"] = {"Nankina", 11732502, "ngf-fin", scripts = Latn}

m["nnl"] = {"Northern Rengma Naga", 7067615, "tbq-anp"}

m["nnm"] = {"Namia", 56363, "paa-spk", scripts = Latn}

m["nnn"] = {"Ngete", 56625, "cdc-mas", scripts = Latn}

m["nnp"] = {"Wancho", 7967085, "sit-kch"}

m["nnq"] = {"Ngindo", 7022366, "bnt-mbi", scripts = Latn}

m["nnr"] = {"Narungga", 13591127, "aus-pam"}

m["nnt"] = {"Nanticoke", 3915517, "alg-eas", scripts = Latn}

m["nnu"] = {"Dwang", 35258, "alv-gng", scripts = Latn}

m["nnv"] = {"Nukunu", 10604066}

m["nnw"] = {"Southern Nuni", 11152248, "nic-gnn", scripts = Latn}

m["nnx"] = {"Ngong", 12952915}

m["nny"] = { -- contrast aus-ynk
    "Nyangga",
    10604331,
    "aus-tnk",
    scripts = Latn
}

m["nnz"] = {"Nda'nda'", 36016, "bai", scripts = Latn}

m["noa"] = {"Woun Meu", 3111873, "sai-chc", scripts = Latn}

m["noc"] = {"Nuk", 11732534, "ngf-fin", scripts = Latn}

m["nod"] = {"Northern Thai", 565110, "tai-swe", scripts = {"Lana", "Thai"}, sort_key = {from = {"[%pᪧๆ]", "[᩠ᩳ-᩿]", "ᩔ", "ᩕ", "ᩖ", "ᩘ", "([ᨭ-ᨱ])ᩛ", "([ᨷ-ᨾ])ᩛ", "ᩤ", "[็-๎]", "([เแโใไ])([ก-ฮ])", u(0x200C)}, to = {"", "", "ᩈᩈ", "ᩁ", "ᩃ", "ᨦ", "%1ᨮ", "%1ᨻ", "ᩣ", "", "%2%1"}}, entry_name = {from = {u(0x200C)}, to = {}}}

m["noe"] = {"Nimadi", 3502294, "inc-wes", scripts = Deva, ancestors = {"raj"}}

m["nof"] = {"Nomane", 11732531}

m["nog"] = {"Nogai", 33871, "trk-kno", scripts = {"Cyrl", "Arab", "Latn"}, translit_module = "nog-translit", override_translit = true}

m["noh"] = {"Nomu", 11732532}

m["noi"] = {"Noiri", 12953774, "inc-bhi"}

m["noj"] = {"Nonuya", 5372139, "sai-wit", scripts = Latn}

m["nok"] = {"Nooksack", 3343396}

m["nol"] = {"Nomlaki", 3343229, "nai-wtq", scripts = Latn}

m["nom"] = {"Nocamán", 7046289, "sai-pan", scripts = Latn}

m["non"] = {"Old Norse", 35505, "gmq", scripts = {"Latn", "Runr"}, translit_module = "translit-redirect"}

m["nop"] = {"Numanggang", 7069052, "ngf-fin", scripts = Latn}

m["noq"] = {"Ngongo", 11057478, "bnt-yak", scripts = Latn}

m["nos"] = {"Eastern Nisu", 25559419, "tbq-lol"}

m["not"] = {"Nomatsiguenga", 3342992, "awd", scripts = Latn}

m["nou"] = {"Ewage-Notu", 5418860}

m["nov"] = {"Novial", 36738, "art", scripts = Latn, type = "appendix-constructed"}

m["now"] = {"Nyambo", 4967930, "bnt-haj", scripts = Latn}

m["noy"] = {"Noy", 36321, "alv-bua"}

m["noz"] = {"Nayi", 3183349, "omv-diz"}

m["npa"] = {"Nar Phu", 4926353, "sit-tam"}

m["npb"] = {"Nupbikha", 3695201, "sit-ebo"}

m["npg"] = {"Ponyo", 7228475, "sit-kch"}

m["nph"] = {"Phom", 7187109, "sit-kch"}

m["npl"] = {"Southeastern Puebla Nahuatl", 4632950, "azc-nah", scripts = Latn}

m["npn"] = {"Mondropolon", 3320594, "poz-aay"}

m["npo"] = {"Pochuri Naga", 7206342, "tbq-anp"}

m["nps"] = {"Nipsan", 11732528}

m["npu"] = {"Puimei Naga", 7259044, "sit-zem"}

m["npy"] = {"Napu", 12953768}

m["nqg"] = {"Ede Nago", 12952408, "alv-ede"}

m["nqk"] = {"Kura Ede Nago", 12952409, "alv-ede"}

m["nql"] = {"Ngendelengo", 63283693, "bnt-swb", scripts = Latn}

m["nqm"] = {"Ndom", 6983791, "ngf", scripts = Latn}

m["nqn"] = {"Nen", 20816352, "paa-yam"}

m["nqo"] = {"N'Ko", 18546266, "dmn-man", scripts = {"Nkoo"}}

m["nqq"] = {"Kyan-Karyaw Naga", 63283784, "sit-tno"}

m["nqy"] = {"Akyaung Ari", 4702035, "sit-tng"}

m["nra"] = {"Ngom", 36087, "bnt-kel", scripts = Latn}

m["nrb"] = {"Nara", 36179, "sdv-nes"}

m["nrc"] = {"Noric", 37023, "cel", scripts = {"Ital"}}

m["nre"] = {"Southern Rengma Naga", 7313205, "tbq-anp"}

m["nrf"] = {"Norman", 33850, "roa-oil", scripts = Latn, ancestors = {"frm"}, sort_key = {from = {"[áàâä]", "[éèêë]", "[íìîï]", "[óòôö]", "[úùûü]", "[ýỳŷÿ]", "ç", "æ", "œ", "'"}, to = {"a", "e", "i", "o", "u", "y", "c", "ae", "oe"}}, wikimedia_codes = {"nrm"}}

m["nrg"] = {"Narango", 12952929, "poz-vnc"}

m["nri"] = {"Chokri Naga", 5104247, "tbq-anp"}

m["nrk"] = {"Ngarla", 3915860, "aus-nga", scripts = Latn}

m["nrl"] = {"Ngarluma", 7022078, "aus-nga", scripts = Latn}

m["nrm"] = {"Narom", 3336135, "poz-swa", scripts = Latn}

m["nrn"] = {"Norn", 36708, "gmq", scripts = Latn, ancestors = {"non"}}

m["nrp"] = {"North Picene", 430138, scripts = {"Ital"}, translit_module = "Ital-translit"}

m["nrr"] = {"Norra", 12952967, "tai"}

m["nrt"] = {"Northern Kalapuya", 3192121, "nai-klp"}

m["nru"] = {"Narua", 21658869, "sit-nax"}

m["nrx"] = {"Ngurmbur", 2591251}

m["nrz"] = {"Lala (New Guinea)", 6480151, "poz-ocw"}

m["nsa"] = {"Sangtam Naga", 7418144, "sit-aao"}

m["nsb"] = {"Lower Nossob", 6693681, "khi-tuu", scripts = Latn}

m["nsc"] = {"Nshi", 11129508, "nic-rnn", scripts = Latn}

m["nsd"] = {"Southern Nisu", nil, "tbq-lol"}

m["nse"] = {"Nsenga", 3081996, "bnt-sna", scripts = Latn}

m["nsg"] = {"Ngasa", 56345, "sdv-lma"}

m["nsh"] = {"Ngoshie", 7022582, "nic-mom", scripts = Latn}

m["nsi"] = {"Nigerian Sign Language", 7033021, "sgn"}

m["nsk"] = {"Naskapi", 1704302, "alg", scripts = {"Cans"}, ancestors = {"cr"}, translit_module = "nsk-translit"}

m["nsl"] = {"Norwegian Sign Language", 1781613, "sgn"}

m["nsm"] = {"Sema", 3478238, "tbq-anp"}

m["nsn"] = {"Nehan", 3337774, "poz-ocw"}

m["nso"] = {"Northern Sotho", 33890, "bnt-sts", scripts = Latn}

m["nsp"] = {"Nepalese Sign Language", 3915492, "sgn"}

m["nsq"] = {"Northern Sierra Miwok", 3344226, "nai-utn", scripts = Latn}

m["nsr"] = {"Maritime Sign Language", 3915483, "sgn"}

m["nss"] = {"Nali", 3335385, "poz-aay"}

m["nst"] = {"Tangsa", 56350, "sit-tno"}

m["nsu"] = {"Sierra Negra Nahuatl", nil, "azc-nah", scripts = Latn}

m["nsv"] = {"Southwestern Nisu", nil, "tbq-lol"}

m["nsw"] = {"Navut", 3337327, "poz-vnc"}

m["nsx"] = {"Nsongo", 7067577, "bnt-tmb", scripts = Latn}

m["nsy"] = {"Nasal", 6966574}

m["nsz"] = {"Nisenan", 33665, "nai-mdu", scripts = Latn}

m["ntd"] = {"Northern Tidong", nil, "poz-san"}

m["nte"] = {"Nathembo", 11030947, "bnt-mak"}

m["ntg"] = {"Ngantangarra", 33060509}

m["nti"] = {"Natioro", 36140, "alv-wan"}

m["ntj"] = {"Ngaanyatjarra", 3915409, "aus-pam", scripts = Latn}

m["ntk"] = {"Ikoma", 5996114, "bnt-lok", scripts = Latn}

m["ntm"] = {"Nateni", 3070731, "nic-grm", scripts = Latn}

m["nto"] = {"Ntomba", 11130292, "bnt-mon", scripts = Latn}

m["ntp"] = {"Northern Tepehuan", 15615651, "azc", scripts = Latn, sort_key = {from = {"á", "é", "í", "ó", "ú"}, to = {"a", "e", "i", "o", "u"}}}

m["ntr"] = {"Delo", 35195, "nic-gne", scripts = Latn}

m["nts"] = {"Natagaimas", 6967931}

m["ntu"] = {"Natügu", nil, "poz-oce"}

m["ntw"] = {"Nottoway", 3344791, "iro"}

m["ntx"] = {"Somra", 7560536, "sit-tng"}

m["nty"] = {"Mantsi", 56878, "sit-mnz"}

m["nua"] = {"Yuaga", 3573088, "poz-cln", scripts = Latn}

m["nuc"] = {"Nukuini", 3346231}

m["nud"] = {"Ngala", 7021893, "paa-spk", scripts = Latn}

m["nue"] = {"Ngundu", 12952953, "bad-cnt", scripts = Latn}

m["nuf"] = {"Nusu", 56413, "tbq-lol"}

m["nug"] = {"Nungali", 7069826, "aus-mir"}

m["nuh"] = {"Ndunda", 3913968, "nic-mmb", scripts = Latn}

m["nui"] = {"Ngumbi", 36459, "bnt-yko"}

m["nuj"] = {"Nyole (Uganda)", 3739448, "bnt-msl", scripts = Latn}

m["nuk"] = {"Nootka", 2992876, "wak", scripts = Latn}

m["nul"] = {"Nusa Laut", 7070332, "poz-cma"}

m["num"] = {"Niuafo'ou", 36173, "poz-pol", scripts = Latn}

m["nun"] = {"Anong", 2748232, "sit-nng"}

m["nuo"] = {"Nguôn", 3915785, "mkh-vie"}

m["nup"] = {"Nupe", 36720, "alv-ngb", scripts = Latn}

m["nuq"] = {"Nukumanu", 12909019, "poz-pnp"}

m["nur"] = {"Nuguria", 7068910, "poz-pnp"}

m["nus"] = {"Nuer", 33675, "sdv-dnu", scripts = Latn}

m["nut"] = {"Nung", 72695, "tai"}

m["nuu"] = {"Ngbundu", 11126081, "bad", scripts = Latn}

m["nuv"] = {"Northern Nuni", 11016572, "nic-gnn", scripts = Latn}

m["nuw"] = {"Nguluwan", 6528643}

m["nux"] = {"Mehek", 6809452, "paa-spk", scripts = Latn}

m["nuy"] = {"Nunggubuyu", 1747811, "aus-arn"}

m["nuz"] = {"Tlamacazapa Nahuatl", 2073277, "azc-nah", scripts = Latn}

m["nvh"] = {"Nasarian", 6966614, "poz-vnc"}

m["nvm"] = {"Namiae", 12952922}

m["nvo"] = {"Nyokon", nil, "nic-mbw", scripts = Latn}

m["nwa"] = {"Nawathinehena", 6982892, "alg-ara", scripts = Latn}

m["nwb"] = {"Nyabwa", 33664, "kro-wee"}

m["nwc"] = {"Classical Newar", 5128301, "sit-new"}

m["nwe"] = {"Ngwe", 36181, "bai", scripts = Latn}

m["nwi"] = {"Southwest Tanna", 3504488}

m["nwm"] = {"Nyamusa-Molo", 12747951, "csu-bbk"}

m["nwo"] = {"Nauo", 6981305, "aus-pam", scripts = Latn}

m["nwr"] = {"Nawaru", 12638166, "ngf"}

m["nwx"] = {"Middle Newar", nil, "sit-new", ancestors = {"nwc"}}

m["nwy"] = {"Nottoway-Meherrin", nil, "iro"}

m["nxa"] = {"Nauete", 6981095, "poz-tim"}

m["nxd"] = {"Ngando (Congo)", 3913277, "bnt-ske"}

m["nxe"] = {"Nage", 2295569, "poz-cet"}

m["nxg"] = {"Ngadha", 1516651, "poz-cet", scripts = Latn}

m["nxi"] = {"Nindi", 7038230, "bnt-mbi", scripts = Latn}

m["nxl"] = {"South Nuaulu", 18544857, "poz-cma"}

m["nxm"] = {
    "Numidian",
    35761,
    "afa",
    scripts = {"Tfng", "Latn"} -- Tfng may not support all the needed characters
}

m["nxn"] = {"Ngawun", 3915711, "aus-pam", scripts = Latn}

m["nxo"] = {"Ndambomo", 6983681, "bnt-kel", scripts = Latn}

m["nxq"] = {"Naxi", 2478711, "sit-nax"}

m["nxr"] = {"Ninggerum", 11732526, "ngf-okk", scripts = Latn}

m["nxu"] = {"Narau", 6965452, "ngf", scripts = Latn}

m["nxx"] = {"Nafri", 6958211, "paa-sen", scripts = Latn}

m["nyb"] = {"Nyangbo", 36256, "alv-ktg", scripts = Latn}

m["nyc"] = {"Nyanga-li", 7070876, "bnt-boa", scripts = Latn}

m["nyd"] = {"Nyole (Kenya)", 7071227, "bnt-msl", scripts = Latn}

m["nye"] = {"Nyengo", 7071068, "bnt-clu", scripts = Latn}

m["nyf"] = {"Giryama", 3107606, "bnt-mij", scripts = Latn}

m["nyg"] = {"Nyindu", 11030685, "bnt-shh", scripts = Latn}

m["nyh"] = {"Nyigina", 3913780, "aus-nyu", scripts = Latn}

m["nyi"] = {"Nyimang", 34846, "sdv-nyi", scripts = Latn}

m["nyj"] = {"Nyanga (Congo)", 7070879, "bnt-nyb", scripts = Latn}

m["nyk"] = {"Nyaneka", 10962298, "bnt-swb", scripts = Latn}

m["nyl"] = {"Nyeu", 3033578, "mkh-kat"}

m["nym"] = {"Nyamwezi", 4121131, "bnt-tkm", scripts = Latn}

m["nyn"] = {"Nyankole", 13207, "bnt-nyg", scripts = Latn}

m["nyo"] = {"Nyoro", 33794, "bnt-nyg", scripts = Latn}

m["nyp"] = {"Nyang'i", 7070894, "ssa-klk"}

m["nys"] = {"Nyunga", 7049771, "aus-pam", scripts = Latn}

m["nyt"] = {"Nyawaygi", 3915783, "aus-dyb"}

m["nyu"] = {"Nyungwe", 7071318, "bnt-sna", scripts = Latn}

m["nyv"] = {"Nyulnyul", 3442732, "aus-nyu", scripts = Latn}

m["nyw"] = {
    "Nyaw",
    26425602,
    "tai",
    scripts = {"Thai", "Latn"} -- Vietnamese alphabet
}

m["nyx"] = {"Nganyaywana", 3913800, "aus-cww", scripts = Latn}

m["nyy"] = {"Nyakyusa", 3272620, "bnt-run", scripts = Latn}

m["nza"] = {"Tigon Mbembe", 36518, "nic-jkn", scripts = Latn}

m["nzb"] = {"Njebi", 35923, "bnt-nze", scripts = Latn}

m["nzd"] = {"Nzadi", 17152586, "bnt-bdz", scripts = Latn, entry_name = {from = {"[ÀÂǍÁ]", "[àâǎá]", "[ÈÊĚÉ]", "[èêěé]", "[ÌÎǏÍ]", "[ìîǐí]", "[ÒÔǑÓ]", "[òôǒó]", "[ÙÛǓÚ]", "[ùûǔú]", "[ǹń]", "ḿ", "[`ˋ]", GRAVE, CIRC, CARON, ACUTE}, to = {"A", "a", "E", "e", "I", "i", "O", "o", "U", "u", "n", "m"}}}

m["nzi"] = {"Nzima", 36337, "alv-ctn"}

m["nzk"] = {"Nzakara", 3913339, "znd", scripts = Latn}

m["nzm"] = {"Zeme Naga", 21491053, "sit-zem"}

m["nzs"] = {"New Zealand Sign Language", 36239, "sgn"}

m["nzu"] = {"Central Teke", 36473, "bnt-tkc"}

m["nzy"] = {"Nzakambay", 36374, "alv-mbm", scripts = Latn}

m["nzz"] = {"Nanga Dama Dogon", 6963443, "nic-nwa"}

return m
