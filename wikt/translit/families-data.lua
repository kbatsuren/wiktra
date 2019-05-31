--[=[
    This module contains definitions for all language family codes on Wiktionary.
]=]--

local m = {}

m["aav"] = {
    canonicalName = "Austro-Asiatic",
	otherNames = {"Austroasiatic"},
	wikidata_item = "Q33199",
}

m["aav-ban"] = {
	canonicalName = "Bahnaric",
	family = "mkh",
	wikidata_item = "Q56309",
}

m["aav-khm"] = {
	canonicalName = "Khmuic",
	family = "aav",
	wikidata_item = "Q1323245",
}

m["aav-nbn"] = {
	canonicalName = "North Bahnaric",
	family = "aav-ban",
	wikidata_item = "Q56309",
}

m["aav-pal"] = {
	canonicalName = "Palaungic",
	family = "aav",
	wikidata_item = "Q2391173",
}

m["afa"] = {
	canonicalName = "Afro-Asiatic",
	otherNames = {"Afroasiatic"},
	wikidata_item = "Q25268",
}

m["alg"] = {
	canonicalName = "Algonquian",
	family = "aql",
	wikidata_item = "Q33392",
}

m["alv"] = {
	canonicalName = "Atlantic-Congo",
	family = "nic",
	wikidata_item = "Q771124",
}

m["alv-edo"] = {
	canonicalName = "Edoid",
	family = "alv-von",
	wikidata_item = "Q1287469",
}

m["alv-kwa"] = {
	canonicalName = "Kwa",
	family = "alv",
	wikidata_item = "Q33430",
}

m["alv-mbm"] = {
	canonicalName = "Mbum",
	family = "alv-sav",
	wikidata_item = "Q6799814",
}

m["alv-sav"] = {
	canonicalName = "Savanna",
	family = "alv",
	wikidata_item = "Q4403672",
}

m["alv-sng"] = {
	canonicalName = "Senegambian",
	family = "alv",
	wikidata_item = "Q1708753",
}

m["alv-von"] = {
	canonicalName = "Volta-Niger",
	family = "alv",
	wikidata_item = "Q34177",
}

m["apa"] = {
	canonicalName = "Apachean",
	otherNames = {"Southern Athabaskan"},
	family = "ath",
	wikidata_item = "Q27758",
}

m["aqa"] = {
	canonicalName = "Alacalufan",
	wikidata_item = "Q1288430",
}

m["aql"] = {
	canonicalName = "Algic",
	otherNames = {"Algonquian-Ritwan", "Algonquian-Wiyot-Yurok"},
	wikidata_item = "Q721612",
}

m["art"] = {
	canonicalName = "constructed",
	otherNames = {"artificial", "planned"},
	family = "qfa-not",
	wikidata_item = "Q33215",
}

m["ath"] = {
	canonicalName = "Athabaskan",
	family = "xnd",
	wikidata_item = "Q27475",
}

m["ath-nor"] = {
	canonicalName = "North Athabaskan",
	otherNames = {"Northern Athabaskan"},
	family = "ath",
}

m["ath-pco"] = {
	canonicalName = "Pacific Coast Athabaskan",
	family = "ath",
	wikidata_item = "Q20654",
}

m["auf"] = {
	canonicalName = "Arauan",
	otherNames = {"Arahuan", "Arauán", "Arawa", "Arawan", "Arawán"},
	wikidata_item = "Q626772",
}

--[=[ Exceptional language and family codes for Australian Aboriginal languages
      can use the prefix "aus-", though "aus" is no longer itself a family code. ]=]--
m["aus-arn"] = {
	canonicalName = "Arnhem",
	otherNames = {"Gunwinyguan", "Macro-Gunwinyguan"},
	wikidata_item = "Q2581700",
}

m["aus-bub"] = {
	canonicalName = "Bunuban",
	otherNames = {"Bunaban"},
	wikidata_item = "Q2495148",
}

m["aus-cww"] = {
	canonicalName = "Central New South Wales",
	family = "aus-pam",
	wikidata_item = "Q5061507",
}

m["aus-dal"] = {
	canonicalName = "Daly",
	wikidata_item = "Q2478079",
}

m["aus-dyb"] = {
	canonicalName = "Dyirbalic",
	family = "aus-pam",
	wikidata_item = "Q1850666",
}

m["aus-gar"] = {
	canonicalName = "Garawan",
	wikidata_item = "Q5521951",
}

m["aus-gun"] = {
	canonicalName = "Gunwinyguan",
	otherNames = {"Gunwingguan"},
	family = "aus-arn",
	wikidata_item = "Q2581700",
}

m["aus-kar"] = {
	canonicalName = "Karnic",
	family = "aus-pam",
	wikidata_item = "Q4215578",
}

m["aus-nga"] = {
	canonicalName = "Ngayarda",
	family = "aus-psw",
	wikidata_item = "Q16153490",
}

m["aus-nyu"] = {
	canonicalName = "Nyulnyulan",
	wikidata_item = "Q2039408",
}

m["aus-pam"] = {
	canonicalName = "Pama-Nyungan",
	wikidata_item = "Q33942",
}

m["aus-pmn"] = {
	canonicalName = "Paman",
	family = "aus-pam",
	wikidata_item = "Q2640654",
}

m["aus-psw"] = {
	canonicalName = "Southwest Pama-Nyungan",
	family = "aus-pam",
	wikidata_item = "Q2258160",
}

m["aus-rnd"] = {
	canonicalName = "Arandic",
	family = "aus-pam",
	wikidata_item = "Q4784071",
}

m["aus-tnk"] = {
	canonicalName = "Tangkic",
	wikidata_item = "Q1823065",
}

m["aus-wdj"] = {
	canonicalName = "Iwaidjan",
	otherNames = {"Yiwaidjan"},
	wikidata_item = "Q4196968",
}

m["aus-yid"] = {
	canonicalName = "Yidinyic",
	family = "aus-pam",
	wikidata_item = "Q4205849",
}

m["aus-yol"] = {
	canonicalName = "Yolngu",
	otherNames = {"Yolŋu", "Yolngu Matha"},
	family = "aus-pam",
	wikidata_item = "Q2511254",
}

m["aus-yuk"] = {
	canonicalName = "Yuin-Kuric",
	family = "aus-pam",
	wikidata_item = "Q3833021",
}

m["awd"] = {
	canonicalName = "Arawakan",
	otherNames = {"Arawak", "Maipurean", "Maipuran"},
	wikidata_item = "Q626753",
}

m["awd-nwk"] = {
	canonicalName = "Nawiki",
	otherNames = {"Newiki"},
	family = "awd",
}

m["awd-taa"] = {
	canonicalName = "Ta-Arawakan",
	otherNames = {"Ta-Arawak", "Ta-Maipurean"},
	family = "awd",
	wikidata_item = "Q7672731",
}

