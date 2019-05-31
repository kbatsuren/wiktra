-- Transliteration for Bengali
-- This module will transliterate Bengali language text per WT:BN TR.
-- Language code: ben

local export = {}
local gsub = mw.ustring.gsub
local match = mw.ustring.match
 
local conv = {
	-- consonants
	['ক্ষ'] = 'kkh', ['জ্ঞ'] = 'gg',
	['ক'] = 'k',	['খ'] = 'kh',	['গ'] = 'g',	['ঘ'] = 'gh',	['ঙ'] = 'ṅ',
	['চ'] = 'c',	['ছ'] = 'ch',	['জ'] = 'j',	['ঝ'] = 'jh',	['ঞ'] = 'ñ',
	['ট'] = 'ṭ',	['ঠ'] = 'ṭh',	['ড'] = 'ḍ',	['ঢ'] = 'ḍh',	['ণ'] = 'ṇ',
	['ত'] = 't',	['থ'] = 'th',	['দ'] = 'd',	['ধ'] = 'dh',	['ন'] = 'n',
	['প'] = 'p',	['ফ'] = 'ph',	['ব'] = 'b',	['ভ'] = 'bh',	['ম'] = 'm',
	['য'] = 'j',	['র'] = 'r',	['ল'] = 'l',	['ৱ'] = 'w', 
	['শ'] = 'ś',	['ষ'] = 'ṣ',	['স'] = 's',	['হ'] = 'h',	
	['য়'] = 'y',	['ড়'] = 'ṛ',	['ঢ়'] = 'ṛh',

	-- visarga
	['ঃ'] = 'ḥ',

	-- vowel diacritics
	['ি'] = 'i',	['ু'] = 'u',	['ৃ'] = 'ri',	['ে'] = 'e',	['ো'] = 'o',
	['া'] = 'a',	['ী'] = 'i',	['ূ'] = 'u',	['ৈ'] = 'oi',	['ৌ'] = 'ou',

	-- vowel signs
	['অ'] = 'ô',	['ই'] = 'i',	['উ'] = 'u',	['ঋ'] = 'ri',	['এ'] = 'e',	['ও'] = 'o',
	['আ'] = 'a',	['ঈ'] = 'i',	['ঊ'] = 'u',	['ঐ'] = 'oi',	['ঔ'] = 'ou',

	--hôshôntô
	['্'] = '',

	-- chôndrôbindu
	['ঁ'] = 'ṁ',
		
	-- ônusbar
	['ং'] = 'N',

	-- khôndô tô
	['ৎ'] = 't',

	-- numerals
	['০'] = '0', ['১'] = '1', ['২'] = '2', ['৩'] = '3', ['৪'] = '4', ['৫'] = '5', ['৬'] = '6', ['৭'] = '7', ['৮'] = '8', ['৯'] = '9',
 
	-- punctuation
	['।'] = '.', -- dari
}

function export.tr(text, lang, sc)
	local c = '([কষজঞকখগঘঙচছজঝঞটঠডঢণতথদধনপফবভমযরলৱশষসহ]়?)'
	local y = 'য়'
	local r = 'র'
	local v = '([ô্িুৃেোাীূৈৌঅইউঋএওআঈঊঐঔ])'
	local virama = '্'
	local n = '(ং?)'
	
	local no_virama = mw.ustring.gsub(v,virama,"")
	
	text = text .. " "
	
	text = mw.ustring.gsub(text,c,"%1ô")
	text = mw.ustring.gsub(text,"ô"..v,"%1")
	
	text = mw.ustring.gsub(text,v..n..c.."ô ",function(j,k,l) --ending
		return l==y and j..k..l.."ô " or j..k..l.." "
	end)
	
	local pattern = v..n..c.."ô"..c .. no_virama
	local continue = true
	while continue do
		continue = false
		text = mw.ustring.gsub(text,"(.*)"..pattern,function(d,e,f,g,h,i)
			if g~=y and g~=r then
				continue = true
			end
			return (g==y or g==r) and d..e..f..g.."ô"..h..i or d..e..f..g..h..i
		end)
	end
	
	text = mw.ustring.gsub(text,"([যডঢ]়)",conv)
	text = mw.ustring.gsub(text,"ক্ষ","kkh")
	text = mw.ustring.gsub(text,"জ্ঞ","gg")
	text = mw.ustring.gsub(text,".",conv)
	
	text = mw.ustring.gsub(text,"ː(.)","%1%1")
	
	text = mw.ustring.gsub(text," ?।",".")
	
	text = mw.ustring.gsub(text,"([āēeo]y)ô ","%1 ")
	text = gsub(text,"ôN ","ông ")
	text = gsub(text,"N","ng")

	text = mw.ustring.gsub(text,"([ts])b","%1")
	
	text = mw.ustring.gsub(text," $","")
	
	return mw.ustring.toNFC(text)
end
 
return export

