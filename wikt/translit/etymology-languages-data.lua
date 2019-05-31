--[[canonicalName, otherNames, wikipedia_article
These have the same meaning as they do in the data modules for the regular languages; see Module:languages/data2/documentation.
parent
The language that this etymology language is a subvariety of. For instance, "en" (English) is the parent of en-GB (British English).]]
local m = {}


-- Aramaic varieties

m["sem-jar"] = {
	canonicalName = "Jewish Aramaic",
	otherNames = {"Judeo-Aramaic"},
	parent = "arc",
	wikidata_item = "Q2633045",
}

m["tmr"] = {
	canonicalName = "Jewish Babylonian Aramaic",
	parent = "arc",
	wikidata_item = "Q33407",
}

m["jpa"] = {
	canonicalName = "Jewish Palestinian Aramaic",
	otherNames = {"Galilean Aramaic"},
	parent = "arc",
	wikidata_item = "Q948909",
}


-- Chinese varieties

m["wuu-sha"] = {
	canonicalName = "Shanghainese",
	parent = "wuu",
	wikidata_item = "Q36718",
}
m["Sha."] = m["wuu-sha"]

m["hak-wuh"] = {
	canonicalName = "Wuhua Chinese",
	parent = "hak",
}

m["hsn-old"] = {
	canonicalName = "Old Xiang",
	otherNames = {"Lou-Shao"},
	parent = "hsn",
	wikidata_item = "Q7085453",
}

m["pinhua"] = {
	canonicalName = "Pinghua",
	parent = "yue",
	wikidata_item = "Q2735715",
}

m["nan-hai"] = {
	canonicalName = "Hainanese",
	parent = "nan",
	wikidata_item = "Q934541",
}

m["nan-hok"] = {
	canonicalName = "Hokkien",
	parent = "nan",
	wikidata_item = "Q1624231",
}

m["nan-amo"] = {
	canonicalName = "Amoy",
	otherNames = {"Xiamenese"},
	parent = "nan-hok",
	wikidata_item = "Q68744",
}

m["nan-phl"] = {
	canonicalName = "Philippine Hokkien",
	parent = "nan-hok",
	wikidata_item = "Q3236692",
}


-- English, Scots and Old English varieties

m["en-GB"] = {
	canonicalName = "British English",
	parent = "en",
	wikidata_item = "Q7979",
}
m["British English"] = m["en-GB"]
m["BE."] = m["en-GB"]

m["en-US"] = {
	canonicalName = "American English",
	parent = "en",
	wikidata_item = "Q7976",
}
m["American English"] = m["en-US"]
m["AE."] = m["en-US"]

-- Scots varieties

m["sco-osc"] = {
	canonicalName = "Early Scots",
	parent = "sco",
	wikidata_item = "Q5326738",
}
m["Early Scots"] = m["sco-osc"]
m["Old Scots"] = m["sco-osc"]
m["O.Sc."] = m["sco-osc"]

m["sco-smi"] = {
	canonicalName = "Middle Scots",
	parent = "sco",
	wikidata_item = "Q3327000",
}
m["Middle Scots"] = m["sco-smi"]
m["Mid.Sc."] = m["sco-smi"]

m["sco-ins"] = {
	canonicalName = "Insular Scots",
	parent = "sco",
	wikidata_item = "Q16919205",
}
m["Insular Scots"] = m["sco-ins"]
m["Ins.Sc."] = m["sco-ins"]

m["sco-uls"] = {
	canonicalName = "Ulster Scots",
	parent = "sco",
	wikidata_item = "Q201966",
}
m["Ulster Scots"] = m["sco-uls"]
m["Uls.Sc."] = m["sco-uls"]

m["sco-nor"] = {
	canonicalName = "Northern Scots",
	parent = "sco",
	wikidata_item = "Q16928150",
}
m["Northern Scots"] = m["sco-nor"]
m["Nor.Sc."] = m["sco-nor"]

m["sco-sou"] = {
	canonicalName = "Southern Scots",
	parent = "sco",
	wikidata_item = "Q7570457",
}
m["Southern Scots"] = m["sco-sou"]
m["Borders Scots"] = m["sco-sou"]
m["Sou.Sc."] = m["sco-sou"]

-- Old English varieties

-- Includes both Mercian and Northumbrian.
m["ang-ang"] = {
	canonicalName = "Anglian Old English",
	parent = "ang",
}

