-- This module will transliterate Oriya language text. Odia
-- Language code: ori
--[[
	ori – inclusive code
Individual codes:
ory – Odia
spv – Sambalpuri
bpv – Dakshni
ort – Adivasi Odia (Kotia)
dso – Desiya (duplicate of [ort])[3]
]]

local export = {}

local consonants = {
	['କ']='k', ['ଖ']='kh', ['ଗ']='g', ['ଘ']='gh', ['ଙ']='ṅ',
	['ଚ']='c', ['ଛ']='ch', ['ଜ']='j', ['ଝ']='jh', ['ଞ']='ñ', 
	['ଟ']='ṭ', ['ଠ']='ṭh', ['ଡ']='ḍ', ['ଢ']='ḍh', ['ଣ']='ṇ', 
	['ତ']='t', ['ଥ']='th', ['ଦ']='d', ['ଧ']='dh', ['ନ']='n', 
	['ପ']='p', ['ଫ']='ph', ['ବ']='b', ['ଵ']='v', ['ଭ']='bh', ['ମ']='m',
	['ଯ']='j', ['ୟ']='y', ['ର']='r', ['ଲ']='l', ['ଳ']='ḷ', ['ୱ']='w',
	['ଶ']='ś', ['ଷ']='ṣ', ['ସ']='s', ['ହ']='h',
	['ଡ଼']='ṛ', ['ଢ଼']='ṛh',
}

local diacritics = {
	['ା']='a', ['ି']='i', ['ୀ']='ī', ['ୁ']='u', ['ୂ']='ū', ['ୃ']='ru', ['ୄ']='rū', 
	['ୢ']='lu', ['ୣ']='lū', ['େ']='e', ['ୈ']='ôi', ['ୖ']='ôi', ['ୋ']='o', ['ୌ']='ôu', ['ୗ']='ôu',
	['୍']='',
}

local tt = {
	-- vowels
	['ଅ']='ô', ['ଆ']='a', ['ଇ']='i', ['ଈ']='ī', ['ଉ']='u', ['ଊ']='ū', ['ଋ']='ru', ['ୠ']='rū',
	['ଌ']='lu', ['ୡ']='lū', ['ଏ']='e', ['ଐ']='ôi', ['ଓ']='o', ['ଔ']='ôu', 
	-- chandrabindu    
	['ଁ']='m̐', --until a better method is found
	-- anusvara    
	['ଂ']='ṃ', --until a better method is found
	-- visarga    
	['ଃ	']='ḥ',
	-- avagraha
	['ଽ']='’',
	--numerals
	['୦']='0', ['୧']='1', ['୨']='2', ['୩']='3', ['୪']='4', ['୫']='5', ['୬']='6', ['୭']='7', ['୮']='8', ['୯']='9',
	['୲']='¼', ['୳']='½', ['୴']='¾', ['୵']='¹⁄₁₆', ['୶']='⅛', ['୷']='³⁄₁₆',
	--punctuation        
	['।']='.', --danda
}

function export.tr(text, lang, sc)
	text = mw.ustring.gsub(
		text,
		'([କଖଗଘଙଚଛଜଝଞଟଠଡଢଣତଥଦଧନପଫବଵଭମଯୟରଲଳୱଶଷସହ]଼?)'..
		'([ାିୀୁୂୃୄେୈୖୋୌୗ୍ୢୣ]?)',
		function(c, d)
			if d == "" then        
				return consonants[c] .. 'ô'
			else
				return consonants[c] .. diacritics[d]
			end
		end)

	text = mw.ustring.gsub(text, '.', tt)
	
	return text
end
 
return export

-- All tests passed. (refresh)

-- test_translit_oriya:
-- Text	Expected	Actual	Differs at
-- Passed	ଓଡ଼ିଆ	oṛia	oṛia	
-- Passed	ଓଡ଼ିଶା	oṛiśa	oṛiśa	
-- Passed	ଚାରି	cari	cari	
-- Passed	ଏକ	ekô	ekô	
-- Passed	ପାଞ୍ଚ	pañcô	pañcô	
-- -- Unit tests for [[Module:or-translit]]. Refresh page to run tests.
-- local tests = require('Module:UnitTests')
-- local or_translit = require('Module:or-translit')

-- --TO DO
-- function tests:do_test_translit(orya, roman, xlit)
-- 	self:equals('<span class="Orya" lang="or">[[' .. orya .. '#Oriya|' .. orya .. ']]</span>', or_translit.tr(orya, 'or', 'Orya'), roman)
-- end

-- function tests:test_translit_oriya()
-- 	self:do_test_translit('ଓଡ଼ିଆ', 'oṛia')
-- 	self:do_test_translit('ଓଡ଼ିଶା', 'oṛiśa')
-- 	self:do_test_translit('ଚାରି', 'cari')
-- 	self:do_test_translit('ଏକ', 'ekô')
-- 	self:do_test_translit('ପାଞ୍ଚ', 'pañcô')
	
-- end
 
-- return tests