-- 14 tests failed. (refresh)

-- test_translit_bengali:
-- Text	Expected	Actual	Differs at
-- Passed	ত্বক	tôk	tôk	
-- Passed	স্বামী	sami	sami	
-- Failed	জই	jôi	ji	2
-- Failed	মানচিত্র	mancitrô	mancitr	8
-- Failed	সূত্র	sutrô	sutr	5
-- Failed	মই	mai	mi	2
-- Failed	কারখানা	karkhana	karôkhana	4
-- Passed	দুঃখিত	duḥkhit	duḥkhit	
-- Passed	লেবানন	lebanôn	lebanôn	
-- Failed	যন্ত্রমানব	yôntrômanôb	jôntrômanôb	1
-- Passed	প্রতিবেশী	prôtibeśi	prôtibeśi	
-- Passed	রচনা	rôcna	rôcna	
-- Passed	অঙ্গুষ্ঠানা	ôṅguṣṭhana	ôṅguṣṭhana	
-- Passed	পানি	pani	pani	
-- Passed	আগুন	agun	agun	
-- Passed	পশ্চিমবাংলা	pôścimbangla	pôścimbangla	
-- Passed	বাংলা	bangla	bangla	
-- Passed	সর্বনাম	sôrbnam	sôrbnam	
-- Passed	ইতিহাস	itihas	itihas	
-- Failed	আর্য় ভাষা নির্গত - দশম এবং	aryô bhaṣa nirgôt - dôśôm ebôṁ	aryô bhaṣa nirgôt - dôśôm ebông	30
-- Failed	শুভ	śubhô	śubh	5
-- Failed	শুদ্ধ	śuddhô	śuddh	6
-- Passed	জল	jôl	jôl	
-- Failed	তদ্ভব	tôdbhôbo	tôdbhôb	8
-- Failed	তৎসম	tôtsômo	tôtsôm	7
-- Passed	পশ্চিম	pôścim	pôścim	
-- Passed	লিফ্ট	liphṭ	liphṭ	
-- Failed	পছন্দ	pôcchôndô	pôchônd	4
-- Failed	গাল	galô	gal	4
-- Failed	জন্মদিন	jônmôdin	jônmdin	5
-- -- Unit tests for [[Module:bn-translit]]. Refresh page to run tests.
-- local tests = require('Module:UnitTests')
-- local bn_translit = require('Module:bn-translit')

-- local function link(word)
-- 	word = string.gsub(word, "%+", "")
-- 	return '<span class="Beng" lang="bn">[[' .. word .. '#Bengali|' .. word .. ']]</span>'
-- end

-- function tests:do_test_translit(beng, roman, xlit)
-- 	self:equals(link(beng), bn_translit.tr(beng, 'bn', 'Beng'), roman)
-- end

-- function tests:test_translit_bengali()
-- 	local examples = {
-- 		--silent b
-- 		{ 'ত্বক', 'tôk' },
-- 		{ 'স্বামী', 'sami' },
	
-- 		{ 'জই', 'jôi' },
-- 		{ 'মানচিত্র', 'mancitrô' },
-- 		{ 'সূত্র', 'sutrô' },
-- 		{ 'মই', 'mai' },
-- 		{ 'কারখানা', 'karkhana' },
-- 		{ 'দুঃখিত', 'duḥkhit' },
-- 		{ 'লেবানন', 'lebanôn' },
-- 		{ 'যন্ত্রমানব', 'yôntrômanôb' },
-- 		{ 'প্রতিবেশী', 'prôtibeśi' },
-- 	    { 'রচনা', 'rôcna' },
-- 		{ 'অঙ্গুষ্ঠানা', 'ôṅguṣṭhana' },
-- 		{ 'পানি', 'pani' },
-- 		{ 'আগুন', 'agun' },
-- 		{ 'পশ্চিমবাংলা', 'pôścimbangla' },
-- 		{ 'বাংলা', 'bangla' },
-- 	    { 'সর্বনাম', 'sôrbnam' },
-- 	    { 'ইতিহাস', 'itihas' },
-- 	    { 'আর্য় ভাষা নির্গত - দশম এবং', 'aryô bhaṣa nirgôt - dôśôm ebôṁ' },
-- 	    { 'শুভ', 'śubhô' },
-- 	    { 'শুদ্ধ', 'śuddhô' },
-- 	    { 'জল', 'jôl' },
-- 	    { 'তদ্ভব', 'tôdbhôbo' },
-- 	    { 'তৎসম', 'tôtsômo' },
-- 	    { 'পশ্চিম', 'pôścim' },
-- 	    { 'লিফ্ট', 'liphṭ' },
-- 	    { 'পছন্দ', 'pôcchôndô' },
-- 	    { 'গাল', 'galô' },
-- 	    { 'জন্মদিন', 'jônmôdin' },
-- 	}
-- 	self:iterate(examples, "do_test_translit")
-- end
 
-- return tests