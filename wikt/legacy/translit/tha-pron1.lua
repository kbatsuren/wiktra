local export = {}

local gsub = mw.ustring.gsub
local sub = mw.ustring.sub
local match = mw.ustring.match

local initial_ipa = {
	["ก"] = { ["paiboon"] = "g", ["ipa"] = "k", ["type"] = "mid" },
	["จ"] = { ["paiboon"] = "j", ["ipa"] = "t͡ɕ", ["type"] = "mid" },
	["ด"] = { ["paiboon"] = "d", ["ipa"] = "d", ["type"] = "mid" },
	["ฎ"] = { ["paiboon"] = "d", ["ipa"] = "d", ["type"] = "mid" },
	["ฏ"] = { ["paiboon"] = "dt", ["ipa"] = "t", ["type"] = "mid" },
	["ต"] = { ["paiboon"] = "dt", ["ipa"] = "t", ["type"] = "mid" },
	["บ"] = { ["paiboon"] = "b", ["ipa"] = "b", ["type"] = "mid" },
	["ป"] = { ["paiboon"] = "bp", ["ipa"] = "p", ["type"] = "mid" },
	["อ"] = { ["paiboon"] = "", ["ipa"] = "ʔ", ["type"] = "mid" },
	
	["ง"] = { ["paiboon"] = "ng", ["ipa"] = "ŋ", ["type"] = "low" },
	["ณ"] = { ["paiboon"] = "n", ["ipa"] = "n", ["type"] = "low" },
	["น"] = { ["paiboon"] = "n", ["ipa"] = "n", ["type"] = "low" },
	["ม"] = { ["paiboon"] = "m", ["ipa"] = "m", ["type"] = "low" },
	["ญ"] = { ["paiboon"] = "y", ["ipa"] = "j", ["type"] = "low" },
	["ย"] = { ["paiboon"] = "y", ["ipa"] = "j", ["type"] = "low" },
	["ร"] = { ["paiboon"] = "r", ["ipa"] = "r", ["type"] = "low" },
	["ล"] = { ["paiboon"] = "l", ["ipa"] = "l", ["type"] = "low" },
	["ฬ"] = { ["paiboon"] = "l", ["ipa"] = "l", ["type"] = "low" },
	["ว"] = { ["paiboon"] = "w", ["ipa"] = "w", ["type"] = "low" },
	
	["ค"] = { ["paiboon"] = "k", ["ipa"] = "kʰ", ["type"] = "low" }, 
	["ฅ"] = { ["paiboon"] = "k", ["ipa"] = "kʰ", ["type"] = "low" },
	["ฆ"] = { ["paiboon"] = "k", ["ipa"] = "kʰ", ["type"] = "low" },
	["ข"] = { ["paiboon"] = "k", ["ipa"] = "kʰ", ["type"] = "high" },
	["ฃ"] = { ["paiboon"] = "k", ["ipa"] = "kʰ", ["type"] = "high" },
	["ช"] = { ["paiboon"] = "ch", ["ipa"] = "t͡ɕʰ", ["type"] = "low" },
	["ฌ"] = { ["paiboon"] = "ch", ["ipa"] = "t͡ɕʰ", ["type"] = "low" },
	["ฉ"] = { ["paiboon"] = "ch", ["ipa"] = "t͡ɕʰ", ["type"] = "high" },
	["ฑ"] = { ["paiboon"] = "t", ["ipa"] = "tʰ", ["type"] = "low" },
	["ฒ"] = { ["paiboon"] = "t", ["ipa"] = "tʰ", ["type"] = "low" },
	["ท"] = { ["paiboon"] = "t", ["ipa"] = "tʰ", ["type"] = "low" },
	["ธ"] = { ["paiboon"] = "t", ["ipa"] = "tʰ", ["type"] = "low" },
	["ฐ"] = { ["paiboon"] = "t", ["ipa"] = "tʰ", ["type"] = "high" },
	["ถ"] = { ["paiboon"] = "t", ["ipa"] = "tʰ", ["type"] = "high" },
	["พ"] = { ["paiboon"] = "p", ["ipa"] = "pʰ", ["type"] = "low" },
	["ภ"] = { ["paiboon"] = "p", ["ipa"] = "pʰ", ["type"] = "low" },
	["ผ"] = { ["paiboon"] = "p", ["ipa"] = "pʰ", ["type"] = "high" },
	["ฟ"] = { ["paiboon"] = "f", ["ipa"] = "f", ["type"] = "low" },
	["ฝ"] = { ["paiboon"] = "f", ["ipa"] = "f", ["type"] = "high" },
	["ซ"] = { ["paiboon"] = "s", ["ipa"] = "s", ["type"] = "low" },
	["ศ"] = { ["paiboon"] = "s", ["ipa"] = "s", ["type"] = "high" },
	["ษ"] = { ["paiboon"] = "s", ["ipa"] = "s", ["type"] = "high" },
	["ส"] = { ["paiboon"] = "s", ["ipa"] = "s", ["type"] = "high" },
	["ฮ"] = { ["paiboon"] = "h", ["ipa"] = "h", ["type"] = "low" },
	["ห"] = { ["paiboon"] = "h", ["ipa"] = "h", ["type"] = "high" },
	
	["หง"] = { ["paiboon"] = "ng", ["ipa"] = "ŋ", ["type"] = "high" },
	["หน"] = { ["paiboon"] = "n", ["ipa"] = "n", ["type"] = "high" },
	["หม"] = { ["paiboon"] = "m", ["ipa"] = "m", ["type"] = "high" },
	["หญ"] = { ["paiboon"] = "y", ["ipa"] = "j", ["type"] = "high" },
	["หย"] = { ["paiboon"] = "y", ["ipa"] = "j", ["type"] = "high" },
	["หร"] = { ["paiboon"] = "r", ["ipa"] = "r", ["type"] = "high" },
	["หล"] = { ["paiboon"] = "l", ["ipa"] = "l", ["type"] = "high" },
	["หว"] = { ["paiboon"] = "w", ["ipa"] = "w", ["type"] = "high" },
	
	["…"] = { ["paiboon"] = "…", ["ipa"] = "…", ["type"] = "" },
	[""] = { ["paiboon"] = "[[Category:Entries with failed Thai transliterations]]", ["ipa"] = "", ["type"] = "" },
}