m["ang-mer"] = {
	canonicalName = "Mercian Old English",
	parent = "ang",
}

m["ang-nor"] = {
	canonicalName = "Northumbrian Old English",
	parent = "ang",
	wikidata_item = "Q1798915",
}

--[[
m["ang-wsx"] = {
	canonicalName = "West Saxon Old English",
	parent = "ang",
}
]]


-- French and Norman varieties

m["fro-nor"] = {
	canonicalName = "Old Northern French",
	otherNames = {"Old Norman", "Old Norman French"},
	parent = "fro",
	wikidata_item = "Q2044917",
}
m["Old Northern French"] = m["fro-nor"]
m["ONF."] = m["fro-nor"]

m["fro-pic"] = {
	canonicalName = "Old Picard",
	parent = "fro",
}

m["xno"] = {
	canonicalName = "Anglo-Norman",
	parent = "fro",
	wikidata_item = "Q35214",
}

m["fr-CA"] = {
	canonicalName = "Canadian French",
	parent = "fr",
	wikidata_item = "Q1450506",
}
m["Canadian French"] = m["fr-CA"]
m["CF."] = m["fr-CA"]

m["fr-aca"] = {
	canonicalName = "Acadian French",
	parent = "fr",
	wikidata_item = "Q415109",
}
m["Acadian French"] = m["fr-aca"]
m["fra-aca"] = m["fr-aca"]

m["frc"] = {
	canonicalName = "Cajun French",
	otherNames = {"Louisiana French"},
	parent = "fr",
	wikidata_item = "Q880301",
}

-- Norman varieties

m["roa-grn"] = {
	canonicalName = "Guernésiais",
	parent = "nrf",
	wikidata_item = "Q56428",
}

m["roa-jer"] = {
	canonicalName = "Jèrriais",
	parent = "nrf",
	wikidata_item = "Q56430",
}


-- Gaulish

m["xcg"] = {
	canonicalName = "Cisalpine Gaulish",
	parent = "cel-gau",
	wikidata_item = "Q3832927",
}

m["xtg"] = {
	canonicalName = "Transalpine Gaulish",
	parent = "cel-gau",
	wikidata_item = "Q29977",
}


-- German and Old High German varieties

m["de-AT"] = {
	canonicalName = "Austrian German",
	parent = "de",
	wikidata_item = "Q306626",
}
m["Austrian German"] = m["de-AT"]
m["AG."] = m["de-AT"]

m["de-AT-vie"] = {
	canonicalName = "Viennese German",
	parent = "de-AT",
	wikidata_item = "Q56474",
}
m["Viennese German"] = m["de-AT-vie"]
m["VG."] = m["de-AT-vie"]

m["ksh"] = {
	canonicalName = "Kölsch",
	parent = "gmw-cfr",
	wikidata_item = "Q4624",
}
m["Kölsch"] = m["ksh"]

m["pfl"] = {
	canonicalName = "Palatine German",
	otherNames = {"Pfälzisch", "Pälzisch", "Palatinate German"},
	parent = "gmw-rfr",
	wikidata_item = "Q23014",
}

-- Old High German varieties

m["lng"] = {
	canonicalName = "Lombardic",
	parent = "goh",
	wikidata_item = "Q35972",
}
m["Lombardic"] = m["lng"]
m["goh-lng"] = m["lng"]


-- Greek varieties

m["qfa-sub-grc"] = {
	canonicalName = "Pre-Greek",
	parent = "qfa-sub",
	wikidata_item = "Q965052",
}
m["pregrc"] = m["qfa-sub-grc"]

m["grc-boi"] = {
	canonicalName = "Boeotian Greek",
	parent = "grc",
	wikidata_item = "Q406373",
}

m["grc-koi"] = {
	canonicalName = "Koine Greek",
	parent = "grc",
	wikidata_item = "Q107358",
}
m["Koine"] = m["grc-koi"]

m["gkm"] = {
    canonicalName = "Byzantine Greek",
	otherNames = {"Medieval Greek"},
	parent = "grc",
	wikidata_item = "Q36387",
}
m["Medieval Greek"] = m["gkm"]

m["grc-dor"] = {
	canonicalName = "Doric Greek",
	parent = "grc",
	wikidata_item = "Q285494",
}

m["grc-att"] = {
	canonicalName = "Attic Greek",
	parent = "grc",
	wikidata_item = "Q506588",
}