m["azc"] = {
	canonicalName = "Uto-Aztecan",
	otherNames = {"Uto-Aztekan"},
	wikidata_item = "Q34073",
}

m["azc-cup"] = {
	canonicalName = "Cupan",
	family = "azc-tak",
	wikidata_item = "Q19866871",
}

m["azc-nah"] = {
	canonicalName = "Nahuan",
	otherNames = {"Aztecan"},
	family = "azc",
	wikidata_item = "Q11965602",
}

m["azc-num"] = {
	canonicalName = "Numic",
	family = "azc",
	wikidata_item = "Q2657541",
}

m["azc-tak"] = {
	canonicalName = "Takic",
	family = "azc",
	wikidata_item = "Q1280305",
}

m["azc-trc"] = {
	canonicalName = "Taracahitic",
	otherNames = {"Taracahitan"},
	family = "azc",
	wikidata_item = "Q4245032",
}

m["bad"] = {
	canonicalName = "Banda",
	family = "nic-ubg",
	wikidata_item = "Q806234",
}

m["bai"] = {
	canonicalName = "Bamileke",
	family = "nic-grf",
	wikidata_item = "Q806005",
}

m["bat"] = {
	canonicalName = "Baltic",
	family = "ine-bsl",
	wikidata_item = "Q33136",
}

m["ber"] = {
	canonicalName = "Berber",
	otherNames = {"Tamazight"},
	family = "afa",
	wikidata_item = "Q25448",
}

m["bnt"] = {
	canonicalName = "Bantu",
	family = "nic-bod",
	wikidata_item = "Q33146",
}

m["bnt-ngu"] = {
	canonicalName = "Nguni",
	otherNames = {"Ngoni"},
	family = "bnt",
	wikidata_item = "Q961559",
}

m["btk"] = {
	canonicalName = "Batak",
	family = "poz-nws",
	wikidata_item = "Q1998595",
}

--[=[ Exceptional language and family codes for Central American Indian languages
      may use the prefix "cai-", though "cai" is no longer itself a family code. ]=]--

--[=[ Exceptional language and family codes for Caucasian languages can use
      the prefix "cau-", though "cau" is no longer itself a family code. ]=]--

m["cau-abz"] = {
	canonicalName = "Abkhaz-Abaza",
	otherNames = {"Abazgi", "Abkhaz-Tapanta"},
	family = "cau-nwc",
	wikidata_item = "Q4663617",
}

m["cau-ava"] = {
	canonicalName = "Avaro-Andian",
	otherNames = {"Avar-Andian", "Avar-Andi", "Avar-Andic", "Andian"},
	family = "cau-nec",
	wikidata_item = "Q4827766",
}

m["cau-cir"] = {
	canonicalName = "Circassian",
	otherNames = {"Cherkess"},
	family = "cau-nwc",
	wikidata_item = "Q858543",
}

m["cau-drg"] = {
	canonicalName = "Dargwa",
	otherNames = {"Dargin"},
	family = "cau-nec",
	wikidata_item = "Q5222637",
}

m["cau-lzg"] = {
	canonicalName = "Lezghian",
	otherNames = {"Lezgi", "Lezgian", "Lezgic"},
	family = "cau-nec",
	wikidata_item = "Q2144370",
}

m["cau-nkh"] = {
	canonicalName = "Nakh",
	otherNames = {"North-Central Caucasian"},
	family = "cau-nec",
	wikidata_item = "Q24441",
}

m["cau-nec"] = {
	canonicalName = "Northeast Caucasian",
	otherNames = {"Dagestanian", "Nakho-Dagestanian", "Caspian"},
	family = "ccn",
	wikidata_item = "Q27387",
}

m["cau-nwc"] = {
	canonicalName = "Northwest Caucasian",
	otherNames = {"Abkhazo-Adyghean", "Abkhaz-Adyghe", "Pontic"},
	family = "ccn",
	wikidata_item = "Q33852",
}

m["cau-tsz"] = {
	canonicalName = "Tsezian",
	otherNames = {"Tsezic", "Didoic"},
	family = "cau-nec",
	wikidata_item = "Q1651530",
}

m["cba"] = {
	canonicalName = "Chibchan",
	family = "qfa-mch", -- or none if Macro-Chibchan is considered undemonstrated
	wikidata_item = "Q520478",
}

m["ccn"] = {
	canonicalName = "North Caucasian",
	wikidata_item = "Q33732",
}

m["ccs"] = {
	canonicalName = "Kartvelian",
	otherNames = {"South Caucasian"},
	wikidata_item = "Q34030",
}

m["ccs-gzn"] = {
	canonicalName = "Georgian-Zan",
	otherNames = {"Karto-Zan"},
	family = "ccs",
	wikidata_item = "Q34030",
}

m["ccs-zan"] = {
	canonicalName = "Zan",
	otherNames = {"Zanuri", "Colchian"},
	family = "ccs-gzn",
	wikidata_item = "Q2606912",
}

m["cdc"] = {
	canonicalName = "Chadic",
	family = "afa",
	wikidata_item = "Q33184",
}

m["cdc-cbm"] = {
	canonicalName = "Central Chadic",
	otherNames = {"Biu-Mandara"},
	family = "cdc",
	wikidata_item = "Q2251547",
}

m["cdc-est"] = {
	canonicalName = "East Chadic",
	family = "cdc",
	wikidata_item = "Q2276221",
}

m["cdc-mas"] = {
	canonicalName = "Masa",
	family = "cdc",
	wikidata_item = "Q2136092",
}

m["cdc-wst"] = {
	canonicalName = "West Chadic",
	family = "cdc",
	wikidata_item = "Q2447774",
}

m["cdd"] = {
	canonicalName = "Caddoan",
	wikidata_item = "Q1025090",
}

m["cel"] = {
	canonicalName = "Celtic",
	family = "ine",
	wikidata_item = "Q25293",
}

m["cel-bry"] = {
	canonicalName = "Brythonic",
	family = "cel",
	wikidata_item = "Q156877",
}

m["cel-gae"] = {
	canonicalName = "Goidelic",
	otherNames = {"Gaelic"},
	protoLanguage = "pgl",
	family = "cel",
	wikidata_item = "Q56433",
}

m["chi"] = {
	canonicalName = "Chimakuan",
	wikidata_item = "Q1073088",
}

m["cmc"] = {
	canonicalName = "Chamic",
	family = "poz-mcm",
	wikidata_item = "Q2997506",
}

m["crp"] = {
	canonicalName = "creole or pidgin",
	family = "qfa-not",
}

m["csu"] = {
	canonicalName = "Central Sudanic",
	family = "ssa",
	wikidata_item = "Q190822",
}

m["csu-sar"] = {
	canonicalName = "Sara",
	family = "csu",
	wikidata_item = "Q2036691",
}

