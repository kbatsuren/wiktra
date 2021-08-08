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

m["aav-khs-pro"] = {"Proto-Khasian", nil, "aav-khs", {"Latinx"}, type = "reconstructed"}

m["aav-nic-pro"] = {"Proto-Nicobarese", nil, "aav-nic", {"Latinx"}, type = "reconstructed"}

m["aav-pkl-pro"] = {"Proto-Pnar-Khasi-Lyngngam", nil, "aav-pkl", {"Latinx"}, type = "reconstructed"}

m["aav-pro"] = { -- The mkh-pro will merge into this.
    "Proto-Austroasiatic",
    nil,
    "aav",
    {"Latinx"},
    type = "reconstructed"
}

m["afa-pro"] = {"Proto-Afroasiatic", 269125, "afa", {"Latinx"}, type = "reconstructed"}

m["alg-aga"] = {"Agawam", nil, "alg-eas", Latn}

m["alg-pro"] = {"Proto-Algonquian", 7251834, "alg", {"Latinx"}, type = "reconstructed", sort_key = {from = {"·"}, to = {""}}}

m["alv-ama"] = {"Amasi", 4740400, "nic-grs", Latn, entry_name = {from = {"[àáâãā]", "[èéêē]", "[ìíîī]", "[òóôõō]", "[ùúûũū]", GRAVE, ACUTE, CIRC, TILDE, MACRON}, to = {"a", "e", "i", "o", "u"}}}

m["alv-bgu"] = {"Baïnounk Gubëeher", 17002646, "alv-bny", Latn}

m["alv-bua-pro"] = {"Proto-Bua", nil, "alv-bua", Latn, type = "reconstructed"}

m["alv-cng-pro"] = {"Proto-Cangin", nil, "alv-cng", Latn, type = "reconstructed"}

m["alv-edo-pro"] = {"Proto-Edoid", nil, "alv-edo", Latn, type = "reconstructed"}

m["alv-fli-pro"] = {"Proto-Fali", nil, "alv-fli", Latn, type = "reconstructed"}

m["alv-gbe-pro"] = {"Proto-Gbe", nil, "alv-gbe", Latn, type = "reconstructed"}

m["alv-gng-pro"] = {"Proto-Guang", nil, "alv-gng", Latn, type = "reconstructed"}

m["alv-gtm-pro"] = {"Proto-Central Togo", nil, "alv-gtm", Latn, type = "reconstructed"}

m["alv-gwa"] = {"Gwara", 16945580, "nic-pla", Latn}

m["alv-hei-pro"] = {"Proto-Heiban", nil, "alv-hei", Latn, type = "reconstructed"}

m["alv-igb-pro"] = {"Proto-Igboid", nil, "alv-igb", Latn, type = "reconstructed"}

m["alv-kwa-pro"] = {"Proto-Kwa", nil, "alv-kwa", Latn, type = "reconstructed"}

m["alv-mum-pro"] = {"Proto-Mumuye", nil, "alv-mum", Latn, type = "reconstructed"}

m["alv-nup-pro"] = {"Proto-Nupoid", nil, "alv-nup", Latn, type = "reconstructed"}

m["alv-pro"] = {"Proto-Atlantic-Congo", nil, "alv", Latn, type = "reconstructed"}

m["alv-yor-pro"] = {"Proto-Yoruboid", nil, "alv-yor", Latn, type = "reconstructed"}

m["apa-pro"] = {"Proto-Apachean", nil, "apa", {"Latinx"}, type = "reconstructed"}

m["aql-pro"] = {"Proto-Algic", 18389588, "aql", {"Latinx"}, type = "reconstructed", sort_key = {from = {"·"}, to = {""}}}

m["art-blk"] = {"Bolak", 2909283, "art", Latn, type = "appendix-constructed"}

m["art-bsp"] = {"Black Speech", 686210, "art", {"Latn", "Teng"}, type = "appendix-constructed"}

m["art-com"] = {"Communicationssprache", 35227, "art", Latn, type = "appendix-constructed"}

m["art-dtk"] = {"Dothraki", 2914733, "art", Latn, type = "appendix-constructed"}

m["art-elo"] = {"Eloi", nil, "art", Latn, type = "appendix-constructed"}

m["art-gld"] = {"Goa'uld", 19823, "art", {"Latn", "Egyp", "Mero"}, type = "appendix-constructed"}

m["art-lap"] = {"Lapine", 6488195, "art", Latn, type = "appendix-constructed"}

m["art-man"] = {"Mandalorian", 54289, "art", Latn, type = "appendix-constructed"}

m["art-mun"] = {"Mundolinco", 851355, "art", Latn, type = "appendix-constructed"}

m["art-nav"] = {"Na'vi", 316939, "art", Latn, type = "appendix-constructed"}

m["art-nox"] = {"Noxilo", nil, "art", Latn, type = "appendix-constructed"}

m["art-top"] = {"Toki Pona", 36846, "art", Latn, type = "appendix-constructed"}

m["art-una"] = {"Unas", nil, "art", Latn, type = "appendix-constructed"}

m["ath-nic"] = {"Nicola", 20609, "ath-nor", Latn}

m["ath-pro"] = {"Proto-Athabaskan", nil, "ath", {"Latinx"}, type = "reconstructed"}

m["auf-pro"] = {"Proto-Arawa", nil, "auf", {"Latinx"}, type = "reconstructed"}

m["aus-alu"] = {"Alungul", 16827670, "aus-pmn", Latn}

m["aus-and"] = {"Andjingith", 4754509, "aus-pmn", Latn}

m["aus-ang"] = {"Angkula", 16828520, "aus-pmn", Latn}

m["aus-arn-pro"] = {"Proto-Arnhem", nil, "aus-arn", {"Latinx"}, type = "reconstructed"}

m["aus-bra"] = {"Barranbinya", 4863220, "aus-pmn", Latn}

m["aus-brm"] = {"Barunggam", 4865914, "aus-pmn", Latn}

m["aus-cww-pro"] = {"Proto-Central New South Wales", nil, "aus-cww", {"Latinx"}, type = "reconstructed"}

m["aus-dal-pro"] = {"Proto-Daly", nil, "aus-dal", {"Latinx"}, type = "reconstructed"}

m["aus-guw"] = {"Guwar", 6652138, "aus-pam", Latn}

m["aus-lsw"] = {"Little Swanport", 6652138, nil, Latn}

m["aus-mbi"] = {"Mbiywom", 6799701, "aus-pmn", Latn}

m["aus-ngk"] = {"Ngkoth", 7022405, "aus-pmn", Latn}

m["aus-nyu-pro"] = {"Proto-Nyulnyulan", nil, "aus-nyu", {"Latinx"}, type = "reconstructed"}

m["aus-pam-pro"] = {"Proto-Pama-Nyungan", 33942, "aus-pam", {"Latinx"}, type = "reconstructed"}

m["aus-tul"] = {"Tulua", 16938541, "aus-pam", Latn}

m["aus-uwi"] = {"Uwinymil", 7903995, "aus-arn", Latn}

m["aus-wdj-pro"] = {"Proto-Iwaidjan", nil, "aus-wdj", {"Latinx"}, type = "reconstructed"}

m["aus-won"] = {"Wong-gie", nil, "aus-pam", Latn}

m["aus-wul"] = {"Wulguru", 8039196, "aus-dyb", Latn}

m["aus-ynk"] = { -- contrast nny
    "Yangkaal", 3913770, "aus-tnk", Latn
}

m["awd-amc-pro"] = {"Proto-Amuesha-Chamicuro", nil, "awd", Latn, type = "reconstructed", ancestors = {"awd-pro"}}

m["awd-kmp-pro"] = {"Proto-Kampa", nil, "awd", Latn, type = "reconstructed", ancestors = {"awd-pro"}}

m["awd-prw-pro"] = {"Proto-Paresi-Waura", nil, "awd", Latn, type = "reconstructed", ancestors = {"awd-pro"}}

m["awd-ama"] = {"Amarizana", 16827787, "awd", Latn}

m["awd-ana"] = {"Anauyá", 16828252, "awd", Latn}

m["awd-apo"] = {"Apolista", 16916645, "awd", Latn}

m["awd-cav"] = {"Cavere", nil, "awd", Latn}

m["awd-gnu"] = {"Guinau", 3504087, "awd", Latn}

m["awd-kar"] = {"Cariay", 16920253, "awd", Latn}

m["awd-kaw"] = {"Kawishana", 6379993, "awd-nwk", Latn}

m["awd-kus"] = {"Kustenau", 5196293, "awd", Latn}

m["awd-man"] = {"Manao", 6746920, "awd", Latn}

m["awd-mar"] = {"Marawan", 6755108, "awd", Latn}

m["awd-mpr"] = {"Maypure", nil, "awd", Latn}

m["awd-mrt"] = {"Mariaté", 16910017, "awd-nwk", Latn}

m["awd-nwk-pro"] = {"Proto-Nawiki", nil, "awd-nwk", Latn, type = "reconstructed"}

m["awd-pai"] = {"Paikoneka", nil, "awd", Latn}

m["awd-pas"] = {"Passé", nil, "awd-nwk", Latn}

m["awd-pro"] = {"Proto-Arawak", nil, "awd", Latn, type = "reconstructed"}

m["awd-she"] = {"Shebayo", 7492248, "awd", Latn}

m["awd-taa-pro"] = {"Proto-Ta-Arawak", nil, "awd-taa", Latn, type = "reconstructed"}

m["awd-wai"] = {"Wainumá", 16910017, "awd-nwk", Latn}

m["awd-yum"] = {"Yumana", 8061062, "awd-nwk", Latn}

m["azc-caz"] = {"Cazcan", 5055514, "azc", Latn}

m["azc-cup-pro"] = {"Proto-Cupan", nil, "azc-cup", {"Latinx"}, type = "reconstructed"}

m["azc-ktn"] = {"Kitanemuk", 3197558, "azc-tak", Latn}

m["azc-nah-pro"] = {"Proto-Nahuan", 7251860, "azc-nah", {"Latinx"}, type = "reconstructed"}

m["azc-num-pro"] = {"Proto-Numic", nil, "azc-num", {"Latinx"}, type = "reconstructed"}

