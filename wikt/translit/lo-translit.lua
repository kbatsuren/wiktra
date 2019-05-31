-- This module will transliterate Lao language text per the LC (Library of Congress) scheme.

local export = {}
local gsub = mw.ustring.gsub
local len = mw.ustring.len
local match = mw.ustring.match
local sub = mw.ustring.sub

local initial_conv = {
	["ກ"] = "k", ["ຂ"] = "kh", ["ຄ"] = "kh", ["ງ"] = "ng", 
	["ຈ"] = "ch", ["ສ"] = "s", ["ຊ"] = "s", ["ຍ"] = "ny", 
	["ດ"] = "d", ["ຕ"] = "t", ["ຖ"] = "th", ["ທ"] = "th", ["ນ"] = "n", 
	["ບ"] = "b", ["ປ"] = "p", ["ຜ"] = "ph", ["ຝ"] = "f", ["ພ"] = "ph", ["ຟ"] = "f", ["ມ"] = "m", 
	["ຢ"] = "y", ["ຣ"] = "r", ["ລ"] = "l", ["ວ"] = "w",
	["ຫ"] = "h", ["ອ"] = "’", ["ຮ"] = "h",
	
	["ຫງ"] = "ng",
	["ຫຍ"] = "ny",
	["ໜ"] = "n", ["ຫນ"] = "n", 
	["ໝ"] = "m", ["ຫມ"] = "m",
	["ຫຼ"] = "r", ["ຫຣ"] = "r",
	["ຫຼ"] = "l", ["ຫລ"] = "l",
	["ຫວ"] = "w"
}

local vowel_conv = {
	["ະ"] = "a", ["ັ"] = "a", 
	["ິ"] = "i", 
	["ຶ"] = "ư", ["ຸ"] = "u", 
	["ເະ"] = "e", ["ເັ"] = "e", 
	["ແະ"] = "æ", ["ແັ"] = "æ", 
	["ໂະ"] = "o", ["ົ"] = "o", 
	["ເາະ"] = "ǫ", ["ັອ"] = "ǫ", 
	["ເິ"] = "œ", 
	["ເັຍ"] = "ia", ["ັຽ"] = "ia", 
	["ເຶອ"] = "ưa", 
	["ົວະ"] = "ua", ["ັວ"] = "ua", ["ວັ"] = "ua",
	["ໄ"] = "ai", ["ໃ"] = "ai", ["ັຍ"] = "ai", 
	["ເົາ"] = "ao", 
	["ົາວ"] = "uau",
	["ຳ"] = "am", ["ໍາ"] = "am", 
	["ວຳ"] = "uam",
	
	["າ"] = "ā", 
	["າວ"] = "āo", 
	["ີ"] = "ī", 
	["ື"] = "ư̄", 
	["ູ"] = "ū", 
	["ເ"] = "ē", 
	["ແ"] = "ǣ", 
	["ໂ"] = "ō", 
	["ໂຍ"] = "ōi", ["ໂຽ"] = "ōi",
	["ໍ"] = "ǭ", ["ອ"] = "ǭ", 
	["ອຍ"] = "ǭi", ["ອຽ"] = "ǭi",
	["ເີ"] = "œ̄", 
	["ເີຽ"] = "œ̄i", ["ເີຍ"] = "œ̄i",
	["ເຍ"] = "īa", ["ເັຽ"] = "īa", ["ຽ"] = "īa", 
	["ເືອ"] = "ư̄a", 
	["ົວ"] = "ūa", ["ວ"] = "ūa", 
	["ວຍ"] = "uāi", ["ວຽ"] = "uāi", ["ວຽນ"] = "uīan",
	["າຍ"] = "āi", ["າຽ"] = "āi",
	["ວາ"] = "uā",
	["ວາຍ"] = "uāi", ["ວາຽ"] = "uāi",
	["ແວ"] = "ǣu", -- ແ_ວ can bo both ǣu and uǣ. The first is more common.
	["ີວ"] = "īu", ["ິວ"] = "iu",
	["ຽວ"] = "iāu",
	["ວີວ"] = "uīu",
}

