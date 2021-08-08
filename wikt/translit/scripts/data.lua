--[=[
	When adding new scripts to this file, please don't forget to add
	style definitons for the script in [[MediaWiki:Common.css]].
]=] local u = mw.ustring.char
local m = {}

m["Adlm"] = {canonicalName = "Adlam", characters = "𞤀-𞥟", direction = "rtl"}

m["Afak"] = {canonicalName = "Afaka"}

m["Aghb"] = {canonicalName = "Caucasian Albanian", characters = "𐔰-𐕣𐕯"}

m["Ahom"] = {canonicalName = "Ahom", characters = "𑜀-𑜿", systems = {"abugida"}}

m["Arab"] = {
    canonicalName = "Arabic",
    varieties = {"Jawi", {"Nastaliq", "Nastaleeq"}},
    characters = "؀-ۿݐ-ݿࢠ-ࣿﭐ-﷽ﹰ-ﻼ",
    direction = "rtl",
    systems = {"abjad"} -- more precisely, impure abjad
}

m["fa-Arab"] = {canonicalName = "Arabic", otherNames = {"Perso-Arabic"}, characters = m["Arab"].characters, direction = "rtl", parent = "Arab"}

m["kk-Arab"] = {canonicalName = "Arabic", characters = m["Arab"].characters, direction = "rtl", parent = "Arab"}

m["ks-Arab"] = {canonicalName = "Arabic", characters = m["Arab"].characters, direction = "rtl", parent = "Arab"}

m["ku-Arab"] = {canonicalName = "Arabic", characters = m["Arab"].characters, direction = "rtl", parent = "Arab"}

m["ms-Arab"] = {canonicalName = "Arabic", characters = m["Arab"].characters, direction = "rtl", parent = "Arab"}

m["mzn-Arab"] = {canonicalName = "Arabic", characters = m["Arab"].characters, direction = "rtl", parent = "Arab"}

m["ota-Arab"] = {canonicalName = "Arabic", characters = m["Arab"].characters, direction = "rtl", parent = "Arab"}

m["pa-Arab"] = {canonicalName = "Shahmukhi", otherNames = {"Arabic"}, characters = m["Arab"].characters, direction = "rtl", parent = "Arab"}

m["ps-Arab"] = {canonicalName = "Arabic", characters = m["Arab"].characters, direction = "rtl", parent = "Arab"}

m["sd-Arab"] = {canonicalName = "Arabic", characters = m["Arab"].characters, direction = "rtl", parent = "Arab"}

m["tt-Arab"] = {canonicalName = "Arabic", characters = m["Arab"].characters, direction = "rtl", parent = "Arab"}

m["ug-Arab"] = {canonicalName = "Arabic", characters = m["Arab"].characters, direction = "rtl", parent = "Arab"}

m["ur-Arab"] = {canonicalName = "Arabic", characters = m["Arab"].characters, direction = "rtl", parent = "Arab"}

-- Aran (Nastaliq) is subsumed into Arab

m["Armi"] = {canonicalName = "Imperial Aramaic", characters = "𐡀-𐡟", direction = "rtl", systems = {"abjad"}}

m["Armn"] = {canonicalName = "Armenian", characters = "Ա-֏ﬓ-ﬗ"}

m["Avst"] = {canonicalName = "Avestan", characters = "𐬀-𐬿", direction = "rtl"}

m["pal-Avst"] = {canonicalName = "Pazend", characters = m["Avst"].characters, direction = "rtl", parent = "Avst"}

m["Bali"] = {canonicalName = "Balinese", characters = "ᬀ-᭼", systems = {"abugida"}}

m["Bamu"] = {canonicalName = "Bamum", characters = "ꚠ-꛷𖠀-𖨸"}

m["Bass"] = {canonicalName = "Bassa", aliases = {"Bassa Vah", "Vah"}, characters = "𖫐-𖫵"}

m["Batk"] = {canonicalName = "Batak", characters = "ᯀ-᯿", systems = {"abugida"}}

m["Beng"] = {canonicalName = "Bengali", characters = "ঀ-ঃঅ-ঌএঐও-নপ-রললশ-হ়-ৄেৈো-ৎৗড়ঢ়য়়ৠ-ৣ০-৯", systems = {"abugida"}}