local vowel_ipa = {
	["paiboon"] = {
		["open"] = {
			["ะ"] = "a", [""] = "a", ["ิ"] = "i", ["ึ"] = "ʉ", ["ุ"] = "u", ["เะ"] = "e", ["แะ"] = "ɛ", 
			["โะ"] = "o", ["เาะ"] = "ɔ", ["็"] = "ɔ", ["เิ"] = "ə", ["เอะ"] = "ə",
		
			["า"] = "aa", ["ี"] = "ii", ["ู"] = "uu", ["ือ"] = "ʉʉ", ["เ"] = "ee", ["แ"] = "ɛɛ",
			["โ"] = "oo", ["อ"] = "ɔɔ", ["ร"] = "ɔɔn", ["เอ"] = "əə",
		
			["เียะ"] = "ia", ["เือะ"] = "ʉa", ["ัวะ"] = "ua",
			["เีย"] = "iia", ["เือ"] = "ʉʉa", ["ัว"] = "uua",
			
			["ิว"] = "iu", ["ีว"] = "iiu", ["เ็ว"] = "eo", ["แ็ว"] = "ɛo", ["เา"] = "ao",
			["เว"] = "eeo", ["แว"] = "ɛɛo", ["าว"] = "aao", ["เอว"] = "əəo", ["โว"] = "oow",
			["เียว"] = "iao",
		
			["ัย"] = "ai", ["ใ"] = "ai", ["ไ"] = "ai", ["ไย"] = "ai",
			["ึย"] = "ʉi", ["็อย"] = "ɔi", ["เิ็ย"] = "əi", ["ุย"] = "ui",
			["าย"] = "aai", ["อย"] = "ɔɔi", ["โย"] = "ooi", ["เย"] = "əəi", ["ูย"] = "uui",
			["วย"] = "uai", ["เือย"] = "ʉai",
		
			["ำ"] = "am",
		},

		["closed"] = {
			["ั"] = "a", ["รร"] = "a", ["ิ"] = "i", ["ึ"] = "ʉ", ["ุ"] = "u",
			["เ"] = "ee", ["เ็"] = "e", ["แ็"] = "ɛ", ["แ"] = "ɛɛ", 
			[""] = "o", ["็อ"] = "ɔ", ["เิ็"] = "ə",
			
			["า"] = "aa", ["ี"] = "ii", ["ื"] = "ʉʉ", ["ู"] = "uu", ["ู"] = "uu",
			["โ"] = "oo", ["อ"] = "ɔɔ", ["เิ"] = "əə", ["เอ"] = "əə",
		
			["เีย"] = "iia", ["เือ"] = "ʉʉa", ["ว"] = "uua",
			["ไ"] = "ai", ["เา"] = "ao", ["็อย"] = "ɔi", 
		}
	},

	["ipa"] = {
		["open"] = {
			["ะ"] = "a", [""] = "a", ["ิ"] = "i", ["ึ"] = "ɯ", ["ุ"] = "u", ["เะ"] = "eʔ", ["แะ"] = "ɛʔ", 
			["โะ"] = "oʔ", ["เาะ"] = "ɔʔ", ["็"] = "ɔ", ["เิ"] = "ɤ", ["เอะ"] = "ɤʔ",
		
			["า"] = "aː", ["ี"] = "iː", ["ู"] = "uː", ["ือ"] = "ɯː", ["เ"] = "eː", ["แ"] = "ɛː",
			["โ"] = "oː", ["อ"] = "ɔː", ["ร"] = "ɔːn", ["เอ"] = "ɤː",
		
			["เียะ"] = "ia̯ʔ", ["เือะ"] = "ɯa̯ʔ", ["ัวะ"] = "ua̯ʔ",
			["เีย"] = "ia̯", ["เือ"] = "ɯa̯", ["ัว"] = "ua̯",
			
			["ิว"] = "iw", ["ีว"] = "iːw", ["เ็ว"] = "ew", ["แ็ว"] = "ɛw", ["เา"] = "aw",
			["เว"] = "eːw", ["แว"] = "ɛːw", ["าว"] = "aːw", ["เอว"] = "ɤːw", ["โว"] = "oːw",
			["เียว"] = "ia̯w",
		
			["ัย"] = "aj", ["ใ"] = "aj", ["ไ"] = "aj", ["ไย"] = "aj",
			["ึย"] = "ɯj", ["็อย"] = "ɔj", ["เิ็ย"] = "ɤj", ["ุย"] = "uj",
			["าย"] = "aːj", ["อย"] = "ɔːj", ["โย"] = "oːj", ["เย"] = "ɤːj", ["ูย"] = "uːj",
			["วย"] = "ua̯j", ["เือย"] = "ɯa̯j",
		
			["ำ"] = "am",
		},

		["closed"] = {
			["ั"] = "a", ["รร"] = "a", ["ิ"] = "i", ["ึ"] = "ɯ", ["ุ"] = "u",
			["เ"] = "eː", ["เ็"] = "e", ["แ็"] = "ɛ", ["แ"] = "ɛː", 
			[""] = "o", ["็อ"] = "ɔ", ["เิ็"] = "ɤ",
			
			["า"] = "aː", ["ี"] = "iː", ["ื"] = "ɯː", ["ู"] = "uː", ["ู"] = "uː",
			["โ"] = "oː", ["อ"] = "ɔː", ["เิ"] = "ɤː", ["เอ"] = "ɤː",
		
			["เีย"] = "ia̯", ["เือ"] = "ɯa̯", ["ว"] = "ua̯",
			["ไ"] = "aj", ["เา"] = "aw", ["็อย"] = "ɔj", 
		}
	}
}

