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

m["aaa"] = {"Ghotuo", 35463, "alv-yek", scripts = Latn}

m["aab"] = {"Alumu-Tesu", 35034, "nic-alu", scripts = Latn}

m["aac"] = {"Ari", 1811224, "paa-pag", scripts = Latn}

m["aad"] = {"Amal", 56708, "paa-iwm", scripts = Latn}

-- "aae" IS TREATED AS "sq", SEE WT:LT

m["aaf"] = {"Aranadan", 3507928, "dra", scripts = {"Mlym"}}

m["aag"] = {"Ambrak", 4741706, "qfa-tor", scripts = Latn}

m["aah"] = {"Abu' Arapesh", 4670715, "qfa-tor", scripts = Latn}

m["aai"] = {"Arifama-Miniafia", 4790560, "poz-ocw", scripts = Latn}

m["aak"] = {"Ankave", 3446690, "ngf", scripts = Latn}

m["aal"] = {"Afade", 56434, "cdc-cbm", scripts = Latn}

m["aan"] = {"Anambé", 3507873, "tup-gua", scripts = Latn}

m["aap"] = {"Pará Arára", 56807, "sai-car", scripts = Latn}

m["aaq"] = {"Penobscot", 3515185, "alg-abp", scripts = Latn}

m["aas"] = {"Aasax", 56620, "cus", scripts = Latn}

-- "aat" IS TREATED AS "sq", SEE WT:LT

m["aau"] = {"Abau", 3073568, "paa-spk", scripts = Latn}

m["aaw"] = {"Solong", 7558834, "poz-ocw", scripts = Latn}

m["aax"] = {"Mandobo Atas", 12636156, "ngf", scripts = Latn}

m["aaz"] = {"Amarasi", 4740192, "poz-tim", scripts = Latn}

m["aba"] = {"Abé", 34833, "alv-lag", scripts = Latn}

m["abb"] = {"Bankon", 34860, "bnt-bsa", scripts = Latn}

m["abc"] = {"Ambala Ayta", 3448896, "phi", scripts = Latn}

m["abd"] = {"Camarines Norte Agta", 3399682, "phi", scripts = Latn}

m["abe"] = {"Abenaki", 17502788, "alg-abp", scripts = Latn}

m["abf"] = {"Abai Sungai", 4663287, "poz-san", scripts = Latn}

m["abg"] = {"Abaga", 3507954, "paa-kag", scripts = Latn}

m["abh"] = {"Tajiki Arabic", 56833, "sem-arb", scripts = Arab}

m["abi"] = {"Abidji", 34781, "alv-lag", scripts = Latn}

m["abj"] = {"Aka-Bea", 2356391, "qfa-ads", scripts = Latn}

m["abl"] = {"Abung", 49215, "poz-lgx", scripts = Latn}

m["abm"] = {"Abanyom", 7502, "nic-eko", scripts = Latn}

m["abn"] = {"Abua", 34835, "nic-cde", scripts = Latn}

m["abo"] = {"Abon", 35121, "nic-tvn", scripts = Latn}

m["abp"] = {"Abenlen Ayta", 3436621, "phi", scripts = Latn}

m["abq"] = {"Abaza", 27567, "cau-abz", scripts = Cyrl, translit_module = "abq-translit", override_translit = true}

m["abr"] = {"Abron", 34831, "alv-ctn", ancestors = {"ak"}, scripts = Latn}

m["abs"] = {"Ambonese Malay", 3124354, "crp", ancestors = {"ms"}, scripts = Latn}

m["abt"] = {"Ambulas", 3508015, "paa-spk", scripts = Latn}

m["abu"] = {"Abure", 34767, "alv-ptn", scripts = Latn}

m["abv"] = {"Baharna Arabic", 56576, "sem-arb", scripts = Arab, entry_name = {from = {u(0x0671), u(0x064B), u(0x064C), u(0x064D), u(0x064E), u(0x064F), u(0x0650), u(0x0651), u(0x0652), u(0x0670), u(0x0640)}, to = {u(0x0627)}}}

m["abw"] = {"Pal", 7126121, "ngf-mad", scripts = Latn}

m["abx"] = {"Inabaknon", 2820163, "poz-sbj", scripts = Latn}

m["aby"] = {"Aneme Wake", 3508107, "ngf", scripts = Latn}

m["abz"] = {"Abui", 2822110, "qfa-tap", scripts = Latn}

m["aca"] = {"Achagua", 2822982, "awd", scripts = Latn}

m["acb"] = {"Áncá", 11130787, "nic-mom", scripts = Latn}

m["acd"] = {"Gikyode", 35256, "alv-gng", scripts = Latn}

m["ace"] = {
    "Acehnese",
    27683,
    "cmc",
    scripts = {"Latn", "ms-Arab"},
    standardChars = "A-Za-z0-9ÈÉËÔÖèéëôö" .. PUNCTUATION -- current orthography (not yet add Arab)
}

m["ach"] = {"Acholi", 34926, "sdv-los", scripts = Latn}

m["aci"] = {"Aka-Cari", 2670418, "qfa-adn", scripts = Latn}

m["ack"] = {"Aka-Kora", 3433680, "qfa-adn", scripts = Latn}

m["acl"] = {"Akar-Bale", 3436825, "qfa-ads", scripts = Latn}

m["acm"] = {"Iraqi Arabic", 56232, "sem-arb", scripts = Arab, entry_name = {from = {u(0x0671), u(0x064B), u(0x064C), u(0x064D), u(0x064E), u(0x064F), u(0x0650), u(0x0651), u(0x0652), u(0x0670), u(0x0640)}, to = {u(0x0627)}}}

m["acn"] = {"Achang", 56582, "tbq-brm", scripts = Latn}

m["acp"] = {"Eastern Acipa", 5329945, "nic-kmk", scripts = Latn}

m["acr"] = {"Achi", 34774, "myn", scripts = Latn}

m["acs"] = {"Acroá", 2829146, "sai-cje", scripts = Latn}

m["acu"] = {"Achuar", 2823170, "sai-jiv", scripts = Latn}

m["acv"] = {"Achumawi", 56661, "nai-pal", scripts = Latn}

m["acw"] = {"Hijazi Arabic", 56608, "sem-arb", scripts = Arab, entry_name = {from = {u(0x0671), u(0x064B), u(0x064C), u(0x064D), u(0x064E), u(0x064F), u(0x0650), u(0x0651), u(0x0652), u(0x0670), u(0x0640)}, to = {u(0x0627)}}}