m["as-Beng"] = {canonicalName = "Assamese", otherNames = {"Bengali-Assamese", "Eastern Nagari"}, characters = "ঁ-ঃঅ-ঌএঐও-নপ-যশ-হ়-ৄেৈো-ৎৗড়ঢ়য়়ৠ-ৣ০-ৱ", systems = {"abugida"}}

m["Bhks"] = {canonicalName = "Bhaiksuki", characters = "𑰀-𑱬", systems = {"abugida"}}

m["Bopo"] = {canonicalName = "Zhuyin", aliases = {"Zhuyin Fuhao", "Bopomofo"}, characters = "ㄅ-ㄯㆠ-ㆿ"}

m["Brah"] = {canonicalName = "Brahmi", characters = "𑀀-𑁿", systems = {"abugida"}}

m["Brai"] = {canonicalName = "Braille", characters = "⠀-⣿"}

m["Bugi"] = {canonicalName = "Buginese", aliases = {"Lontara"}, characters = "ᨀ-᨟", systems = {"abugida"}}

m["Buhd"] = {canonicalName = "Buhid", characters = "ᝀ-ᝓ", systems = {"abugida"}}

m["Cakm"] = {canonicalName = "Chakma", characters = "𑄀-𑅇", systems = {"abugida"}}

m["Cans"] = {canonicalName = "Canadian syllabics", characters = "᐀-ᙿᢰ-ᣵ", systems = {"abugida"}}

m["Cari"] = {canonicalName = "Carian", characters = "𐊠-𐋐", systems = {"alphabet"}}

m["Cham"] = {canonicalName = "Cham", characters = "ꨀ-꩟", systems = {"abugida"}}

m["Chrs"] = {canonicalName = "Chorasmian", characters = "𐾰-𐿋", direction = "rtl", systems = {"abjad"}}

m["Cher"] = {canonicalName = "Cherokee", characters = "Ꭰ-ᏽꭰ-ꮿ", systems = {"syllabary"}}

m["Copt"] = {
    canonicalName = "Coptic",
    characters = "Ϣ-ϯⲀ-⳿𐋠-𐋻", -- this is mostly "Coptic", not unified "Greek and Coptic"
    systems = {"alphabet"}
}

m["Cprt"] = {canonicalName = "Cypriot", characters = "𐠀-𐠿", direction = "rtl", systems = {"syllabary"}}

m["Cyrl"] = {canonicalName = "Cyrillic", characters = "Ѐ-џѢѣѪѫѬѭѲѳѴѵҊ-ԧꚀ-ꚗ", systems = {"alphabet"}}

m["Cyrs"] = {canonicalName = "Old Cyrillic", aliases = {"Early Cyrillic"}, characters = "Ѐ-ԧꙀ-ꚗ", wikipedia_article = "Early Cyrillic alphabet", systems = {"alphabet"}}

m["Deva"] = {canonicalName = "Devanagari", characters = "ऀ-ॿ꣠-ꣿ", systems = {"abugida"}}

m["Dogr"] = {canonicalName = "Dogra", characters = "𑠀-𑠻", systems = {"abugida"}}

m["Dsrt"] = {canonicalName = "Deseret", characters = "𐐀-𐑏", systems = {"alphabet"}}

m["Dupl"] = {canonicalName = "Duployan", characters = "𛰀-𛲟"}

m["Egyd"] = {canonicalName = "Demotic", systems = {"abjad", "logography"}}

m["Egyh"] = {canonicalName = "Hieratic", systems = {"abjad", "logography"}}

m["Egyp"] = {canonicalName = "Egyptian hieroglyphic", varieties = {"Hieratic"}, characters = "𓀀-𓐮" .. u(0x13430) .. "-" .. u(0x13438), wikipedia_article = "Egyptian hieroglyphs", systems = {"abjad", "logography"}}

m["Elba"] = {canonicalName = "Elbasan", characters = "𐔀-𐔧", systems = {"alphabet"}}

m["Ethi"] = {canonicalName = "Ethiopic", aliases = {"Ge'ez"}, characters = "ሀ-᎙ⶀ-ⷞꬁ-ꬮ", systems = {"abugida"}}

m["Geok"] = {
    canonicalName = "Khutsuri",
    varieties = {"Nuskhuri", "Asomtavruli"},
    characters = "Ⴀ-Ⴭⴀ-ⴭ", -- Ⴀ-Ⴭ is Asomtavruli, ⴀ-ⴭ is Nuskhuri
    systems = {"alphabet"}
}

