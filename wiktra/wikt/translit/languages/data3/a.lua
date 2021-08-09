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

-- Punctuation to be used for standardChars field
local PUNCTUATION = " !#%&*+,-./:;<=>?@^_`|~'()"

-- Use these in "scripts" to save a little memory.
local Arab = {"Arab"}
local Cyrl = {"Cyrl"}
local Deva = {"Deva"}
local Latn = {"Latn"}

local m = {}

m["aaa"] = {"Ghotuo", 35463, "alv-yek", Latn}

m["aab"] = {"Alumu-Tesu", 35034, "nic-alu", Latn}

m["aac"] = {"Ari", 1811224, "paa-pag", Latn}

m["aad"] = {"Amal", 56708, "paa-iwm", Latn}

-- "aae" IS TREATED AS "sq", SEE WT:LT

m["aaf"] = {"Aranadan", 3507928, "dra", {"Mlym"}}

m["aag"] = {"Ambrak", 4741706, "qfa-tor", Latn}

m["aah"] = {"Abu' Arapesh", 4670715, "qfa-tor", Latn}

m["aai"] = {"Arifama-Miniafia", 4790560, "poz-ocw", Latn}

m["aak"] = {"Ankave", 3446690, "ngf", Latn}

m["aal"] = {"Afade", 56434, "cdc-cbm", Latn}

m["aan"] = {"Anambé", 3507873, "tup-gua", Latn}

m["aap"] = {"Pará Arára", 56807, "sai-car", Latn}

m["aaq"] = {"Penobscot", 3515185, "alg-abp", Latn}

m["aas"] = {"Aasax", 56620, "cus", Latn}

-- "aat" IS TREATED AS "sq", SEE WT:LT

m["aau"] = {"Abau", 3073568, "paa-spk", Latn}

m["aaw"] = {"Solong", 7558834, "poz-ocw", Latn}

m["aax"] = {"Mandobo Atas", 12636156, "ngf", Latn}

m["aaz"] = {"Amarasi", 4740192, "poz-tim", Latn}

m["aba"] = {"Abé", 34833, "alv-lag", Latn}

m["abb"] = {"Bankon", 34860, "bnt-bsa", Latn}

m["abc"] = {"Ambala Ayta", 3448896, "phi", Latn}

m["abd"] = {"Camarines Norte Agta", 3399682, "phi", Latn}

m["abe"] = {"Abenaki", 17502788, "alg-abp", Latn}

m["abf"] = {"Abai Sungai", 4663287, "poz-san", Latn}

m["abg"] = {"Abaga", 3507954, "paa-kag", Latn}

m["abh"] = {"Tajiki Arabic", 56833, "sem-arb", Arab}

m["abi"] = {"Abidji", 34781, "alv-lag", Latn}

m["abj"] = {"Aka-Bea", 2356391, "qfa-ads", Latn}

m["abl"] = {"Abung", 49215, "poz-lgx", Latn}

m["abm"] = {"Abanyom", 7502, "nic-eko", Latn}

m["abn"] = {"Abua", 34835, "nic-cde", Latn}

m["abo"] = {"Abon", 35121, "nic-tvn", Latn}

m["abp"] = {"Abenlen Ayta", 3436621, "phi", Latn}

m["abq"] = {"Abaza", 27567, "cau-abz", Cyrl, translit_module = "abq-translit", override_translit = true}

m["abr"] = {"Abron", 34831, "alv-ctn", Latn, ancestors = {"ak"}}

m["abs"] = {"Ambonese Malay", 3124354, "crp", Latn, ancestors = {"ms"}}

m["abt"] = {"Ambulas", 3508015, "paa-spk", Latn}

m["abu"] = {"Abure", 34767, "alv-ptn", Latn}

m["abv"] = {"Baharna Arabic", 56576, "sem-arb", Arab, entry_name = {from = {u(0x0671), u(0x064B), u(0x064C), u(0x064D), u(0x064E), u(0x064F), u(0x0650), u(0x0651), u(0x0652), u(0x0670), u(0x0640)}, to = {u(0x0627)}}}

m["abw"] = {"Pal", 7126121, "ngf-mad", Latn}

m["abx"] = {"Inabaknon", 2820163, "poz-sbj", Latn}

m["aby"] = {"Aneme Wake", 3508107, "ngf", Latn}

m["abz"] = {"Abui", 2822110, "qfa-tap", Latn}

m["aca"] = {"Achagua", 2822982, "awd", Latn}

m["acb"] = {"Áncá", 11130787, "nic-mom", Latn}

m["acd"] = {"Gikyode", 35256, "alv-gng", Latn}

m["ace"] = {
    "Acehnese",
    27683,
    "cmc",
    {"Latn", "ms-Arab"},
    standardChars = "A-Za-z0-9ÈÉËÔÖèéëôö" .. PUNCTUATION -- current orthography (not yet add Arab)
}

m["ach"] = {"Acholi", 34926, "sdv-los", Latn}

m["aci"] = {"Aka-Cari", 2670418, "qfa-adn", Latn}

m["ack"] = {"Aka-Kora", 3433680, "qfa-adn", Latn}

m["acl"] = {"Akar-Bale", 3436825, "qfa-ads", Latn}

m["acm"] = {"Iraqi Arabic", 56232, "sem-arb", Arab, entry_name = {from = {u(0x0671), u(0x064B), u(0x064C), u(0x064D), u(0x064E), u(0x064F), u(0x0650), u(0x0651), u(0x0652), u(0x0670), u(0x0640)}, to = {u(0x0627)}}}

m["acn"] = {"Achang", 56582, "tbq-brm", Latn}

m["acp"] = {"Eastern Acipa", 5329945, "nic-kmk", Latn}

m["acr"] = {"Achi", 34774, "myn", Latn}

m["acs"] = {"Acroá", 2829146, "sai-cje", Latn}

m["acu"] = {"Achuar", 2823170, "sai-jiv", Latn}

m["acv"] = {"Achumawi", 56661, "nai-pal", Latn}