m["grc-ion"] = {
	canonicalName = "Ionic Greek",
	parent = "grc",
	wikidata_item = "Q504165",
}

m["grc-pam"] = {
	canonicalName = "Pamphylian Greek",
	parent = "grc",
	wikidata_item = "Q2271793",
}

m["grc-kre"] = { -- code used elsewhere: see [[Module:grc:Dialects]]
	canonicalName = "Cretan Ancient Greek", -- to distinguish from Cretan Greek below
	parent = "grc",
}

m["grc-arp"] = {
	canonicalName = "Arcadocypriot Greek",
	parent = "grc",
	wikidata_item = "Q499602",
}

m["el-arc"] = {
	canonicalName = "Arcadian Greek",
	parent = "el",
}

m["el-cyp"] = {
	canonicalName = "Cypriotic Greek",
	parent = "el",
}

m["el-pap"] = {
	canonicalName = "Paphian Greek",
	parent = "el",
}

m["grc-aeo"] = {
	canonicalName = "Aeolic Greek",
	otherNames = {"Lesbic Greek", "Lesbian Greek", "Aeolian Greek"},
	parent = "grc",
	wikidata_item = "Q406373",
}

m["loc-ozo"] = {
	canonicalName = "Ozolian Locrian",
	parent = "el",
}

m["loc-opu"] = {
	canonicalName = "Opuntian Locrian",
	parent = "el",
}

m["el-ths"] = {
	canonicalName = "Thessalian Greek",
	parent = "el",
	wikidata_item = "Q406373",
}

m["grc-ela"] = {
	canonicalName = "Elean Greek",
	parent = "grc",
}

m["grc-epc"] = {
	canonicalName = "Epic Greek",
	parent = "grc",
	wikidata_item = "Q990062",
}

m["grc-hmr"] = {
	canonicalName = "Homeric Greek",
	parent = "grc",
	wikidata_item = "Q990062",
}

m["el-crt"] = {
	canonicalName = "Cretan Greek",
	parent = "el",
	wikidata_item = "Q588306",
}


-- Hebrew varieties

m["hbo"] = {
	canonicalName = "Biblical Hebrew",
	otherNames = {"Classical Hebrew"},
	parent = "he",
	wikidata_item = "Q1982248",
}

m["he-IL"] = {
	canonicalName = "Modern Israeli Hebrew",
	parent = "he",
	wikidata_item = "Q8141",
}

m["sem-can-pro"] = {
	canonicalName = "Proto-Canaanite",
	parent = "sem-pro",
	wikidata_item = "Q1073942",
}


-- Iranian varieties:
-- Historical and current Iranian dialects

m["ae-old"] = {
	canonicalName = "Old Avestan",
	otherNames = {"Gathic Avestan"},
	parent = "ae",
	wikidata_item = "Q29572",
}

m["ae-yng"] = {
	canonicalName = "Younger Avestan",
	otherNames = {"Young Avestan"},
	parent = "ae",
}

m["bcc"] = {
	canonicalName = "Southern Balochi",
	otherNames = {"Southern Baluchi"},
	parent = "bal",
	wikidata_item = "Q33049",
}
m["bal-sou"] = m["bcc"]

m["bgp"] = {
	canonicalName = "Eastern Balochi",
	otherNames = {"Eastern Baluchi"},
	parent = "bal",
	wikidata_item = "Q33049",
}
m["bal-eas"] = m["bgp"]

m["bgn"] = {
	canonicalName = "Western Balochi",
	otherNames = {"Western Baluchi"},
	parent = "bal",
	wikidata_item = "Q33049",
}
m["bal-wes"] = m["bgn"]

m["ira-cen"] = {
	canonicalName = "Central Iranian",
	parent = "ira",
}

m["ira-nei"] = {
	canonicalName = "Northeastern Iranian",
	parent = "ira",
}

m["ira-nwi"] = {
	canonicalName = "Northwestern Iranian",
	parent = "ira",
}

m["ira-swi"] = {
	canonicalName = "Southwestern Iranian",
	parent = "ira",
}

m["ira-mid"] = {
	canonicalName = "Middle Iranian",
	parent = "ira",
	wikidata_item = "Q33527",
}
m["MIr."] = m["ira-mid"]

m["ira-old"] = {
	canonicalName = "Old Iranian",
	parent = "ira",
	wikidata_item = "Q33527",
}
m["OIr."] = m["ira-old"]

m["xmn"] = {
	canonicalName = "Manichaean Middle Persian",
	parent = "pal",
}

