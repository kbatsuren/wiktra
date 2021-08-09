local export = {}
--local m_ko_utilities = require("translit/utilities/ko")
local m_data = require("/usr/local/lib/lua/wikt/translit/data/ko-pron")

local gsub = mw.ustring.gsub
local match = mw.ustring.match
local sub = mw.ustring.sub
local char = mw.ustring.char
local codepoint = mw.ustring.codepoint

--local PAGENAME = mw.title.getCurrentTitle().text

local system_lookup = {
	["ph"] = 1, ["rr"] = 2, ["rrr"] = 3,
	["mr"] = 4, ["yr"] = 5, ["ipa"] = 6,
}

local question_mark = "<sup><small>[[Wiktionary:About Korean/Romanization|?]]</small></sup>"

local system_list = {
	{ 
		seq = 1,
		abbreviation = "ph", 
		display = "Phonetic Hangul", 
		separator = "/",
	},
	{ 
		seq = 2,
		abbreviation = "rr", 
		display = "Revised Romanization" .. question_mark, 
		separator = "/",
	},
	{ 
		seq = 3,
		abbreviation = "rrr", 
		display = "Revised Romanization (translit.)" .. question_mark, 
		separator = "/"
	},
	{ 
		seq = 4,
		abbreviation = "mc", 
		display = "McCune–Reischauer" .. question_mark,
		separator = "/"
	},
	{ 
		seq = 5,
		abbreviation = "yr", 
		display = "Yale Romanization" .. question_mark,
		separator = "/"
	},
	{ 
		seq = 6,
		abbreviation = "ipa", 
		display = "[[Wiktionary:International Phonetic Alphabet|IPA]]<sup>([[Appendix:Korean pronunciation|key]])</sup>", 
		separator = "] ~ ["
	}
}

local final_syllable_conversion = { [""] = "Ø", ["X"] = "" }
local com_mc = { ["g"] = "k", ["d"] = "t", ["b"] = "p", ["j"] = "ch", ["sy"] = "s", ["s"] = "ss" }
local com_ph = { ["ᄀ"] = "ᄁ", ["ᄃ"] = "ᄄ", ["ᄇ"] = "ᄈ", ["ᄉ"] = "ᄊ", ["ᄌ"] = "ᄍ" }
local vowel_variation = { [7] = -56, [11] = 112, [16] = 0 }
local allowed_vowel_scheme = { ["7-1"] = 1, ["7-6"] = 1, ["11-1"] = 1, ["11-6"] = 1, ["16-6"] = 1 }
local ambiguous_intersyllabic_rr = { ["oe"] = 1, ["eo"] = 1, ["eu"] = 1, ["ae"] = 1, ["ui"] = 1 }

local function decompose_jamo(syllable)
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

local function decompose_syllable(word)
	local decomposed_syllables = {}
	for syllable in mw.text.gsplit(word, "") do
		table.insert(decomposed_syllables, decompose_jamo(syllable))
	end
	return decomposed_syllables
end

local function tidy_phonetic(original, romanised)
	local j, k, w = 1, 1, {}
	for i = 1, mw.ustring.len(romanised) do
		local romanised_syllable = mw.ustring.sub(romanised, k, k)
		local original_syllable = mw.ustring.sub(original, j, j)
		if romanised_syllable ~= original_syllable then
			table.insert(w, '<span style="font-size:110%; color:#BF0218"><b>'..romanised_syllable..'</b></span>')
			if match(original_syllable, "[^: ]") then k = k + 1 end
			if match(romanised_syllable, "[^: ]") then j = j + 1 end
		else
			table.insert(w, '<span style="font-size:110%">'..romanised_syllable..'</span>')
			j, k = j + 1, k + 1
		end
	end
	return table.concat(w)
end

