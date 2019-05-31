-- This module will transliterate text in the Gurmukhi script. It is used to transliterate Punjabi (pa).
-- Language code: pan – Eastern Punjabi
-- 				  pnb – Western Punjabi
local export = {}

local conv = {
	--consonants without nukta
	["ਸ"] = "s",
	["ਹ"] = "h",
	["ਕ"] = "k", ["ਖ"] = "kh", ["ਗ"] = "g", ["ਘ"] = "gh", ["ਙ"] = "ṅ",
	["ਚ"] = "c", ["ਛ"] = "ch", ["ਜ"] = "j", ["ਝ"] = "jh", ["ਞ"] = "ñ",
	["ਟ"] = "ṭ", ["ਠ"] = "ṭh", ["ਡ"] = "ḍ", ["ਢ"] = "ḍh", ["ਣ"] = "ṇ",
	["ਤ"] = "t", ["ਥ"] = "th", ["ਦ"] = "d", ["ਧ"] = "dh", ["ਨ"] = "n",
	["ਪ"] = "p", ["ਫ"] = "ph", ["ਬ"] = "b", ["ਭ"] = "bh", ["ਮ"] = "m",
	["ਯ"] = "y", ["ਰ"] = "r", ["ਲ"] = "l", 	["ਵ"] = "v", ["ੜ"] = "ṛ",
	
	--consonants with nukta
	["ਸ਼"] = "ś",
	["ਖ਼"] = "x",
	["ਗ਼"] = "ġ",
	["ਜ਼"] = "z",
	["ਫ਼"] = "f",
	["ਲ਼"] = "ḷ",
	
	-- vowels
	["ਾ"] = "ā",
	["ਿ"] = "i", ["ੀ"] = "ī",
	["ੁ"] = "u", ["ੂ"] = "ū",
	["ੇ"] = "e", ["ੈ"] = "ē",
	["ੋ"] = "o", ["ੌ"] = "au",
	
	-- other diacritics
	["ੰ"] = "N", --ṭippi: nasalize
	["ਂ"] = "N", --bindi: nasalize
	["ੱ"] = "ː", --addak: germinate
	["੍"] = "", --halant, supresses the inherent vowel "a"
	["ਃ"] = "h", --voiceless "h" sound (tone raiser)
	
	-- independent vowels
	["ਅ"] = "a", ["ਆ"] = "ā",
	["ਇ"] = "i", ["ਈ"] = "ī",
	["ਉ"] = "u", ["ਊ"] = "ū",
	["ਏ"] = "e", ["ਐ"] = "ē",
	["ਓ"] = "o", ["ਔ"] = "ō",
	
	-- digits
	["੦"] = "0", ["੧"] = "1", ["੨"] = "2", ["੩"] = "3", ["੪"] = "4",
	["੫"] = "5", ["੬"] = "6", ["੭"] = "7", ["੮"] = "8", ["੯"] = "9",
}

local nasal_assim = {
	["[kg]h?"] = "ṅ",
	["[cj]h?"] = "ñ",
	["[ṭḍ]h?"] = "ṇ",
	["[td]h?"] = "n",
	["[pb]h?"] = "m",
	["n"] = "n",
	["m"] = "m",
    ["s"] = "n",
}

-- translit any words or phrases
function export.tr(text, lang, sc)
	local c = "([ਸਹਕਖਗਘਙਚਛਜਝਞਟਠਡਢਣਤਥਦਧਨਪਫਬਭਮਯਰਲਵੜː]਼?)"
	local y = "ਯ"
	local v = "([aਾਿੀੁੂੇੈੋੌ੍])"
	local virama = "੍"
	local n = "([ੰਂ]?)"
	local nukta = "([ਸਖਗਜਫਲ]਼)"
	
	can_drop = mw.ustring.gsub(c,y,"")
	no_virama = mw.ustring.gsub(v,virama,"")
	
	text = text .. " "
	
	text = mw.ustring.gsub(text,c,"%1a")
	text = mw.ustring.gsub(text,"a"..v,"%1")
	-- mw.log(text)
	text = mw.ustring.gsub(text,v..n..can_drop.."a ","%1%2%3 ") --ending
	-- mw.log(text)
	text = mw.ustring.gsub(text,v..n..can_drop.."a"..c..v,"%1%2%3%4%5")
	-- mw.log(text)
	
	text = mw.ustring.gsub(text,nukta,conv)
	text = mw.ustring.gsub(text,".",conv)
	
	for key,val in pairs(nasal_assim) do
		text = mw.ustring.gsub(text,"N("..key..")",val.."%1")
	end
	text = mw.ustring.gsub(text,"([aiueēoāīū])N ", "%1̃ ")
	text = mw.ustring.gsub(text,"(.?)N", "%1̃")
	
	text = mw.ustring.gsub(text,"ː(.)","%1%1")
	
	text = mw.ustring.gsub(text," ?।",".")
	
	text = mw.ustring.gsub(text," $","")
	
	return mw.ustring.toNFC(text)
end
 
return export