m["cus"] = {
	canonicalName = "Cushitic",
	family = "afa",
	wikidata_item = "Q33248",
}

m["day"] = {
	canonicalName = "Land Dayak",
	family = "poz-bop",
	wikidata_item = "Q2760613",
}

m["del"] = {
	canonicalName = "Lenape",
	otherNames = {"Delaware"},
	family = "alg",
	wikidata_item = "Q2665761",
}

m["dmn"] = {
	canonicalName = "Mande",
	family = "nic",
	wikidata_item = "Q33681",
}

m["dra"] = {
	canonicalName = "Dravidian",
	wikidata_item = "Q33311",
}

m["egx"] = {
	canonicalName = "Egyptian",
	protoLanguage = "egy",
	family = "afa",
	wikidata_item = "Q50868",
}

m["esx"] = {
	canonicalName = "Eskimo-Aleut",
	wikidata_item = "Q25946",
}

m["esx-esk"] = {
	canonicalName = "Eskimo",
	family = "esx",
	wikidata_item = "Q25946",
}

m["esx-inu"] = {
	canonicalName = "Inuit",
	family = "esx-esk",
	wikidata_item = "Q27796",
}

m["euq"] = {
	canonicalName = "Vasconic",
	wikidata_item = "Q4669240",
}

m["fiu-fin"] = {
	canonicalName = "Finnic",
	family = "urj",
	wikidata_item = "Q33328",
}

m["gem"] = {
	canonicalName = "Germanic",
	family = "ine",
	wikidata_item = "Q21200",
}

m["gme"] = {
	canonicalName = "East Germanic",
	family = "gem",
	wikidata_item = "Q108662",
}

m["gmq"] = {
	canonicalName = "North Germanic",
	family = "gem",
	wikidata_item = "Q106085",
}

m["gmw"] = {
	canonicalName = "West Germanic",
	family = "gem",
	wikidata_item = "Q26721",
}

m["gmw-fri"] = {
	canonicalName = "Frisian",
	protoLanguage = "ofs",
	family = "gmw",
	wikidata_item = "Q25325",
}

m["grk"] = {
	canonicalName = "Hellenic",
	otherNames = {"Greek"},
	family = "ine",
	wikidata_item = "Q2042538",
}

m["hmn"] = {
	canonicalName = "Hmong",
	family = "hmx",
	wikidata_item = "Q3307894",
}

m["hmx"] = {
	canonicalName = "Hmong-Mien",
	otherNames = {"Miao-Yao"},
	wikidata_item = "Q33322",
}

m["hmx-mie"] = {
	canonicalName = "Mien",
	family = "hmx",
	wikidata_item = "Q7992695",
}

m["hok"] = {
	canonicalName = "Hokan",
	wikidata_item = "Q33406",
}

m["hyx"] = {
	canonicalName = "Armenian",
	family = "ine",
	wikidata_item = "Q8785",
}

m["iir"] = {
	canonicalName = "Indo-Iranian",
	family = "ine",
	wikidata_item = "Q33514",
}

m["iir-nur"] = {
	canonicalName = "Nuristani",
	family = "iir",
	wikidata_item = "Q161804",
}

m["ijo"] = {
	canonicalName = "Ijoid",
	family = "nic",
	wikidata_item = "Q1325759",
}

m["inc"] = {
	canonicalName = "Indo-Aryan",
	otherNames = {"Indic"},
	family = "iir",
	wikidata_item = "Q33577",
}

m["inc-dar"] = {
	canonicalName = "Dardic",
	family = "inc",
	wikidata_item = "Q161101",
}

m["inc-pah"] = {
	canonicalName = "Pahari",
	otherNames = {"Pahadi"},
	family = "inc",
	wikidata_item = "Q946077",
}

m["inc-rom"] = {
	canonicalName = "Romani",
	otherNames = {"Romany", "Gypsy", "Gipsy"},
	protoLanguage = "rom",
	family = "inc",
	wikidata_item = "Q13201",
}

m["ine"] = {
	canonicalName = "Indo-European",
	otherNames = {"Indo-Germanic"},
	wikidata_item = "Q19860",
}

m["ine-ana"] = {
	canonicalName = "Anatolian",
	family = "ine",
	wikidata_item = "Q147085",
}

m["ine-bsl"] = {
	canonicalName = "Balto-Slavic",
	family = "ine",
	wikidata_item = "Q147356",
}

m["ine-toc"] = {
	canonicalName = "Tocharian",
	otherNames = {"Tokharian"},
	family = "ine",
	wikidata_item = "Q37029",
}

m["ira"] = {
	canonicalName = "Iranian",
	family = "iir",
	wikidata_item = "Q33527",
}

m["ira-eas"] = {
	canonicalName = "Eastern Iranian",
	family = "ira",
	wikidata_item = "Q391015",
}

m["ira-krm"] = {
	canonicalName = "Kermanic",
	otherNames = {"Kermanian", "Kermanic Iranian", "Kermanic Central Iranian", "Central Iranian"},
	family = "ira",
	wikidata_item = "Q129850",
}

m["ira-sak"] = {
	canonicalName = "Sakan",
	family = "ira",
}

m["ira-sgc"] = {
	canonicalName = "Sogdic",
	otherNames = {"Sogdian"},
	family = "ira",
}

m["ira-wes"] = {
	canonicalName = "Western Iranian",
	family = "ira",
	wikidata_item = "Q129850",
}

m["iro"] = {
	canonicalName = "Iroquoian",
	wikidata_item = "Q33623",
}

m["itc"] = {
	canonicalName = "Italic",
	family = "ine",
	wikidata_item = "Q131848",
}

m["jpx"] = {
	canonicalName = "Japonic",
	otherNames = {"Japanese", "Japanese-Ryukyuan"},
	wikidata_item = "Q33612",
}

m["jpx-ryu"] = {
	canonicalName = "Ryukyuan",
	family = "jpx",
	wikidata_item = "Q56393",
}

m["kar"] = {
	canonicalName = "Karen",
	family = "tbq",
	wikidata_item = "Q1364815",
}

--[=[ Exceptional language and family codes for Khoisan and Kordofanian languages can use
      the prefix "khi-" and "kdo-" respectively, though they are no longer family codes themselves. ]=]--

m["khi-kho"] = {
	canonicalName = "Khoe",
	otherNames = {"Kwadi-Khoe", "Central Khoisan"},
	wikidata_item = "Q2736449",
}

m["khi-kxa"] = {
	canonicalName = "Kx'a",
	otherNames = {"Kxa", "Ju-ǂHoan"},
	wikidata_item = "Q6450587",
}

m["khi-tuu"] = {
	canonicalName = "Tuu",
	otherNames = {"Kwi", "Taa-Kwi", "Southern Khoisan", "Taa-ǃKwi", "Taa-ǃUi", "ǃUi-Taa"},
	wikidata_item = "Q631046",
}