local function tidy_ipa(set)
	local ipa = table.concat(set, system_list[6].separator)
	ipa = gsub(ipa, "ʌ̹ː", "ɘː")
	ipa = gsub(ipa, "ɭɭ([ji])", "ɭʎ%1")
	ipa = gsub(ipa, "s([͈]?)ʰɥi" ,"ʃ%1ʰɥi")
	ipa = gsub(ipa, "s([ʰ͈])([ji])" ,"ɕ%1%2")
	ipa = gsub(ipa, "nj", "ɲj")
	
	ipa = gsub(ipa, "kʰ[ijɯ]", { 
		["kʰi"] = "kçi", 
		["kʰj"] = "kçj", 
		["kʰɯ"] = "kxɯ" }
	)
	ipa = gsub(ipa, "[hɦ][ijɯouw]", {
		["hi"] = "çi",
		["hj"] = "çj",
		["hɯ"] = "xɯ",
		["ho"] = "ɸʷo",
		["hu"] = "ɸʷu",
		["hw"] = "ɸw",
		["ɦi"] = "ʝi",
		["ɦj"] = "ʝj",
		["ɦɯ"] = "ɣɯ",
		["ɦo"] = "βo",
		["ɦu"] = "βu",
		["ɦw"] = "βw" }
	)
	
	if match(ipa, "ɥi") then
		local midpoint = math.floor(mw.ustring.len(ipa) / 2)
		ipa = sub(ipa, 1, midpoint) .. gsub(sub(ipa, midpoint+1, -1), "ɥi", "y")
	end
	
	return ipa
end

