-- Transliteration for Marathi (in progress)
-- This module will transliterate Marathi language text per WT:MR TR.
-- Language code: mar
	
local export = {}
local gsub = mw.ustring.gsub
local find = mw.ustring.find

local conv = {
	-- consonants
	['क'] = 'k', ['ख'] = 'kh', ['ग'] = 'g', ['घ'] = 'gh', ['ङ'] = 'ṅ', 
	['च'] = 'c', ['छ'] = 'ch', ['ज'] = 'j', ['झ'] = 'jh', ['ञ'] = 'ñ', 
	['ट'] = 'ṭ', ['ठ'] = 'ṭh', ['ड'] = 'ḍ', ['ढ'] = 'ḍh', ['ण'] = 'ṇ',
	['त'] = 't', ['थ'] = 'th', ['द'] = 'd', ['ध'] = 'dh', ['न'] = 'n',
	['प'] = 'p', ['फ'] = 'ph', ['ब'] = 'b', ['भ'] = 'bh', ['म'] = 'm', 
	['य'] = 'y', ['र'] = 'r', ['ल'] = 'l', ['व'] = 'v', ['ळ'] = 'ḷ',
	['श'] = 'ś', ['ष'] = 'ṣ', ['स'] = 's', ['ह'] = 'h',
	['ऱ'] = 'r',
	-- ['ज्ञ'] = 'dny',

	-- vowel diacritics
	['ि'] = 'i', ['ु'] = 'u', ['े'] = 'e', ['ो'] = 'o', 
	['ा'] = 'ā', ['ी'] = 'ī', ['ू'] = 'ū', 
	['ृ'] = 'ru',
	['ै'] = 'ai', ['ौ'] = 'au',
	['ॉ'] = 'ŏ',
	['ॅ'] = 'ĕ',

	-- vowel signs
	['अ'] = 'a', ['इ'] = 'i', ['उ'] = 'u', ['ए'] = 'e', ['ओ'] = 'o',
	['आ'] = 'ā', ['ई'] = 'ī', ['ऊ'] = 'ū', 
	['ऋ'] = 'ŕ', 
	['ऐ'] = 'ai', ['औ'] = 'au', 
	['ऑ'] = 'ŏ',
	['ॲ'] = 'ĕ', ['ऍ'] = 'ĕ',
	
	['ॐ'] = 'om',
	
	-- chandrabindu
	['ँ'] = '̃',
	
	-- anusvara
	['ं'] = 'ṁ',
	
	-- visarga
	['ः'] = 'ḥ',
	
	-- virama
	['्'] = '',
	
	-- numerals
	['०'] = '0', ['१'] = '1', ['२'] = '2', ['३'] = '3', ['४'] = '4',
	['५'] = '5', ['६'] = '6', ['७'] = '7', ['८'] = '8', ['९'] = '9',
	
	-- punctuation
	['।'] = '.', -- danda
	['॥'] = '.', -- double danda
	['+'] = '', -- compound separator
	
	-- abbreviation sign
	['॰'] = '.',
}

local nasal_assim = {
	['क'] = 'ङ', ['ख'] = 'ङ', ['ग'] = 'ङ', ['घ'] = 'ङ', 
	['च'] = 'ञ', ['छ'] = 'ञ', ['ज'] = 'ञ', ['झ'] = 'ञ',  
	['ट'] = 'ण', ['ठ'] = 'ण', ['ड'] = 'ण', ['ढ'] = 'ण',
	['प'] = 'म', ['फ'] = 'म', ['ब'] = 'म', ['भ'] = 'म', ['म'] = 'म',
	['य'] = 'इ', ['र'] = 'उ', ['ल'] = 'उ', ['व'] = 'उ',
}

local perm_cl = {
	['म्ल'] = true, ['व्ल'] = true, ['न्ल'] = true,
	
}

local all_cons, special_cons = 'कखगघङचछजझञटठडढतथदधपफबभशषसयरलवहणनमळ', 'यरलवहनम'
local vowel, vowel_sign = 'aिुृेोाीूैौॉॅ', 'अइउएओआईऊऋऐऔऑऍ'
local syncope_pattern = '([' .. vowel .. vowel_sign .. '])(़?[' .. all_cons .. '])a(़?[' .. gsub(all_cons, "य", "") .. '])([ंँ]?[' .. vowel .. vowel_sign .. '])'

local function reverse(t)
	local new_t = {}
	local new_t_i = 1
	for i = #t, 1, -1 do
		new_t[new_t_i] = t[i]
		new_t_i = new_t_i + 1
	end
	return new_t
end