m["azc-pro"] = {"Proto-Uto-Aztecan", 96400333, "azc", {"Latinx"}, type = "reconstructed"}

m["azc-tak-pro"] = {"Proto-Takic", nil, "azc-tak", {"Latinx"}, type = "reconstructed"}

m["azc-tat"] = {"Tataviam", 743736, "azc", Latn}

m["ber-pro"] = {"Proto-Berber", 2855698, "ber", {"Latinx"}, type = "reconstructed"}

m["ber-fog"] = {"Fogaha", 107610173, "ber", Latn}

m["bnt-bal"] = {"Balong", 93935237, "bnt-bbo", Latn}

m["bnt-bon"] = {"Boma Nkuu", nil, "bnt", Latn}

m["bnt-boy"] = {"Boma Yumu", nil, "bnt", Latn}

m["bnt-cmw"] = {"Chimwiini", 4958328, "bnt-swh", Latn}

m["bnt-ind"] = {"Indanga", 51412803, "bnt", Latn}

m["bnt-lal"] = {"Lala (South Africa)", 6480154, "bnt-ngu", Latn}

m["bnt-lwl"] = {"Lwel", 93936908, "bnt-bdz", Latn}

m["bnt-mpi"] = {"Mpiin", 93937013, "bnt-bdz", Latn}

m["bnt-mpu"] = {
    "Mpuono", -- not to be confused with Mbuun zmp
    36056, "bnt", Latn
}

m["bnt-ngu-pro"] = {"Proto-Nguni", 961559, "bnt-ngu", {"Latinx"}, type = "reconstructed", sort_key = {from = {"[àáâǎ]", "[èéêě]", "[ìíîǐ]", "[òóôǒ]", "[ùúûǔ]", "ḿ", "[ǹńň]", ACUTE, GRAVE, CIRC, CARON}, to = {"a", "e", "i", "o", "u", "m", "n"}}}

m["bnt-phu"] = {"Phuthi", 33796, "bnt-ngu", Latn, entry_name = {from = {"[àá]", "[èé]", "[ìí]", "[òó]", "[ùú]", "ḿ", "[ǹń]", ACUTE, GRAVE}, to = {"a", "e", "i", "o", "u", "m", "n"}}}

m["bnt-pro"] = {"Proto-Bantu", 3408025, "bnt", {"Latinx"}, type = "reconstructed", sort_key = {from = {"[àá]", "[èé]", "[ìí]", "[òó]", "[ùú]", "[ǹń]", "ɪ", "ʊ", ACUTE, GRAVE}, to = {"a", "e", "i2", "o", "u2", "n", "i1", "u1"}}}

m["bnt-sbo"] = {"South Boma", nil, "bnt", Latn}

m["bnt-sts-pro"] = {"Proto-Sotho-Tswana", nil, "bnt-sts", Latn, type = "reconstructed"}

m["btk-pro"] = {"Proto-Batak", nil, "btk", {"Latinx"}, type = "reconstructed"}

m["cau-abz-pro"] = {"Proto-Abkhaz-Abaza", 7251831, "cau-abz", {"Latinx"}, type = "reconstructed"}

m["cau-ava-pro"] = {"Proto-Avaro-Andian", nil, "cau-ava", {"Latinx"}, type = "reconstructed"}

m["cau-cir-pro"] = {"Proto-Circassian", 7251838, "cau-cir", {"Latinx"}, type = "reconstructed"}

m["cau-drg-pro"] = {"Proto-Dargwa", nil, "cau-drg", {"Latinx"}, type = "reconstructed"}

m["cau-lzg-pro"] = {"Proto-Lezghian", nil, "cau-lzg", {"Latinx"}, type = "reconstructed"}

m["cau-nec-pro"] = {"Proto-Northeast Caucasian", nil, "cau-nec", {"Latinx"}, type = "reconstructed"}

m["cau-nkh-pro"] = {"Proto-Nakh", nil, "cau-nkh", {"Latinx"}, type = "reconstructed"}

m["cau-nwc-pro"] = {"Proto-Northwest Caucasian", 7251861, "cau-nwc", {"Latinx"}, type = "reconstructed"}

m["cau-tsz-pro"] = {"Proto-Tsezian", nil, "cau-tsz", {"Latinx"}, type = "reconstructed"}

m["cba-ata"] = {"Atanques", 4812783, "cba", Latn}

m["cba-cat"] = {"Catío Chibcha", 7083619, "cba", Latn}

m["cba-dor"] = {"Dorasque", 5297532, "cba", Latn}

m["cba-dui"] = {"Duit", 3041061, "cba", Latn}

m["cba-hue"] = {"Huetar", 35514, "cba", Latn}

m["cba-nut"] = {"Nutabe", 7070405, "cba", Latn}

m["cba-pro"] = {"Proto-Chibchan", nil, "cba", {"Latinx"}, type = "reconstructed"}

m["ccn-pro"] = {"Proto-North Caucasian", nil, "ccn", {"Latinx"}, type = "reconstructed"}

m["ccs-pro"] = {"Proto-Kartvelian", 2608203, "ccs", {"Latinx"}, type = "reconstructed", entry_name = {from = {"q̣", "p̣", "ʓ", "ċ"}, to = {"q̇", "ṗ", "ʒ", "c̣"}}}

m["ccs-gzn-pro"] = {"Proto-Georgian-Zan", 23808119, "ccs-gzn", {"Latinx"}, type = "reconstructed", entry_name = {from = {"q̣", "p̣", "ʓ", "ċ"}, to = {"q̇", "ṗ", "ʒ", "c̣"}}}

m["cdc-cbm-pro"] = {"Proto-Central Chadic", nil, "cdc-cbm", Latn, type = "reconstructed"}

m["cdc-mas-pro"] = {"Proto-Masa", nil, "cdc-mas", Latn, type = "reconstructed"}

m["cdc-pro"] = {"Proto-Chadic", nil, "cdc", Latn, type = "reconstructed"}

m["cdd-pro"] = {"Proto-Caddoan", nil, "cdd", {"Latinx"}, type = "reconstructed"}

m["cel-bry-pro"] = {"Proto-Brythonic", 156877, "cel-bry", {"Latinx", "Grek"}, sort_key = {from = {"[ββ̃]", "ð", "ė", "ɣ", "ɨ", "[ọö]", "[ʉü]", "θ"}, to = {"b¯", "d¯", "e", "g¯", "i", "o", "u", "t¯"}}}

m["cel-gal"] = {"Gallaecian", 3094789, "cel"}

m["cel-gau"] = {"Gaulish", 29977, "cel", {"Latn", "Grek", "Ital"}, entry_name = {remove_diacritics = MACRON .. BREVE .. DIAER}}

m["cel-pro"] = {"Proto-Celtic", 653649, "cel", {"Latinx"}, type = "reconstructed", sort_key = {from = {"ā", "ē", "[ɸφ]", "ī", "ū", "ʷ"}, to = {"a", "e", "f", "i", "u", "¯w"}}}

m["chi-pro"] = {"Proto-Chimakuan", nil, "chi", {"Latinx"}, type = "reconstructed"}

m["cmc-pro"] = {"Proto-Chamic", nil, "cmc", {"Latinx"}, type = "reconstructed"}

m["cpe-mar"] = {"Maroon Spirit Language", 1093206, "crp", Latn, ancestors = {"en"}}

m["cpe-spp"] = {"Samoan Plantation Pidgin", 7409948, "crp", Latn, ancestors = {"en"}}

m["crp-gep"] = {"West Greenlandic Pidgin", 17036301, "crp", Latn, ancestors = {"kl"}}

m["crp-mpp"] = {"Macau Pidgin Portuguese", nil, "crp", {"Hani", "Latn"}, ancestors = {"pt"}}

m["crp-rsn"] = {"Russenorsk", 505125, "crp", {"Cyrl", "Latn"}, ancestors = {"no", "ru"}}

m["crp-tpr"] = {"Taimyr Pidgin Russian", 16930506, "crp", {"Cyrl"}, ancestors = {"ru"}}

m["csu-bba-pro"] = {"Proto-Bongo-Bagirmi", nil, "csu-bba", {"Latinx"}, type = "reconstructed"}

m["csu-maa-pro"] = {"Proto-Mangbetu", nil, "csu-maa", {"Latinx"}, type = "reconstructed"}

m["csu-pro"] = {"Proto-Central Sudanic", nil, "csu", {"Latinx"}, type = "reconstructed"}

m["csu-sar-pro"] = {"Proto-Sara", nil, "csu-sar", {"Latinx"}, type = "reconstructed"}

m["ctp-san"] = {"San Juan Quiahije Chatino", nil, "omq-cha", {"Latinx"}}

m["cus-ash"] = {"Ashraaf", 4805855, "cus", {"Latn"}}

m["cus-pro"] = {"Proto-Cushitic", nil, "cus", {"Latinx"}, type = "reconstructed"}

m["dmn-dam"] = {"Dama (Sierra Leone)", 19601574, "dmn", {"Latn"}}

m["dra-mkn"] = {"Middle Kannada", nil, "dra", {"Knda"}, ancestors = {"dra-okn"}, translit_module = "kn-translit"}

m["dra-okn"] = {"Old Kannada", 15723156, "dra", {"Knda"}, ancestors = {"dra-pro"}, translit_module = "kn-translit"}

m["dra-pro"] = {"Proto-Dravidian", 1702853, "dra", {"Latinx"}, type = "reconstructed"}

m["egx-dem"] = {"Demotic", 36765, "egx", {"Latinx", "Egyd"}, ancestors = {"egy"}, sort_key = {from = {"ṱ", "t"}, to = {"h̭", "ḫ"}}}

m["elu-prk"] = {"Helu", 15080869, "inc-mid", {"Brah"}, ancestors = {"inc-pra"}}

m["dmn-pro"] = {"Proto-Mande", nil, "dmn", {"Latinx"}, type = "reconstructed"}

m["dmn-mdw-pro"] = {"Proto-Western Mande", nil, "dmn-mdw", {"Latinx"}, type = "reconstructed"}

m["dru-pro"] = {"Proto-Rukai", nil, "map", {"Latinx"}, type = "reconstructed"}

m["esx-esk-pro"] = {"Proto-Eskimo", 7251842, "esx-esk", {"Latinx"}, type = "reconstructed"}