m["kro"] = {
	canonicalName = "Kru",
	family = "nic-bco",
	wikidata_item = "Q33535",
}

m["map"] = {
	canonicalName = "Austronesian",
	wikidata_item = "Q49228",
}

m["map-ata"] = {
	canonicalName = "Atayalic",
	family = "map",
	wikidata_item = "Q716610",
}

m["mkh"] = {
	canonicalName = "Mon-Khmer",
	family = "aav",
	wikidata_item = "Q33199",
}

m["mkh-vie"] = {
	canonicalName = "Vietic",
	family = "mkh",
	wikidata_item = "Q2355546",
}

m["mno"] = {
	canonicalName = "Manobo",
	family = "phi",
	wikidata_item = "Q3217483",
}

m["mun"] = {
	canonicalName = "Munda",
	family = "aav",
	wikidata_item = "Q33892",
}

m["myn"] = {
	canonicalName = "Mayan",
	wikidata_item = "Q33738",
}

--[=[ Exceptional language and family codes for North American Indian languages
      can use the prefix "nai-", though "nai" is no longer itself a family code. ]=]--
m["nai-cat"] = {
	canonicalName = "Catawban",
	family = "nai-sca",
	wikidata_item = "Q3446638",
}

m["nai-chu"] = {
	canonicalName = "Chumashan",
	wikidata_item = "Q1288420",
}

m["nai-ckn"] = {
	canonicalName = "Chinookan",
	wikidata_item = "Q610586",
}

m["nai-ker"] = {
	canonicalName = "Keresan",
	wikidata_item = "Q35878",
}

m["nai-kta"] = {
	canonicalName = "Kiowa-Tanoan",
	wikidata_item = "Q386288",
}

m["nai-len"] = {
	canonicalName = "Lencan",
	otherNames = {"Lenca"},
	wikidata_item = "Q36189",
}

m["nai-mdu"] = {
	canonicalName = "Maiduan",
	wikidata_item = "Q33502",
}

m["nai-miz"] = {
	canonicalName = "Mixe-Zoquean",
	otherNames = {"Mixe-Zoque"},
	wikidata_item = "Q954016",
}

m["nai-min"] = {
	canonicalName = "Misumalpan",
	otherNames = {"Misuluan", "Misumalpa"},
	family = "qfa-mch",
	wikidata_item = "Q281693",
}

m["nai-mus"] = {
	canonicalName = "Muskogean",
	otherNames = {"Muskhogean"},
	wikidata_item = "Q902978",
}

m["nai-pal"] = {
	canonicalName = "Palaihnihan",
	wikidata_item = "Q1288332",
}

m["nai-pom"] = {
	canonicalName = "Pomoan",
	otherNames = {"Pomo", "Kulanapan"},
	family = "hok",
	wikidata_item = "Q2618420",
}

m["nai-sca"] = {
	canonicalName = "Siouan-Catawban",
	wikidata_item = "Q34181",
}

m["nai-shp"] = {
	canonicalName = "Sahaptian",
	wikidata_item = "Q114782",
}

m["nai-shs"] = {
	canonicalName = "Shastan",
	family = "hok",
	wikidata_item = "Q2991735",
}

m["nai-tot"] = {
	canonicalName = "Totozoquean",
	wikidata_item = "Q7828419",
}

m["nai-ttn"] = {
	canonicalName = "Totonacan",
	otherNames = {"Totonac", "Totonac-Tepehua", "Totonacan-Tepehuan"},
	wikidata_item = "Q34039",
}

m["nai-tqn"] = {
	canonicalName = "Tequistlatecan",
	otherNames = {"Tequistlatec", "Chontal", "Chontalan", "Oaxacan Chontal", "Chontal of Oaxaca"},
	family = "hok",
	wikidata_item = "Q1754988",
}

m["nai-utn"] = {
	canonicalName = "Utian",
	otherNames = {"Miwok-Costanoan", "Mutsun"},
	family = "nai-you",
	wikidata_item = "Q13371763",
}

m["nai-wtq"] = {
	canonicalName = "Wintuan",
	otherNames = {"Wintun"},
	wikidata_item = "Q1294259",
}

m["nai-xin"] = {
	canonicalName = "Xincan",
	otherNames = {"Xinca"},
	wikidata_item = "Q1546494",
}

m["nai-yok"] = {
	canonicalName = "Yokutsan",
	otherNames = {"Yokuts", "Mariposan", "Mariposa"},
	family = "nai-you",
	wikidata_item = "Q34249",
}

m["nai-you"] = {
	canonicalName = "Yok-Utian",
	wikidata_item = "Q2886186",
}

m["nai-yuc"] = {
	canonicalName = "Yuman-Cochimí",
	wikidata_item = "Q579137",
}

m["ngf"] = {
	canonicalName = "Trans-New Guinea",
	wikidata_item = "Q34018",
}

m["ngf-fin"] = {
    canonicalName = "Finisterre",
	family = "ngf",
	wikidata_item = "Q5450373",
}

m["ngf-mad"] = {
    canonicalName = "Madang",
	family = "ngf",
	wikidata_item = "Q11217556",
}

m["ngf-okk"] = {
	canonicalName = "Ok",
	family = "ngf",
	wikidata_item = "Q7081687",
}

m["ngf-sbh"] = {
	canonicalName = "South Bird's Head",
	family = "ngf",
	wikidata_item = "Q7566330",
}

m["nic"] = {
	canonicalName = "Niger-Congo",
	otherNames = {"Niger-Kordofanian"},
	wikidata_item = "Q33838",
}

m["nic-bco"] = {
	canonicalName = "Benue-Congo",
	family = "nic-vco",
	wikidata_item = "Q33253",
}

m["nic-bod"] = {
	canonicalName = "Bantoid",
	family = "nic-bco",
	wikidata_item = "Q806992",
}

m["nic-grf"] = {
	canonicalName = "Grassfields",
	otherNames = {"Grassfields Bantu", "Wide Grassfields"},
	family = "nic-bod",
	wikidata_item = "Q750932",
}

m["nic-gur"] = {
	canonicalName = "Gur",
	otherNames = {"Voltaic"},
	family = "alv-sav",
	wikidata_item = "Q33536",
}

m["nic-knj"] = {
	canonicalName = "Kainji",
	family = "nic-bco",
	wikidata_item = "Q681495",
}

m["nic-ubg"] = {
	canonicalName = "Ubangian",
	family = "nic-vco", -- or none
	wikidata_item = "Q33932",
}

m["nic-vco"] = {
	canonicalName = "Volta-Congo",
	family = "alv",
	wikidata_item = "Q37228",
}

m["nub"] = {
	canonicalName = "Nubian",
	wikidata_item = "Q1517194",
}

m["omq"] = {
	canonicalName = "Oto-Manguean",
	wikidata_item = "Q33669",
}