m["fa-cls"] = {
	canonicalName = "Classical Persian",
	parent = "fa",
	wikidata_item = "Q9168",
}

m["os-dig"] = {
	canonicalName = "Digor",
	otherNames = {"Digoron"},
	parent = "os",
	wikidata_item = "Q3027861",
}

m["os-iro"] = {
	canonicalName = "Iron",
	parent = "os",
}

m["prs"] = {
	canonicalName = "Dari",
	otherNames = {"Dari Persian", "Eastern Persian", "Afghan Persian"},
	parent = "fa",
	wikidata_item = "Q178440",
}

m["sog-bud"] = {
	canonicalName = "Buddhist Sogdian",
	parent = "sog",
}

m["sog-man"] = {
	canonicalName = "Manichean Sogdian",
	parent = "sog",
}
m["sog-chr"] = {
	canonicalName = "Christian Sogdian",
	parent = "sog",
}

m["oru-kan"] = {
	canonicalName = "Kaniguram",
	parent = "oru",
	wikidata_item = "Q6363164",
}

m["oru-log"] = {
	canonicalName = "Logar",
	parent = "oru",
}

-- Southwestern Fars lects

m["fay-bur"] = {
	canonicalName = "Burenjani",
	parent = "fay",
}

m["fay-bsh"] = {
	canonicalName = "Bushehri",
	parent = "fay",
}

m["fay-dsh"] = {
	canonicalName = "Dashtaki",
	parent = "fay",
}

m["fay-dav"] = {
	canonicalName = "Davani",
	parent = "fay",
	wikidata_item = "Q5228140",
}

m["fay-eze"] = {
	canonicalName = "Emamzada Esma’ili",
	parent = "fay",
}

m["fay-gav"] = {
	canonicalName = "Gavkoshaki",
	parent = "fay",
}

m["fay-kho"] = {
	canonicalName = "Khollari",
	parent = "fay",
}

m["fay-kon"] = {
	canonicalName = "Kondazi",
	parent = "fay",
}

m["fay-kzo"] = {
	canonicalName = "Old Kazeruni",
	parent = "fay",
}

m["fay-mas"] = {
	canonicalName = "Masarami",
	parent = "fay",
}

m["fay-pap"] = {
	canonicalName = "Papuni",
	parent = "fay",
}

m["fay-sam"] = {
	canonicalName = "Samghani",
	parent = "fay",
}

m["fay-shr"] = {
	canonicalName = "Shirazi",
	parent = "fay",
}

m["fay-sho"] = {
	canonicalName = "Old Shirazi",
	parent = "fay",
}

m["fay-sam"] = {
	canonicalName = "Samghani",
	parent = "fay",
}

m["fay-kar"] = {
	canonicalName = "Khargi",
	parent = "fay",
}

m["fay-sor"] = {
	canonicalName = "Sorkhi",
	parent = "fay",
}

-- Kermanic lects

m["ker-ham"] = {
	canonicalName = "Hamadani",
	parent = "ira-ker",
	wikidata_item = "Q6302426",
}

m["ker-mah"] = {
	canonicalName = "Mahallati",
	parent = "ira-ker",
}

m["ker-von"] = {
	canonicalName = "Vonishuni",
	parent = "ira-ker",
}

m["ker-del"] = {
	canonicalName = "Delijani",
	parent = "ira-ker",
}

m["ker-kas"] = {
	canonicalName = "Kashani",
	parent = "ira-ker",
}

m["ker-kes"] = {
	canonicalName = "Kese'i",
	parent = "ira-ker",
}

m["ker-mey"] = {
	canonicalName = "Meyme'i",
	parent = "ira-ker",
}

m["ker-abz"] = {
	canonicalName = "Abuzeydabadi",
	parent = "ira-ker",
}

m["ker-aby"] = {
	canonicalName = "Abyanehi",
	parent = "ira-ker",
}

m["ker-far"] = {
	canonicalName = "Farizandi",
	parent = "ira-ker",
}

m["ker-jow"] = {
	canonicalName = "Jowshaqani",
	parent = "ira-ker",
}

m["ker-qoh"] = {
	canonicalName = "Qohrudi",
	parent = "ira-ker",
}

m["ker-yar"] = {
	canonicalName = "Yarandi",
	parent = "ira-ker",
}

m["ker-tar"] = {
	canonicalName = "Tari",
	parent = "ira-ker",
}

