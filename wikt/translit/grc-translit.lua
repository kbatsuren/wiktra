--[[
This module will transliterate Ancient Greek language text per WT:GRC TR. 
It is also used to transliterate Cappadocian Greek (cpg), Paeonian (ine-pae), 
Pontic Greek (pnt) and Ancient Macedonian (xmk).
]]

local export = {}

local data = {}

local U = mw.ustring.char
local macron = U(0x304)
local spacing_macron = U(0xAF)
local modifier_macron = U(0x2C9)
local breve = U(0x306)
local spacing_breve = U(0x2D8)
local rough = U(0x314)
local smooth = U(0x313)
local diaeresis = U(0x308)
local acute = U(0x301)
local grave = U(0x300)
local circum = U(0x342)
local Latin_circum = U(0x302)
local coronis = U(0x343)
local subscript = U(0x345)
local undertie = mw.ustring.char(0x35C) -- actually "combining double breve below"

data["diacritics"] = {
	["macron"] = macron,
	["spacing_macron"] = spacing_macron,
	["modifier_macron"] = modifier_macron,
	["breve"] = breve,
	["spacing_breve"] = spacing_breve,
	["rough"] = rough,
	["smooth"] = smooth,
	["diaeresis"] = diaeresis,
	["acute"] = acute,
	["grave"] = grave,
	["circum"] = circum,
	["Latin_circum"] = Latin_circum,
	["coronis"] = coronis,
	["subscript"] = subscript,
}

data.diacritics.all = ""
for name, diacritic in pairs(data.diacritics) do
	data.diacritics.all = data.diacritics.all .. diacritic
end

data["named"] = data["diacritics"]

data["diacritic"] = "[" .. data.diacritics.all .. "]"
data["all"] = data["diacritic"]

data["diacritic_groups"] = {
	[1] = "[".. macron .. breve .."]",
	[2] = "[".. diaeresis .. smooth .. rough .."]",
	[3] = "[".. acute .. grave .. circum .. "]",
	[4] = subscript,
}
data["groups"] = data["diacritic_groups"]
data["diacritic_groups"]["accents"] = data["groups"][3]

data["diacritic_order"] = {
	[macron] = 1,
	[breve] = 1,
	[rough] = 2,
	[smooth] = 2,
	[diaeresis] = 2,
	[acute] = 3,
	[grave] = 3,
	[circum] = 3,
	[subscript] = 4,
}

data["diacritical_conversions"] = {
	-- Convert spacing to combining diacritics
	[spacing_macron] = macron, -- macron
	[modifier_macron] = macron,
	[spacing_breve] = breve, -- breve
	["῾"] = rough, -- rough breathing, modifier letter reversed comma
	["ʽ"] = rough,
	["᾿"] = smooth, -- smooth breathing, modifier letter apostrophe, coronis, combining coronis
	["ʼ"] = smooth,
	[coronis] = smooth,
	["´"] = acute, -- acute
	["`"] = grave, -- grave
	["῀"] = circum, -- Greek circumflex (perispomeni), circumflex, combining circumflex
	["ˆ"] = circum,
	[Latin_circum] = circum,
	["῎"] = smooth ..  acute, -- smooth and acute
	["῍"] = smooth ..  grave, -- smooth and grave
	["῏"] = smooth ..  circum, -- smooth and circumflex
	["῞"] = rough ..  acute, -- rough and acute
	["῝"] = rough ..  grave, -- rough and grave
	["῟"] = rough ..  circum, -- rough and circumflex
	["¨"] = diaeresis,
	["΅"] = diaeresis ..  acute,
	["῭"] = diaeresis ..  grave,
	["῁"] = diaeresis ..  circum,
}
data["conversions"] = data["diacritical_conversions"]

data["consonants"] = "ΒβΓγΔδΖζΘθΚκΛλΜμΝνΞξΠπΡρΣσςΤτΦφΧχΨψ"
data["consonant"] = "[" .. data.consonants .. "]"
data["vowels"] = "ΑαΕεΗηΙιΟοΥυΩω"
data["vowel"] = "[" .. data.vowels .. "]"
data["combining_diacritics"] = table.concat{
	macron, breve,
	rough, smooth, diaeresis,
	acute, grave, circum,
	subscript
}
data["combining_diacritic"] = "[" .. data.combining_diacritics .. "]"

