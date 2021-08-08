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

m["iai"] = {"Iaai", 282888, "poz-occ", Latn}

m["ian"] = {"Iatmul", 5983460, "paa-spk"}

m["iar"] = {"Purari", 3499934, "paa"}

m["iba"] = {"Iban", 33424, "poz-mly", Latn}

m["ibb"] = {"Ibibio", 33792, "nic-ief", Latn}

m["ibd"] = {"Iwaidja", 1977429, "aus-wdj", Latn}

m["ibe"] = {"Akpes", 35457, "alv-von", Latn}

m["ibg"] = {"Ibanag", 1775596, "phi"}

m["ibh"] = {"Bih", nil, "cmc", Latn}

m["ibl"] = {"Ibaloi", 3147383, "phi"}

m["ibm"] = {"Agoi", 34727, "nic-ucr", Latn}

m["ibn"] = {"Ibino", 3813281, "nic-lcr", Latn}

m["ibr"] = {"Ibuoro", 3813306, "nic-ief"}

m["ibu"] = {"Ibu", 11732235, "paa-wpa"}

m["iby"] = {"Ibani", 11280479, "ijo"}

m["ica"] = {"Ede Ica", 12952405, "alv-ede", Latn}

m["ich"] = {"Etkywan", 3914462, "nic-jkn", Latn}

m["icl"] = {
    "Icelandic Sign Language", 3436654, "sgn", Latn -- when documented
}

m["icr"] = {"Islander Creole English", 2044587, "crp", Latn, ancestors = {"en"}}

m["ida"] = {"Idakho-Isukha-Tiriki", 12952512, "bnt-lok"}

m["idb"] = {"Indo-Portuguese", 6025550, "crp", Latn, ancestors = {"pt"}}

m["idc"] = {"Idon", 3913366, "nic-plc"}

m["idd"] = {"Ede Idaca", 13123376, "alv-ede", Latn}

m["ide"] = {"Idere", 3813288, "nic-ief"}

m["idi"] = {"Idi", 5988630, "paa"}

m["idr"] = {"Indri", 35662, "nic-ser"}

m["ids"] = {"Idesa", 3913979, "alv-swd", Latn, ancestors = {"oke"}}

m["idt"] = {"Idaté", 12952511, "poz-tim", Latn}

m["idu"] = {"Idoma", 35478, "alv-ido", Latn}

m["ifa"] = {"Amganad Ifugao", 18748222, "phi"}

m["ifb"] = {"Batad Ifugao", 12953578, "phi"}

m["ife"] = {"Ifè", 33606, "alv-ede", Latn}

m["iff"] = {"Ifo", 7902545, "poz-oce", Latn}

m["ifk"] = {"Tuwali Ifugao", 7857158, "phi"}

m["ifm"] = {"Teke-Fuumu", 36603, "bnt-tek"}

m["ifu"] = {"Mayoyao Ifugao", 12953579, "phi", Latn}

m["ify"] = {"Keley-I Kallahan", 3192221, "phi"}

m["igb"] = {"Ebira", 35363, "alv-nup", Latn}

m["ige"] = {"Igede", 35420, "alv-ido", Latn}

m["igg"] = {"Igana", 5991454, "paa", Latn}

m["igl"] = {"Igala", 35513, "alv-yor"}

m["igm"] = {"Kanggape", 6362743, "paa", Latn}

m["ign"] = {"Ignaciano", 3148190, "awd"}

m["igo"] = {"Isebe", 11732248, "ngf-mad"}

m["igs"] = {"Glosa", 2314240, "art", type = "appendix-constructed"}

m["igw"] = {"Igwe", 3913985, "alv-yek", Latn}

m["ihb"] = {"Pidgin Iha", 12639686, "crp", ancestors = {"ihp"}}

m["ihi"] = {"Ihievbe", 3441193, "alv-eeo", Latn, ancestors = {"ema"}}

m["ihp"] = {"Iha", 5994495, "ngf"}

m["ijc"] = {"Izon", 35483, "ijo", Latn}

m["ije"] = {"Biseni", 35010, "ijo"}

m["ijj"] = {"Ede Ije", 12952406, "alv-ede", Latn}

m["ijn"] = {"Kalabari", 35697, "ijo"}

m["ijs"] = {"Southeast Ijo", 3915854, "ijo", Latn}

m["ike"] = {"Eastern Canadian Inuktitut", 4126517, "esx-inu", {"Cans"}}