m["acw"] = {"Hijazi Arabic", 56608, "sem-arb", Arab, entry_name = {from = {u(0x0671), u(0x064B), u(0x064C), u(0x064D), u(0x064E), u(0x064F), u(0x0650), u(0x0651), u(0x0652), u(0x0670), u(0x0640)}, to = {u(0x0627)}}}

m["acx"] = {"Omani Arabic", 56630, "sem-arb", Arab, entry_name = {from = {u(0x0671), u(0x064B), u(0x064C), u(0x064D), u(0x064E), u(0x064F), u(0x0650), u(0x0651), u(0x0652), u(0x0670), u(0x0640)}, to = {u(0x0627)}}}

m["acy"] = {"Cypriot Arabic", 56416, "sem-arb", Arab, ancestors = {"acm"}}

m["acz"] = {"Acheron", 34769, "alv-tal", Latn}

m["ada"] = {"Adangme", 35141, "alv-gda", Latn}

m["adb"] = { -- rename or remove, see RFM
    "Adabe", 36872, nil, Latn
}

m["add"] = {"Dzodinka", 35266, "nic-nka", Latn}

m["ade"] = {"Adele", 27740, "alv-ntg", Latn}

m["adf"] = {"Dhofari Arabic", 56565, "sem-arb", Arab, entry_name = {from = {u(0x0671), u(0x064B), u(0x064C), u(0x064D), u(0x064E), u(0x064F), u(0x0650), u(0x0651), u(0x0652), u(0x0670), u(0x0640)}, to = {u(0x0627)}}}

m["adg"] = {"Andegerebinha", 3508123, "aus-pam", Latn}

m["adh"] = {"Adhola", 1971400, "sdv-los", Latn}

m["adi"] = {"Adi", 56440, "sit-tan", Latn}

m["adj"] = {"Adioukrou", 34738, "alv-lag", Latn}

m["adl"] = {"Galo", 2857892, "sit-tan", Latn}

m["adn"] = {"Adang", 3398276, "qfa-tap", Latn}

m["ado"] = {"Abu", 56659, "paa-ram", Latn}

m["adp"] = {
    "Adap",
    3512402,
    "sit-tib",
    {"Tibt"},
    ancestors = {"dz"},
    wikipedia_article = "Dzongkha" -- Considered a dialect of Dzongkha
}

m["adq"] = {"Adangbe", 34730, "alv-gda", Latn, ancestors = {"ada"}}

m["adr"] = {"Adonara", 4684505, "poz-cet", Latn}

m["ads"] = {
    "Adamorobe Sign Language", 27709, "sgn", Latn -- when documented
}

m["adt"] = {"Adnyamathanha", 2225391, "aus-psw", Latn}

m["adu"] = {"Aduge", 34734, "alv-nwd", Latn, ancestors = {"opa"}, wikipedia_article = "Okpamheri language"}

m["adw"] = {"Amondawa", 12626847, "tup-gua", Latn}

m["ady"] = {"Adyghe", 27776, "cau-cir", Cyrl, translit_module = "ady-translit", override_translit = true}

m["adz"] = {"Adzera", nil, "poz-ocw", Latn}

m["aea"] = {"Areba", 3509129, "aus-pam", Latn}

m["aeb"] = {"Tunisian Arabic", 56240, "sem-arb", Arab, entry_name = {from = {u(0x0671), u(0x064B), u(0x064C), u(0x064D), u(0x064E), u(0x064F), u(0x0650), u(0x0651), u(0x0652), u(0x0670), u(0x0640)}, to = {u(0x0627)}}}

m["aed"] = {
    "Argentine Sign Language", 3322073, "sgn", Latn -- when documented
}

m["aee"] = {"Northeast Pashayi", 12642198, "inc-dar", Latn}

m["aek"] = {"Haeke", 5638166, "poz-cln", Latn}

m["ael"] = {"Ambele", 34818, "nic-grf", Latn}

m["aem"] = {"Arem", 3507920, "mkh-vie", Latn}

m["aen"] = {"Armenian Sign Language", 3446604, "sgn"}

m["aeq"] = {"Aer", 3246741, "inc-wes", Arab, ancestors = {"inc-gup"}}

m["aer"] = {"Eastern Arrernte", 10728232, "aus-pam", Latn}

m["aes"] = {"Alsea", 2395641, nil, Latn}

m["aeu"] = {"Akeu", 4700657, "tbq-lol", Latn}

m["aew"] = {"Ambakich", 56642, "paa-ram", Latn}

m["aey"] = {"Amele", 3508025, "ngf-mad", Latn}

m["aez"] = {
    "Aeka",
    16110528,
    "ngf",
    Latn,
    wikipedia_article = "Orokaiva language" -- subvariety?
}

m["afb"] = {"Gulf Arabic", 56385, "sem-arb", Arab, entry_name = {from = {u(0x0671), u(0x064B), u(0x064C), u(0x064D), u(0x064E), u(0x064F), u(0x0650), u(0x0651), u(0x0652), u(0x0670), u(0x0640)}, to = {u(0x0627)}}}

m["afd"] = {"Andai", 4753480, "paa-arf", Latn}

m["afe"] = {"Putukwam", 3914930, "nic-ben", Latn}

m["afg"] = {"Afghan Sign Language", 4689093, "sgn"}

m["afh"] = {"Afrihili", 384707, "art", Latn, type = "appendix-constructed"}

m["afi"] = {"Akrukay", 57003, "paa-ram", Latn}

m["afk"] = {"Nanubae", 6964416, "paa-arf", Latn}

m["afn"] = {"Defaka", 35174, "nic", Latn}

m["afo"] = {"Eloyi", 3914066, "nic-plt", Latn}

m["afp"] = {"Tapei", 16887371, "paa-arf", Latn}

m["afs"] = {"Afro-Seminole Creole", 27867, "crp", Latn, ancestors = {"en"}}

m["aft"] = {"Afitti", 3400829, "sdv-nyi", Latn}