m["esx-ink"] = {"Inuktun", 1671647, "esx-inu", Latn}

m["esx-inq"] = {"Inuinnaqtun", 28070, "esx-inu", Latn}

m["esx-inu-pro"] = {"Proto-Inuit", nil, "esx-inu", {"Latinx"}, type = "reconstructed"}

m["esx-pro"] = {"Proto-Eskimo-Aleut", 7251843, "esx", {"Latinx"}, type = "reconstructed"}

m["esx-tut"] = {"Tunumiisut", 15665389, "esx-inu", Latn}

m["euq-pro"] = {"Proto-Basque", 938011, "euq", {"Latinx"}, type = "reconstructed"}

m["fiu-fin-pro"] = {"Proto-Finnic", 11883720, "fiu-fin", Latn, type = "reconstructed"}

m["gem-bur"] = {"Burgundian", nil, "gme", Latn}

m["gem-pro"] = {"Proto-Germanic", 669623, "gem", {"Latinx"}, type = "reconstructed", sort_key = {from = {"ā", "[ēê]", "ī", "[ōô]", "ū", "ą", "į", "ǫ", "ų", CIRC, MACRON}, to = {"a", "e", "i", "o", "u", "an", "in", "on", "un"}}}

m["gme-cgo"] = {"Crimean Gothic", 36211, "gme", Latn}

m["gmq-bot"] = {"Westrobothnian", 7989641, "gmq", Latn, ancestors = {"non"}}

m["gmq-gut"] = {"Gutnish", 1256646, "gmq", Latn, ancestors = {"non"}}

m["gmq-jmk"] = {"Jamtish", nil, "gmq", Latn, ancestors = {"non"}}

m["gmq-mno"] = {"Middle Norwegian", 3417070, "gmq", Latn, ancestors = {"non"}}

-- Used for both gmq-oda (Old Danish) and gmq-osw (Old Swedish).
-- Ensure any changes are appropriate for both languages, or copy to each
-- language's table before making any changes.
local gmq_oda_entry_name = {from = {"Ā", "ā", "Ē", "ē", "Ī", "ī", "Ō", "ō", "Ū", "ū", "Ȳ", "ȳ", "Ǣ", "ǣ", MACRON}, to = {"A", "a", "E", "e", "I", "i", "O", "o", "U", "u", "Y", "y", "Æ", "æ"}}

m["gmq-oda"] = {"Old Danish", nil, "gmq", Latn, ancestors = {"non"}, entry_name = gmq_oda_entry_name}

m["gmq-osw"] = {"Old Swedish", 2417210, "gmq", Latn, ancestors = {"non"}, entry_name = gmq_oda_entry_name}

m["gmq-pro"] = {"Proto-Norse", 1671294, "gmq", {"Runr"}, translit_module = "Runr-translit"}

m["gmq-scy"] = {"Scanian", 768017, "gmq", Latn, ancestors = {"non"}}

m["gmw-cfr"] = {"Central Franconian", nil, "gmw", Latn, ancestors = {"gmh"}, wikimedia_codes = {"ksh"}}

m["gmw-ecg"] = {
    "East Central German",
    499344, -- subsumes Q699284, Q152965
    "gmw",
    Latn,
    ancestors = {"gmh"}
}

m["gmw-gts"] = {"Gottscheerish", 533109, "gmw", Latn, ancestors = {"bar"}}

m["gmw-jdt"] = {"Jersey Dutch", 1687911, "gmw", Latn, ancestors = {"nl"}}

m["gmw-pro"] = {"Proto-West Germanic", 78079021, "gmw", {"Latinx"}, type = "reconstructed", sort_key = {from = {"[āą]", "ē", "[īį]", "ō", "[ūų]", "ʀ", MACRON}, to = {"a", "e", "i", "o", "u", "r"}}}

m["gmw-rfr"] = {"Rhine Franconian", 707007, "gmw", Latn, ancestors = {"gmh"}}

m["gmw-stm"] = {"Sathmar Swabian", 2223059, "gmw", Latn, ancestors = {"swg"}}

m["gmw-tsx"] = {"Transylvanian Saxon", 260942, "gmw", Latn, ancestors = {"gmw-cfr"}}

m["gmw-vog"] = {"Volga German", 312574, "gmw", Latn, ancestors = {"gmw-rfr"}}

m["gmw-zps"] = {"Zipser German", 205548, "gmw", Latn, ancestors = {"gmh"}}

m["grk-cal"] = {"Calabrian Greek", 1146398, "grk", Latn, ancestors = {"grc"}}

m["grk-ita"] = {"Italiot Greek", nil, "grk", {"Latn", "Grek"}, ancestors = {"grc"}}

m["grk-mar"] = {"Mariupol Greek", 4400023, "grk", {"Cyrl", "Latn", "Grek"}, ancestors = {"grc"}, entry_name = {from = {ACUTE}, to = {}}}

m["grk-pro"] = {"Proto-Hellenic", 1231805, "grk", {"Latinx"}, type = "reconstructed", sort_key = {from = {"[áā]", "[éēḗ]", "[íī]", "[óōṓ]", "[úū]", "ď", "ľ", "ň", "ř", "ʰ", "ʷ", ACUTE, MACRON}, to = {"a", "e", "i", "o", "u", "d", "l", "n", "r", "¯h", "¯w"}}}

m["hmn-pro"] = {"Proto-Hmong", nil, "hmn", {"Latinx"}, type = "reconstructed"}

m["hmx-mie-pro"] = {"Proto-Mien", nil, "hmx-mie", {"Latinx"}, type = "reconstructed"}

m["hmx-pro"] = {"Proto-Hmong-Mien", 7251846, "hmx", {"Latinx"}, type = "reconstructed"}

m["hyx-pro"] = {"Proto-Armenian", 3848498, "hyx", Latn, type = "reconstructed"}

m["iir-nur-pro"] = {"Proto-Nuristani", nil, "iir-nur", {"Latinx"}, type = "reconstructed"}

m["iir-pro"] = {"Proto-Indo-Iranian", 966439, "iir", {"Latinx"}, type = "reconstructed"}

m["ijo-pro"] = {"Proto-Ijoid", nil, "ijo", {"Latinx"}, type = "reconstructed"}

m["inc-ash"] = {"Ashokan Prakrit", nil, "inc-mid", {"Brah", "Khar"}, ancestors = {"sa"}, translit_module = "translit-redirect"}

m["inc-gup"] = {"Gurjar Apabhramsa", nil, "inc-wes", {"Deva"}, ancestors = {"psu"}}

m["inc-kam"] = {"Kamarupi Prakrit", 6356097, "inc-mid", {"Brah", "Sidd"}, ancestors = {"inc-mgd"}}

m["inc-kha"] = {"Khasa Prakrit", nil, "inc-nor", {"Latn"}, ancestors = {"inc-pra"}}

m["inc-kho"] = {"Kholosi", 24952008, "inc-snd", {"Latn"}, ancestors = {"inc-vra"}}

m["inc-mas"] = {"Middle Assamese", nil, "inc-eas", {"as-Beng"}, ancestors = {"inc-oas"}, translit_module = "inc-mas-translit"}

m["inc-mbn"] = {"Middle Bengali", nil, "inc-eas", {"Beng"}, ancestors = {"inc-obn"}, translit_module = "inc-mbn-translit"}

m["inc-mgd"] = {"Magadhi Prakrit", 2652214, "inc-mid", {"Brah"}, ancestors = {"inc-pra"}, translit_module = "Brah-translit"}

m["inc-mgu"] = {"Middle Gujarati", 24907429, "inc-wes", {"Deva"}, ancestors = {"inc-ogu"}}

m["inc-mor"] = {"Middle Oriya", nil, "inc-eas", {"Orya"}, ancestors = {"inc-oor"}}

m["inc-oas"] = {"Early Assamese", nil, "inc-eas", {"as-Beng"}, ancestors = {"inc-kam"}, translit_module = "inc-oas-translit"}

m["inc-obn"] = {"Old Bengali", nil, "inc-eas", {"Beng"}, ancestors = {"inc-mgd"}}

m["inc-ogu"] = {"Old Gujarati", 24907427, "inc-wes", {"Deva"}, ancestors = {"inc-gup"}, translit_module = "sa-translit"}

m["inc-ohi"] = {"Old Hindi", 48767781, "inc-hiw", {"Deva"}, ancestors = {"inc-sap"}, translit_module = "sa-translit"}

m["inc-oor"] = {"Old Oriya", nil, "inc-eas", {"Orya"}, ancestors = {"inc-mgd"}}

m["inc-opa"] = {"Old Punjabi", nil, "inc-pan", {"Guru", "pa-Arab"}, ancestors = {"inc-tak"}, translit_module = "translit-redirect", entry_name = {from = {u(0x064B), u(0x064C), u(0x064D), u(0x064E), u(0x064F), u(0x0650), u(0x0651), u(0x0652)}, to = {}}}

m["inc-ork"] = {"Old Kamta", nil, "inc-eas", {"as-Beng"}, ancestors = {"inc-kam"}, translit_module = "as-translit"}

m["inc-pra"] = {"Prakrit", 192170, "inc-mid", {"Brah", "Deva", "Knda"}, ancestors = {"inc-ash"}, translit_module = "translit-redirect"}

m["inc-pro"] = {"Proto-Indo-Aryan", 23808344, "inc", {"Latinx"}, type = "reconstructed"}

m["inc-psc"] = {"Paisaci Prakrit", 2995607, "inc-mid", {"Brah"}, ancestors = {"inc-ash"}, translit_module = "Brah-translit"}

m["inc-sap"] = {"Sauraseni Apabhramsa", nil, "inc-cen", {"Deva"}, ancestors = {"psu"}}

m["inc-tak"] = {"Takka Apabhramsa", nil, "inc-pan", {"Deva"}, ancestors = {"inc-pra"}, translit_module = "sa-translit"}

m["inc-vra"] = {"Vracada Apabhramsa", nil, "inc-snd", {"Deva"}, ancestors = {"inc-pra"}, translit_module = "sa-translit"}

m["inc-dar-pro"] = {
    "Proto-Dardic",
    nil,
    "inc-dar",
    {"Latinx"},
    type = "reconstructed",
    ancestors = {"sa"} -- to be specific "an unattested Old Indo-Aryan dialect"
}

