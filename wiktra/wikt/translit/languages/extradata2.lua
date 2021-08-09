local m = {}

m["aa"] = {aliases = {"Qafar"}}

m["ab"] = {aliases = {"Abkhazian", "Abxazo"}}

m["ae"] = {aliases = {"Zend", "Old Bactrian"}}

m["af"] = {}

m["ak"] = {varieties = {"Twi-Fante", "Twi", {"Fante", "Fanti"}, "Asante", "Akuapem"}}

m["am"] = {}

m["an"] = {}

m["ar"] = {
    -- FIXME, some of the following are varieties but it's not clear which ones
    aliases = {"Standard Arabic", "Literary Arabic", "High Arabic"},
    varieties = {"Modern Standard Arabic", "Classical Arabic", "Judeo-Arabic"}
}

m["as"] = {aliases = {"Asamiya"}}

m["av"] = {aliases = {"Avaric"}}

m["ay"] = {varieties = {"Southern Aymara", "Central Aymara"}}

m["az"] = {aliases = {"Azeri", "Azari", "Azeri Turkic", "Azerbaijani Turkic"}, varieties = {"North Azerbaijani", "South Azerbaijani", {"Afshar", "Afshari", "Afshar Azerbaijani", "Afchar"}, {"Qashqa'i", "Qashqai", "Kashkay"}, "Sonqor"}}

m["ba"] = {}

m["be"] = {aliases = {"Belorussian", "Belarusan", "Bielorussian", "Byelorussian", "Belarussian", "White Russian"}}

m["bg"] = {}

m["bh"] = {}

m["bi"] = {}

m["bm"] = {aliases = {"Bamanankan"}}

m["bn"] = {aliases = {"Bangla"}}

m["bo"] = {
    varieties = {{"Amdo Tibetan", "Amdo"}, "Dolpo", {"Khams", "Khams Tibetan"}, "Khamba", "Gola", "Humla", "Limi", {"Lhasa", "Lhasa Tibetan"}, "Lhomi", "Loke", "Lowa", "Mugom", "Mugu", "Mustang", "Nubri", "Panang", "Shing Saapa", "Thudam", "Tichurong", "Tseku", {"Ü", "Dbus"}, "Walungge"} -- and "Gyalsumdo", "Lower Manang"? "Kyirong"?
}

m["br"] = {varieties = {{"Gwenedeg", "Vannetais"}, {"Kerneveg", "Cornouaillais"}, {"Leoneg", "Léonard"}, {"Tregerieg", "Trégorrois"}}}

m["ca"] = {
    -- don't list varieties here that are in [[Module:etymology languages/data]]
}

m["ce"] = {}

m["ch"] = {aliases = {"Chamoru"}}

m["co"] = {aliases = {"Corsu"}}

m["cr"] = {}

m["cs"] = {}

m["cu"] = {aliases = {"Old Church Slavic"}}

m["cv"] = {}

m["cy"] = {varieties = {"Cofi Welsh", {"Dyfedeg", "Dyfed Welsh", "Demetian"}, {"Gwenhwyseg", "Gwent Welsh", "Gwentian"}, {"Gwyndodeg", "Gwynedd Welsh", "Venedotian"}, "North Wales Welsh", {"Powyseg", "Powys Welsh", "Powysian"}, "South Wales Welsh", "Patagonian Welsh"}}

m["da"] = {}

m["de"] = {aliases = {"High German", "New High German", "Deutsch"}, varieties = {"Alsatian German", "American German", "Bavarian German", "Belgian German", "Central German", "DDR German", "East African German", "German German", "Hessian German", "Indiana German", "Liechtenstein German", "Lorraine German", "Luxembourgish German", "Namibian German", "Northern German", "Prussian German", "Silesia German", "South African German", "Southern German", "South Tyrolean German", "Switzerland German", "Texan German"}}

m["dv"] = {aliases = {"Divehi", "Maldivian"}, varieties = {{"Mahal", "Mahl"}}}

m["dz"] = {}

m["ee"] = {}

m["el"] = {aliases = {"Modern Greek", "Neo-Hellenic"}}

m["en"] = {aliases = {"Modern English", "New English"}, varieties = {"Polari", "Yinglish"}}

m["eo"] = {}

m["es"] = {aliases = {"Castilian"}, varieties = {{"Amazonian Spanish", "Amazonic Spanish"}, "Loreto-Ucayali Spanish"}}

m["et"] = {}

m["eu"] = {aliases = {"Euskara"}}