local unromLong = {
	["เีย"] = true, ["เือ"] = true, ["ัว"] = true, ["ว"] = true,
	["เือย"] = true, ["วาย"] = true, ["เอว"] = true,
	["เียว"] = true,
}

local liveExc = {
	["ัย"] = true, ["ใ"] = true, ["ไ"] = true, ["ไย"] = true,
	["ุย"] = true, ["วย"] = true, ["็อย"] = true, ["เิ็ย"] = true,
	["เา"] = true, ["ิว"] = true, ["เ็ว"] = true, ["แ็ว"] = true,
	["ำ"] = true,
}

-- ย,ว are not included.
-- ช,ซ,ส,ฟ,ล are changed for loanwords.
-- ห,อ,ฮ can never be codas.
local coda_ipa = {
	["paiboon"] = {
		["ก"] = "k", ["ข"] = "k", ["ฃ"] = "k", ["ค"] = "k", ["ฅ"] = "k", ["ฆ"] = "k",
		["จ"] = "t", ["ฉ"] = "t", ["ช"] = "ch", ["ซ"] = "s", ["ฌ"] = "t",
		["ฎ"] = "t", ["ฏ"] = "t", ["ฐ"] = "t", ["ฑ"] = "t", ["ฒ"] = "t",
		["ด"] = "t", ["ต"] = "t", ["ถ"] = "t", ["ท"] = "t", ["ธ"] = "t",
		["ศ"] = "t", ["ษ"] = "t", ["ส"] = "s",
		["บ"] = "p", ["ป"] = "p", ["ผ"] = "p", ["ฝ"] = "p", ["พ"] = "p", ["ฟ"] = "f", ["ภ"] = "p",
	
		["ง"] = "ng",
		["ญ"] = "n", ["ณ"] = "n", ["น"] = "n", ["ร"] = "n", ["ล"] = "l", ["ฬ"] = "n",
		["ม"] = "m",
	},

	["ipa"] = {
		["ก"] = "k̚", ["ข"] = "k̚", ["ฃ"] = "k̚", ["ค"] = "k̚", ["ฅ"] = "k̚", ["ฆ"] = "k̚",
		["จ"] = "t̚", ["ฉ"] = "t̚", ["ช"] = "t͡ɕʰ", ["ซ"] = "s", ["ฌ"] = "t̚",
		["ฎ"] = "t̚", ["ฏ"] = "t̚", ["ฐ"] = "t̚", ["ฑ"] = "t̚", ["ฒ"] = "t̚",
		["ด"] = "t̚", ["ต"] = "t̚", ["ถ"] = "t̚", ["ท"] = "t̚", ["ธ"] = "t̚",
		["ศ"] = "t̚", ["ษ"] = "t̚", ["ส"] = "s",
		["บ"] = "p̚", ["ป"] = "p̚", ["ผ"] = "p̚", ["ฝ"] = "p̚", ["พ"] = "p̚", ["ฟ"] = "f", ["ภ"] = "p̚",
	
		["ง"] = "ŋ",
		["ญ"] = "n", ["ณ"] = "n", ["น"] = "n", ["ร"] = "n", ["ล"] = "l", ["ฬ"] = "n",
		["ม"] = "m",
	},
}