m["afu"] = {"Awutu", 34847, "alv-gng", Latn}

m["afz"] = {"Obokuitai", 7075258, "paa-lkp", Latn}

m["aga"] = {"Aguano", 3331203, nil, Latn}

m["agb"] = {"Legbo", 35584, "nic-uce", Latn}

m["agc"] = {"Agatu", 34732, "alv-ido", Latn}

m["agd"] = {"Agarabi", 3399642, "paa-kag", Latn}

m["age"] = {"Angal", 10951553, "paa-eng", Latn}

m["agf"] = {"Arguni", 12473346, "poz-cet", Latn}

m["agg"] = {"Angor", 3508100, "paa", Latn}

m["agh"] = {"Ngelima", 7022266, "bnt-bta", Latn}

m["agi"] = {"Agariya", 663586, "mun", Deva}

m["agj"] = {"Argobba", 29292, "sem-eth", {"Ethi"}}

m["agk"] = {"Isarog Agta", 6078982, "phi", Latn}

m["agl"] = {"Fembe", 372927, "ngf", Latn}

m["agm"] = {"Angaataha", 3508001, "ngf", Latn}

m["agn"] = {"Agutaynen", 3399717, "phi-kal", Latn}

m["ago"] = {"Tainae", 7676186, "ngf", Latn}

m["agq"] = {"Aghem", 34737, "nic-rnw", Latn}

m["agr"] = {"Aguaruna", 1526530, "sai-jiv", Latn}

m["ags"] = {"Esimbi", 35260, "nic-bds", Latn}

m["agt"] = {"Central Cagayan Agta", 5017296, "phi", Latn}

m["agu"] = {"Aguacateca", 35091, "myn", Latn}

m["agv"] = {"Remontado Agta", 3508085, "phi", Latn}

m["agw"] = {"Kahua", 3191906, "poz-sls", Latn}

m["agx"] = {"Aghul", 36498, "cau-lzg", Cyrl}

m["agy"] = {"Southern Alta", 7569611, "phi", Latn}

m["agz"] = {"Mount Iriga Agta", 6921432, "phi", Latn}

m["aha"] = {"Ahanta", 34729, "alv-ctn", Latn}

m["ahb"] = {"Axamb", 2874710, "poz-vnc", Latn}

m["ahg"] = {"Qimant", 35663, "cus", Latn}

m["ahh"] = {"Aghu", 3436645, "ngf", Latn}

m["ahi"] = {"Tiagbamrin Aizi", 3400073, "kro-aiz", Latn}

m["ahk"] = {"Akha", 56643, "tbq-lol", {"Latn", "Mymr", "Thai"}, sort_key = {from = {"[%pๆ]", "[็-๎]", "([เแโใไ])([ก-ฮ])"}, to = {"", "", "%2%1"}}}

m["ahl"] = {"Igo", 35412, "alv-ktg", Latn}

m["ahm"] = {"Mobumrin Aizi", 35967, "kro-aiz", Latn}

m["ahn"] = {"Àhàn", 34723, "alv-aah", Latn}

m["aho"] = {"Ahom", 34778, "tai-swe", {"Ahom"}, translit_module = "Ahom-translit"}

m["ahp"] = {"Aproumu Aizi", 34810, "alv-kwa", Latn}

m["ahr"] = {"Ahirani", 15549890, "inc-wes", Deva, ancestors = {"psu"}}

m["ahs"] = {"Ashe", 34823, "nic-plc", Latn}

m["aht"] = {"Ahtna", 21058, "ath-nor", Latn}

m["aia"] = {"Arosi", 2863483, "poz-sls", Latn}

m["aib"] = {"Aynu", 27927, "trk-kar", {"Arab", "Latn"}}

m["aic"] = {"Ainbai", 3332149, "paa-brd", Latn}

m["aid"] = {"Alngith", 3279409, "aus-pmn", Latn}

m["aie"] = {"Amara", 2841180, "poz-ocw", Latn}

m["aif"] = {"Agi", 3331491, "qfa-tor", Latn}

m["aig"] = {"Antigua and Barbuda Creole English", 3244184, "crp", Latn, ancestors = {"en"}}

m["aih"] = {"Ai-Cham", 2827749, "qfa-kms", {"Latn", "Hani"}}

m["aii"] = {"Assyrian Neo-Aramaic", 29440, "sem-nna", {"Syrc"}, entry_name = {from = {"[" .. u(0x0304) .. u(0x0308) .. u(0x0331) .. u(0x0730) .. "-" .. u(0x0748) .. "]"}, to = {}}}

m["aij"] = {"Lishanid Noshan", 3436467, "sem-nna", {"Hebr"}}

m["aik"] = {"Ake", 34808, "nic-pls", Latn}

m["ail"] = {"Aimele", 3327418, "ngf", Latn}

m["aim"] = {"Aimol", 4697175, "tbq-kuk", {"Latn", "Beng"}}

m["ain"] = {"Ainu", 27969, "qfa-iso", {"Kana", "Latn", "Cyrl"}}

m["aio"] = {
    "Aiton",
    3399725,
    "tai-swe",
    {"Mymr"},
    entry_name = {
        from = {u(0xFE00)}, -- VS01
        to = {""}
    }
}

m["aip"] = {"Burumakok", 5000984, "ngf-okk", Latn}

m["air"] = {"Airoran", 3321131, "paa-tkw", Latn}

m["ait"] = {"Arikem", 3446679, "tup", Latn}

m["aiw"] = {"Aari", 7495, "omv-aro", Latn}

m["aix"] = {"Aighon", 3504287, "poz-ocw", Latn}

m["aiy"] = {"Ali", 34814, "alv-gbf", Latn}

m["aja"] = {"Aja", 3237491, "csu-bkr", Latn}

m["ajg"] = {"Adja", 35035, "alv-gbe", Latn}

m["aji"] = {"Ajië", 2828867, "poz-cln", Latn}

m["ajn"] = {"Andajin", 16111302, "aus-wor", Latn}