m["omq-cha"] = {
	canonicalName = "Chatino",
	family = "omq-zap",
	wikidata_item = "Q35111",
}

m["omq-chi"] = {
	canonicalName = "Chinantecan",
	family = "omq",
	wikidata_item = "Q35828",
}

m["omq-maz"] = {
	canonicalName = "Mazatecan",
	otherNames = {"Mazatec"},
	family = "omq",
	wikidata_item = "Q36230",
}

m["omq-mix"] = {
	canonicalName = "Mixtecan",
	family = "omq",
	wikidata_item = "Q21996392",
}

m["omq-pop"] = {
	canonicalName = "Popolocan",
	family = "omq",
	wikidata_item = "Q5132273",
}

m["omq-tri"] = {
    canonicalName = "Trique",
	otherNames = {"Triqui"},
	family = "omq-mix",
	wikidata_item = "Q780200",
}

m["omq-zap"] = {
	canonicalName = "Zapotecan",
	family = "omq",
	wikidata_item = "Q8066463",
}

m["omv"] = {
	canonicalName = "Omotic",
	family = "afa",
	wikidata_item = "Q33860",
}

m["oto"] = {
	canonicalName = "Otomian",
	family = "omq",
	wikidata_item = "Q1270220",
}

m["paa"] = {
	canonicalName = "Papuan",
	family = "qfa-not",
	wikidata_item = "Q236425",
}

m["paa-arf"] = {
	canonicalName = "Arafundi",
	wikidata_item = "Q4783702",
}

m["paa-iwm"] = {
	canonicalName = "Iwam",
	wikidata_item = "Q15147853",
}

m["paa-kag"] = { -- recode as ngf-kag?
	canonicalName = "Kainantu-Goroka",
	family = "ngf",
	wikidata_item = "Q3217463",
}

m["paa-lkp"] = {
	canonicalName = "Lakes Plain",
	wikidata_item = "Q6478969",
}

m["paa-lsp"] = {
	canonicalName = "Lower Sepik",
	otherNames = {"Nor-Pondo"},
	wikidata_item = "Q7061700",
}

m["paa-mai"] = {
	canonicalName = "Mairasi",
	wikidata_item = "Q6736896",
}

m["paa-msk"] = {
	canonicalName = "Sko",
	otherNames = {"Skou"},
	wikidata_item = "Q953509",
}

m["paa-ram"] = {
	canonicalName = "Ramu",
	wikidata_item = "Q3442808",
}

m["paa-spk"] = {
	canonicalName = "Sepik",
	wikidata_item = "Q3508772",
}

m["paa-yam"] = {
	canonicalName = "Yam",
	otherNames = {"Morehead and Upper Maro River"},
	wikidata_item = "Q15062272",
}

m["phi"] = {
	canonicalName = "Philippine",
	family = "poz-bop",
	wikidata_item = "Q947858",
}

m["phi-kal"] = {
	canonicalName = "Kalamian",
	otherNames = {"Calamian"},
	family = "phi",
	wikidata_item = "Q3217466",
}

m["poz"] = {
	canonicalName = "Malayo-Polynesian",
	family = "map",
	wikidata_item = "Q143158",
}

m["poz-aay"] = {
	canonicalName = "Admiralty Islands",
	family = "poz-oce",
	wikidata_item = "Q2701306",
}

m["poz-bnn"] = {
	canonicalName = "North Bornean",
	family = "poz-bop",
	wikidata_item = "Q1427907",
}

m["poz-bop"] = {
	canonicalName = "Borneo-Philippines",
	family = "poz",
	wikidata_item = "Q4273393",
}

m["poz-bre"] = {
	canonicalName = "East Barito",
	family = "poz-bop",
	wikidata_item = "Q2701314",
}

m["poz-brw"] = {
	canonicalName = "West Barito",
	family = "poz-bop",
	wikidata_item = "Q2761679",
}

m["poz-btk"] = {
	canonicalName = "Bungku-Tolaki",
	family = "poz-sus",
	wikidata_item = "Q3217381",
}

m["poz-cet"] = {
	canonicalName = "Central-Eastern Malayo-Polynesian",
	family = "poz",
	wikidata_item = "Q2269883",
}

m["poz-cln"] = {
	canonicalName = "New Caledonian",
	family = "poz-occ",
	wikidata_item = "Q3091221",
}

m["poz-hce"] = {
	canonicalName = "Halmahera-Cenderawasih",
	family = "pqe",
	wikidata_item = "Q2526616",
}

m["poz-kal"] = {
	canonicalName = "Kaili-Pamona",
	family = "poz-sus",
	wikidata_item = "Q3217465",
}

m["poz-lgx"] = {
	canonicalName = "Lampungic",
	family = "poz-sus",
	wikidata_item = "Q49215",
}

m["poz-mcm"] = {
	canonicalName = "Malayo-Chamic",
	family = "poz-msa",
}

m["poz-mic"] = {
	canonicalName = "Micronesian",
	family = "poz-occ",
	wikidata_item = "Q420591",
}

m["poz-mly"] = {
	canonicalName = "Malayic",
	family = "poz-mcm",
	wikidata_item = "Q662628",
}

m["poz-msa"] = {
	canonicalName = "Malayo-Sumbawan",
	family = "poz-sus",
	wikidata_item = "Q1363818",
}

m["poz-mun"] = {
	canonicalName = "Muna-Buton",
	family = "poz-sus",
	wikidata_item = "Q3037924",
}

m["poz-nws"] = {
	canonicalName = "Northwest Sumatran",
	family = "poz-sus",
	wikidata_item = "Q2071308",
}

m["poz-occ"] = {
	canonicalName = "Central-Eastern Oceanic",
	family = "poz-oce",
	wikidata_item = "Q2068435",
}

m["poz-oce"] = {
	canonicalName = "Oceanic",
	family = "pqe",
	wikidata_item = "Q324457",
}

m["poz-ocw"] = {
	canonicalName = "Western Oceanic",
	family = "poz-oce",
	wikidata_item = "Q2701282",
}

m["poz-pep"] = {
	canonicalName = "Eastern Polynesian",
	family = "poz-pnp",
	wikidata_item = "Q390979",
}

m["poz-pnp"] = {
	canonicalName = "Nuclear Polynesian",
	family = "poz-pol",
	wikidata_item = "Q743851",
}

m["poz-pol"] = {
	canonicalName = "Polynesian",
	family = "poz-occ",
	wikidata_item = "Q390979",
}

m["poz-san"] = {
	canonicalName = "Sabahan",
	family = "poz-bnn",
	wikidata_item = "Q3217517",
}

m["poz-sbj"] = {
	canonicalName = "Sama-Bajaw",
	family = "poz-bop",
	wikidata_item = "Q2160409",
}