m["ker-sed"] = {
	canonicalName = "Sedehi",
	parent = "ira-ker",
}


m["ker-ard"] = {
	canonicalName = "Ardestani",
	parent = "ira-ker",
}

m["ker-zef"] = {
	canonicalName = "Zefre'i",
	parent = "ira-ker",
}

m["ker-isf"] = {
	canonicalName = "Isfahani",
	parent = "ira-ker",
}

m["ker-kaf"] = {
	canonicalName = "Kafroni",
	parent = "ira-ker",
}

m["ker-var"] = {
	canonicalName = "Varzenei",
	parent = "ira-ker",
}

m["ker-xur"] = {
	canonicalName = "Khuri",
	parent = "ira-ker",
}

m["nyq-ana"] = {
	canonicalName = "Anaraki",
	parent = "nyq",
}

m["gbz-krm"] = {
	canonicalName = "Kermani",
	parent = "gbz",
}

m["gbz-yzd"] = {
	canonicalName = "Yazdi",
	parent = "gbz",
}

-- Indo-Aryan varieties

m["awa-old"] = {
	canonicalName = "Old Awadhi",
	parent = "awa",
}

m["bra-old"] = {
	canonicalName = "Old Braj",
	parent = "bra",
}

m["gu-kat"] = {
	canonicalName = "Kathiyawadi",
	otherNames = {"Kathiyawadi Gujarati", "Kathiawadi"},
	parent = "gu",
}

m["gu-mid"] = {
	canonicalName = "Middle Gujarati",
	parent = "gu",
	wikidata_item = "Q24907429",
}

m["hi-mum"] = {
	canonicalName = "Bombay Hindi",
	otherNames = {"Mumbai Hindi", "Bambaiyya Hindi"},
	parent = "hi",
	wikidata_item = "Q3543151",
}

m["hi-mid"] = {
	canonicalName = "Middle Hindi",
	parent = "hi",
}

m["pa-old"] = {
	canonicalName = "Old Punjabi",
	parent = "pa",
}

m["bn-old"] = {
	canonicalName = "Old Bengali",
	parent = "bn",
}

m["bn-mid"] = {
	canonicalName = "Middle Bengali",
	parent = "bn",
}

m["or-old"] = {
	canonicalName = "Old Oriya",
	parent = "or",
}

m["or-mid"] = {
	canonicalName = "Middle Oriya",
	parent = "or",
}

m["sa-bhs"] = {
	canonicalName = "Buddhist Hybrid Sanskrit",
	parent = "sa",
	wikidata_item = "Q248758",
}

m["sa-cls"] = {
	canonicalName = "Classical Sanskrit",
	parent = "sa",
	wikidata_item = "Q11059",
}

m["sa-neo"] = {
	canonicalName = "Neo-Sanskrit",
	parent = "sa",
	wikidata_item = "Q11059",
}

m["sa-ved"] = {
	canonicalName = "Vedic Sanskrit",
	parent = "sa",
	wikidata_item = "Q36858",
}

m["si-med"] = {
	canonicalName = "Medieval Sinhalese",
	otherNames = {"Medieval Sinhala"},
	parent = "si",
}

m["kok-mid"] = {
	canonicalName = "Middle Konkani",
	otherNames = {"Medieval Konkani"},
	parent = "kok",
}

m["kok-old"] = {
	canonicalName = "Old Konkani",
	otherNames = {"Early Konkani"},
	parent = "kok",
}


-- Indian subcontinent languages


-- Dhivehi varieties

m["mlk-dv"] = {
	canonicalName = "Mulaku Dhivehi",
	otherNames = {"Mulaku Divehi", "Mulaku Bas"},
	parent = "dv",
}

m["hvd-dv"] = {
	canonicalName = "Huvadhu Dhivehi",
	otherNames = {"Huvadhu Divehi", "Huvadhu Bas"},
	parent = "dv",
}

m["add-dv"] = {
	canonicalName = "Addu Dhivehi",
	otherNames = {"Addu Divehi", "Addu Bas"},
	parent = "dv",
}

-- Dravidian varieties

m["ta-mid"] = {
	canonicalName = "Middle Tamil",
	parent = "ta",
	wikidata_item = "Q20987434",
}

-- Prakrits

m["psc-prk"] = {
	canonicalName = "Paisaci",
	otherNames = {"Paisaci Prakrit"},
	parent = "sa",
	wikidata_item = "Q2995607",
}