m["ajp"] = {"South Levantine Arabic", nil, "sem-arb", Arab, entry_name = {from = {u(0x0671), u(0x064B), u(0x064C), u(0x064D), u(0x064E), u(0x064F), u(0x0650), u(0x0651), u(0x0652), u(0x0670), u(0x0640)}, to = {u(0x0627)}}}

m["ajt"] = {"Judeo-Tunisian Arabic", 56597, "sem-arb", {"Hebr"}, ancestors = {"jrb"}}

m["aju"] = {"Judeo-Moroccan Arabic", 56595, "sem-arb", {"Hebr"}, ancestors = {"jrb"}}

m["ajw"] = {"Ajawa", 56645, "cdc-wst", Latn}

m["ajz"] = {"Amri Karbi", 3508092, "tbq-kuk", Latn, ancestors = {"mjw"}}

m["akb"] = {"Angkola Batak", 2640686, "btk", {"Latn", "Batk"}}

m["akc"] = {"Mpur", 3327139, "paa-wpa", Latn}

m["akd"] = {"Ukpet-Ehom", 36618, "nic-ucr", Latn}

m["ake"] = {"Akawaio", 28059, "sai-car", Latn}

m["akf"] = {"Akpa", 34801, "alv-ido", Latn}

m["akg"] = {"Anakalangu", 4750964, "poz-cet", Latn}

m["akh"] = {"Angal Heneng", 10950354, "paa-eng", Latn}

m["aki"] = {"Aiome", 56735, "paa", Latn}

m["akj"] = {"Jeru", 2919121, "qfa-adn", {"Latn", "Deva"}}

m["akk"] = {"Akkadian", 35518, "sem-eas", {"Xsux", "Latn"}}

m["akl"] = {"Aklanon", 8773, "phi", Latn}

m["akm"] = {"Aka-Bo", 35361, "qfa-adn", Latn}

m["ako"] = {"Akurio", 56650, "sai-car", Latn}

m["akp"] = {"Siwu", 36470, "alv-ntg", Latn}

m["akq"] = {"Ak", 56654, "paa", Latn}

m["akr"] = {"Araki", 2699882, "poz-vnc", Latn}

m["aks"] = {"Akaselem", 34817, "nic-grm", Latn}

m["akt"] = {"Akolet", 3330162, "poz-ocw", Latn}

m["aku"] = {"Akum", 34799, "nic-ykb", Latn}

m["akv"] = {"Akhvakh", 56423, "cau-ava", Cyrl}

m["akw"] = {"Akwa", 34802, "bnt-mbo", Latn}

m["akx"] = {"Aka-Kede", 3436816, "qfa-adc", Latn}

m["aky"] = {"Aka-Kol", 3436784, "qfa-adc", Latn}

m["akz"] = {"Alabama", 1815020, "nai-mus", Latn}

m["ala"] = {"Alago", 34813, "alv-ido", Latn}

m["alc"] = {"Kawésqar", 56544, "aqa", Latn}

m["ald"] = {"Alladian", 34837, "alv-lag", Latn}

m["ale"] = {"Aleut", 27210, "esx", Latn}

m["alf"] = {"Alege", 34815, "nic-ben", Latn}

m["alh"] = {"Alawa", 2147917, "aus-gun", Latn}

m["ali"] = {"Amaimon", 3327427, "ngf-mad", Latn}

m["alj"] = {"Alangan", 3327423, "phi", Latn}

m["alk"] = {"Alak", 2714690, "mkh", Latn}

m["all"] = {"Allar", 3393634, "dra", {"Mlym"}}

-- "aln" IS TREATED AS "sq", SEE WT:LT

m["alm"] = {"Amblong", 11022615, "poz-vnc", Latn}

m["alo"] = {"Larike-Wakasihu", 3217929, "poz-cma", Latn}

m["alp"] = {"Alune", 3327367, "poz-cet", Latn}

m["alq"] = {"Algonquin", 28092, "alg", Latn, ancestors = {"oj"}}

m["alr"] = {"Alutor", 28213, "qfa-cka", Cyrl}

m["alt"] = {"Southern Altai", 1991779, "trk-sib", Cyrl, translit_module = "Altai-translit"}

m["alu"] = {"'Are'are", 5160, "poz-sls", Latn}

m["alw"] = {"Alaba", 56652, "cus", Latn}

m["alx"] = {"Amol", 3504260, "qfa-tor", Latn}

m["aly"] = {"Alyawarr", 3327389, "aus-pam", Latn}

m["alz"] = {"Alur", 56507, "sdv-los", Latn}

m["ama"] = {"Amanayé", 3508053, "tup-gua", Latn}

m["amb"] = {"Ambo", 3450142, "nic-tvn", Latn}

m["amc"] = {"Amahuaca", 2669150, "sai-pan", Latn}

m["ame"] = {"Yanesha'", 3088540, "awd", Latn}

m["amf"] = {"Hamer-Banna", 35764, "omv-aro", Latn}

m["amg"] = {"Amurdag", 3360016, "aus-wdj", Latn}

m["ami"] = {"Amis", 35132, "map", Latn}

m["amj"] = {"Amdang", 28335, "ssa-fur", Latn}

m["amk"] = {"Ambai", 1875885, "poz-hce", Latn}

m["aml"] = {"War-Jaintia", 56321, "aav-khs", Latn}

m["amm"] = {"Ama", 3446626, "qfa-mal", Latn}

m["amn"] = {"Amanab", 3327399, "paa-brd", Latn}

m["amo"] = {"Amo", 34826, "nic-kne", Latn}

m["amp"] = {"Alamblak", 56688, "paa", Latn}

m["amq"] = {"Amahai", 3327384, "poz-cma", Latn}

m["amr"] = {"Amarakaeri", 35128, "sai-har", Latn}

m["ams"] = {"Southern Amami-Oshima", 2840986, "jpx-ryu", {"Jpan"}}

m["amt"] = {"Amto", 56517, "paa-asa", Latn}

