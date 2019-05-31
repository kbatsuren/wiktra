-- This module will transliterate text in the Old South Arabian script.

local export = {}

local correspondences = {
	["𐩠"] = "h", ["𐩡"] = "l", ["𐩢"] = "ḥ", ["𐩣"] = "m", ["𐩤"] = "q",
	["𐩥"]= "w", ["𐩦"] = "s²", ["𐩧"] = "r", ["𐩨"] = "b", ["𐩩"] = "t",
	["𐩪"] = "s¹", ["𐩫"] = "k", ["𐩬"] = "n", ["𐩭"] = "ḫ", ["𐩮"] = "ṣ",
	["𐩯"] = "s³", ["𐩰"] = "f", ["𐩱"] = "ʾ", ["𐩲"] = "ʿ", ["𐩳"] = "ḍ",
	["𐩴"] = "g", ["𐩵"] = "d", ["𐩶"] = "ġ", ["𐩷"] = "ṭ", ["𐩸"] = "z",
	["𐩹"] = "ḏ", ["𐩺"] = "y", ["𐩻"] = "ṯ", ["𐩼"] = "ẓ",
	
	["𐩽"] = " ",
}

local numbers = {
	["𐩽"] = "1",
	["𐩭"] = "5",
	["𐩲"] = "10",
	["𐩾"] = "50",
	["𐩣"] = "100",
	["𐩱"] = "1000",
}

function export.tr(text, lang, sc)
	-- Interpret numbers.
	-- Will not work for thousands!
	text = text:gsub(
		"𐩿([^𐩿])𐩿",
		function (number)
			local value = 0
			for digit in mw.ustring.gmatch(number, ".") do
				value = value + numbers[digit] or error("The character " .. digit .. " in " .. number .. " does not have a numeric value.")
			end
			return value
		end)
	
	text = mw.ustring.gsub(text, ".", correspondences)
	
	return text
end

return export

-- 5 tests failed. (refresh)

-- test:
-- Text	Expected	Actual
-- Failed	𐩱𐩫𐩪𐩥𐩩	ʾkswt	ʾks¹wt
-- Passed	𐩠𐩧𐩥𐩺	hrwy	hrwy
-- Passed	𐩹𐩩𐩢𐩣𐩺𐩣	ḏtḥmym	ḏtḥmym
-- Failed	𐩣𐩡𐩫𐩩𐩪𐩨𐩱	mlktsbʾ	mlkts¹bʾ
-- Passed	𐩫𐩥𐩫𐩨	kwkb	kwkb
-- Passed	𐩧𐩢𐩨𐩩	rḥbt	rḥbt
-- Failed	𐩦𐩣𐩪𐩣	šmsm	s²ms¹m
-- Failed	𐩪𐩨𐩡𐩩	sblt	s¹blt
-- Failed	𐩬𐩴𐩦	ngš	ngs²
-- return require "Module:transliteration module testcases"(
-- 	require "Module:Sarb-translit".tr,
-- 	{
-- 		{ "𐩱𐩫𐩪𐩥𐩩", "ʾkswt" },
-- 		{ "𐩠𐩧𐩥𐩺", "hrwy" },
-- 		{ "𐩹𐩩𐩢𐩣𐩺𐩣", "ḏtḥmym" },
-- 		{ "𐩣𐩡𐩫𐩩𐩪𐩨𐩱", "mlktsbʾ" },
-- 		{ "𐩫𐩥𐩫𐩨", "kwkb" },
-- 		{ "𐩧𐩢𐩨𐩩", "rḥbt" },
-- 		{ "𐩦𐩣𐩪𐩣", "šmsm" },
-- 		{ "𐩪𐩨𐩡𐩩", "sblt" },
-- 		{ "𐩬𐩴𐩦", "ngš" },
-- 	},
-- 	"Sarb", "sem-srb")