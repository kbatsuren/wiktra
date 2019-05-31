local export = {}

local U = mw.ustring.char

local fatHatan = U(0x64B)
local zabar = U(0x64E)
local zer = U(0x64F)
local pesh = U(0x650)
local tashdid = U(0x651) -- also called shadda
local jazm = U(0x652)

 
local mapping = {
	["ا"] = 'ā', ["ب"] = 'b', ["پ"] = 'p', ["ت"] = 't', ["ٹ‬"] = 'ṭ', ["ث"] = 's',
	["ج"] = 'j', ["چ"] = 'c', ["ح"] = 'h', ["خ"] = 'x', 
	["د"] = 'd', ["ڈ‬"] = 'ḍ', ["ذ"] = 'z', ["ر"] = 'r', ["ڑ‬"] = "ṛ", ["ز"] = 'z', ["ژ"] = 'ž',
	["س"] = 's', ["ش"] = 'ś', ["ص"] = 's', ["ض"] = 'z', 
	["ط"] = 't', ["ظ"] = 'z', ["غ"] = 'ġ', ["ف"] = 'f', ["ق"] = 'q',
	["ک"] = 'k', ["گ"] = 'g',
	["ل"] = 'l', ["م"] = 'm', ["ن"] = 'n', ["و"] = 'u', ["ه"] = 'h', ["ی"] = 'i', ["آ"] = 'â',

	-- nun gunnah
	["ں‬"] = '̃',

	["و‬"] = "W",
	["ه‬"] = "h", ["ھ‬"] = "h",
	["ي‬"] = "ī",

	["ع"] = '’',
	["ء"] = '’',
	["ئ"] = '’', 
	["ؤ"] = '’',
	["أ"] = '’',
	
	-- diacritics
	[zabar] = "a",
	[zer] = "i",
	[pesh] = "u",
	[jazm] = "", -- also sokun - no vowel
	[U(0x200C)] = "-", -- ZWNJ (zero-width non-joiner)
	[fatHatan] = "n",
	-- ligatures
	["ﻻ"] = "lā",
	["ﷲ"] = "llāh",
	-- kashida
	["ـ"] = "", -- kashida, no sound
	-- numerals
	["۱"] = "1", ["۲"] = "2", ["۳"] = "3", ["۴"] = "4", ["۵"] = "5",
	["۶"] = "6", ["۷"] = "7", ["۸"] = "8", ["۹"] = "9", ["۰"] = "0",
	-- normal arabic variants to numerals
	["١"] = "1", ["٢"] = "2", ["٣"] = "3", ["٤"] = "4", ["٥"] = "5",
	["٦"] = "6", ["٧"] = "7", ["٨"] = "8", ["٩"] = "9", ["٠"] = "0",
	-- punctuation (leave on separate lines)
	["؟"] = "?", -- question mark
	["،"] = ",", -- comma
	["؛"] = ";", -- semicolon
	["«"] = '“', -- quotation mark
	["»"] = '”', -- quotation mark
	["٪"] = "%", -- percent
	["؉"] = "‰", -- per mille
	["٫"] = ".", -- decimals
	["٬"] = ",", -- thousand
	["ۀ"] = "-ye" -- he ye (in ezâfe)
}
 
function export.tr(text, lang, sc)

	text = mw.ustring.gsub(text, '.', mapping)

	return text
end
 
return export