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

return data