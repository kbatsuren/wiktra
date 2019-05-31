-- This module will transliterate Manchu language text.

local export = {}

local conv = {
	["ᠠ"] = "a",
	["ᡝ"] = "e",
	["ᡳ"] = "i",
	["ᡟ"] = "y",
	["ᠣ"] = "o",
	["ᡠ"] = "u",
	["ᡡ"] = "ū",
	["ᠨ"] = "n",
	["ᠩ"] = "ng",
	["ᡴ"] = "k",
	["ᡤ"] = "g",
	["ᡥ"] = "h",
	["ᠪ"] = "b",
	["ᡦ"] = "p",
	["ᠰ"] = "s",
	["ᡧ"] = "š",
	["ᡨ"] = "t",
	["ᡩ"] = "d",
	["ᠯ"] = "l",
	["ᠮ"] = "m",
	["ᠴ"] = "c",
	["ᠵ"] = "j",
	["ᠶ"] = "y",
	["ᡵ"] = "r",
	["ᡶ"] = "f",
	["ᠸ"] = "w",
	["ᠺ"] = "k'",
	["ᡬ"] = "g'",
	["ᡭ"] = "h'",
	["ᡮ"] = "ts'",
	["ᡮᡟ"] = "ts",
	["ᡯ"] = "dz",
	["ᡰ"] = "ž",
	["ᠰᡟ"] = "sy",
	["ᡱ"] = "c'",
	["ᡱᡳ"] = "c'y",
	["ᡷ"] = "j",
	["ᡷᡳ"] = "jy",
	["᠎"] = "-",
	["᠈"] = ",",
	["᠉"] = ".",
}

function export.tr(text, lang, sc)
	if sc ~= "Mong" then
		return nil
	end
	
	text = mw.ustring.gsub(text, "([ᠠᡝᡳᡟᠣᡠᡡᠨᠩᡴᡤᡥᠪᡦᠰᡧᡨᡩᠯᠮᠴᠵᠶᡵᡶᠸᠺᡬᡭᡮᡯᡰᡱᡷ᠈᠉])([ᡟᡳ]?)", function(a, b)
		return conv[a..b] or conv[a] .. conv[b] end)
	return text
end

return export

-- All tests passed. (refresh)

-- test_translit_manchu:
-- Text	Expected	Actual	Differs at
-- Passed	ᠠᠨᡳᠶᠠ	aniya	aniya	
-- Passed	ᠠᡤᠠ	aga	aga	
-- Passed	ᠣᡵᡳᠨ	orin	orin	
-- Passed	ᠨᠠᡩᠠᠨ	nadan	nadan	
-- Passed	ᠨᠠᡩᠠᠨᠵᡠ	nadanju	nadanju	
-- Passed	ᠨᡳᠨᠵᡠ	ninju	ninju	
-- Passed	ᠨᡳᠩᡤᡠᠨ	ninggun	ninggun	
-- Passed	ᠨᡳᡴᠠᠨ	nikan	nikan	
-- Passed	ᠪᡳ	bi	bi	
-- Passed	ᠪᡳᡵᠠ	bira	bira	
-- Passed	ᠮᠠᠨᠵᡠ	manju	manju	
-- Passed	ᠮᠠᠨᠵᡠ ᡤᡳᠰᡠᠨ	manju gisun	manju gisun	
-- Passed	ᠮᠣᡵᡳᠨ	morin	morin	
-- Passed	ᠮᡠᠰᡝ	muse	muse	
-- Passed	ᠮᡠᡴᡝ	muke	muke	
-- Passed	ᠮᡳᠩᡤᠠᠨ	minggan	minggan	
-- Passed	ᠰᠣᠯᠣᠨᡨᡠ	solontu	solontu	
-- Passed	ᠰᡠᠨᠵᠠ	sunja	sunja	
-- Passed	ᠰᡠᠰᠠᡳ	susai	susai	
-- Passed	ᠰᡠᠸᡝ	suwe	suwe	
-- Passed	ᠰᡳ	si	si	
-- Passed	ᠴᡝ	ce	ce	
-- Passed	ᠵᠠᡴᡡᠨ	jakūn	jakūn	
-- Passed	ᠵᠠᡴᡡᠨᠵᡠ	jakūnju	jakūnju	
-- Passed	ᠵᡠᠸᠠᠨ	juwan	juwan	
-- Passed	ᠵᡠᠸᡝ	juwe	juwe	
-- Passed	ᡝᠮᡠ	emu	emu	
-- Passed	ᡠᠰᡳᡥᠠ	usiha	usiha	
-- Passed	ᡠᠶᡠᠨ	uyun	uyun	
-- Passed	ᡠᠶᡠᠨᠵᡠ	uyunju	uyunju	
-- Passed	ᡤᡡᠰᡳᠨ	gūsin	gūsin	
-- Passed	ᡤᡳᠰᡠᠨ	gisun	gisun	
-- Passed	ᡥᠠᡥᠠ	haha	haha	
-- Passed	ᡦᠣᡠ	pou	pou	
-- Passed	ᡧᠣᠯᠣᠨᡨᡠ	šolontu	šolontu	
-- Passed	ᡧᡠᠨ	šun	šun	
-- Passed	ᡨᠠᠩᡤᡡ	tanggū	tanggū	
-- Passed	ᡨᠠᠴᡳᡴᡡ	tacikū	tacikū	
-- Passed	ᡩᡝᡥᡳ	dehi	dehi	
-- Passed	ᡩᡠᡳᠨ	duin	duin	
-- Passed	ᡳ	i	i	
-- Passed	ᡳᠯᠠᠨ	ilan	ilan	
-- Passed	ᡳᠯᡥᠠ	ilha	ilha	
-- -- Unit tests for [[Module:mnc-translit]]. Refresh page to run tests.
-- local tests = require('Module:UnitTests')
-- local mnc_translit = require('Module:mnc-translit')