m["iki"] = {"Iko", 3813290, "nic-lcr", Latn}

m["ikk"] = {"Ika", 35406, "alv-igb"}

m["ikl"] = {"Ikulu", 425973, "nic-plc", Latn}

m["iko"] = {"Olulumo-Ikom", 3914402, "nic-uce", Latn}

m["ikp"] = {"Ikpeshi", 3912777, "alv-yek", Latn}

m["ikr"] = {"Ikaranggal", 5995402, "aus-pam"}

m["iks"] = {
    "Inuit Sign Language", 13360244, "sgn", Latn -- when documented
}

m["ikt"] = {"Inuvialuktun", 27990, "esx-inu", {"Cans", "Latn"}}

m["ikv"] = {"Iku-Gora-Ankwa", 3913940, "nic-plc"}

m["ikw"] = {"Ikwere", 35399, "alv-igb"}

m["ikx"] = {"Ik", 35472, "ssa-klk", Latn}

m["ikz"] = {"Ikizu", 10977626, "bnt-lok", Latn}

m["ila"] = {"Ile Ape", 12473380, "poz-cet"}

m["ilb"] = {"Ila", 10962725, "bnt-bot", Latn}

m["ilg"] = {"Ilgar", 5997810, "aus-wdj", Latn}

m["ili"] = {"Ili Turki", 33627, "trk-kar"}

m["ilk"] = {"Ilongot", 3148787, "phi", Latn}

m["ill"] = {"Iranun", 12953581, "phi", {"Latn", "Arab"}}

m["ilo"] = {"Ilocano", 35936, "phi", {"Latn", "Tglg"}, entry_name = {from = {"[áàâ]", "[éèê]", "[íìî]", "[óòô]", "[úùû]", ACUTE, GRAVE, CIRC}, to = {"a", "e", "i", "o", "u"}}}

m["ils"] = {"International Sign", 35754, "sgn"}

m["ilu"] = {"Ili'uun", 12632888, "poz-tim"}

m["ilv"] = {"Ilue", 3813301, "nic-lcr", Latn}

m["ima"] = {"Mala Malasar", 6740693, "dra"}

m["imi"] = {"Anamgura", 3501881, "ngf-mad"}

m["iml"] = {"Miluk", 3314550, "nai-coo", Latn}

m["imn"] = {"Imonda", 6005721, "paa-brd"}

m["imo"] = {"Imbongu", 12632895, "ngf-mad"}

m["imr"] = {"Imroing", 6008394, "poz-tim"}

m["ims"] = {"Marsian", 1265446, "itc", Latn}

m["imy"] = {"Milyan", 3832946, "ine-ana", {"Lyci"}}

m["inb"] = {"Inga", 35491, "qwe", ancestors = {"qwe-kch"}}

m["ing"] = {"Deg Xinag", 27782, "ath-nor"}

m["inh"] = {"Ingush", 33509, "cau-vay", {"Cyrl"}, translit_module = "inh-translit", override_translit = true, entry_name = {from = {MACRON}, to = {}}}

m["inj"] = {"Jungle Inga", 16115012, "qwe", ancestors = {"qwe-kch"}}

m["inl"] = {
    "Indonesian Sign Language", 3915477, "sgn", Latn -- when documented
}

m["inm"] = {"Minaean", 737784, "sem-osa", {"Sarb"}, translit_module = "Sarb-translit"}

m["inn"] = {"Isinai", 6081098, "phi"}

m["ino"] = {"Inoke-Yate", 6036531, "paa-kag"}

m["inp"] = {"Iñapari", 15338035, "awd", Latn}

m["ins"] = {"Indian Sign Language", 12953486, "sgn"}

m["int"] = {"Intha", 6057507, "tbq-brm", ancestors = {"obr"}}

m["inz"] = {"Ineseño", 35443, "nai-chu", Latn}

m["ior"] = {"Inor", 35763, "sem-eth", {"Ethi"}}

m["iou"] = {"Tuma-Irumu", 7852460, "ngf-fin", Latn}

m["iow"] = {"Chiwere", 56737, "sio-msv", Latn}

m["ipi"] = {"Ipili", 6065141, "paa-eng"}

m["ipo"] = {"Ipiko", 10566515, "ngf"}

m["iqu"] = {"Iquito", 2669184, "sai-zap", Latn}

m["iqw"] = {"Ikwo", 11926474, "alv-igb", Latn, ancestors = {"izi"}}

