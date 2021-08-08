local M = {}
local gsub = mw.ustring.gsub
local match = mw.ustring.match

local lang = require("languages").getByCode("ko")

-- makes hanjatab automatically
function M.hanjatab()
	local hanja = mw.ustring.gsub(mw.title.getCurrentTitle().text, '[^一-鿌]', '')
		local table_head = '<table class="floatright wikitable" style="text-align:center; font-size:small;"><tr><th colspan="' .. 
		mw.ustring.len(hanja) .. 
		'" style="font-weight:normal;">[[hanja|Hanja]] in this term</th></tr><tr lang="ko" class="Kore" style="font-size:2em; background:white; line-height:1em;">'
	return table_head .. 
		mw.ustring.gsub(hanja, '(.)', '<td style="padding:0.5em;">[[%1#Korean|%1]]</td>') .. 
		'</tr></table>'
end

-- return only non-hangeul contained in text
function M.remove_hangeul(f)
	local nonhangeul = mw.ustring.gsub(f.args[1], '[가-힣]', '')
	return nonhangeul
end

function M.boldify(f)
	local pagename = mw.title.getCurrentTitle().text
	hangul = f.args[1]
	if match(hangul, pagename) and not match(hangul, "'") then
		hangul = gsub(hangul, pagename, "'''" .. pagename .. "'''")
	end
	return hangul
end

function M.usex_hangul(f)
	local pagename = mw.title.getCurrentTitle().text
	hangul = f.args[1]
	if match(hangul, pagename) and not match(hangul, "'") then
		hangul = gsub(hangul, pagename, "'''" .. pagename .. "'''")
	end
	i = 1
	local front, back = '<b>', '</b>'
	for bold in mw.ustring.gmatch(hangul, "'''") do
		hangul = gsub(hangul, "'''", (i % 2 == 1 and front or back), 1)
		i = i + 1
	end
	hangul = gsub(hangul, '[%^%-]', '')
	return hangul
end

