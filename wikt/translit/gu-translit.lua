-- This module will transliterate Gujarati language(gu) text. It is also used to transliterate Kachchi (kfr).
-- Language code: guj, kfr

local export = {}

local gsub = mw.ustring.gsub
local match = mw.ustring.match

local conv = {
	-- consonants
	['ક'] = 'k', ['ખ'] = 'kh', ['ગ'] = 'g', ['ઘ'] = 'gh', ['ઙ'] = 'ṅ',
	['ચ'] = 'c', ['છ'] = 'ch', ['જ'] = 'j', ['ઝ'] = 'jh', ['ઞ'] = 'ñ', 
	['ટ'] = 'ṭ', ['ઠ'] = 'ṭh', ['ડ'] = 'ḍ', ['ઢ'] = 'ḍh', ['ણ'] = 'ṇ', 
	['ત'] = 't', ['થ'] = 'th', ['દ'] = 'd', ['ધ'] = 'dh', ['ન'] = 'n', 
	['પ'] = 'p', ['ફ'] = 'ph', ['બ'] = 'b', ['ભ'] = 'bh', ['મ'] = 'm',
	['ય'] = 'y', ['ર'] = 'r', ['લ'] = 'l', ['વ'] = 'v', ['ળ'] = 'ḷ',
	['શ'] = 'ś', ['ષ'] = 'ṣ', ['સ'] = 's', ['હ'] = 'h',
	['ત઼'] = 't̰', ['જ઼'] = 'z', ['ંઘ઼'] = 'ng', ['ડ઼'] = 'ṛ', ['ઢ઼'] = 'ṛh', ['ન઼'] = 'ṉ', ['ફ઼'] = 'f',

	--vowel diacritics
	['ા'] = 'ā', ['િ'] = 'i', ['ી'] = 'ī', ['ુ'] = 'u', ['ૂ'] = 'ū', ['ૃ'] = 'ru', ['ૄ'] = 'ṝ', 
	['ે'] = 'e', ['ૈ'] = 'ai', ['ો'] = 'o', ['ૌ'] = 'au', ['ૅ'] = 'ɛ', ['ૉ'] = 'ɔ',

	-- vowel mātras
	['અ'] = 'a', ['આ'] = 'ā', ['ઇ'] = 'i', ['ઈ'] = 'ī', ['ઉ'] = 'u', ['ઊ'] = 'ū', ['ઋ'] = 'ru', ['ૠ'] = 'ṝ',
	['એ'] = 'e', ['ઐ'] = 'ai', ['ઓ'] = 'o', ['ઔ'] = 'au', ['ઍ'] = 'ɛ', ['ઑ'] = 'ɔ',

	-- chandrabindu    
	['ઁ'] = 'm̐', --until a better method is found

	-- anusvara    
	['ં'] = 'ṃ', --until a better method is found

	-- visarga
	['ઃ'] = 'ḥ',

	-- virama
	['્'] = '', 

	-- avagraha
	['ઽ'] = '’',

	--numerals
	['૦'] = '0', ['૧'] = '1', ['૨'] = '2', ['૩'] = '3', ['૪'] = '4', ['૫'] = '5', ['૬'] = '6', ['૭'] = '7', ['૮'] = '8', ['૯'] = '9',

	--punctuation        
	['।'] = '.', --danda
	['+'] = '', -- compound separator
	
	--om
	['ૐ'] = 'OM',
}

local nasal_assim = {
	["[kg]h?"] = "ṅ",
	["[cj]h?"] = "ñ",
	["[ṭḍ]h?"] = "ṇ",
	["[td]h?"] = "n",
	["[pb]h?"] = "m",
	["n"] = "n",
	["m"] = "m",
}

function export.tr(text, lang, sc)
	local c = '([કખગઘઙચછજઝઞટઠડઢતથદધપફબભશષસયરલવહણનમ]઼?)'
	local no_drop = 'ય'
	local final_no_drop = 'યરલવહનમ'
	local v = '([a્ાિીુૂેૈોૌૃૄૅૉ]ઁ?)'
	local virama = '(્)'
	local n = '(ં?)'
	local nukta = '([તજઘડઢનફ]઼)'
	
	local can_drop = gsub(c,"["..no_drop.."]","")
	local final_can_drop = gsub(c,"["..final_no_drop.."]","")
	local no_virama = gsub(v,virama,"")
	
	text = text .. " "
	
	--text = gsub(text,"(%S)"..c.."%2","%1ː%2")
	
	text = gsub(text,c,"%1a")
	text = gsub(text,"a"..v,"%1")
	text = gsub(text,no_virama..n..can_drop.."a ","%1%2%3 ") --ending
	text = gsub(text,virama..n..final_can_drop.."a ","%1%2%3 ") --ending
	local pattern = no_virama..n..can_drop.."a"..c..no_virama
	while match(text,"(.*)"..pattern) do
		text = gsub(text,"(.*)"..pattern,"%1%2%3%4%5%6")
	end
	
	text = gsub(text,nukta,conv)
	text = gsub(text,".",conv)
	
	for key,val in pairs(nasal_assim) do
		text = gsub(text,"([aeiou])ṃ("..key..")", "%1"..val.."%2")
	end
	
	text = gsub(text,"([aiueēoāīū])ṃ", "%1̃")
	
	text = gsub(text,"ː(.)","%1%1")
	
	text = gsub(text," $","")
	
	text = gsub(text,"ā̃tar","āntar")
	
	text = gsub(text,"OM","oṃ")
	
	return mw.ustring.toNFC(text)
