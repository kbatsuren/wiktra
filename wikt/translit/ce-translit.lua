-- This module will transliterate Chechen language text per WT:CE TR.
-- Language code: che

local export = {}

local tt = {
	["а"]="a", ["б"]="b", ["в"]="w", ["г"]="g", ["д"]="d", ["е"]="e", ["ё"]="ë",
	["ж"]="ž", ["з"]="z", ["и"]="i", ["й"]="j", ["к"]="k", ["л"]="l", ["м"]="m",
	["н"]="n", ["о"]="o", ["п"]="p", ["р"]="r", ["с"]="s", ["т"]="t", ["у"]="u",
	["ф"]="f", ["х"]="χ", ["ц"]="c", ["ч"]="č", ["ш"]="š", ["щ"]="šč", ["ъ"]="ʾ", ["ы"]="y",
	["ь"]="’", ["э"]="e", ["ю"]="ju", ["я"]="ja", ["ӏ"]="ʿ", ["А"]="A", ["Б"]="B", 
	["В"]="W", ["Г"]="G", ["Д"]="D", ["Е"]="E", ["Ё"]="Ë", ["Ж"]="Ž", ["З"]="Z", 
	["И"]="I", ["Й"]="J", ["К"]="K", ["Л"]="L", ["М"]="M", ["Н"]="N", ["О"]="O", 
	["П"]="P", ["Р"]="R", ["С"]="S", ["Т"]="T", ["У"]="U", ["Ф"]="F", ["Х"]="Χ", 
	["Ц"]="C", ["Ч"]="Č", ["Ш"]="Š", ["Щ"]="Šč", ["Ъ"]="ʾ", ["Ы"]="Y", ["Ь"]="’", ["Э"]="E", 
	["Ю"]="Ju", ["Я"]="Ja", ["ӏ"]="ʿ"};

local digraphs = {
	['аь'] = 'ä',
	['гӏ'] = 'ġ',
	['дж'] = 'ǯ',
	['дз'] = 'ʒ',
	['ий'] = 'ī',
	['кх'] = 'q',
	['къ'] = 'q̇',
	['кӏ'] = 'ḳ',
	['оь'] = 'ö',
	['пӏ'] = 'ṗ',
	['тӏ'] = 'ṭ',
	['уь'] = 'ü',
	['хь'] = 'ḥ',
	['хӏ'] = 'h',
	['цӏ'] = 'c̣',
	['чӏ'] = 'č̣',
	['юь'] = 'jü',
	['яь'] = 'jä',
	['Аь'] = 'Ä',
	['Гӏ'] = 'Ġ',
	['Дж'] = 'Ǯ',
	['Дз'] = 'Ʒ',
	['Ий'] = 'Ī',
	['Кх'] = 'Q',
	['Къ'] = 'Q̇',
	['Кӏ'] = 'Ḳ',
	['Оь'] = 'Ö',
	['Пӏ'] = 'Ṗ',
	['Тӏ'] = 'Ṭ',
	['Уь'] = 'Ü',
	['Хь'] = 'Ḥ',
	['Хӏ'] = 'H',
	['Цӏ'] = 'C̣',
	['Чӏ'] = 'Č̣',
	['Юь'] = 'Jü',
	['Яь'] = 'Jä',
}

function export.tr(text, lang, sc)
	local str_gsub = string.gsub
	
	-- Convert capital to lowercase palochka. Lowercase is found in tables
	-- above.
	text = str_gsub(text, mw.ustring.char(0x4C0), mw.ustring.char(0x4CF))
	
	for digraph, translit in pairs(digraphs) do
		text = str_gsub(text, digraph, translit)
	end
	
	text = str_gsub(text, '[%z\1-127\194-\244][\128-\191]*', tt) -- UTF-8 character pattern
	
	return text
end

return export

-- 1 test failed. (refresh)

-- test:
-- Text	Expected	Actual
-- Passed	нохчийн мотт	noχčīn mott	noχčīn mott
-- Passed	буьйса	büjsa	büjsa
-- Passed	бӏаьрг	bʿärg	bʿärg
-- Passed	вуьрхӏитта	würhitta	würhitta
-- Passed	Гӏалгӏайчоь	Ġalġajčö	Ġalġajčö
-- Passed	дезткъе итт	deztq̇e itt	deztq̇e itt
-- Passed	доьзткъа	döztq̇a	döztq̇a
-- Passed	жӏаьла	žʿäla	žʿäla
-- Passed	кхокха	qoqa	qoqa
-- Passed	пачхьалкх	pačḥalq	pačḥalq
-- Passed	пӏераска	ṗeraska	ṗeraska
-- Passed	шиъ	šiʾ	šiʾ
-- Passed	юьхь	jüḥ	jüḥ
-- Passed	ӏуьйре	ʿüjre	ʿüjre
-- Failed	Оьрсийн Федераци	Örsīn Fiedieraci	Örsīn Federaci
-- return require("Module:transliteration module testcases")(
-- 	require("Module:ce-translit").tr,
-- 	{
-- 		{ "нохчийн мотт", "noχčīn mott" },
-- 		{ "буьйса", "büjsa" },
-- 		{ "бӏаьрг", "bʿärg" },
-- 		{ "вуьрхӏитта", "würhitta" },
-- 		{ "Гӏалгӏайчоь", "Ġalġajčö" },
-- 		{ "дезткъе итт", "deztq̇e itt" },
-- 		{ "доьзткъа", "döztq̇a" },
-- 		{ "жӏаьла", "žʿäla" },
-- 		{ "кхокха", "qoqa" },
-- 		{ "пачхьалкх", "pačḥalq" },
-- 		{ "пӏераска", "ṗeraska" },
-- 		{ "шиъ", "šiʾ" },
-- 		{ "юьхь", "jüḥ" },
-- 		{ "ӏуьйре", "ʿüjre" },
-- 		{ "Оьрсийн Федераци", "Örsīn Fiedieraci" },
-- 	},
-- 	"Cyrl", "ce"
-- )