local tFromMark = {
	-- common
	["่"] = { ["high"] = "low",     ["mid"] = "low",     ["low"] = "falling" },
	["้"] = { ["high"] = "falling", ["mid"] = "falling", ["low"] = "high" },
	["๊"] = { ["high"] = "high",    ["mid"] = "high",    ["low"] = "high" },
	["๋"] = { ["high"] = "rising",  ["mid"] = "rising",  ["low"] = "rising" },
	-- forced mid tone
	["̄"] = { ["high"] = "mid",     ["mid"] = "mid",     ["low"] = "mid" },
}

local tNoMark = {
	["dead-short"] = { ["high"] = "low",    ["mid"] = "low",  ["low"] = "high" },
	["dead-long"]  = { ["high"] = "low",    ["mid"] = "low",  ["low"] = "falling" },
	["live"]       = { ["high"] = "rising", ["mid"] = "mid",  ["low"] = "mid" },
}

local tRomMarks = {
	["high"] = "́", ["mid"] = "", ["low"] = "̀",
	["rising"] = "̌", ["falling"] = "̂",
}

local tLevels = {
	["high"] = "˦˥", ["mid"] = "˧", ["low"] = "˨˩",
	["rising"] = "˩˩˦", ["falling"] = "˥˩",
}

local permitted_cluster = {
	["ks"] = 1, ["ms"] = 1, ["ns"] = 1, ["ps"] = 1, ["ts"] = 1,
}