function export.romanise(text_param, system_index, args)
	local p, optional_params = {}, { "nn", "l", "com", "cap", "ni" }
	for _, pm in ipairs(optional_params) do
		p[pm] = { }
		if args[pm] then
			for pp in mw.text.gsplit(args[pm], ",") do p[pm][tonumber(pp) or pp] = 1 end
		end
	end
		
	local vowel_ui_i, vowel_ui_e, no_batchim, batchim_reduce, s_variation, iotation, yeo_reduce = 
		args.ui, args.uie, args.nobc, args.bcred, args.svar, args.iot, args.yeored
	
	system_index = system_lookup[system_index] or system_index
	
	for primitive_word in mw.ustring.gmatch(text_param, "[ᄀ-ᄒ".."ᅡ-ᅵ".."ᆨ-ᇂ" .. "ㄱ-ㆎ가-힣' ]+") do
		local the_original = primitive_word
		primitive_word = gsub(primitive_word, "'''", "ß")
		local bold_position, bold_count = {}, 0
		while match(primitive_word, "ß") do
			bold_position[(mw.ustring.find(primitive_word, "ß")) + bold_count] = true
			primitive_word = gsub(primitive_word, "ß", "", 1)
			bold_count = bold_count + 1
		end
		
		local has_vowel = {}
		for ch in mw.ustring.gmatch(primitive_word, ".") do
			local jungseong = math.floor(((codepoint(ch) - 0xAC00) % 588) / 28)
			if ch ~= "예" and match(ch, "[가-힣]") then has_vowel[jungseong] = true end
		end
		local word_set = { primitive_word }
		
		local function add_respelling(variable, modification, modification2)
			modification2 = modification2 or function(x) return x end
			if variable and match(system_index, "[16]") then
				variable = tonumber(variable)
				local pre_length = #word_set
				for i = 1, pre_length do
					local item = mw.text.split(word_set[i], "")
					item[variable] = modification(item[variable])
					item[variable + 1] = modification2(item[variable + 1])
					word_set[pre_length + i] = table.concat(item)
				end
			end
		end
		add_respelling(vowel_ui_i, function(x) return "이" end)
		add_respelling(vowel_ui_e, function(x) return "에" end)
		
		add_respelling(no_batchim, 
			function(x) return char(codepoint(x) - (codepoint(x) - 0xAC00) % 28) end, 
			function(y) return char(codepoint(y) + 588) end)
		
		add_respelling(s_variation, function(x) return char(codepoint(x) - 12) end)
		add_respelling(iotation, function(x) return char(codepoint(x) + 56) end)
		add_respelling(yeo_reduce, function(x) return char(codepoint(x) - 56) end)
		
		for _, vowel_id in ipairs({ 7, 11, 16 }) do
			if has_vowel[vowel_id] and allowed_vowel_scheme[vowel_id .. "-" .. system_index] then
				local pre_length = #word_set
				for i = 1, pre_length do
					local item = mw.text.split(word_set[i], "")
					for num, it in ipairs(item) do
						if math.floor(((codepoint(it) - 0xAC00) % 588) / 28) == vowel_id then
							item[num] = char(codepoint(it) + vowel_variation[vowel_id])
						end
					end
					if vowel_id == 11 then
						table.insert(word_set, i, table.concat(item))
					else
						table.insert(word_set, table.concat(item))
					end
				end
			end
		end
		
		local word_set_romanisations = {}
		for _, respelling in ipairs(word_set) do
			local decomposed_syllables = decompose_syllable(respelling)
			local romanisation = {}
			local bold_insert_count = 0
			for index = 0, #decomposed_syllables, 1 do
				local this_syllable = index ~= 0 and sub(respelling, index, index) or ""
					local syllable = decomposed_syllables[index] or { initial = "Ø", vowel = "Ø", final = "X" }
					local next_syllable = decomposed_syllables[index + 1] or { initial = "Ø", vowel = "Ø", final = "Ø" }
					syllable.final = final_syllable_conversion[syllable.final] or syllable.final
					
					if system_index == 5 and syllable.vowel == "ᅮ" and match(syllable.initial, "[ᄆᄇᄈᄑ]") then
						syllable.vowel = "ᅳ"
					end
					
					if match(system_index, "[16]") then
						if syllable.vowel == "ᅴ" and this_syllable ~= "의" then
							syllable.vowel = "ᅵ"
						end
						if this_syllable == "넓" then
							if match(next_syllable.initial, "[ᄌᄉ]") then
								syllable.final = "ᆸ"
								
							elseif next_syllable.initial == "ᄃ" then
								if match(next_syllable.vowel, "[^ᅡᅵ]") then
									syllable.final = "ᆸ"
								end
							end
						end
					end
	
					local vowel = m_data.vowels[syllable.vowel][system_index]
					
					if p.nn[index + 1] then
						next_syllable.initial = "ᄂ"
					end
					if p.com[index] and match(system_index, "[16]") then
						next_syllable.initial = com_ph[next_syllable.initial] or next_syllable.initial
					end
					
					if p.ni[index + 1] and system_index ~= 3 then
						next_syllable.initial = (system_index == 5 and syllable.final == "ᆯ") and "ᄅ" or "ᄂ"
					end
					
					if match(system_index, "[^35]") then
						if tonumber(batchim_reduce or -1) == index then
							syllable.final = m_data.boundary[syllable.final .. "-Ø"][1]
						end
					
						if index ~= 0 and this_syllable == "밟" then
							syllable.final = "ᆸ"
						end
						
						local final_next_syllable = syllable.final .. sub(respelling, index+1, index+1)
						if match(final_next_syllable, "[ᇀᆴ][이히]") then
							syllable.final = "ᆾ"
						
						elseif match(final_next_syllable, "ᆮ이") then
							syllable.final = "ᆽ"
						
						elseif match(final_next_syllable, "ᆮ히") then
							syllable.final = "ᆾ"
							
						elseif syllable.final .. next_syllable.initial == "ᆺᄋ" and not
							match(sub(respelling, index+1, index+1), "[이아어은으음읍을었았에입]") then
								syllable.final = "ᆮ"
						end
					end
					
					local bound = syllable.final .. "-" .. next_syllable.initial
					if not m_data.boundary[bound] then
						require("Module:debug").track("ko-pron/no boundary data")
						mw.log("No boundary data for " .. bound .. ".")
						return nil
					end
					local junction = m_data.boundary[bound][system_index]
					
					if bold_position[index + bold_insert_count + 1] and system_index == 2 then
						junction = gsub(junction, "^.*$", function(matched)
							local a, b = match(matched, "^(ng%-?)(.?)$")
							if not a or not b then a, b = match(matched, "^(.?%-?)(.*)$") end
							return match(syllable.final .. next_syllable.initial, "^Ø?[ᄀ-ᄒ]$")
								and "'''" .. (a or "") .. (b or "")
								or (a or "") .. "'''" .. (b or "") end)
							
						bold_insert_count = bold_insert_count + 1
					end
					
					if p.l[index] or (p.l["y"] and index == 1) then
						if system_index == 1 then
							junction = gsub(junction, "^(.)(.?)$", function(a, b)
								return match(a, "[ᆨ-ᇂ]") and a .. ":" .. b or ":" .. a .. b end)
							
						elseif system_index == 5 then
							vowel = gsub(vowel, "([aeiou])", "%1̄")
							
						elseif system_index == 6 then
							vowel = vowel .. "ː"
						end
					end
					
					if (p.l["y"] or p.l[1]) and index == 0 and system_index == 6 and #decomposed_syllables > 1 then
						vowel = vowel .. "ˈ"
					end
				
					if p.com[index] then
						junction = gsub(junction, "(.)$", function(next_letter)
							return 
								(system_index == 5 and "q" or "") .. 
								(system_index == 4
									and (com_mc[next_letter..(p.cap["y"] or "")] or com_mc[next_letter] or next_letter)
									or next_letter) end)
					end
					
					if p.ni[index + 1] and system_index == 5 then
						junction = gsub(junction, "([nl])$", "<sup>%1</sup>")
					end
					
					table.insert(romanisation, vowel .. junction)
				end
			
			local temp_romanisation = table.concat(romanisation)
			if p.cap["y"] and match(system_index, "[^16]") then
				temp_romanisation = mw.ustring.upper(sub(temp_romanisation, 1, 1)) .. sub(temp_romanisation, 2, -1)
			end
			
			if system_index == 1 then
				temp_romanisation = tidy_phonetic(primitive_word, mw.ustring.toNFC(temp_romanisation))
			
			elseif match(system_index, "[23]") then
				for i = 1, 2 do
					temp_romanisation = gsub(temp_romanisation, "(.)…(.)", function(a, b)
						return a .. (ambiguous_intersyllabic_rr[a .. b] and "-" or "") .. b end)
				end
			
			elseif system_index == 4 then
				temp_romanisation = gsub(temp_romanisation, "swi", "shwi")
			end
			
			table.insert(word_set_romanisations, temp_romanisation)
		end
		
		text_param = gsub(
			text_param, 
			the_original, 
			table.concat(word_set_romanisations, system_list[system_index].separator), 
			1
		)
	end
	
	return text_param