m["fa"] = {aliases = {"Farsi", "New Persian", "Modern Persian"}, varieties = {{"Western Persian", "Iranian Persian"}, {"Eastern Persian", "Dari"}, {"Aimaq", "Aimak", "Aymaq", "Eimak"}}}

m["ff"] = {
    aliases = {"Fulani"},
    varieties = {"Adamawa Fulfulde", "Bagirmi Fulfulde", "Borgu Fulfulde", "Central-Eastern Niger Fulfulde", "Fulfulde", "Maasina Fulfulde", "Nigerian Fulfulde", "Pular", "Pulaar", "Western Niger Fulfulde"} -- Maasina, etc are dialects, subsumed into this code; Pular and Pulaar are distinct
}

m["fi"] = {aliases = {"Suomi"}}

m["fj"] = {}

m["fo"] = {aliases = {"Faeroese"}}

m["fr"] = {aliases = {"Modern French"}, varieties = {"African French", "Algerian French", "Alsatian French", "Antilles French", "Atlantic Canadian French", "Belgian French", "Congolese French", "European French", "French French", "Haitian French", "Ivorian French", "Lorraine French", "Louisiana French", "Luxembourgish French", "Malian French", "Marseille French", "Missourian French", "Moroccan French", "Newfoundland French", "North American French", "Picard French", "Provençal French‎", "Quebec French", "Réunion French", "Rwandan French", "Tunisian French", "West African French"}}

m["fy"] = {aliases = {"Western Frisian"}}

m["ga"] = {
    aliases = {"Irish Gaelic", "Gaelic"}, -- calling it simply "Gaelic" is rare in Ireland, but relatively common in the Irish diaspora
    varieties = {{"Cois Fharraige Irish", "Cois Fhairrge Irish"}, {"Connacht Irish", "Connaught Irish"}, "Cork Irish", "Donegal Irish", "Galway Irish", "Kerry Irish", "Mayo Irish", "Munster Irish", "Ulster Irish", "Waterford Irish", "West Muskerry Irish"}
}

m["gd"] = {aliases = {"Gaelic", "Gàidhlig", "Scots Gaelic", "Scottish"}, varieties = {"Argyll Gaelic", "Arran Scottish Gaelic", {"Canadian Gaelic", "Canadian Scottish Gaelic", "Cape Breton Gaelic"}, "East Sutherland Gaelic", {"Galwegian Gaelic", "Gallovidian Gaelic", "Gallowegian Gaelic", "Galloway Gaelic"}, "Hebridean Gaelic", "Highland Gaelic"}}

m["gl"] = {}

m["gn"] = {}

m["gu"] = {}

m["gv"] = {aliases = {"Manx Gaelic"}, varieties = {"Northern Manx", "Southern Manx"}}

m["ha"] = {}

m["he"] = {aliases = {"Ivrit"}}

m["hi"] = {otherNames = {"Hindavi"}}

m["ho"] = {aliases = {"Pidgin Motu", "Police Motu"}}

m["ht"] = {aliases = {"Creole", "Haitian", "Kreyòl"}}

m["hu"] = {aliases = {"Magyar"}}

m["hy"] = {aliases = {"Modern Armenian"}, varieties = {"Eastern Armenian", "Western Armenian"}}

m["hz"] = {}

m["ia"] = {}

m["id"] = {}

m["ie"] = {aliases = {"Occidental"}}

m["ig"] = {}

m["ii"] = {aliases = {"Nuosu", "Nosu", "Northern Yi", "Liangshan Yi"}}

m["ik"] = {aliases = {"Inupiak", "Iñupiaq", "Inupiatun"}}

m["io"] = {}

m["is"] = {}

m["it"] = {}

m["iu"] = {varieties = {"Aivilimmiut", {"Eastern Canadian Inuktitut", "Eastern Canadian Inuit"}, {"Inuinnaq", "Inuinnaqtun"}, {"Inuvialuktun", "Inuvialuk", "Western Canadian Inuktitut", "Western Canadian Inuit", "Western Canadian Inuktun"}, "Kivallirmiut", "Natsilingmiut", "Nunavimmiutit", "Nunatsiavummiut", {"Siglitun", "Siglit"}}}

m["ja"] = {aliases = {"Modern Japanese", "Nipponese", "Nihongo"}}

m["jv"] = {}

m["ka"] = {varieties = {{"Judeo-Georgian", "Kivruli", "Gruzinic"}}}

m["kg"] = {aliases = {"Kikongo"}, varieties = {"Koongo", "Laari", "San Salvador Kongo", "Yombe"}}

m["ki"] = {aliases = {"Gikuyu", "Gĩkũyũ"}}

