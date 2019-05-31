-- Transliteration for Assamese
-- This module will transliterate Assamese language text per WT:AS TR.

local export = {}
local gsub = mw.ustring.gsub
local match = mw.ustring.match

local conv = {
	-- consonants
	["ক্ষ"] = "kh",
	["ক"] = "k",	["খ"] = "kh",	["গ"] = "g",	["ঘ"] = "gh",	["ঙ"] = "ṅ",
	["চ"] = "s",	["ছ"] = "s",	["জ"] = "z",	["ঝ"] = "zh",	["ঞ"] = "ñ",
	["ট"] = "t",	["ঠ"] = "th",	["ড"] = "d",	["ঢ"] = "dh",	["ণ"] = "n",
	["ত"] = "t",	["থ"] = "th",	["দ"] = "d",	["ধ"] = "dh",	["ন"] = "n",
	["প"] = "p",	["ফ"] = "ph",	["ব"] = "b",	["ভ"] = "bh",	["ম"] = "m",
	["য"] = "z",	["ৰ"] = "r",	["ল"] = "l",	["ৱ"] = "w", 
	["শ"] = "x",	["ষ"] = "x",	["স"] = "x",	["হ"] = "h",	
	["য়"] = "y",	["ড়"] = "r",	["ঢ়"] = "rh",

	-- vowel diacritics
	["’"] = "ó",	["ি"] = "i",	["ু"] = "u",	
	["ৃ"] = "ri",	["ে"] = "e",	["ে’"] = "é",	["ো"] = "ü",
	["া"] = "a",	["ী"] = "i",	["ূ"] = "u",	["ৈ"] = "oi",	["ৌ"] = "ou",

	-- visarga
	["ঃ"] = "o",

	-- vowel signs
	["অ"] = "o", 	["অ’"] = "ó",	["ই"] = "i",	["উ"] = "u",	
	["ঋ"] = "ri",	["এ"] = "e", 	["এ’"] = "é",	["ও"] = "ü",
	["আ"] = "a",	["ঈ"] = "i",	["ঊ"] = "u",	["ঐ"] = "oi",	["ঔ"] = "ou",

	--hosonto
	["্"] = "",

	-- sondrobindu
	["ঁ"] = "̃",
		
	-- onusor
	["ং"] = "ṅ",

	-- hosonto to, 
	["ৎ"] = "t",

	-- numerals
	["০"] = "0", ["১"] = "1", ["২"] = "2", ["৩"] = "3", ["৪"] = "4", 
	["৫"] = "5", ["৬"] = "6", ["৭"] = "7", ["৮"] = "8", ["৯"] = "9",
 
	-- punctuation
	["।"] = ".", -- dari
}

local conv2 = {
	["ক্ষ"] = "ḱ",	["খ"] = "ḱ",
	["ঘ"] = "ǵ",
	["ঙ"] = "ŋ",	["ং"] = "ŋ",
	["ঝ"] = "ź",
	["ঠ"] = "ṫ",	["থ"] = "ṫ",
	["ঢ"] = "ḋ",	["ধ"] = "ḋ",
	["ফ"] = "ṗ",
	["ভ"] = "ḃ",
	["ঢ়"] = "ŕ",
	["ৃ"] = "ṙ",	["ঋ"] = "ṙ",
	["ৈ"] = "ʏ",	["ঐ"] = "ʏ",
	["ৌ"] = "ɵ",	["ঔ"] = "ɵ",
}

local consonant, vowel, vowel_sign = "ক-হড়-য়ৰৱ", "oা-ৌ’", "অ-ঔ"
local c = "[" .. consonant .. "]"
local cc = "়?" .. c
local v = "[" .. vowel .. vowel_sign .. "]"
local syncope_pattern = "(" .. v .. cc .. v .. cc .. ")o(" .. cc .. "ঁ?" .. v .. ")"

local function rev_string(text)
	local result, length = "", mw.ustring.len(text)
	for i = 1, length do
		result = result .. mw.ustring.sub(text, length - i + 1, length - i + 1)
	end
	return result
end

