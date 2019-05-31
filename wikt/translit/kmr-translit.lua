-- This module will transliterate Northern Kurdish language text.

local export = {}

local tt = {
	["а"]="a", ["б"]="b", ["щ"]="c", ["ч"]="ç", ["д"]="d", ["ә"]="e",
	["е"]="ê", ["э"]="ê", ["ф"]="f", ["г"]="g", ["h"]="h", ["ь"]="i",
	["и"]="î", ["ж"]="j", ["к"]="k", ["л"]="l", ["м"]="m", ["н"]="n",
	["о"]="o", ["п"]="p", ["ԛ"]="q", ["р"]="r", ["с"]="s", ["ш"]="ş",
	["т"]="t", ["ӧ"]="u", ["у"]="û", ["в"]="v", ["ԝ"]="w", ["х"]="x", 
	["й"]="j", ["з"]="z",
	["А"]="A", ["Б"]="B", ["Щ"]="C", ["Ч"]="Ç", ["Д"]="D", ["Ә"]="E",
	["Е"]="Ê", ["Э"]="Ê", ["Ф"]="F", ["Г"]="G", ["H"]="H", ["Ь"]="I",
	["И"]="Î", ["Ж"]="J", ["К"]="K", ["Л"]="L", ["М"]="M", ["Н"]="N",
	["О"]="O", ["П"]="P", ["Ԛ"]="Q", ["Р"]="R", ["С"]="S", ["Ш"]="Ş",
	["Т"]="T", ["Ӧ"]="U", ["У"]="Û", ["В"]="V", ["ԝ"]="W", ["Х"]="X", 
	["Й"]="J", ["З"]="Z"

	};

function export.tr(text, lang, sc)
	if sc == "Latn" then
		return nil
	elseif sc == "ku-Arab" then
		return nil
	elseif sc == "Arab" then
		return nil
	elseif sc == "Armn" then
		return require("Module:Armn-translit").tr(text, lang, sc)
	else
	text = mw.ustring.gsub(text, 'г’', 'x’')
	text = mw.ustring.gsub(text, 'Г’', 'X’')

	text = mw.ustring.gsub(text, '.', tt)
	
	return text
    end

end

return export