m["Geor"] = {
    canonicalName = "Georgian",
    varieties = {"Mkhedruli", "Mtavruli"},
    characters = "ა-ჿᲐ-Ჿ", -- ა-ჿ is lowercase Mkhedruli; Ა-Ჿ is uppercase Mkhedruli (Mtavruli)
    systems = {"alphabet"}
}

m["Glag"] = {canonicalName = "Glagolitic", characters = "Ⰰ-ⱞ𞀀-𞀪", systems = {"alphabet"}}

m["Gong"] = {canonicalName = "Gunjala Gondi", characters = "𑵠-𑶩", systems = {"abugida"}}

m["Gonm"] = {canonicalName = "Masaram Gondi", characters = "𑴀-𑵙", systems = {"abugida"}}

m["Goth"] = {canonicalName = "Gothic", characters = "𐌰-𐍊", systems = {"alphabet"}}

m["Gran"] = {canonicalName = "Grantha", characters = "𑌀-𑍴", systems = {"abugida"}}

m["Grek"] = {canonicalName = "Greek", characters = "Ͱ-ϡϰ-Ͽ", systems = {"alphabet"}}

m["polytonic"] = {canonicalName = "Greek", characters = "ἀ-῾" .. m["Grek"].characters, parent = "Grek", systems = {"alphabet"}}

m["Gujr"] = {canonicalName = "Gujarati", characters = "ઁ-૿", systems = {"abugida"}}

m["Guru"] = {canonicalName = "Gurmukhi", characters = "ਁ-੶", systems = {"abugida"}}

m["Hang"] = {
    canonicalName = "Hangul",
    aliases = {"Hangeul"},
    characters = ("가-힣" .. -- Syllables
    "ᄀ-ᇿ" .. -- Jamo
    "ꥠ-ꥼ" .. -- Jamo Ext-A
    "ힰ-ퟻ" .. -- Jamo Ext-B
    "ㄱ-ㆎ" .. -- Compat Jamo
    "ﾠ-ￜ" -- Halfwidth
    ),
    systems = {"syllabary"}
}

m["Hani"] = {
    canonicalName = "Han",
    varieties = {"Hanzi", "Kanji", "Hanja", "Chu Nom"},
    characters = ("一-鿿" .. "㐀-䶿" .. -- ExtA
    "𠀀-𮯯" .. -- SIP 
    "𰀀-𱍏" .. -- ExtG
    "﨎﨏﨑﨓﨔﨟﨡﨣﨤﨧﨨﨩" .. "⺀-⻿" .. -- Radicals Supplement
    "　-〿" .. -- CJK Symbols and Punctuation
    "𖿢𖿣𖿰𖿱" .. -- Ideographic Symbols and Punctuation
    "㇀-㇯" .. -- Strokes
    "㍻-㍿㋿" -- 組文字
    ),
    systems = {"logography"}
}

m["Hans"] = {canonicalName = "Simplified Han", characters = m["Hani"].characters, systems = {"logography"}}

m["Hant"] = {canonicalName = "Traditional Han", characters = m["Hani"].characters, systems = {"logography"}}

m["Hatr"] = {canonicalName = "Hatran", characters = "𐣠-𐣿", direction = "rtl", systems = {"abjad"}}

m["Hira"] = {canonicalName = "Hiragana", varieties = {"Hentaigana"}, characters = "ぁ-ゟ𛀁-𛄞𛅐𛅑𛅒🈀", systems = {"syllabary"}}

m["Hluw"] = {canonicalName = "Anatolian Hieroglyphs", characters = "𔐀-𔙆", wikipedia_article = "Anatolian hieroglyphs"}

m["Hung"] = {canonicalName = "Old Hungarian", aliases = {"Hungarian runic"}, characters = "𐲀-𐲲", direction = "rtl"}

m["Kana"] = {canonicalName = "Katakana", characters = "゠-ヿㇰ-ㇿ㌀-㍗ｦ-ﾟ𛀀𛅤𛅥𛅦𛅧", systems = {"syllabary"}}

-- These should be defined after the scripts they are composed of