local coda_conv = {
	["ກ"] = "k", ["ຂ"] = "k", ["ຄ"] = "k", 
	["ງ"] = "ng", 
	["ຈ"] = "t", ["ສ"] = "t", ["ຊ"] = "t", 
	["ຍ"] = "ny", 
	["ດ"] = "t", ["ຕ"] = "t", ["ຖ"] = "t", ["ທ"] = "t", 
	["ນ"] = "n", 
	["ບ"] = "p", ["ປ"] = "p", ["ຜ"] = "p", ["ຝ"] = "p", ["ພ"] = "p", ["ຟ"] = "p", 
	["ມ"] = "m", 
	["ຢ"] = "y", 
	["ຣ"] = "n", ["ລ"] = "n", 
	["ວ"] = "w",
	[""] = "",
}

local sp_symbols = {
	["ຯ"] = "〃", ["ໆ"] = "〃",
	["໌"] = "",
	["໐"] = "0", ["໑"] = "1", ["໒"] = "2", ["໓"] = "3", ["໔"] = "4",
	["໕"] = "5", ["໖"] = "6", ["໗"] = "7", ["໘"] = "8", ["໙"] = "9"
}

local char_type = {
	['ກ'] = 'coda',	['ຂ'] = 'coda',	['ຄ'] = 'coda',	['ງ'] = 'coda',
	['ຈ'] = 'coda',	['ຊ'] = 'coda',	['ຍ'] = 'ambig',
	['ດ'] = 'coda',	['ຕ'] = 'coda',	['ຖ'] = 'coda',	['ທ'] = 'coda',	['ນ'] = 'coda',
	['ບ'] = 'coda',	['ປ'] = 'coda',	['ຜ'] = 'coda',	['ຝ'] = 'coda',	['ພ'] = 'coda',	['ຟ'] = 'coda',	['ມ'] = 'coda',
	['ຢ'] = 'coda',	['ຣ'] = 'coda',	['ລ'] = 'coda',	['ວ'] = 'ambig',
	['ສ'] = 'coda',	['ຫ'] = 'cons',	['ອ'] = 'ambig', ['ຮ'] = 'cons',
	['ຯ'] = 'iter_symbol',
	['ະ'] = 'vowel_let', ['ັ'] = 'suf_vowel', ['າ'] = 'vowel_let', ['ຳ'] = 'suf_vowel',
	['ິ'] = 'suf_vowel', ['ີ'] = 'suf_vowel', ['ຶ'] = 'suf_vowel', ['ື'] = 'suf_vowel',
	['ຸ'] = 'suf_vowel', ['ູ'] = 'suf_vowel', ['ົ'] = 'suf_vowel',
	['ຼ'] = 'cons',
	['ຽ'] = 'vowel_let',
	['ເ'] = 'pref_vowel', ['ແ'] = 'pref_vowel',
	['ໂ'] = 'pref_vowel', ['ໃ'] = 'pref_vowel', ['ໄ'] = 'pref_vowel',
	['ໆ'] = 'iter_symbol',
	['່'] = 'tone', ['້'] = 'tone', ['໊'] = 'tone', ['໋'] = 'tone',
	['໌'] = 'canc_symbol', ['ໍ'] = 'suf_vowel',
	['໐'] = 'number', ['໑'] = 'number', ['໒'] = 'number', ['໓'] = 'number', ['໔'] = 'number',
	['໕'] = 'number', ['໖'] = 'number', ['໗'] = 'number', ['໘'] = 'number', ['໙'] = 'number',
	['ໜ'] = 'cons', ['ໝ'] = 'cons'
}