m["prk-avt"] = {
	canonicalName = "Avanti",
	otherNames = {"Avanti Prakrit"},
	parent = "sa",
}

m["prc-prk"] = {
	canonicalName = "Pracya",
	otherNames = {"Pracya Prakrit"},
	parent = "sa",
}

m["bhl-prk"] = {
	canonicalName = "Bahliki",
	otherNames = {"Bahliki Prakrit"},
	parent = "sa",
}

m["dks-prk"] = {
	canonicalName = "Daksinatya",
	otherNames = {"Daksinatya Prakrit"},
	parent = "sa",
}

m["skr-prk"] = {
	canonicalName = "Sakari",
	otherNames = {"Sakari Prakrit"},
	parent = "sa",
}

m["cnd-prk"] = {
	canonicalName = "Candali",
	otherNames = {"Candali Prakrit"},
	parent = "sa",
}

m["sbr-prk"] = {
	canonicalName = "Sabari",
	otherNames = {"Sabari Prakrit"},
	parent = "sa",
}

m["abh-prk"] = {
	canonicalName = "Abhiri",
	otherNames = {"Abhiri Prakrit"},
	parent = "sa",
}

m["drm-prk"] = {
	canonicalName = "Dramili",
	otherNames = {"Dramili Prakrit"},
	parent = "sa",
}

m["odr-prk"] = {
	canonicalName = "Odri",
	otherNames = {"Odri Prakrit"},
	parent = "sa",
}


-- Italian, Latin and other Italic varieties

m["it-oit"] = {
	canonicalName = "Old Italian",
	parent = "it",
	wikidata_item = "Q652",
}
m["roa-oit"] = m["it-oit"]

-- Latin varieties by period

m["la-lat"] = {
	canonicalName = "Late Latin",
	parent = "la",
	wikidata_item = "Q1503113",
}
m["Late Latin"] = m["la-lat"]
m["LL."] = m["la-lat"]
m["LL"] = m["la-lat"]

m["la-vul"] = {
	canonicalName = "Vulgar Latin",
	parent = "la",
	wikidata_item = "Q37560",
}
m["Vulgar Latin"] = m["la-vul"]
m["VL."] = m["la-vul"]

m["la-med"] = {
	canonicalName = "Medieval Latin",
	parent = "la",
	wikidata_item = "Q1163234",
}
m["Medieval Latin"] = m["la-med"]
m["ML."] = m["la-med"]
m["ML"] = m["la-med"]

m["la-ecc"] = {
	canonicalName = "Ecclesiastical Latin",
	otherNames = {"Church Latin"},
	parent = "la",
	wikidata_item = "Q1247932",
}
m["Ecclesiastical Latin"] = m["la-ecc"]
m["EL."] = m["la-ecc"]

m["la-ren"] = {
	canonicalName = "Renaissance Latin",
	parent = "la",
	wikidata_item = "Q499083",
}
m["Renaissance Latin"] = m["la-ren"]
m["RL."] = m["la-ren"]

m["la-new"] = {
	canonicalName = "New Latin",
	otherNames = {"Modern Latin"},
	parent = "la",
	wikidata_item = "Q1248221",
}
m["New Latin"] = m["la-new"]
m["NL."] = m["la-new"]

-- other Italic lects

m["osc-luc"] = {
	canonicalName = "Lucanian",
	parent = "osc",
}

m["osc-sam"] = {
	canonicalName = "Samnite",
	parent = "osc",
}

m["xum-her"] = {
	canonicalName = "Hernician",
	parent = "xum",
}


-- Mongolic lects

m["mn-kha"] = {
	canonicalName = "Khalkha Mongolian",
	parent = "mn",
	wikidata_item = "Q6399808",
}

m["mn-ord"] = {
	canonicalName = "Ordos Mongolian",
	parent = "mn",
	wikidata_item = "Q716904",
}

m["mn-cha"] = {
	canonicalName = "Chakhar Mongolian",
	parent = "mn",
	wikidata_item = "Q907425",
}

m["mn-khr"] = {
	canonicalName = "Khorchin Mongolian",
	parent = "mn",
	wikidata_item = "Q3196210",
}

m["mjg-huz"] = {
	canonicalName = "Mongghul",
	otherNames = {"Huzhu Monguor"},
	parent = "mjg",
	wikidata_item = "Q34214",
}