m["Kore"] = {canonicalName = "Korean", characters = m["Hang"].characters .. m["Hani"].characters, systems = {"syllabary", "logography"}}

m["Hano"] = {canonicalName = "Hanunoo", characters = "ᜠ-᜴", systems = {"abugida"}}

m["Hebr"] = {
    canonicalName = "Hebrew",
    characters = u(0x0590) .. "-" .. u(0x05FF) .. u(0xFB1D) .. "-" .. u(0xFB4F),
    direction = "rtl",
    systems = {"abjad"} -- more precisely, impure abjad
}

m["Hmng"] = {canonicalName = "Hmong", aliases = {"Pahawh Hmong"}, characters = "𖬀-𖮏"}

m["Ibrn"] = {canonicalName = "Iberian"}

m["Imag"] = {
    -- To be used to avoid any formatting or link processing
    canonicalName = "Image-rendered",
    -- This should not have any characters listed
    character_category = false
}

m["Inds"] = {canonicalName = "Indus", aliases = {"Harappan", "Indus Valley"}}

m["IPAchar"] = {canonicalName = "International Phonetic Alphabet", aliases = {"IPA"}}

m["Ital"] = {canonicalName = "Old Italic", characters = "𐌀-𐌯", systems = {"alphabet"}}

m["Java"] = {canonicalName = "Javanese", characters = "ꦀ-꧟", systems = {"abugida"}}

m["Jurc"] = {canonicalName = "Jurchen"}

m["Kali"] = {canonicalName = "Kayah Li", characters = "꤀-꤯", systems = {"abugida"}}

m["Khar"] = {canonicalName = "Kharoshthi", characters = "𐨀-𐩘", systems = {"abugida"}, direction = "rtl"}

m["Khmr"] = {canonicalName = "Khmer", characters = "ក-៹᧠-᧿", systems = {"abugida"}}

m["Khoj"] = {canonicalName = "Khojki", characters = "𑈀-𑈾", systems = {"abugida"}}

m["Kitl"] = {canonicalName = "Khitan Large", systems = {"logography", "syllabary"}}

m["Kits"] = {canonicalName = "Khitan Small", characters = "𘬀-𘳕" .. u(0x16FE4), systems = {"logography", "syllabary"}}

m["Knda"] = {canonicalName = "Kannada", characters = "ಀ-ೲ", systems = {"abugida"}}

m["Kthi"] = {canonicalName = "Kaithi", characters = "𑂀-𑃍", systems = {"abugida"}}

m["Lana"] = {canonicalName = "Tai Tham", aliases = {"Tham", "Tua Mueang", "Lanna"}, characters = "ᨠ-᪭", systems = {"abugida"}}

m["Laoo"] = {canonicalName = "Lao", characters = "ກ-ໟ", systems = {"abugida"}}

m["Latn"] = {canonicalName = "Latin", aliases = {"Roman"}, varieties = {"Rumi", "Romaji", "Rōmaji", "Romaja"}, characters = "A-Za-zÀ-ÖØ-öø-ɏḀ-ỿ", systems = {"alphabet"}}

m["Latf"] = {
    canonicalName = "Fraktur",
    otherNames = {"Blackletter"}, -- Blackletter is actually the parent "script"
    characters = m["Latn"].characters
}

m["Latinx"] = {canonicalName = "Latin", characters = m["Latn"].characters .. "Ⱡ-Ɀ꜠-ꟿꬰ-ꭥ", parent = "Latn"}

m["pjt-Latn"] = {canonicalName = "Latin", characters = m["Latn"].characters, parent = "Latn"}

m["Jpan"] = {canonicalName = "Japanese", characters = m["Hira"].characters .. m["Kana"].characters .. m["Hani"].characters .. m["Latn"].characters, systems = {"syllabary", "logography"}}

m["Leke"] = {canonicalName = "Leke", systems = {"abugida"}}

m["Lepc"] = {canonicalName = "Lepcha", characters = "ᰀ-ᱏ", systems = {"abugida"}}

m["Limb"] = {canonicalName = "Limbu", characters = "ᤀ-᥏", systems = {"abugida"}}

m["Lina"] = {canonicalName = "Linear A", characters = "𐘀-𐝧"}

m["Linb"] = {canonicalName = "Linear B", characters = "𐀀-𐃺"}