end

-- function export.make(frame, scheme)
-- 	local params = {
-- 		[1] = { default = PAGENAME, list = true },
		
-- 		["a"] = {},
-- 		["audio"] = { alias_of = "a" },
		
-- 		["nn"] = {},
-- 		["l"] = {},
-- 		["com"] = {},
-- 		["cap"] = {},
-- 		["ui"] = {},
-- 		["uie"] = {},
-- 		["nobc"] = {},
-- 		["ni"] = {},
-- 		["bcred"] = {},
-- 		["svar"] = {},
-- 		["iot"] = {},
-- 		["yeored"] = {},
-- 	}
	
-- 	local args = require("Module:parameters").process(frame:getParent().args, params)
-- 	table.sort(system_list, function(first, second) return first.seq < second.seq end)
	
-- 	local results = {}
-- 	for _, text_param in ipairs(args[1]) do
-- 		local current_word_dataset = {}
-- 		for _, system in pairs(system_list) do
-- 			local romanised = export.romanise(text_param, system.seq, args)
-- 			table.insert(current_word_dataset, romanised)
-- 		end
-- 		table.insert(results, current_word_dataset)
-- 	end
	
-- 	local output_result = { [1] = {}, [2] = {}, [3] = {}, [4] = {}, [5] = {}, [6] = {} }
-- 	for _, result in ipairs(results) do
-- 		for result_index, value in ipairs(result) do
-- 			table.insert(output_result[result_index], value)
-- 		end
-- 	end
	