m["poz-slb"] = {
	canonicalName = "Saluan-Banggai",
	family = "poz-sus",
	wikidata_item = "Q3217519",
}

m["poz-sls"] = {
	canonicalName = "Southeast Solomonic",
	family = "poz-occ",
	wikidata_item = "Q3119671",
}

m["poz-ssw"] = {
	canonicalName = "South Sulawesi",
	family = "poz-sus",
	wikidata_item = "Q2778190",
}

m["poz-sus"] = {
	canonicalName = "Sunda-Sulawesi",
	family = "poz",
	wikidata_item = "Q319552",
}

m["poz-swa"] = {
	canonicalName = "North Sarawakan",
	family = "poz-bnn",
	wikidata_item = "Q538569",
}

m["poz-tot"] = {
	canonicalName = "Tomini-Tolitoli",
	family = "poz-sus",
	wikidata_item = "Q3217541",
}

m["poz-vnc"] = {
	canonicalName = "North-Central Vanuatu",
	family = "poz-occ",
	wikidata_item = "Q3039118",
}

m["poz-wot"] = {
	canonicalName = "Wotu-Wolio",
	family = "poz-sus",
	wikidata_item = "Q1041317",
}

m["pqe"] = {
	canonicalName = "Eastern Malayo-Polynesian",
	family = "poz-cet",
	wikidata_item = "Q2269883",
}

m["pra"] = {
	canonicalName = "Prakrit",
	family = "inc",
	wikidata_item = "Q192170",
}

m["qfa-adm"] = {
	canonicalName = "Andamanese",
	wikidata_item = "Q32940",
}

m["qfa-cka"] = {
	canonicalName = "Chukotko-Kamchatkan",
	wikidata_item = "Q33255",
}

m["qfa-dgn"] = {
	canonicalName = "Dogon",
	wikidata_item = "Q1234776",
}

m["qfa-dny"] = {
	canonicalName = "Dene-Yeniseian",
	otherNames = {"Dené-Yeniseian"},
	wikidata_item = "Q21103",
}

m["qfa-hur"] = {
	canonicalName = "Hurro-Urartian",
	wikidata_item = "Q1144159",
}

m["qfa-iso"] = {
	canonicalName = "isolate",
	family = "qfa-not",
	wikidata_item = "Q33648",
}

m["qfa-kad"] = {
	canonicalName = "Kadu", -- considered either Nilo-Saharan or independent/none
	wikidata_item = "Q1720989",
}

m["qfa-kor"] = {
	canonicalName = "Korean",
	wikidata_item = "Q11263525",
}

m["qfa-mal"] = {
	canonicalName = "Left May",
	wikidata_item = "Q614468",
}

m["qfa-mch"] = { -- used in both N and S America
	canonicalName = "Macro-Chibchan",
	wikidata_item = "Q3438062",
}

m["qfa-mix"] = {
	canonicalName = "mixed",
	family = "qfa-not",
	wikidata_item = "Q33694",
}

m["qfa-not"] = {
	canonicalName = "not a family",
	family = "qfa-not",
}

m["qfa-sub"] = {
	canonicalName = "substrate",
	wikidata_item = "Q20730913",
}

m["qfa-tak"] = {
	canonicalName = "Tai-Kadai",
	otherNames = {"Daic", "Kadai", "Kra-Dai"},
	wikidata_item = "Q34171",
}

m["qfa-tap"] = {
	canonicalName = "Timor-Alor-Pantar",
	wikidata_item = "Q16590002",
}

m["qfa-tor"] = {
	canonicalName = "Torricelli",
	wikidata_item = "Q1333831",
}

m["qfa-tyn"] = {
	canonicalName = "Tyrsenian",
	wikidata_item = "Q1344038",
}

m["qfa-yen"] = {
	canonicalName = "Yeniseian",
	otherNames = {"Yeniseic", "Yenisei-Ostyak"},
	family = "qfa-dny",
	wikidata_item = "Q27639",
}

m["qfa-yuk"] = {
	canonicalName = "Yukaghir",
	otherNames = {"Yukagir", "Jukagir"},
	wikidata_item = "Q34164",
}

m["qwe"] = {
	canonicalName = "Quechuan",
	wikidata_item = "Q5218",
}

m["roa"] = {
	canonicalName = "Romance",
	otherNames = {"Romanic", "Latin", "Neolatin", "Neo-Latin"},
	protoLanguage = "la",
	family = "itc",
	wikidata_item = "Q19814",
}

m["roa-eas"] = {
	canonicalName = "Eastern Romance",
	family = "roa",
	wikidata_item = "Q147576",
}

m["roa-oil"] = {
	canonicalName = "Oïl",
	protoLanguage = "fro",
	family = "roa",
	wikidata_item = "Q37351",
}

m["roa-rhe"] = {
	canonicalName = "Rhaeto-Romance",
	family = "roa",
	wikidata_item = "Q515593",
}

--[=[ Exceptional language and family codes for South American Indian languages
      can use the prefix "sai-", though "sai" is no longer itself a family code. ]=]--
m["sai-ara"] = {
	canonicalName = "Araucanian",
	wikidata_item = "Q626630",
}

m["sai-aym"] = {
	canonicalName = "Aymaran",
	wikidata_item = "Q33010",
}

m["sai-bar"] = {
	canonicalName = "Barbacoan",
	otherNames = {"Barbakoan"},
	wikidata_item = "Q807304",
}

m["sai-car"] = {
	canonicalName = "Cariban",
	otherNames = {"Carib"},
	wikidata_item = "Q33090",
}

m["sai-chc"] = {
	canonicalName = "Chocoan",
	otherNames = {"Choco", "Chocó"},
	wikidata_item = "Q1075616",
}

m["sai-cho"] = {
	canonicalName = "Chonan",
	otherNames = {"Chon"},
	wikidata_item = "Q33019",
}

m["sai-cpc"] = {
	canonicalName = "Chapacuran",
	wikidata_item = "Q1062626",
}

m["sai-crn"] = {
	canonicalName = "Charruan",
	otherNames = {"Charrúan"},
	wikidata_item = "Q3112423",
}

m["sai-ctc"] = {
	canonicalName = "Catacaoan",
	wikidata_item = "Q5051139",
}

m["sai-guc"] = {
	canonicalName = "Guaicuruan",
	otherNames = {"Guaicurú", "Guaycuruana", "Guaikurú", "Guaycuruano", "Guaykuruan", "Waikurúan"},
	family = "sai-mgc",
	wikidata_item = "Q1974973",
}

m["sai-guh"] = {
	canonicalName = "Guahiban",
	otherNames = {"Guahiboan", "Guajiboan", "Wahivoan"},
	wikidata_item = "Q944056",
}

m["sai-har"] = {
	canonicalName = "Harákmbut",
	otherNames = {"Harákmbet"},
	family = "sai-hkt",
	wikidata_item = "Q1584402",
}

