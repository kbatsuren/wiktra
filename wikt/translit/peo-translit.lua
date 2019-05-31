-- This module will transliterate Old Persian language text.

local export = {}

local tt = {
	["𐎠"] = "a",
	["𐎡"] = "i",
	["𐎢"] = "u",
	["𐎣"] = "k",
	["𐎤"] = "ku",
	["𐎥"] = "g",
	["𐎦"] = "gu",
	["𐎧"] = "x",
	["𐎨"] = "c",
	["𐎩"] = "j",
	["𐎪"] = "ji",
	["𐎫"] = "t",
	["𐎬"] = "tu",
	["𐎭"] = "d",
	["𐎮"] = "di",
	["𐎯"] = "du",
	["𐎰"] = "θ",
	["𐎱"] = "p",
	["𐎲"] = "b",
	["𐎳"] = "f",
	["𐎴"] = "n",
	["𐎵"] = "nu",
	["𐎶"] = "m",
	["𐎷"] = "mi",
	["𐎸"] = "mu",
	["𐎹"] = "y",
	["𐎺"] = "v",
	["𐎻"] = "vi",
	["𐎼"] = "r",
	["𐎽"] = "ru",
	["𐎾"] = "l",
	["𐎿"] = "s",
	["𐏀"] = "z",
	["𐏁"] = "š",
	["𐏂"] = "ç",
	["𐏃"] = "h",
	["𐏈"] = "AM", -- Auramazdā
	["𐏉"] = "AM", -- Auramazdā
	["𐏊"] = "AMha", -- Auramazdāha
	["𐏋"] = "XŠ", -- xšāyathiya 
	["𐏌"] = "DH", -- dahyāuš
	["𐏍"] = "DH", -- dahyāuš
	["𐏎"] = "BG", -- baga
	["𐏏"] = "BU", -- būmiš
	["𐏐"] = " ", --word devider
	["-"] = "-",
}

local numbers = {
	["𐏑"] = 1,
	["𐏒"] = 2,
	["𐏓"] = 10,
	["𐏔"] = 20,
	["𐏕"] = 100,
}

function export.convert_numbers(numeric_str)
	local total = 0
	for c in mw.ustring.gmatch(numeric_str, ".") do
		total = total + numbers[c]
	end
	return total
end

function export.tr(text, lang, sc)
	-- If the script is not Xpeo, do not transliterate
	if sc ~= "Xpeo" then
		return
	end
	
	local t = {}
	local preceding_num = false
	-- Transliterate characters
	mw.ustring.gsub(text,
		".",
		function(c)
			if mw.ustring.match(c, "[𐏑-𐏕]") then
				if preceding_num then
					t[#t] = t[#t] + numbers[c]
				else
					t[#t + 1] = numbers[c]
				end
				preceding_num = true
			else
				preceding_num = false
				t[#t + 1] = tt[c]
			end
		end)
		
	text = mw.ustring.gsub(table.concat(t, "-"), "%-?(%s)%-?", "%1")
	text = mw.ustring.gsub(mw.ustring.gsub(text, "^%-", ""), "%-$", "")
	
	return text
end

return export


-- Text	Expected	Actual
-- Words
-- Passed	𐎫𐎼𐎿𐎫𐎡𐎹	t-r-s-t-i-y	t-r-s-t-i-y
-- Passed	𐎭𐎭𐎠𐎬𐎢𐎺	d-d-a-tu-u-v	d-d-a-tu-u-v
-- Passed	𐎱𐎠𐎮𐎹	p-a-di-y	p-a-di-y
-- Passed	𐎪	ji	ji
-- Passed	𐎲𐎼𐏀𐎶𐎴𐎡𐎹	b-r-z-m-n-i-y	b-r-z-m-n-i-y
-- Passed	𐎩𐎮𐎡𐎹𐎠𐎷𐎡𐎹	j-di-i-y-a-mi-i-y	j-di-i-y-a-mi-i-y
-- Passed	𐎠𐎼𐎫𐎠𐎨𐎠	a-r-t-a-c-a	a-r-t-a-c-a
-- Numbers
-- Passed	𐏕	100	100
-- return require "Module:transliteration module testcases"(
-- 	require "Module:peo-translit".tr,
-- 	{
-- 		'Words',
-- 		{ "𐎫𐎼𐎿𐎫𐎡𐎹", "t-r-s-t-i-y" },
-- 		{ "𐎭𐎭𐎠𐎬𐎢𐎺", "d-d-a-tu-u-v" },		
-- 		{ "𐎱𐎠𐎮𐎹", "p-a-di-y" },
-- 		{ "𐎪", "ji" },
-- 		{ "𐎲𐎼𐏀𐎶𐎴𐎡𐎹", "b-r-z-m-n-i-y" },
-- 		{ "𐎩𐎮𐎡𐎹𐎠𐎷𐎡𐎹", "j-di-i-y-a-mi-i-y" },
-- 		{ "𐎠𐎼𐎫𐎠𐎨𐎠", "a-r-t-a-c-a" },
		
-- 		'Numbers',
-- 		{ "𐏕", "100" },
-- 		--[[
-- 		Copy this to add more examples:
-- 		{ "", "" },
-- 		--]]
-- 	},
-- 	"Xpeo", "peo")