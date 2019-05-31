local export = {}
 
local consonants = {
	['k']='க', ['g']='க', ['ṅ']='ங', ['c']='ச', ['ñ']='ஞ', ['ṭ']='ட', ['ḍ']='ட', ['ṛ']='ட', ['ṇ']='ண', 
	['t']='த', ['d']='த', ['n']='ந', ['p']='ப', ['b']='ப', ['m']='ம', ['y']='ய', ['r']='ர' , ['l']='ல' , ['v']='வ' ,
	['ḻ']='ழ' , ['ḷ']='ள' , ['ṟ']='ற' , ['ṉ']='ன' , ['ś']='ஶ' , ['j']='ஜ' , ['ṣ']='ஷ' , 
	['s']='ஸ' , ['h']='ஹ' , ['f']='ஃப' , ['z']='ஃஜ' , ['x']='ஃஸ' ,
}

local diacritics = {
	['ai'] = 'ை', ['au'] = 'ௌ', 
	['a'] = '' ,
	['ā']= 'ா' , ['i']='ி' , ['ī']='ீ' , ['u']='ு' , ['ū']='ூ' ,  ['e']='ெ' ,
	['ē']='ே' , ['o']='ொ' , ['ō']='ோ' , 
}

local nonconsonants = {
	['au']='ஔ' , ['ai']='ஐ' ,
	['a']='அ' , ['0']='௦' , ['ā']='ஆ' , ['i']='இ' , ['ī']='ஈ' , ['u']='உ' , ['ū']='ஊ' , 
	['e']='எ' , ['ē']='ஏ' ,  ['o']='ஒ' , ['ō']='ஓ' ,  ['ḥ']='ஃ' ,
	['1']='௧' , ['2']='௨' , ['3']='௩' , ['4']='௪' , ['5']='௫' , ['6']='௬' , ['7']='௭' , ['8']='௮' , ['9']='௯' ,
}

-- translit any words or phrases
function export.tr(text, lang, sc)
		text = mw.ustring.gsub(
		text,
		'([kgṅcñṭḍṛṇtdnpbmyrlvḻḷṟṉśjṣshfzx])'..
		'(a[iu]?)',
		function(c, d)
			if d ~= "" then  
				return consonants[c] .. diacritics[d]
			end
		end)
	text = mw.ustring.gsub(
		text,
		'([kgṅcñṭḍṛṇtdnpbmyrlvḻḷṟṉśjṣshfzx])'..
		'([aāiīuūeēoō]?)',
		function(c, d)
			if d ~= "" then  
				return consonants[c] .. diacritics[d]
			else
				return consonants[c] .. '்'
			end
		end)
		text = mw.ustring.gsub(text,'(a[iu]?)', function(a)
			if a ~= "" then  
				return nonconsonants[a]
			end
		end)
	text = mw.ustring.gsub(text, '.', nonconsonants)
	
	return text
end
 
return export