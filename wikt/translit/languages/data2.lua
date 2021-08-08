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
local OGONEK = u(0x0328)
local DOUBLEINVBREVE = u(0x0361)

-- Punctuation to be used for standardChars field
local PUNCTUATION = " !#%&*+,-./:;<=>?@^_`|~'()"

local Cyrl = {"Cyrl"}
local Latn = {"Latn"}
local LatnArab = {"Latn", "Arab"}

local m = {}

m["aa"] = {"Afar", 27811, "cus", scripts = Latn, entry_name = {remove_diacritics = ACUTE}}

m["ab"] = {"Abkhaz", 5111, "cau-abz", scripts = {"Cyrl", "Geor", "Latn"}, translit_module = "ab-translit", override_translit = true, entry_name = {from = {GRAVE, ACUTE}, to = {}}}

m["ae"] = {"Avestan", 29572, "ira-cen", scripts = {"Avst", "Gujr"}, translit_module = "Avst-translit", wikipedia_article = "Avestan"}

m["af"] = {"Afrikaans", 14196, "gmw", scripts = LatnArab, ancestors = {"nl"}, sort_key = {from = {"[äáâà]", "[ëéêè]", "[ïíîì]", "[öóôò]", "[üúûù]", "[ÿýŷỳ]", "^-", "'"}, to = {"a", "e", "i", "o", "u", "y"}}}

m["ak"] = {"Akan", 28026, "alv-ctn", scripts = Latn}

m["am"] = {"Amharic", 28244, "sem-eth", scripts = {"Ethi"}, translit_module = "Ethi-translit"}

m["an"] = {"Aragonese", 8765, "roa-ibe", scripts = Latn, ancestors = {"roa-oan"}}

m["ar"] = {
    "Arabic",
    13955,
    "sem-arb",
    scripts = {"Arab", "Hebr", "Brai"},
    -- replace alif waṣl with alif
    -- remove tatweel and diacritics: fathatan, dammatan, kasratan, fatha,
    -- damma, kasra, shadda, sukun, superscript (dagger) alef
    entry_name = {from = {u(0x0671), u(0x0640), "[" .. u(0x064B) .. "-" .. u(0x0652) .. "]", u(0x0670)}, to = {u(0x0627)}},
    translit_module = "ar-translit",
    standardChars = "ء-غف-ْٰٱ" .. PUNCTUATION .. "٠-٩،؛؟٫٬ـ"
}

m["as"] = {"Assamese", 29401, "inc-eas", scripts = {"as-Beng"}, ancestors = {"inc-mas"}, translit_module = "as-translit"}

m["av"] = {"Avar", 29561, "cau-nec", scripts = Cyrl, ancestors = {"oav"}, translit_module = "av-translit", override_translit = true, entry_name = {from = {GRAVE, ACUTE}, to = {}}}

m["ay"] = {"Aymara", 4627, "sai-aym", scripts = Latn}

m["az"] = {"Azerbaijani", 9292, "trk-ogz", scripts = {"Latn", "Cyrl", "fa-Arab"}, ancestors = {"trk-oat"}}

m["ba"] = {"Bashkir", 13389, "trk-kbu", scripts = Cyrl, translit_module = "ba-translit", override_translit = true}

m["be"] = {"Belarusian", 9091, "zle", scripts = Cyrl, ancestors = {"orv"}, translit_module = "be-translit", sort_key = {from = {"Ё", "ё"}, to = {"Е", "е"}}, entry_name = {from = {"Ѐ", "ѐ", GRAVE, ACUTE}, to = {"Е", "е"}}}

m["bg"] = {"Bulgarian", 7918, "zls", scripts = {"Cyrl"}, ancestors = {"cu"}, translit_module = "bg-translit", entry_name = {from = {"Ѐ", "ѐ", "Ѝ", "ѝ", GRAVE, ACUTE}, to = {"Е", "е", "И", "и"}}}

m["bh"] = {"Bihari", 135305, "inc-eas", scripts = {"Deva"}, ancestors = {"inc-mgd"}}

m["bi"] = {"Bislama", 35452, "crp", scripts = Latn, ancestors = {"en"}}

m["bm"] = {"Bambara", 33243, "dmn-emn", scripts = Latn}

m["bn"] = {"Bengali", 9610, "inc-eas", scripts = {"Beng", "Newa"}, ancestors = {"inc-mbn"}, translit_module = "bn-translit"}

m["bo"] = {
    "Tibetan",
    34271,
    "sit-tib",
    scripts = {"Tibt"}, -- sometimes Deva?
    ancestors = {"xct"},
    translit_module = "bo-translit",
    override_translit = true
}

m["br"] = {"Breton", 12107, "cel-bry", scripts = Latn, ancestors = {"xbm"}}

m["ca"] = {"Catalan", 7026, "roa", scripts = Latn, ancestors = {"roa-oca"}, sort_key = {from = {"à", "[èé]", "[íï]", "[òó]", "[úü]", "ç", "l·l"}, to = {"a", "e", "i", "o", "u", "c", "ll"}}}

m["ce"] = {"Chechen", 33350, "cau-vay", scripts = Cyrl, translit_module = "ce-translit", override_translit = true, entry_name = {from = {MACRON}, to = {}}}

m["ch"] = {"Chamorro", 33262, "poz-sus", scripts = Latn}

m["co"] = {"Corsican", 33111, "roa-itd", scripts = Latn}

m["cr"] = {"Cree", 33390, "alg", scripts = {"Cans", "Latn"}, translit_module = "translit-redirect"}

m["cs"] = {"Czech", 9056, "zlw", scripts = Latn, ancestors = {"zlw-ocs"}, sort_key = {from = {"á", "é", "í", "ó", "[úů]", "ý"}, to = {"a", "e", "i", "o", "u", "y"}}}

m["cu"] = {
    "Old Church Slavonic",
    35499,
    "zls",
    scripts = {"Cyrs", "Glag"},
    translit_module = "Cyrs-Glag-translit",
    entry_name = {
        from = {u(0x0484)}, -- kamora
        to = {}
    },
    sort_key = {from = {"оу", "є"}, to = {"у", "е"}}
}

m["cv"] = {"Chuvash", 33348, "trk-ogr", scripts = Cyrl, ancestors = {"xbo"}, translit_module = "cv-translit", override_translit = true}

m["cy"] = {"Welsh", 9309, "cel-bry", scripts = Latn, ancestors = {"wlm"}, sort_key = {from = {"[âáàä]", "ch", "dd", "[êéèë]", "ff", "ngh", "[îíìï]", "ll", "[ôóòö]", "ph", "rh", "th", "[ûúùü]", "[ŵẃẁẅ]", "[ŷýỳÿ]", "'"}, to = {"a", "c~", "d~", "e", "f~", "g~h", "i", "l~", "o", "p~", "r~", "t~", "u", "w", "y"}}, standardChars = "A-IL-PR-UWYa-il-pr-uwy0-9ÂâÊêÎîÔôÛûŴŵŶŷ" .. PUNCTUATION}