m["acx"] = {"Omani Arabic", 56630, "sem-arb", scripts = Arab, entry_name = {from = {u(0x0671), u(0x064B), u(0x064C), u(0x064D), u(0x064E), u(0x064F), u(0x0650), u(0x0651), u(0x0652), u(0x0670), u(0x0640)}, to = {u(0x0627)}}}

m["acy"] = {"Cypriot Arabic", 56416, "sem-arb", scripts = Arab, ancestors = {"acm"}}

m["acz"] = {"Acheron", 34769, "alv-tal", scripts = Latn}

m["ada"] = {"Adangme", 35141, "alv-gda", scripts = Latn}

m["adb"] = { -- rename or remove, see RFM
    "Adabe",
    36872,
    scripts = Latn
}

m["add"] = {"Dzodinka", 35266, "nic-nka", scripts = Latn}

m["ade"] = {"Adele", 27740, "alv-ntg", scripts = Latn}

m["adf"] = {"Dhofari Arabic", 56565, "sem-arb", scripts = Arab, entry_name = {from = {u(0x0671), u(0x064B), u(0x064C), u(0x064D), u(0x064E), u(0x064F), u(0x0650), u(0x0651), u(0x0652), u(0x0670), u(0x0640)}, to = {u(0x0627)}}}

m["adg"] = {"Andegerebinha", 3508123, "aus-pam", scripts = Latn}

m["adh"] = {"Adhola", 1971400, "sdv-los", scripts = Latn}

m["adi"] = {"Adi", 56440, "sit-tan", scripts = Latn}

m["adj"] = {"Adioukrou", 34738, "alv-lag", scripts = Latn}

m["adl"] = {"Galo", 2857892, "sit-tan", scripts = Latn}

m["adn"] = {"Adang", 3398276, "qfa-tap", scripts = Latn}

m["ado"] = {"Abu", 56659, "paa-ram", scripts = Latn}

m["adp"] = {
    "Adap",
    3512402,
    "sit-tib",
    scripts = {"Tibt"},
    ancestors = {"dz"},
    wikipedia_article = "Dzongkha" -- Considered a dialect of Dzongkha
}

m["adq"] = {"Adangbe", 34730, "alv-gda", ancestors = {"ada"}, scripts = Latn}

m["adr"] = {"Adonara", 4684505, "poz-cet", scripts = Latn}

m["ads"] = {
    "Adamorobe Sign Language",
    27709,
    "sgn",
    scripts = Latn -- when documented
}

m["adt"] = {"Adnyamathanha", 2225391, "aus-psw", scripts = Latn}

m["adu"] = {"Aduge", 34734, "alv-nwd", ancestors = {"opa"}, scripts = Latn, wikipedia_article = "Okpamheri language"}

m["adw"] = {"Amondawa", 12626847, "tup-gua", scripts = Latn}

m["ady"] = {"Adyghe", 27776, "cau-cir", scripts = Cyrl, translit_module = "ady-translit", override_translit = true}

m["adz"] = {"Adzera", nil, "poz-ocw", scripts = Latn}

m["aea"] = {"Areba", 3509129, "aus-pam", scripts = Latn}

m["aeb"] = {"Tunisian Arabic", 56240, "sem-arb", scripts = Arab, entry_name = {from = {u(0x0671), u(0x064B), u(0x064C), u(0x064D), u(0x064E), u(0x064F), u(0x0650), u(0x0651), u(0x0652), u(0x0670), u(0x0640)}, to = {u(0x0627)}}}

m["aed"] = {
    "Argentine Sign Language",
    3322073,
    "sgn",
    scripts = Latn -- when documented
}

m["aee"] = {"Northeast Pashayi", 12642198, "inc-dar", scripts = Latn}

m["aek"] = {"Haeke", 5638166, "poz-cln", scripts = Latn}

m["ael"] = {"Ambele", 34818, "nic-grf", scripts = Latn}

m["aem"] = {"Arem", 3507920, "mkh-vie", scripts = Latn}

m["aen"] = {"Armenian Sign Language", 3446604, "sgn"}

m["aeq"] = {"Aer", 3246741, "inc-wes", scripts = Arab, ancestors = {"inc-gup"}}

m["aer"] = {"Eastern Arrernte", 10728232, "aus-pam", scripts = Latn}

m["aes"] = {"Alsea", 2395641, scripts = Latn}

m["aeu"] = {"Akeu", 4700657, "tbq-lol", scripts = Latn}

m["aew"] = {"Ambakich", 56642, "paa-ram", scripts = Latn}

m["aey"] = {"Amele", 3508025, "ngf-mad", scripts = Latn}

m["aez"] = {
    "Aeka",
    16110528,
    "ngf",
    scripts = Latn,
    wikipedia_article = "Orokaiva language" -- subvariety?
}

m["afb"] = {"Gulf Arabic", 56385, "sem-arb", scripts = Arab, entry_name = {from = {u(0x0671), u(0x064B), u(0x064C), u(0x064D), u(0x064E), u(0x064F), u(0x0650), u(0x0651), u(0x0652), u(0x0670), u(0x0640)}, to = {u(0x0627)}}}

m["afd"] = {"Andai", 4753480, "paa-arf", scripts = Latn}

m["afe"] = {"Putukwam", 3914930, "nic-ben", scripts = Latn}

m["afg"] = {"Afghan Sign Language", 4689093, "sgn"}

m["afh"] = {"Afrihili", 384707, "art", scripts = Latn, type = "appendix-constructed"}

m["afi"] = {"Akrukay", 57003, "paa-ram", scripts = Latn}

m["afk"] = {"Nanubae", 6964416, "paa-arf", scripts = Latn}

m["afn"] = {"Defaka", 35174, "nic", scripts = Latn}

m["afo"] = {"Eloyi", 3914066, "nic-plt", scripts = Latn}

m["afp"] = {"Tapei", 16887371, "paa-arf", scripts = Latn}

m["afs"] = {"Afro-Seminole Creole", 27867, "crp", ancestors = {"en"}, scripts = Latn}

m["aft"] = {"Afitti", 3400829, "sdv-nyi", scripts = Latn}

m["afu"] = {"Awutu", 34847, "alv-gng", scripts = Latn}

m["afz"] = {"Obokuitai", 7075258, "paa-lkp", scripts = Latn}