function M.link(frame)
	local arg = frame:getParent().args
	local args, distances = {}, {}
	local m_pron = require("ko-translit")
	local curr_distance, closest_match = 1000, 0
	local word, translit, definition, hanja, note = false, false, false, false, false
	
	for i = 1, 4, 1 do
		if arg[i] and arg[i] ~= "" then
			table.insert(args, arg[i])
		end
	end

	local curr_hangul_level, closest_hangul = 0, 0
	for i, parameter in ipairs(args) do
		-- ᄀ-ᇿ is the code point range U+1100-11FF, the Hangul Jamo block.
		-- ㄱ-ㆎ is the code point range U+3131-318E, the Hangul Compatibility Jamo block excluding 3130, 318F.
		local _, tentative_hangul_level = gsub(parameter, "[가-힣ᄀ-ᇿㄱ-ㆎ]", "")
		if tentative_hangul_level > curr_hangul_level then
			curr_hangul_level = tentative_hangul_level
			closest_hangul = i
		end
	end

	if curr_hangul_level > 0 then
		word = args[closest_hangul]
		table.remove(args, closest_hangul)
	end
	
	local function compute_distance(str1, str2)
		local len1, len2 = #str1, #str2
		local char1, char2, distance = {}, {}, {}
		
		str1:gsub('.', function (c)
			table.insert(char1, c) end)
		
		str2:gsub('.', function (c)
			table.insert(char2, c) end)
		
		for i = 0, len1 do
			distance[i] = {}
		end
		
		for i = 0, len1 do
			distance[i][0] = i
		end
		
		for i = 0, len2 do
			distance[0][i] = i
		end
		
		for i = 1, len1 do
			for j = 1, len2 do
				distance[i][j] = math.min(
					distance[i-1][j] + 1,
					distance[i][j-1] + 1,
					distance[i-1][j-1] + (char1[i] == char2[j] and 0 or 1)
				)
			end
		end
	
		return distance[len1][len2]
	end
	
	local m_link = require("links")
	local test_translit = m_pron.tr_revised(m_link.remove_links(word or arg[1])) or ""
	
	if arg[5] and arg[5] ~= "" then
		note = arg[5]
	elseif arg["note"] and arg["note"] ~= "" then
		note = arg["note"]
	end
	
	if arg["gloss"] then
		definition = arg["gloss"]
		arg["gloss"] = nil
	end
	
	for i, parameter in ipairs(args) do
		-- \239\164\128-\239\171\153 is the code point range U+F900-FADF,
		-- the CJK Compatibility Ideographs block.
		if not match(parameter, '[가-힣㐀-䶵一-鿌\239\164\128-\239\171\153𠀀-𯨟]') then
			local tentative_distance = compute_distance(test_translit, parameter)
			if tentative_distance < curr_distance then
				curr_distance = tentative_distance
				closest_match = i
			end
		end
	end

	if curr_distance < 3 and #args > 1 then
		translit = args[closest_match]
		table.remove(args, closest_match)
	end

	for i, parameter in ipairs(args) do
		if match(parameter, "[㐀-䶵一-鿌\239\164\128-\239\171\153𠀀-𯨟]") then
			hanja = parameter
			table.remove(args, i)
		end
	end
	
	if not hanja and not word then
		word = args[1]
		table.remove(args, 1)
	end
	
	if #args > 1 then
		translit = args[1]
		definition = args[2]
	
	elseif #args > 0 then
		if definition then
			translit = args[1]
		else
			definition = args[1]
		end
	end
	
	if hanja and not match(hanja, "[%[%]]") then
		for hanja_word in mw.ustring.gmatch(hanja, "[㐀-䶵一-鿌\239\164\128-\239\171\153𠀀-𯨟]+") do
			hanja = gsub(hanja, hanja_word, "[[" .. hanja_word .. "]]")
		end
		for hangul_word in mw.ustring.gmatch(hanja, "[가-힣]+") do
			hanja = gsub(hanja, hangul_word, "[[" .. hangul_word .. "]]")
		end
		hanja = gsub(hanja, "%[%[%[%[", "[[")
		hanja = gsub(hanja, "%]%]%]%]", "]]")
	end
	
	if arg["tr"] or translit or test_translit then
		translit = '<span lang="ko-Latn" class="mention-tr tr Latn">' .. 
			(arg["tr"] or translit or test_translit) .. "</span>"
	end
	
	if definition then
		if not match(definition, "^''.+''$") then definition = "“" .. definition .. "”" end
	end
	
	if hanja then
		hanja = '<span lang="ko" class="Kore">' .. m_link.language_link({lang = lang, term = hanja}, true) .. '</span>'
	end

	word = gsub(word, "%^", "")
	
	if not match(word, "[%[%]]") then
		if match(word, "^—.+—$") then
			word = gsub(word, "—(.+)—", "—[[%1]]—")
			
		elseif match(word, "^—.+$") then
			word = gsub(word, "—(.+)", "—[[%1]]")
			
		elseif match(word, "^.+—$") then
			word = gsub(word, "(.+)—", "[[%1다|%1—]]")
		
		elseif match(word, "^\*") then
			word = gsub(word, "\*", "")
		
		else
			word = "[[" .. word .. "]]"
		end
	end
	
	local info = {}
	table.insert(info, word and (hanja or nil) or nil)
	table.insert(info, translit or nil)
	table.insert(info, definition or nil)

	local result = word
		and
			("<span lang=\"ko\" class=\"Kore\">" .. word .. "</span>")
		or
			('<span lang="ko" class="Kore">' .. m_link.language_link({lang = lang, term = hanja}, true) .. '</span>')
	
	if #info > 0 then
		result = result .. " (" .. table.concat(info, ", ") .. ")"
	end
	
	if note then
		result = result .. " (<i>" .. note .. "</i>)"
	end
	
	return result
end