m["ire"] = {"Iresim", 6069398, "poz-hce", Latn}

m["irh"] = {"Irarutu", 3027928, "poz", Latn}

m["iri"] = {"Rigwe", 3912756, "nic-plc", Latn}

m["irk"] = {"Iraqw", 33595, "cus", Latn}

m["irn"] = {"Irantxe", 3409301, nil, Latn}

m["irr"] = {"Ir", 3071880, "mkh-kat"}

m["iru"] = {"Irula", 33363, "dra", {"Taml"}}

m["irx"] = {"Kamberau", 6356317, "ngf"}

m["iry"] = {"Iraya", 6068356, "phi"}

m["isa"] = {"Isabi", 11732247, "paa-kag"}

m["isc"] = {"Isconahua", 3052971, "sai-pan", Latn}

m["isd"] = {"Isnag", 6085162, "phi", Latn}

m["ise"] = {
    "Italian Sign Language", 375619, "sgn", Latn -- when documented
}

m["isg"] = {
    "Irish Sign Language", 14183, "sgn", Latn -- when documented
}

m["ish"] = {"Esan", 35268, "alv-eeo", Latn}

m["isi"] = {"Nkem-Nkum", 36261, "nic-eko", Latn}

m["isk"] = {"Ishkashimi", 33419, "ira-sgi", ancestors = {"ira-sgi-pro"}}

m["ism"] = {"Masimasi", 6783273, "poz-ocw", Latn}

m["isn"] = {"Isanzu", 6078891, "bnt-tkm", Latn}

m["iso"] = {"Isoko", 35414, "alv-swd", Latn}

m["isr"] = {"Israeli Sign Language", 2911863, "sgn", {"Sgnw"}}

m["ist"] = {"Istriot", 35845, "roa-itd", Latn}

m["isu"] = {"Isu", 6089423, "nic-rnw", Latn}

m["itb"] = {"Binongan Itneg", 12953584, "phi"}

m["itd"] = {"Southern Tidong", 7049643, "poz-san"}

m["ite"] = {"Itene", 3038640, "sai-cpc", Latn}

m["iti"] = {"Inlaod Itneg", 12953585, "phi"}

m["itk"] = {"Judeo-Italian", 1145414, "roa-itd", {"Hebr"}}

m["itl"] = {"Itelmen", 33624, "qfa-cka", {"Cyrl", "Latn"}}

m["itm"] = {"Itu Mbon Uzo", 10977737, "nic-ief", Latn, ancestors = {"ibr"}}

m["ito"] = {"Itonama", 950585, "qfa-iso"}

m["itr"] = {"Iteri", 2083185, "paa-asa"}

m["its"] = {"Isekiri", 36045, "alv-yor", Latn}

m["itt"] = {"Maeng Itneg", 18748761, "phi"}

m["itv"] = {"Itawit", 3915527, "phi", Latn}

m["itw"] = {"Ito", 11128810, "nic-ief", ancestors = {"ibr"}}

m["itx"] = {"Itik", 6094713, "paa-tkw"}

m["ity"] = {"Moyadan Itneg", 12953583, "phi"}

m["itz"] = {"Itzá", 35537, "myn"}

m["ium"] = {"Iu Mien", 2498808, "hmx-mie"}

m["ivb"] = {"Ibatan", 18748212, "phi", Latn}

m["ivv"] = {"Ivatan", 3547080, "phi", Latn}

m["iwk"] = {"I-Wak", 12632789, "phi"}

m["iwm"] = {"Iwam", 3915215, "paa-spk"}

m["iwo"] = {"Iwur", 6101006, "ngf-okk"}

m["iws"] = {"Sepik Iwam", 16893603, "paa-spk"}

m["ixc"] = {"Ixcatec", 56706, "omq"}

m["ixl"] = {"Ixil", 35528, "myn", Latn}

m["iya"] = {"Iyayu", 3913390, "alv-nwd", Latn}

m["iyo"] = {"Mesaka", 36080, "nic-tiv", Latn}

m["iyx"] = {"Yaa", 36909, "bnt-nze", Latn}

m["izh"] = {"Ingrian", 33559, "fiu-fin", Latn}

m["izi"] = {"Izi-Ezaa-Ikwo-Mgbo", nil, "alv-igb"}

m["izr"] = {"Izere", 6101921, "nic-plc", Latn}

m["izz"] = {"Izi", 3914387, "alv-igb", Latn, ancestors = {"izi"}}

return m