m["Lisu"] = {canonicalName = "Lisu", aliases = {"Fraser"}, characters = "ꓐ-꓿𑾰", systems = {"alphabet"}}

m["Lyci"] = {canonicalName = "Lycian", characters = "𐊀-𐊜", systems = {"alphabet"}}

m["Lydi"] = {canonicalName = "Lydian", characters = "𐤠-𐤿", direction = "rtl", systems = {"alphabet"}}

m["Mahj"] = {canonicalName = "Mahajani", characters = "𑅐-𑅶", systems = {"abugida"}}

m["Maka"] = {canonicalName = "Lontara", characters = "𑻠-𑻸", systems = {"abugida"}}

m["Mand"] = {canonicalName = "Mandaic", aliases = {"Mandaean"}, characters = "ࡀ-࡞", direction = "rtl"}

m["Mani"] = {canonicalName = "Manichaean", characters = "𐫀-𐫶", direction = "rtl", systems = {"abjad"}}

m["Maya"] = {canonicalName = "Maya", aliases = {"Maya hieroglyphic", "Mayan", "Mayan hieroglyphic"}, characters = "𝋠-𝋳"}

m["Medf"] = {canonicalName = "Medefaidrin", aliases = {"Oberi Okaime", "Oberi Ɔkaimɛ"}, characters = "𖹀-𖺚"}

m["Mend"] = {canonicalName = "Mende", aliases = {"Mende Kikakui"}, characters = "𞠀-𞣖", direction = "rtl"}

m["Merc"] = {canonicalName = "Meroitic cursive", characters = "𐦠-𐦿", direction = "rtl", systems = {"abugida"}}

m["Mero"] = {canonicalName = "Meroitic hieroglyphic", characters = "𐦀-𐦟", direction = "rtl", systems = {"abugida"}}

m["Mlym"] = {canonicalName = "Malayalam", characters = "ഀ-ൿ", systems = {"abugida"}}

m["Modi"] = {canonicalName = "Modi", characters = "𑘀-𑙙", systems = {"abugida"}}

m["Mong"] = {canonicalName = "Mongolian", aliases = {"Uyghurjin"}, characters = "᠀-ᢪ𑙠-𑙬", direction = "down"}

m["Morse"] = {canonicalName = "Morse code"}

m["Mroo"] = {canonicalName = "Mro", characters = "𖩀-𖩯"}

m["Mtei"] = {canonicalName = "Meitei Mayek", characters = "ꯀ-꯹ꫠ-꫶", systems = {"abugida"}}

m["Mult"] = {canonicalName = "Multani", characters = "𑊀-𑊩", systems = {"abugida"}}

m["musical"] = {canonicalName = "Musical notation", characters = "𝄀-𝇨", systems = {"pictography"}}

m["Mymr"] = {canonicalName = "Burmese", aliases = {"Myanmar"}, characters = "က-႟ꩠ-ꩿꧠ-ꧾ", systems = {"abugida"}}

m["Narb"] = {canonicalName = "Old North Arabian", characters = "𐪀-𐪟", direction = "rtl", systems = {"abjad"}}

m["Nbat"] = {canonicalName = "Nabataean", aliases = {"Nabatean"}, characters = "𐢀-𐢯", direction = "rtl", systems = {"abjad"}}

m["Newa"] = {
    canonicalName = "Newa",
    aliases = {"Newar", "Newari", "Prachalit Nepal"}, -- and Ranjana?
    characters = "𑐀-𑑡",
    systems = {"abugida"}
}

m["Nkoo"] = {canonicalName = "N'Ko", characters = "߀-߿", direction = "rtl", systems = {"alphabet"}}

m["None"] = {
    canonicalName = "Unspecified", -- renders as 'unspecified script'
    -- This should not have any characters listed
    character_category = false -- none
}

m["Nshu"] = {canonicalName = "Nushu", aliases = {"Nüshu"}, characters = "𖿡𛅰-𛋻", systems = {"syllabary"}}

m["Ogam"] = {canonicalName = "Ogham", characters = " -᚜"}

m["Olck"] = {canonicalName = "Ol Chiki", characters = "᱐-᱿"}

m["Orkh"] = {canonicalName = "Orkhon runes", characters = "𐰀-𐱈", direction = "rtl"}

m["Orya"] = {canonicalName = "Oriya", aliases = {"Odia"}, characters = "ଁ-୷"}