local mgvc_pattern = "^([รลว]?)([ิึุ็ีืัำู]?[าอรยว]?[วยร]?ะ?)([คฅฆกขฃพฟภบปชฌฑฒทธจฎฏดตฐถศษสมญณนรลฬง]?)$"
local full_pattern = "^([เแโใไ]?)(ห?ฺ?[กขฃคฅฆงจฉชซฌญฎฏฐฑฒณดตถทธนบปผฝพฟภมยรลวศษสหฬอฮ])(ฺ?[รลวต]?)([ิึุ็ีืัู]?็?[่้๊๋̄]?[าอรยวำ]?[วยร]?ะ?)([คฅฆกขฃพฟภบปชฌฑฒทธจฎฏดตฐถศษสมญณนรลฬง]?[คฅฆกขฃพฟภบปชฌฑฒทธจฎฏดตฐถศษสมญณนรลฬง]?)$"

function export.translit(text, lang, sc, mode, source)
	for word in mw.ustring.gmatch(text, "[ก-๛̄]+") do
		local orig_word, class, tMark, tone, long, coda = word, "", false, false, false, false
		if match(word, "[่้๊๋̄].?[่้๊๋̄]") then
			return nil
		end

		local function coda_decomp(coda_char, mode, source)
			local converted_coda = {}
			for character in mw.text.gsplit(coda_char, "") do
				table.insert(converted_coda, coda_ipa[mode][character])
			end
			local cluster = table.concat(converted_coda)
			if source == "translit-module" and not permitted_cluster[gsub(cluster, "̚", "")] then
				return coda_char
			else
				return cluster
			end
		end
		
		local function syllable(first_vowel, main, glide, second_vowel, coda)
			tMark = match(second_vowel, "[่้๊๋̄]")
			second_vowel = gsub(second_vowel, "[่้๊๋̄]", "")
			if match(main, "^ห.$") then
				if match(sub(main, 2, 2) .. glide .. second_vowel .. coda, mgvc_pattern) then
					main, glide, second_vowel, coda = "ห", match(sub(main, 2, 2) .. glide .. second_vowel .. coda, mgvc_pattern)
					if glide ~= "" and not second_vowel == "ย" then main, glide = main .. glide, "" end
				end
			end
			if glide == "ล" and second_vowel .. coda == "" then
				coda = glide
				glide = ""
			end
			openness = coda ~= "" and "closed" or "open"
			if source == "pron-module" and (mw.ustring.len(main) > 1 or match(glide, "[รล]")) and not match(main .. glide, "ฺ") then
				error("Please replace " ..  main .. glide .. " in the respelling with " .. sub(main, 1, 1) .. "ฺ" .. (sub(main, 2, -1) or "") .. glide .. ".")
			end
			if vowel_ipa[mode][openness][first_vowel .. glide .. second_vowel] then
				original_vowel = first_vowel .. glide .. second_vowel
				vowel, glide = vowel_ipa[mode][openness][first_vowel .. glide .. second_vowel], ""
			else
				original_vowel = first_vowel .. second_vowel
				vowel = vowel_ipa[mode][openness][first_vowel .. second_vowel] or (first_vowel .. second_vowel)
				glide = (initial_ipa[gsub(glide, "ฺ", "")] or initial_ipa[""])[mode]
			end
			main = gsub(main, "ฺ", "")
			initial, class = "", ""
			if initial_ipa[main] then
				initial, class = initial_ipa[main][mode], initial_ipa[main]["type"]
			else
				return nil
			end
			length = (match(vowel, "([aiʉueɛoɔə])%1") or match(vowel, "ː") or unromLong[original_vowel]) and "long" or "short"
			life = (match(coda, "[มญณนรลฬง]") or (match(original_vowel, "ย$") and match(vowel, "i$")) or
				coda..length == "long" or liveExc[original_vowel]) and "live" or "dead"
			coda = coda_ipa[mode][coda] or coda_decomp(coda, mode, source)
			tone = tMark and tFromMark[tMark][class] or (tNoMark[life.."-"..length] or tNoMark[life])[class]
			if mode == "paiboon" then
				vowel = gsub(vowel, "^([^aiʉueɛoɔə]*)([aiʉueɛoɔə])", "%1%2" .. tRomMarks[tone])
			else
				coda = coda .. tLevels[tone]
			end
			return initial .. glide .. vowel .. coda
		end
			
		word = gsub(word, full_pattern, syllable)

		text = gsub(text, orig_word, word, 1)
	end

	local count_syl = 0
	if mode == "ipa" then
		text, count_syl = gsub(text, "[ %-–]", ".") -- space, common hyphen, en dash
		if not match(text, "%.$") then
			count_syl = count_syl + 1
		end
		text = gsub(text, "([aiɯu])([˥-˩]+)$", "%1ʔ%2") -- add ʔ if last syllable ends with [aiɯu]
	end

	if match(text, "[ก-๛̄]") then
		if source == "translit-module" or mw.title.getCurrentTitle().nsText ~= "" then
			return nil
		else
			return "[[Category:Entries with failed Thai transliterations]]"
		end
	else
		return mw.ustring.toNFC(text) .. (count_syl > 0 and "[[Category:Thai " .. count_syl .. "-syllable words]]" or "")
	end