local function rev_string(text)
	local char_array, i = {}, 1
	for char in string.gmatch(text, "[%z\1-\127\194-\244][\128-\191]*") do -- UTF-8 character pattern
		char_array[i] = char
		i = i + 1
	end
	-- local table1=require("table")
	-- print(char_array)
	return table.concat(reverse(char_array))
end

function export.tr(text, lang, sc)
	text = gsub(text, 'ाँ', 'ॉ' .. 'ं')
	text = gsub(text, 'ँ', 'ॅ' .. 'ं')
	text = gsub(text, '([^' .. vowel .. vowel_sign .. '])ं ', '%1अ ')
	text = gsub(text, '([^' .. vowel .. vowel_sign .. '])ं$', '%1अ')
	text = gsub(text, '([' .. all_cons .. ']़?)([' .. vowel .. '्]?)', function(c, d)
		return c .. (d == "" and 'a' or d) end)
	for word in mw.ustring.gmatch(text, "[ऀ-ॿa]+") do
		local orig_word = word
		word = rev_string(word)
		word = gsub(word, '^a(़?)([' .. all_cons .. '])(.)(.?)', function(opt, first, second, third)
			return (((find(first, '[' .. special_cons .. ']') and find(second, '्') and not perm_cl[first..second..third])
				or find(first .. second, 'य[ीेै]'))
				and 'a' or "") .. opt .. first .. second .. third end)
		while find(word, syncope_pattern) do
			word = gsub(word, syncope_pattern, '%1%2%3%4')
		end
		word = gsub(word, '(.?)ं(.)', function(succ, prev)
			return succ .. (succ..prev == "a" and "्म" or 
				(succ == "" and find(prev, '[' .. vowel .. ']') and "̃" or nasal_assim[succ] or "n")) .. prev end)
		text = gsub(text, orig_word, rev_string(word))
	end
	text = gsub(text, '.़?', conv)
	text = gsub(text, 'a([iu])̃', 'a͠%1')
	text = gsub(text, 'aa', 'a')
    text = gsub(text, 'ñjñ', 'ndny')
    text = gsub(text, 'jñ', 'dny')
	return mw.ustring.toNFC(text)
end

return export


-- 19 tests failed. (refresh)

-- test_translit_marathi:
-- Text	Expected	Actual	Differs at	Comments
-- Passed	भारत	bhārat	bhārat		
-- Passed	मराठी	marāṭhī	marāṭhī		
-- Passed	गंगा	gaṅgā	gaṅgā		anusvara before ग' is its homorganic nasal ('ṅ')
-- Passed	लंड	laṇḍ	laṇḍ		
-- Passed	कंबल	kambal	kambal		
-- Failed	रक्त	rakta	rakt	5	
-- Passed	काव्य	kāvya	kāvya		
-- Failed	मंद	manda	mand	5	
-- Failed	उंच	unċa	uñc	2	ċ
-- Passed	कृपा	krupā	krupā		‘ऋ’ is ‘ru’, कृपा has a Wiktionary entry
-- Passed	ज्ञान	dnyān	dnyān		
-- Passed	ऱ्हास	rhās	rhās		
-- Failed	दऱ्या	darya	daryā	5	
-- Failed	दर्या	darya	daryā	5	
-- Passed	कैरी	kairī	kairī		
-- Passed	हौस	haus	haus		
-- Passed	संरक्षण	saurakṣaṇ	saurakṣaṇ		
-- Passed	संशय	sanśay	sanśay		
-- Passed	दंष्ट्र	danṣṭra	danṣṭra		
-- Passed	हंस	hans	hans		
-- Passed	संयोग	saiyog	saiyog		
-- Passed	संलग्न	saulagna	saulagna		
-- Passed	संवाद	sauvād	sauvād		
-- Failed	सिंह	siṅha	sinh	3	
-- Failed	संहार	saṅhār	sanhār	3	
-- Passed	संज्ञा	sandnyā	sandnyā		
-- Passed	माझं	mājha	mājha		
-- Passed	बॅट	bĕṭ	bĕṭ		
-- Passed	बँक	bĕṅk	bĕṅk		
-- Passed	ॲप	ĕp	ĕp		
-- Passed	ऍप	ĕp	ĕp		
-- Passed	कॉट	kŏṭ	kŏṭ		
-- Passed	हाँग काँग	hŏṅg kŏṅg	hŏṅg kŏṅg		
-- Passed	ऑस्ट्रेलिया	ŏsṭreliyā	ŏsṭreliyā		
-- Failed	च्या	cā	cyā	2	
-- Failed	तुझ्या	tujhā	tujhyā	5	
-- Failed	चार	ċār	cār	1	
-- Passed	चार	cār	cār		
-- Failed	काचा	kāċā	kācā	3	
-- Passed	काचा	kācā	kācā		
-- Failed	चराचर	ċarāċar	carācar	1	
-- Passed	चराचर	carācar	carācar		
-- Failed	जप	j̈ap	jap	2	
-- Passed	जप	jap	jap		
-- Failed	मोजणे	moj̈ṇe	mojṇe	4	
-- Failed	लाज	lāj̈	lāj	4	
-- Failed	झकझक	j̈hakj̈hak	jhakjhak	2	
-- Passed	झकझक	jhakjhak	jhakjhak		
-- Failed	झापड	j̈hāpaḍ	jhāpaḍ	2	
-- Passed	झापड	jhāpaḍ	jhāpaḍ		
-- Failed	झीज	jhīj̈	jhīj	5	
-- Failed	चीज	cīj̈	cīj	4	
-- -- Unit tests for [[Module:mr-translit]]. Refresh page to run tests.
-- local tests = require('Module:UnitTests')
-- local mr_translit = require('Module:mr-translit')