m["kj"] = {aliases = {"Kuanyama", "Oshikwanyama"}}

m["kk"] = {}

m["kl"] = {aliases = {"Kalaallisut"}}

m["km"] = {aliases = {"Cambodian", "Central Khmer", "Modern Khmer"}}

m["kn"] = {}

m["ko"] = {aliases = {"Modern Korean"}}

m["kr"] = {varieties = {"Kanembu", "Bilma Kanuri", "Central Kanuri", "Manga Kanuri", "Tumari Kanuri"}}

m["ks"] = {aliases = {"Koshur"}}

-- "kv" IS TREATED AS "koi", "kpv", SEE WT:LT

m["kw"] = {}

m["ky"] = {aliases = {"Kirghiz", "Kirgiz"}}

m["la"] = {}

m["lb"] = {}

m["lg"] = {aliases = {"Ganda", "Oluganda"}}

m["li"] = {aliases = {"Limburgan", "Limburgian", "Limburgic"}}

m["ln"] = {aliases = {"Ngala"}}

m["lo"] = {aliases = {"Laotian"}}

m["lt"] = {}

m["lu"] = {}

m["lv"] = {aliases = {"Lettish", "Lett"}}

m["mg"] = {varieties = {{"Antankarana", "Antankarana Malagasy"}, {"Bara Malagasy", "Bara"}, {"Betsimisaraka Malagasy", "Betsimisaraka"}, {"Northern Betsimisaraka Malagasy", "Northern Betsimisaraka"}, {"Southern Betsimisaraka Malagasy", "Southern Betsimisaraka"}, {"Bushi", "Shibushi", "Kibushi"}, {"Masikoro Malagasy", "Masikoro"}, "Plateau Malagasy", "Sakalava", {"Tandroy Malagasy", "Tandroy"}, {"Tanosy", "Tanosy Malagasy"}, "Tesaka", {"Tsimihety", "Tsimihety Malagasy"}}}

m["mh"] = {}

m["mi"] = {aliases = {"Māori"}}

m["mk"] = {}

m["ml"] = {}

m["mn"] = {varieties = {"Khalkha Mongolian"}}

-- "mo" IS TREATED AS "ro", SEE WT:LT

m["mr"] = {}

m["ms"] = {aliases = {"Malaysian", "Standard Malay"}}

m["mt"] = {}

m["my"] = {aliases = {"Myanmar"}, varieties = {"Mandalay Burmese", "Myeik Burmese", "Palaw Burmese", {"Rangoon Burmese", "Yangon Burmese"}, "Yaw Burmese"}}

m["na"] = {aliases = {"Nauru"}}

m["nb"] = {aliases = {"Bokmål"}}

m["nd"] = {aliases = {"North Ndebele"}}

m["ne"] = {
    aliases = {"Nepalese"},
    varieties = {"Palpa"} -- 3832956, former "plp", retired by ISO as spurious
}

m["ng"] = {}

m["nl"] = {
    varieties = {"Netherlandic", "Flemish"} -- FIXME, check this
}

m["nn"] = {aliases = {"New Norwegian", "Nynorsk"}}

m["no"] = {}

m["nr"] = {aliases = {"South Ndebele"}}

m["nv"] = {aliases = {"Navaho", "Diné bizaad"}}

m["ny"] = {aliases = {"Chicheŵa", "Chinyanja", "Nyanja", "Chewa", "Cicewa", "Cewa", "Cinyanja"}}

m["oc"] = {
    -- don't list varieties here that are in [[Module:etymology languages/data]]
}

m["oj"] = {aliases = {"Ojibway", "Ojibwa"}, varieties = {{"Chippewa", "Ojibwemowin", "Southwestern Ojibwa"}}}

m["om"] = {varieties = {"Orma", "Borana-Arsi-Guji Oromo", "West Central Oromo"}}

m["or"] = {aliases = {"Odia", "Oorya"}}

m["os"] = {aliases = {"Ossete", "Ossetic"}, varieties = {"Digor", "Iron"}}

m["pa"] = {aliases = {"Panjabi"}}

m["pi"] = {}

m["pl"] = {}

m["ps"] = {aliases = {"Pashtun", "Pushto", "Pashtu", "Afghani"}, varieties = {"Central Pashto", "Northern Pashto", "Southern Pashto", {"Pukhto", "Pakhto", "Pakkhto"}}}

m["pt"] = {aliases = {"Modern Portuguese"}}

m["qu"] = {}

m["rm"] = {aliases = {"Romansh", "Rumantsch", "Romanche"}}

m["ro"] = {aliases = {"Daco-Romanian", "Roumanian", "Rumanian"}}