end

-- function annotate(main_text, annotation)
-- 	return "<span style=\"border-bottom: 1px dotted #000; cursor:help\" " ..
-- 		"title=\"" .. annotation .. "\">" .. main_text .. "</span>"
-- end

-- -- modified ISO 11940 (so that sound values are more apparent)
-- local charTable = {
-- 	["ก"] = "k", ["ข"] = "kʰ", ["ฃ"] = "x", ["ค"] = "g", ["ฅ"] = "ɣ", ["ฆ"] = "gʰ", ["ง"] = "ŋ",
-- 	["จ"] = "t͡ɕ", ["ฉ"] = "t͡ɕʰ", ["ช"] = "d͡ʑ", ["ซ"] = "z", ["ฌ"] = "d͡ʑʰ", ["ญ"] = "ɲ", 
-- 	["ฎ"] = "ᶑ", ["ฏ"] = "ʈ", ["ฐ"] = "ʈʰ", ["ฑ"] = "ɖ", ["ฒ"] = "ɖʰ", ["ณ"] = "ɳ",
-- 	["ด"] = "ɗ", ["ต"] = "t", ["ถ"] = "tʰ", ["ท"] = "d", ["ธ"] = "dʰ", ["น"] = "n",
-- 	["บ"] = "ɓ", ["ป"] = "p", ["ผ"] = "pʰ", ["ฝ"] = "f", ["พ"] = "b", ["ฟ"] = "v", ["ภ"] = "bʰ", ["ม"] = "m",
-- 	["ย"] = "y", ["ร"] = "r", ["ฤ"] = "ṛ", ["ล"] = "l", ["ฦ"] = "ḷ", ["ว"] = "w",
-- 	["ศ"] = "ɕ", ["ษ"] = "ʂ", ["ส"] = "s", ["ห"] = "h", ["ฬ"] = "ɭ", ["อ"] = "ɒ", ["ฮ"] = "ʔ",
	
-- 	["ะ"] = "a", ["ั"] = "ạ", ["า"] = "ā", ["ำ"] = "å", ["ิ"] = "i", ["ี"] = "ī",
-- 	["ึ"] = "ụ", ["ื"] = "ụ̄", ["ุ"] = "u", ["ู"] = "ū", ["ๅ"] = "ɨ", ["ฺ"] = "̥", ["฿"] = "฿", -- uses spacing marks
-- 	["เ"] = "Front-e</span>",
-- 	["แ"] = "Front-æ</span>",
-- 	["โ"] = "Front-o</span>",
-- 	["ใ"] = "Front-au</span>",
-- 	["ไ"] = "Front-ai</span>", 
	
-- 	["่"] = "ˋ", ["้"] = "ˆ", ["๊"] = "ˊ", ["๋"] = "ˇ", -- uses spacing marks
	
-- 	["ฯ"] = "ǂ", ["ๆ"] = "«", ["็"] = "˘", -- uses spacing marks
-- 	["์"] = annotate("ʻ","CANCEL"), ["ํ"] = "˚", ["๎"] = "~", ["๏"] = "§", -- uses spacing marks
-- 	["๚"] = "ǁ", ["๛"] = "»",
	
-- 	["๐"] = "0", ["๑"] = "1", ["๒"] = "2", ["๓"] = "3", ["๔"] = "4", 
-- 	["๕"] = "5", ["๖"] = "6", ["๗"] = "7", ["๘"] = "8", ["๙"] = "9", 
	
-- 	[" "] = "&nbsp;&nbsp;", -- for visibility
-- 	["-"] = "&ndash;", -- for visibility
-- 	["…"] = "…",
-- }

