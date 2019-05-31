-- This module will transliterate Southern Altai and Northern Altai text per WT:ALT TR and WT:ATV TR.
local export = {}

local tab = {
	["А"]="A", ["Б"]="B", ["В"]="V", ["Г"]="G", ["Д"]="D", ["Е"]="E", ["Ё"]="Yo", ["Ж"]="Ž", ["З"]="Z", ["И"]="I", ["Й"]="Y", ["Ј"]="J̌", ["J"]="J̌[[Category:Altai text with misused characters|J]]",
	["К"]="K", ["Л"]="L", ["М"]="M", ["Н"]="N", ["Ҥ"]="Ŋ", ["О"]="O", ["Ӧ"]="Ö", ["Ö"]="Ö[[Category:Altai text with misused characters|Ö]]", ["П"]="P", ["Р"]="R", ["С"]="S", ["Т"]="T",
	["У"]="U", ["Ӱ"]="Ü", ["Ф"]="F", ["Х"]="H", ["Ц"]="C", ["Ч"]="Č", ["Ш"]="Š", ["Щ"]="Šč", ["Ъ"]="ʺ", ["Ы"]="Ï", ["Ь"]="ʹ",
	["Э"]="E", ["Ю"]="Yu", ["Я"]="Ya",
	['а']='a', ['б']='b', ['в']='v', ['г']='g', ['д']='d', ['е']='e', ['ё']='yo', ['ж']='ž', ['з']='z', ['и']='i', ['й']='y', ["ј"]="ǰ", ["j"]="ǰ[[Category:Altai text with misused characters|j]]",
	['к']='k', ['л']='l', ['м']='m', ['н']='n', ['ҥ']='ŋ', ['о']='o', ['ӧ']='ö', ['ö']='ö[[Category:Altai text with misused characters|ö]]', ['п']='p', ['р']='r', ['с']='s', ['т']='t',
	['у']='u', ['ӱ']='ü', ['ф']='f',
	['х']='h', ['ц']='c', ['ч']='č', ['ш']='š', ['щ']='šč', ['ъ']='ʺ', ['ы']='ï', ['ь']='ʹ', ['э']='e', ['ю']='yu', ['я']='ya',
}

local iotated = {
	["Е"] = "Ye",
	["е"] = "ye",
}

function export.tr(text, lang, sc)
	local ugsub = mw.ustring.gsub
	
	-- Ё needs to be composed if is decomposed (e + combining diaeresis).
	-- However, this cannot happen in wikitext, only in Lua modules.
	text = mw.ustring.toNFC(text)
	
	-- е after a vowel or at the beginning of a word becomes ye
	-- Note that according to modern Altai orthography ее (instead of ээ) is occationally used for long r
	text = ugsub(text, "([АОӨУҮЫЯЁЮИЪЬаоөуүыяёюиъь%A][́̀]?)е", "%1ye")
	--text = mw.ustring.gsub(text, "([АОӨУҮЫЕЯЁЮИЕЪЬаоөуүыэяёюиеъь%A][́̀]?)е", "%1ye")
	text = ugsub(text, "^[Ее]", iotated)
	text = ugsub(text, "([^Ѐ-ӿ])([Ее])", function(a, b)
			return a .. iotated[b]
		end)
	
	return (ugsub(text, '.', tab))
end
 
return export

-- Text	Expected	Actual	Differs at
-- Passed	кöндӱрe	köndüre	köndüre	
-- Failed	мында	mında	mïnda	2
-- Failed	кичӱ	kïčü	kičü	2
-- Failed	тартыжар	tartıžar	tartïžar	5
-- Failed	сегизинчи	sägïzïnčï	segizinči	2
-- local tests = require("Module:UnitTests")
-- local transliterate = require("Module:Altai-translit").tr
-- local normalize = mw.ustring.toNFC
-- local gsub = string.gsub

-- local function tag(text)
-- 	return '<span class="Cyrl">' .. text .. '</span>'
-- end

-- local function remove_categories(text)
-- 	return gsub(text, "%[%[Category:[^%]]+%]%]", "")
-- end

-- function tests:check(example, expected)
-- 	self:equals(
-- 		tag(example),
-- 		remove_categories(normalize(transliterate(example))),
-- 		normalize(expected),
-- 		{ show_difference = true }
-- 	)
-- end

-- function tests:test_translit()
-- 	local examples = {
-- 		{ "кöндӱрe", "köndüre" },
-- 		{ "мында", "mında" },	
-- 		{ "кичӱ", "kïčü" },
-- 		{ "тартыжар", "tartıžar" },
-- 		{ "сегизинчи", "sägïzïnčï" },
-- 	}
	
-- 	tests:iterate(examples, "check")
-- end

-- return tests