m["inc-cen-pro"] = {"Proto-Central Indo-Aryan", nil, "inc-cen", {"Latinx"}, type = "reconstructed", ancestors = {"psu"}}

m["inc-dar-pro"] = {"Proto-Dardic", nil, "inc-dar", {"Latinx"}, type = "reconstructed", ancestors = {"sa"}}

m["ine-ana-pro"] = {"Proto-Anatolian", 7251833, "ine-ana", {"Latinx"}, type = "reconstructed"}

m["ine-bsl-pro"] = {"Proto-Balto-Slavic", 1703347, "ine-bsl", {"Latinx"}, type = "reconstructed", sort_key = {from = {"[áā]", "[éēḗ]", "[íī]", "[óōṓ]", "[úū]", ACUTE, MACRON, "ˀ"}, to = {"a", "e", "i", "o", "u"}}}

m["ine-pae"] = {
    "Paeonian",
    2705672,
    "ine",
    {"polytonic"},
    translit_module = "grc-translit",
    sort_key = { -- Keep this synchronized with grc and others synced to it
        from = {"[ᾳάᾴὰᾲᾶᾷἀᾀἄᾄἂᾂἆᾆἁᾁἅᾅἃᾃἇᾇᾱᾍ]", "[έὲἐἔἒἑἕἓ]", "[ῃήῄὴῂῆῇἠᾐἤᾔἢᾒἦᾖἡᾑἥᾕἣᾓἧᾗ]", "[ίὶῖἰἴἲἶἱἵἳἷϊΐῒῗῑ]", "[όὸὀὄὂὁὅὃ]", "[ύὺῦὐὔὒὖὑὕὓὗϋΰῢῧῡ]", "[ῳώῴὼῲῶῷὠᾠὤᾤὢᾢὦᾦὡᾡὥᾥὣᾣὧᾧᾨ]", "ῥ", "ς"},
        to = {"α", "ε", "η", "ι", "ο", "υ", "ω", "ρ", "σ"}
    },
    entry_name = {from = {"[ᾸᾹ]", "[ᾰᾱ]", "[ῘῙ]", "[ῐῑ]", "[ῨῩ]", "[ῠῡ]"}, to = {"Α", "α", "Ι", "ι", "Υ", "υ"}}
}

m["ine-pro"] = {"Proto-Indo-European", 37178, "ine", {"Latinx"}, type = "reconstructed", sort_key = {from = {"[áā]", "[éēḗ]", "[íī]", "[óōṓ]", "[úū]", "ĺ", "ḿ", "ń", "ŕ", "ǵ", "ḱ", "ʰ", "ʷ", "₁", "₂", "₃", RINGBELOW, ACUTE, MACRON}, to = {"a", "e", "i", "o", "u", "l", "m", "n", "r", "g'", "k'", "¯h", "¯w", "1", "2", "3"}}}

m["ine-toc-pro"] = {"Proto-Tocharian", 37029, "ine-toc", {"Latinx"}, type = "reconstructed"}

m["xme-old"] = {"Old Median", 36461, "xme", {"Grek", "Latn"}}

m["xme-mid"] = {"Middle Median", nil, "xme", {"Latn"}, ancestors = {"xme-old"}}

m["xme-ker"] = {"Kermanic", 129850, "xme", {"fa-Arab", "Latn"}, ancestors = {"xme-mid"}}

m["xme-taf"] = {"Tafreshi", nil, "xme", {"fa-Arab", "Latn"}, ancestors = {"xme-mid"}}

m["xme-ttc-pro"] = {"Proto-Tatic", nil, "xme-ttc", {"Latn"}, ancestors = {"xme-mid"}}

m["xme-kls"] = {"Kalasuri", nil, "xme-ttc", ancestors = {"xme-ttc-nor"}}

m["xme-klt"] = {
    "Kilit",
    3612452,
    "xme-ttc",
    {"Cyrl"}, -- and fa-Arab?
    ancestors = {"xme-ttc-pro"}
}

m["xme-ott"] = {"Old Tati", 434697, "xme-ttc", {"fa-Arab", "Latinx"}, ancestors = {"xme-ttc-pro"}}

m["ira-pro"] = {"Proto-Iranian", 4167865, "ira", {"Latinx"}, type = "reconstructed"}

m["ira-mpr-pro"] = {"Proto-Medo-Parthian", nil, "ira-mpr", {"Latinx"}, type = "reconstructed"}

m["ira-kms-pro"] = {"Proto-Komisenian", nil, "ira-kms", {"Latinx"}, type = "reconstructed"}

m["ira-zgr-pro"] = {"Proto-Zaza-Gorani", nil, "ira-zgr", {"Latinx"}, type = "reconstructed"}

m["ira-pat-pro"] = {"Proto-Pathan", nil, "ira-pat", {"Latinx"}, type = "reconstructed"}

m["os-pro"] = {"Proto-Ossetic", nil, "xsc", {"Latinx"}, type = "reconstructed"}

m["xsc-pro"] = {"Proto-Scythian", nil, "xsc", {"Latinx"}, type = "reconstructed"}

m["xsc-skw-pro"] = {"Proto-Saka-Wakhi", nil, "xsc-skw", {"Latinx"}, type = "reconstructed", ancestors = {"xsc-pro"}}

m["xsc-sak-pro"] = {"Proto-Saka", nil, "xsc-sak", {"Latinx"}, type = "reconstructed", ancestors = {"xsc-skw-pro"}}

m["ira-sym-pro"] = {"Proto-Shughni-Yazghulami-Munji", nil, "ira-sym", {"Latinx"}, type = "reconstructed"}

m["ira-sgi-pro"] = {"Proto-Sanglechi-Ishkashimi", nil, "ira-sgi", {"Latinx"}, type = "reconstructed"}

m["ira-mny-pro"] = {"Proto-Munji-Yidgha", nil, "ira-mny", {"Latinx"}, type = "reconstructed", ancestors = {"ira-sym-pro"}}

m["ira-shy-pro"] = {"Proto-Shughni-Yazghulami", nil, "ira-shy", {"Latinx"}, type = "reconstructed", ancestors = {"ira-sym-pro"}}

m["ira-shr-pro"] = {"Proto-Shughni-Roshani", nil, "ira-shy", {"Latinx"}, type = "reconstructed", ancestors = {"ira-shy-pro"}}

m["ira-sgc-pro"] = {"Proto-Sogdic", nil, "ira-sgc", {"Latinx"}, type = "reconstructed"}

m["ira-wnj"] = {"Vanji", nil, "ira-shy", {"Latinx"}, ancestors = {"ira-shy-pro"}}

m["iro-ere"] = {"Erie", 5388365, "iro", Latn}

m["iro-min"] = {"Mingo", 128531, "iro", Latn}

m["iro-pro"] = {"Proto-Iroquoian", 7251852, "iro", {"Latinx"}, type = "reconstructed"}

m["itc-ola"] = {"Old Latin", 12289, "itc", {"Latn", "Ital"}, entry_name = {from = {"Ā", "ā", "Ē", "ē", "Ī", "ī", "Ō", "ō", "Ū", "ū", "Ȳ", "ȳ"}, to = {"A", "a", "E", "e", "I", "i", "O", "o", "U", "u", "Y", "y"}}, translit_module = "Ital-translit"}

m["itc-pro"] = {"Proto-Italic", 17102720, "itc", {"Latinx"}, type = "reconstructed"}

m["jpx-pro"] = {"Proto-Japonic", nil, "jpx", {"Latinx"}, type = "reconstructed"}

m["jpx-ryu-pro"] = {"Proto-Ryukyuan", nil, "jpx-ryu", {"Latinx"}, type = "reconstructed"}

m["kar-pro"] = {"Proto-Karen", nil, "kar", {"Latinx"}, type = "reconstructed"}

m["khi-kho-pro"] = {"Proto-Khoe", nil, "khi-kho", Latn, type = "reconstructed"}

m["khi-kun"] = {"ǃKung", 32904, "khi-kxa", Latn}

m["kro-pro"] = {"Proto-Kru", nil, "kro", Latn, type = "reconstructed"}

m["ku-pro"] = {"Proto-Kurdish", nil, "ku", {"Latinx"}, type = "reconstructed"}

m["map-ata-pro"] = {"Proto-Atayalic", nil, "map-ata", {"Latinx"}, type = "reconstructed"}

m["map-bms"] = {"Banyumasan", 33219, "map", Latn}

m["map-pro"] = {"Proto-Austronesian", 49230, "map", {"Latinx"}, type = "reconstructed"}

m["mkh-asl-pro"] = {"Proto-Aslian", 55630680, "mkh-asl", Latn, type = "reconstructed"}

m["mkh-ban-pro"] = {"Proto-Bahnaric", nil, "mkh-ban", Latn, type = "reconstructed"}

m["mkh-kat-pro"] = {"Proto-Katuic", nil, "mkh-kat", {"Latinx"}, type = "reconstructed"}

m["mkh-khm-pro"] = {"Proto-Khmuic", nil, "mkh-khm", Latn, type = "reconstructed"}

m["mkh-kmr-pro"] = {"Proto-Khmeric", 55630684, "mkh-kmr", Latn, type = "reconstructed"}

m["mkh-mkm"] = {
    "Middle Khmer",
    25226861,
    "mkh-kmr",
    {"Latinx", "Khmr"}, -- and also Pallava
    ancestors = {"mkh-okm"}
}

m["mkh-mmn"] = {
    "Middle Mon",
    nil,
    "mkh-mnc",
    {"Latinx", "Mymr"}, -- and also Pallava
    ancestors = {"omx"}
}

m["mkh-mnc-pro"] = {"Proto-Monic", nil, "mkh-mnc", Latn, type = "reconstructed"}

m["mkh-mvi"] = {"Middle Vietnamese", 9199, "mkh-vie", {"Latinx", "Hani"}}

m["mkh-okm"] = {
    "Old Khmer", 9205, "mkh-kmr", {"Latinx", "Khmr"} -- and also Pallava
}

m["mkh-pal-pro"] = {"Proto-Palaungic", nil, "mkh-pal", {"Latinx"}, type = "reconstructed"}