m["amu"] = {"Guerrero Amuzgo", 3501942, "omq", Latn}

m["amv"] = {"Ambelau", 2669214, "poz-cma", Latn}

m["amw"] = {"Western Neo-Aramaic", 34226, "sem-arw", {"Armi", "Syrc", "Latn"}}

m["amx"] = {"Anmatyerre", 10412317, "aus-pam", Latn}

m["amy"] = {"Ami", 12626835, "aus-dal", Latn}

m["amz"] = {"Atampaya", 3446651, "aus-pam", Latn}

m["ana"] = {"Andaqui", 2846078, nil, Latn}

m["anb"] = {"Andoa", 2846171, "sai-zap", Latn}

m["anc"] = {"Ngas", 35999, "cdc-wst", Latn}

m["and"] = {"Ansus", 3513300, "poz-hce", Latn}

m["ane"] = {"Xârâcùù", 3571097, "poz-cln", Latn}

m["anf"] = {"Animere", 34783, "alv-ktg", Latn}

m["ang"] = {
    "Old English",
    42365,
    "gmw",
    {"Latinx", "Runr"},
    translit_module = "translit-redirect",
    entry_name = {from = {"[ĀÁ]", "[āá]", "[ǢǼ]", "[ǣǽ]", "Ċ", "ċ", "[ĒÉ]", "[ēé]", "Ġ", "ġ", "[ĪÍ]", "[īí]", "[ŌÓ]", "[ōó]", "[ŪÚ]", "[ūú]", "[ȲÝ]", "[ȳý]", "Ƿ", "ƿ", MACRON, ACUTE, DOTABOVE}, to = {"A", "a", "Æ", "æ", "C", "c", "E", "e", "G", "g", "I", "i", "O", "o", "U", "u", "Y", "y", "W", "w"}},
    sort_key = {
        -- most dictionaries sort æ as if written ae, and þ/ð after t
        -- most dictionaries don't have ƿ at all (normalized to w); for now,
        -- put after w to keep them from cluttering up the w lists
        from = {"[æǣǽ]", "[þð]", "ƿ"},
        to = {"ae", "t~", "w~"}
    }
}

m["anh"] = {"Nend", 6991554, "ngf-mad", Latn}

m["ani"] = {"Andi", 34849, "cau-ava", Cyrl}

m["anj"] = {"Anor", 56458, "paa", Latn}

m["ank"] = {"Goemai", 35272, "cdc-wst", Latn}

m["anl"] = {"Anu", 4777679, "sit-mru", Latn}

m["anm"] = {"Anal", 56235, "tbq-kuk", Latn}

m["ann"] = {"Obolo", 36614, "nic-lcr", Latn}

m["ano"] = {"Andoque", 2669225, "qfa-iso", Latn}

m["anp"] = {"Angika", 28378, "inc-eas", Deva, ancestors = {"bh"}}

m["anq"] = {"Jarawa", 2475526, "qfa-ong", Latn}

m["anr"] = {"Andh", 4754314, "inc-sou", Deva, ancestors = {"pmh"}}

m["ans"] = {"Anserma", 3446613, "sai-chc", Latn}

m["ant"] = {"Antakarinya", 921304, "aus-psw", Latn}

m["anu"] = {"Anuak", 56677, "sdv-lon", Latn}

m["anv"] = {"Denya", 35187, "nic-mam", Latn}

m["anw"] = {"Anaang", 2845320, "nic-ief", Latn}

m["anx"] = {"Andra-Hus", 2846195, "poz-aay", Latn}

m["any"] = {"Anyi", 28395, "alv-ctn", Latn}

m["anz"] = {"Anem", 56512, "paa", Latn}

m["aoa"] = {"Angolar", 34994, "crp", Latn, ancestors = {"pt"}}

m["aob"] = {"Abom", 3446647, "ngf", Latn}

m["aoc"] = {"Pemon", 10729616, "sai-car", Latn}

m["aod"] = {"Andarum", 3507888, "paa", Latn}

m["aoe"] = {"Angal Enen", 10951638, "paa-eng", Latn}

m["aof"] = {"Bragat", 3507977, "qfa-tor", Latn}

m["aog"] = {
    "Angoram", 56366, -- cf 6754745 for merged dialect
    "paa-lsp", Latn
}

m["aoi"] = {"Anindilyakwa", 2714654, "aus-arn", Latn}

m["aoj"] = {"Mufian", 3507881, "qfa-tor", Latn}

m["aok"] = {"Arhö", 4790086, "poz-cln", Latn}

m["aol"] = {"Alor", 3332062, "poz", Latn}

m["aom"] = {"Ömie", 8078975, "ngf", Latn}

m["aon"] = {"Bumbita Arapesh", 3508044, "qfa-tor", Latn}

m["aor"] = {"Aore", 12627129, "poz-vnc", Latn}

m["aos"] = {"Taikat", 7676018, "paa-brd", Latn}

m["aot"] = {"Atong (India)", 5646, "tbq-bdg", {"Latn", "Beng"}}

m["aou"] = {
    "A'ou",
    16109994,
    "qfa-gel",
    Latn, -- also Hani?
    wikipedia_article = "Gelao language" -- might change, as A'ou is a dialect of Gelao
}

m["aox"] = {"Atorada", 3507932, "awd", Latn}

m["aoz"] = {"Uab Meto", 3441962, "poz-tim", Latn}

m["apb"] = {"Sa'a", 36294, "poz-sls", Latn}

m["apc"] = {"North Levantine Arabic", 22809485, "sem-arb", Arab, entry_name = {from = {u(0x0671), u(0x064B), u(0x064C), u(0x064D), u(0x064E), u(0x064F), u(0x0650), u(0x0651), u(0x0652), u(0x0670), u(0x0640)}, to = {u(0x0627)}}}