m["Osge"] = {canonicalName = "Osage", characters = "𐒰-𐓻"}

m["Osma"] = {canonicalName = "Osmanya", characters = "𐒀-𐒩"}

m["Palm"] = {canonicalName = "Palmyrene", characters = "𐡠-𐡿", direction = "rtl"}

m["Pauc"] = {canonicalName = "Pau Cin Hau", characters = "𑫀-𑫸"}

m["Perm"] = {canonicalName = "Old Permic", characters = "𐍐-𐍺"}

m["Phag"] = {canonicalName = "Phags-pa", characters = "ꡀ-꡷", direction = "down", systems = {"abugida"}}

m["Marc"] = {canonicalName = "Marchen", characters = "𑱰-𑲶", systems = {"abugida"}}

m["Phli"] = {canonicalName = "Inscriptional Pahlavi", characters = "𐭠-𐭿", direction = "rtl", systems = {"abjad"}}

m["Phlp"] = {canonicalName = "Psalter Pahlavi", characters = "𐮀-𐮯", direction = "rtl", systems = {"abjad"}}

m["Phlv"] = {
    canonicalName = "Book Pahlavi",
    direction = "rtl",
    systems = {"abjad"}
    -- Not in Unicode
}

m["Phnx"] = {canonicalName = "Phoenician", characters = "𐤀-𐤟", direction = "rtl", systems = {"abjad"}}

m["Plrd"] = {canonicalName = "Pollard", characters = "𖼀-𖾟", systems = {"abugida"}}

m["Prti"] = {canonicalName = "Inscriptional Parthian", characters = "𐭀-𐭟", direction = "rtl"}

m["Rjng"] = {canonicalName = "Rejang", characters = "ꤰ-꥟", systems = {"abugida"}}

m["Rohg"] = {canonicalName = "Hanifi Rohingya", characters = "𐴀-𐴹", direction = "rtl", systems = {"alphabet"}}

m["Ruminumerals"] = {canonicalName = "Rumi numerals", characters = "𐹠-𐹾", character_category = "Rumi numerals"}

m["Runr"] = {canonicalName = "Runic", characters = "ᚠ-ᛰ", systems = {"alphabet"}}

m["Samr"] = {canonicalName = "Samaritan", characters = "ࠀ-࠾", direction = "rtl", systems = {"abjad"}}

m["Sarb"] = {canonicalName = "Old South Arabian", characters = "𐩠-𐩿", direction = "rtl", systems = {"abjad"}}

m["Saur"] = {canonicalName = "Saurashtra", characters = "ꢀ-꣙", systems = {"abugida"}}

m["Semap"] = {canonicalName = "flag semaphore", systems = {"pictography"}}

m["Sgnw"] = {canonicalName = "SignWriting", characters = "𝠀-𝪯", systems = {"pictography"}}

m["Shaw"] = {canonicalName = "Shavian", characters = "𐑐-𐑿"}

m["Shrd"] = {canonicalName = "Sharada", characters = "𑆀-𑇙", systems = {"abugida"}}

m["Sidd"] = {canonicalName = "Siddham", characters = "𑖀-𑗝", systems = {"abugida"}}

m["Sind"] = {canonicalName = "Khudawadi", characters = "𑊰-𑋹", systems = {"abugida"}}

m["Sinh"] = {canonicalName = "Sinhalese", characters = "ං-෴", systems = {"abugida"}}

m["Sogd"] = {canonicalName = "Sogdian", characters = "𐼰-𐽙", direction = "rtl", systems = {"abjad"}}

m["Sogo"] = {canonicalName = "Old Sogdian", characters = "𐼀-𐼧", direction = "rtl", systems = {"abjad"}}

m["Sora"] = {canonicalName = "Sorang Sompeng", aliases = {"Sora Sompeng"}, characters = "𑃐-𑃹"}

m["Soyo"] = {canonicalName = "Soyombo", characters = "𑩐-𑪢", systems = {"abugida"}}

m["Sund"] = {canonicalName = "Sundanese", characters = "ᮀ-ᮿ", systems = {"abugida"}}

m["Sylo"] = {canonicalName = "Syloti Nagri", aliases = {"Sylheti Nagari"}, characters = "ꠀ-꠫", systems = {"abugida"}}

