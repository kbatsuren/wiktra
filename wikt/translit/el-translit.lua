-- This module will transliterate Greek language text per WT:EL TR.
-- Language code: ell
-- Greek language is 
--[[
ISO 639-1	el
ISO 639-2	gre (B) ell (T)
ISO 639-3	Variously:
ell – Modern Greek
grc – Ancient Greek
cpg – Cappadocian Greek
gmy – Mycenaean Greek
pnt – Pontic
tsd – Tsakonian
yej – Yevanic
Glottolog	gree1276[3]
]]
local export = {}

local tt = {
	["α"] = "a",  ["ά"] = "á",  ["β"] = "v",  ["γ"] = "g",  ["δ"] = "d",
	["ε"] = "e",  ["έ"] = "é",  ["ζ"] = "z",  ["η"] = "i",  ["ή"] = "í",
	["θ"] = "th", ["ι"] = "i",  ["ί"] = "í",  ["ϊ"] = "ï",  ["ΐ"] = "ḯ",
	["κ"] = "k",  ["λ"] = "l",  ["μ"] = "m",  ["ν"] = "n",  ["ξ"] = "x",
	["ο"] = "o",  ["ό"] = "ó",  ["π"] = "p",  ["ρ"] = "r",  ["σ"] = "s",
	["ς"] = "s",  ["τ"] = "t",  ["υ"] = "y",  ["ύ"] = "ý",  ["ϋ"] = "ÿ",
	["ΰ"] = "ÿ́",  ["φ"] = "f",  ["χ"] = "ch", ["ψ"] = "ps", ["ω"] = "o",
	["ώ"] = "ó",
	["Α"] = "A",  ["Ά"] = "Á",  ["Β"] = "V",  ["Γ"] = "G",  ["Δ"] = "D",
	["Ε"] = "E",  ["Έ"] = "É",  ["Ζ"] = "Z",  ["Η"] = "I",  ["Ή"] = "Í",
	["Θ"] = "Th", ["Ι"] = "I",  ["Ί"] = "Í",  ["Κ"] = "K",  ["Λ"] = "L",
	["Μ"] = "M",  ["Ν"] = "N",  ["Ξ"] = "X",  ["Ο"] = "O",  ["Ό"] = "Ó",
	["Π"] = "P",  ["Ρ"] = "R",  ["Σ"] = "S",  ["Τ"] = "T",  ["Υ"] = "Y",
	["Ύ"] = "Ý",  ["Φ"] = "F",  ["Χ"] = "Ch", ["Ψ"] = "Ps", ["Ω"] = "O",
	["Ώ"] = "Ó",
	[";"] = "?",  ["·"] = ";"
}

-- transliterates any words or phrases
function export.tr(text, lang, sc)
	local gsub = mw.ustring.gsub
	
	local acute = mw.ustring.char(0x301)
	local diaeresis = mw.ustring.char(0x308)
	
	text = gsub(text, "([αεηΑΕΗ])([υύ])(.?)",
				function (vowel, upsilon, following)
					return tt[vowel]
						.. (upsilon == "ύ" and acute or "")
						.. (("θκξπσςτφχψ"):find(following) and "f" or "v")
						.. following
				end)
	
	text = gsub(text, "([αεοωΑΕΟΩ])([ηή])",
				function (vowel, ita)
					if ita == "ή" then
						return tt[vowel] .. "i" .. diaeresis .. acute
					else
						return tt[vowel] .. "i" .. diaeresis
					end
				end)
	
	text = gsub(text, "[οΟ][υύ]",
				{["ου"] = "ou", ["ού"] = "oú",
				 ["Ου"] = "Ou", ["Ού"] = "Oú"})

	text = gsub(text, "(.?)([μΜ])π",
				function (before, mi)
					if before == "" or before == " " or before == "-" then
						if mi == "Μ" then
							return before .. "B"
						else
							return before .. "b"
						end
					end
				end)
	
	text = gsub(text, "(.?)([νΝ])τ",
				function (before, ni)
					if before == "" or before == " " or before == "-" then
						if ni == "Ν" then
							return before .. "D"
						else
							return before .. "d"
						end
					end
				end)

	text = gsub(text, "γ([γξχ])", "n%1")

	text = gsub(text, ".", tt)

	return text
end

return export

-- 1 test failed. (refresh)

-- test:
-- Text	Expected	Actual
-- Passed	Ποσειδώνας	Poseidónas	Poseidónas
-- Passed	αγιοποιούμαι	agiopoioúmai	agiopoioúmai
-- Passed	αγγελιάζομαι	angeliázomai	angeliázomai
-- Passed	άμπελος	ámpelos	ámpelos
-- ypsilon
-- Passed	αυτός	aftós	aftós
-- Passed	πλευρά	plevrá	plevrá
-- Passed	αύριο	ávrio	ávrio
-- Passed	αύξηση	áfxisi	áfxisi
-- Passed	ευημερία	evimería	evimería
-- Passed	καθαρεύουσα	katharévousa	katharévousa
-- Passed	υπάρχω	ypárcho	ypárcho
-- diaeresis added for disambiguation
-- Passed	βοήθεια	voḯtheia	voḯtheia
-- nasal–stop clusters
-- Passed	μπαμπάς	bampás	bampás
-- Passed	ντετέκτιβ	detéktiv	detéktiv
-- Failed	Έβαλε ντετέκτιβ	Évale detéktiv	Évale ntetéktiv
-- Passed	εντάξει	entáxei	entáxei
-- Passed	γκαράζ	gkaráz	gkaráz
-- Passed	ανάγκη	anágki	anágki
-- diphthongs ending in iota
-- Passed	είναι	eínai	eínai
-- Passed	οικείος	oikeíos	oikeíos
-- return require "Module:transliteration module testcases"(
-- 	require "Module:el-translit".tr,
-- 	{
-- 		{ "Ποσειδώνας", "Poseidónas" },
-- 		{ "αγιοποιούμαι", "agiopoioúmai" },
-- 		{ "αγγελιάζομαι", "angeliázomai" },
-- 		{ "άμπελος", "ámpelos" },
-- 		"ypsilon",
-- 		{ "αυτός", "aftós" },
-- 		{ "πλευρά", "plevrá" },
-- 		{ "αύριο", "ávrio" },
-- 		{ "αύξηση", "áfxisi" },
-- 		{ "ευημερία", "evimería" },
-- 		{ "καθαρεύουσα", "katharévousa" },
-- 		{ "υπάρχω", "ypárcho" },
-- 		"diaeresis added for disambiguation",
-- 		{ "βοήθεια", "voḯtheia" },
-- 		"nasal&ndash;stop clusters",
-- 		{ "μπαμπάς", "bampás" },
-- 		{ "ντετέκτιβ", "detéktiv" },
-- 		{ "Έβαλε '''ντετέκτιβ'''", "Évale '''detéktiv'''" },
-- 		{ "εντάξει", "entáxei" },
-- 		{ "γκαράζ", "gkaráz" },
-- 		{ "ανάγκη", "anágki" },
-- 		"diphthongs ending in iota",
-- 		{ "είναι", "eínai" },
-- 		{ "οικείος", "oikeíos" },
-- 		--[[
-- 		Copy this to add more examples:
-- 		{ "", "" },
-- 		--]]
-- 	},
-- 	"Grek", "el")