m["aga"] = {"Aguano", 3331203, scripts = Latn}

m["agb"] = {"Legbo", 35584, "nic-uce", scripts = Latn}

m["agc"] = {"Agatu", 34732, "alv-ido", scripts = Latn}

m["agd"] = {"Agarabi", 3399642, "paa-kag", scripts = Latn}

m["age"] = {"Angal", 10951553, "paa-eng", scripts = Latn}

m["agf"] = {"Arguni", 12473346, "poz-cet", scripts = Latn}

m["agg"] = {"Angor", 3508100, "paa", scripts = Latn}

m["agh"] = {"Ngelima", 7022266, "bnt-bta", scripts = Latn}

m["agi"] = {"Agariya", 663586, "mun", scripts = Deva}

m["agj"] = {"Argobba", 29292, "sem-eth", scripts = {"Ethi"}}

m["agk"] = {"Isarog Agta", 6078982, "phi", scripts = Latn}

m["agl"] = {"Fembe", 372927, "ngf", scripts = Latn}

m["agm"] = {"Angaataha", 3508001, "ngf", scripts = Latn}

m["agn"] = {"Agutaynen", 3399717, "phi-kal", scripts = Latn}

m["ago"] = {"Tainae", 7676186, "ngf", scripts = Latn}

m["agq"] = {"Aghem", 34737, "nic-rnw", scripts = Latn}

m["agr"] = {"Aguaruna", 1526530, "sai-jiv", scripts = Latn}

m["ags"] = {"Esimbi", 35260, "nic-bds", scripts = Latn}

m["agt"] = {"Central Cagayan Agta", 5017296, "phi", scripts = Latn}

m["agu"] = {"Aguacateca", 35091, "myn", scripts = Latn}

m["agv"] = {"Remontado Agta", 3508085, "phi", scripts = Latn}

m["agw"] = {"Kahua", 3191906, "poz-sls", scripts = Latn}

m["agx"] = {"Aghul", 36498, "cau-lzg", scripts = Cyrl}

m["agy"] = {"Southern Alta", 7569611, "phi", scripts = Latn}

m["agz"] = {"Mount Iriga Agta", 6921432, "phi", scripts = Latn}

m["aha"] = {"Ahanta", 34729, "alv-ctn", scripts = Latn}

m["ahb"] = {"Axamb", 2874710, "poz-vnc", scripts = Latn}

m["ahg"] = {"Qimant", 35663, "cus", scripts = Latn}

m["ahh"] = {"Aghu", 3436645, "ngf", scripts = Latn}

m["ahi"] = {"Tiagbamrin Aizi", 3400073, "kro-aiz", scripts = Latn}

m["ahk"] = {"Akha", 56643, "tbq-lol", scripts = {"Latn", "Mymr", "Thai"}, sort_key = {from = {"[%pๆ]", "[็-๎]", "([เแโใไ])([ก-ฮ])"}, to = {"", "", "%2%1"}}}

m["ahl"] = {"Igo", 35412, "alv-ktg", scripts = Latn}

m["ahm"] = {"Mobumrin Aizi", 35967, "kro-aiz", scripts = Latn}

m["ahn"] = {"Àhàn", 34723, "alv-aah", scripts = Latn}

m["aho"] = {"Ahom", 34778, "tai-swe", scripts = {"Ahom"}, translit_module = "Ahom-translit"}

m["ahp"] = {"Aproumu Aizi", 34810, "alv-kwa", scripts = Latn}

m["ahr"] = {"Ahirani", 15549890, "inc-wes", scripts = Deva, ancestors = {"psu"}}

m["ahs"] = {"Ashe", 34823, "nic-plc", scripts = Latn}

m["aht"] = {"Ahtna", 21058, "ath-nor", scripts = Latn}

m["aia"] = {"Arosi", 2863483, "poz-sls", scripts = Latn}

m["aib"] = {"Aynu", 27927, "trk-kar", scripts = {"Arab", "Latn"}}

m["aic"] = {"Ainbai", 3332149, "paa-brd", scripts = Latn}

m["aid"] = {"Alngith", 3279409, "aus-pmn", scripts = Latn}

m["aie"] = {"Amara", 2841180, "poz-ocw", scripts = Latn}

m["aif"] = {"Agi", 3331491, "qfa-tor", scripts = Latn}

m["aig"] = {"Antigua and Barbuda Creole English", 3244184, "crp", ancestors = {"en"}, scripts = Latn}

m["aih"] = {"Ai-Cham", 2827749, "qfa-kms", scripts = {"Latn", "Hani"}}

m["aii"] = {"Assyrian Neo-Aramaic", 29440, "sem-nna", scripts = {"Syrc"}, entry_name = {from = {"[" .. u(0x0304) .. u(0x0308) .. u(0x0331) .. u(0x0730) .. "-" .. u(0x0748) .. "]"}, to = {}}}

m["aij"] = {"Lishanid Noshan", 3436467, "sem-nna", scripts = {"Hebr"}}

m["aik"] = {"Ake", 34808, "nic-pls", scripts = Latn}

m["ail"] = {"Aimele", 3327418, "ngf", scripts = Latn}

m["aim"] = {"Aimol", 4697175, "tbq-kuk", scripts = {"Latn", "Beng"}}

m["ain"] = {"Ainu", 27969, "qfa-iso", scripts = {"Kana", "Latn", "Cyrl"}}

m["aio"] = {
    "Aiton",
    3399725,
    "tai-swe",
    scripts = {"Mymr"},
    entry_name = {
        from = {u(0xFE00)}, -- VS01
        to = {""}
    }
}

m["aip"] = {"Burumakok", 5000984, "ngf-okk", scripts = Latn}

m["air"] = {"Airoran", 3321131, "paa-tkw", scripts = Latn}

m["ait"] = {"Arikem", 3446679, "tup", scripts = Latn}

m["aiw"] = {"Aari", 7495, "omv-aro", scripts = Latn}

m["aix"] = {"Aighon", 3504287, "poz-ocw", scripts = Latn}

m["aiy"] = {"Ali", 34814, "alv-gbf", scripts = Latn}

m["aja"] = {"Aja", 3237491, "csu-bkr", scripts = Latn}

m["ajg"] = {"Adja", 35035, "alv-gbe", scripts = Latn}

m["aji"] = {"Ajië", 2828867, "poz-cln", scripts = Latn}