function export.tr(text, lang, sc, mode)
	text = gsub(text, "([^ৰ])্য", "%1্য়")
	text = gsub(text, "্ব", "্ৱ")
	text = gsub(text, "[শষস]্", "চ্")
	text = gsub(text, "্স", "্চ")
	text = gsub(text, "[োও]ৱ", "্ও") 
	text = gsub(text, "ক্ষ", "খ")
	text = gsub(text, "’ৱ", "্অ’")
	text = gsub(text, "[ুুউ]ৱ(.)", "্উ%1")
	text = gsub(text, "[োও]ৱ(.)", "্ও%1")
	text = gsub(text, "োঁৱ(.)", "্ওঁ%1")
	text = gsub(text, "[ৌঔ]ৱ", "্ঔ")
	text = gsub(text, "[িই]য়(.)", "্ই%1") 
	text = gsub(text, "ৃয়", "্ঋ")
	text = gsub(text, "[েএ]য়(.)", "্এ%1")
	text = gsub(text, "[ে’এ’]য়", "্এ’")
	text = gsub(text, "[ৈঐ]য়(.)", "্ঐ%1")
	text = gsub(text, "[ীঈ]য়(.)", "্ঈ%1") 
	text = gsub(text, "[ীঈ]য়", "্ঈঅ") -- end
	text = gsub(text, "[ূূঊ]ৱ", "্ঊ") 
	text = gsub(text, "݁", "্অ")
	text = gsub(text, "ঃ", "্অ")
	text = gsub(text, "[࣪ܿ]", "্")
	text = gsub(text, "বাৰ" , "্বাৰ")
	text = gsub(text, "বিলাক", "্বিলাক")
	text = gsub(text, "টো" , "্টো")
	text = gsub(text, "খন" , "্খন")
	text = gsub(text, "ডাল" , "্ডাল")
	text = gsub(text, "খিনি" , "্খিনি")
	text = gsub(text, "জন" , "্জন")
	text = gsub(text, "জনী" , "্জনী")
	text = gsub(text, "গৰাকী" , "্গৰাকী")
	text = gsub(text, "সকল" , "্সকল")
	text = gsub(text, "কৈ" , "্কৈ")
	text = gsub(text, "ফাল" , "্ফাল")
	text = gsub(text, "কেই" , "্কেই")
	text = gsub(text, "[িীইঈ]ঞ", "্ইঅ͂")
	text = gsub(text, "ঞ্", "ন্̃")
	
	text = gsub(text, "(" .. c .. "়?)([" .. vowel .. "’?্]?)", function(a, b)
		return a .. (b == "" and "o" or b) end)
	
	for word in mw.ustring.gmatch(text, "[ঁ-৽o’]+") do
		local orig_word = word
		word = rev_string(word)
		word = gsub(word, "^o(়?" .. c .. ")(ঁ?" .. v .. ")", "%1%2")
		while match(word, syncope_pattern) do
			word = gsub(word, syncope_pattern, "%1%2")
		end
		text = gsub(text, orig_word, rev_string(word))
	end
	
	if mode == "IPA" then
		text = gsub(text, ".[়’]?", conv2)
		text = gsub(text, ".", conv2)
	end
	
	text = gsub(text, ".[়’]?", conv)
	text = gsub(text, ".", conv)
	
	local consonants_Latn_no_h = "[b-df-gj-np-tv-z]"

	-- Cw
	text = gsub(text, "mw", "mb") -- special case
	text = gsub(text, "^(" .. consonants_Latn_no_h .. "h?)w", "%1") -- initial
	text = gsub(text, "hw", "hb")
	text = gsub(text, "(" .. consonants_Latn_no_h .. ")w", "%1%1") -- medial
	
	-- zñ
	text = gsub(text, "^zñ", "gy") -- initial
	text = gsub(text, "zñ", "gg") -- medial
	
	-- Cy
	text = gsub(text, "^khy", "kh" )
	text = gsub(text, "([aéeióoüu])(" .. consonants_Latn_no_h .. ")y", "%1i%2%2")

	-- final "b" has inherent vowel
	text = gsub(text, "b$", "bo")
	text = gsub(text, "b ", "bo ")
	
	-- final r conjuncts
	text = gsub(text, "r([kszt])o$", "r%1")
	text = gsub(text, "r([kszt])o ", "r%1 ")
	text = gsub(text, "rkho$", "rkh")
	text = gsub(text, "rkho ", "rkh ")
	
	if match(text, "[ঁ-৽]") and mode ~= "debug" then
		return nil
	else
		return mw.ustring.toNFC(text)
	end
end
 
return export

-- 6 tests failed. (refresh)