-- --TO DO
-- function tests:do_test_translit(deva, roman, comment)
-- 	self:equals(
-- 		'<span class="Deva" lang="mr">[[' .. deva .. '#Marathi|' .. deva .. ']]</span>',
-- 		mr_translit.tr(deva, 'mr', 'Deva'),
-- 		roman,
-- 		{ comment = comment })
-- end

-- function tests:test_translit_marathi()
-- 	local examples = {
-- 	--Fundamental tests
-- 		{ 'भारत', 'bhārat' }, 
-- 		{ 'मराठी', 'marāṭhī' }, 
	
-- 	--Homorganic nasal assimilation 
-- 		{ 'गंगा', 'gaṅgā', "anusvara before ग' is its homorganic nasal ('ṅ')" },
-- 		{ 'लंड', 'laṇḍ' }, --anusvara before 'ड' is its homorganic nasal ('ṇ') 
-- 		{ 'कंबल', 'kambal' }, --anusvara before 'ब' is its homorganic nasal ('m')
	
-- 	--The following two categories could be problematic since they could interfere with cases without schwa deletion
-- 	--such as English borrowings (ऑगस्ट)
-- 	--Word-final consonant clusters with no schwa deletion
-- 		{ 'रक्त', 'rakta' }, 
-- 		{ 'काव्य', 'kāvya' }, --य-final is a subcase
	
-- 	--Word-final nasal assimilation consonant clusters with no schwa deletion (where nasal is न)
-- 		{ 'मंद', 'manda' }, --Sanskrit borrowing
-- 		{ 'उंच', 'unċa', 'ċ'}, 
	
-- 	--Tests individual letters
-- 		{ 'कृपा', 'krupā', [=[‘ऋ’ is ‘ru’, [[कृपा]] has a Wiktionary entry]=] },
-- 		{ 'ज्ञान', 'dnyān' }, --‘ज्ञ’ is ‘dnya’ (even word initially such as Dnyaneshwar)
	
-- 	--Eyelash र
-- 		{ 'ऱ्हास', 'rhās' }, 
-- 		{ 'दऱ्या', 'darya' }, --‘दऱ्या’ is the plural of ‘दरी’
-- 		{ 'दर्या', 'darya' }, 
	
-- 	--Ensures औ and ऐ remain diphthongs
-- 		{ 'कैरी', 'kairī' }, --‘ऐ’ is a diphthong
-- 		{ 'हौस', 'haus' }, --‘औ’ is a diphthong
	
-- 	--Anusvāra before र, श, ष, स: Provincial Class
-- 		{ 'संरक्षण', 'saurakṣaṇ' }, --Anusvāra transliterated before र is ‘u’
-- 		{ 'संशय', 'sanśay' }, 
-- 		{ 'दंष्ट्र', 'danṣṭra' }, --Word-final ‘a’
-- 		{ 'हंस', 'hans' }, 
	
-- 	--Anusvāra before य, ल, व: Classical Class
-- 		{ 'संयोग', 'saiyog' }, --Anusvāra transliterated before य is ‘i’
-- 		{ 'संलग्न', 'saulagna' }, --Anusvāra transliterated before ल is ‘u’ + Word-final ‘a’
-- 		{ 'संवाद', 'sauvād' }, --Anusvāra is transliterated before व is ‘u’
	
-- 	--Anusvāra: Other
-- 		{ 'सिंह', 'siṅha' }, --Anusvāra before ‘ह’ and after ‘इ’ + Word-final ‘a’
-- 		{ 'संहार', 'saṅhār' }, --Anusvāra before ‘ह’
-- 		{ 'संज्ञा', 'sandnyā' }, --Anusvāra before ‘ज्ञ’
-- 		{ 'माझं', 'mājha' }, --Anusvara to stop schwa dropping
	
-- 	--English borrowings
-- 		{ 'बॅट', 'bĕṭ' }, --‘ ॅ‘ is IPA /æ/ (बॅट = bat)
-- 		{ 'बँक', 'bĕṅk' }, -- ‘ँ’ = ‘ॅ’ + ‘ं’, chandrabindu is never used as in Hindi
-- 	                                      --Rurally ‘ॅ’ is ‘yā’, so बँक becomes ‘byāṅk’
-- 		{ 'ॲप', 'ĕp' }, --Independent form of ‘ ॅ‘ (ॲप = app)
-- 		{ 'ऍप', 'ĕp' }, --Another independent form of ‘ ॅ‘ (ऍप = app)
-- 		{ 'कॉट', 'kŏṭ' }, --‘ॉ‘ is IPA /ɔ/ (कॉट = cot), RP ‘ɒ’ and ‘ɔ’ are both represented with ‘ॉ‘
-- 	                                      --Rurally ‘ॉ‘ is ‘ā’, so डॉकटर becomes ‘ḍākṭar’
-- 		{ 'हाँग काँग', 'hŏṅg kŏṅg' }, --‘ॉ’ = ‘ॉ’ + ‘ं (हाँग काँग = Hong Kong)
-- 		{ 'ऑस्ट्रेलिया', 'ŏsṭreliyā' }, --Independent form of ‘ ॉ‘ (ऑस्ट्रेलिया = Australia)
	    
-- 	--The remaining tests concern: c and ċ, j and j̈, jh and j̈h
-- 	--य denotes palatalisation and has no independent realisation (Perhaps this should be in Mod:mr-IPA instead)
-- 		{ 'च्या', 'cā' }, --‘ċ’ palatalised to ‘c’ in genitive oblique
-- 		{ 'तुझ्या', 'tujhā' }, --‘j̈h’ palatalised to ‘jh’ in genitive oblique
	
-- 	--च word-initial minimal pair
-- 		{ 'चार', 'ċār' }, --Word-initial voiceless alveolar affricate, ‘चार’ means ‘four’
-- 		{ 'चार', 'cār' }, --Word-initial voiceless palato-alveolar affricate, ‘चार’ means ‘graze’ or ‘young green grass’
	
-- 	--च word-medial minimal pair
-- 		{ 'काचा', 'kāċā' }, --Word-medial voiceless alveolar affricate, ‘काचा’ is the plural form of ‘काच’ kāċ, which means ‘glass’
-- 		{ 'काचा', 'kācā' }, --Word-medial voiceless palato-affricate, ‘काचा’ means ‘button-hole’ or ‘tuck’
	
-- 	--च word-initial and word-medial minimal pair
-- 		{ 'चराचर', 'ċarāċar' }, --Word-medial voiceless alveolar affricate, ‘चराचर’ is an onomatopoeia that means ‘tearing sound’ or ‘rapidly’
-- 		{ 'चराचर', 'carācar' }, --Word-medial voiceless palato-affricate, ‘चराचर’ means ‘every created thing, animate or inanimate‘
	
-- 	--ज word-initial minimal pair
-- 		{ 'जप', 'j̈ap' }, --Word-initial voiced alveolar affricate, ‘जप’ is an imperative that means ‘be careful’
-- 		{ 'जप', 'jap' }, --Word-initial voiced palato-affricate, ‘जप’ means ‘counting beads’
	
-- 	--ज alveolar affricate word-medial
-- 		{ 'मोजणे', 'moj̈ṇe' }, --Word-medial voiced alveolar affricate
	
-- 	--ज alveolar affricate word-final
-- 		{ 'लाज', 'lāj̈' }, --Word-final voiced alveolar affricate
		
-- 	--झ word-initial and word-medial two minimal pairs
-- 		{ 'झकझक ', 'j̈hakj̈hak' }, --Word-initial and word-medial breathy-voiced alveolar affricate, means ‘bright light’
-- 		{ 'झकझक', 'jhakjhak' }, --Word-initial and word-medial breathy-voiced palato-alveolar affricate, means ‘complaining’
-- 		{ 'झापड', 'j̈hāpaḍ' }, --Word-initial and word-medial breathy-voiced alveolar affricate, means ‘drowsiness’
-- 		{ 'झापड', 'jhāpaḍ' }, --Word-initial and word-medial breathy-voiced palato-alveolar affricate, means ‘slap’
	
-- 	--One alveolar affricate and one palato-alveolar affricate in a single word
-- 		{ 'झीज', 'jhīj̈' }, --‘झीज’ means ‘erosion’, see Wiktionary entry for ‘झिजणे’
-- 		{ 'चीज', 'cīj̈' }, --‘चीज’ means ‘thing’, see Wiktionary entry for ‘चीज़’
-- 	}
	
-- 	self:iterate(examples, 'do_test_translit')
-- end
 
-- return tests