m["ajn"] = {"Andajin", 16111302, "aus-wor", scripts = Latn}

m["ajp"] = {"South Levantine Arabic", nil, "sem-arb", scripts = Arab, entry_name = {from = {u(0x0671), u(0x064B), u(0x064C), u(0x064D), u(0x064E), u(0x064F), u(0x0650), u(0x0651), u(0x0652), u(0x0670), u(0x0640)}, to = {u(0x0627)}}}

m["ajt"] = {"Judeo-Tunisian Arabic", 56597, "sem-arb", scripts = {"Hebr"}, ancestors = {"jrb"}}

m["aju"] = {"Judeo-Moroccan Arabic", 56595, "sem-arb", scripts = {"Hebr"}, ancestors = {"jrb"}}

m["ajw"] = {"Ajawa", 56645, "cdc-wst", scripts = Latn}

m["ajz"] = {"Amri Karbi", 3508092, "tbq-kuk", scripts = Latn, ancestors = {"mjw"}}

m["akb"] = {"Angkola Batak", 2640686, "btk", scripts = {"Latn", "Batk"}}

m["akc"] = {"Mpur", 3327139, "paa-wpa", scripts = Latn}

m["akd"] = {"Ukpet-Ehom", 36618, "nic-ucr", scripts = Latn}

m["ake"] = {"Akawaio", 28059, "sai-car", scripts = Latn}

m["akf"] = {"Akpa", 34801, "alv-ido", scripts = Latn}

m["akg"] = {"Anakalangu", 4750964, "poz-cet", scripts = Latn}

m["akh"] = {"Angal Heneng", 10950354, "paa-eng", scripts = Latn}

m["aki"] = {"Aiome", 56735, "paa", scripts = Latn}

m["akj"] = {"Jeru", 2919121, "qfa-adn", scripts = {"Latn", "Deva"}}

m["akk"] = {"Akkadian", 35518, "sem-eas", scripts = {"Xsux", "Latn"}}

m["akl"] = {"Aklanon", 8773, "phi", scripts = Latn}

m["akm"] = {"Aka-Bo", 35361, "qfa-adn", scripts = Latn}

m["ako"] = {"Akurio", 56650, "sai-car", scripts = Latn}

m["akp"] = {"Siwu", 36470, "alv-ntg", scripts = Latn}

m["akq"] = {"Ak", 56654, "paa", scripts = Latn}

m["akr"] = {"Araki", 2699882, "poz-vnc", scripts = Latn}

m["aks"] = {"Akaselem", 34817, "nic-grm", scripts = Latn}

m["akt"] = {"Akolet", 3330162, "poz-ocw", scripts = Latn}

m["aku"] = {"Akum", 34799, "nic-ykb", scripts = Latn}

m["akv"] = {"Akhvakh", 56423, "cau-ava", scripts = Cyrl}

m["akw"] = {"Akwa", 34802, "bnt-mbo", scripts = Latn}

m["akx"] = {"Aka-Kede", 3436816, "qfa-adc", scripts = Latn}

m["aky"] = {"Aka-Kol", 3436784, "qfa-adc", scripts = Latn}

m["akz"] = {"Alabama", 1815020, "nai-mus", scripts = Latn}

m["ala"] = {"Alago", 34813, "alv-ido", scripts = Latn}

m["alc"] = {"Kawésqar", 56544, "aqa", scripts = Latn}

m["ald"] = {"Alladian", 34837, "alv-lag", scripts = Latn}

m["ale"] = {"Aleut", 27210, "esx", scripts = Latn}

m["alf"] = {"Alege", 34815, "nic-ben", scripts = Latn}

m["alh"] = {"Alawa", 2147917, "aus-gun", scripts = Latn}

m["ali"] = {"Amaimon", 3327427, "ngf-mad", scripts = Latn}

m["alj"] = {"Alangan", 3327423, "phi", scripts = Latn}

m["alk"] = {"Alak", 2714690, "mkh", scripts = Latn}

m["all"] = {"Allar", 3393634, "dra", scripts = {"Mlym"}}

-- "aln" IS TREATED AS "sq", SEE WT:LT

m["alm"] = {"Amblong", 11022615, "poz-vnc", scripts = Latn}

m["alo"] = {"Larike-Wakasihu", 3217929, "poz-cma", scripts = Latn}

m["alp"] = {"Alune", 3327367, "poz-cet", scripts = Latn}

m["alq"] = {"Algonquin", 28092, "alg", ancestors = {"oj"}, scripts = Latn}

m["alr"] = {"Alutor", 28213, "qfa-cka", scripts = Cyrl}

m["alt"] = {"Southern Altai", 1991779, "trk-sib", scripts = Cyrl, translit_module = "Altai-translit"}

m["alu"] = {"'Are'are", 5160, "poz-sls", scripts = Latn}

m["alw"] = {"Alaba", 56652, "cus", scripts = Latn}

m["alx"] = {"Amol", 3504260, "qfa-tor", scripts = Latn}

m["aly"] = {"Alyawarr", 3327389, "aus-pam", scripts = Latn}

m["alz"] = {"Alur", 56507, "sdv-los", scripts = Latn}

m["ama"] = {"Amanayé", 3508053, "tup-gua", scripts = Latn}

m["amb"] = {"Ambo", 3450142, "nic-tvn", scripts = Latn}

m["amc"] = {"Amahuaca", 2669150, "sai-pan", scripts = Latn}

m["ame"] = {"Yanesha'", 3088540, "awd", scripts = Latn}

m["amf"] = {"Hamer-Banna", 35764, "omv-aro", scripts = Latn}

m["amg"] = {"Amurdag", 3360016, "aus-wdj", scripts = Latn}

m["ami"] = {"Amis", 35132, "map", scripts = Latn}

m["amj"] = {"Amdang", 28335, "ssa-fur", scripts = Latn}

m["amk"] = {"Ambai", 1875885, "poz-hce", scripts = Latn}

m["aml"] = {"War-Jaintia", 56321, "aav-khs", scripts = Latn}

m["amm"] = {"Ama", 3446626, "qfa-mal", scripts = Latn}

m["amn"] = {"Amanab", 3327399, "paa-brd", scripts = Latn}

m["amo"] = {"Amo", 34826, "nic-kne", scripts = Latn}

m["amp"] = {"Alamblak", 56688, "paa", scripts = Latn}

m["amq"] = {"Amahai", 3327384, "poz-cma", scripts = Latn}