m["apd"] = {"Sudanese Arabic", 56573, "sem-arb", Arab, entry_name = {from = {u(0x0671), u(0x064B), u(0x064C), u(0x064D), u(0x064E), u(0x064F), u(0x0650), u(0x0651), u(0x0652), u(0x0670), u(0x0640)}, to = {u(0x0627)}}}

m["ape"] = {"Bukiyip", 3507895, "qfa-tor", Latn}

m["apf"] = {"Pahanan Agta", 7135432, "phi", Latn}

m["apg"] = {"Ampanang", 4748035, "poz", Latn}

m["aph"] = {"Athpare", 3449126, "sit-kie", {"Deva", "Latn"}}

m["api"] = {"Apiaká", 3507941, "tup-gua", Latn}

m["apj"] = {"Jicarilla", 28277, "apa", Latn}

m["apk"] = {"Plains Apache", 27861, "apa", Latn}

m["apl"] = {"Lipan", 28269, "apa", Latn}

m["apm"] = {"Chiricahua", 13368, "apa", Latn}

m["apn"] = {"Apinayé", 2858311, "sai-nje", Latn}

m["apo"] = {"Ambul", 12627135, "poz-ocw", Latn}

m["app"] = {"Apma", 2669188, "poz-vnc", Latn}

m["apq"] = {"A-Pucikwar", 28466, "qfa-adc", Latn}

m["apr"] = {"Arop-Lokep", 2863482, "poz-ocw", Latn}

m["aps"] = {"Arop-Sissano", 12627242, "poz-ocw", Latn}

m["apt"] = {"Apatani", 56306, "sit-tan", Latn}

m["apu"] = {"Apurinã", 2859081, "awd", Latn}

m["apv"] = {"Alapmunte", 16110782, "sai-nmk", Latn}

m["apw"] = {"Western Apache", 28060, "apa", Latn}

m["apx"] = {"Aputai", 12473343, "poz-tim", Latn}

m["apy"] = {"Apalaí", 2736980, "sai-car", Latn}

m["apz"] = {"Safeyoka", 7398693, "ngf", Latn}

m["aqc"] = {"Archi", 34915, "cau-lzg", Cyrl}

m["aqd"] = {"Ampari Dogon", 4748057, "nic-dgw", Latn}

m["aqg"] = {"Arigidi", 34829, "alv-von", Latn}

m["aqm"] = {"Atohwaim", 11732297, "ngf", Latn}

m["aqn"] = {"Northern Alta", 7058116, "phi", Latn}

m["aqp"] = {"Atakapa", 10975683, "qfa-iso", Latn}

m["aqr"] = {"Arhâ", 4790085, "poz-cln", Latn}

m["aqt"] = {"Angaité", 15736037, "sai-mas", Latn}

m["aqz"] = {"Akuntsu", 4701960, "tup", Latn}

m["arc"] = {
    "Aramaic",
    28602,
    "sem-ara",
    {"Hebr", "Armi", "Syrc", "Palm", "Nbat", "Phnx", "Mand", "Samr", "Hatr"},
    -- varieties are in [[Module:etymology language/data]]
    translit_module = "translit-redirect",
    entry_name = {from = {"[" .. u(0x0591) .. "-" .. u(0x05BD) .. u(0x05BF) .. "-" .. u(0x05C5) .. u(0x05C7) .. "]", "[" .. u(0x0304) .. u(0x0308) .. u(0x0331) .. u(0x0730) .. "-" .. u(0x0748) .. "]"}, to = {}}
}

m["ard"] = {"Arabana", 3507959, "aus-kar", Latn}

m["are"] = {"Western Arrernte", 12645549, "aus-pam", Latn}

m["arh"] = {"Arhuaco", 2640621, "cba", Latn}

m["ari"] = {"Arikara", 56539, "cdd", Latn}

m["arj"] = {"Arapaso", 12627166, "sai-tuc", Latn}

m["ark"] = {"Arikapú", 3446640, "sai-mje", Latn}

m["arl"] = {"Arabela", 2591221, "sai-zap", Latn}

m["arn"] = {"Mapudungun", 33730, "sai-ara", Latn}

m["aro"] = {"Araona", 958414, "sai-tac", Latn}

m["arp"] = {"Arapaho", 56417, "alg-ara", Latn}

m["arq"] = {"Algerian Arabic", 56499, "sem-arb", Arab, entry_name = {from = {u(0x0671), u(0x064B), u(0x064C), u(0x064D), u(0x064E), u(0x064F), u(0x0650), u(0x0651), u(0x0652), u(0x0670), u(0x0640)}, to = {u(0x0627)}}}

m["arr"] = {"Arara-Karo", 35539, "tup", Latn}

m["ars"] = {"Najdi Arabic", 56574, "sem-arb", Arab, entry_name = {from = {u(0x0671), u(0x064B), u(0x064C), u(0x064D), u(0x064E), u(0x064F), u(0x0650), u(0x0651), u(0x0652), u(0x0670), u(0x0640)}, to = {u(0x0627)}}}

m["aru"] = {"Arua", 2746221, "auf", Latn}

m["arv"] = {"Arbore", 56883, "cus", Latn}

m["arw"] = {"Arawak", 2655664, "awd-taa", Latn, ancestors = {"awd-taa-pro"}}

m["arx"] = {"Aruá", 3507907, "tup", Latn}

m["ary"] = {"Moroccan Arabic", 56426, "sem-arb", {"Arab"}, entry_name = {from = {u(0x0671), u(0x064B), u(0x064C), u(0x064D), u(0x064E), u(0x064F), u(0x0650), u(0x0651), u(0x0652), u(0x0670), u(0x0640)}, to = {u(0x0627)}}}

m["arz"] = {"Egyptian Arabic", 29919, "sem-arb", Arab, entry_name = {from = {u(0x0671), u(0x064B), u(0x064C), u(0x064D), u(0x064E), u(0x064F), u(0x0650), u(0x0651), u(0x0652), u(0x0670), u(0x0640)}, to = {u(0x0627)}}}

m["asa"] = {"Pare", 36403, "bnt-par", Latn}