m["mkh-pea-pro"] = {"Proto-Pearic", nil, "mkh-pea", {"Latinx"}, type = "reconstructed"}

m["mkh-pkn-pro"] = {"Proto-Pakanic", nil, "mkh-pkn", Latn, type = "reconstructed"}

m["mkh-pro"] = { -- This will be merged into 2015 aav-pro.
    "Proto-Mon-Khmer",
    7251859,
    "mkh",
    {"Latinx"},
    type = "reconstructed"
}

m["mkh-vie-pro"] = {"Proto-Vietic", nil, "mkh-vie", {"Latinx"}, type = "reconstructed"}

m["mun-pro"] = {"Proto-Munda", nil, "mun", {"Latinx"}, type = "reconstructed"}

m["myn-chl"] = { -- the stage after ''emy''
    "Ch'olti'", 873995, "myn", {"Latinx"}
}

m["myn-pro"] = {"Proto-Mayan", 3321532, "myn", {"Latinx"}, type = "reconstructed"}

m["nai-ala"] = {"Alazapa", nil, nil, Latn}

m["nai-bay"] = {"Bayogoula", 1563704, nil, Latn}

m["nai-bvy"] = {"Buena Vista Yokuts", 4985474, "nai-yok", Latn}

m["nai-cal"] = {"Calusa", 51782, nil, Latn}

m["nai-chi"] = {"Chiquimulilla", 25339627, "nai-xin", Latn}

m["nai-chu-pro"] = {"Proto-Chumash", nil, "nai-chu", {"Latinx"}, type = "reconstructed"}

m["nai-cig"] = {"Ciguayo", 20741700, nil, Latn}

m["nai-ckn-pro"] = {"Proto-Chinookan", nil, "nai-ckn", {"Latinx"}, type = "reconstructed"}

m["nai-dly"] = {"Delta Yokuts", nil, "nai-yok", Latn}

m["nai-gsy"] = {"Gashowu", nil, "nai-yok", Latn}

m["nai-guz"] = {"Guazacapán", 19572028, "nai-xin", Latn}

m["nai-hit"] = {"Hitchiti", 1542882, "nai-mus", Latn}

m["nai-ipa"] = {"Ipai", 3027474, "nai-yuc", Latn}

m["nai-jtp"] = {"Jutiapa", nil, "nai-xin", Latn}

m["nai-jum"] = {"Jumaytepeque", 25339626, "nai-xin", Latn}

m["nai-kat"] = {"Kathlamet", 6376639, "nai-ckn", Latn}

m["nai-klp-pro"] = {"Proto-Kalapuyan", nil, "nai-klp", type = "reconstructed"}

m["nai-knm"] = {"Konomihu", 3198734, "nai-shs", Latn}

m["nai-kry"] = {"Kings River Yokuts", 6413014, "nai-yok", Latn}

m["nai-kum"] = {"Kumeyaay", 4910139, "nai-yuc", Latn}

m["nai-mac"] = {"Macoris", 21070851, nil, Latn}

m["nai-mdu-pro"] = {"Proto-Maidun", nil, "nai-mdu", {"Latinx"}, type = "reconstructed"}

m["nai-miz-pro"] = {"Proto-Mixe-Zoque", nil, "nai-miz", {"Latinx"}, type = "reconstructed"}

m["nai-nao"] = {"Naolan", 6964594, nil, Latn}

m["nai-nrs"] = {"New River Shasta", 7011254, "nai-shs", Latn}

m["nai-nvy"] = {"Northern Valley Yokuts", nil, "nai-yok", Latn}

m["nai-okw"] = {"Okwanuchu", 3350126, "nai-shs", Latn}

m["nai-per"] = {"Pericú", 3375369, nil, Latn}

m["nai-pic"] = {"Picuris", 7191257, "nai-kta", Latn}

m["nai-plp-pro"] = {"Proto-Plateau Penutian", nil, "nai-plp", {"Latinx"}, type = "reconstructed"}

m["nai-ply"] = {"Palewyami", 2387391, "nai-yok", Latn}

m["nai-pom-pro"] = {"Proto-Pomo", nil, "nai-pom", Latn, type = "reconstructed"}

m["nai-qng"] = {"Quinigua", 36360, nil, Latn}

m["nai-sca-pro"] = { -- NB 'sio-pro' "Proto-Siouan" which is Proto-Western Siouan
    "Proto-Siouan-Catawban",
    nil,
    "nai-sca",
    {"Latinx"},
    type = "reconstructed"
}

m["nai-sin"] = {"Sinacantán", 24190249, "nai-xin", Latn}

m["nai-sln"] = {"Salvadoran Lenca", 3229434, "nai-len", Latn}

m["nai-spt"] = {"Sahaptin", 3833015, "nai-shp", Latn}

m["nai-svy"] = {"Southern Valley Yokuts", nil, "nai-yok", Latn}

m["nai-tap"] = {"Tapachultec", 7684401, "nai-miz", Latn}

m["nai-taw"] = {"Tawasa", 7689233, nil, Latn}

m["nai-teq"] = {"Tequistlatec", 2964454, "nai-tqn", Latn}

m["nai-tip"] = {"Tipai", 3027471, "nai-yuc", Latn}

m["nai-tky"] = {"Tule-Kaweah Yokuts", 7851988, "nai-yok", Latn}

m["nai-tot-pro"] = {"Proto-Totozoquean", nil, "nai-tot", {"Latinx"}, type = "reconstructed"}

m["nai-tsi-pro"] = {"Proto-Tsimshianic", nil, "nai-tsi", {"Latinx"}, type = "reconstructed"}

m["nai-utn-pro"] = {"Proto-Utian", nil, "nai-utn", {"Latinx"}, type = "reconstructed"}

m["nai-wai"] = {"Waikuri", 3118702, nil, Latn}

m["nai-yav"] = {"Yavapai", 34202, "nai-yuc", Latn}

m["nai-yup"] = {"Yupiltepeque", 25339628, "nai-xin", Latn}

m["nds-de"] = {"German Low German", 25433, "gmw", Latn, ancestors = {"nds"}, wikimedia_codes = {"nds"}}

m["nds-nl"] = {"Dutch Low Saxon", 516137, "gmw", Latn, ancestors = {"nds"}}

m["ngf-pro"] = {"Proto-Trans-New Guinea", nil, "ngf", Latn, type = "reconstructed"}

m["nic-bco-pro"] = {"Proto-Benue-Congo", nil, "nic-bco", Latn, type = "reconstructed"}

m["nic-bod-pro"] = {"Proto-Bantoid", nil, "nic-bod", Latn, type = "reconstructed"}

m["nic-eov-pro"] = {"Proto-Eastern Oti-Volta", nil, "nic-eov", Latn, type = "reconstructed"}

m["nic-gns-pro"] = {"Proto-Gurunsi", nil, "nic-gns", Latn, type = "reconstructed"}

m["nic-grf-pro"] = {"Proto-Grassfields", nil, "nic-grf", Latn, type = "reconstructed"}

m["nic-gur-pro"] = {"Proto-Gur", nil, "nic-gur", Latn, type = "reconstructed"}

m["nic-jkn-pro"] = {"Proto-Jukunoid", nil, "nic-jkn", Latn, type = "reconstructed"}

m["nic-lcr-pro"] = {"Proto-Lower Cross River", nil, "nic-lcr", Latn, type = "reconstructed"}

m["nic-ogo-pro"] = {"Proto-Ogoni", nil, "nic-ogo", Latn, type = "reconstructed"}

m["nic-ovo-pro"] = {"Proto-Oti-Volta", nil, "nic-ovo", Latn, type = "reconstructed"}

m["nic-plt-pro"] = {"Proto-Plateau", nil, "nic-plt", Latn, type = "reconstructed"}

m["nic-pro"] = {"Proto-Niger-Congo", nil, "nic", Latn, type = "reconstructed"}

m["nic-ubg-pro"] = {"Proto-Ubangian", nil, "nic-ubg", Latn, type = "reconstructed"}

m["nic-ucr-pro"] = {"Proto-Upper Cross River", nil, "nic-ucr", Latn, type = "reconstructed"}

m["nic-vco-pro"] = {"Proto-Volta-Congo", nil, "nic-vco", Latn, type = "reconstructed"}

m["nub-har"] = {"Haraza", 19572059, "nub", {"Arab", "Latn"}}

m["nub-pro"] = {"Proto-Nubian", nil, "nub", Latn, type = "reconstructed"}

m["omq-cha-pro"] = {"Proto-Chatino", nil, "omq-cha", Latn, type = "reconstructed"}

m["omq-maz-pro"] = {"Proto-Mazatec", nil, "omq-maz", Latn, type = "reconstructed"}

m["omq-mix-pro"] = {"Proto-Mixtecan", nil, "omq-mix", Latn, type = "reconstructed"}

m["omq-mxt-pro"] = {"Proto-Mixtec", nil, "omq-mxt", Latn, type = "reconstructed"}

m["omq-otp-pro"] = {"Proto-Oto-Pamean", nil, "omq-otp", Latn, type = "reconstructed", ancestors = {"omq-pro"}}

m["omq-pro"] = {"Proto-Oto-Manguean", 33669, "omq", Latn, type = "reconstructed"}

m["omq-tel"] = {"Teposcolula Mixtec", nil, "omq-mxt", Latn}

m["omq-teo"] = {"Teojomulco Chatino", 25340451, "omq-cha", Latn}

m["omq-tri-pro"] = {"Proto-Trique", nil, "omq-tri", Latn, type = "reconstructed"}

m["omq-zap-pro"] = {"Proto-Zapotecan", nil, "omq-zap", Latn, type = "reconstructed"}

m["omq-zpc-pro"] = {"Proto-Zapotec", nil, "omq-zpc", Latn, type = "reconstructed"}

m["omv-aro-pro"] = {"Proto-Aroid", nil, "omv-aro", Latn, type = "reconstructed"}

m["omv-diz-pro"] = {"Proto-Dizoid", nil, "omv-diz", Latn, type = "reconstructed"}

m["omv-pro"] = {"Proto-Omotic", nil, "omv", Latn, type = "reconstructed"}

m["oto-otm-pro"] = {"Proto-Otomi", nil, "oto-otm", Latn, type = "reconstructed", ancestors = {"oto-pro"}}