end

return export

-- 9 tests failed. (refresh)

-- test_translit_gujarati:
-- Text	Expected	Actual	Differs at
-- Failed	રુગ્ણાલય	rugṇālay	rugṇālya	7
-- Failed	અતિવલય	ativalay	ativalya	7
-- Passed	ક્ષમા	kṣamā	kṣamā	
-- Passed	ગોળો	goḷo	goḷo	
-- Passed	ગુજરાતી	gujrātī	gujrātī	
-- Passed	બત્તી	battī	battī	
-- Passed	ઉંદર	undar	undar	
-- Passed	એરું	erũ	erũ	
-- Passed	હ્યત઼્	hyat̰	hyat̰	
-- Passed	સંપત્તિ	sampatti	sampatti	
-- Passed	જિંદગી	jindgī	jindgī	
-- Passed	સંન્યાસી	sannyāsī	sannyāsī	
-- Passed	પૂછવું	pūchvũ	pūchvũ	
-- Passed	છોકરું	chokrũ	chokrũ	
-- Passed	ઊંચાં	ū̃cā̃	ū̃cā̃	
-- Passed	ખડબચડું	khaḍbacḍũ	khaḍbacḍũ	
-- Passed	સમજાવવું	samjāvvũ	samjāvvũ	
-- Passed	વાંકું	vā̃kũ	vā̃kũ	
-- Passed	બળજબરી	baḷjabrī	baḷjabrī	
-- Passed	વર્તવું	vartavũ	vartavũ	
-- Passed	એંસી	ẽsī	ẽsī	
-- Passed	ઇચ્છવું	icchavũ	icchavũ	
-- Passed	વિદુગ્ધધુ	vidugdhadhu	vidugdhadhu	
-- Passed	આંતર	āntar	āntar	
-- Failed	અતિઘણું	atighaṇũ	atighṇũ	6
-- Failed	ઉદાહરણ	udāharaṇ	udāhraṇ	5
-- Failed	અતિશયોક્તિ	atiśayokti	atiśyokti	5
-- Failed	કેળવણી	keḷavṇī	keḷvaṇī	4
-- Failed	ચકચકિત	cakcakit	cakackit	4
-- Failed	દસ્તાવેજીકરણ	dastāvejīkaraṇ	dastāvejīkraṇ	11
-- Failed	જાળવવું	jālavvũ	jāḷvavũ	3
-- Passed	ગઈ	gaī	gaī	
-- -- Unit tests for [[Module:gu-translit]]. Refresh page to run tests.
-- local tests = require('Module:UnitTests')
-- local transliterate = require('Module:gu-translit').tr

-- --TO DO
-- function tests:do_test_translit(gujr, roman, xlit)
-- 	self:equals('<span class="Gujr" lang="gu">[[' .. gujr .. '#Gujarati|' .. gujr .. ']]</span>', transliterate(gujr, 'gu', 'Gujr'), roman)
-- end

-- function tests:test_translit_gujarati()
-- 	local examples = {
-- 		{ 'રુગ્ણાલય', 'rugṇālay' },
-- 		{ 'અતિવલય', 'ativalay' },	
-- 		{ 'ક્ષમા', 'kṣamā' },
-- 		{ 'ગોળો', 'goḷo' },
-- 		{ 'ગુજરાતી', 'gujrātī' },
-- 		{ 'બત્તી', 'battī' },
-- 		{ 'ઉંદર', 'undar' },
-- 		{ 'એરું', 'erũ' },
-- 		{ 'હ્યત઼્', 'hyat̰' },
-- 		{ 'સંપત્તિ', 'sampatti' },
-- 		{ 'જિંદગી', 'jindgī' },
-- 		{ 'સંન્યાસી', 'sannyāsī' },
-- 		{ 'પૂછવું', 'pūchvũ' },
-- 		{ 'છોકરું', 'chokrũ' },
-- 		{ 'ઊંચાં', 'ū̃cā̃' },
-- 		{ 'ખડબચડું', 'khaḍbacḍũ' },
-- 		{ 'સમજાવવું', 'samjāvvũ' },
-- 		{ 'વાંકું', 'vā̃kũ' },
-- 		{ 'બળજબરી', 'baḷjabrī' },
-- 		{ 'વર્તવું', 'vartavũ' },
-- 		{ 'એંસી', 'ẽsī' },
-- 		{ 'ઇચ્છવું', 'icchavũ' },
-- 		{ 'વિદુગ્ધધુ', 'vidugdhadhu' },
-- 		{ 'આંતર', 'āntar' },
-- 		{ 'અતિઘણું', 'atighaṇũ' },
-- 		{ 'ઉદાહરણ', 'udāharaṇ' },
-- 		{ 'અતિશયોક્તિ', 'atiśayokti' },
-- 		{ 'કેળવણી', 'keḷavṇī' },
-- 		{ 'ચકચકિત', 'cakcakit' },
-- 		{ 'દસ્તાવેજીકરણ', 'dastāvejīkaraṇ' },
-- 		{ 'જાળવવું', 'jālavvũ' },
-- 		{'ગઈ', 'gaī'},
-- 	}
-- 	self:iterate(examples, 'do_test_translit')
-- end
 
-- return tests