m["sai-hkt"] = {
	canonicalName = "Harákmbut–Katukinan",
	otherNames = {"Harákmbet"},
	wikidata_item = "Q17107635",
}

m["sai-hrp"] = {
	canonicalName = "Huarpean",
	otherNames = {"Warpean", "Huarpe", "Warpe"},
	wikidata_item = "Q1578336",
}

m["sai-jee"] = {
	canonicalName = "Jê",
	otherNames = {"Gê", "Jean", "Gean", "Jê-Kaingang", "Ye"},
	family = "sai-mje",
	wikidata_item = "Q1483594",
}

m["sai-jir"] = {
	canonicalName = "Jirajaran",
	otherNames = {"Hiraháran"},
	wikidata_item = "Q3028651",
}

m["sai-jiv"] = {
	canonicalName = "Jivaroan",
	otherNames = {"Hívaro", "Jibaro", "Jibaroan", "Jibaroana", "Jívaro"},
	wikidata_item = "Q1393074",
}

m["sai-ktk"] = {
	canonicalName = "Katukinan",
	otherNames = {"Catuquinan"},
	family = "sai-hkt",
	wikidata_item = "Q2636000",
}

m["sai-mas"] = {
	canonicalName = "Mascoian",
	otherNames = {"Mascoyan", "Maskoian", "Enlhet-Enenlhet"},
	wikidata_item = "Q1906952",
}

m["sai-mgc"] = {
	canonicalName = "Mataco-Guaicuru",
	wikidata_item = "Q255512",
}

m["sai-mje"] = {
	canonicalName = "Macro-Jê",
	otherNames = {"Macro-Gê"},
	wikidata_item = "Q887133",
}

m["sai-mtc"] = {
	canonicalName = "Matacoan",
	family = "sai-mgc",
	wikidata_item = "Q2447424",
}

m["sai-mur"] = {
	canonicalName = "Muran",
	otherNames = {"Mura"},
	wikidata_item = "Q33826",
}

m["sai-nmk"] = {
	canonicalName = "Nambikwaran",
	otherNames = {"Nambicuaran", "Nambiquaran", "Nambikuaran"},
	wikidata_item = "Q15548027",
}

m["sai-otm"] = {
	canonicalName = "Otomacoan",
	otherNames = {"Otomákoan", "Otomakoan"},
	wikidata_item = "Q3217503",
}

m["sai-pan"] = {
	canonicalName = "Panoan",
	otherNames = {"Pano"},
	family = "sai-pat",
	wikidata_item = "Q1544537",
}

m["sai-pat"] = {
	canonicalName = "Pano-Tacanan",
	otherNames = {"Pano-Tacana", "Pano-Takana", "Páno-Takána", "Pano-Takánan"},
	wikidata_item = "Q2475746",
}

m["sai-tac"] = {
	canonicalName = "Tacanan",
	family = "sai-pat",
	wikidata_item = "Q3113762",
}

m["sai-tuc"] = {
	canonicalName = "Tucanoan",
	wikidata_item = "Q788144",
}

m["sai-tyu"] = {
	canonicalName = "Ticuna-Yuri",
	wikidata_item = "Q4467010",
}

m["sai-ucp"] = {
	canonicalName = "Uru-Chipaya",
	otherNames = {"Uru-Chipayan"},
	wikidata_item = "Q2475488",
}

m["sai-wic"] = {
	canonicalName = "Wichí",
	wikidata_item = "Q3027047",
}

m["sai-wit"] = {
	canonicalName = "Witotoan",
	otherNames = {"Huitotoan"},
	wikidata_item = "Q43079317",
}

m["sai-ynm"] = {
	canonicalName = "Yanomami",
	otherNames = {"Yanomam", "Shamatari", "Yamomami", "Yanomaman"},
}

m["sai-zam"] = {
	canonicalName = "Zamucoan",
	otherNames = {"Samúkoan"},
	wikidata_item = "Q3048461",
}

m["sai-zap"] = {
	canonicalName = "Zaparoan",
	otherNames = {"Záparoan", "Saparoan", "Sáparoan", "Záparo", "Zaparoano", "Zaparoana"},
	wikidata_item = "Q33911",
}

m["sal"] = {
	canonicalName = "Salishan",
	wikidata_item = "Q33985",
}

m["sdv"] = {
	canonicalName = "Eastern Sudanic",
	family = "ssa",
	wikidata_item = "Q2036148",
}

m["sem"] = {
	canonicalName = "Semitic",
	family = "afa",
	wikidata_item = "Q34049",
}

m["sem-ara"] = {
	canonicalName = "Aramaic",
	protoLanguage = "arc",
	family = "sem-nwe",
	wikidata_item = "Q28602",
}

m["sem-arb"] = {
	canonicalName = "Arabic",
	protoLanguage = "ar",
	family = "sem-cen",
	wikidata_item = "Q164667",
}

m["sem-can"] = {
	canonicalName = "Canaanite",
	family = "sem-nwe",
	wikidata_item = "Q747547",
}

m["sem-cen"] = {
	canonicalName = "Central Semitic",
	family = "sem-wes",
	wikidata_item = "Q3433228",
}

m["sem-eas"] = {
	canonicalName = "East Semitic",
	family = "sem",
	wikidata_item = "Q164273",
}

m["sem-eth"] = {
	canonicalName = "Ethiopian Semitic",
	otherNames = {"Afro-Semitic", "Ethiopian", "Ethiopic", "Ethiosemitic"},
	family = "sem-sou",
	wikidata_item = "Q163629",
}

m["sem-nwe"] = {
	canonicalName = "Northwest Semitic",
	family = "sem-cen",
	wikidata_item = "Q162996",
}

m["sem-osa"] = {
	canonicalName = "Old South Arabian",
	otherNames = {"Epigraphic South Arabian", "Sayhadic"},
	family = "sem-sou",
	wikidata_item = "Q35025",
}

m["sem-sar"] = {
	canonicalName = "South Arabian",
	otherNames = {"Modern South Arabian"},
	family = "sem-sou",
	wikidata_item = "Q1163682",
}

m["sem-sou"] = {
	canonicalName = "South Semitic",
	family = "sem-wes",
	wikidata_item = "Q38890",
}

m["sem-wes"] = {
	canonicalName = "West Semitic",
	family = "sem",
	wikidata_item = "Q124901",
}

m["sgn"] = {
	canonicalName = "sign",
	family = "qfa-not",
	wikidata_item = "Q34228",
}

m["sgn-fsl"] = {
	canonicalName = "French Sign Languages",
	family = "sgn",
	wikidata_item = "Q5501921",
}

m["sgn-gsl"] = {
	canonicalName = "German Sign Languages",
	family = "sgn",
	wikidata_item = "Q5551235",
}

