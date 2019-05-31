-- This module will transliterate Tuvan language text per WT:TYV TR.
-- Language code: tyv

local export = {}
 
local tab = {
	["А"]="A", ["Б"]="B", ["В"]="V", ["Г"]="G", ["Д"]="D", ["Е"]="Ä", ["Ё"]="Yo", ["Ж"]="Ž", ["З"]="Z", ["И"]="Ï", ["Й"]="Y",
	["К"]="K", ["Л"]="L", ["М"]="M", ["Н"]="N", ["Ң"]="Ŋ", ["О"]="O", ["Ө"]="Ö", ["П"]="P", ["Р"]="R", ["С"]="S", ["Т"]="T",
	["У"]="U", ["Ү"]="Ü", ["Ф"]="F", ["Х"]="H", ["Ц"]="C", ["Ч"]="Č", ["Ш"]="Š", ["Щ"]="Šč", ["Ъ"]="ʺ", ["Ы"]="I", ["Ь"]="ʹ",
	["Э"]="Ä", ["Ю"]="Yu", ["Я"]="Ya",
	['а']='a', ['б']='b', ['в']='v', ['г']='g', ['д']='d', ['е']='ä', ['ё']='yo', ['ж']='ž', ['з']='z', ['и']='ï', ['й']='y',
	['к']='k', ['л']='l', ['м']='m', ['н']='n', ['ң']='ŋ', ['о']='o', ['ө']='ö', ['п']='p', ['р']='r', ['с']='s', ['т']='t',
	['у']='u', ['ү']='ü', ['ф']='f',
	['х']='h', ['ц']='c', ['ч']='č', ['ш']='š', ['щ']='šč', ['ъ']='ʺ', ['ы']='ı', ['ь']='ʹ', ['э']='ä', ['ю']='yu', ['я']='ya',
}

function export.tr(text, lang, sc)
	-- Ё needs converting if is decomposed
	text = text:gsub("ё","ё"):gsub("Ё","Ё")
	
	-- е after a vowel or at the beginning of a word becomes yä
	-- Note that according to modern Tuvan orthography ее (instead of ээ) is occationally used for long ä
	text = mw.ustring.gsub(text, "([АОӨУҮЫЯЁЮИЪЬаоөуүыяёюиъь%A][́̀]?)е","%1yä")
	--text = mw.ustring.gsub(text, "([АОӨУҮЫЕЯЁЮИЕЪЬаоөуүыэяёюиеъь%A][́̀]?)е","%1yä")
	text = mw.ustring.gsub(text, "^Е","Yä")
	text = mw.ustring.gsub(text, "^е","yä")
	text = mw.ustring.gsub(text, "([^Ѐ-ӿ])Е","%1Yä")
	text = mw.ustring.gsub(text, "([^Ѐ-ӿ])е","%1yä")
	
	return (mw.ustring.gsub(text,'.',tab))
end
 
return export