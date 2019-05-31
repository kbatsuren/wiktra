-- This module will transliterate Cree language text. 
-- It is also used to transliterate Southern East Cree (crj) and Northern East Cree (crl).
-- Language code: crj and crl

local export = {}

function export.tr(text, lang, sc)
	text = require("Module:Cans-translit").tr(text, lang, sc)
	text = mw.ustring.gsub(text,"ī","ii")
	text = mw.ustring.gsub(text,"ō","oo")
	text = mw.ustring.gsub(text,"ā","aa")
	text = mw.ustring.gsub(text,"š","sh")
	text = mw.ustring.gsub(text,"ð","th")
	return text
end

function export.transcribe(text)
	local replace = {"sh","th","hk","kw","sk"}
	local s = "ᐁᐃᐅᐊᐯᐱᐳᐸᑌᑎᑐᑕᑫᑭᑯᑲᒉᒋᒍᒐᒣᒥᒧᒪᓀᓂᓄᓇᓭᓯᓱᓴᔦᔨᔪᔭᖊᖋᖌᖍᕃᕆᕊᕍᔐᔑᔓᔕᕓᕕᕗᕙᘚᘛᘕᘔᓓᓕᓗᓚ"
	local s_tr1 = "0ptkcmnsyrl1f2z"
	local s_tr2 = "eioa"
	local w = "ᐍᐏᐓᐘᐻᐽᑁᑅᑘᑚᑞᑢᑵᑷᑻᑿᒓᒕᒙᒝᒭᒯᒳᒷᓊ ᓌ ᓷᓹᓽᔁᔰᔲᔶᔺᔘᔚᔞᔢᓝᓟᓣᓧ"
	local w_tr1 = "0ptkcmnsyrz"
	local w_tr2 = "eioa"
	local l = "ᐄᐆᐋᐲᐴᐹᑏᑑᑖᑮᑰᑳᒌᒎᒑᒦᒨᒫᓃᓅᓈᓰᓲᓵᔩᔫᔮᕇᕋᕎᔒᔔᔖᕖᕘᕚᓖᓘᓛᐐᐔᐙ"
	local l_tr1 = "0ptkcmnsyr1flw23"
	local l_tr2 = "īōā"
	local f = "ᐤᐦᕽᑉᑦᒡᒃᒻᓐᔅᔥᔾᓪᕐ‡ᒄᔉ"
	local f_tr = "wh3ptckmns1ylr45"
	text = mw.ustring.gsub(text,"ê","e")
	text = mw.ustring.gsub(text,"u","o")
	text = mw.ustring.gsub(text,"ii","ī")
	text = mw.ustring.gsub(text,"oo","ō")
	text = mw.ustring.gsub(text,"aa","ā")
	text = mw.ustring.gsub(text,"([aeioīōā])(w?[aeioīōā])","%1 0%2")
	text = mw.ustring.gsub(text,"^(w?[aeioīōā])"," 0%1")
	text = mw.ustring.gsub(text," 0","0")
	mw.log(text)
	text = mw.ustring.gsub(
		text,
		"(["..w_tr1.."])w(["..w_tr2.."])",
		function(a, b)
			a = w_tr1:find(a)
			b = w_tr2:find(b)
			local i = a * 4 + b - 4
			return mw.ustring.sub(w, i, i)
		end
	)
	for i = 1, 3 do
		text = mw.ustring.gsub(text, replace[i], tostring(i))
	end
	mw.log(text)
	text = mw.ustring.gsub(
		text,
		"(["..s_tr1.."])(["..s_tr2.."])",
		function(a, b)
			a = s_tr1:find(a)
			b = s_tr2:find(b)
			local i = a * 4 + b - 4
			return mw.ustring.sub(s, i, i)
		end
	)
	text = mw.ustring.gsub(
		text,
		"(["..l_tr1.."])(["..l_tr2.."])",
		function(a, b)
			a = l_tr1:find(a)
			b = l_tr2:find(b)
			local i = a * 3 + b - 3
			return mw.ustring.sub(l, i, i)
		end
	)
	for i=4, 5 do
		text = mw.ustring.gsub(text, replace[i], tostring(i))
	end
	mw.log(text)
	text = mw.ustring.gsub(
		text,
		"(["..f_tr.."])",
		function(a)
			a = f_tr:find(a)
			return mw.ustring.sub(f, a, a)
		end
	)
	return text
end

return export

