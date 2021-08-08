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

m["vaa"] = {"Vaagri Booli", 7907798}

m["vae"] = {"Vale", 3450194, "csu-val"}

m["vag"] = {"Vagla", 36637, "nic-gnw"}

m["vah"] = {"Varhadi-Nagpuri", 155645, "inc-sou", ancestors = {"mr"}}

m["vai"] = {"Vai", 36939, "dmn-vak", scripts = {"Vaii"}, translit_module = "Vaii-translit"}

m["vaj"] = {"Sekele", 56528}

m["val"] = {"Vehes", 7918407}

m["vam"] = {"Vanimo", 3327415, "paa-msk"}

m["van"] = {"Valman", 7912479, "qfa-tor"}

m["vao"] = {"Vao", 2160405, "poz-vnc"}

m["vap"] = {"Vaiphei", 56368, "tbq-kuk"}

m["var"] = {"Huarijio", 10974017, "azc-trc", scripts = Latn}

m["vas"] = {"Vasavi", 765418}

m["vau"] = {"Vanuma", 7915259, "bnt-nya"}

m["vav"] = {"Varli", 7915983, "inc-sou", scripts = {"Deva", "Gujr"}}

m["vay"] = {"Vayu", 7917585, "sit-kiw"}

m["vbb"] = {"Southeast Babar", 12952247, "poz-tim"}

m["vbk"] = {"Southwestern Bontoc", nil, "phi", scripts = Latn}

m["vec"] = {"Venetian", 32724, "roa", scripts = Latn}

m["ved"] = {"Veddah", 2567934}

m["vem"] = {"Vemgo-Mabas", 56268}

m["veo"] = {"Ventureño", 56712, "nai-chu", scripts = Latn}

m["vep"] = {"Veps", 32747, "fiu-fin", scripts = Latn}

m["ver"] = {"Mom Jango", 35862, "alv-dur"}

m["vgr"] = {"Vaghri", 7908480, "inc-bhi", scripts = {"Gujr"}, translit_module = "gu-translit"}

m["vgt"] = {"Flemish Sign Language", 2107617, "sgn"}

m["vic"] = {"Virgin Islands Creole", 7933935, "crp", scripts = Latn, ancestors = {"en"}}

m["vid"] = {"Vidunda", 7928151, "bnt-ruv"}

m["vif"] = {"Vili", 3558409, "bnt-kng"}

m["vig"] = {"Viemo", 36912, "alv-sav"}

m["vil"] = {"Vilela", 3409297}

m["vis"] = {"Vishavan", 14916908, "dra"}

m["vit"] = {"Viti", 11011055, "nic-grf"}

m["viv"] = {"Iduna", 5989839, "poz-ocw"}

m["vka"] = {"Kariyarra", 13586632, "aus-nga", scripts = Latn}

m["vki"] = {"Ija-Zuba", 11011389, "nic-pls", ancestors = {"uji"}}

m["vkj"] = {"Kujarge", 33448}

m["vkk"] = {"Kaur", 6378867}

m["vkl"] = {"Kulisusu", 3200326, "poz-btk"}

m["vkm"] = {"Kamakan", 3192316, "sai-mje", scripts = Latn}

m["vko"] = {"Kodeoha", 3198209}

m["vkp"] = {"Korlai Creole Portuguese", 3915520, "crp", scripts = Latn, ancestors = {"idb"}}

m["vkt"] = {"Tenggarong Kutai Malay", 12683226}

m["vku"] = {"Kurrama", 3915684, "aus-nga", scripts = Latn}

m["vlp"] = {"Valpei", 7912582, "poz-vnc"}

m["vls"] = {"West Flemish", 100103, "gmw", scripts = Latn, ancestors = {"dum"}}

m["vma"] = {"Martuthunira", 975399, "aus-nga", scripts = Latn}

m["vmb"] = {"Mbabaram", 3303475, "aus-pam", scripts = Latn}

m["vmc"] = {"Juxtlahuaca Mixtec", 25559582, "omq-mxt", scripts = Latn}

m["vmd"] = {"Mudu Koraga", 12952656, "dra", scripts = {"Knda"}}

m["vme"] = {"East Masela", 18487451, "poz-tim"}

m["vmf"] = {"East Franconian", 497345, "gmw", scripts = Latn, ancestors = {"gmh"}, sort_key = {from = {"[äàáâå]", "[ëèéê]", "[ïìíî]", "[öòóô]", "[üùúû]", "ß"}, to = {"a", "e", "i", "o", "u", "ss"}}}

m["vmg"] = {"Minigir", 17053237, "poz-ocw", scripts = Latn}

m["vmh"] = {"Maraghei", 36220, "xme-ttc", ancestors = {"xme-ttc-eas"}}

m["vmi"] = {"Miwa", 10586712, "aus-wor"}

m["vmj"] = {"Ixtayutla Mixtec", 6101163, "omq-mxt", scripts = Latn}

m["vmk"] = {"Makhuwa-Shirima", 2963909, "bnt-mak", ancestors = {"vmw"}, scripts = Latn}

m["vml"] = {"Malgana", 6743201, "aus-psw", scripts = Latn}

m["vmm"] = {"Mitlatongo Mixtec", 6881813, "omq-mxt", scripts = Latn}

m["vmp"] = {"Soyaltepec Mazatec", 7572000, scripts = Latn}

m["vmq"] = {"Soyaltepec Mixtec", 7572001, "omq-mxt", scripts = Latn}

m["vmr"] = {"Marenje", 11128833, ancestors = {"vmw"}, "bnt-mak"}

-- vms "Moskela" is extinct and unattested; see Wikipedia

m["vmu"] = {"Muluridyi", 10590149}

m["vmv"] = {"Valley Maidu", 5096458, "nai-mdu", scripts = Latn}

m["vmw"] = {"Makhuwa", 33882, "bnt-mak", scripts = Latn}

m["vmx"] = {"Tamazola Mixtec", 12953734, "omq-mxt", scripts = Latn}

m["vmy"] = {"Ayautla Mazatec", 14916912, scripts = Latn}

m["vmz"] = {"Mazatlán Mazatec", 12953706, "omq-maz", scripts = Latn}

m["vnk"] = {"Lovono", 3211090, "poz-oce"}

m["vnm"] = {"Neve'ei", 2157431, "poz-vnc"}

m["vnp"] = {"Vunapu", 7943647, "poz-vnc"}

m["vor"] = {"Voro", 3914407, "alv-yun"}

m["vot"] = {"Votic", 32858, "fiu-fin", scripts = Latn}

m["vra"] = {"Vera'a", 3555689, scripts = Latn}

m["vro"] = {"Võro", 32762, "fiu-fin", scripts = Latn, wikimedia_codes = {"fiu-vro"}}

m["vrs"] = {"Varisi", 3554807, "poz-ocw"}

m["vrt"] = {"Banam Bay", 2928522, "poz-vnc"}

m["vsi"] = {"Moldova Sign Language", 12953478, "sgn"}

m["vsl"] = {"Venezuelan Sign Language", 3322064, "sgn"}

m["vsv"] = {"Valencian Sign Language", 32663, "sgn"}

m["vto"] = {"Vitou", 7937210, "paa-tkw"}

m["vum"] = {"Vumbu", 36629, "bnt-sir"}

m["vun"] = {"Vunjo", 12953261, "bnt-chg", scripts = Latn}

m["vut"] = {"Vute", 36897, "nic-mmb", scripts = Latn}

m["vwa"] = {"Awa (China)", 2874642, "mkh-pal"}

return m
