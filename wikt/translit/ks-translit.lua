-- This module will transliterate Kashmiri language text.
-- Language code: kas

local export = {}

local consonants = {
	['क']='k', ['ख']='kh', ['ग']='g', ['ङ']='ṅ',
	['च']='c', ['छ']='ch', ['ज']='j', ['ञ']='ñ', 
	['ट']='ṭ', ['ठ']='ṭh', ['ड']='ḍ', ['ण']='ṇ', 
	['त']='t', ['थ']='th', ['द']='d', ['न']='n', 
	['प']='p', ['फ']='ph', ['ब']='b', ['म']='m',
	['य']='y', ['र']='r', ['ल']='l', ['व']='w',
	['श']='ś', ['ष']='ṣ', ['स']='s', ['ह']='h',
    ['च़']='ts', ['छ़']='tsh', ['ज़']='z',
}

local diacritics = {
	['ा']='ā', ['ॅ']='ə', ['ॉ']='ə̄', ['ॖ']='ü', ['ॗ']='ǖ', ['ि']='i', ['ी']='ī', ['ु']='u', ['ू']='ū', ['ृ']='ṛ',
	['ॆ']='e', ['े']='ē', ['ै']='ai', ['ॊ']='o', ['ो']='ō', ['ॏ']='ô', ['ौ']='au', ['्']='', 
}

local tt = {
	-- vowels
	['अ']='a', ['आ']='ā', ['ॲ']='ə', ['ऑ']='ə̄', ['ॶ']='ü', ['ॷ']='ǖ', ['इ']='i', ['ई']='ī', ['उ']='u', ['ऊ']='ū', ['ऋ']='ṛ',
	['ऎ']='e', ['ए']='ē', ['ऐ']='ai', ['ऒ']='o', ['ओ']='ō', ['ॵ']='ô', ['औ']='au', 
	-- chandrabindu    
	['ँ']='m̐', --until a better method is found
	-- anusvara    
	['ं']='ṃ', --until a better method is found
	-- visarga    
	['ः']='ḥ',
	-- avagraha
	['ऽ']='’',
	--numerals
	['०']='0', ['१']='1', ['२']='2', ['३']='3', ['४']='4', ['५']='5', ['६']='6', ['७']='7', ['८']='8', ['९']='9',
	--punctuation        
	['।']='.', --danda
}

function export.tr(text, lang, sc)
	text = mw.ustring.gsub(
		text,
		'([कखगघङचछजझञटठडढणतथदधनपफबभमयरलळवशषसह]़?)'.. --tbd later
		'([ािीुूृॄॢॣेैोौ्ॆॉॊौॏ]?)',
		function(c, d)
			if d == "" then        
				return consonants[c] .. 'a'
			else
				return consonants[c] .. diacritics[d]
			end
		end)

	text = mw.ustring.gsub(text, '.', tt)
	
	return text
end
 
return export

-- 2 tests failed. (refresh)

-- test_translit_ks:
-- Text	Expected	Actual	Differs at
-- Passed	च़	tsa	tsa	
-- Failed	कॉशुर	koshur	kə̄śura	2
-- Failed	जहाज़	jahāz	jahāza	6
-- Passed	बादाम्	bādām	bādām	
-- -- Unit tests for [[Module:ks-translit]]. Refresh page to run tests.
-- local tests = require('Module:UnitTests')
-- local ks_translit = require('Module:ks-translit')

-- function tests:do_test_translit(deva, roman, xlit)
-- 	self:equals('<span class="Deva" lang="ks">[[' .. mw.ustring.gsub(deva, "%+", "") .. '#Kashmiri|' .. mw.ustring.gsub(deva, "%+", "") .. ']]</span>', ks_translit.tr(deva, 'ks', 'Deva'), roman)
-- end

-- function tests:test_translit_ks()	
-- 	self:do_test_translit('च़','tsa')
-- 	self:do_test_translit('कॉशुर','koshur')
-- 	self:do_test_translit('जहाज़','jahāz')
-- 	self:do_test_translit('बादाम्','bādām')
-- end
 
-- return tests