m["oto-pro"] = {"Proto-Otomian", nil, "oto", Latn, type = "reconstructed", ancestors = {"omq-otp-pro"}}

m["paa-kom"] = {"Kómnzo", 18344310, "paa-yam", Latn}

m["paa-kwn"] = {"Kuwani", 6449056, "paa", Latn}

m["paa-nun"] = {"Nungon", nil, "paa", Latn}

m["phi-din"] = {"Dinapigue Agta", 16945774, "phi", Latn}

m["phi-kal-pro"] = {"Proto-Kalamian", nil, "phi-kal", Latn, type = "reconstructed"}

m["phi-nag"] = {"Nagtipunan Agta", 16966111, "phi", Latn}

m["phi-pro"] = {"Proto-Philippine", 18204898, "phi", {"Latinx"}, type = "reconstructed"}

m["poz-abi"] = {"Abai", 19570729, "poz-san", Latn}

m["poz-bal"] = {"Baliledo", 4850912, "poz", Latn}

m["poz-btk-pro"] = {"Proto-Bungku-Tolaki", nil, "poz-btk", {"Latinx"}, type = "reconstructed"}

m["poz-cet-pro"] = {"Proto-Central-Eastern Malayo-Polynesian", 2269883, "poz-cet", {"Latinx"}, type = "reconstructed"}

m["poz-hce-pro"] = {"Proto-Halmahera-Cenderawasih", nil, "poz-hce", {"Latinx"}, type = "reconstructed"}

m["poz-lgx-pro"] = {"Proto-Lampungic", nil, "poz-lgx", {"Latinx"}, type = "reconstructed"}

m["poz-mcm-pro"] = {"Proto-Malayo-Chamic", nil, "poz-mcm", {"Latinx"}, type = "reconstructed"}

m["poz-mly-pro"] = {"Proto-Malayic", nil, "poz-mly", {"Latinx"}, type = "reconstructed"}

m["poz-msa-pro"] = {"Proto-Malayo-Sumbawan", nil, "poz-msa", {"Latinx"}, type = "reconstructed"}

m["poz-oce-pro"] = {"Proto-Oceanic", 141741, "poz-oce", {"Latinx"}, type = "reconstructed"}

m["poz-pep-pro"] = {"Proto-Eastern Polynesian", nil, "poz-pep", {"Latinx"}, type = "reconstructed"}

m["poz-pnp-pro"] = {"Proto-Nuclear Polynesian", nil, "poz-pnp", {"Latinx"}, type = "reconstructed"}

m["poz-pol-pro"] = {"Proto-Polynesian", 1658709, "poz-pol", {"Latinx"}, type = "reconstructed"}

m["poz-pro"] = {"Proto-Malayo-Polynesian", 3832960, "poz", {"Latinx"}, type = "reconstructed"}

m["poz-ssw-pro"] = {"Proto-South Sulawesi", nil, "poz-ssw", {"Latinx"}, type = "reconstructed"}

m["poz-sus-pro"] = {"Proto-Sunda-Sulawesi", nil, "poz-sus", {"Latinx"}, type = "reconstructed"}

m["poz-swa-pro"] = {"Proto-North Sarawak", nil, "poz-swa", {"Latinx"}, type = "reconstructed"}

m["pqe-pro"] = {"Proto-Eastern Malayo-Polynesian", 2269883, "pqe", {"Latinx"}, type = "reconstructed"}

m["pra-niy"] = {"Niya Prakrit", nil, "inc-mid", {"Khar"}, ancestors = {"inc-ash"}, translit_module = "Khar-translit"}

m["qfa-adm-pro"] = {"Proto-Great Andamanese", nil, "qfa-adm", {"Latinx"}, type = "reconstructed"}

m["qfa-bet-pro"] = {"Proto-Be-Tai", nil, "qfa-bet", {"Latinx"}, type = "reconstructed"}

m["qfa-cka-pro"] = {"Proto-Chukotko-Kamchatkan", 7251837, "qfa-cka", {"Latinx"}, type = "reconstructed"}

m["qfa-hur-pro"] = {"Proto-Hurro-Urartian", nil, "qfa-hur", {"Latinx"}, type = "reconstructed"}

m["qfa-kad-pro"] = {"Proto-Kadu", nil, "qfa-kad", Latn, type = "reconstructed"}

m["qfa-kms-pro"] = {"Proto-Kam-Sui", nil, "qfa-kms", Latn, type = "reconstructed"}

m["qfa-kor-pro"] = {"Proto-Korean", 467883, "qfa-kor", {"Latinx"}, type = "reconstructed"}

m["qfa-kra-pro"] = {"Proto-Kra", 7251854, "qfa-kra", {"Latinx"}, type = "reconstructed"}

m["qfa-lic-pro"] = {"Proto-Hlai", 7251845, "qfa-lic", {"Latinx"}, type = "reconstructed"}

m["qfa-onb-pro"] = {"Proto-Be", nil, "qfa-onb", {"Latinx"}, type = "reconstructed"}

m["qfa-ong-pro"] = {"Proto-Ongan", nil, "qfa-ong", {"Latinx"}, type = "reconstructed"}

m["qfa-tak-pro"] = {"Proto-Kra-Dai", nil, "qfa-tak", Latn, type = "reconstructed"}

m["qfa-yen-pro"] = {"Proto-Yeniseian", 27639, "qfa-yen", {"Latinx"}, type = "reconstructed"}

m["qfa-yuk-pro"] = {"Proto-Yukaghir", nil, "qfa-yuk", {"Latinx"}, type = "reconstructed"}

m["qwe-kch"] = {"Kichwa", 1740805, "qwe", Latn, ancestors = {"qu"}}

m["roa-ang"] = {"Angevin", 56782, "roa-oil", Latn, sort_key = {from = {"[áàâä]", "[éèêë]", "[íìîï]", "[óòôö]", "[úùûü]", "[ýỳŷÿ]", "ç", "æ", "œ", "'"}, to = {"a", "e", "i", "o", "u", "y", "c", "ae", "oe"}}}

m["roa-bbn"] = {"Bourbonnais-Berrichon", nil, "roa-oil", Latn, sort_key = {from = {"[áàâä]", "[éèêë]", "[íìîï]", "[óòôö]", "[úùûü]", "[ýỳŷÿ]", "ç", "æ", "œ", "'"}, to = {"a", "e", "i", "o", "u", "y", "c", "ae", "oe"}}}

m["roa-brg"] = {"Bourguignon", 508332, "roa-oil", Latn, sort_key = {from = {"[áàâä]", "[éèêë]", "[íìîï]", "[óòôö]", "[úùûü]", "[ýỳŷÿ]", "ç", "'"}, to = {"a", "e", "i", "o", "u", "y", "c"}}}

m["roa-cha"] = {"Champenois", 430018, "roa-oil", Latn, sort_key = {from = {"[áàâä]", "[éèêë]", "[íìîï]", "[óòôö]", "[úùûü]", "[ýỳŷÿ]", "ç", "æ", "œ", "'"}, to = {"a", "e", "i", "o", "u", "y", "c", "ae", "oe"}}}

m["roa-fcm"] = {"Franc-Comtois", 510561, "roa-oil", Latn, sort_key = {from = {"[áàâä]", "[éèêë]", "[íìîï]", "[óòôö]", "[úùûü]", "[ýỳŷÿ]", "ç", "æ", "œ", "'"}, to = {"a", "e", "i", "o", "u", "y", "c", "ae", "oe"}}}

m["roa-gal"] = {"Gallo", 37300, "roa-oil", Latn, sort_key = {from = {"[áàâä]", "[éèêë]", "[íìîï]", "[óòôö]", "[úùûü]", "[ýỳŷÿ]", "ç", "'"}, to = {"a", "e", "i", "o", "u", "y", "c"}}}

m["roa-leo"] = {"Leonese", 34108, "roa-ibe", Latn, ancestors = {"roa-ole"}}

m["roa-lor"] = {"Lorrain", 671198, "roa-oil", Latn, sort_key = {from = {"[áàâä]", "[éèêë]", "[íìîï]", "[óòôö]", "[úùûü]", "[ýỳŷÿ]", "ç", "æ", "œ", "'"}, to = {"a", "e", "i", "o", "u", "y", "c", "ae", "oe"}}}

m["roa-oan"] = {"Navarro-Aragonese", 2736184, "roa-ibe", Latn}

m["roa-oca"] = {"Old Catalan", 15478520, "roa", Latn, ancestors = {"pro"}, sort_key = {from = {"à", "[èé]", "[íï]", "[òó]", "[úü]", "ç", "·"}, to = {"a", "e", "i", "o", "u", "c"}}}

m["roa-ole"] = {"Old Leonese", nil, "roa-ibe", Latn}

m["roa-opt"] = {"Old Portuguese", 1072111, "roa-ibe", Latn}

m["roa-orl"] = {"Orléanais", nil, "roa-oil", Latn, sort_key = {from = {"[áàâä]", "[éèêë]", "[íìîï]", "[óòôö]", "[úùûü]", "[ýỳŷÿ]", "ç", "æ", "œ", "'"}, to = {"a", "e", "i", "o", "u", "y", "c", "ae", "oe"}}}

m["roa-poi"] = {"Poitevin-Saintongeais", 514123, "roa-oil", Latn, sort_key = {from = {"[áàâä]", "[éèêë]", "[íìîï]", "[óòôö]", "[úùûü]", "[ýỳŷÿ]", "ç", "æ", "œ", "'"}, to = {"a", "e", "i", "o", "u", "y", "c", "ae", "oe"}}}

m["roa-tar"] = {"Tarantino", 695526, "roa-itd", Latn, ancestors = {"nap"}, wikimedia_codes = {"roa-tara"}}

m["roa-tou"] = {"Tourangeau", nil, "roa-oil", Latn, sort_key = {from = {"[áàâä]", "[éèêë]", "[íìîï]", "[óòôö]", "[úùûü]", "[ýỳŷÿ]", "ç", "æ", "œ", "'"}, to = {"a", "e", "i", "o", "u", "y", "c", "ae", "oe"}}}

m["sai-ajg"] = {"Ajagua", nil, nil, Latn}

m["sai-all"] = {"Allentiac", 19570789, "sai-hrp", Latn}

