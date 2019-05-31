-- This module will transliterate Lak language text per WT:LBE TR.
local export = {}

local tt = {
	["б"]="b", ["п"]="p", ["ф"]="f", ["в"]="w", ["м"]="m",
	["д"]="d", ["т"]="t", ["й"]="j", ["н"]="n", ["з"]="z", ["ц"]="c",
	["с"]="s", ["ж"]="ž", ["ш"]="š", ["щ"]="š̄", 
	["л"]="l", ["ч"]="č", ["р"]="r", ["г"]="g", ["к"]="k", ["х"]="χ", 
	["ъ"]="ʾ", ["а"]="a", ["е"]="ə̱", ["ы"]="y", ["и"]="i", ["о"]="o", ["у"]="u", 
	["ё"]="ë", ["ь"]="’", ["э"]="ə̱", ["ю"]="ju", ["я"]="ja",
	["Б"]="B", ["П"]="P", ["Ф"]="F", ["В"]="W", ["М"]="M",
	["Д"]="D", ["Т"]="T", ["Й"]="J", ["Н"]="N", ["З"]="Z", ["Ц"]="C",
	["С"]="S", ["Ж"]="Ž", ["Ш"]="Š", ["Щ"]="Š̄", 
	["Л"]="L", ["Ч"]="Č", ["Р"]="R", ["Г"]="G", ["К"]="K", ["Х"]="Χ", 
	["Ъ"]="ʾ", ["А"]="A", ["Е"]="Ə̱", ["Ы"]="Y", ["И"]="I", ["О"]="O", ["У"]="U", 
	["Ё"]="Ë", ["Ь"]="’", ["Э"]="Ə̱", ["Ю"]="Ju", ["Я"]="Ja"};

local tetragraphs = {
	['хьхь'] = 'x̄',
	['Хьхь'] = 'X̄',
}

local digraphs = {
	['пп'] = 'p̄',
	['пӏ'] = 'ṗ',
	['тт'] = 't̄', 
	['аь'] = 'a̱',
	['оь'] = 'o̱',
	['Пп'] = 'P̄',
	['Пӏ'] = 'Ṗ',
	['Тт'] = 'T̄',
	['Аь'] = 'A̱',
	['Оь'] = 'O̱',
	['цӏ'] = 'c̣',
	['цц'] = 'c̄',
	['тӏ'] = 'ṭ',
	['сс'] = 's̄',
	['чч'] = 'č̄',
	['чӏ'] = 'č̣',
	['кь'] = 'q̇',
	['кк'] = 'k̄',
	['кӏ'] = 'ḳ',
	['хь'] = 'x',
	['хъ'] = 'q',
	['къ'] = 'q̄',
	['гъ'] = 'ġ',
	['хх'] = 'χ̄',
	['гӏ'] = 'ʿ',
	['хӏ'] = 'ḥ',
	['гь'] = 'h',
	['Цӏ'] = 'C̣',
	['Цц'] = 'C̄',
	['Тӏ'] = 'Ṭ',
	['Сс'] = 'S̄',
	['Чч'] = 'Č̄',
	['Чӏ'] = 'Č̣',
	['Кь'] = 'Q̇',
	['Кк'] = 'K̄',
	['Кӏ'] = 'Ḳ',
	['Хь'] = 'X',
	['Хъ'] = 'Q',
	['Къ'] = 'Q̄',
	['Гъ'] = 'Ġ',
	['Хх'] = 'Χ̄',
	['Гӏ'] = 'ʿ',
	['Хӏ'] = 'Ḥ',
	['Гь'] = 'H',
}

function export.tr(text, lang, sc)
	local str_gsub = string.gsub
	local UTF8_char = '[%z\1-\127\194-\244][\128-\191]*'
	
	-- Convert capital to lowercase palochka. Lowercase is found in tables
	-- above.
	text = str_gsub(text, mw.ustring.char(0x4C0), mw.ustring.char(0x4CF))
	
	for tetragraph, replacement in pairs(tetragraphs) do
		text = str_gsub(text, tetragraph, replacement)
	end
	
	for digraph, replacement in pairs(digraphs) do
		text = str_gsub(text, digraph, replacement)
	end
	
	text = str_gsub(text, UTF8_char, tt)
	
	return text
end

return export