-- Khar scripts, and this module is used by inc-ash-translit module.
local export = {}

local consonants = {
--consonants
	['𐨐']='k', ['𐨑']='kh', ['𐨒']='g', ['𐨓']='gh',
	['𐨕']='c', ['𐨖']='ch', ['𐨗']='j', ['𐨙']='ñ', 
	['𐨚']='ṭ', ['𐨛']='ṭh', ['𐨜']='ḍ', ['𐨝']='ḍh', ['𐨞']='ṇ', 
	['𐨟']='t', ['𐨠']='th', ['𐨡']='d', ['𐨢']='dh', ['𐨣']='n', 
	['𐨤']='p', ['𐨥']='ph', ['𐨦']='b', ['𐨧']='bh', ['𐨨']='m',
	['𐨩']='y', ['𐨪']='r', ['𐨫']='l', ['𐨬']='v',
	['𐨭']='ś', ['𐨮']='ṣ', ['𐨯']='s', ['𐨰']='z', ['𐨱']='h',
	['𐨲']='ḱ', ['𐨳']='ṭ́h',
}

local diacritics = {
--matras
	['𐨁']='i', ['𐨂']='u', ['𐨃']='ṛ',
	['𐨅']='e', ['𐨆']='o',
	['𐨁𐨌']='ī', ['𐨂𐨌']='ū', ['𐨃𐨌']='ṝ',
	['𐨅𐨌']='ai', ['𐨆𐨌']='au', ['𐨿']='',
}

local tt = {

--vowels
	-- anusvara    
	['𐨎']='ṃ', --until a better method is found
	-- visarga    
	['𐨏']='ḥ',
	--numerals
	['𐩀']='1', ['𐩁']='2', ['𐩂']='3', ['𐩃']='4',
['𐩄']='10', ['𐩅']='20', ['𐩆']='100', ['𐩇']='1000', 
	--punctuation        
	['𐩖']='.', --danda
    ['𐩗']='.' --double danda
}

function export.tr(text, lang, sc)
	if sc ~= "Khar" then
		return nil
	end
	
	text = mw.ustring.gsub(
		text,
		'([𐨐-𐨳])'..
		'([𐨁-𐨆𐨿]?)'..
		'(𐨌?)',
		function(c, d, e)
			if d == "" and e ~= "" then        
				return consonants[c] .. 'ā'
			elseif d == "" then
				return consonants[c] .. 'a'
			else
				return consonants[c] .. diacritics[d .. e]
			end
		end)

		text = mw.ustring.gsub(
		text,
		'([𐨀])'..
		'([𐨁-𐨆𐨿]?)'..
		'(𐨌?)',
		function(c, d, e)
			if d == "" and e ~= "" then        
				return 'ā'
			elseif d == "" then
				return 'a'
			else
				return diacritics[d .. e]
			end
		end)

	text = mw.ustring.gsub(text, '.', tt)
	
	return text
end
 
return export