-- This module will transliterate Sinhalese language text per WT:SI TR.
-- Language code: sin

local export = {}
 
local consonants = {
	['ක']='k' , ['ඛ']='kh' , ['ග']='g' , ['ඝ']='gh' , ['ඞ']='ṅ' , ['ඟ']='n̆g' , ['ච']='c' , ['ඡ']='ch' , ['ජ']='j' , ['ඣ']='jh' , 
	['ඤ']='ñ' , ['ඥ']='gn' , ['ඦ']='n̆j' , ['ට']='ṭ' , ['ඨ']='ṭh' , ['ඩ']='ḍ' , ['ඪ']='ḍh' , ['ණ']='ṇ' , ['ඬ']='n̆ḍ' ,
	['ත']='t' ,  ['ථ']='th' , ['ද']='d' , ['ධ']='dh' , ['න']='n' , ['ඳ']='n̆d' , 
	['ප']='p' , ['ෆ']='f' , ['ඵ']='ph' , ['බ']='b' , ['භ']='bh' , ['ම']='m' , ['ඹ']='m̆b' , ['ය']='y' , ['ර']='r' , ['ල']='l' , ['ව']='v' , 
	['ශ']='ś' , ['ෂ']='ṣ' , ['ස']='s' , ['හ']='h' , ['ළ']='ḷ' , ['ෆ']='f'
}

local diacritics = {
	['ා'] = 'ā',
	['ැ'] = 'æ',
	['ෑ'] = 'ǣ',
	['ි'] = 'i',
	['ී'] = 'ī',
	['ු'] = 'u',
	['ූ'] = 'ū',
	['ෙ'] = 'e',
	['ේ'] = 'ē', 
	['ෛ'] = 'ai', 
	['ො'] = 'o', 
	['ෝ'] = 'ō', 
	['ෞ'] = 'au',
	['ෘ'] = 'ṛ',
	['ෟ'] = 'ḷ', 
	['ෲ'] = 'ṝ', 
	['ෳ'] = 'ḹ',
	['්'] = ''
}
local tt = {
	-- vowels
	['අ']='a' ,  ['ආ']='ā' ,  ['ඇ']='æ' ,   ['ඈ']='ǣ' ,  ['ඉ']='i' ,  ['ඊ']='ī' ,  ['උ']='u' ,  ['ඌ']='ū' , 
	['එ']='e' ,  ['ඒ']='ē' ,  ['ඓ']='ai' ,  ['ඔ']='o' ,  ['ඕ']='ō' ,  ['ඖ']='au' , 
	['ඍ']='ṛ' ,  ['ඎ']='ṝ' ,  ['ඏ']='ḷ' ,  ['ඐ']='ḹ' ,     
	-- other symbols
	['ං']='ṁ' , -- anusvara
	['ඃ']='ḥ' ,  -- visarga
	['්']='' ,  --hal kirīma, supresses the inherent vowel "a"
	-- punctuation
	['෴']='.' ,  -- kunddaliya (obsolete)    
}

-- translit any words or phrases
function export.tr(text)
	if type(text) == 'table' then text = text.args[1] end
	text = mw.ustring.gsub(
		text,
		'([කඛගඝඞඟචඡජඣඤඥඦටඨඩඪණඬතථදධනඳපපඵබභමඹයරලවශෂසහළෆ])'..
		'([\224\183\153\224\183\146\224\183\156\224\183\148\224\183\144\224\183\146\224\183\143\224\183\154\224\183\157\224\183\150\224\183\145\224\183\147\224\183\152\224\183\159\224\183\178\224\183\179\224\183\155\224\183\158\224\183\138]?)',
		function(c, d)
			if d == "" then        
				return consonants[c] .. 'a'
			else
				return consonants[c] .. diacritics[d]
			end
		end)
	
	text = mw.ustring.gsub(text, '.', tt)
	
	return text
end
 
return export