-- function tests:do_test_translit(mong, roman, xlit)
-- 	self:equals('<span class="Mong" lang="mnc">[[' .. mong .. '#Manchu|' .. mong .. ']]</span>', mnc_translit.tr(mong, 'mnc', 'Mong'), roman)
-- end

-- function tests:test_translit_manchu()
-- 	self:do_test_translit('ᠠᠨᡳᠶᠠ', 'aniya')
-- 	self:do_test_translit('ᠠᡤᠠ', 'aga')
-- 	self:do_test_translit('ᠣᡵᡳᠨ', 'orin')
-- 	self:do_test_translit('ᠨᠠᡩᠠᠨ', 'nadan')
-- 	self:do_test_translit('ᠨᠠᡩᠠᠨᠵᡠ', 'nadanju')
-- 	self:do_test_translit('ᠨᡳᠨᠵᡠ', 'ninju')
-- 	self:do_test_translit('ᠨᡳᠩᡤᡠᠨ', 'ninggun')
-- 	self:do_test_translit('ᠨᡳᡴᠠᠨ', 'nikan')
-- 	self:do_test_translit('ᠪᡳ', 'bi')
-- 	self:do_test_translit('ᠪᡳᡵᠠ', 'bira')
-- 	self:do_test_translit('ᠮᠠᠨᠵᡠ', 'manju')
-- 	self:do_test_translit('ᠮᠠᠨᠵᡠ ᡤᡳᠰᡠᠨ', 'manju gisun')
-- 	self:do_test_translit('ᠮᠣᡵᡳᠨ', 'morin')
-- 	self:do_test_translit('ᠮᡠᠰᡝ', 'muse')
-- 	self:do_test_translit('ᠮᡠᡴᡝ', 'muke')
-- 	self:do_test_translit('ᠮᡳᠩᡤᠠᠨ', 'minggan')
-- 	self:do_test_translit('ᠰᠣᠯᠣᠨᡨᡠ', 'solontu')
-- 	self:do_test_translit('ᠰᡠᠨᠵᠠ', 'sunja')
-- 	self:do_test_translit('ᠰᡠᠰᠠᡳ', 'susai')
-- 	self:do_test_translit('ᠰᡠᠸᡝ', 'suwe')
-- 	self:do_test_translit('ᠰᡳ', 'si')
-- 	self:do_test_translit('ᠴᡝ', 'ce')
-- 	self:do_test_translit('ᠵᠠᡴᡡᠨ', 'jakūn')
-- 	self:do_test_translit('ᠵᠠᡴᡡᠨᠵᡠ', 'jakūnju')
-- 	self:do_test_translit('ᠵᡠᠸᠠᠨ', 'juwan')
-- 	self:do_test_translit('ᠵᡠᠸᡝ', 'juwe')
-- 	self:do_test_translit('ᡝᠮᡠ', 'emu')
-- 	self:do_test_translit('ᡠᠰᡳᡥᠠ', 'usiha')
-- 	self:do_test_translit('ᡠᠶᡠᠨ', 'uyun')
-- 	self:do_test_translit('ᡠᠶᡠᠨᠵᡠ', 'uyunju')
-- 	self:do_test_translit('ᡤᡡᠰᡳᠨ', 'gūsin')
-- 	self:do_test_translit('ᡤᡳᠰᡠᠨ', 'gisun')
-- 	self:do_test_translit('ᡥᠠᡥᠠ', 'haha')
-- 	self:do_test_translit('ᡦᠣᡠ', 'pou')
-- 	self:do_test_translit('ᡧᠣᠯᠣᠨᡨᡠ', 'šolontu')
-- 	self:do_test_translit('ᡧᡠᠨ', 'šun')
-- 	self:do_test_translit('ᡨᠠᠩᡤᡡ', 'tanggū')
-- 	self:do_test_translit('ᡨᠠᠴᡳᡴᡡ', 'tacikū')
-- 	self:do_test_translit('ᡩᡝᡥᡳ', 'dehi')
-- 	self:do_test_translit('ᡩᡠᡳᠨ', 'duin')
-- 	self:do_test_translit('ᡳ', 'i')
-- 	self:do_test_translit('ᡳᠯᠠᠨ', 'ilan')
-- 	self:do_test_translit('ᡳᠯᡥᠠ', 'ilha')
-- end
 
-- return tests