-- test_translit_assamese:
-- Text	Expected	Actual	Differs at
-- Passed	স্ত্ৰী	stri	stri	
-- Passed	জিভা	zibha	zibha	
-- Passed	হাঁওফাঁও	hãüphãü	hãüphãü	
-- Passed	মেকুৰী	mekuri	mekuri	
-- Passed	চৰকাৰী	sorkari	sorkari	
-- Passed	হ’ল	hól	hól	
-- Passed	ফুল	phul	phul	
-- Passed	পুষ্প	puspo	puspo	
-- Passed	ঘাঁহ	ghãh	ghãh	
-- Failed	তৃণ	trino	trin	5
-- Passed	উদ্ভিদ	udbhid	udbhid	
-- Passed	গছ	gos	gos	
-- Passed	স্বাধীন	sadhin	sadhin	
-- Passed	পুস্তক	pustok	pustok	
-- Passed	মস্তিষ্ক	mostisko	mostisko	
-- Passed	শূন্য	xuinno	xuinno	
-- Passed	ব্যাঘ্ৰ	byaghro	byaghro	
-- Passed	ব্যৱহাৰ	byowohar	byowohar	
-- Passed	ছয়	soy	soy	
-- Passed	ক্ষেত্ৰ	khetro	khetro	
-- Passed	কে’ক	kék	kék	
-- Passed	স্পৰ্শ	sporxo	sporxo	
-- Passed	স্বাদকলি	sadkoli	sadkoli	
-- Passed	শ্ৰদ্ধা	sroddha	sroddha	
-- Failed	আশ্চৰ্য	assorzo	assorz	7
-- Passed	ইচ্ছা	issa	issa	
-- Passed	শ্বাস	sax	sax	
-- Passed	ৰং	roṅ	roṅ	
-- Passed	অৰ্থাৎ	orthat	orthat	
-- Passed	লোৱা	lüa	lüa	
-- Passed	ৰিক্সা	riksa	riksa	
-- Passed	দিয়া	dia	dia	
-- Passed	অসমীয়া	oxomia	oxomia	
-- Passed	ভাৰতীয়	bharotio	bharotio	
-- Passed	বানপানী	banpani	banpani	
-- Passed	কাৰখানা	karkhana	karkhana	
-- Passed	মানুহজন	manuhzon	manuhzon	
-- Failed	মানচিত্ৰ	mansitro	manositro	4
-- Passed	গণতন্ত্ৰ	gonotontro	gonotontro	
-- Passed	ডাঙৰীয়া	daṅoria	daṅoria	
-- Passed	জ্বলন	zolon	zolon	
-- Passed	জ্বলা	zola	zola	
-- Passed	জ্বলাই	zolai	zolai	
-- Passed	যাব কৰিব	zabo koribo	zabo koribo	
-- Passed	ফুলক	phulok	phulok	
-- Passed	চিগাৰেটক	sigaretok	sigaretok	
-- Passed	ৰাষ্ট্ৰীয়	rastrio	rastrio	
-- Passed	নিউয়ৰ্ক	niuyork	niuyork	
-- Passed	শৰ্কৰা	xorkora	xorkora	
-- Passed	আমবিলাক	ambilak	ambilak	
-- Passed	শ্বাস	sax	sax	
-- Passed	উজ্বল	uzzol	uzzol	
-- Passed	ঘনত্ব	ghonotto	ghonotto	
-- Passed	ম্ব	mbo	mbo	
-- Passed	ধন্যবাদ	dhoinnobad	dhoinnobad	
-- Passed	ধ্বংস	dhoṅxo	dhoṅxo	
-- Passed	ঈশ্বৰ	issor	issor	
-- Passed	আহ্বান	ahban	ahban	
-- Failed	খ্যাত	khyato	khat	3
-- Failed	চ্যুত	suto	syut	2
-- Failed	জ্যোতি	züti	zyüti	2
-- Passed	ধ্যান	dhyan	dhyan	
-- Passed	ক্ষুদ্ৰ	khudro	khudro	
-- Passed	বাক্য	baikko	baikko	
-- Passed	বিজ্ঞান	biggan	biggan	
-- -- Unit tests for [[Module:as-translit]]. Refresh page to run tests.
-- local tests = require('Module:UnitTests')
-- local as_translit = require('Module:as-translit')

-- local function link(word)
-- 	return '<span class="Beng" lang="as">[[' .. word .. '#Assamese|' .. word .. ']]</span>'
-- end

-- function tests:do_test_translit(beng, roman, xlit)
-- 	return self:equals(link(beng), as_translit.tr(beng, 'as', 'Beng', 'debug'), roman)
-- end

