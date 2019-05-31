-- This module will transliterate Persian language text per WT:FA TR.
-- Language code: pal or xmn

local export = {}

local U = mw.ustring.char

local fatHatan = U(0x64B) -- What is the Persian term for this?
local fathe = U(0x64E) -- also zabar
local zamme = U(0x64F) -- also zir
local kasre = U(0x650) -- also piš
local tashdid = U(0x651) -- also called shadda
local jazm = U(0x652)

 
local mapping = {
	["ا"] = 'â', ["ب"] = 'b', ["پ"] = 'p', ["ت"] = 't', ["ث"] = 's', ["ج"] = 'j', ["چ"] = 'č', ["ح"] = 'h', ["خ"] = 'x', 
	["د"] = 'd', ["ذ"] = 'z', ["ر"] = 'r', ["ز"] = 'z', ["ژ"] = 'ž', ["س"] = 's', ["ش"] = 'š', ["ص"] = 's', ["ض"] = 'z', 
	["ط"] = 't', ["ظ"] = 'z', ["غ"] = 'ğ', ["ف"] = 'f', ["ق"] = 'q', ["ک"] = 'k', ["گ"] = 'g', ["ل"] = 'l', 
	["م"] = 'm', ["ن"] = 'n', ["و"] = 'u', ["ه"] = 'h', ["ی"] = 'i', ["آ"] = 'â',

	-- displaying on separate lines as the viewing becomes distorted on these combinations
	["ع"] = "’",
	["ء"] = "’",
	["ئ"] = "’", 
	["ؤ"] = "’",
	["أ"] = "’",
	
	-- diacritics
	[fathe] = "a",
	[kasre] = "e",
	[zamme] = "o",
	[jazm] = "", -- also sokun - no vowel
	[U(0x200C)] = "-", -- ZWNJ (zero-width non-joiner)
	[fatHatan] = "n",
	-- ligatures
	["ﻻ"] = "lâ",
	["ﷲ"] = "llâh",
	-- kashida
	["ـ"] = "", -- kashida, no sound
	-- numerals
	["۱"] = "1", ["۲"] = "2", ["۳"] = "3", ["۴"] = "4", ["۵"] = "5",
	["۶"] = "6", ["۷"] = "7", ["۸"] = "8", ["۹"] = "9", ["۰"] = "0",
	-- normal arabic variants to numerals
	["١"] = "1", ["٢"] = "2", ["٣"] = "3", ["٤"] = "4", ["٥"] = "5",
	["٦"] = "6", ["٧"] = "7", ["٨"] = "8", ["٩"] = "9", ["٠"] = "0",
	-- punctuation (leave on separate lines)
	["؟"] = "?", -- question mark
	["،"] = ",", -- comma
	["؛"] = ";", -- semicolon
	["«"] = '“', -- quotation mark
	["»"] = '”', -- quotation mark
	["٪"] = "%", -- percent
	["؉"] = "‰", -- per mille
	["٫"] = ".", -- decimals
	["٬"] = ",", -- thousand
	["ۀ"] = "-ye" -- he ye (in ezâfe)
}
 
function export.tr(text, lang, sc)

	text = mw.ustring.gsub(text, 'ىٰ', "â")
	text = mw.ustring.gsub(text, 'ا' .. fatHatan, "an")
	-- text = mw.ustring.gsub(text, 'الله', "ﷲ")
	-- text = mw.ustring.gsub(text, 'لا', "ﻻ")
	text = mw.ustring.gsub(text, '.', mapping)
	text = mw.ustring.gsub(text, 'ou', "u")
	text = mw.ustring.gsub(text, 'aâ', "â")
	text = mw.ustring.gsub(text, 'âa', "a")
	text = mw.ustring.gsub(text, 'ei', "i")
	text = mw.ustring.gsub(text, 'ai', "ey")
	text = mw.ustring.gsub(text, 'au', "ou")
	text = mw.ustring.gsub(text, 'u([aâeiou])', "v%1")
	text = mw.ustring.gsub(text, 'i([aâeiou])', "y%1")
	text = mw.ustring.gsub(text, "([aâeiou])(" .. tashdid .. ")", "%2%1") -- swapping tašdid with vowels
	text = mw.ustring.gsub(text, "(.)" .. tashdid, "%1%1") -- implementing tašdid
	text = mw.ustring.gsub(text, 'eh$', "e")
	text = mw.ustring.gsub(text, 'eh([^aâeiouy’bdfghjklmnpqrstvyxzčğšž])', "e%1")

	return text
end
 
return export


-- 7 tests failed. (refresh)

-- test_translit_persian:
-- Text	Expected	Actual	Differs at
-- Failed	سَرانجام‎	saranjâm	sarânjâm	4
-- Failed	سَرانْجام‎	saranjâm	sarânjâm	4
-- Failed	سَرَانْجَام‎	saranjâm	sarânjâm	4
-- Passed	کُروز‎	koruz	koruz	
-- Failed	کُرُوز‎	korouz	koruz	4
-- Passed	طَنین‎	tanin	tanin	
-- Failed	طَنِین‎	taneyn	tanin	4
-- Passed	عَصاً‎	’asan	’asan	
-- Failed	خانه‎	xâne	xânh	4
-- Passed	خانِه‎	xâne	xâne	
-- Passed	کُرِۀ شُمالی‎	kore-ye šomâli	kore-ye šomâli	
-- Failed	ضَمّه‎	zamme	zammh	5
-- Passed	ضَمِّه‎	zamme	zamme	
-- Passed	وُدکا‎	vodkâ	vodkâ	
-- Passed	اَرمَنِستان‎	armanestân	armanestân	
-- Passed	باکو‎	bâku	bâku	
-- -- Unit tests for [[Module:fa-translit]]. Refresh page to run tests.
-- local tests = require('Module:UnitTests')
-- local fa_translit = require('Module:fa-translit')
-- local m_links = require('Module:links')

-- local fa = require('Module:languages').getByCode('fa')
-- local function link(term)
-- 	return m_links.full_link{term = term, lang = fa}
-- end

-- function tests:do_test_translit(Pers, roman, xlit)
-- 	self:equals(link(Pers), fa_translit.tr(Pers, 'fa', 'fa-Arab'), roman)
-- end

-- function tests:test_translit_persian()
-- 	local examples = {
-- 		{ 'سَرانجام', "saranjâm" },
-- 		{ 'سَرانْجام', "saranjâm" },
-- 		{ 'سَرَانْجَام', "saranjâm" },
-- 		{ 'کُروز', "koruz" },
-- 		{ 'کُرُوز', "korouz" },
-- 		{ 'طَنین', "tanin" },
-- 		{ 'طَنِین', "taneyn" },	
-- 		{ 'عَصاً', "’asan" },	
-- 		{ 'خانه', "xâne" },	
-- 		{ 'خانِه', "xâne" },	
-- 		{ 'کُرِۀ شُمالی', "kore-ye šomâli" },	
-- 		{ 'ضَمّه', "zamme" },
-- 		{ 'ضَمِّه', "zamme" },
-- 		{ 'وُدکا', "vodkâ" },
-- 		{ 'اَرمَنِستان', "armanestân" },
-- 		{ 'باکو', "bâku" },
-- 	}
-- 	self:iterate(examples, "do_test_translit")
-- end	

-- return tests