m["asb"] = {"Assiniboine", 2591288, "sio-dkt", Latn}

m["asc"] = {"Casuarina Coast Asmat", 11732046, "ngf", Latn}

m["ase"] = {"American Sign Language", 14759, "sgn", {"Sgnw"}}

m["asf"] = {
    "Auslan", 29525, "sgn", Latn -- when documented
}

m["asg"] = {"Cishingini", 35199, "nic-kam", Latn}

m["ash"] = {"Abishira", 2871740, "qfa-iso", Latn}

m["asi"] = {"Buruwai", 5001031, "ngf", Latn}

m["asj"] = {"Nsari", 36418, "nic-bbe", Latn}

m["ask"] = {"Ashkun", 29379, "nur-sou", {"Arab", "Latn"}}

m["asl"] = {"Asilulu", 12473347, "poz-cma", Latn}

m["asn"] = {"Xingú Asuriní", 8044571, "tup-gua", Latn}

m["aso"] = {"Dano", 5220979, "paa-kag", {"Latn"}}

m["asp"] = {"Algerian Sign Language", 3135421, "sgn"}

m["asq"] = {
    "Austrian Sign Language", 36668, "sgn", Latn -- when documented
}

m["asr"] = {
    "Asuri", 3504321, "mun", Latn -- when documented
}

m["ass"] = {"Ipulo", 35408, "nic-tvc", Latn}

m["ast"] = {"Asturian", 29507, "roa-ibe", Latn, ancestors = {"roa-ole"}}

m["asu"] = {"Tocantins Asurini", 32041490, "tup-gua", Latn}

m["asv"] = {"Asoa", 56296, "csu-maa", Latn}

m["asw"] = {
    "Australian Aboriginal Sign Language", 955216, "sgn", Latn -- when documented
}

m["asx"] = {"Muratayak", 11732766, "ngf-fin", Latn}

m["asy"] = {"Yaosakor Asmat", 16113158, "ngf", Latn}

m["asz"] = {"As", 2866218, "poz-hce", Latn}

m["ata"] = {"Pele-Ata", 56511, "paa", Latn}

m["atb"] = {
    "Zaiwa", 56594, "tbq-brm", Latn -- also Hani?
}

m["atc"] = {"Atsahuaca", 4817730, "sai-pan", Latn}

m["atd"] = {"Ata Manobo", 12627315, "mno", Latn}

m["ate"] = {"Atemble", 4813055, "ngf-mad", Latn}

m["atg"] = {"Okpela", 7082551, "alv-yek", Latn}

m["ati"] = {"Attié", 34844, "alv-lag", Latn}

m["atj"] = {"Atikamekw", 56590, "alg", Latn, ancestors = {"cr"}}

m["atk"] = {"Ati", 4815751, "phi", Latn}

m["atl"] = {"Mount Iraya Agta", 6921430, "phi", Latn}

m["atm"] = {"Ata", 4812603, "phi", Latn}

m["ato"] = {"Atong (Cameroon)", 34824, "nic-grs", Latn}

m["atp"] = {"Pudtol Atta", 12640726, "phi", Latn}

m["atq"] = {"Aralle-Tabulahan", 4783889, "poz-ssw", Latn}

m["atr"] = {"Waimiri-Atroari", 56865, "sai-car", Latn}

m["ats"] = {"Gros Ventre", 56628, "alg-ara", Latn}

m["att"] = {"Pamplona Atta", 12639245, "phi", Latn}

m["atu"] = {"Reel", 7306882, "sdv-dnu", Latn}

m["atv"] = {"Northern Altai", 2640863, "trk-sib", Cyrl, translit_module = "Altai-translit"}

m["atw"] = {"Atsugewi", 56718, "nai-pal", Latn}

m["atx"] = {"Arutani", 56609, nil, Latn}

m["aty"] = {"Aneityum", 2379113, "poz-oce", Latn}

m["atz"] = {"Arta", 3508067, "phi", Latn}

m["aua"] = {"Asumboa", 4811870, "poz-oce", Latn}

m["aub"] = {
    "Alugu", 12626798, "tbq-lol", Latn -- also Hani?
}

m["auc"] = {"Huaorani", 758570, "qfa-iso", Latn}

m["aud"] = {"Anuta", 35326, "poz-pnp", Latn}

m["aug"] = {"Aguna", 34733, "alv-gbe", Latn}

m["auh"] = {"Aushi", 2872082, "bnt-sbi", Latn}

m["aui"] = {"Anuki", 3508132, "poz-ocw", Latn}

m["auj"] = {"Awjila", 56398, "ber", {"Latn", "Arab", "Tfng"}}

m["auk"] = {"Heyo", 3504295, "qfa-tor", Latn}

m["aul"] = {"Aulua", 427300, "poz-vnc", Latn}

m["aum"] = {"Asu", 34798, "alv-ngb", Latn}

m["aun"] = {"Molmo One", 12637224, "qfa-tor", Latn}

m["auo"] = {"Auyokawa", 56247, "cdc-wst", Latn}

m["aup"] = {"Makayam", 6738863, "ngf", Latn}

m["auq"] = {"Anus", 23855, "poz-ocw", Latn}

m["aur"] = {"Aruek", 3504279, "qfa-tor", Latn}

m["aut"] = {"Austral", 2669261, "poz-pep", Latn}

m["auu"] = {"Auye", 4827334, "ngf", Latn}

m["auw"] = {"Awyi", 3513326, "paa-brd", Latn}

m["aux"] = {"Aurá", 3507995, "tup-gua", Latn}

m["auy"] = {"Auyana", 2873211, "paa-kag", Latn}

m["auz"] = {"Uzbeki Arabic", 3399507, "sem-arb", Arab}

m["avb"] = {"Avau", 12627412, "poz-ocw", Latn}

m["avd"] = {"Alviri-Vidari", 3327357, "xme", {"fa-Arab"}, ancestors = {"xme-mid"}}

m["avi"] = {"Avikam", 34840, "alv-lag", Latn}