m["da"] = {"Danish", 9035, "gmq", scripts = Latn, ancestors = {"gmq-oda"}}

m["de"] = {"German", 188, "gmw", scripts = {"Latn", "Latf"}, ancestors = {"gmh"}, sort_key = {from = {"[äàáâå]", "[ëèéê]", "[ïìíî]", "[öòóô]", "[üùúû]", "ß"}, to = {"a", "e", "i", "o", "u", "ss"}}, standardChars = "A-Za-z0-9ÄäÖöÜüß" .. PUNCTUATION}

m["dv"] = {"Dhivehi", 32656, "inc-ins", scripts = {"Thaa"}, ancestors = {"elu-prk"}, translit_module = "dv-translit", override_translit = true}

m["dz"] = {"Dzongkha", 33081, "sit-tib", scripts = {"Tibt"}, ancestors = {"xct"}, translit_module = "bo-translit", override_translit = true}

m["ee"] = {"Ewe", 30005, "alv-gbe", scripts = Latn}

m["el"] = {
    "Greek",
    9129,
    "grk",
    scripts = {"Grek", "Brai"},
    ancestors = {"grc"},
    translit_module = "el-translit",
    override_translit = true,
    sort_key = { -- Keep this synchronized with grc, cpg, pnt, tsd
        from = {"[ᾳάᾴὰᾲᾶᾷἀᾀἄᾄἂᾂἆᾆἁᾁἅᾅἃᾃἇᾇ]", "[έὲἐἔἒἑἕἓ]", "[ῃήῄὴῂῆῇἠᾐἤᾔἢᾒἦᾖἡᾑἥᾕἣᾓἧᾗ]", "[ίὶῖἰἴἲἶἱἵἳἷϊΐῒῗ]", "[όὸὀὄὂὁὅὃ]", "[ύὺῦὐὔὒὖὑὕὓὗϋΰῢῧ]", "[ῳώῴὼῲῶῷὠᾠὤᾤὢᾢὦᾦὡᾡὥᾥὣᾣὧᾧ]", "ῥ", "ς"},
        to = {"α", "ε", "η", "ι", "ο", "υ", "ω", "ρ", "σ"}
    },
    standardChars = "ͺ;΄-ώϜϝ" .. PUNCTUATION
}

m["en"] = {
    "English",
    1860,
    "gmw",
    scripts = {"Latn", "Brai", "Shaw", "Dsrt"}, -- entries in Shaw or Dsrt might require prior discussion
    ancestors = {"enm"},
    sort_key = {from = {"[äàáâåā]", "[ëèéêē]", "[ïìíîī]", "[öòóôō]", "[üùúûū]", "æ", "œ", "[çč]", "ñ", "'"}, to = {"a", "e", "i", "o", "u", "ae", "oe", "c", "n"}},
    wikimedia_codes = {"en", "simple"},
    standardChars = "A-Za-z0-9" .. PUNCTUATION .. u(0x2800) .. "-" .. u(0x28FF)
}

m["eo"] = {"Esperanto", 143, "art", scripts = Latn, sort_key = {from = {"[áà]", "[éè]", "[íì]", "[óò]", "[úù]", "[ĉ]", "[ĝ]", "[ĥ]", "[ĵ]", "[ŝ]", "[ŭ]"}, to = {"a", "e", "i", "o", "u", "cĉ", "gĉ", "hĉ", "jĉ", "sĉ", "uĉ"}}, standardChars = "A-PRSTUVZa-prstuvzĉĈĝĜĵĴŝŜŭŬ0-9" .. PUNCTUATION}

m["es"] = {"Spanish", 1321, "roa-ibe", scripts = {"Latn", "Brai"}, ancestors = {"osp"}, sort_key = {from = {"á", "é", "í", "ó", "[úü]", "ç", "ñ"}, to = {"a", "e", "i", "o", "u", "c", "n"}}, standardChars = "A-VXYZa-vxyz0-9ÁáÉéÍíÓóÚúÑñ¿¡" .. PUNCTUATION}

m["et"] = {"Estonian", 9072, "fiu-fin", scripts = Latn}

m["eu"] = {"Basque", 8752, "euq", scripts = Latn}

m["fa"] = {
    "Persian",
    9168,
    "ira-swi",
    scripts = {"fa-Arab"},
    ancestors = {"pal"}, -- "ira-mid"
    entry_name = {from = {u(0x064E), u(0x0640), u(0x064F), u(0x0650), u(0x0651), u(0x0652)}, to = {}}
}

m["ff"] = {"Fula", 33454, "alv-fwo", scripts = {"Latn", "Adlm"}}

m["fi"] = {
    "Finnish",
    1412,
    "fiu-fin",
    scripts = Latn,
    entry_name = {
        from = {"ˣ"}, -- Used to indicate gemination of the next consonant
        to = {}
    },
    sort_key = {from = {"[áàâã]", "[éèêẽ]", "[íìîĩ]", "[óòôõ]", "[úùûũ]", "[ýỳŷüű]", "[øõő]", "æ", "œ", "[čç]", "š", "ž", "ß", "[':]"}, to = {"a", "e", "i", "o", "u", "y", "ö", "ae", "oe", "c", "s", "z", "ss"}}
}

m["fj"] = {"Fijian", 33295, "poz-occ", scripts = Latn}

m["fo"] = {"Faroese", 25258, "gmq", scripts = Latn, ancestors = {"non"}}

m["fr"] = {"French", 150, "roa-oil", scripts = {"Latn", "Brai"}, ancestors = {"frm"}, sort_key = {from = {"[áàâä]", "[éèêë]", "[íìîï]", "[óòôö]", "[úùûü]", "[ýỳŷÿ]", "ç", "æ", "œ", "'"}, to = {"a", "e", "i", "o", "u", "y", "c", "ae", "oe"}}, standardChars = "A-Za-z0-9ÀÂÇÉÈÊËÎÏÔŒÛÙÜàâçéèêëîïôœûùü«»" .. PUNCTUATION}

m["fy"] = {"West Frisian", 27175, "gmw-fri", scripts = Latn, ancestors = {"ofs"}, sort_key = {from = {"[àáâä]", "[èéêë]", "[ìíîïyỳýŷÿ]", "[òóôö]", "[ùúûü]", "æ", "[ /.-]"}, to = {"a", "e", "i", "o", "u", "ae"}}, standardChars = "A-PR-WYZa-pr-wyz0-9Ææâäàéêëèïìôöòúûüùỳ" .. PUNCTUATION}

m["ga"] = {"Irish", 9142, "cel-gae", scripts = Latn, ancestors = {"mga"}, sort_key = {from = {"á", "é", "í", "ó", "ú", "ý", "ḃ", "ċ", "ḋ", "ḟ", "ġ", "ṁ", "ṗ", "ṡ", "ṫ"}, to = {"a", "e", "i", "o", "u", "y", "bh", "ch", "dh", "fh", "gh", "mh", "ph", "sh", "th"}}, standardChars = "A-IL-PR-Ua-il-pr-u0-9ÁáÉéÍíÓóÚú" .. PUNCTUATION}

