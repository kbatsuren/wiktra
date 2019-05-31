local M = {}
local gsub = mw.ustring.gsub
local match = mw.ustring.match

local lang = require("Module:languages").getByCode("ko")

-- makes hanjatab automatically
function M.hanjatab()
	local hanja = mw.ustring.gsub(mw.title.getCurrentTitle().text, '[^一-鿌]', '')
		local table_head = '<table class="floatright wikitable" style="text-align:center; font-size:small;"><tr><th colspan="' .. 
		mw.ustring.len(hanja) .. 
		'" style="font-weight:normal;">[[hanja|Hanja]] in this term</th></tr><tr lang="ko" class="Hani" style="font-size:2em; background:white; line-height:1em;">'
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
	local front, back = '<span style="background&#45;color:#FEF8EA"><b>', '</b></span>'
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
	local m_pron = require("Module:ko-translit")
	local curr_distance, closest_match = 1000, 0
	local word, translit, definition, hanja, note = false, false, false, false, false
	
	for i = 1, 4, 1 do
		if arg[i] and arg[i] ~= "" then
			table.insert(args, arg[i])
		end
	end

	local curr_hangul_level, closest_hangul = 0, 0
	for i, parameter in ipairs(args) do
		local _, tentative_hangul_level = gsub(parameter, "[가-힣\225\132\128-\225\135\191]", "")
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
	
	local m_link = require("Module:links")
	local test_translit = m_pron.tr_revised(m_link.remove_links(word or arg[1])) or ""
	
	if arg[5] and arg[5] ~= "" then
		note = arg[5]
	end
	
	for i, parameter in ipairs(args) do
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
		definition = args[1]
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
		hanja = '<span lang="ko" class="Hani">' .. m_link.language_link({lang = lang, term = hanja}, true) .. '</span>'
	end

	word = gsub(word, "%^", "")
	
	if not match(word, "[%[%]]") then
		if match(word, "^—.+—$") then
			word = gsub(word, "—(.+)—", "—[[%1]]—")
			
		elseif match(word, "^—.+$") then
			word = gsub(word, "—(.+)", "—[[%1]]")
			
		elseif match(word, "^.+—$") then
			word = gsub(word, "(.+)—", "[[%1다|%1—]]")
		
		elseif match(word, "^.+–$") then
			word = gsub(word, "(.+)–", "[[%1]]—")
		
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
			("<span lang=\"ko\" class=\"Hang\">" .. word .. "</span>")
		or
			('<span lang="ko" class="Hani">' .. m_link.language_link({lang = lang, term = hanja}, true) .. '</span>')
	
	if #info > 0 then
		result = result .. " (" .. table.concat(info, ", ") .. ")"
	end
	
	if note then
		result = result .. " (<i>" .. note .. "</i>)"
	end
	
	return result
end

function M.new(frame)
	local args = frame:getParent().args

	local function other(class, title, args)
		local code = ""
		if args[class] then
			code = code .. "\n\n===" .. title .. "===\n* {{ko-l|" .. args[class] .. "}}"
 
			if args[class .. "2"] then
				code = code .. "\n* {{ko-l|" .. args[class .. "2"] .. "}}"
 
				if args[class .. "3"] then
					code = code .. "\n* {{ko-l|" .. args[class .. "3"] .. "}}"
 
					if args[class .. "4"] then
						code = code .. "\n* {{ko-l|" .. args[class .. "4"] .. "}}"
					end
				end
			end
		end
		return code
	end
	
	local result = "==Korean=="
	if args["wp"] then
		result = result .. "\n{{wikipedia|lang=ko}}"
	end
	
	result = result .. other("alt", "Alternative forms", args)
	
	if args["e"] or args["ee"] or args["h"] or args["h1"] then
		result = result .. "\n\n===Etymology===\n"
		
			result = result .. (args["ee"] or
				("From {{etyl|" .. (args["el"] or "en") .. "|ko}} {{m|" .. 
					(args["el"] or "en") .. "|" .. args["e"] .. "}}."))
	end
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