-- This module will transliterate Rusyn language text per WT:RUE TR.
-- Language code: rue

local export = {}
 
local tt = {
	["А"]='A', ["а"]='a', ["Б"]='B', ["б"]='b', ["В"]='V', ["в"]='v', ["Г"]='H', ["г"]='h', 
	["Ґ"]='G', ["ґ"]='g', ["Д"]='D', ["д"]='d', ["Е"]='E', ["е"]='e', ["Є"]='Je', ["є"]='je', 
	["Ё"]='Jo', ["ё"]='jo', ["Ж"]='Ž', ["ж"]='ž', ["З"]='Z', ["з"]='z', ["И"]='Y', ["и"]='y', 
	["І"]='I', ["і"]='i', ["Ї"]='Ji', ["ї"]='ji', ["Й"]='J', ["й"]='j', ["К"]='K', ["к"]='k', 
	["Л"]='L', ["л"]='l', ["М"]='M', ["м"]='m', ["Н"]='N', ["н"]='n', ["О"]='O', ["о"]='o', 
	["П"]='P', ["п"]='p', ["Р"]='R', ["р"]='r', ["С"]='S', ["с"]='s', ["Т"]='T', ["т"]='t', 
	["У"]='U', ["у"]='u', ["Ф"]='F', ["ф"]='f', ["Х"]='X', ["х"]='x', ["Ц"]='C', ["ц"]='c', 
	["Ч"]='Č', ["ч"]='č', ["Ш"]='Š', ["ш"]='š', ["Щ"]='Šč', ["щ"]='šč', ["Ю"]='Ju', ["ю"]='ju', 
	["Я"]='Ja', ["я"]='ja', ["Ы"]='Ŷ', ["ы"]='ŷ', ["Ь"]='ʹ', ["ь"]='ʹ', 
	-- neutral apostrophe, right single quotation mark, modifier letter apostrophe → modifier letter double prime
	["’"]='ʺ', ["ʼ"]= 'ʺ', 
	-- obsolete letters
	["Ъ"]='ʺ', ["ъ"]='ʺ', ["Ѣ"]='Ě', ["ѣ"]='ě', ["Э"]='È', ["э"]='è',
}

function export.tr(text, lang, sc)
	text = mw.ustring.gsub(text, "'+", { ["'"] = 'ʺ' })
	return (mw.ustring.gsub(text, '.', tt))
end

return export