m["gd"] = {"Scottish Gaelic", 9314, "cel-gae", scripts = Latn, ancestors = {"mga"}, sort_key = {from = {"[áà]", "[éè]", "[íì]", "[óò]", "[úù]", "[ýỳ]"}, to = {"a", "e", "i", "o", "u", "y"}}, standardChars = "A-IL-PR-Ua-il-pr-u0-9ÀàÈèÌìÒòÙù" .. PUNCTUATION}

m["gl"] = {"Galician", 9307, "roa-ibe", scripts = Latn, ancestors = {"roa-opt"}, sort_key = {from = {"á", "é", "í", "ó", "ú"}, to = {"a", "e", "i", "o", "u"}}}

m["gn"] = {"Guaraní", 35876, "tup-gua", scripts = Latn}

m["gu"] = {"Gujarati", 5137, "inc-wes", scripts = {"Gujr"}, ancestors = {"inc-mgu"}, translit_module = "gu-translit"}

m["gv"] = {"Manx", 12175, "cel-gae", scripts = Latn, ancestors = {"mga"}, sort_key = {from = {"ç", "-"}, to = {"c"}}, standardChars = "A-WYÇa-wyç0-9" .. PUNCTUATION}

m["ha"] = {"Hausa", 56475, "cdc-wst", scripts = LatnArab, sort_key = {from = {"ɓ", "ɗ", "ƙ", "'y", "ƴ", "'"}, to = {"b~", "d~", "k~", "y~", "y~", ""}}, entry_name = {from = {"R̃", "r̃", "À", "à", "È", "è", "Ì", "ì", "Ò", "ò", "Ù", "ù", "Â", "â", "Ê", "ê", "Î", "î", "Ô", "ô", "Û", "û", "Ā", "ā", "Ē", "ē", "Ī", "ī", "Ō", "ō", "Ū", "ū", "Á", "á", "É", "é", "Í", "í", "Ó", "ó", "Ú", "ú", "Ā̀", "ā̀", "Ḕ", "ḕ", "Ī̀", "ī̀", "Ṑ", "ṑ", "Ū̀", "ū̀", GRAVE, ACUTE}, to = {"R", "r", "A", "a", "E", "e", "I", "i", "O", "o", "U", "u", "A", "a", "E", "e", "I", "i", "O", "o", "U", "u", "A", "a", "E", "e", "I", "i", "O", "o", "U", "u", "A", "a", "E", "e", "I", "i", "O", "o", "U", "u", "A", "a", "E", "e", "I", "i", "O", "o", "U", "u"}}}

m["he"] = {"Hebrew", 9288, "sem-can", scripts = {"Hebr", "Phnx", "Brai"}, entry_name = {from = {"[" .. u(0x0591) .. "-" .. u(0x05BD) .. u(0x05BF) .. "-" .. u(0x05C5) .. u(0x05C7) .. "]"}, to = {}}}

m["hi"] = {"Hindi", 1568, "inc-hnd", scripts = {"Deva", "Kthi", "Newa"}, ancestors = {"inc-ohi"}, translit_module = "hi-translit", standardChars = "ँंअ-ऊएऐओ-घच-झट-नप-रलवशसहा-ूेैो-◌्।-॰ड़ढ़" .. PUNCTUATION}

m["ho"] = {"Hiri Motu", 33617, "crp", scripts = Latn, ancestors = {"meu"}}

m["ht"] = {"Haitian Creole", 33491, "crp", scripts = Latn, ancestors = {"fr"}}

m["hu"] = {"Hungarian", 9067, "urj-ugr", scripts = {"Latn", "Hung"}, ancestors = {"ohu"}, sort_key = {from = {"á", "é", "í", "ó", "ú", "[öő]", "[üű]", "cs", "dzs", "gy", "ly", "ny", "zs"}, to = {"a", "e", "i", "o", "u", "o~", "u~", "c~", "dz~", "g~", "l~", "n~", "z~"}}}

m["hy"] = {"Armenian", 8785, "hyx", scripts = {"Armn", "Brai"}, ancestors = {"axm"}, translit_module = "Armn-translit", override_translit = true, sort_key = {from = {"ու", "և", "եւ"}, to = {"ւ", "եվ", "եվ"}}, entry_name = {from = {"՞", "՜", "՛", "՟", "և", "<sup>յ</sup>", "<sup>ի</sup>", "<sup>է</sup>"}, to = {"", "", "", "", "եւ", "յ", "ի", "է"}}}

m["hz"] = {"Herero", 33315, "bnt-swb", scripts = Latn}

m["ia"] = {"Interlingua", 35934, "art", scripts = Latn}

m["id"] = {"Indonesian", 9240, "poz-mly", scripts = Latn, ancestors = {"ms"}}

m["ie"] = {"Interlingue", 35850, "art", scripts = Latn, type = "appendix-constructed"}

m["ig"] = {"Igbo", 33578, "alv-igb", scripts = Latn, sort_key = {from = {"ụ", "ị", "ọ", "gb", "gh", "gw", "kp", "kw", "ṅ", "nw", "ny", "sh"}, to = {"u~", "i~", "o~", "gy", "gz", "g~", "kz", "k~", "ny", "nz", "n~", "s~"}}, entry_name = {remove_diacritics = ACUTE .. GRAVE .. MACRON}}

m["ii"] = {"Sichuan Yi", 34235, "tbq-lol", scripts = {"Yiii"}, translit_module = "ii-translit"}

m["ik"] = {"Inupiaq", 27183, "esx-inu", scripts = Latn}

m["io"] = {"Ido", 35224, "art", scripts = Latn}

m["is"] = {"Icelandic", 294, "gmq", scripts = Latn, ancestors = {"non"}}

m["it"] = {"Italian", 652, "roa-itd", scripts = Latn, sort_key = {from = {"[àáâäå]", "[èéêë]", "[ìíîï]", "[òóôö]", "[ùúûü]"}, to = {"a", "e", "i", "o", "u"}}, standardChars = "A-IL-VZa-il-vz0-9" .. PUNCTUATION}

m["iu"] = {"Inuktitut", 29921, "esx-inu", scripts = {"Cans", "Latn"}, translit_module = "translit-redirect", override_translit = true}