m["ru"] = {}

m["rw"] = {
    -- don't list varieties here that are in [[Module:etymology languages/data]]
    varieties = {{"Ha", "Giha"}, "Hangaza", "Vinza", "Shubi"} -- Deleted "Subi", which normally refers to a different language
}

m["sa"] = {}

m["sc"] = {
    -- don't list varieties here that are in [[Module:etymology languages/data]]
}

m["sd"] = {}

m["se"] = {aliases = {"North Sami", "Northern Saami", "North Saami"}}

m["sg"] = {}

m["sh"] = {
    aliases = {"BCS", "Croato-Serbian", "Serbocroatian"},
    -- don't list varieties here that are in [[Module:etymology languages/data]]
    varieties = {"Bosnian", "Croatian", "Montenegrin", "Serbian", "Shtokavian"}
}

m["si"] = {aliases = {"Singhalese", "Sinhala"}}

m["sk"] = {}

m["sl"] = {aliases = {"Slovenian"}}

m["sm"] = {}

m["sn"] = {}

m["so"] = {}

m["sq"] = {
    -- don't list varieties here that are in [[Module:etymology languages/data]]
}

m["ss"] = {aliases = {"Swati"}}

m["st"] = {aliases = {"Sesotho", "Southern Sesotho", "Southern Sotho"}}

m["su"] = {}

m["sv"] = {}

m["sw"] = {varieties = {{"Settler Swahili", "KiSetla", "KiSettla", "Setla", "Settla", "Kitchen Swahili"}, {"Kihindi", "Indian Swahili"}, {"KiShamba", "Kishamba", "Field Swahili"}, {"Kibabu", "Asian Swahili"}, {"Kimanga", "Arab Swahili"}, {"Kitvita", "Army Swahili"}}}

m["ta"] = {}

m["te"] = {}

m["tg"] = {aliases = {"Eastern Persian", "Tadjik", "Tadzhik", "Tajiki", "Tajik Persian", "Tajiki Persian"}}

m["th"] = {aliases = {"Central Thai", "Siamese"}}

m["ti"] = {aliases = {"Tigrigna"}}

m["tk"] = {}

m["tl"] = {}

m["tn"] = {aliases = {"Setswana"}}

m["to"] = {}

m["tr"] = {}

m["ts"] = {aliases = {"Xitsonga"}}

m["tt"] = {}

-- "tw" IS TREATED AS "ak", SEE WT:LT

m["ty"] = {}

m["ug"] = {aliases = {"Uigur", "Uighur", "Uygur"}}

m["uk"] = {}
m["ur"] = {}

m["uz"] = {varieties = {"Northern Uzbek", "Southern Uzbek"}}

m["ve"] = {}

m["vi"] = {aliases = {"Annamese", "Annamite"}}

m["vo"] = {}

m["wa"] = {varieties = {"Liégeois", "Namurois", "Wallo-Picard", "Wallo-Lorrain"}}

m["wo"] = {
    varieties = {"Gambian Wolof"} -- the subsumed dialect 'wof'
}

m["xh"] = {}

m["yi"] = {varieties = {"American Yiddish", "Daytshmerish Yiddish", "Mideastern Yiddish", "Galitzish", {"Northeastern Yiddish", "Litvish", "Lithuanian Yiddish"}, {"Northwestern Yiddish", "Netherlandic Yiddish"}, {"Polish Yiddish", "Poylish"}, "South African Yiddish", {"Southeastern Yiddish", "Ukrainian Yiddish", "Ukrainish"}, {"Southwestern Yiddish", "Judeo-Alsatian"}, "Udmurtish"}}

m["yo"] = {}

m["za"] = {
    -- FIXME, are all of the following distinct?
    varieties = {
        "Chongzuo Zhuang", "Guibei Zhuang", "Guibian Zhuang", "Central Hongshuihe Zhuang", "Eastern Hongshuihe Zhuang", "Lianshan Zhuang", "Liujiang Zhuang", "Liuqian Zhuang", {"Min Zhuang", "Minz Zhuang"}, "Nong Zhuang", -- see zhn
        "Qiubei Zhuang", "Shangsi Zhuang", {"Dai Zhuang", "Wenma", "Wenma Thu", "Wenma Zhuang"}, "Yang Zhuang", {"Yongbei Zhuang", "Wuming Zhuang", "Standard Zhuang"}, "Yongnan Zhuang", "Youjiang Zhuang", "Zuojiang Zhuang"
    }
}

m["zh"] = {}

m["zu"] = {aliases = {"isiZulu"}}

return m