-- function tests:test_translit_assamese()
-- 	local examples = {
-- 		{ 'স্ত্ৰী', 'stri' },		
-- 		{ 'জিভা', 'zibha' },
-- 		{ 'হাঁওফাঁও', 'hãüphãü' },
-- 		{ 'মেকুৰী', 'mekuri' },
-- 		{ 'চৰকাৰী', 'sorkari' },
-- 		{ 'হ’ল', 'hól' },
-- 		{ 'ফুল', 'phul' },
-- 		{ 'পুষ্প', 'puspo' },
-- 		{ 'ঘাঁহ', 'ghãh' },
-- 		{ 'তৃণ', 'trino' },
-- 		{ 'উদ্ভিদ', 'udbhid' },
-- 		{ 'গছ', 'gos' },
-- 		{ 'স্বাধীন', 'sadhin' },
-- 		{ 'পুস্তক', 'pustok' },
-- 		{ 'মস্তিষ্ক', 'mostisko' },
-- 		{ 'শূন্য', 'xuinno' },
-- 		{ 'ব্যাঘ্ৰ', 'byaghro' },
-- 		{ 'ব্যৱহাৰ', 'byowohar' },
-- 		{ 'ছয়', 'soy' },
-- 		{ 'ক্ষেত্ৰ', 'khetro' },
-- 		{ 'কে’ক', 'kék' },
-- 		{ 'স্পৰ্শ', 'sporxo' },
-- 		{ 'স্বাদকলি', 'sadkoli' },
-- 		{ 'শ্ৰদ্ধা', 'sroddha' },
-- 		{ 'আশ্চৰ্য', 'assorzo' },
-- 		{ 'ইচ্ছা', 'issa' },
-- 		{ 'শ্বাস', 'sax' },
-- 		{ 'ৰং', 'roṅ' },
-- 		{ 'অৰ্থাৎ', 'orthat' },
-- 		{ 'লোৱা', 'lüa' },
-- 		{ 'ৰিক্সা', 'riksa' },
-- 		{ 'দিয়া', 'dia' },
-- 		{ 'অসমীয়া', 'oxomia' },
-- 		{ 'ভাৰতীয়', 'bharotio' },
-- 		{ 'বানপানী', 'banpani' },
-- 		{ 'কাৰখানা', 'karkhana' },
-- 		{ 'মানুহজন', 'manuhzon' },
-- 		{ 'মানচিত্ৰ', 'mansitro' }, 
-- 		{ 'গণতন্ত্ৰ', 'gonotontro' },
-- 		{ 'ডাঙৰীয়া' , 'daṅoria' },
-- 		{ 'জ্বলন' , 'zolon' },
-- 		{ 'জ্বলা' , 'zola' },
-- 		{ 'জ্বলাই' , 'zolai' },
-- 		{ 'যাব কৰিব', 'zabo koribo' },
-- 		{ 'ফুলক', 'phulok' },
-- 		{ 'চিগাৰেটক', 'sigaretok' },
-- 		{ 'ৰাষ্ট্ৰীয়', 'rastrio' },
-- 		{ 'নিউয়ৰ্ক', 'niuyork' },
-- 		{ 'শৰ্কৰা', 'xorkora' },
-- 		{ 'আমবিলাক', 'ambilak' },
		
-- 		-- behaviour of Cw
-- 		{ 'শ্বাস', 'sax' },
-- 		{ 'উজ্বল', 'uzzol' },
-- 		{ 'ঘনত্ব', 'ghonotto' },
-- 		{ 'ম্ব', 'mbo' },
-- 		{ 'ধন্যবাদ', 'dhoinnobad' },
-- 		{ 'ধ্বংস', 'dhoṅxo' },
-- 		{ 'ঈশ্বৰ', 'issor' },
-- 		{ 'আহ্বান', 'ahban' },
-- 		{ 'খ্যাত', 'khyato' },
-- 		{ 'চ্যুত', 'suto' },
-- 		{ 'জ্যোতি', 'züti' },
-- 		{ 'ধ্যান', 'dhyan' },
-- 		{ 'ক্ষুদ্ৰ', 'khudro' },
-- 		{ 'বাক্য', 'baikko' },
-- 		{ 'বিজ্ঞান', 'biggan' },
-- 	}
-- 	return self:iterate(examples, "do_test_translit")
-- end
 
-- return tests
