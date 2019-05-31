-- Transliteration for Nepali
-- This module will transliterate Nepali language text per WT:NE TR. It is also used to transliterate Doteli (dty).

local export = {}
local gsub = mw.ustring.gsub
local match = mw.ustring.match

local conv = {
	-- consonants
	['क'] = 'k', ['ख'] = 'kh', ['ग'] = 'g', ['घ'] = 'gh', ['ङ'] = 'ṅ', 
	['च'] = 'c', ['छ'] = 'ch', ['ज'] = 'j', ['झ'] = 'jh', ['ञ'] = 'ñ', 
	['ट'] = 'ṭ', ['ठ'] = 'ṭh', ['ड'] = 'ḍ', ['ढ'] = 'ḍh', ['ण'] = 'ṇ',
	['त'] = 't', ['थ'] = 'th', ['द'] = 'd', ['ध'] = 'dh', ['न'] = 'n',
	['प'] = 'p', ['फ'] = 'ph', ['ब'] = 'b', ['भ'] = 'bh', ['म'] = 'm', 
	['य'] = 'y', ['र'] = 'r', ['ल'] = 'l', ['व'] = 'w', ['ळ'] = 'ḷ',
	['श'] = 'ś', ['ष'] = 'ṣ', ['स'] = 's', ['ह'] = 'h',
	['क़'] = 'q', ['ख़'] = 'x', ['ग़'] = 'ġ', ['व़'] = 'v', ['ऴ'] = 'ḻ',
	['ज़'] = 'z', ['झ़'] = 'ž', ['ड़'] = 'ṛ', ['ढ़'] = 'ṛh',
	['फ़'] = 'f', ['थ़'] = 'θ', ['ऩ'] = 'ṉ', ['ऱ'] = 'ṟ', 
	['ॽ'] = "'",

	-- vowel diacritics
	['ि'] = 'i', ['ु'] = 'u', ['े'] = 'e', ['ो'] = 'o', 
	['ा'] = 'ā', ['ी'] = 'ī', ['ू'] = 'ū', 
	['ृ'] = 'ŕ',
	['ै'] = 'ai', ['ौ'] = 'au',
	['ॉ'] = 'ŏ',
	['ॅ'] = 'ĕ',

	-- vowel signs
	['अ'] = 'a', ['इ'] = 'i', ['उ'] = 'u', ['ए'] = 'e', ['ओ'] = 'o',
	['आ'] = 'ā', ['ई'] = 'ī', ['ऊ'] = 'ū', 
	['ऋ'] = 'ŕ', 
	['ऐ'] = 'ai', ['औ'] = 'au', 
	['ऑ'] = 'ŏ',
	['ऍ'] = 'ĕ',
	
	-- chandrabindu
	['ँ'] = '̃',
	
	-- anusvara
	['ं'] = '̃',
	
	-- visarga
	['ः'] = 'ḥ',
	
	-- virama
	['्'] = '',

	-- om
	['ॐ'] = 'oṁ',

	-- numerals
	['०'] = '0', ['१'] = '1', ['२'] = '2', ['३'] = '3', ['४'] = '4', ['५'] = '5', ['६'] = '6', ['७'] = '7', ['८'] = '8', ['९'] = '9',
	
	-- punctuation
	['।'] = '.', -- danda
	['+'] = '', -- compound separator
}

local all_cons, special_cons = 'कखगघङचछजझञटठडढतथदधपफबभशषसयरलवहणनम', 'यरलवहनम'
local vowel = 'aिुृेोाीूैौॉॅ'

function export.tr(text, lang, sc, reduction)
	text = gsub(
		text,
		'([' .. all_cons .. ']़?)([' .. vowel .. '्]?)',
		function(c, d)
			return c .. ( d == "" and 'a' or d )
		end
	)
	if reduction and not match(text, "[<>]") then
		for word in mw.ustring.gmatch(text, "[ऀ-ॿa]+") do
			text = gsub(text, word, "<" .. word .. ">")
		end
	end
	for word in mw.ustring.gmatch(text, "<[^<>]+>") do
		local orig_word = word
		word = gsub(word, "[<>]", "")
		word = gsub(
			word,
			'(.?)(.)([' .. all_cons .. '])(़?)a$',
			function(pre, first, second, opt)
				local last = ""
				if match(second, '[' .. special_cons .. ']') and match(first, '्') or
					match(second .. first, '[ीेै]य') or
					pre == second and first == "्" then
						last =  'a'
				end
				return pre .. first .. second .. opt .. last
			end
		)
		text = gsub(text, orig_word, word)
	end
	text = gsub(text, ".़?", conv)
	text = gsub(text, "[<>]", "")
	return mw.ustring.toNFC(text)
end

return export