-- Basic letters with and without diacritics
local letters_with_diacritics = 'ΆΈ-ώϜϝἀ-ᾼῂ-ῌῐ-' ..
	-- capital iota with oxia, normalized to capital iota with tonos if entered
	-- literally in a string
	U(0x1FDB) ..
	'Ὶῠ-Ῥῲ-ῼ'
data.word_characters = letters_with_diacritics .. data.combining_diacritics ..
	undertie
data.word_character = "[" .. data.word_characters .. "]"

local m_data = data
local tokenize = require('/usr/local/lib/lua/wikt/translit/utilities/grc').tokenize

local ufind = mw.ustring.find
local ugsub = mw.ustring.gsub
local U = mw.ustring.char
local ulower = mw.ustring.lower
local uupper = mw.ustring.upper

local UTF8char = '[%z\1-\127\194-\244][\128-\191]*'

-- Diacritics
local diacritics = m_data.named

-- Greek
local acute = diacritics.acute
local grave = diacritics.grave
local circumflex = diacritics.circum
local diaeresis = diacritics.diaeresis
local smooth = diacritics.smooth
local rough = diacritics.rough
local macron = diacritics.macron
local breve = diacritics.breve
local subscript = diacritics.subscript

-- Latin
local hat = diacritics.Latin_circum

local macron_diaeresis = macron .. diaeresis .. "?" .. hat
local a_subscript = '^[αΑ].*' .. subscript .. '$'
local velar = 'κγχξ'