-- function export.getCharSeqTbl(text)
-- 	local result = {}
-- 	for character in mw.text.gsplit(text, "") do
-- 		local charDetail = charTable[character] or nil
-- 		if charDetail and charDetail[2] then
-- 			table.insert(result, annotate(charDetail[1], charDetail[2]))
-- 		else
-- 			table.insert(result, charDetail)
-- 		end
-- 	end
-- 	return result
-- end
		
		
-- function getCharSeq(text)
-- 	function tidyChar(text)
-- 		text = gsub(text, "%+ %+", " &nbsp;")
-- 		text = gsub(text, "%+%-%+", "&thinsp;—&thinsp;")
-- 		text = gsub(text, "Front%-", "<span style=\"border:1px dotted gray; border-radius:50%; cursor:help\" title=\"Vowel sign appearing in front of the initial consonant.\">")
-- 		return text
-- 	end
-- 	return "<br><small>" .. tidyChar(table.concat(export.getCharSeqTbl(text), "&thinsp;")) .. "</small>" -- thin space
-- end

-- local nSet = {
-- 	["aaw"] = annotate("-ɔɔ r-", "In this word, the double consonant combinations กร, ทร, ธร, มร, and หร are pronounced 'gaaw ra', 'thaaw ra', 'maaw ra' and 'haaw ra', respectively."),
-- 	["redup"] = annotate("Reduplication", "This word exhibits reduplication in pronunciation, i.e. one written consonant is used as the final consonant of a syllable as well as the initial consonant of the next syllable."),
-- 	["short"] = annotate("Short", "The vowel in this word is pronounced irregularly short."),
-- 	["unortho"] = annotate("Unorthographical", "This phonetic respelling violates Thai alphabet rules to indicate an irregular pronunciation."),
-- }

-- function export.show(frame)
-- 	local lang, sc = "th", "Thai"
-- 	local args = frame:getParent().args
-- 	local pagename = args.pagename or mw.title.getCurrentTitle().text
-- 	local p, note = {}, {}
	
-- 	if args["note"] then
-- 		for ind_note in mw.text.gsplit(args["note"], ",") do
-- 			table.insert(note, nSet[ind_note])
-- 		end
-- 	end

-- 	if args[1] then
-- 		for index, item in ipairs(args) do
-- 			table.insert(p, (item ~= "") and item or nil)
-- 		end
-- 	else
-- 		table.insert(p, pagename)
-- 	end
	
-- 	if match(table.concat(p, "/"), "็[ก-๛̄]*[่้๊๋̄]") or match(table.concat(p, "/"), "[่้๊๋̄][ก-๛̄]*็") or match(table.concat(p, "/"), "ิ็") then
-- 		table.insert(note, nSet["unortho"])
-- 		if not match(args["note"] or "", "short") then
-- 			table.insert(note, nSet["short"])
-- 		end
-- 	end

-- 	headFmt = '{| cellpadding=10 style="border-spacing: 2px; border: 1px solid darkgray; text-align:center"'
-- 	midFmt = '\n|-\n! bgcolor="#fafeff" style="border-bottom: 1px solid lightgray;border-right: 1px solid lightgray"|'
-- 	lastFmt = '\n|-\n!bgcolor="#fafeff" style="border-right: 1px solid lightgray"|'
-- 	normCellFmt = '\n|'
-- 	preCellFmt = '\n| style="border-right: 1px solid lightgray"|'
-- 	orthoCellFmt = '\n|colspan="' .. #p .. '" style="border-bottom: 1px solid lightgray"|'
-- 	footFmt = '\n|}'
-- 	homEdit = '<div style="float: right; clear: right; font-size:60%"><span class="plainlinks">[' ..
-- 		tostring(mw.uri.fullUrl("Module:th-hom/data", { ["action"] = "edit" })) ..
-- 		' edit]</span></div></sup>'
	
-- 	function formatThai(text, mode)
-- 		return (match(text, "-$")
-- 			and '<span style="background-color:#ffffe6"><small>[bound form]</small></span><br>'
-- 			or '') .. '<span lang="th" class="Thai">' .. text .. '</span>'
-- 	end
	