-- ᐁᔨᐦᑵᐤ: eyihkwew
-- ᐊᐱᑕᐘᐣ: apitawan
-- ᐊᑎᒼ: atim
-- ᐊᓄᑭᐃᑶᑭᑲ: anokiikwikika
-- ᐊᔦᒥᐅᑭᔨᑲ: ayemiokiyika
-- ᐋᒨ: aamoo
-- ᐧᐋᐸᔅᒄ: yaapaskw
-- ᐱᔔ: pishoo
-- ᐴᔒ: pooshii
-- ᐸᔉᐙᐎᒧᐢᑐᐢ: paskwaawimostos
-- ᐸᔦᔱᑲᓂᑭᔨᑲ: payeywikanikiyika
-- ᑭᒋᐊᐱᑕᐘᐣ: kiciapitawan
-- ᑭᒋᐊᓄᑭᐃᑶᑭᑲ: kicianokiikwikika
-- ᑭᒧᓭᐤ: kimosew
-- ᑭᓀᐱᐠ: kinepik
-- ᑳᐦᑳᒎ: kaahkaacoo
-- ᒥᐢᑕᑎᒼ: mistatim
-- ᒥᓂᔥᑎᒄ: minishtikw
-- ᒨᐦᑯᒫᓐ: moohkomaan
-- ᒪᑎᓇᐅᑶᔨᑲ: matinaokwiyika
-- ᒪᔉᐗ: maskwa
-- ᒪᕁᐁᓰᐢ: mahkesiis
-- ᓂᔅᒃ: nisk
-- ᓂᔭ: niya
-- ᓃᐲᔾ: niipiiy
-- ᓇᑭ: naki
-- ᓰᓰᑉ: siisiip
-- aamoo: ᐴᒫ
-- kakwa: ᑲᑿ
-- kisiskāciwani-sīpiy: ᑭᓯᔅᒎᒋᐘᓂ-ᓰᐱᔾ
-- makusue: ᒪᑯᓱᐁ
-- mikisiw: ᒥᑭᓯᐤ
-- miskan: ᒥᔅᑲᓐ
-- naki: ᓇᑭ
-- peepee: ᐯᐁᐯᐁ
-- peepee tsoo: ᐯᐁᐯᐁ ᑦᓵ
-- sawan: ᓴᐘᓐ
-- sīpiy: ᓰᐱᔾ
-- wikowin: ᐏᑯᐏᓐ
-- êyihkwêw: ᐁᔨᐦᑵᐤ
-- local export = {}

-- local result = ""

-- local function add(text)
-- 	result = result .. "* [["..text.."#Cree|"..text.."]]: " .. require("Module:cr-translit").tr(text, "cr", "Cans") .. "\n"
-- end

-- local function dda(text)
-- 	result = result .. "* [["..text.."#Cree|"..text.."]]: " .. require("Module:cr-translit").transcribe(text) .. "\n"
-- end

-- function export.show()
-- 	add("ᐁᔨᐦᑵᐤ")
-- 	add("ᐊᐱᑕᐘᐣ")
-- 	add("ᐊᑎᒼ")
-- 	add("ᐊᓄᑭᐃᑶᑭᑲ")
-- 	add("ᐊᔦᒥᐅᑭᔨᑲ")
-- 	add("ᐋᒨ")
-- 	add("ᐧᐋᐸᔅᒄ")
-- 	add("ᐱᔔ")
-- 	add("ᐴᔒ")
-- 	add("ᐸᔉᐙᐎᒧᐢᑐᐢ")
-- 	add("ᐸᔦᔱᑲᓂᑭᔨᑲ")
-- 	add("ᑭᒋᐊᐱᑕᐘᐣ")
-- 	add("ᑭᒋᐊᓄᑭᐃᑶᑭᑲ")
-- 	add("ᑭᒧᓭᐤ")
-- 	add("ᑭᓀᐱᐠ")
-- 	add("ᑳᐦᑳᒎ")
-- 	add("ᒥᐢᑕᑎᒼ")
-- 	add("ᒥᓂᔥᑎᒄ")
-- 	add("ᒨᐦᑯᒫᓐ")
-- 	add("ᒪᑎᓇᐅᑶᔨᑲ")
-- 	add("ᒪᔉᐗ")
-- 	add("ᒪᕁᐁᓰᐢ")
-- 	add("ᓂᔅᒃ")
-- 	add("ᓂᔭ")
-- 	add("ᓃᐲᔾ")
-- 	add("ᓇᑭ")
-- 	add("ᓰᓰᑉ")
-- 	dda("aamoo")
-- 	dda("kakwa")
-- 	dda("kisiskāciwani-sīpiy")
-- 	dda("makusue")
-- 	dda("mikisiw")
-- 	dda("miskan")
-- 	dda("naki")
-- 	dda("peepee")
-- 	dda("peepee tsoo")
-- 	dda("sawan")
-- 	dda("sīpiy")
-- 	dda("wikowin")
-- 	dda("êyihkwêw")
-- 	return result
-- end

-- return export