m["avk"] = {"Kotava", 1377116, "art", Latn, type = "appendix-constructed"}

m["avm"] = {"Angkamuthi", nil, "aus-pmn", Latn}

m["avn"] = {"Avatime", 34796, "alv-ktg", Latn}

m["avo"] = {"Agavotaguerra", 3508007, "awd", Latn}

m["avs"] = {"Aushiri", 3409318, "sai-zap", Latn}

m["avt"] = {"Au", 3446608, "qfa-tor", Latn}

m["avu"] = {"Avokaya", 56685, "csu-mma", Latn}

m["avv"] = {"Avá-Canoeiro", 4829584, "tup-gua", Latn}

m["awa"] = {"Awadhi", 29579, "inc-hie", {"Deva", "Kthi", "fa-Arab"}, ancestors = {"inc-pra"}, translit_module = "hi-translit"}

m["awb"] = {"Awa (New Guinea)", 2874650, "paa-kag", Latn}

m["awc"] = {"Cicipu", 35193, "nic-kam", Latn}

m["awe"] = {"Awetí", 4830038, "tup", Latn}

m["awg"] = {"Anguthimri", 4764288, "aus-pam", Latn}

m["awh"] = {"Awbono", 3446684, "ngf", Latn}

m["awi"] = {"Aekyom", 3399691, "ngf", Latn}

m["awk"] = {"Awabakal", 3449138, "aus-pam", Latn}

m["awm"] = {"Arawum", 4784537, "ngf-mad", Latn}

m["awn"] = {"Awngi", 34934, "cus", {"Ethi"}}

m["awo"] = {"Awak", 3446643, "alv-wjk", Latn}

m["awr"] = {"Awera", 56379, "paa-lkp", Latn}

m["aws"] = {"South Awyu", 12633986, "ngf", Latn}

m["awt"] = {"Araweté", 4784535, "tup-gua", Latn}

m["awu"] = {"Central Awyu", 12628801, "ngf", Latn}

m["awv"] = {"Jair Awyu", 16110177, "ngf", Latn}

m["aww"] = {"Awun", 56369, "paa-spk", Latn}

m["awx"] = {"Awara", 2874670, "ngf-fin", Latn}

m["awy"] = {"Edera Awyu", 12630425, "ngf", Latn}

m["axb"] = {"Abipon", 11252539, "sai-guc", Latn}

m["axe"] = {"Ayerrerenge", 16112737, "aus-pam", Latn}

m["axg"] = {"Mato Grosso Arára", 3446660, nil, Latn}

m["axk"] = {"Aka (Central Africa)", 11010149, "bnt-ngn", Latn}

m["axl"] = {"Lower Southern Aranda", 6693295, "aus-pam", Latn}

m["axm"] = {"Middle Armenian", 4438498, "hyx", {"Armn"}, ancestors = {"xcl"}, translit_module = "Armn-translit", override_translit = true, entry_name = {from = {"և", "՞", "՜", "՛", "՟"}, to = {"եւ"}}}

m["axx"] = {"Xaragure", 8045635, "poz-cln", Latn}

m["aya"] = {"Awar", 56876, "paa", Latn}

m["ayb"] = {"Ayizo", 34841, "alv-pph", Latn}

m["ayd"] = {"Ayabadhu", 3509164, "aus-pmn", Latn}

m["aye"] = {"Ayere", 34788, "alv-aah", Latn}

m["ayg"] = {"Nyanga (Togo)", 35446, "alv-gng", Latn}

m["ayi"] = {"Leyigha", 3914492, "nic-uce", Latn}

m["ayk"] = {"Akuku", 3450179, "alv-nwd", Latn}

m["ayl"] = {"Libyan Arabic", 56503, "sem-arb", Arab, entry_name = {from = {u(0x0671), u(0x064B), u(0x064C), u(0x064D), u(0x064E), u(0x064F), u(0x0650), u(0x0651), u(0x0652), u(0x0670), u(0x0640)}, to = {u(0x0627)}}}

m["ayn"] = {"Yemeni Arabic", 1686766, "sem-arb", Arab, entry_name = {from = {u(0x0671), u(0x064B), u(0x064C), u(0x064D), u(0x064E), u(0x064F), u(0x0650), u(0x0651), u(0x0652), u(0x0670), u(0x0640)}, to = {u(0x0627)}}}

m["ayo"] = {"Ayoreo", 56634, "sai-zam", Latn}

m["ayp"] = {"North Mesopotamian Arabic", 56577, "sem-arb", Arab, ancestors = {"acm"}, entry_name = {from = {u(0x0671), u(0x064B), u(0x064C), u(0x064D), u(0x064E), u(0x064F), u(0x0650), u(0x0651), u(0x0652), u(0x0670), u(0x0640)}, to = {u(0x0627)}}}

m["ayq"] = {"Ayi", 56449, "paa-spk", Latn}

m["ays"] = {"Sorsogon Ayta", 7563752, "phi", Latn}

m["ayt"] = {"Bataan Ayta", 4921648, "phi", Latn}

m["ayu"] = {"Ayu", 34786, "alv", Latn}

m["ayy"] = {"Tayabas Ayta", 7689745, "phi", Latn}

m["ayz"] = {"Maybrat", 4830892, "paa-wpa", Latn}

m["aza"] = {"Azha", 4832486, "tbq-lol", Latn}

m["azd"] = {"Eastern Durango Nahuatl", 16115449, "azc-nah", Latn}

m["azg"] = {"San Pedro Amuzgos Amuzgo", 35092, "omq", Latn}

m["azm"] = {"Ipalapa Amuzgo", 12633013, "omq", Latn}

m["azn"] = {"Western Durango Nahuatl", 12645553, "azc-nah", Latn}

m["azo"] = {"Awing", 34856, "nic-nge", Latn}

m["azt"] = {"Faire Atta", 12630884, "phi", Latn}

m["azz"] = {"Highland Puebla Nahuatl", 12953754, "azc-nah", Latn}

return m