-- 	local result = { ["charPhon"] = {}, ["paiboon"] = {}, ["ipa"] = {}, ["homophone"] = {}, ["file"] = {} }
-- 	local m_hom_data = require("Module:th-hom/data")
-- 	local m_hom = require("Module:th-hom").makeList
-- 	local m_fileData = require("Module:th-pron/files")
-- 	for _, system in ipairs( { "charPhon", "paiboon", "ipa", "homophone", "file" } ) do
-- 		for i, spelling in ipairs(p) do
-- 			local before = {
-- 				["paiboon"] = "<span class=\"tr\">",
-- 				["ipa"] = "<span class=\"IPA\">/",
-- 				["homophone"] = '<div class="vsSwitcher vsToggleCategory-hompohones"><span class="vsToggleElement">&nbsp;</span><div class="vsShow" style="display:none"></div><div class="vsHide">',
-- 				["file"] = "[[File:",
-- 			}
-- 			local after = {
-- 				["paiboon"] = "</span>",
-- 				["ipa"] = "/</span>",
-- 				["homophone"] = "</div></div>",
-- 			}
-- 			local function fileAfter(text)
-- 				length = ((mw.ustring.len(gsub(text, "[^ %-]", "")) + 1) * 25 + 50)
-- 				return "|" .. (length > 200 and 200 or length) .. 
-- 					"px|center]][[Category:Thai terms with audio links]]"
-- 			end
-- 			table.insert(result[system], (i < #p and preCellFmt or normCellFmt) ..
-- 				(system == "charPhon"
-- 					and formatThai(spelling, true) .. getCharSeq(spelling)
-- 					or (system ~= "homophone"
-- 						and (system ~= "file" 
-- 							and before[system] .. export.translit(spelling, lang, sc, system, "pron-module") .. after[system]
-- 							or (m_fileData[spelling]
-- 								and before[system] .. m_fileData[spelling] .. fileAfter(spelling)
-- 								or "" ))
-- 						or (m_hom_data[spelling] and (#m_hom_data[spelling] > 3 
-- 							and before[system] .. gsub(m_hom(spelling), ", ", "<br>") .. after[system]
-- 							or gsub(m_hom(spelling), ", ", "<br>")) or "" ))))
-- 		end
-- 	end
-- 	inclHom = match(table.concat(result["homophone"]), "Thai") or false
-- 	inclFile = match(table.concat(result["file"]), "terms") or false
	
-- 	return
-- 		headFmt ..
		
-- 		((mw.title.getCurrentTitle().nsText ~= "" and not args.pagename)
			
-- 			and (midFmt .. "''[[w:Thai alphabet|Phonemic]]''" ..
-- 				(#note > 0 and "<br><small>{" .. table.concat(note, "; ") .. "}</small>" or ""))
			
-- 			or (pagename == table.concat(p)
			
-- 				and (midFmt .. "''[[w:Thai alphabet|Orthographic/Phonemic]]''")
			
-- 				or (midFmt .. "''[[w:Thai alphabet|Orthographic]]''" ..
-- 					orthoCellFmt .. formatThai(pagename)) .. getCharSeq(pagename) ..
				
-- 					midFmt .. "''[[w:Thai alphabet|Phonemic]]''" ..
-- 					(#note > 0 and "<br><small>{" .. table.concat(note, "; ") .. "}</small>" or ""))) ..
			
-- 		table.concat(result["charPhon"]) ..
		
-- 		midFmt .. "''[[Wiktionary:Thai transliteration|Paiboon]]''" ..
-- 		table.concat(result["paiboon"]) ..
		
-- 		((inclHom or inclFile) and midFmt or lastFmt) .. "(''[[w:Standard Thai|standard]]'') [[Wiktionary:International Phonetic Alphabet|IPA]]<sup>([[Appendix:Thai pronunciation|key]])</sup>" ..
-- 		table.concat(result["ipa"]) ..
		
-- 		(inclHom and (inclFile and midFmt or lastFmt) .. "''Homophones''" .. homEdit .. table.concat(result["homophone"]) or "") ..
		
-- 		(inclFile and lastFmt .. "''Audio''" .. table.concat(result["file"]) or "") ..
		
-- 		footFmt ..

-- 		(match(pagename, "ทร") and match(table.concat(result["charPhon"]), "ซ") and "[[Category:Thai terms spelled with ทร read as ซ]]" or "")

-- end

return export