m["amr"] = {"Amarakaeri", 35128, "sai-har", scripts = Latn}

m["ams"] = {"Southern Amami-Oshima", 2840986, "jpx-ryu", scripts = {"Jpan"}}

m["amt"] = {"Amto", 56517, "paa-asa", scripts = Latn}

m["amu"] = {"Guerrero Amuzgo", 3501942, "omq", scripts = Latn}

m["amv"] = {"Ambelau", 2669214, "poz-cma", scripts = Latn}

m["amw"] = {"Western Neo-Aramaic", 34226, "sem-arw", scripts = {"Armi", "Syrc", "Latn"}}

m["amx"] = {"Anmatyerre", 10412317, "aus-pam", scripts = Latn}

m["amy"] = {"Ami", 12626835, "aus-dal", scripts = Latn}

m["amz"] = {"Atampaya", 3446651, "aus-pam", scripts = Latn}

m["ana"] = {"Andaqui", 2846078, scripts = Latn}

m["anb"] = {"Andoa", 2846171, "sai-zap", scripts = Latn}

m["anc"] = {"Ngas", 35999, "cdc-wst", scripts = Latn}

m["and"] = {"Ansus", 3513300, "poz-hce", scripts = Latn}

m["ane"] = {"Xârâcùù", 3571097, "poz-cln", scripts = Latn}

m["anf"] = {"Animere", 34783, "alv-ktg", scripts = Latn}

