-- This module will transliterate Eastern Mari language text (and also Western Mari) per WT:CHM TR.
-- Language code: chm

local export = {}
 
local tab = {
	["А"]="A", ["Б"]="B", ["В"]="V", ["Г"]="G", ["Д"]="D", ["Е"]="E", ["Ё"]="Jo", ["Ж"]="Ž", ["З"]="Z", ["И"]="I", ["Й"]="J",
	["К"]="K", ["Л"]="L", ["М"]="M", ["Н"]="N", ["Ҥ"]="Ŋ", ["О"]="O", ["Ӧ"]="Ö", ["П"]="P", ["Р"]="R", ["С"]="S", ["Т"]="T",
	["У"]="U", ["Ӱ"]="Ü", ["Ф"]="F", ["Х"]="X", ["Ц"]="C", ["Ч"]="Č", ["Ш"]="Š", ["Щ"]="Šč", ["Ъ"]="ʺ", ["Ы"]="Ə", ["Ь"]="ʹ",
	["Э"]="E", ["Ю"]="Ju", ["Я"]="Ja",
	['а']='a', ['б']='b', ['в']='v', ['г']='g', ['д']='d', ['е']='e', ['ё']='jo', ['ж']='ž', ['з']='z', ['и']='i', ['й']='j',
	['к']='k', ['л']='l', ['м']='m', ['н']='n', ['ҥ']='ŋ', ['о']='o', ['ӧ']='ö', ['п']='p', ['р']='r', ['с']='s', ['т']='t',
	['у']='u', ['ӱ']='ü', ['ф']='f',
	['х']='x', ['ц']='c', ['ч']='č', ['ш']='š', ['щ']='šč', ['ъ']='ʺ', ['ы']='ə', ['ь']='ʹ', ['э']='e', ['ю']='ju', ['я']='ja',
	-- Hill (Western) Mari only, doesn't use Ҥ, ҥ
	["Ӓ"]="Ä", ["Ӹ"]="Ə̈", ['ӓ']='ä', ['ӹ']='ə̈', 
}

function export.tr(text)
	-- Ё needs converting if is decomposed
	text = text:gsub("ё","ё"):gsub("Ё","Ё")
 
	-- е after a vowel or at the beginning of a word becomes je
	text = mw.ustring.gsub(text, "([АӒОӦУӰЫӸЕЯЁЮИЕЪЬаӓоӧуӱыӹэяёюиеъь%A][́̀]?)е","%1je")
	text = mw.ustring.gsub(text, "^Е","Je")
	text = mw.ustring.gsub(text, "^е","je")
	text = mw.ustring.gsub(text, "([^Ѐ-ӿ])Е","%1Je")
	text = mw.ustring.gsub(text, "([^Ѐ-ӿ])е","%1je")
 
	return (mw.ustring.gsub(text,'.',tab))
end
 
return export