m["ja"] = {
    "Japanese",
    5287,
    "jpx",
    scripts = {"Jpan", "Brai"},
    ancestors = {"ojp"}
    --[=[
	-- Handled by jsort function in [[Module:ja]].
	sort_key = {
		from = {"[ぁァア]", "[ぃィイ]", "[ぅゔゥウヴ]", "[ぇェエ]", "[ぉォオ]", "[がゕカガヵ]", "[ぎキギ]", "[ぐクグㇰ]", "[げゖケゲヶ]", "[ごコゴ]", "[ざサザ]", "[じシジㇱ]", "[ずスズㇲ]", "[ぜセゼ]", "[ぞソゾ]", "[だタダ]", "[ぢチヂ]", "[っづッツヅ]", "[でテデ]", "[どトドㇳ]", "ナ", "ニ", "[ヌㇴ]", "ネ", "ノ", "[ばぱハバパㇵ]", "[びぴヒビピㇶ]", "[ぶぷフブプㇷ]", "[べぺヘベペㇸ]", "[ぼぽホボポㇹ]", "マ", "ミ", "[ムㇺ]", "メ", "モ", "[ゃャヤ]", "[ゅュユ]", "[ょョヨ]", "[ラㇻ]", "[リㇼ]", "[ルㇽ]", "[レㇾ]", "[ロㇿ]", "[ゎヮワヷ]", "[ヰヸ]", "[ヱヹ]", "[ヲヺ]", "ン", "[゙゚゛゜ゝゞ・ヽヾ]", "𛀀"},
		to   = {"あ", "い", "う", "え", "お", "か", "き", "く", "け", "こ", "さ", "し", "す", "せ", "そ", "た", "ち", "つ", "て", "と", "な", "に", "ぬ", "ね", "の", "は", "ひ", "ふ", "へ", "ほ", "ま", "み", "む", "め", "も", "や", "ゆ", "よ", "ら", "り", "る", "れ", "ろ", "わ", "ゐ", "ゑ", "を", "ん", "", "え"}},
	--]=]
}

m["jv"] = {"Javanese", 33549, "poz-sus", scripts = {"Latn", "Java"}, translit_module = "jv-translit", ancestors = {"kaw"}, link_tr = true}

m["ka"] = {
    "Georgian",
    8108,
    "ccs-gzn",
    scripts = {"Geor", "Geok", "Hebr"}, -- Hebr is used to write Judeo-Georgian
    ancestors = {"oge"},
    translit_module = "Geor-translit",
    override_translit = true,
    entry_name = {from = {"̂"}, to = {""}}
}

m["kg"] = {"Kongo", 33702, "bnt-kng", scripts = Latn}

m["ki"] = {"Kikuyu", 33587, "bnt-kka", scripts = Latn}

m["kj"] = {"Kwanyama", 1405077, "bnt-ova", scripts = Latn}

m["kk"] = {"Kazakh", 9252, "trk-kno", scripts = {"Cyrl", "Latn", "kk-Arab"}, translit_module = "kk-translit", override_translit = true}

m["kl"] = {"Greenlandic", 25355, "esx-inu", scripts = Latn}

m["km"] = {"Khmer", 9205, "mkh-kmr", scripts = {"Khmr"}, ancestors = {"mkh-mkm"}, translit_module = "km-translit"}

m["kn"] = {"Kannada", 33673, "dra", scripts = {"Knda"}, ancestors = {"dra-mkn"}, translit_module = "kn-translit"}

m["ko"] = {
    "Korean",
    9176,
    "qfa-kor",
    scripts = {"Kore", "Brai"},
    ancestors = {"okm"},
    -- 20210122 idea: strip parenthesized hanja from entry link
    -- Hani regex is a reasonable subset of Hani from [[Module:scripts/data]],
    -- last updated on 20210214.
    entry_name = {from = {" *%([一-鿿㐀-䶿𠀀-𮯯𰀀-𱍏﨎﨏﨑﨓﨔﨟﨡﨣﨤﨧﨨﨩]+%)"}, to = {""}},
    display = {from = {"%-"}, to = {}},
    translit_module = "ko-translit"
}

m["kr"] = {
    "Kanuri",
    36094,
    "ssa-sah",
    scripts = LatnArab,
    sort_key = {from = {"ny", "ǝ", "sh"}, to = {"n~", "e~", "s~"}}, -- the sortkey and entry_name are only for standard Kanuri; when dialectal entries get added, someone will have to work out how the dialects should be represented orthographically
    entry_name = {from = {"À", "à", "È", "è", "Ǝ̀", "ǝ̀", "Ì", "ì", "Ò", "ò", "Ù", "ù", "Â", "â", "Ê", "ê", "Ǝ̂", "ǝ̂", "Î", "î", "Ô", "ô", "Û", "û", "Ă", "ă", "Ĕ", "ĕ", "Ǝ̆", "ǝ̆", "Ĭ", "ĭ", "Ŏ", "ŏ", "Ŭ", "ŭ", "Á", "á", "É", "é", "Ǝ́", "ǝ́", "Í", "í", "Ó", "ó", "Ú", "ú", GRAVE, ACUTE}, to = {"A", "a", "E", "e", "Ǝ", "ǝ", "I", "i", "O", "o", "U", "u", "A", "a", "E", "e", "Ǝ", "ǝ", "I", "i", "O", "o", "U", "u", "A", "a", "E", "e", "Ǝ", "ǝ", "I", "i", "O", "o", "U", "u", "A", "a", "E", "e", "Ǝ", "ǝ", "I", "i", "O", "o", "U", "u"}}
}

m["ks"] = {"Kashmiri", 33552, "inc-dar", scripts = {"ks-Arab", "Deva", "Shrd", "Latn"}, translit_module = "translit-redirect", ancestors = {"inc-dar-pro"}}

-- "kv" IS TREATED AS "koi", "kpv", SEE WT:LT

m["kw"] = {"Cornish", 25289, "cel-bry", scripts = Latn, ancestors = {"cnx"}}

m["ky"] = {"Kyrgyz", 9255, "trk-kip", scripts = {"Cyrl", "Latn", "Arab"}, translit_module = "ky-translit", override_translit = true}

m["la"] = {"Latin", 397, "itc", scripts = Latn, ancestors = {"itc-ola"}, entry_name = {remove_diacritics = MACRON .. BREVE .. DIAER .. DOUBLEINVBREVE}, standardChars = "A-Za-z0-9ÆæŒœĀ-ăĒ-ĕĪ-ĭŌ-ŏŪ-ŭȲȳ" .. MACRON .. BREVE .. PUNCTUATION}

m["lb"] = {"Luxembourgish", 9051, "gmw", scripts = Latn, ancestors = {"gmh"}}

m["lg"] = {"Luganda", 33368, "bnt-nyg", scripts = Latn, entry_name = {from = {"á", "Á", "é", "É", "í", "Í", "ó", "Ó", "ú", "Ú", "ń", "Ń", "ḿ", "Ḿ", "â", "Â", "ê", "Ê", "î", "Î", "ô", "Ô", "û", "Û"}, to = {"a", "A", "e", "E", "i", "I", "o", "O", "u", "U", "n", "N", "m", "M", "a", "A", "e", "E", "i", "I", "o", "O", "u", "U"}}, sort_key = {from = {"ŋ"}, to = {"n"}}}

m["li"] = {"Limburgish", 102172, "gmw", scripts = Latn, ancestors = {"dum"}}

m["ln"] = {"Lingala", 36217, "bnt-bmo", scripts = Latn}

