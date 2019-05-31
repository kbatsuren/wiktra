-- This module will transliterate Tamil language text.
-- Language code: tam

local export = {}
 
local consonants = {
	['க']='k' , ['ங']='ṅ' , ['ச']='c' , ['ஞ']='ñ' , ['ட']='ṭ' , ['ண']='ṇ' , ['த']='t' ,
	['ந']='n' , ['ப']='p', ['ம']='m' , ['ய']='y' , ['ர']='r' , ['ல']='l' , ['வ']='v' ,
	['ழ']='ḻ' , ['ள']='ḷ' , ['ற']='ṟ' , ['ன']='ṉ' , ['ஶ']='ś' , ['ஜ']='j' , ['ஷ']='ṣ' , 
	['ஸ']='s' , ['ஹ']='h' , ['ஃப']='f' , ['ஃஜ']='z' , ['ஃஸ']='x' ,
	['ஃ']='ḥ' ,
}

local diacritics = {
	['ா']= 'ā' , ['ி']='i' , ['ீ']='ī' , ['ு']='u' , ['ூ']='ū' ,  ['ெ']='e' ,
	['ே']='ē' , ['ை']='ai' , ['ொ']='o' , ['ோ']='ō' , ['ௌ']='au'  ,
	['்']='',	--halant, supresses the inherent vowel "a"
	-- no diacritic
	[''] = 'a'
}

local nonconsonants = {
	-- vowels
	['அ']='a' , ['ஆ']='ā' , ['இ']='i' , ['ஈ']='ī' , ['உ']='u' , ['ஊ']='ū' , 
	['எ']='e' , ['ஏ']='ē' , ['ஐ']='ai' , ['ஒ']='o' , ['ஓ']='ō' , ['ஔ']='au' , 
	-- other symbols
--	['ஃ']='' ,
}

-- translit any words or phrases
function export.tr(text, lang, sc)
	text = mw.ustring.gsub(
		text,
		'(ஃ?)([கஙசஞடணதநபமயரலவழளறனஶஜஷஸஹ])'..
		'([ாிீுூெேைொோௌ்]?)',
		function(h, c, d)
			return (consonants[h..c] or consonants[h] .. (consonants[c] or c)) .. diacritics[d]
		end)
	
	text = mw.ustring.gsub(text, '.', nonconsonants)
	
	return text
end
 
return export

-- All tests passed. (refresh)

-- test_translit_tamil:
-- Text	Expected	Actual	Differs at
-- Passed	அஃகம்	aḥkam	aḥkam	
-- Passed	கஞ்சாவை	kañcāvai	kañcāvai	
-- Passed	இடியாப்பம்	iṭiyāppam	iṭiyāppam	
-- Passed	காடைக்கண்ணி	kāṭaikkaṇṇi	kāṭaikkaṇṇi	
-- Passed	ரெஃஸ்	rex	rex	
-- Passed	அசிஃப்	acif	acif	
-- Passed	ஔவை	auvai	auvai	
-- -- Unit tests for [[Module:ta-translit]]. Refresh page to run tests.
-- local tests = require('Module:UnitTests')
-- local ta_translit = require('Module:ta-translit')

-- function tests:check_translit(Taml, roman)
-- 	self:equals('<span class="Taml" lang="ta">[[' .. Taml .. '#Tamil|' .. Taml .. ']]</span>', ta_translit.tr(Taml, 'ta', 'Taml'), roman)
-- end

-- function tests:test_translit_tamil()
-- 	self:check_translit('அஃகம்', 'aḥkam')
-- 	self:check_translit('கஞ்சாவை', 'kañcāvai')
-- 	self:check_translit('இடியாப்பம்', 'iṭiyāppam')
-- 	self:check_translit('காடைக்கண்ணி', 'kāṭaikkaṇṇi')
-- 	self:check_translit("ரெஃஸ்","rex")
-- 	self:check_translit("அசிஃப்","acif")
-- 	self:check_translit("ஔவை", "auvai")
	
-- end
 
-- return tests