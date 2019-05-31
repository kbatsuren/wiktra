-- This module will transliterate Dhivehi language text.
-- language code: div

local export = {}
local u = mw.ustring.char
 
local consonants = {
	['ހ'] = 'h', ['ށ'] = 'sh', ['ނ'] = 'n', ['ރ'] = 'r', ['ބ'] = 'b',
	['ޅ'] = 'ḷ', ['ކ'] = 'k', ['އ'] = '', ['ވ'] = 'v', ['މ'] = 'm',
	['ފ'] = 'f', ['ދ'] = 'd', ['ތ'] = 't', ['ލ'] = 'l', ['ގ'] = 'g',
	['ޏ'] = 'ñ', ['ސ'] = 's', ['ޑ'] = 'ḍ', ['ޒ'] = 'z', ['ޓ'] = 'ṭ',
	['ޔ'] = 'y', ['ޕ'] = 'p', ['ޖ'] = 'j', ['ޗ'] = 'c', ['ޱ'] = 'ṇ',
	['ޘ'] = 'ṯ', ['ޙ'] = 'ḥ', ['ޚ'] = 'x', ['ޛ'] = 'ź', ['ޜ'] = 'ž',
	['ޝ'] = 'š', ['ޞ'] = 'ş', ['ޟ'] = 'ḋ', ['ޠ'] = 'ţ', ['ޡ'] = 'ẓ',
	['ޢ'] = 'ʿ', ['ޣ'] = 'ġ', ['ޤ'] = 'q', ['ޥ'] = 'w',

}

local diacritics = {
	[u(0x07A6)] = 'a', [u(0x07A7)] = 'ā', [u(0x07A8)] = 'i', [u(0x07A9)] = 'ī', [u(0x07AA)] = 'u',
	[u(0x07AB)] = 'ū', [u(0x07AC)] = 'e', [u(0x07AD)] = 'ē', [u(0x07AE)] = 'o', [u(0x07AF)] = 'ō', [u(0x07B0)] = '',
	-- no diacritic
	[''] = 'a'
}

function export.tr(text, lang, sc)
	text = mw.ustring.gsub(
		text,
		'([ހ-ޥޱ])(['..u(0x07A6)..'-'..u(0x07B0)..']?)',
		function(c, d)
			return consonants[c] .. diacritics[d]
		end)
	return text
end
 
return export

-- Text	Expected	Actual	Differs at
-- Passed	ކަރުދާސް	karudās	karudās	
-- Passed	އޮމާމަސް	omāmas	omāmas	
-- Passed	ފޮތް	fot	fot	
-- -- Unit tests for [[Module:dv-translit]]. Refresh page to run tests.
-- local tests = require('Module:UnitTests')
-- local dv_translit = require('Module:dv-translit')

-- function tests:check_translit(Thaa, roman)
-- 	self:equals('<span class="Thaa" lang="dv">[[' .. Thaa .. '#Dhivehi|' .. Thaa .. ']]</span>', dv_translit.tr(Thaa, 'dv', 'Thaa'), roman)
-- end

-- function tests:test_translit_dhivehi()
-- 	self:iterate(
-- 		{
-- 			{ 'ކަރުދާސް', 'karudās' },
-- 			{ 'އޮމާމަސް', 'omāmas' },
-- 			{ 'ފޮތް', 'fot' },
-- 		},
-- 		"check_translit"
-- 	)
-- end
 
-- return tests