local tt = {
	-- Vowels
	["α"] = "a",
	["ε"] = "e",
	["η"] = "e" .. macron,
	["ι"] = "i",
	["ο"] = "o",
	["υ"] = "u",
	["ω"] = "o" .. macron,

	-- Consonants
	["β"] = "b",
	["γ"] = "g",
	["δ"] = "d",
	["ζ"] = "z",
	["θ"] = "th",
	["κ"] = "k",
	["λ"] = "l",
	["μ"] = "m",
	["ν"] = "n",
	["ξ"] = "x",
	["π"] = "p",
	["ρ"] = "r",
	["σ"] = "s",
	["ς"] = "s",
	["τ"] = "t",
	["φ"] = "ph",
	["χ"] = "kh",
	["ψ"] = "ps",
	
	-- Archaic letters
	["ϝ"] = "w",
	["ϻ"] = "ś",
	["ϙ"] = "q",
	["ϡ"] = "š",
	["ͷ"] = "v",
	
	-- Incorrect characters: see [[Wiktionary:About Ancient Greek#Miscellaneous]].
	-- These are tracked by [[Module:script utilities]].
	["ϐ"] = "b",
	["ϑ"] = "th",
	["ϰ"] = "k",
	["ϱ"] = "r",
	["ϲ"] = "s",
	["ϕ"] = "ph",
	
	-- Diacritics
	-- unchanged: macron, diaeresis, grave, acute
	[breve] = '',
	[smooth] = '',
	[rough] = '',
	[circumflex] = hat,
	[subscript] = 'i',
}

function export.tr(text, lang, sc)
	-- If the script is given as Cprt, then forward the transliteration to that module.
	-- This should not be necessary, as [[Module:translit-redirect]] redirects
	-- to this module only if script is polytonic.
	if sc == "Cprt" then
		-- [[Special:WhatLinksHere/Template:tracking/grc-translit/Cprt]]
		require('Module:debug').track('grc-translit/Cprt')
		return require('Module:Cprt-translit').tr(text, lang, sc)
	end
	
	if text == '῾' then
		return 'h'
	end
	
	--[[
		Replace semicolon or Greek question mark with regular question mark,
		except after an ASCII alphanumeric character (to avoid converting
		semicolons in HTML entities).
	]]
	text = ugsub(text, "([^A-Za-z0-9])[;" .. U(0x37E) .. "]", "%1?")
	
	-- Handle the middle dot. It is equivalent to semicolon or colon, but semicolon is probably more common.
	text = text:gsub("·", ";")
	
	local tokens = tokenize(text)

	--now read the tokens
	local output = {}
	for i, token in pairs(tokens) do
		-- Convert token to lowercase and substitute each character
		-- for its transliteration
		local translit = ulower(token):gsub(UTF8char, tt)
		
		local next_token = tokens[i + 1]
		
		if token == 'γ' and next_token and velar:find(next_token, 1, true) then
			-- γ before a velar should be <n>
			translit = 'n'
		elseif token == 'ρ' and tokens[i - 1] == 'ρ' then
			-- ρ after ρ should be <rh>
			translit = 'rh'
		elseif ufind(token, a_subscript) then
			-- add macron to ᾳ
			translit = ugsub(translit, '([aA])', '%1' .. macron)
		end
		
		if token:find(rough) then
			if ufind(token, '^[Ρρ]') then
				translit = translit .. 'h'
			else -- vowel
				translit = 'h' .. translit
			end
		end
		
		-- Remove macron from a vowel that has a circumflex.
		if ufind(translit, macron_diaeresis) then
			translit = translit:gsub(macron, '')
		end
		
		-- Capitalize first character of transliteration.
		if token ~= ulower(token) then
			translit = translit:gsub("^" .. UTF8char, uupper)
		end
		
		table.insert(output, translit)
	end
	output = table.concat(output)
	
	return output
end

return export


-- Text	Expected	Actual
-- Passed	λόγος	lógos	lógos
-- Passed	σφίγξ	sphínx	sphínx
-- Passed	ϝάναξ	wánax	wánax
-- Passed	οἷαι	hoîai	hoîai
-- u/y
-- Passed	ταῦρος	taûros	taûros
-- Passed	νηῦς	nēûs	nēûs
-- Passed	σῦς	sûs	sûs
-- Passed	ὗς	hûs	hûs
-- Passed	γυῖον	guîon	guîon
-- Passed	ἀναῡ̈τέω	anaṻtéō	anaṻtéō
-- Passed	δαΐφρων	daḯphrōn	daḯphrōn
-- vowel length
-- Passed	τῶν	tôn	tôn
-- Passed	τοὶ	toì	toì
-- Passed	τῷ	tôi	tôi
-- Passed	τούτῳ	toútōi	toútōi
-- Passed	σοφίᾳ	sophíāi	sophíāi
-- Passed	μᾱ̆νός	mānós	mānós
-- h (rough breathing)
-- Passed	ὁ	ho	ho
-- Passed	οἱ	hoi	hoi
-- Passed	εὕρισκε	heúriske	heúriske
-- Passed	ὑϊκός	huïkós	huïkós
-- Passed	πυρρός	purrhós	purrhós
-- Passed	ῥέω	rhéō	rhéō
-- Passed	σάἁμον	sáhamon	sáhamon
-- capitals
-- Passed	Ὀδυσσεύς	Odusseús	Odusseús
-- Passed	Εἵλως	Heílōs	Heílōs
-- Passed	ᾍδης	Hā́idēs	Hā́idēs
-- Passed	ἡ Ἑλήνη	hē Helḗnē	hē Helḗnē
-- Passed	𐠠𐠒𐠯𐠗	pi-lo-ti-mo	pi-lo-ti-mo
-- punctuation
-- Passed	ἔχεις μοι εἰπεῖν, ὦ Σώκρατες, ἆρα διδακτὸν ἡ ἀρετή;	ékheis moi eipeîn, ô Sṓkrates, âra didaktòn hē aretḗ?	ékheis moi eipeîn, ô Sṓkrates, âra didaktòn hē aretḗ?
-- Passed	τί τηνικάδε ἀφῖξαι, ὦ Κρίτων; ἢ οὐ πρῲ ἔτι ἐστίν;	tí tēnikáde aphîxai, ô Krítōn? ḕ ou prṑi éti estín?	tí tēnikáde aphîxai, ô Krítōn? ḕ ou prṑi éti estín?
-- Passed	τούτων φωνήεντα μέν ἐστιν ἑπτά· α ε η ι ο υ ω.	toútōn phōnḗenta mén estin heptá; a e ē i o u ō.	toútōn phōnḗenta mén estin heptá; a e ē i o u ō.
-- Passed	πήγ(νῡμῐ)	pḗg(nūmi)	pḗg(nūmi)
-- HTML entities
-- Passed	καλός καὶ ἀγαθός	kalós&nbsp;kaì&nbsp;agathós	kalós&nbsp;kaì&nbsp;agathós
-- Passed	καλός καὶ ἀγαθός	kalós&#32;kaì&#32;agathós	kalós&#32;kaì&#32;agathós