m["ang"] = {
    "Old English",
    42365,
    "gmw",
    scripts = {"Latinx", "Runr"},
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

m["anh"] = {"Nend", 6991554, "ngf-mad", scripts = Latn}

m["ani"] = {"Andi", 34849, "cau-ava", scripts = Cyrl}

m["anj"] = {"Anor", 56458, "paa", scripts = Latn}

m["ank"] = {"Goemai", 35272, "cdc-wst", scripts = Latn}

m["anl"] = {"Anu", 4777679, "sit-mru", scripts = Latn}

m["anm"] = {"Anal", 56235, "tbq-kuk", scripts = Latn}

m["ann"] = {"Obolo", 36614, "nic-lcr", scripts = Latn}

m["ano"] = {"Andoque", 2669225, "qfa-iso", scripts = Latn}

m["anp"] = {"Angika", 28378, "inc-eas", scripts = Deva, ancestors = {"bh"}}

m["anq"] = {"Jarawa", 2475526, "qfa-ong", scripts = Latn}

m["anr"] = {"Andh", 4754314, "inc-sou", scripts = Deva, ancestors = {"pmh"}}

m["ans"] = {"Anserma", 3446613, "sai-chc", scripts = Latn}

m["ant"] = {"Antakarinya", 921304, "aus-psw", scripts = Latn}

m["anu"] = {"Anuak", 56677, "sdv-lon", scripts = Latn}

m["anv"] = {"Denya", 35187, "nic-mam", scripts = Latn}

m["anw"] = {"Anaang", 2845320, "nic-ief", scripts = Latn}

m["anx"] = {"Andra-Hus", 2846195, "poz-aay", scripts = Latn}

m["any"] = {"Anyi", 28395, "alv-ctn", scripts = Latn}

m["anz"] = {"Anem", 56512, "paa", scripts = Latn}

m["aoa"] = {"Angolar", 34994, "crp", scripts = Latn, ancestors = {"pt"}}

m["aob"] = {"Abom", 3446647, "ngf", scripts = Latn}

m["aoc"] = {"Pemon", 10729616, "sai-car", scripts = Latn}

m["aod"] = {"Andarum", 3507888, "paa", scripts = Latn}

m["aoe"] = {"Angal Enen", 10951638, "paa-eng", scripts = Latn}

m["aof"] = {"Bragat", 3507977, "qfa-tor", scripts = Latn}

m["aog"] = {
    "Angoram",
    56366, -- cf 6754745 for merged dialect
    "paa-lsp",
    scripts = Latn
}

m["aoi"] = {"Anindilyakwa", 2714654, "aus-arn", scripts = Latn}

m["aoj"] = {"Mufian", 3507881, "qfa-tor", scripts = Latn}

m["aok"] = {"Arhö", 4790086, "poz-cln", scripts = Latn}

m["aol"] = {"Alor", 3332062, "poz", scripts = Latn}

m["aom"] = {"Ömie", 8078975, "ngf", scripts = Latn}

m["aon"] = {"Bumbita Arapesh", 3508044, "qfa-tor", scripts = Latn}

m["aor"] = {"Aore", 12627129, "poz-vnc", scripts = Latn}

m["aos"] = {"Taikat", 7676018, "paa-brd", scripts = Latn}

m["aot"] = {"Atong (India)", 5646, "tbq-bdg", scripts = {"Latn", "Beng"}}

m["aou"] = {
    "A'ou",
    16109994,
    "qfa-gel",
    scripts = Latn, -- also Hani?
    wikipedia_article = "Gelao language" -- might change, as A'ou is a dialect of Gelao
}

m["aox"] = {"Atorada", 3507932, "awd", scripts = Latn}

m["aoz"] = {"Uab Meto", 3441962, "poz-tim", scripts = Latn}

m["apb"] = {"Sa'a", 36294, "poz-sls", scripts = Latn}

m["apc"] = {"North Levantine Arabic", 22809485, "sem-arb", scripts = Arab, entry_name = {from = {u(0x0671), u(0x064B), u(0x064C), u(0x064D), u(0x064E), u(0x064F), u(0x0650), u(0x0651), u(0x0652), u(0x0670), u(0x0640)}, to = {u(0x0627)}}}

m["apd"] = {"Sudanese Arabic", 56573, "sem-arb", scripts = Arab, entry_name = {from = {u(0x0671), u(0x064B), u(0x064C), u(0x064D), u(0x064E), u(0x064F), u(0x0650), u(0x0651), u(0x0652), u(0x0670), u(0x0640)}, to = {u(0x0627)}}}

m["ape"] = {"Bukiyip", 3507895, "qfa-tor", scripts = Latn}

m["apf"] = {"Pahanan Agta", 7135432, "phi", scripts = Latn}

m["apg"] = {"Ampanang", 4748035, "poz", scripts = Latn}

m["aph"] = {"Athpare", 3449126, "sit-kie", scripts = {"Deva", "Latn"}}

m["api"] = {"Apiaká", 3507941, "tup-gua", scripts = Latn}

m["apj"] = {"Jicarilla", 28277, "apa", scripts = Latn}

m["apk"] = {"Plains Apache", 27861, "apa", scripts = Latn}

m["apl"] = {"Lipan", 28269, "apa", scripts = Latn}

m["apm"] = {"Chiricahua", 13368, "apa", scripts = Latn}

m["apn"] = {"Apinayé", 2858311, "sai-nje", scripts = Latn}

m["apo"] = {"Ambul", 12627135, "poz-ocw", scripts = Latn}

m["app"] = {"Apma", 2669188, "poz-vnc", scripts = Latn}

m["apq"] = {"A-Pucikwar", 28466, "qfa-adc", scripts = Latn}

m["apr"] = {"Arop-Lokep", 2863482, "poz-ocw", scripts = Latn}

m["aps"] = {"Arop-Sissano", 12627242, "poz-ocw", scripts = Latn}

m["apt"] = {"Apatani", 56306, "sit-tan", scripts = Latn}

m["apu"] = {"Apurinã", 2859081, "awd", scripts = Latn}

m["apv"] = {"Alapmunte", 16110782, "sai-nmk", scripts = Latn}

m["apw"] = {"Western Apache", 28060, "apa", scripts = Latn}

m["apx"] = {"Aputai", 12473343, "poz-tim", scripts = Latn}

m["apy"] = {"Apalaí", 2736980, "sai-car", scripts = Latn}

m["apz"] = {"Safeyoka", 7398693, "ngf", scripts = Latn}

m["aqc"] = {"Archi", 34915, "cau-lzg", scripts = Cyrl}

m["aqd"] = {"Ampari Dogon", 4748057, "nic-dgw", scripts = Latn}

m["aqg"] = {"Arigidi", 34829, "alv-von", scripts = Latn}

m["aqm"] = {"Atohwaim", 11732297, "ngf", scripts = Latn}

m["aqn"] = {"Northern Alta", 7058116, "phi", scripts = Latn}

m["aqp"] = {"Atakapa", 10975683, "qfa-iso", scripts = Latn}

m["aqr"] = {"Arhâ", 4790085, "poz-cln", scripts = Latn}

m["aqt"] = {"Angaité", 15736037, "sai-mas", scripts = Latn}

m["aqz"] = {"Akuntsu", 4701960, "tup", scripts = Latn}

m["arc"] = {
    "Aramaic",
    28602,
    "sem-ara",
    -- varieties are in [[Module:etymology language/data]]
    scripts = {"Hebr", "Armi", "Syrc", "Palm", "Nbat", "Phnx", "Mand", "Samr", "Hatr"},
    translit_module = "translit-redirect",
    entry_name = {from = {"[" .. u(0x0591) .. "-" .. u(0x05BD) .. u(0x05BF) .. "-" .. u(0x05C5) .. u(0x05C7) .. "]", "[" .. u(0x0304) .. u(0x0308) .. u(0x0331) .. u(0x0730) .. "-" .. u(0x0748) .. "]"}, to = {}}
}

m["ard"] = {"Arabana", 3507959, "aus-kar", scripts = Latn}

m["are"] = {"Western Arrernte", 12645549, "aus-pam", scripts = Latn}

m["arh"] = {"Arhuaco", 2640621, "cba", scripts = Latn}

m["ari"] = {"Arikara", 56539, "cdd", scripts = Latn}

m["arj"] = {"Arapaso", 12627166, "sai-tuc", scripts = Latn}

m["ark"] = {"Arikapú", 3446640, "sai-mje", scripts = Latn}

m["arl"] = {"Arabela", 2591221, "sai-zap", scripts = Latn}

m["arn"] = {"Mapudungun", 33730, "sai-ara", scripts = Latn}

m["aro"] = {"Araona", 958414, "sai-tac", scripts = Latn}

m["arp"] = {"Arapaho", 56417, "alg-ara", scripts = Latn}

m["arq"] = {"Algerian Arabic", 56499, "sem-arb", scripts = Arab, entry_name = {from = {u(0x0671), u(0x064B), u(0x064C), u(0x064D), u(0x064E), u(0x064F), u(0x0650), u(0x0651), u(0x0652), u(0x0670), u(0x0640)}, to = {u(0x0627)}}}

m["arr"] = {"Arara-Karo", 35539, "tup", scripts = Latn}

m["ars"] = {"Najdi Arabic", 56574, "sem-arb", scripts = Arab, entry_name = {from = {u(0x0671), u(0x064B), u(0x064C), u(0x064D), u(0x064E), u(0x064F), u(0x0650), u(0x0651), u(0x0652), u(0x0670), u(0x0640)}, to = {u(0x0627)}}}

m["aru"] = {"Arua", 2746221, "auf", scripts = Latn}

m["arv"] = {"Arbore", 56883, "cus", scripts = Latn}

m["arw"] = {"Arawak", 2655664, "awd-taa", ancestors = {"awd-taa-pro"}, scripts = Latn}

m["arx"] = {"Aruá", 3507907, "tup", scripts = Latn}

m["ary"] = {"Moroccan Arabic", 56426, "sem-arb", scripts = {"Arab"}, entry_name = {from = {u(0x0671), u(0x064B), u(0x064C), u(0x064D), u(0x064E), u(0x064F), u(0x0650), u(0x0651), u(0x0652), u(0x0670), u(0x0640)}, to = {u(0x0627)}}}

m["arz"] = {"Egyptian Arabic", 29919, "sem-arb", scripts = Arab, entry_name = {from = {u(0x0671), u(0x064B), u(0x064C), u(0x064D), u(0x064E), u(0x064F), u(0x0650), u(0x0651), u(0x0652), u(0x0670), u(0x0640)}, to = {u(0x0627)}}}

m["asa"] = {"Pare", 36403, "bnt-par", scripts = Latn}

m["asb"] = {"Assiniboine", 2591288, "sio-dkt", scripts = Latn}

m["asc"] = {"Casuarina Coast Asmat", 11732046, "ngf", scripts = Latn}

m["ase"] = {"American Sign Language", 14759, "sgn", scripts = {"Sgnw"}}

m["asf"] = {
    "Auslan",
    29525,
    "sgn",
    scripts = Latn -- when documented
}

m["asg"] = {"Cishingini", 35199, "nic-kam", scripts = Latn}

m["ash"] = {"Abishira", 2871740, "qfa-iso", scripts = Latn}

m["asi"] = {"Buruwai", 5001031, "ngf", scripts = Latn}

m["asj"] = {"Nsari", 36418, "nic-bbe", scripts = Latn}

m["ask"] = {"Ashkun", 29379, "nur-sou", scripts = {"Arab", "Latn"}}

m["asl"] = {"Asilulu", 12473347, "poz-cma", scripts = Latn}

m["asn"] = {"Xingú Asuriní", 8044571, "tup-gua", scripts = Latn}

m["aso"] = {"Dano", 5220979, "paa-kag", scripts = {"Latn"}}

m["asp"] = {"Algerian Sign Language", 3135421, "sgn"}

m["asq"] = {
    "Austrian Sign Language",
    36668,
    "sgn",
    scripts = Latn -- when documented
}

m["asr"] = {
    "Asuri",
    3504321,
    "mun",
    scripts = Latn -- when documented
}

m["ass"] = {"Ipulo", 35408, "nic-tvc", scripts = Latn}

m["ast"] = {"Asturian", 29507, "roa-ibe", scripts = Latn, ancestors = {"roa-ole"}}

m["asu"] = {"Tocantins Asurini", 32041490, "tup-gua", scripts = Latn}

m["asv"] = {"Asoa", 56296, "csu-maa", scripts = Latn}

m["asw"] = {
    "Australian Aboriginal Sign Language",
    955216,
    "sgn",
    scripts = Latn -- when documented
}

m["asx"] = {"Muratayak", 11732766, "ngf-fin", scripts = Latn}

m["asy"] = {"Yaosakor Asmat", 16113158, "ngf", scripts = Latn}

m["asz"] = {"As", 2866218, "poz-hce", scripts = Latn}

m["ata"] = {"Pele-Ata", 56511, "paa", scripts = Latn}

m["atb"] = {
    "Zaiwa",
    56594,
    "tbq-brm",
    scripts = Latn -- also Hani?
}

m["atc"] = {"Atsahuaca", 4817730, "sai-pan", scripts = Latn}

m["atd"] = {"Ata Manobo", 12627315, "mno", scripts = Latn}

m["ate"] = {"Atemble", 4813055, "ngf-mad", scripts = Latn}

m["atg"] = {"Okpela", 7082551, "alv-yek", scripts = Latn}

m["ati"] = {"Attié", 34844, "alv-lag", scripts = Latn}

m["atj"] = {"Atikamekw", 56590, "alg", scripts = Latn, ancestors = {"cr"}}

m["atk"] = {"Ati", 4815751, "phi", scripts = Latn}

m["atl"] = {"Mount Iraya Agta", 6921430, "phi", scripts = Latn}

m["atm"] = {"Ata", 4812603, "phi", scripts = Latn}

m["ato"] = {"Atong (Cameroon)", 34824, "nic-grs", scripts = Latn}

m["atp"] = {"Pudtol Atta", 12640726, "phi", scripts = Latn}

m["atq"] = {"Aralle-Tabulahan", 4783889, "poz-ssw", scripts = Latn}

m["atr"] = {"Waimiri-Atroari", 56865, "sai-car", scripts = Latn}

m["ats"] = {"Gros Ventre", 56628, "alg-ara", scripts = Latn}

m["att"] = {"Pamplona Atta", 12639245, "phi", scripts = Latn}

m["atu"] = {"Reel", 7306882, "sdv-dnu", scripts = Latn}

m["atv"] = {"Northern Altai", 2640863, "trk-sib", scripts = Cyrl, translit_module = "Altai-translit"}

m["atw"] = {"Atsugewi", 56718, "nai-pal", scripts = Latn}

m["atx"] = {"Arutani", 56609, scripts = Latn}

m["aty"] = {"Aneityum", 2379113, "poz-oce", scripts = Latn}

m["atz"] = {"Arta", 3508067, "phi", scripts = Latn}

m["aua"] = {"Asumboa", 4811870, "poz-oce", scripts = Latn}

m["aub"] = {
    "Alugu",
    12626798,
    "tbq-lol",
    scripts = Latn -- also Hani?
}

m["auc"] = {"Huaorani", 758570, "qfa-iso", scripts = Latn}

m["aud"] = {"Anuta", 35326, "poz-pnp", scripts = Latn}

m["aug"] = {"Aguna", 34733, "alv-gbe", scripts = Latn}

m["auh"] = {"Aushi", 2872082, "bnt-sbi", scripts = Latn}

m["aui"] = {"Anuki", 3508132, "poz-ocw", scripts = Latn}

m["auj"] = {"Awjila", 56398, "ber", scripts = {"Latn", "Arab", "Tfng"}}

m["auk"] = {"Heyo", 3504295, "qfa-tor", scripts = Latn}

m["aul"] = {"Aulua", 427300, "poz-vnc", scripts = Latn}

m["aum"] = {"Asu", 34798, "alv-ngb", scripts = Latn}

m["aun"] = {"Molmo One", 12637224, "qfa-tor", scripts = Latn}

m["auo"] = {"Auyokawa", 56247, "cdc-wst", scripts = Latn}

m["aup"] = {"Makayam", 6738863, "ngf", scripts = Latn}

m["auq"] = {"Anus", 23855, "poz-ocw", scripts = Latn}

m["aur"] = {"Aruek", 3504279, "qfa-tor", scripts = Latn}

m["aut"] = {"Austral", 2669261, "poz-pep", scripts = Latn}

m["auu"] = {"Auye", 4827334, "ngf", scripts = Latn}

m["auw"] = {"Awyi", 3513326, "paa-brd", scripts = Latn}

m["aux"] = {"Aurá", 3507995, "tup-gua", scripts = Latn}

m["auy"] = {"Auyana", 2873211, "paa-kag", scripts = Latn}

m["auz"] = {"Uzbeki Arabic", 3399507, "sem-arb", scripts = Arab}

m["avb"] = {"Avau", 12627412, "poz-ocw", scripts = Latn}

m["avd"] = {"Alviri-Vidari", 3327357, "xme", scripts = {"fa-Arab"}, ancestors = {"xme-mid"}}

m["avi"] = {"Avikam", 34840, "alv-lag", scripts = Latn}

m["avk"] = {"Kotava", 1377116, "art", scripts = Latn, type = "appendix-constructed"}

m["avm"] = {"Angkamuthi", nil, "aus-pmn", scripts = Latn}

m["avn"] = {"Avatime", 34796, "alv-ktg", scripts = Latn}

m["avo"] = {"Agavotaguerra", 3508007, "awd", scripts = Latn}

m["avs"] = {"Aushiri", 3409318, "sai-zap", scripts = Latn}

m["avt"] = {"Au", 3446608, "qfa-tor", scripts = Latn}

m["avu"] = {"Avokaya", 56685, "csu-mma", scripts = Latn}

m["avv"] = {"Avá-Canoeiro", 4829584, "tup-gua", scripts = Latn}

m["awa"] = {"Awadhi", 29579, "inc-hie", scripts = {"Deva", "Kthi", "fa-Arab"}, ancestors = {"inc-pra"}, translit_module = "hi-translit"}

m["awb"] = {"Awa (New Guinea)", 2874650, "paa-kag", scripts = Latn}

m["awc"] = {"Cicipu", 35193, "nic-kam", scripts = Latn}

m["awe"] = {"Awetí", 4830038, "tup", scripts = Latn}

m["awg"] = {"Anguthimri", 4764288, "aus-pam", scripts = Latn}

m["awh"] = {"Awbono", 3446684, "ngf", scripts = Latn}

m["awi"] = {"Aekyom", 3399691, "ngf", scripts = Latn}

m["awk"] = {"Awabakal", 3449138, "aus-pam", scripts = Latn}

m["awm"] = {"Arawum", 4784537, "ngf-mad", scripts = Latn}

m["awn"] = {"Awngi", 34934, "cus", scripts = {"Ethi"}}

m["awo"] = {"Awak", 3446643, "alv-wjk", scripts = Latn}

m["awr"] = {"Awera", 56379, "paa-lkp", scripts = Latn}

m["aws"] = {"South Awyu", 12633986, "ngf", scripts = Latn}

m["awt"] = {"Araweté", 4784535, "tup-gua", scripts = Latn}

m["awu"] = {"Central Awyu", 12628801, "ngf", scripts = Latn}

m["awv"] = {"Jair Awyu", 16110177, "ngf", scripts = Latn}

m["aww"] = {"Awun", 56369, "paa-spk", scripts = Latn}

m["awx"] = {"Awara", 2874670, "ngf-fin", scripts = Latn}

m["awy"] = {"Edera Awyu", 12630425, "ngf", scripts = Latn}

m["axb"] = {"Abipon", 11252539, "sai-guc", scripts = Latn}

m["axe"] = {"Ayerrerenge", 16112737, "aus-pam", scripts = Latn}

m["axg"] = {"Mato Grosso Arára", 3446660, scripts = Latn}

m["axk"] = {"Aka (Central Africa)", 11010149, "bnt-ngn", scripts = Latn}

m["axl"] = {"Lower Southern Aranda", 6693295, "aus-pam", scripts = Latn}

m["axm"] = {"Middle Armenian", 4438498, "hyx", scripts = {"Armn"}, ancestors = {"xcl"}, translit_module = "Armn-translit", override_translit = true, entry_name = {from = {"և", "՞", "՜", "՛", "՟"}, to = {"եւ"}}}

m["axx"] = {"Xaragure", 8045635, "poz-cln", scripts = Latn}

m["aya"] = {"Awar", 56876, "paa", scripts = Latn}

m["ayb"] = {"Ayizo", 34841, "alv-pph", scripts = Latn}

m["ayd"] = {"Ayabadhu", 3509164, "aus-pmn", scripts = Latn}

m["aye"] = {"Ayere", 34788, "alv-aah", scripts = Latn}

m["ayg"] = {"Nyanga (Togo)", 35446, "alv-gng", scripts = Latn}

m["ayi"] = {"Leyigha", 3914492, "nic-uce", scripts = Latn}

m["ayk"] = {"Akuku", 3450179, "alv-nwd", scripts = Latn}

m["ayl"] = {"Libyan Arabic", 56503, "sem-arb", scripts = Arab, entry_name = {from = {u(0x0671), u(0x064B), u(0x064C), u(0x064D), u(0x064E), u(0x064F), u(0x0650), u(0x0651), u(0x0652), u(0x0670), u(0x0640)}, to = {u(0x0627)}}}

m["ayn"] = {"Yemeni Arabic", 1686766, "sem-arb", scripts = Arab, entry_name = {from = {u(0x0671), u(0x064B), u(0x064C), u(0x064D), u(0x064E), u(0x064F), u(0x0650), u(0x0651), u(0x0652), u(0x0670), u(0x0640)}, to = {u(0x0627)}}}

m["ayo"] = {"Ayoreo", 56634, "sai-zam", scripts = Latn}

m["ayp"] = {"North Mesopotamian Arabic", 56577, "sem-arb", scripts = Arab, ancestors = {"acm"}, entry_name = {from = {u(0x0671), u(0x064B), u(0x064C), u(0x064D), u(0x064E), u(0x064F), u(0x0650), u(0x0651), u(0x0652), u(0x0670), u(0x0640)}, to = {u(0x0627)}}}

m["ayq"] = {"Ayi", 56449, "paa-spk", scripts = Latn}

m["ays"] = {"Sorsogon Ayta", 7563752, "phi", scripts = Latn}

m["ayt"] = {"Bataan Ayta", 4921648, "phi", scripts = Latn}

m["ayu"] = {"Ayu", 34786, "alv", scripts = Latn}

m["ayy"] = {"Tayabas Ayta", 7689745, "phi", scripts = Latn}

m["ayz"] = {"Maybrat", 4830892, "paa-wpa", scripts = Latn}

m["aza"] = {"Azha", 4832486, "tbq-lol", scripts = Latn}

m["azd"] = {"Eastern Durango Nahuatl", 16115449, "azc-nah", scripts = Latn}

m["azg"] = {"San Pedro Amuzgos Amuzgo", 35092, "omq", scripts = Latn}

m["azm"] = {"Ipalapa Amuzgo", 12633013, "omq", scripts = Latn}

m["azn"] = {"Western Durango Nahuatl", 12645553, "azc-nah", scripts = Latn}

m["azo"] = {"Awing", 34856, "nic-nge", scripts = Latn}

m["azt"] = {"Faire Atta", 12630884, "phi", scripts = Latn}

m["azz"] = {"Highland Puebla Nahuatl", 12953754, "azc-nah", scripts = Latn}

return m
