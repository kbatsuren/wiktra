-- This module will transliterate Ingush language text per WT:INH TR.
-- Language code: inh

local export = {}

local mapping1 = {
	["а"]="a" , ["б"]="b" , ["в"]="w" , ["г"]="g" , ["д"]="d" , ["е"]="e", ["ё"]="ë",
	["ж"]="ž" , ["з"]="z" , ["и"]="i" , ["й"]="j" , ["к"]="k" , ["л"]="l" , ["м"]="m",
	["н"]="n" , ["о"]="o" , ["п"]="p" , ["р"]="r" , ["с"]="s" , ["т"]="t" , ["у"]="u",
	["ф"]="f" , ["х"]="χ" , ["ц"]="c" , ["ч"]="č" , ["ш"]="š" , ["щ"]="šč", ["ъ"]="ʾ",
	["ы"]="ə" , ["ь"]="’" , ["э"]="è" , ["ю"]="ju", ["я"]="ja", ["ӏ"]="ʿ" , ["А"]="A",
	["Б"]="B" , ["В"]="W" , ["Г"]="G" , ["Д"]="D" , ["Е"]="E", ["Ё"]="Ë" , ["Ж"]="Ž",
	["З"]="Z" , ["И"]="I" , ["Й"]="J" , ["К"]="K" , ["Л"]="L" , ["М"]="M" , ["Н"]="N",
	["О"]="O" , ["П"]="P" , ["Р"]="R" , ["С"]="S" , ["Т"]="T" , ["У"]="U" , ["Ф"]="F",
	["Х"]="Χ" , ["Ц"]="C" , ["Ч"]="Č" , ["Ш"]="Š" , ["Щ"]="Šč", ["Ъ"]="ʾ" , ["Ы"]="Ə",
	["Ь"]="’" , ["Э"]="È" , ["Ю"]="Ju", ["Я"]="Ja", ["Ӏ"]="ʿ"
}

local mapping2 = {
	['аь'] = 'ä', ['гӏ'] = 'ġ' , ['кх'] = 'q', ['къ'] = 'q̇',
	['кӏ'] = 'ḳ', ['пӏ'] = 'ṗ' , ['тӏ'] = 'ṭ', ['цӏ'] = 'c̣',
	['чӏ'] = 'č̣', ['яь'] = 'jä', ['ий'] = 'ī', ['ув'] = 'ū',
	['хь'] = 'ḥ', ['хӏ'] = 'h' , ['Аь'] = 'Ä', ['Гӏ'] = 'Ġ',
	['Кх'] = 'Q', ['Къ'] = 'Q̇' , ['Кӏ'] = 'Ḳ', ['Пӏ'] = 'Ṗ',
	['Тӏ'] = 'Ṭ', ['Цӏ'] = 'C̣' , ['Чӏ'] = 'Č̣', ['Яь'] = 'Jä',
	['Ий'] = 'Ī', ['Ув'] = 'Ū' , ['Хь'] = 'Ḥ', ['Хӏ'] = 'H',
}

function export.tr(text, lang, sc)
	local str_gsub = string.gsub
	local UTF8_char = "[%z\1-\127\194-\244][\128-\191]*"
	
	-- Convert capital to lowercase palochka.
	text = str_gsub(text, mw.ustring.char(0x4C0), mw.ustring.char(0x4CF))
	
	text = str_gsub(text, 'рхӏ', 'ρ')
	text = str_gsub(text, 'Рхӏ', 'Ρ')
	for pat, repl in pairs(mapping2) do
		text = str_gsub(text, pat, repl)
	end
	text = str_gsub(text, UTF8_char, mapping1)

	return text
end

return export

-- All tests passed. (refresh)

-- test:
-- Text	Expected	Actual
-- Passed	аьккхий-мархий бутт	äkqī-marχī butt	äkqī-marχī butt
-- Passed	кӏиранди	ḳirandi	ḳirandi
-- Passed	кӀиранди	ḳirandi	ḳirandi
-- Passed	Гӏалгӏай	Ġalġaj	Ġalġaj
-- Passed	ГӀалгӀай	Ġalġaj	Ġalġaj
-- Passed	пӏаьраска	ṗäraska	ṗäraska
-- Passed	пӀаьраска	ṗäraska	ṗäraska
-- Passed	ӏуйре	ʿujre	ʿujre
-- Passed	Ӏуйре	ʿujre	ʿujre
-- Passed	цӏи	c̣i	c̣i
-- Passed	цӀи	c̣i	c̣i
-- Passed	таьрахь	täraḥ	täraḥ
-- Passed	кхаьра	qära	qära
-- Passed	маъы бутт	maʾə butt	maʾə butt
-- Passed	ножганцӏей	nožganc̣ej	nožganc̣ej
-- Passed	ножганцӀей	nožganc̣ej	nožganc̣ej
-- Passed	сахьат	saḥat	saḥat
-- Passed	тха	tχa	tχa
-- Passed	жӏали	žʿali	žʿali
-- Passed	жӀали	žʿali	žʿali
-- return require('Module:transliteration module testcases')(
-- 	require('Module:inh-translit').tr,
-- 	{
-- 		{ 'аьккхий-мархий бутт', 'äkqī-marχī butt' },
-- 		{ 'кӏиранди', 'ḳirandi' }, -- lowercase palochka
-- 		{ 'кӀиранди', 'ḳirandi' }, -- uppercase palochka
-- 		{ 'Гӏалгӏай', 'Ġalġaj' }, -- lowercase
-- 		{ 'ГӀалгӀай', 'Ġalġaj' }, -- uppercase
-- 		{ 'пӏаьраска', 'ṗäraska' }, -- lowercase
-- 		{ 'пӀаьраска', 'ṗäraska' }, -- uppercase
-- 		{ 'ӏуйре', 'ʿujre' }, -- lowercase
-- 		{ 'Ӏуйре', 'ʿujre' }, -- uppercase
-- 		{ 'цӏи', 'c̣i' }, -- lowercase
-- 		{ 'цӀи', 'c̣i' },-- uppercase
-- 		{ 'таьрахь', 'täraḥ' },
-- 		{ 'кхаьра', 'qära' },
-- 		{ 'маъы бутт', 'maʾə butt' },
-- 		{ 'ножганцӏей', 'nožganc̣ej' }, -- lowercase
-- 		{ 'ножганцӀей', 'nožganc̣ej' }, -- uppercase
-- 		{ 'сахьат', 'saḥat' },
-- 		{ 'тха', 'tχa' },
-- 		{ 'жӏали', 'žʿali' }, -- lowercase
-- 		{ 'жӀали', 'žʿali' }, -- uppercase
-- 		--[[
-- 		{ '', '' },
-- 		--]]
-- 	},
-- 	'Cyrl', 'inh'
-- )