m["lo"] = {"Lao", 9211, "tai-swe", scripts = {"Laoo"}, translit_module = "lo-translit", sort_key = {from = {"[%pໆ]", "[່-ໍ]", "ຼ", "ຽ", "ໜ", "ໝ", "([ເແໂໃໄ])([ກ-ຮ])"}, to = {"", "", "ລ", "ຍ", "ຫນ", "ຫມ", "%2%1"}}, standardChars = "0-9ກຂຄງຈຊຍດຕຖທນບປຜຝພຟມຢຣລວສຫອຮຯ-ໝ" .. PUNCTUATION}

m["lt"] = {"Lithuanian", 9083, "bat", scripts = Latn, ancestors = {"olt"}, entry_name = {from = {"[áãà]", "[ÁÃÀ]", "[éẽè]", "[ÉẼÈ]", "[íĩì]", "[ÍĨÌ]", "[ýỹ]", "[ÝỸ]", "ñ", "[óõò]", "[ÓÕÒ]", "[úũù]", "[ÚŨÙ]", ACUTE, GRAVE, TILDE}, to = {"a", "A", "e", "E", "i", "I", "y", "Y", "n", "o", "O", "u", "U"}}}

m["lu"] = {"Luba-Katanga", 36157, "bnt-lub", scripts = Latn}