m["sai-and"] = { -- not to be confused with 'cbc' or 'ano'
    "Andoquero", 16828359, "sai-wit", Latn
}

m["sai-ayo"] = {"Ayomán", 16937754, "sai-jir", Latn}

m["sai-bae"] = {"Baenan", 3401998, nil, Latn}

m["sai-bag"] = {"Bagua", 5390321, nil, Latn}

m["sai-bet"] = {"Betoi", 926551, "qfa-iso", Latn}

m["sai-bor-pro"] = {"Proto-Boran", nil, "sai-bor", Latn}

m["sai-cac"] = {"Cacán", 945482, nil, Latn}

m["sai-caq"] = {"Caranqui", 2937753, "sai-bar", Latn}

m["sai-cat"] = {"Catacao", 5051136, "sai-ctc", {"Latinx"}}

m["sai-cer-pro"] = {"Proto-Cerrado", nil, "sai-cer", Latn, type = "reconstructed"}

m["sai-chi"] = {"Chirino", 5390321, nil, Latn}

m["sai-chn"] = {"Chaná", 5072718, "sai-crn", Latn}

m["sai-chp"] = {"Chapacura", 5072884, "sai-cpc", Latn}

m["sai-chr"] = {"Charrua", 5086680, "sai-crn", Latn}

m["sai-chu"] = {"Churuya", 5118339, "sai-guh", Latn}

m["sai-cje-pro"] = {"Proto-Central Jê", nil, "sai-cje", Latn, type = "reconstructed"}

m["sai-cmg"] = {"Comechingon", 6644203, nil, Latn}

m["sai-cno"] = {"Chono", 5104704, nil, Latn}

m["sai-cnr"] = {"Cañari", 5055572, nil, Latn}

m["sai-coe"] = {"Coeruna", 6425639, "sai-wit", Latn}

m["sai-col"] = {"Colán", 5141893, "sai-ctc", {"Latinx"}}

m["sai-cop"] = {"Copallén", 5390321, nil, Latn}

m["sai-crd"] = {"Coroado Puri", 24191321, "sai-mje", Latn}

m["sai-ctq"] = {"Catuquinaru", 16858455, nil, Latn}

m["sai-cul"] = {"Culli", 2879660, nil, Latn}

m["sai-cva"] = {"Cueva", nil, nil, Latn}

m["sai-esm"] = {"Esmeralda", 3058083, nil, Latn}

m["sai-ewa"] = {"Ewarhuyana", 16898104, nil, Latn}

m["sai-gam"] = {"Gamela", 5403661, nil, Latn}

m["sai-gay"] = {"Gayón", 5528902, "sai-jir", Latn}

m["sai-gmo"] = {"Guamo", 5613495, nil, Latn}

m["sai-gue"] = {"Güenoa", 5626799, "sai-crn", Latn}

m["sai-hau"] = {"Haush", 3128376, "sai-cho", Latn}

m["sai-hoc-pro"] = {"Proto-Huitoto-Ocaina", nil, "sai-hoc", Latn, type = "reconstructed"}

m["sai-jee-pro"] = {"Proto-Jê", nil, "sai-jee", Latn, type = "reconstructed"}

m["sai-jko"] = {"Jeikó", 6176527, "sai-mje", Latn}

m["sai-jrj"] = {"Jirajara", 6202966, "sai-jir", Latn}

m["sai-kat"] = { -- contrast xoo, kzw, sai-xoc
    "Katembri", 6375925, nil, Latn
}

m["sai-mal"] = {"Malalí", 6741212, nil, Latn}

m["sai-mar"] = {"Maratino", 6755055, nil, Latn}

m["sai-mat"] = {"Matanawi", 6786047, nil, Latn}

m["sai-mcn"] = {"Mocana", 3402048, nil, Latn}

m["sai-men"] = {"Menien", 16890110, "sai-mje", Latn}

m["sai-mil"] = {"Millcayac", 19573012, "sai-hrp", Latn}

m["sai-mlb"] = {"Malibu", 3402048, nil, Latn}

m["sai-msk"] = {"Masakará", 6782426, "sai-mje", Latn}

m["sai-muc"] = {"Mucuchí", nil, nil, Latn}

m["sai-mue"] = {"Muellama", 16886936, "sai-bar", Latn}

m["sai-muz"] = {"Muzo", 6644203, nil, Latn}

m["sai-mys"] = {"Maynas", 16919393, nil, Latn}

m["sai-nat"] = {"Natú", 9006749, nil, Latn}

m["sai-nje-pro"] = {"Proto-Northern Jê", nil, "sai-nje", Latn, type = "reconstructed"}

m["sai-opo"] = {"Opón", 7099152, "sai-car", Latn}

m["sai-oto"] = {"Otomaco", 16879234, "sai-otm", Latn}

m["sai-pal"] = {"Palta", 3042978, nil, Latn}

m["sai-pam"] = {"Pamigua", 5908689, "sai-otm", Latn}

m["sai-par"] = {"Paratió", 16890038, nil, Latn}

m["sai-pnz"] = {"Panzaleo", 3123275, nil, Latn}

m["sai-prh"] = {"Puruhá", 3410994, nil, Latn}

m["sai-ptg"] = {"Patagón", nil, nil, Latn}

m["sai-pur"] = {"Purukotó", 7261622, "sai-car", Latn}

m["sai-pyg"] = {"Payaguá", 7156643, "sai-guc", Latn}

m["sai-pyk"] = {"Pykobjê", 98113977, "sai-nje", Latn}

m["sai-qmb"] = {"Quimbaya", 7272043, nil, Latn}

m["sai-qtm"] = {"Quitemo", 7272651, "sai-cpc", Latn}

m["sai-rab"] = {"Rabona", 6644203, nil, Latn}

m["sai-ram"] = {"Ramanos", 16902824, nil, Latn}

m["sai-sac"] = {"Sácata", 5390321, nil, Latn}

m["sai-san"] = {"Sanaviron", 16895999, nil, Latn}

m["sai-sap"] = {"Sapará", 7420922, "sai-car", Latn}

m["sai-sec"] = {"Sechura", 7442912, nil, Latn}

m["sai-sin"] = {"Sinúfana", 7525275, nil, Latn}

m["sai-sje-pro"] = {"Proto-Southern Jê", nil, "sai-sje", Latn, type = "reconstructed"}

m["sai-tab"] = {"Tabancale", 5390321, nil, Latn}

m["sai-tal"] = {"Tallán", 16910468, nil, Latn}

m["sai-tap"] = {"Tapayuna", nil, "sai-nje", Latn}

m["sai-teu"] = {"Teushen", 3519243, nil, Latn}

m["sai-tim"] = {"Timote", nil, nil, Latn}

m["sai-tpr"] = {"Taparita", 7684460, "sai-otm", Latn}

m["sai-trr"] = {"Tarairiú", 7685313, nil, Latn}

m["sai-wai"] = {"Waitaká", 16918610, nil, Latn}

m["sai-way"] = {"Wayumará", nil, "sai-car", Latn}

m["sai-wit-pro"] = {"Proto-Witotoan", nil, "sai-wit", Latn, type = "reconstructed"}

m["sai-wnm"] = {"Wanham", 16879440, "sai-cpc", Latn}

m["sai-xoc"] = { -- contrast xoo, kzw, sai-kat
    "Xocó", 12953620, nil, Latn
}

m["sai-yao"] = {"Yao (South America)", nil, "sai-car", Latn}

m["sai-yar"] = { -- not the same family as 'suy'
    "Yarumá", 3505859, "sai-car", Latn
}

m["sai-yri"] = {"Yuri", nil, "sai-tyu", Latn}

m["sai-yup"] = {"Yupua", 8061430, "sai-tuc", Latn}

m["sai-yur"] = {"Yurumanguí", 1281291, nil, Latn}

m["sal-pro"] = {"Proto-Salish", nil, "sal", Latn, type = "reconstructed"}

m["sdv-daj-pro"] = {"Proto-Daju", nil, "sdv-daj", Latn, type = "reconstructed"}

m["sdv-eje-pro"] = {"Proto-Eastern Jebel", nil, "sdv-eje", Latn, type = "reconstructed"}

m["sdv-nil-pro"] = {"Proto-Nilotic", nil, "sdv-nil", Latn, type = "reconstructed"}

m["sdv-nyi-pro"] = {"Proto-Nyima", nil, "sdv-nyi", Latn, type = "reconstructed"}

m["sdv-tmn-pro"] = {"Proto-Taman", nil, "sdv-tmn", Latn, type = "reconstructed"}

m["sem-amm"] = {"Ammonite", 279181, "sem-can", {"Phnx"}, translit_module = "Phnx-translit"}

m["sem-amo"] = {"Amorite", 35941, "sem-nwe", {"Xsux", "Latn"}}

m["sem-cha"] = {"Chaha", nil, "sem-eth", {"Ethi"}, translit_module = "Ethi-translit", ancestors = {"sem-pro"}}

m["sem-dad"] = {"Dadanitic", 21838040, "sem-cen", {"Narb"}, translit_module = "Narb-translit"}

m["sem-dum"] = {"Dumaitic", nil, "sem-cen", {"Narb"}, translit_module = "Narb-translit"}

m["sem-has"] = {"Hasaitic", 3541433, "sem-cen", {"Narb"}, translit_module = "Narb-translit"}

m["sem-him"] = {"Himyaritic", 35604, "sem", {"Arab", "Sarb"}}

m["sem-his"] = {"Hismaic", 22948260, "sem-cen", {"Narb"}, translit_module = "Narb-translit"}

m["sem-mhr"] = {"Muher", 33743, "sem-eth", Latn}

m["sem-pro"] = {"Proto-Semitic", 1658554, "sem", {"Latinx"}, type = "reconstructed"}

m["sem-saf"] = {"Safaitic", 472586, "sem-cen", {"Narb"}, translit_module = "Narb-translit"}

m["sem-srb"] = {"Old South Arabian", 35025, "sem-osa", {"Sarb"}, translit_module = "Sarb-translit"}

m["sem-tay"] = {"Taymanitic", 24912301, "sem-cen", {"Narb"}, translit_module = "Narb-translit"}

m["sem-tha"] = {"Thamudic", 843030, "sem-cen", {"Narb"}, translit_module = "Narb-translit"}