m["mjg-min"] = {
	canonicalName = "Mangghuer",
	otherNames = {"Minhe Monguor"},
	parent = "mjg",
	wikidata_item = "Q34214",
}


-- Phillipine varieties

m["tl-old"] = {
	canonicalName = "Old Tagalog",
	parent = "tl",
	wikidata_item = "Q12967437",
}

m["tl-cls"] = {
	canonicalName = "Classical Tagalog",
	parent = "tl",
}


-- Pre-Roman substrates

m["qfa-sub-ibe"] = {
	canonicalName = "a pre-Roman substrate of Iberia",
	parent = "qfa-sub",
	wikidata_item = "Q530799",
}

m["qfa-sub-bal"] = {
	canonicalName = "a pre-Roman substrate of the Balkans",
	parent = "qfa-sub",
}


-- Slavic varieties

m["zle-oru"] = {
	canonicalName = "Old Russian",
	parent = "orv",
	wikidata_item = "Q35228",
}

m["zle-obe"] = {
	canonicalName = "Old Belarusian",
	parent = "orv",
	wikidata_item = "Q13211",
}

m["zle-ouk"] = {
	canonicalName = "Old Ukrainian",
	parent = "orv",
	wikidata_item = "Q13211",
}


-- Turkic lects

m["trk-cmn"] = {
	canonicalName = "Common Turkic",
	parent = "trk-pro",
	wikidata_item = "Q1126028",
}

m["otk-kir"] = {
	canonicalName = "Old Kirghiz",
	parent = "otk",
	wikidata_item = "Q83142",
}

m["klj-arg"] = {
	canonicalName = "Arghu",
	parent = "klj",
	wikidata_item = "Q33455",
}


-- Other lects

m["alv-kro"] = {
	canonicalName = "Kromanti",
	parent = "crp",
	wikidata_item = "Q1093206",
}

m["bat-pro"] = {
	canonicalName = "Proto-Baltic",
	parent = "ine-bsl-pro",
	wikidata_item = "Q1703347",
}

m["es-lun"] = {
	canonicalName = "Lunfardo",
	parent = "es",
	wikidata_item = "Q1401612",
}
m["Lunfardo"] = m["es-lun"]

m["fiu-pro"] = {
	canonicalName = "Proto-Finno-Ugric",
	parent = "urj-pro",
	wikidata_item = "Q79890",
}

m["gem-sue"] = {
	canonicalName = "Suevic",
	otherNames = {"Suebian"},
	parent = "gmw",
	wikidata_item = "Q155085",
}

m["mkh-okm-A"] = {
	canonicalName = "Angkorian Old Khmer",
	parent = "mkh-okm",
	wikipedia_article = "Khmer language#Historical periods",
	wikidata_item = "Q9205",
}

m["mkh-okm-P"] = {
	canonicalName = "Pre-Angkorian Old Khmer",
	parent = "mkh-okm",
	wikipedia_article = "Khmer language#Historical periods",
	wikidata_item = "Q9205",
}

m["mul-tax"] = {
	canonicalName = "taxonomic name",
	parent= "mul",
}
m["Tax."] = m["mul-tax"]

m["prv"] = {
	canonicalName = "Provençal",
	parent = "oc",
	wikidata_item = "Q241243",
}

m["qfa-pyg"] = {
	canonicalName = "a substrate language originally spoken by the Pygmies",
	parent = "qfa-sub",
	wikipedia_article = "Classification of Pygmy languages#Original Pygmy language(s)",
}
m["pygmy"] = m["qfa-pyg"]

m["tai-shz"] = {
	canonicalName = "Shangsi Zhuang",
	parent = "za",
	wikidata_item = "Q13216",
}

m["und-tdl"] = {
	canonicalName = "Turduli",
	parent = "und",
	wikipedia_article = "Turduli",
}

m["und-tdt"] = {
	canonicalName = "Turdetani",
	parent = "und",
	wikipedia_article = "Turdetani",
}

m["und-xbi"] = {
	canonicalName = "Xianbei",
	parent = "und",
	wikipedia_article = "Xianbei",
}

m["und-xnu"] = {
	canonicalName = "Xiongnu",
	parent = "und",
	wikipedia_article = "Xiongnu",
}

m["urj-fpr-pro"] = {
	canonicalName = "Proto-Finno-Permic",
	parent = "urj-pro",
}

m["woy"] = {
	canonicalName = "Weyto",
	parent = "und",
	wikidata_item = "Q3915918",
}


return m