function M.new(frame)
	local title = mw.title.getCurrentTitle().text
	local args = frame:getParent().args
	local pos = args[1] or ""
	local def = args[2] or "{{rfdef|ko}}"
	local pos2 = args[3] or (args[4] and "" or false)
	local def2 = args[4] or "{{rfdef|ko}}"
	local pos3 = args[5] or (args[6] and "" or false)
	local def3 = args[6] or "{{rfdef|ko}}"
	local etym = args["e"] or false
	local head = args["head"] or false
	local cat = args["cat"] or false
	local image = args["pic"] or false
	local caption = args["capt"] or false
	local pedia = args["wp"] or false
	local irreg = args["irreg"] or false
	
	local result = ""
	
	local function genTitle(text)
		local pos_title = {
			[""] = "Noun", ["n"] = "Noun", ["pn"] = "Proper noun", ["propn"] = "Proper noun", ["pron"] = "Pronoun",
			["v"] = "Verb", ["a"] = "Adjective", ["adj"] = "Adjective", ["adv"] = "Adverb",
			["prep"] = "Preposition", ["postp"] = "Postposition", ["conj"] = "Conjunction",
			["part"] = "Particle", ["suf"] = "Suffix",
			["prov"] = "Proverb", ["id"] = "Idiom", ["ph"] = "Phrase", ["intj"] = "Interjection", ["interj"] = "Interjection",
			["cl"] = "Classifier", ["cls"] = "Classifier", ["num"] = "Numeral", ["abb"] = "Abbreviation",
			["det"] = "Determiner", ["deter"] = "Determiner", ["root"] = "Root",
		};
		return pos_title[text] or mw.ustring.upper(mw.ustring.sub(text, 1, 1)) .. mw.ustring.sub(text, 2, -1)
	end
	
	local function genHead(text)
		local pos_head = {
			[""] = "noun", ["n"] = "noun", ["pn"] = "proper noun", ["propn"] = "proper noun", ["v"] = "verb", ["a"] = "adj", ["adv"] = "adv",
			["postp"] = "pos|post", ["conj"] = "pos|con", ["part"] = "pos|particle", ["pron"] = "pos|pronoun",
			["prov"] = "proverb", ["id"] = "pos|idiom", ["ph"] = "pos|phrase", ["intj"] = "interj",
			["abb"] = "pos|abbr", ["cl"] = "pos|cls", ["det"] = "det", ["deter"] = "det", ["root"] = "root", ["num"] = "num",
		};
		return pos_head[text] or "pos|" .. text
	end
	
	local function other(class, title, args, level)
		local code = ""
		if args[class] then
			code = code .. "\n\n" .. level .. title .. level .. "\n* {{ko-l|" .. gsub(args[class], ":", "|") .. "}}"
			i = 2
			while args[class .. i] do
				code = code .. "\n* {{ko-l|" .. gsub(args[class .. i], ":", "|") .. "}}"
				i = i + 1
			end
		end
		return code
	end
	
	if args["2e"] or args["2h"] or args["2nat"] or args["2ee"] or args["2c1"] or args["2p"] or args["multiEtym"] then
		multiEtym = true
	end
	
	local function iterate_param(args, genPos, etymNo)
		if genPos == "proper noun" then args[(etymNo > 1 and etymNo or "") .. "cap"] = "y" end
		text = ""
		for _, arg in ipairs( { "l", "com", "nn", "ui", "nobc", "cap", "ni", "bcred", "a", "uie" } ) do
			if etymNo > 1 then arg_temp = etymNo .. arg else arg_temp = arg end
			if args[arg_temp] then text = text .. "|" .. arg .. "=" .. args[arg_temp] end
		end
		return text
	end
	
	local function add_etym(args, etymNo)
		etymText = ""
		n = etymNo > 1 and etymNo or ""
		if args[n.."e"] then etymText = etymText .. args[n.."e"]
		elseif args[n.."h"] then etymText = etymText .. "{{ko-etym-sino|" .. args[n.."h"] .. (args[n.."he"] and "|" .. args[n.."he"] or "") .. "}}."
		elseif args[n.."nat"] then etymText = etymText .. "{{ko-etym-native|" .. gsub(args[n.."nat"], ",", "|") .. "}}"
		elseif args[n.."ee"] then etymText = etymText .. "From {{bor|ko|" .. (args[n.."el"] or "en") .. "|" .. args[n.."ee"] .. "}}."
		elseif args[n.."c1"] then etymText = etymText .. 
			"{{ko-l|" .. args[n.."c1"] .. (args[n.."hj1"] and "|" .. args[n.."hj1"] or "") .. (args[n.."t1"] and "|" .. args[n.."t1"] or "") .. "}}" ..
			" + {{ko-l|" .. args[n.."c2"] .. (args[n.."hj2"] and "|" .. args[n.."hj2"] or "") .. (args[n.."t2"] and "|" .. args[n.."t2"] or "") .. "}}" ..
			(args[n.."c3"] and " + {{ko-l|" .. args[n.."c3"] .. (args[n.."hj3"] and "|" .. args[n.."hj3"] or "") .. (args[n.."t3"] and "|" .. args[n.."t3"] or "") .. "}}" or "") .. 
			(args[n.."c4"] and " + {{ko-l|" .. args[n.."c4"] .. (args[n.."hj4"] and "|" .. args[n.."hj4"] or "") .. (args[n.."t4"] and "|" .. args[n.."t4"] or "") .. "}}" or "") .. "."
		elseif mw.ustring.match(title, "[하되]다$") then
			local suffix_data = {
				['하다'] = "|t2=to do|pos2=[[light verb]] deriving " .. (genHead(pos) == "adj" and "adjectives" or "active verbs"),
				['되다'] = "|t2=to become|pos2=[[light verb]] deriving " .. (genHead(pos) == "adj" and "adjectives" or "active verbs"),
			}

			etymText = etymText
				.. "{{af|ko"
				.. "|" .. mw.ustring.sub(title, 1, -3) .. (args[n.."hj1"] and "(" .. args[n.."hj1"] .. ")" or "")
				.. "|-" .. mw.ustring.sub(title, -2, -1)
				.. (args["c1r"] and "|pos1=root" or "")
				.. (args["t1"] and "|t1=" .. args["t1"] or "")
				.. suffix_data[mw.ustring.sub(title, -2, -1)]
				.. "}}"
				.. "."
		elseif mw.ustring.match(title, "시키다$") or mw.ustring.match(title, "스럽다$") then
			etymText = etymText
				.. "{{af|ko"
				.. "|" .. mw.ustring.sub(title, 1, -4) .. (args[n.."hj1"] and "(" .. args[n.."hj1"] .. ")" or "")
				.. "|-" ..  mw.ustring.sub(title, -3, -1)
				.. (args["c1r"] and "|pos1=root" or "")
				.. (args["t1"] and "|t1=" .. args["t1"] or "")
				.. "}}"
				.. "."
		end
		return etymText
	end
	
	result = result .. "==Korean=="
	if pedia then result = result .. "\n{{wp|lang=ko" .. (pedia ~= "y" and "|" .. pedia or "") .. "}}" end
	if image then result = result .. "\n[[File:" .. image .. "|thumb|right|250px|" .. (caption or title) .. ".]]" end
	result = result .. other("alt", "Alternative forms", args, "===")
	
	if mw.ustring.match(title, "[하되]다$") or mw.ustring.match(title, "시키다$") or mw.ustring.match(title, "스럽다$") then autoEtym = true end
	if args["e"] or args["2e"] or args["3e"] or args["h"] or args["nat"] or args["ee"] or args["c1"] or autoEtym then
		etym = "\n\n===Etymology" .. (multiEtym and " 1" or "") .. "===\n"
		etym = etym .. add_etym(args, 1)
	end
	
	if etym then result = result .. etym end
	level = multiEtym and "====" or "==="
	result = result .. other("1alt", "Alternative forms", args, "====")
	
	result = result .. "\n\n" .. level .. "Pronunciation" .. level ..
	"\n{{ko-IPA" .. iterate_param(args, genHead(pos), 1) .. "}}"
	if genHead(pos) == "root" then def = "{{ko-root of|" .. def .. "}}" end
	result = result .. "\n\n" .. level .. genTitle(pos) .. level .. "\n{{ko-" .. genHead(pos) ..
	(head and ("|head=" .. head) or "") .. (args["h"] and ("|hanja=" .. args["h"]) or "") ..
	(irreg and "|irreg=y" or "") .. "}}\n\n# " .. def
	
	local function add_der(args, etymNo, hanja)
		n = etymNo > 1 and etymNo or ""
		local translDer = { ["h"] = "하다", ["d"] = "되다", ["s"] = "시키다" }
		if args[n .. "der"] and gsub(args[n .. "der"], "[sdh]", "") == "" then
			i = 1
			for ch in mw.text.gsplit(args[n .. "der"], "") do
				args[n .. "der" .. (i == 1 and "" or i)] = title .. translDer[ch] .. 
					(hanja and ":" .. hanja .. "—" or "")
				i = i + 1
			end
		end
		return args
	end
	
	args = add_der(args, 1, args["h"] or false)
	result = result .. other("syn", "=Synonyms=", args, level)
	result = result .. other("ant", "=Antonyms=", args, level)
	result = result .. other("der", "=Derived terms=", args, level)
	result = result .. other("rel", "=Related terms=", args, level)
	result = result .. other("also", "=See also=", args, level)
	if genHead(pos) == "adj" or genHead(pos) == "verb" then
		result = result .. "\n\n=" .. level .. "Conjugation" .. level .. "=\n{{ko-conj/" .. genHead(pos) .. (irreg and "|irreg=y" or "") .. "}}"
	end
	
	if pos2 then
		if multiEtym then
			result = result .. "\n\n===Etymology 2===\n" .. add_etym(args, 2)
			level = "===="
			result = result .. other("2alt", "Alternative forms", args, level)
			
			result = result .. "\n\n" .. level .. "Pronunciation" .. level .. 
			"\n{{ko-IPA" .. iterate_param(args, genHead(pos), 2) .. "}}"
			if genHead(pos2) == "root" then def2 = "{{ko-root of|" .. def2 .. "}}" end
			result = result .. "\n\n" .. level .. genTitle(pos2) .. level .. "\n{{ko-" .. genHead(pos2) ..
			(head and ("|head=" .. head) or "") .. (args["2h"] and ("|hanja=" .. args["2h"]) or "") .. "}}\n\n# " .. def2
			args = add_der(args, 2, args["2h"] or false)
			result = result .. other("2syn", "=Synonyms=", args, level)
			result = result .. other("2ant", "=Antonyms=", args, level)
			result = result .. other("2der", "=Derived terms=", args, level)
			result = result .. other("2rel", "=Related terms=", args, level)
			result = result .. other("2also", "=See also=", args, level)
			if genHead(pos2) == "adj" or genHead(pos2) == "verb" then
				result = result .. "\n\n=" .. level .. "Conjugation" .. level .. "=\n{{ko-conj/" .. genHead(pos2) .. (irreg and "|irreg=y" or "") .. "}}"
			end

		else
			result = result .. "\n\n===" .. genTitle(pos2) .. "===\n{{ko-" .. genHead(pos2) ..
			(head and ("|head=" .. head) or "") .. (args["2h"] and ("|hanja=" .. args["2h"]) or "") .. 
			"}}\n\n# " .. def2
			if genHead(pos2) == "adj" or genHead(pos2) == "verb" then
				result = result .. "\n\n====Conjugation====\n{{ko-conj/" .. genHead(pos2) .. (irreg and "|irreg=y" or "") .. "}}"
			end
		end
	end
	
	if pos3 then
		if multiEtym then
			result = result .. "\n\n===Etymology 3===\n" .. add_etym(args, 3)
			level = "===="
			result = result .. other("3alt", "Alternative forms", args, level)
			
			result = result .. "\n\n" .. level .. "Pronunciation" .. level .. 
			"\n{{ko-IPA" .. iterate_param(args, genHead(pos), 3) .. "}}"
			if genHead(pos3) == "root" then def3 = "{{ko-root of|" .. def3 .. "}}" end
			result = result .. "\n\n" .. level .. genTitle(pos3) .. level .. "\n{{ko-" .. genHead(pos3) ..
			(head and ("|head=" .. head) or "") .. (args["3h"] and ("|hanja=" .. args["3h"]) or "") .. "}}\n\n# " .. def3
			args = add_der(args, 3, args["3h"] or false)
			result = result .. other("3syn", "=Synonyms=", args, level)
			result = result .. other("3ant", "=Antonyms=", args, level)
			result = result .. other("3der", "=Derived terms=", args, level)
			result = result .. other("3rel", "=Related terms=", args, level)
			result = result .. other("3also", "=See also=", args, level)
			if genHead(pos3) == "adj" or genHead(pos3) == "verb" then
				result = result .. "\n\n=" .. level .. "Conjugation" .. level .. "=\n{{ko-conj/" .. genHead(pos3) .. (irreg and "|irreg=y" or "") .. "}}"
			end
		else
			result = result .. "\n\n===" .. genTitle(pos3) .. "===\n{{ko-" .. genHead(pos3) ..
			(head and ("|head=" .. head) or "") .. (args["3h"] and ("|hanja=" .. args["3h"]) or "") .. 
			"}}\n\n# " .. def3
			if genHead(pos3) == "adj" or genHead(pos3) == "verb" then
				result = result .. "\n\n====Conjugation====\n{{ko-conj/" .. genHead(pos3) .. (irreg and "|irreg=y" or "") .. "}}"
			end
		end
	end
	
	if cat then
		result = result .. "\n\n{{C|ko|" .. cat .. "}}"
	end
	
	return result