m["lv"] = {
    "Latvian",
    9078,
    "bat",
    scripts = Latn,
    entry_name = {
        -- This attempts to convert vowels with tone marks to vowels either with
        -- or without macrons. Specifically, there should be no macrons if the
        -- vowel is part of a diphthong (including resonant diphthongs such
        -- pìrksts -> pirksts not #pīrksts). What we do is first convert the
        -- vowel + tone mark to a vowel + tilde in a decomposed fashion,
        -- then remove the tilde in diphthongs, then convert the remaining
        -- vowel + tilde sequences to macroned vowels, then delete any other
        -- tilde. We leave already-macroned vowels alone: Both e.g. ar and ār
        -- occur before consonants. FIXME: This still might not be sufficient.
        from = {"Ȩ", "ȩ", "[ÂÃÀ]", "[âãà]", "[ÊẼÈ]", "[êẽè]", "[ÎĨÌ]", "[îĩì]", "[ÔÕÒ]", "[ôõò]", "[ÛŨÙ]", "[ûũù]", "[ÑǸ]", "[ñǹ]", "[" .. CIRC .. TILDE .. GRAVE .. "]", "([aAeEiIoOuU])" .. TILDE .. "?([lrnmuiLRNMUI])" .. TILDE .. "?([^aAeEiIoOuUāĀēĒīĪūŪ])", "([aAeEiIoOuU])" .. TILDE .. "?([lrnmuiLRNMUI])" .. TILDE .. "?$", "([iI])" .. TILDE .. "?([eE])" .. TILDE .. "?", "A" .. TILDE, "a" .. TILDE, "E" .. TILDE, "e" .. TILDE, "I" .. TILDE, "i" .. TILDE, "U" .. TILDE, "u" .. TILDE, TILDE},
        to = {"E", "e", "A" .. TILDE, "a" .. TILDE, "E" .. TILDE, "e" .. TILDE, "I" .. TILDE, "i" .. TILDE, "O", "o", "U" .. TILDE, "u" .. TILDE, "N", "n", TILDE, "%1%2%3", "%1%2", "%1%2", "Ā", "ā", "Ē", "ē", "Ī", "ī", "Ū", "ū", ""}
    }
}

m["mg"] = {"Malagasy", 7930, "poz-bre", scripts = Latn}

m["mh"] = {"Marshallese", 36280, "poz-mic", scripts = Latn, sort_key = {from = {"ā", "ļ", "m̧", "ņ", "n̄", "o̧", "ō", "ū"}, to = {"a~", "l~", "m~", "n~", "n~~", "o~", "o~~", "u~"}}}

m["mi"] = {"Maori", 36451, "poz-pep", scripts = Latn}

m["mk"] = {"Macedonian", 9296, "zls", scripts = Cyrl, translit_module = "mk-translit", entry_name = {from = {ACUTE}, to = {}}}

m["ml"] = {"Malayalam", 36236, "dra", scripts = {"Mlym"}, translit_module = "ml-translit", override_translit = true}

m["mn"] = {
    "Mongolian",
    9246,
    "xgn",
    scripts = {"Cyrl", "Mong", "Soyo", "Zanb"}, -- entries in Soyo or Zanb might require prior discussion
    ancestors = {"cmg"},
    translit_module = "mn-translit",
    override_translit = true
}

-- "mo" IS TREATED AS "ro", SEE WT:LT

m["mr"] = {"Marathi", 1571, "inc-sou", scripts = {"Deva", "Modi"}, ancestors = {"omr"}, translit_module = "mr-translit"}

m["ms"] = {"Malay", 9237, "poz-mly", scripts = {"Latn", "ms-Arab"}}

m["mt"] = {"Maltese", 9166, "sem-arb", scripts = Latn, ancestors = {"sqr"}, sort_key = {from = {"ċ", "ġ", "ħ"}, to = {"c", "g", "h"}}}

m["my"] = {"Burmese", 9228, "tbq-brm", scripts = {"Mymr"}, ancestors = {"obr"}, translit_module = "my-translit", override_translit = true, sort_key = {from = {"ျ", "ြ", "ွ", "ှ", "ဿ"}, to = {"္ယ", "္ရ", "္ဝ", "္ဟ", "သ္သ"}}}

m["na"] = {"Nauruan", 13307, "poz-mic", scripts = Latn}

m["nb"] = {"Norwegian Bokmål", 25167, "gmq", scripts = Latn, ancestors = {"gmq-mno"}, wikimedia_codes = {"no"}}

m["nd"] = {"Northern Ndebele", 35613, "bnt-ngu", scripts = Latn, entry_name = {from = {"[āàáâǎ]", "[ēèéêě]", "[īìíîǐ]", "[ōòóôǒ]", "[ūùúûǔ]", "ḿ", "[ǹńň]", MACRON, ACUTE, GRAVE, CIRC, CARON}, to = {"a", "e", "i", "o", "u", "m", "n"}}}

m["ne"] = {"Nepali", 33823, "inc-pah", scripts = {"Deva", "Newa"}, translit_module = "ne-translit"}

m["ng"] = {"Ndonga", 33900, "bnt-ova", scripts = Latn}

m["nl"] = {"Dutch", 7411, "gmw", scripts = Latn, ancestors = {"dum"}, sort_key = {from = {"[äáâå]", "[ëéê]", "[ïíî]", "[öóô]", "[üúû]", "ç", "ñ", "^-"}, to = {"a", "e", "i", "o", "u", "c", "n"}}, standardChars = "A-Za-z0-9" .. PUNCTUATION .. u(0x2800) .. "-" .. u(0x28FF)}

m["nn"] = {"Norwegian Nynorsk", 25164, "gmq", scripts = Latn, ancestors = {"gmq-mno"}}

m["no"] = {"Norwegian", 9043, "gmq", scripts = Latn, ancestors = {"gmq-mno"}}

m["nr"] = {"Southern Ndebele", 36785, "bnt-ngu", scripts = Latn, entry_name = {from = {"[āàáâǎ]", "[ēèéêě]", "[īìíîǐ]", "[ōòóôǒ]", "[ūùúûǔ]", "ḿ", "[ǹńň]", MACRON, ACUTE, GRAVE, CIRC, CARON}, to = {"a", "e", "i", "o", "u", "m", "n"}}}

m["nv"] = {
    "Navajo",
    13310,
    "apa",
    scripts = Latn,
    sort_key = {from = {"[áą]", "[éę]", "[íį]", "[óǫ]", "ń", "^n([djlt])", "ł", "[ʼ’']", ACUTE}, to = {"a", "e", "i", "o", "n", "ni%1", "l~"}} -- the tilde is used to guarantee that ł will always be sorted after all other words with l
}

m["ny"] = {"Chichewa", 33273, "bnt-nys", scripts = Latn, entry_name = {from = {"ŵ", "Ŵ", "á", "Á", "é", "É", "í", "Í", "ó", "Ó", "ú", "Ú", "ń", "Ń", "ḿ", "Ḿ"}, to = {"w", "W", "a", "A", "e", "E", "i", "I", "o", "O", "u", "U", "n", "N", "m", "M"}}, sort_key = {from = {"ng'"}, to = {"ng"}}}

m["oc"] = {"Occitan", 14185, "roa", scripts = {"Latn", "Hebr"}, ancestors = {"pro"}, sort_key = {from = {"[àá]", "[èé]", "[íï]", "[òó]", "[úü]", "ç", "([lns])·h"}, to = {"a", "e", "i", "o", "u", "c", "%1h"}}}

m["oj"] = {"Ojibwe", 33875, "alg", scripts = {"Cans", "Latn"}, sort_key = {from = {"aa", "ʼ", "ii", "oo", "sh", "zh"}, to = {"a~", "h~", "i~", "o~", "s~", "z~"}}}

m["om"] = {"Oromo", 33864, "cus", scripts = {"Latn", "Ethi"}}

m["or"] = {"Oriya", 33810, "inc-eas", scripts = {"Orya"}, ancestors = {"inc-mor"}, translit_module = "or-translit"}

m["os"] = {"Ossetian", 33968, "xsc", scripts = {"Cyrl", "Geor", "Latn"}, ancestors = {"oos"}, translit_module = "os-translit", override_translit = true, entry_name = {from = {GRAVE, ACUTE}, to = {}}}

m["pa"] = {"Punjabi", 58635, "inc-pan", scripts = {"Guru", "pa-Arab"}, ancestors = {"inc-opa"}, translit_module = "translit-redirect", entry_name = {from = {u(0x064B), u(0x064C), u(0x064D), u(0x064E), u(0x064F), u(0x0650), u(0x0651), u(0x0652)}, to = {}}}

m["pi"] = {"Pali", 36727, "inc-mid", scripts = {"Latn", "Brah", "Deva", "Beng", "Sinh", "Mymr", "Thai", "Lana", "Laoo", "Khmr"}, ancestors = {"sa"}, translit_module = "translit-redirect", sort_key = {from = {"ā", "ī", "ū", "ḍ", "ḷ", "[ṁṃ]", "ṅ", "ñ", "ṇ", "ṭ", "([เโ])([ก-ฮ])", "([ເໂ])([ກ-ຮ])", "ᩔ", "ᩕ", "ᩖ", "ᩘ", "([ᨭ-ᨱ])ᩛ", "([ᨷ-ᨾ])ᩛ", "ᩤ", u(0xFE00), u(0x200D)}, to = {"a~", "i~", "u~", "d~", "l~", "m~", "n~", "n~~", "n~~~", "t~", "%2%1", "%2%1", "ᩈ᩠ᩈ", "᩠ᩁ", "᩠ᩃ", "ᨦ᩠", "%1᩠ᨮ", "%1᩠ᨻ", "ᩣ"}}, entry_name = {from = {u(0xFE00)}, to = {}}}

m["pl"] = {"Polish", 809, "zlw-lch", scripts = Latn, ancestors = {"zlw-opl"}, sort_key = {from = {"[Ąą]", "[Ćć]", "[Ęę]", "[Łł]", "[Ńń]", "[Óó]", "[Śś]", "[Żż]", "[Źź]"}, to = {"a" .. u(0x10FFFF), "c" .. u(0x10FFFF), "e" .. u(0x10FFFF), "l" .. u(0x10FFFF), "n" .. u(0x10FFFF), "o" .. u(0x10FFFF), "s" .. u(0x10FFFF), "z" .. u(0x10FFFF), "z" .. u(0x10FFFE)}}}

m["ps"] = {"Pashto", 58680, "ira-pat", scripts = {"ps-Arab"}, ancestors = {"ira-pat-pro"}}

m["pt"] = {"Portuguese", 5146, "roa-ibe", scripts = {"Latn", "Brai"}, ancestors = {"roa-opt"}, sort_key = {from = {"[àãáâä]", "[èẽéêë]", "[ìĩíï]", "[òóôõö]", "[üúùũ]", "ç", "ñ"}, to = {"a", "e", "i", "o", "u", "c", "n"}}}

m["qu"] = {"Quechua", 5218, "qwe", scripts = Latn}

m["rm"] = {"Romansch", 13199, "roa-rhe", scripts = Latn}

m["ro"] = {"Romanian", 7913, "roa-eas", scripts = {"Latn", "Cyrl"}, sort_key = {from = {"ă", "â", "î", "ș", "ț"}, to = {"a~", "a~~", "i~", "s~", "t~"}}}

m["ru"] = {"Russian", 7737, "zle", scripts = {"Cyrl", "Brai"}, translit_module = "ru-translit", sort_key = {from = {"ё"}, to = {"е" .. mw.ustring.char(0x10FFFF)}}, entry_name = {from = {"Ѐ", "ѐ", "Ѝ", "ѝ", GRAVE, ACUTE, DIAER}, to = {"Е", "е", "И", "и"}}, standardChars = "ЁА-яё0-9—" .. PUNCTUATION}

m["rw"] = {"Rwanda-Rundi", 3217514, "bnt-glb", scripts = Latn, entry_name = {from = {"[áāâǎā́]", "[éēêěḗ]", "[íīîǐī́]", "[óōôǒṓ]", "[úūûǔū́]"}, to = {"a", "e", "i", "o", "u"}}}

m["sa"] = {"Sanskrit", 11059, "inc-old", scripts = {"Deva", "Bali", "as-Beng", "Beng", "Bhks", "Brah", "Gran", "Gujr", "Guru", "Java", "Khar", "Khmr", "Knda", "Lana", "Laoo", "Mlym", "Modi", "Mymr", "Newa", "Orya", "Saur", "Shrd", "Sidd", "Sinh", "Taml", "Telu", "Thai", "Tibt", "Tirh"}, sort_key = {from = {"ā", "ī", "ū", "ḍ", "ḷ", "ḹ", "[ṁṃ]", "ṅ", "ñ", "ṇ", "ṛ", "ṝ", "ś", "ṣ", "ṭ", "([เโไ])([ก-ฮ])", "([ເໂໄ])([ກ-ຮ])", "ᩔ", "ᩕ", "ᩖ", "ᩘ", "([ᨭ-ᨱ])ᩛ", "([ᨷ-ᨾ])ᩛ", "ᩤ", u(0xFE00), u(0x200D)}, to = {"a~", "i~", "u~", "d~", "l~", "l~~", "m~", "n~", "n~~", "n~~~", "r~", "r~~", "s~", "s~~", "t~", "%2%1", "%2%1", "ᩈ᩠ᩈ", "᩠ᩁ", "᩠ᩃ", "ᨦ᩠", "%1᩠ᨮ", "%1᩠ᨻ", "ᩣ"}}, entry_name = {from = {u(0xFE00)}, to = {}}, translit_module = "translit-redirect"}

m["sc"] = {"Sardinian", 33976, "roa", scripts = Latn}

m["sd"] = {"Sindhi", 33997, "inc-snd", scripts = {"sd-Arab", "Deva", "Sind", "Khoj"}, entry_name = {from = {u(0x0671), u(0x064B), u(0x064C), u(0x064D), u(0x064E), u(0x064F), u(0x0650), u(0x0651), u(0x0652), u(0x0670), u(0x0640)}, to = {u(0x0627)}}, ancestors = {"inc-vra"}}

m["se"] = {"Northern Sami", 33947, "smi", scripts = Latn, entry_name = {from = {"ạ", "[ēẹ]", "ī", "[ōọ]", "ū", "ˈ"}, to = {"a", "e", "i", "o", "u"}}, sort_key = {from = {"á", "č", "đ", "ŋ", "š", "ŧ", "ž"}, to = {"a²", "c²", "d²", "n²", "s²", "t²", "z²"}}, standardChars = "A-PR-VZa-pr-vz0-9ÁáČčĐđŊŋŠšŦŧŽž" .. PUNCTUATION}

m["sg"] = {"Sango", 33954, "crp", scripts = Latn, ancestors = {"ngb"}}

m["sh"] = {"Serbo-Croatian", 9301, "zls", scripts = {"Latn", "Cyrl", "Glag"}, entry_name = {from = {"[ȀÀȂÁĀÃ]", "[ȁàȃáāã]", "[ȄÈȆÉĒẼ]", "[ȅèȇéēẽ]", "[ȈÌȊÍĪĨ]", "[ȉìȋíīĩ]", "[ȌÒȎÓŌÕ]", "[ȍòȏóōõ]", "[ȐȒŔ]", "[ȑȓŕ]", "[ȔÙȖÚŪŨ]", "[ȕùȗúūũ]", "Ѐ", "ѐ", "[ӢЍ]", "[ӣѝ]", "[Ӯ]", "[ӯ]", GRAVE, ACUTE, DGRAVE, INVBREVE, MACRON, TILDE}, to = {"A", "a", "E", "e", "I", "i", "O", "o", "R", "r", "U", "u", "Е", "е", "И", "и", "У", "у"}}, wikimedia_codes = {"sh", "bs", "hr", "sr"}}

m["si"] = {"Sinhalese", 13267, "inc-ins", scripts = {"Sinh"}, ancestors = {"elu-prk"}, translit_module = "si-translit", override_translit = true}

m["sk"] = {"Slovak", 9058, "zlw", scripts = Latn, sort_key = {from = {"[áä]", "é", "í", "[óô]", "ú", "ý", "ŕ", "ĺ", "[" .. DIAER .. ACUTE .. CIRC .. "]"}, to = {"a", "e", "i", "o", "u", "y", "r", "l", ""}}}

m["sl"] = {"Slovene", 9063, "zls", scripts = Latn, entry_name = {from = {"[ÁÀÂĀȂȀ]", "[áàâāȃȁ]", "[ÉÈÊĒȆȄỆẸ]", "[éèêēȇȅệẹə]", "[ÍÌÎĪȊȈ]", "[íìîīȋȉ]", "[ÓÒÔŌȎȌỘỌ]", "[óòôōȏȍộọ]", "[ŔȒȐ]", "[ŕȓȑ]", "[ÚÙÛŪȖȔ]", "[úùûūȗȕ]", "ł", GRAVE, ACUTE, CIRC, MACRON, DGRAVE, INVBREVE, DOTBELOW}, to = {"A", "a", "E", "e", "I", "i", "O", "o", "R", "r", "U", "u", "l"}}, sort_key = {from = {"č", "š", "ž"}, to = {"c²", "s²", "z²"}}}

m["sm"] = {"Samoan", 34011, "poz-pnp", scripts = Latn}

m["sn"] = {"Shona", 34004, "bnt-sho", scripts = Latn, entry_name = {remove_diacritics = ACUTE}}

m["so"] = {"Somali", 13275, "cus", scripts = {"Latn", "Arab", "Osma"}, entry_name = {from = {"[ÁÀÂ]", "[áàâ]", "[ÉÈÊ]", "[éèê]", "[ÍÌÎ]", "[íìî]", "[ÓÒÔ]", "[óòô]", "[ÚÙÛ]", "[úùû]", "[ÝỲ]", "[ýỳ]"}, to = {"A", "a", "E", "e", "I", "i", "O", "o", "U", "u", "Y", "y"}}}

m["sq"] = {"Albanian", 8748, "sqj", scripts = {"Latn", "Grek", "Elba"}, entry_name = {remove_diacritics = ACUTE}, sort_key = {from = {"[âãä]", "[ÂÃÄ]", "[êẽë]", "[ÊẼË]", "ĩ", "Ĩ", "õ", "Õ", "ũ", "Ũ", "ỹ", "Ỹ", "ç", "Ç"}, to = {"a", "A", "e", "E", "i", "I", "o", "O", "u", "U", "y", "Y", "c", "C"}}}

m["ss"] = {"Swazi", 34014, "bnt-ngu", scripts = Latn, entry_name = {from = {"[āàáâǎ]", "[ēèéêě]", "[īìíîǐ]", "[ōòóôǒ]", "[ūùúûǔ]", "ḿ", "[ǹńň]", MACRON, ACUTE, GRAVE, CIRC, CARON}, to = {"a", "e", "i", "o", "u", "m", "n"}}}

m["st"] = {"Sotho", 34340, "bnt-sts", scripts = Latn, entry_name = {from = {"[āàáâǎ]", "[ēèéêě]", "[īìíîǐ]", "[ōòóôǒ]", "[ūùúûǔ]", "ḿ", "[ǹńň]", MACRON, ACUTE, GRAVE, CIRC, CARON}, to = {"a", "e", "i", "o", "u", "m", "n"}}}

m["su"] = {"Sundanese", 34002, "poz-msa", scripts = {"Latn", "Sund"}, translit_module = "su-translit"}

m["sv"] = {"Swedish", 9027, "gmq", scripts = Latn, ancestors = {"gmq-osw"}}

m["sw"] = {"Swahili", 7838, "bnt-swh", scripts = LatnArab, sort_key = {from = {"ng'", "^-"}, to = {"ngz"}}}

m["ta"] = {"Tamil", 5885, "dra", scripts = {"Taml"}, ancestors = {"oty"}, translit_module = "ta-translit", override_translit = true}

m["te"] = {"Telugu", 8097, "dra", scripts = {"Telu"}, translit_module = "te-translit", override_translit = true}

m["tg"] = {
    "Tajik",
    9260,
    "ira-swi",
    scripts = {"Cyrl", "fa-Arab", "Latn"},
    ancestors = {"pal"}, -- same as "fa", see WT:T:AFA
    translit_module = "tg-translit",
    override_translit = true,
    sort_key = {from = {"Ё", "ё"}, to = {"Е", "е"}},
    entry_name = {from = {ACUTE}, to = {}}
}

m["th"] = {"Thai", 9217, "tai-swe", scripts = {"Thai", "Brai"}, translit_module = "th-translit", sort_key = {from = {"[%pๆ]", "[็-๎]", "([เแโใไ])([ก-ฮ])"}, to = {"", "", "%2%1"}}}

m["ti"] = {"Tigrinya", 34124, "sem-eth", scripts = {"Ethi"}, translit_module = "Ethi-translit"}

m["tk"] = {"Turkmen", 9267, "trk-ogz", scripts = {"Latn", "Cyrl", "Arab"}, entry_name = {from = {"ā", "ē", "ī", "ō", "ū", "ȳ", "ȫ", "ǖ", MACRON}, to = {"a", "e", "i", "o", "u", "y", "ö", "ü", ""}}, ancestors = {"trk-ogz-pro"}}

m["tl"] = {"Tagalog", 34057, "phi", scripts = {"Latn", "Tglg"}, entry_name = {from = {"[áàâ]", "[éèê]", "[íìî]", "[óòô]", "[úùû]", ACUTE, GRAVE, CIRC}, to = {"a", "e", "i", "o", "u"}}}

m["tn"] = {"Tswana", 34137, "bnt-sts", scripts = Latn}

m["to"] = {"Tongan", 34094, "poz-pol", scripts = Latn, sort_key = {from = {"ā", "ē", "ī", "ō", "ū", MACRON}, to = {"a", "e", "i", "o", "u", ""}}, entry_name = {from = {"á", "é", "í", "ó", "ú", ACUTE}, to = {"a", "e", "i", "o", "u", ""}}}

m["tr"] = {"Turkish", 256, "trk-ogz", scripts = Latn, ancestors = {"ota"}}

m["ts"] = {"Tsonga", 34327, "bnt-tsr", scripts = Latn}

m["tt"] = {"Tatar", 25285, "trk-kbu", scripts = {"Cyrl", "Latn", "tt-Arab"}, translit_module = "tt-translit", override_translit = true}

-- "tw" IS TREATED AS "ak", SEE WT:LT

m["ty"] = {"Tahitian", 34128, "poz-pep", scripts = Latn}

m["ug"] = {"Uyghur", 13263, "trk-kar", scripts = {"ug-Arab", "Latn", "Cyrl"}, ancestors = {"chg"}, translit_module = "ug-translit", override_translit = true}

m["uk"] = {"Ukrainian", 8798, "zle", scripts = Cyrl, ancestors = {"orv"}, translit_module = "uk-translit", entry_name = {from = {"Ѐ", "ѐ", "Ѝ", "ѝ", GRAVE, ACUTE}, to = {"Е", "е", "И", "и"}}, standardChars = "ЄІЇА-ЩЬЮ-щьюяєії" .. PUNCTUATION}
m["ur"] = {"Urdu", 1617, "inc-hnd", scripts = {"ur-Arab"}, ancestors = {"inc-ohi"}, entry_name = {from = {u(0x064B), u(0x064C), u(0x064D), u(0x064E), u(0x064F), u(0x0650), u(0x0651), u(0x0652), u(0x0658)}, to = {}}}

m["uz"] = {"Uzbek", 9264, "trk-kar", scripts = {"Latn", "Cyrl", "fa-Arab"}, ancestors = {"chg"}}

m["ve"] = {"Venda", 32704, "bnt-bso", scripts = Latn}

m["vi"] = {"Vietnamese", 9199, "mkh-vie", scripts = {"Latn", "Hani"}, ancestors = {"mkh-mvi"}, sort_key = "vi-sortkey"}

m["vo"] = {"Volapük", 36986, "art", scripts = Latn}

m["wa"] = {"Walloon", 34219, "roa-oil", scripts = Latn, ancestors = {"fro"}, sort_key = {from = {"[áàâäå]", "[éèêë]", "[íìîï]", "[óòôö]", "[úùûü]", "[ýỳŷÿ]", "ç", "'"}, to = {"a", "e", "i", "o", "u", "y", "c"}}}

m["wo"] = {"Wolof", 34257, "alv-fwo", scripts = LatnArab}

m["xh"] = {"Xhosa", 13218, "bnt-ngu", scripts = Latn, entry_name = {from = {"[āàáâǎ]", "[ēèéêě]", "[īìíîǐ]", "[ōòóôǒ]", "[ūùúûǔ]", "ḿ", "[ǹńň]", MACRON, ACUTE, GRAVE, CIRC, CARON}, to = {"a", "e", "i", "o", "u", "m", "n"}}}

m["yi"] = {"Yiddish", 8641, "gmw", scripts = {"Hebr"}, ancestors = {"gmh"}, sort_key = {from = {"[אַאָ]", "בּ", "[וֹוּ]", "יִ", "ײַ", "פֿ"}, to = {"א", "ב", "ו", "י", "יי", "פ"}}, translit_module = "yi-translit"}

m["yo"] = {"Yoruba", 34311, "alv-yor", scripts = Latn, sort_key = {from = {"ẹ", "ọ", "gb", "ṣ"}, to = {"e~", "o~", "g~", "s~"}}, entry_name = {remove_diacritics = ACUTE .. GRAVE .. MACRON}}

m["za"] = {"Zhuang", 13216, "tai", scripts = {"Latn", "Hani"}, sort_key = {from = {"%p"}, to = {""}}}

m["zh"] = {"Chinese", 7850, "zhx", scripts = {"Hani", "Brai", "Nshu"}, ancestors = {"ltc"}, sort_key = "zh-sortkey"}

m["zu"] = {"Zulu", 10179, "bnt-ngu", scripts = Latn, entry_name = {from = {"[āàáâǎ]", "[ēèéêě]", "[īìíîǐ]", "[ōòóôǒ]", "[ūùúûǔ]", "ḿ", "[ǹńň]", MACRON, ACUTE, GRAVE, CIRC, CARON}, to = {"a", "e", "i", "o", "u", "m", "n"}}}

return m