function export.tr(text, lang, sc, debug_mode)
	text = gsub(text, '[່້໊໋​]', '')

	for lao_text in mw.ustring.gmatch(text, '[ກ-ໝ]+') do
		local word, c, chartype, output = {}, {}, {}, {}
		local curr_word, curr_initial, curr_vowel, curr_coda = {}, {}, {}, {}
		local i = 1
		local original_text = lao_text
		
		for i = 1, len(lao_text) do
			c[i] = sub(lao_text, i, i)
			chartype[i] = char_type[c[i]] or table.insert(word, c[i])
		end
	
		for i = 1, #c + 1 do
			if chartype[i] == 'pref_vowel' or i == #c + 1 then
				if #curr_word ~= 0 then
					table.insert(word, table.concat(curr_word))
					curr_word, curr_initial, curr_vowel, curr_coda = {c[i]}, {}, {c[i]}, {}
				else
					table.insert(curr_vowel, c[i])
					table.insert(curr_word, c[i])
				end
				
			elseif chartype[i] == 'suf_vowel' then
				table.insert(curr_vowel, c[i])
				table.insert(curr_word, c[i])
				
			elseif chartype[i] == 'ambig' then
				if #curr_initial ~= 0 and vowel_conv[table.concat(curr_vowel)..c[i]] and (chartype[i+1] ~= 'suf_vowel' or match(c[i+1], '[ໍຳີັ]')) and #curr_coda == 0 then
					table.insert(curr_vowel, c[i])
					table.insert(curr_word, c[i])
				elseif (#curr_initial == 0 and char_type[table.concat(curr_vowel)] == 'pref_vowel') or (#curr_initial ~= 0 and initial_conv[table.concat(curr_initial)..c[i]]) then
					table.insert(curr_initial, c[i])
					table.insert(curr_word, c[i])
				else
					if #curr_word ~= 0 then
						table.insert(word, table.concat(curr_word))
					end
					curr_word, curr_initial, curr_vowel, curr_coda = {c[i]}, {c[i]}, {}, {}
				end
			
			elseif chartype[i] == 'vowel_let' then
				table.insert(curr_vowel, c[i])
				table.insert(curr_word, c[i])
		
			elseif chartype[i] == 'coda' and #curr_coda == 0 and #curr_initial ~= 0 and chartype[i+1] ~= 'suf_vowel' and chartype[i+1] ~= 'vowel_let' and not (chartype[i+1] == 'ambig' and match(chartype[i+2] or '', 'co')) and table.concat(curr_vowel) ~= "ວີວ" then
				table.insert(curr_coda, c[i])
				table.insert(curr_word, c[i])

			elseif chartype[i] == 'cons' or chartype[i] == 'coda' then
				if #curr_coda == 0 and initial_conv[table.concat(curr_initial)..c[i]] and (#curr_vowel == 0 or char_type[table.concat(curr_vowel)] == 'pref_vowel') then
					table.insert(curr_initial, c[i])
					table.insert(curr_word, c[i])
				else
					table.insert(word, table.concat(curr_word))
					curr_word, curr_initial, curr_vowel, curr_coda = {c[i]}, {c[i]}, {}, {}
				end
			
			elseif chartype[i] == 'iter_symbol' then
				if #curr_word ~= 0 then
					table.insert(word, table.concat(curr_word))
				end
				curr_word, curr_initial, curr_vowel, curr_coda = {c[i]}, {}, {}, {}
		
			elseif chartype[i] == 'canc_symbol' then
				table.insert(curr_word, c[i])
		
			elseif chartype[i] == 'number' then
				table.insert(curr_word, sp_symbols[c[i]])
			end
		end
		for i = 1, #word do
			word[i] = gsub(word[i], '^([ເແໂໄໃຽ]?)(ຫ?[ກຂຄງຈສຊຍດຕຖທນບປຜຝພຟມຢຣລວຫອຮໜໝ]ຼ?)([^໌]*)(໌?)$', function(a, b, c, e)
				if match(sub(c, -1, -1), '[ກຂຄງຈສຊຍດຕຖທນບປຜຝພຟມຢຣລວ]') then
					d = sub(c, -1, -1)
					c = sub(c, 1, -2)
				else
					d = ''
				end
				if a..c == '' then
					c = 'ະ'
				end
				vowel = vowel_conv[a..c..d] or (vowel_conv[a..c] or a .. c) .. (coda_conv[d] or d)
				if match(vowel, '[ກ-ໝ]') then
					vowel = gsub(vowel, '^(.*)([ຍອວ])(.*)$', function(x, y, z)
						return (vowel_conv[x] or x) .. ' ' .. (initial_conv[y] or y) .. (vowel_conv[z] or z) end)
				end
				return (initial_conv[b] or b) .. vowel .. e end)
			
			if char_type[word[i]] == 'iter_symbol' and i >= 2 then
				word[i] = '<small><u>' .. word[i-1] .. '</u></small>'
			end
		
			if match(word[i], '໌') and len(word[i]) > 1 then
				word[i] = gsub(word[i], '(.)໌', '<small><del>%1</del></small>')
			end
			
			table.insert(output, word[i])
		end
		lao_text = table.concat(output, " ")
		lao_text = gsub(lao_text, '.', sp_symbols)
	
		text = gsub(text, original_text, lao_text)
	end

	if match(text, '[ກ-ໝ]') and not debug_mode then
		return nil
	else
		return text
	end
end

return export


-- Text	Expected	Actual	Differs at
-- Failed	ຫວຍ	hūai	wany	1
-- Failed	ອາຫານວ່າງ	’ā hān wāng	’ā hານ wā nga	5
-- Failed	ກິໂລກຼາມ	ki lō krām	ki lōk ຼາມ	6
-- Failed	ອຸບັດເຫດ	’u bat hēt	’u bat ຫດē	8
-- Failed	ຫອຍນ້ຳຈືດ	hǭi nam chư̄t	ຫອany nam chư̄t	1
-- Failed	ຫອຍ	hǭi	ຫອany	1
-- Failed	ຫອຽ	hǭi	ຫອīa	1
-- Failed	ກະໂຫລກ	ka lōk	ka lō ka	6
-- Passed	ມາເຊດວນ	mā sē dūan	mā sē dūan	
-- Failed	ຄຸຍ	khui	khu nya	4
-- Passed	ແລ້ວ	lǣu	lǣu	
-- Passed	ຮ້ອຽແກ້ວ	hǭi kǣu	hǭi kǣu	
-- Failed	ເຂົ້າຈີ່ຝຣັ່ງ	khao chī fa rang	khao chīp rang	9
-- Failed	ຫວຍທວາຍ	hūai thuāi	wຍທ wā nya	1
-- Failed	ການປະຕິວັດ	kān pa ti wat	kān pa ti wັt	12
-- Passed	ດ້າຽ	dāi	dāi	
-- Failed	ກາບຫອຍທະເລ	kāp hǭi tha lē	kāp ຫອany tha lē	5
-- Failed	ຄາວຽກ	khā wīak	khā wຽk	6
-- Failed	ເຂົ້າຊອຍ	khao sǭi	khaot ’a nya	5
-- Passed	ຂາຽ	khāi	khāi	
-- Failed	ຫ້ອງ	hǭng	ຫອang	1
-- Failed	ຫອຍນາງລົມ	hǭi nāng lom	ຫອany nāng lom	1
-- Passed	ຄວາຍ	khuāi	khuāi	
-- Failed	ອຸບັດເຫດ	’u bat hēt	’u bat ຫດē	8
-- Failed	ເປືອຍ	pư̄ai	pư̄a nya	5
-- Passed	ແຈ່ວບອງ	chǣu bǭng	chǣu bǭng	
-- Failed	ແຫ້ງ	hǣng	ngǣ	1
-- Failed	ສົງກຣານ	song krān	song ka rān	7
-- Passed	ອິ່ມແລ້ວ	’im lǣu	’im lǣu	
-- Failed	ນິວັດ	ni wat	ni wັt	5
-- Passed	ແນວໃດ	nǣu dai	nǣu dai	
-- Passed	ໝໍປົວແຂ້ວ	mǭ pūa khǣu	mǭ pūa khǣu	
-- Failed	ແຫນງ	nǣng	nǣ nga	3
-- Passed	ແກ້ວ	kǣu	kǣu	
-- Failed	ຕຸ້ຍ	tui	tu nya	3
-- Failed	ຫນ່ອຍ	nǭi	na ’a nya	2
-- Failed	ຫ້ອງເຢັນ	hǭng yen	ຫອang yen	1
-- Passed	ອານຸສາວະລີ	’ā nu sā wa lī	’ā nu sā wa lī	
-- Passed	ກ້ວຍ	kuāi	kuāi	
-- Passed	ເວັບເບຣົາວ໌ເຊີຣ໌	wep bē ruau sœ̄n	wep bē ruau sœ̄n	
-- Failed	ແຂວງ	khuǣng	khǣung	3
-- Passed	ຍ່ອຽ	nyǭi	nyǭi	
-- Passed	ກີ່ວ	kīu	kīu	
-- Passed	ກົວລາລໍາເປີ	kūa lā lam pœ̄	kūa lā lam pœ̄	
-- Passed	ສະຫະລັດອະເມລິກາ	sa ha lat ’a mē li kā	sa ha lat ’a mē li kā	
-- Passed	ປະເທດອິນເດຍ	pa thēt ’in dīa	pa thēt ’in dīa	
-- Passed	ສຍາມ	sa nyām	sa nyām	
-- Passed	ການເມືອງ	kān mư̄ang	kān mư̄ang	
-- Passed	ຊົນນະບົດ	son na bot	son na bot	
-- Passed	ທິດຕາເວັນອອກ	thit tā wen ’ǭk	thit tā wen ’ǭk	
-- Passed	ທະນາຄານ	tha nā khān	tha nā khān	
-- Passed	ຄວາມໝາຍ	khuām māi	khuām māi	
-- Passed	ພະໂພທິສັດ	pha phō thi sat	pha phō thi sat	
-- Passed	ທາງຫຼວງ	thāng lūang	thāng lūang	
-- Passed	ມຶງ	mưng	mưng	
-- Passed	ເຂົາ	khao	khao	
-- Passed	ເຂືອ	khư̄a	khư̄a	
-- Passed	ຂ້ອຍ	khǭi	khǭi	
-- Passed	ກວຽນ	kuīan	kuīan	
-- Passed	ກະດານ	ka dān	ka dān	
-- Passed	ຈະເຣີນອາຫານ	cha rœ̄n ’ā hān	cha rœ̄n ’ā hān	
-- Passed	ເຈົ້າ	chao	chao	
-- Passed	ໃນ​ເວ​ລາ​ທີ່	nai wē lā thī	nai wē lā thī	
-- Passed	ໂຮງຫັດຖະກັມ	hōng hat tha kam	hōng hat tha kam	
-- Passed	ການ​ຕໍ່​ສູ້​ກັບ	kān tǭ sū kap	kān tǭ sū kap	
-- Passed	ພາສາໄຕ	phā sā tai	phā sā tai	
-- Passed	ພາສາລາວສືບທອດມາຈາກ	phā sā lāo sư̄p thǭt mā chāk	phā sā lāo sư̄p thǭt mā chāk	
-- Passed	ຢູ່ພາກໃຕ້ຂອງຈີນເຊິ່ງເປັນຈຸດດັ່ງເດີມຂອງຫຼາຍພາສາຕ່າງໆ	yū phāk tai khǭng chīn sœng pen chut dang dœ̄m khǭng lāi phā sā tāng tāng	yū phāk tai khǭng chīn sœng pen chut dang dœ̄m khǭng lāi phā sā tāng tāng	
-- Passed	ທີ່ຍັງໃຊ້ແລະເວົ້າຢູ່ໂດຍຫຼາຍຊົນເຜົ່າ	thī nyang sai læ wao yū dōi lāi son phao	thī nyang sai læ wao yū dōi lāi son phao	
-- Failed	ເນື່ອງຈາກຖືກຄວາມກົດດັນຈາກການຂະຫຍາຍຕົວຂອງອານາຈັກຈີນ	nư̄ang chāk thư̄k khuām kot dan chāk kān kha gnāi tūa khǭng ’ā nā chak chīn	nư̄ang chāk thư̄k khuām kot dan chāk kān kha nyāi tūa khǭng ’ā nā chak chīn	46
-- Passed	ວຽງຈັນ	wīang chan	wīang chan	
-- Passed	ວຽງຈັນທນ໌	wīang chan than	wīang chan than	
-- Passed	ລັດເຊັຽ	lat sīa	lat sīa	
-- Passed	໌			
-- Passed	ຯ	〃	〃	
-- local tests = require('Module:UnitTests')
-- local lo_translit = require('Module:lo-translit')
 
-- function tests:check_tr(Laoo, Latn)
-- 	return self:equals(('<span class="Laoo" lang="lo">[[%s#Lao|%s]]</span>'):format(Laoo, Laoo), lo_translit.tr(Laoo, 'lo', 'Laoo', true), Latn)
-- end

-- function tests:test_translit()
-- 	local examples = {
-- 		{ "ຫວຍ", "hūai" },
-- 		{ "ອາຫານວ່າງ", "’ā hān wāng" },
-- 		{ "ກິໂລກຼາມ", "ki lō krām" },
-- 		{ "ອຸບັດເຫດ", "’u bat hēt" },
-- 		{ "ຫອຍນ້ຳຈືດ", "hǭi nam chư̄t" },
-- 		{ "ຫອຍ", "hǭi" },
-- 		{ "ຫອຽ", "hǭi" },
-- 		{ "ກະໂຫລກ", "ka lōk" },
-- 		{ "ມາເຊດວນ", "mā sē dūan" },
-- 		{ "ຄຸຍ", "khui" },
-- 		{ "ແລ້ວ", "lǣu" },
-- 		{ "ຮ້ອຽແກ້ວ", "hǭi kǣu" },	
-- 		{ "ເຂົ້າຈີ່ຝຣັ່ງ", "khao chī fa rang" },
-- 		{ "ຫວຍທວາຍ", "hūai thuāi" },	
-- 		{ "ການປະຕິວັດ", "kān pa ti wat" },
-- 		{ "ດ້າຽ", "dāi" },
-- 		{ "ກາບຫອຍທະເລ", "kāp hǭi tha lē" },
-- 		{ "ຄາວຽກ", "khā wīak" },
-- 		{ "ເຂົ້າຊອຍ", "khao sǭi" },
-- 		{ "ຂາຽ", "khāi" },
-- 		{ "ຫ້ອງ", "hǭng" },
-- 		{ "ຫອຍນາງລົມ", "hǭi nāng lom" },
-- 		{ "ຄວາຍ", "khuāi" },
-- 		{ "ອຸບັດເຫດ", "’u bat hēt" },
-- 		{ "ເປືອຍ", "pư̄ai" },
-- 		{ "ແຈ່ວບອງ", "chǣu bǭng" },
-- 		{ "ແຫ້ງ", "hǣng" },
-- 		{ "ສົງກຣານ", "song krān" },
-- 		{ "ອິ່ມແລ້ວ", "’im lǣu" },
-- 	--	{ "ຄືນຫລັໍງ", "khư̄n lang" },
-- 		{ "ນິວັດ", "ni wat" },
-- 		{ "ແນວໃດ", "nǣu dai" },
-- 		{ "ໝໍປົວແຂ້ວ", "mǭ pūa khǣu" },
-- 		{ "ແຫນງ", "nǣng" },
-- 		{ "ແກ້ວ", "kǣu" },
-- 		{ "ຕຸ້ຍ", "tui" },
-- 		{ "ຫນ່ອຍ", "nǭi" },
-- 		{ "ຫ້ອງເຢັນ", "hǭng yen" },
-- 		{ "ອານຸສາວະລີ", "’ā nu sā wa lī" },
-- 		{ "ກ້ວຍ", "kuāi" },
-- 		{ "ເວັບເບຣົາວ໌ເຊີຣ໌", "wep bē rua<small><del>u</del></small> sœ̄<small><del>n</del></small>" },
-- 		{ "ແຂວງ", "khuǣng" },
-- 	  	{ "ຍ່ອຽ", "nyǭi" },
-- 	 	{ "ກີ່ວ", "kīu" },
-- 		{ "ກົວລາລໍາເປີ", "kūa lā lam pœ̄" },
-- 		{ "ສະຫະລັດອະເມລິກາ", "sa ha lat ’a mē li kā" },
-- 		{ "ປະເທດອິນເດຍ", "pa thēt ’in dīa" },
-- 		{ "ສຍາມ", "sa nyām" },
-- 		{ "ການເມືອງ", "kān mư̄ang" },
-- 		{ "ຊົນນະບົດ", "son na bot" },
-- 		{ "ທິດຕາເວັນອອກ", "thit tā wen ’ǭk" },
-- 		{ "ທະນາຄານ", "tha nā khān" },
-- 		{ "ຄວາມໝາຍ", "khuām māi" },
-- 		{ "ພະໂພທິສັດ", "pha phō thi sat" },
-- 		{ "ທາງຫຼວງ", "thāng lūang" },
-- 		{ "ມຶງ", "mưng" },
-- 		{ "ເຂົາ", "khao" },
-- 		{ "ເຂືອ", "khư̄a" },
-- 		{ "ຂ້ອຍ", "khǭi" },
-- 		{ "ກວຽນ", "kuīan" },
-- 		{ "ກະດານ", "ka dān" },
-- 		{ "ຈະເຣີນອາຫານ", "cha rœ̄n ’ā hān" },
-- 		{ "ເຈົ້າ", "chao" },
-- 		{ "ໃນ​ເວ​ລາ​ທີ່", "nai wē lā thī" },
-- 		{ "ໂຮງຫັດຖະກັມ", "hōng hat tha kam" },
-- 		{ "ການ​ຕໍ່​ສູ້​ກັບ", "kān tǭ sū kap" },
-- 		{ "ພາສາໄຕ", "phā sā tai" },	
-- 		{ "ພາສາລາວສືບທອດມາຈາກ", "phā sā lāo sư̄p thǭt mā chāk" },
-- 		{ "ຢູ່ພາກໃຕ້ຂອງຈີນເຊິ່ງເປັນຈຸດດັ່ງເດີມຂອງຫຼາຍພາສາຕ່າງໆ", "yū phāk tai khǭng chīn sœng pen chut dang dœ̄m khǭng lāi phā sā tāng <small><u>tāng</u></small>" },
-- 		{ "ທີ່ຍັງໃຊ້ແລະເວົ້າຢູ່ໂດຍຫຼາຍຊົນເຜົ່າ", "thī nyang sai læ wao yū dōi lāi son phao" },
-- 		{ "ເນື່ອງຈາກຖືກຄວາມກົດດັນຈາກການຂະຫຍາຍຕົວຂອງອານາຈັກຈີນ", "nư̄ang chāk thư̄k khuām kot dan chāk kān kha gnāi tūa khǭng ’ā nā chak chīn" },	
-- 		{ "ວຽງຈັນ", "wīang chan" },
-- 		{ "ວຽງຈັນທນ໌", "wīang chan tha<small><del>n</del></small>" },
-- 		{ "ລັດເຊັຽ", "lat sīa" },		
-- 		{ "໌", "" },
-- 		{ "ຯ", "〃" },
-- 	}
	
-- 	return self:iterate(examples, "check_tr")
-- end

-- return tests