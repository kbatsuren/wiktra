-- This module will transliterate Newari language text.

local export = {}

local consonants = {
	['क']='k', ['ख']='kh', ['ग']='g', ['घ']='gh', ['ङ']='ṅ',
	['च']='c', ['छ']='ch', ['ज']='j', ['झ']='jh', ['ञ']='ñ', 
	['ट']='ṭ', ['ठ']='ṭh', ['ड']='ḍ', ['ढ']='ḍh', ['ण']='ṇ', 
	['त']='t', ['थ']='th', ['द']='d', ['ध']='dh', ['न']='n', 
	['प']='p', ['फ']='ph', ['ब']='b', ['भ']='bh', ['म']='m',
	['य']='y', ['र']='r', ['ल']='l', ['व']='v', ['ळ']='ḷ',
	['श']='ś', ['ष']='ṣ', ['स']='s', ['ह']='h',
}

local diacritics = {
	['ा']='ā', ['ि']='i', ['ी']='ī', ['ु']='u', ['ू']='ū', ['ृ']='ṛ', ['ॄ']='ṝ', 
	['ॢ']='ḷ', ['ॣ']='ḹ', ['े']='e', ['ै']='ai', ['ो']='o', ['ौ']='au',  ['्']='',
}

local tt = {
	-- vowels
	['अ']='a', ['आ']='ā', ['इ']='i', ['ई']='ī', ['उ']='u', ['ऊ']='ū', ['ऋ']='ṛ', ['ॠ']='ṝ',
	['ऌ']='ḷ', ['ॡ']='ḹ', ['ए']='e', ['ऐ']='ai', ['ओ']='o', ['औ']='au', 
	-- chandrabindu    
	['ँ']='̃',
	-- anusvara    
	['ं']='̃',
	-- visarga    
	['ः']='ː',
	-- avagraha
	['ऽ']='’',
	--numerals
	['०']='0', ['१']='1', ['२']='2', ['३']='3', ['४']='4', ['५']='5', ['६']='6', ['७']='7', ['८']='8', ['९']='9',
	--punctuation        
    ['॥']='.', --double danda
	['।']='.', --danda
    --Om
    ['ॐ']='oṃ',
}

function export.tr(text, lang, sc)
	text = mw.ustring.gsub(
		text,
		'([कखगघङचछजझञटठडढणतथदधनपफबभमयरलळवशषसह])'..
		'([ािीुूृॄॢॣेैोौ्]?)',
		function(c, d)
			if d == "" then        
				return consonants[c] .. 'a'
			else
				return consonants[c] .. diacritics[d]
			end
		end)

	text = mw.ustring.gsub(text, '.', tt)
	
	return mw.ustring.toNFC(text)
end
 
return export

-- Text	Expected	Actual	Differs at
-- Passed	सर्गः	sargaː	sargaː	
-- Passed	सँक्वः	sãkvaː	sãkvaː	
-- Passed	प्याखं	pyākhã	pyākhã	
-- Passed	नवःघाँय्	navaːghā̃y	navaːghā̃y	
-- Passed	छेँ	chẽ	chẽ	
-- -- Unit tests for [[Module:new-translit]]. Refresh page to run tests.
-- local tests = require('Module:UnitTests')
-- local new_translit = require('Module:new-translit')

-- --TO DO
-- function tests:do_test_translit(sans, roman, xlit)
-- 	return self:equals('<span class="Deva" lang="new">[[' .. sans .. '#Newari|' .. sans .. ']]</span>', new_translit.tr(sans, 'new', 'Deva'), roman)
-- end

-- function tests:test_translit_newari()
-- 	local examples = {
-- 		{ 'सर्गः', 'sargaː' },
-- 		{ 'सँक्वः', 'sãkvaː' },
-- 		{ 'प्याखं', 'pyākhã' },
-- 		{ 'नवःघाँय्', 'navaːghā̃y' },
-- 		{ 'छेँ', 'chẽ' },
-- 	}
-- 	return self:iterate(examples, "do_test_translit")
-- end
 
-- return tests