m["Syrc"] = {
    canonicalName = "Syriac",
    characters = "܀-ݏ" .. u(0x0860) .. "-" .. u(0x086A),
    direction = "rtl",
    systems = {"abjad"} -- more precisely, impure abjad
}

-- Syre, Syrj, Syrn are apparently subsumed into Syrc; discuss if this causes issues

m["Tagb"] = {canonicalName = "Tagbanwa", characters = "ᝠ-ᝳ", systems = {"abugida"}}

m["Takr"] = {canonicalName = "Takri", characters = "𑚀-𑛉", systems = {"abugida"}}

m["Tale"] = {canonicalName = "Tai Nüa", aliases = {"Tai Nuea", "New Tai Nüa", "New Tai Nuea", "Dehong Dai", "Tai Dehong", "Tai Le"}, characters = "ᥐ-ᥴ", systems = {"abugida"}}

m["Talu"] = {canonicalName = "New Tai Lue", characters = "ᦀ-᧟", systems = {"abugida"}}

m["Taml"] = {canonicalName = "Tamil", characters = "ஂ-௺𑿀-𑿿", systems = {"abugida"}}

m["Tang"] = {canonicalName = "Tangut", characters = "𖿠𗀀-𘫿𘴀-𘴈", systems = {"logography", "syllabary"}}

m["Tavt"] = {canonicalName = "Tai Viet", characters = "ꪀ-꫟", systems = {"abugida"}}

m["Telu"] = {canonicalName = "Telugu", characters = "ఀ-౿", systems = {"abugida"}}

m["Teng"] = {canonicalName = "Tengwar"}

m["Tfng"] = {
    canonicalName = "Tifinagh",
    otherNames = {"Libyco-Berber", "Berber"}, -- per Wikipedia, Libyco-Berber is the parent
    characters = "ⴰ-⵿",
    systems = {"abjad", "alphabet"}
}

m["Tglg"] = {canonicalName = "Baybayin", aliases = {"Tagalog"}, characters = "ᜀ-᜔", systems = {"abugida"}}

m["Thaa"] = {canonicalName = "Thaana", characters = "ހ-ޱ", systems = {"abugida"}, direction = "rtl"}

m["Thai"] = {canonicalName = "Thai", characters = "ก-๛", systems = {"abugida"}}

m["Tibt"] = {canonicalName = "Tibetan", characters = "ༀ-࿚", systems = {"abugida"}}

m["Tirh"] = {canonicalName = "Tirhuta", characters = "𑒀-𑓙", systems = {"abugida"}}

m["xzh-Tibt"] = {canonicalName = "Zhang-Zhung", systems = {"abugida"}}

m["Ugar"] = {canonicalName = "Ugaritic", characters = "𐎀-𐎟", systems = {"abjad"}}

m["Vaii"] = {canonicalName = "Vai", characters = "ꔀ-ꘫ", systems = {"syllabary"}}

m["Wara"] = {canonicalName = "Varang Kshiti", characters = "𑢠-𑣿"}

m["Xpeo"] = {canonicalName = "Old Persian", characters = "𐎠-𐏕"}

m["Xsux"] = {canonicalName = "Cuneiform", aliases = {"Sumero-Akkadian Cuneiform"}, characters = "𒀀-𒎙𒐀-𒑳"}

m["Yiii"] = {canonicalName = "Yi", characters = "ꀀ-꓆", systems = {"syllabary"}}

m["Zanb"] = {canonicalName = "Zanabazar Square", characters = u(0x11A00) .. "-" .. u(0x11A47)}

m["Zmth"] = {
    canonicalName = "mathematical notation",
    characters = "ℵ∀-⋿⟀-⟯⦀-⫿𝐀-𝟿",
    character_category = "Mathematical notation symbols" -- ?
}

m["Zsym"] = {
    canonicalName = "symbol",
    characters = "─-➿←-⇿⌀-⏿⬀-⯾🀀-🃵🌀-🩭",
    character_category = false, -- none
    systems = {"pictography"}
}

m["Zyyy"] = {
    canonicalName = "undetermined",
    -- This should not have any characters listed, probably
    character_category = false, -- none
    characters = m["Latn"].characters
}

m["Zzzz"] = {
    canonicalName = "uncoded",
    -- This should not have any characters listed
    character_category = false -- none
}

return m
