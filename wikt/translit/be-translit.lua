-- This module will transliterate Belarusian language text per WT:BE TR.
-- Language code: bel
local export = {}

local tt = {
	["А"]='A', ["а"]='a', ["Б"]='B', ["б"]='b', ["В"]='V', ["в"]='v', ["Г"]='H', ["г"]='h', ["Д"]='D', ["д"]='d', 
	["Е"]='Je', ["е"]='je', ["Ё"]='Jó', ["ё"]='jó', ["Ж"]='Ž', ["ж"]='ž', ["З"]='Z', ["з"]='z', ["І"]='I', ["і"]='i', 
	["И"]='I', ["и"]='i', -- present for Old Belarusian; FIXME, remove when we have a separate language code for this lang
	["Й"]='J', ["й"]='j', ["К"]='K', ["к"]='k', ["Л"]='L', ["л"]='l', ["М"]='M', ["м"]='m', ["Н"]='N', ["н"]='n', 
	["О"]='O', ["о"]='o', ["П"]='P', ["п"]='p', ["Р"]='R', ["р"]='r', ["С"]='S', ["с"]='s', ["Т"]='T', ["т"]='t', 
	["У"]='U', ["у"]='u', ["Ў"]='Ŭ', ["ў"]='ŭ', ["Ф"]='F', ["ф"]='f', ["Х"]='X', ["х"]='x', ["Ц"]='C', ["ц"]='c', 
	["Ч"]='Č', ["ч"]='č', ["Ш"]='Š', ["ш"]='š', ["Ы"]='Y', ["ы"]='y', ["Ь"]='ʹ', ["ь"]='ʹ', ["Э"]='E', ["э"]='e', 
	["Ю"]='Ju', ["ю"]='ju', ["Я"]='Ja', ["я"]='ja', 
	["’"]='ʺ', ["ʼ"]='ʺ'
};

function export.tr(text, lang, sc)
    text = mw.ustring.gsub(text, "'+", { ["'"] = 'ʺ' }) -- neutral apostrophe
    text = mw.ustring.gsub(text, '.', tt)

    return text
end

return export