end

function M.decompose_jamo(syllable)
	if not match(syllable, "[가-힣]") then
		if match(syllable, "[ᄀ-ᄒ]") then return { initial = syllable, vowel = "Ø", final = "Ø" }
		elseif match(syllable, "[ᅡ-ᅵ]") then return { initial = "Ø", vowel = syllable, final = "Ø" }
		elseif match(syllable, "[ᆨ-ᇂ]") then return { initial = "Ø", vowel = "Ø", final = syllable }
		elseif match(syllable, "[ㄱ-ㆎ]") then return { initial = "Ø", vowel = "Ø", final = syllable }
		else return { initial = "Ø", vowel = " ", final = "X" } end
	end
	local char = mw.ustring.char
	local cp = mw.ustring.codepoint(syllable)
	if not cp then return { "", "", "" } end
	local relative_cp = cp - 0xAC00
	local jongseong = relative_cp % 28
	local jungseong = math.floor((relative_cp % 588) / 28)
	local choseong = math.floor(relative_cp / 588)
	choseong, jungseong, jongseong = 
		char(0x1100 + choseong), 
		char(0x1161 + jungseong), 
		jongseong ~= 0 and char(0x11A7 + jongseong) or ""
	return { initial = choseong, vowel = jungseong, final = jongseong }
end

return M