m["sgn-jsl"] = {
	canonicalName = "Japanese Sign Languages",
	family = "sgn",
	wikidata_item ="Q11722508",
}

m["sio"] = {
	canonicalName = "Siouan",
	family = "nai-sca",
	wikidata_item = "Q34181",
}

m["sit"] = {
	canonicalName = "Sino-Tibetan",
	wikidata_item = "Q45961",
}

m["sit-qia"] = {
	canonicalName = "Qiangic",
	family = "sit",
	wikidata_item = "Q1636765",
}

m["sit-tan"] = {
	canonicalName = "Tani",
	family = "sit",
	wikidata_item = "Q3217538",
}

m["sla"] = {
	canonicalName = "Slavic",
	otherNames = {"Slavonic"},
	family = "ine-bsl",
	wikidata_item = "Q23526",
}

m["smi"] = {
	canonicalName = "Sami",
	otherNames = {"Saami", "Samic", "Saamic"},
	family = "urj",
	wikidata_item = "Q56463",
}

m["son"] = {
	canonicalName = "Songhay",
	otherNames = {"Songhai"},
	family = "ssa",
	wikidata_item = "Q505198",
}

m["sqj"] = {
	canonicalName = "Albanian",
	family = "ine",
	wikidata_item = "Q8748",
}

m["ssa"] = {
	canonicalName = "Nilo-Saharan", -- possibly not a genetic grouping
	wikidata_item = "Q33705",
}

m["ssa-fur"] = {
	canonicalName = "Fur",
	family = "ssa",
	wikidata_item = "Q2989512",
}

m["ssa-sah"] = {
	canonicalName = "Saharan",
	family = "ssa",
	wikidata_item = "Q1757661",
}

m["syd"] = {
	canonicalName = "Samoyedic",
	otherNames = {"Samoyed", "Samodeic"},
	family = "urj",
	wikidata_item = "Q34005",
}

m["tai"] = {
	canonicalName = "Tai",
	family = "qfa-tak",
	wikidata_item = "Q749720",
}

m["tai-wen"] = {
	canonicalName = "Wenma-Southwestern Tai",
	family = "tai",
}

m["tai-tay"] = {
	canonicalName = "Tày",
	family = "tai-wen",
}

m["tai-sap"] = {
	canonicalName = "Sapa-Southwestern Tai",
	otherNames = {"Sapa-Thai"},
	family = "tai-wen",
}

m["tai-swe"] = {
	canonicalName = "Southwestern Tai",
	family = "tai-sap",
	wikidata_item = "Q3447105",
}

m["tai-cho"] = {
	canonicalName = "Chongzuo Tai",
	family = "tai",
	wikidata_item = "Q13216",
}

m["tai-cen"] = {
	canonicalName = "Central Tai", -- gonna obsolete
	family = "tai",
	wikidata_item = "Q5061891",
}

m["tai-nor"] = {
	canonicalName = "Northern Tai",
	family = "tai",
	wikidata_item = "Q7059014",
}

m["tbq"] = {
	canonicalName = "Tibeto-Burman",
	family = "sit",
	wikidata_item = "Q34064",
}

m["tbq-brm"] = {
	canonicalName = "Burmish",
	family = "tbq",
	wikidata_item = "Q865713",
}

m["tbq-kuk"] = {
	canonicalName = "Kukish",
	family = "tbq",
	wikidata_item = "Q832413",
}

m["tbq-lol"] = {
	canonicalName = "Loloish",
	family = "tbq",
	wikidata_item = "Q37035",
}

m["trk"] = {
	canonicalName = "Turkic",
	wikidata_item = "Q34090",
}

m["trk-kip"] = {
	canonicalName = "Kipchak",
	otherNames = {"Kypchak", "Qypchaq", "Northwestern Turkic"},
	protoLanguage = "qwm",
	family = "trk",
	wikidata_item = "Q1339898",
}

m["trk-ogr"] = {
	canonicalName = "Oghur",
	otherNames = {"Lir-Turkic", "r-Turkic"},
	family = "trk",
	wikidata_item = "Q1422731",
}

m["trk-ogz"] = {
	canonicalName = "Oghuz",
	otherNames = {"Southwestern Turkic"},
	family = "trk",
	wikidata_item = "Q494600",
}

m["tup"] = {
	canonicalName = "Tupian",
	otherNames = {"Tupi"},
	wikidata_item = "Q34070",
}

m["tup-gua"] = {
	canonicalName = "Tupi-Guarani",
	otherNames = {"Tupí-Guaraní"},
	family = "tup",
	wikidata_item = "Q148610",
}

m["tut"] = {
	canonicalName = "Altaic",
	wikidata_item = "Q37845",
}

m["tuw"] = {
	canonicalName = "Tungusic",
	otherNames = {"Manchu-Tungus", "Tungus"},
	wikidata_item = "Q34230",
}

m["urj"] = {
	canonicalName = "Uralic",
	otherNames = {"Finno-Ugric"},
	wikidata_item = "Q34113",
}

m["urj-mdv"] = {
	canonicalName = "Mordvinic",
	family = "urj",
	wikidata_item = "Q627313",
}

m["urj-prm"] = {
	canonicalName = "Permic",
	family = "urj",
	wikidata_item = "Q161493",
}

m["urj-ugr"] = {
	canonicalName = "Ugric",
	family = "urj",
	wikidata_item = "Q156631",
}

m["wak"] = {
	canonicalName = "Wakashan",
	wikidata_item = "Q60069",
}

m["wen"] = {
	canonicalName = "Sorbian",
	otherNames = {"Lusatian", "Wendish"},
	family = "zlw",
	wikidata_item = "Q25442",
}

m["xgn"] = {
	canonicalName = "Mongolic",
	otherNames = {"Mongolian"},
	wikidata_item = "Q33750",
}

m["xnd"] = {
	canonicalName = "Na-Dene",
	otherNames = {"Na-Dené"},
	family = "qfa-dny",
	wikidata_item = "Q26986",
}

m["ypk"] = {
	canonicalName = "Yupik",
	otherNames = {"Yup'ik", "Yuit"},
	family = "esx-esk",
	wikidata_item = "Q27970",
}

m["zhx"] = {
	canonicalName = "Sinitic",
	otherNames = {"Chinese"},
	protoLanguage = "och",
	family = "sit",
	wikidata_item = "Q33857",
}

m["zle"] = {
	canonicalName = "East Slavic",
	protoLanguage = "orv",
	family = "sla",
	wikidata_item = "Q144713",
}

m["zls"] = {
	canonicalName = "South Slavic",
	family = "sla",
	wikidata_item = "Q146665",
}

m["zlw"] = {
	canonicalName = "West Slavic",
	family = "sla",
	wikidata_item = "Q145852",
}

m["znd"] = {
	canonicalName = "Zande",
	wikidata_item = "Q8066072",
}

return m