m["sem-wes-pro"] = {"Proto-West Semitic", 98021726, "sem-wes", {"Latinx"}, type = "reconstructed"}

m["sio-pro"] = { -- NB this is not Proto-Siouan-Catawban 'nai-sca-pro'
    "Proto-Siouan",
    34181,
    "sio",
    {"Latinx"},
    type = "reconstructed"
}

m["sit-bok"] = {"Bokar", 4938727, "sit-tan", Latn}

m["sit-cha"] = {"Chairel", 5068066, "sit-luu", Latn}

m["sit-gkh"] = {"Gokhy", 5578069, "tbq-lol", Latn}

m["sit-hrs-pro"] = {"Proto-Hrusish", nil, "sit-hrs", type = "reconstructed"}

m["sit-jap"] = {"Japhug", 3162245, "sit-rgy", Latn}

m["sit-kha-pro"] = {"Proto-Kham", nil, "sit-kha", type = "reconstructed"}

m["sit-liz"] = {
    "Lizu", 6660653, "sit-qia", Latn -- and Ersu Shaba
}

m["sit-luu-pro"] = {"Proto-Luish", nil, "sit-luu", type = "reconstructed"}

m["sit-mor"] = {"Moran", 6909216, "tbq-bdg", Latn}

m["sit-prn"] = {"Puiron", 7259048, "sit-zem"}

m["sit-pro"] = {"Proto-Sino-Tibetan", 45961, "sit", Latn, type = "reconstructed"}

m["sit-sit"] = {"Situ", 19840830, "sit-rgy", Latn}

m["sit-tan-pro"] = {
    "Proto-Tani",
    nil,
    "sit-tan",
    Latn, -- needs verification
    type = "reconstructed"
}

m["sit-tgm"] = {"Tangam", 17041370, "sit-tan", Latn}

m["sit-tos"] = {
    "Tosu", 7827899, "sit-qia", Latn -- also Ersu Shaba
}

m["sit-tsh"] = {"Tshobdun", 19840950, "sit-rgy", Latn}

m["sit-zbu"] = {"Zbu", 19841106, "sit-rgy", Latn}

m["sla-pro"] = {"Proto-Slavic", 747537, "sla", {"Latinx"}, type = "reconstructed", entry_name = {from = {"[ÀÁÃĀȀȂ]", "[àáãāȁȃ]", "[ÈÉẼĒȄȆ]", "[èéẽēȅȇ]", "[ÌÍĨĪȈȊ]", "[ìíĩīȉȋ]", "[ÒÓÕŌȌȎ]", "[òóõōȍȏ]", "[ÙÚŨŪȔȖ]", "[ùúũūȕȗ]", "[ỲÝỸȲ]", "[ỳýỹȳ]", "[Ǭ]", "[ǭ]", GRAVE, ACUTE, TILDE, MACRON, DGRAVE, INVBREVE}, to = {"A", "a", "E", "e", "I", "i", "O", "o", "U", "u", "Y", "y", "Ǫ", "ǫ"}}, sort_key = {from = {"č", "ď", "ě", "ę", "ь", "ľ", "ň", "ǫ", "ř", "š", "ś", "ť", "ъ", "ž"}, to = {"c²", "d²", "e²", "e³", "i²", "l²", "nj", "o²", "r²", "s²", "s³", "t²", "u²", "z²"}}}

m["smi-pro"] = {"Proto-Samic", 7251862, "smi", Latn, type = "reconstructed", sort_key = {from = {"ā", "č", "δ", "[ëē]", "ŋ", "ń", "ō", "š", "θ", "%([^()]+%)"}, to = {"a", "c²", "d", "e", "n²", "n³", "o", "s²", "t²"}}}

m["son-pro"] = {"Proto-Songhay", nil, "son", {"Latinx"}, type = "reconstructed"}

m["sqj-pro"] = {"Proto-Albanian", 18210846, "sqj", {"Latinx"}, type = "reconstructed"}

m["ssa-klk-pro"] = {"Proto-Kuliak", nil, "ssa-klk", {"Latinx"}, type = "reconstructed"}

m["ssa-kom-pro"] = {"Proto-Koman", nil, "ssa-kom", {"Latinx"}, type = "reconstructed"}

m["ssa-pro"] = {"Proto-Nilo-Saharan", nil, "ssa", {"Latinx"}, type = "reconstructed"}

m["syd-fne"] = {"Forest Nenets", 1295107, "syd", {"Cyrl"}, entry_name = {from = {"Ӑ", "ӑ", "[ӖЀ]", "[ӗѐ]", "[ӢЍ]", "[ӣѝ]", "Ӯ", "ӯ", BREVE, MACRON, GRAVE, ACUTE, DOTABOVE}, to = {"А", "а", "Е", "е", "И", "и", "У", "у"}}}

m["syd-pro"] = {"Proto-Samoyedic", 7251863, "syd", Latn, type = "reconstructed"}

m["tai-pro"] = {"Proto-Tai", 6583709, "tai", {"Latinx"}, type = "reconstructed"}

m["tai-swe-pro"] = {"Proto-Southwestern Tai", nil, "tai-swe", {"Latinx"}, type = "reconstructed"}

m["tbq-bdg-pro"] = {"Proto-Bodo-Garo", nil, "tbq-bdg", {"Latinx"}, type = "reconstructed"}

m["tbq-kuk-pro"] = {"Proto-Kuki-Chin", nil, "tbq-kuk", {"Latinx"}, type = "reconstructed"}

m["tbq-lal-pro"] = {"Proto-Lalo", nil, "tbq-lol", {"Latinx"}, type = "reconstructed"}

m["tbq-laz"] = {"Laze", 17007626, "sit-nax"}

m["tbq-lob-pro"] = {"Proto-Lolo-Burmese", nil, "tbq-lob", {"Latinx"}, type = "reconstructed"}

m["tbq-lol-pro"] = {"Proto-Loloish", 7251855, "tbq-lol", {"Latinx"}, type = "reconstructed"}

m["tbq-plg"] = {"Pai-lang", 2879843, "tbq-lob", {"Hani", "Latinx"}}

-- tbq-pro is now etymology-only

m["trk-dkh"] = {"Dukhan", nil, "trk-sib", {"Latn", "Cyrl", "Mong"}}

m["trk-oat"] = {"Old Anatolian Turkish", 7083390, "trk-ogz", {"ota-Arab"}, ancestors = {"trk-ogz-pro"}}

m["trk-pro"] = {"Proto-Turkic", 3657773, "trk", {"Latinx"}, type = "reconstructed"}

m["tup-gua-pro"] = {"Proto-Tupi-Guarani", nil, "tup-gua", {"Latinx"}, type = "reconstructed"}

m["tup-kab"] = {"Kabishiana", 15302988, "tup", Latn}

m["tup-pro"] = {"Proto-Tupian", 10354700, "tup", {"Latinx"}, type = "reconstructed"}

m["tuw-pro"] = {"Proto-Tungusic", nil, "tuw", {"Latinx"}, type = "reconstructed"}

m["tuw-sol"] = {"Solon", 30004, "tuw"}

m["und-isa"] = {
    "Isaurian", 16956868, nil
    --	{"Xsux", "Hluw", "Latn"},
}

m["und-kas"] = {"Kassite", 35612, nil, {"Xsux"}}

m["und-mil"] = {"Milang", 6850761, nil, {"Deva", "Latn"}}

m["und-mmd"] = {"Mimi of Decorse", 6862206, nil, Latn}

m["und-mmn"] = {"Mimi of Nachtigal", 6862207, nil, Latn}

m["und-phi"] = {"Philistine", 2230924}

m["und-wji"] = {"Western Jicaque", 3178610, "hok", Latn}

m["urj-mdv-pro"] = {"Proto-Mordvinic", nil, "urj-mdv", Latn, type = "reconstructed"}

m["urj-prm-pro"] = {"Proto-Permic", nil, "urj-prm", Latn, type = "reconstructed"}

m["urj-pro"] = {"Proto-Uralic", 288765, "urj", {"Latinx"}, type = "reconstructed"}

m["urj-ugr-pro"] = {"Proto-Ugric", 156631, "urj-ugr", {"Latinx"}, type = "reconstructed"}

m["xnd-pro"] = {"Proto-Na-Dene", nil, "xnd", {"Latinx"}, type = "reconstructed"}

m["xgn-kha"] = {"Khamnigan Mongol", 3196052, "xgn", {"Mong", "Latn", "Cyrl"}}

m["xgn-mgr"] = {
    "Mangghuer", 34214, "xgn", Latn -- also "Mong", "Cyrl" ?
}

m["xgn-mgl"] = {
    "Mongghul", 34214, "xgn", Latn -- also "Mong", "Cyrl" ?
}

m["xgn-pro"] = {"Proto-Mongolic", 2493677, "xgn", {"Latinx"}, type = "reconstructed"}

m["ypk-pro"] = {"Proto-Yupik", nil, "ypk", {"Latinx"}, type = "reconstructed"}

m["zhx-min-pro"] = {"Proto-Min", 19646347, "zhx-min", {"Latinx"}, type = "reconstructed"}

m["zhx-sht"] = {"Shaozhou Tuhua", 1920769, "zhx", {"Nshu"}}

m["zhx-tai"] = {"Taishanese", 2208940, "zhx", {"Hani"}, ancestors = {"yue"}}

m["zhx-teo"] = {"Teochew", 36759, "zhx-min-hai", {"Hani"}, ancestors = {"nan"}}

m["zle-ono"] = {
    "Old Novgorodian",
    162013,
    "zle",
    {"Cyrs", "Glag"},
    translit_module = "Cyrs-Glag-translit",
    entry_name = {
        from = {u(0x0484)}, -- kamora
        to = {}
    },
    sort_key = {from = {"оу"}, to = {"у"}}
}

m["zlw-ocs"] = {"Old Czech", 593096, "zlw", Latn}

m["zlw-opl"] = {"Old Polish", 149838, "zlw-lch", Latn}

m["zlw-pom"] = {"Pomeranian", 149588, "zlw-lch", Latn}

m["zlw-slv"] = {"Slovincian", 36822, "zlw-lch", Latn, ancestors = {"zlw-pom"}}

return m