-- 	local output_text = {}
	
-- 	local ipa_output = table.concat(output_result[6], system_list[6].separator)
-- 	local width = 15 * mw.ustring.len(ipa_output)
-- 	width = width < 400 and 400 or (width > 800 and 800 or width)
	
-- 	table.insert(output_text, 
-- 		'* ' .. tostring( mw.html.create( "span" )
-- 			:css( "padding-right", ".5em" )
-- 			:css( "color", "#8F390A" )
-- 			:css( "font-family", "DejaVu Sans, sans-serif" )
-- 			:css( "font-weight", "bold" )
-- 			:wikitext( system_list[6].display )) ..
		
-- 		tostring( mw.html.create( "span" )
-- 			:attr( "class", "IPA" )
-- 			:wikitext( "[" .. tidy_ipa(output_result[6]) .. "]" )) ..
		
-- 		"\n* " .. tostring( mw.html.create( "span" )
-- 			:css( "padding-right", ".5em" )
-- 			:css( "color", "#8F390A" )
-- 			:css( "font-family", "DejaVu Sans, sans-serif" )
-- 			:css( "font-weight", "bold" )
-- 			:wikitext( system_list[1].display )) .. "[" ..
		
-- 		tostring( mw.html.create( "span" )
-- 			:attr( "class", "Kore" )
-- 			:attr( "lang", "ko" )
-- 			:wikitext( table.concat(output_result[1], system_list[1].separator) )) .. "]\n" .. 
		
-- [=[{| style="margin: 0 1em .5em 1.6em"
-- |
-- <table cellpadding=1 style="border: 1px solid #DFDFDF; line-height: 25pt; padding: .1em .3em .1em .3em">]=])
		
-- 	for roman_index = 2, 5 do
-- 		table.insert(output_text, 
-- 			"\n<tr>" .. 
			
-- 			tostring( mw.html.create( "td" )
-- 				:css( "padding-right", ".5em" )
-- 				:css( "font-size", "10pt" )
-- 				:css( "font-family", "DejaVu Sans, sans-serif" )
-- 				:css( "color", "#555" )
-- 				:css( "font-weight", "bold" )
-- 				:css( "background-color", "#F8F9F8" )
-- 				:wikitext( system_list[roman_index].display )) .. "\n" ..
			
-- 			tostring( mw.html.create( "td" )
-- 				:attr( "class", "IPA" )
-- 				:css( "padding-left", ".7em" )
-- 				:css( "padding-right", ".7em" )
-- 				:css( "font-size", "100%" )
-- 				:wikitext( table.concat(output_result[roman_index], system_list[roman_index].separator) )) ..
			
-- 			"</tr>")
-- 	end
	
-- 	table.insert(output_text, 
-- 		(args.a 
-- 			and "\n<tr>" .. 
			
-- 			tostring( mw.html.create( "td" )
-- 				:css( "padding-right", ".5em" )
-- 				:css( "font-size", "10pt" )
-- 				:css( "font-family", "DejaVu Sans" )
-- 				:css( "color", "#555" )
-- 				:css( "font-weight", "bold" )
-- 				:css( "background-color", "#F8F9F8" )
-- 				:wikitext( "Audio" )) .. 
			
-- 			tostring( mw.html.create( "td" )
-- 				:css( "padding-left", ".7em" )
-- 				:css( "padding-right", ".7em" )
-- 				:wikitext( mw.getCurrentFrame():expandTemplate{ 
-- 					title = "Template:audio", 
-- 					args = { args.a == "y" and "Ko-" .. PAGENAME .. ".ogg" or args.a, lang = "ko" }} )) ..
			
-- 			"</tr>"
			
-- 			or ""

-- 		) .. "</table>\n|}")
		
-- 	return table.concat(output_text)
-- end

return export