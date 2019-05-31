-- This module will transliterate Malayalam language text.

local export = {}
 
local consonants = {
	['ക']='k', ['ഖ']='kh', ['ഗ']='g', ['ഘ']='gh', ['ങ']='ṅ', 
	['ച']='c', ['ഛ']='ch', ['ജ']='j', ['ഝ']='jh', ['ഞ']='ñ', 
	['ട']='ṭ', ['ഠ']='ṭh', ['ഡ']='ḍ', ['ഢ']='ḍh', ['ണ']='ṇ', 
	['ത']='t', ['ഥ']='th', ['ദ']='d', ['ധ']='dh', ['ന']='n', 
	['പ']='p', ['ഫ']='ph', ['ബ']='b', ['ഭ']='bh', ['മ']='m', 
	['യ']='y', ['ര']='r', ['ല']='l', ['വ']='v', 
	['ശ']='ś', 	['ഷ']='ṣ', ['സ']='s', ['ഹ']='h',
	['ള']='ḷ', ['ഴ']='ḻ',  ['റ']='ṟ' , ['ഩ']='ṉ' , ['ഺ']='ṯ' ,
}

local diacritics = {
	['\224\181\129\224\181\141'] = 'ŭ',
	['\224\180\190'] = 'ā' ,
	['\224\180\191'] = 'i' ,
	['\224\181\128'] = 'ī' ,
	['\224\181\129'] = 'u' ,
	['\224\181\130'] = 'ū' ,
	['\224\181\131'] = 'r̥' ,
	['\224\181\132'] = 'r̥̄' ,
	['\224\181\134'] = 'e' ,
	['\224\181\135'] = 'ē' ,
	['\224\181\136'] = 'ai',
	['\224\181\138'] = 'o' ,
	['\224\181\139'] = 'ō' ,
	['\224\181\151'] = 'au',
	['\224\181\162'] = 'l̥ ',
	['\224\181\163'] = 'l̥̄' ,
	--halant, supresses the inherent vowel "a"
	['\224\181\141'] = '',
	-- no diacritic
	[''] = 'a'
}

local nonconsonants = {
	-- vowels
	['അ']='a' , ['ആ']='ā' , ['ഇ']='i' , ['ഈ']='ī' , ['ഉ']='u' , ['ഊ']='ū' , 
	['ഋ']='r̥' , ['ൠ']='r̥̄' , ['ഌ']='l̥' , ['ൡ']='l̥̄', ['എ']='e' , ['ഏ']='ē' ,
	['ഐ']='ai' , ['ഒ']='o' , ['ഓ']='ō' , ['ഔ']='au' ,
	-- other symbols
	['ം']='ṃ', -- anusvara
	['ഃ']='ḥ' ,  -- visarga
	['ഽ']='’', -- praślēṣam
	-- chillus, consonants that never take vowels
	['ൺ']='ṇ' , ['ൻ']='n' , ['ർ']='r' , ['ൽ']='l' , ['ൾ']='ḷ' , ['ൿ']='k' ,
	-- digits
	['൦'] = '0', ['൧'] = '1', ['൨'] = '2', ['൩'] = '3', ['൪'] = '4',
	['൫'] = '5', ['൬'] = '6', ['൭'] = '7', ['൮'] = '8', ['൯']= '9',
	['൰']='10', ['൱']='100', ['൲']='1000', ['൳']='¼', ['൴']='½', ['൵']='¾',
}

-- translit any words or phrases
function export.tr(text, lang, sc)
	text = mw.ustring.gsub(
		text,
		'([കഖഗഘങചഛജഝഞടഠഡഢണതഥദധനപഫബഭമയരലവശഷസഹളഴറഩഺ])'..
		'(\224\181\129?[\224\180\190\224\180\191\224\181\128\224\181\129\224\181\130\224\181\131\224\181\132\224\181\162\224\181\163\224\181\134\224\181\135\224\181\138\224\181\139\224\181\136\224\181\151\224\181\141]?)',
		function(c, d)
			return consonants[c] .. (diacritics[d] or d)
		end)
	
	text = mw.ustring.gsub(text, '.', nonconsonants)
	
	-- anusvara
	text = mw.ustring.gsub(text, 'ṃ([kgṅ])', 'ṅ%1')
	text = mw.ustring.gsub(text, 'ṃ([cjñ])', 'ñ%1')
	text = mw.ustring.gsub(text, 'ṃ([ṭḍṇ])', 'ṇ%1')
	text = mw.ustring.gsub(text, 'ṃ([tdn])', 'n%1')
	text = mw.ustring.gsub(text, 'ṃ([pbm])', 'm%1')
	
	return text
end
 
return export


-- 1 test failed. (refresh)

-- test_translit_malayalam:
-- Text	Expected	Actual	Differs at
-- Failed	ഡിസംബര്	ḍisaṃbar	ḍisambar	5
-- Passed	രാജാവു്	rājāvŭ	rājāvŭ	
-- Passed	ഹിന്ദുമതം	hindumataṃ	hindumataṃ	
-- Passed	അവൻ	avan	avan	
-- Passed	ലളിതാഽപി	laḷitā’pi	laḷitā’pi	
-- Passed	അനുസ്വാരഃ	anusvāraḥ	anusvāraḥ	
-- Passed	ആത്മാവു്	ātmāvŭ	ātmāvŭ	
-- Passed	വിജ്ഞാനകോശം	vijñānakōśaṃ	vijñānakōśaṃ	
-- Passed	അസ്സലാമു അലൈക്കും	assalāmu alaikkuṃ	assalāmu alaikkuṃ	
-- -- Unit tests for [[Module:ml-translit]]. Refresh page to run tests.
-- local tests = require('Module:UnitTests')
-- local ml_translit = require('Module:ml-translit')

-- function tests:check_translit(Mlym, roman)
-- 	self:equals('<span class="Mlym" lang="ml">[[' .. Mlym .. '#Malayalam|' .. Mlym .. ']]</span>', ml_translit.tr(Mlym, 'ml', 'Mlym'), roman)
-- end

-- function tests:test_translit_malayalam()
-- 	self:check_translit('ഡിസംബര്', 'ḍisaṃbar')
-- 	self:check_translit('രാജാവു്', 'rājāvŭ')
-- 	self:check_translit('ഹിന്ദുമതം', 'hindumataṃ')
-- 	self:check_translit('അവൻ', 'avan')
-- 	self:check_translit('ലളിതാഽപി', 'laḷitā’pi')
-- 	self:check_translit('അനുസ്വാരഃ', 'anusvāraḥ')
-- 	self:check_translit('ആത്മാവു്',  'ātmāvŭ')
-- 	self:check_translit('വിജ്ഞാനകോശം',  'vijñānakōśaṃ')
-- 	self:check_translit('അസ്സലാമു അലൈക്കും', 'assalāmu alaikkuṃ')
-- end
 
-- return tests