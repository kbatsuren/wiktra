local export = {}

local trtab = {
	[0x0410] = "A" , [0x0430] = "a" , -- A
	[0x04D8] = "Ä" , [0x04D9] = "ä" , -- SCHWA
	[0x0411] = "B" , [0x0431] = "b" , -- BE
	[0x0412] = "V" , [0x0432] = "v" , -- VE
	[0x0413] = "G" , [0x0433] = "g" , -- GHE
	[0x04BA] = "H" , [0x04BB] = "h" , -- SHHA
	[0x0414] = "D" , [0x0434] = "d" , -- DE
	                                  -- IE is handled specially
	[0x0401] = "Yo", [0x0451] = "yo", -- IO
	[0x0416] = "Ž" , [0x0436] = "ž" , -- ZHE
	[0x0496] = "J" , [0x0497] = "j" , -- ZHE WITH DESCENDER
	[0x0417] = "Z" , [0x0437] = "z" , -- ZE
	[0x0418] = "I" , [0x0438] = "i" , -- I
	[0x0419] = "Y" , [0x0439] = "y" , -- SHORT I
	[0x041A] = "K" , [0x043A] = "k" , -- KA
	[0x041B] = "L" , [0x043B] = "l" , -- EL
	[0x041C] = "M" , [0x043C] = "m" , -- EM
	[0x041D] = "N" , [0x043D] = "n" , -- EN
	[0x04A2] = "Ñ" , [0x04A3] = "ñ" , -- EN WITH DESCENDER
	[0x041E] = "O" , [0x043E] = "o" , -- O
	[0x04E8] = "Ö" , [0x04E9] = "ö" , -- BARRED O
	[0x041F] = "P" , [0x043F] = "p" , -- PE
	[0x0420] = "R" , [0x0440] = "r" , -- ER
	[0x0421] = "S" , [0x0441] = "s" , -- ES
	[0x0422] = "T" , [0x0442] = "t" , -- TE
	[0x0423] = "U" , [0x0443] = "u" , -- U
	[0x04AE] = "Ü" , [0x04AF] = "ü" , -- STRAIGHT U
	[0x0424] = "F" , [0x0444] = "f" , -- EF
	[0x0425] = "X" , [0x0445] = "x" , -- HA
	[0x0426] = "Ts", [0x0446] = "ts", -- TSE
	[0x0427] = "Ç" , [0x0447] = "ç" , -- CHE
	[0x0428] = "Ş" , [0x0448] = "ş" , -- SHA
	[0x0429] = "Şç", [0x0449] = "şç", -- SHCHA
	[0x042A] = "\ʺ", [0x044A] = "\"", -- HARD SIGN
	[0x042B] = "Y" , [0x044B] = "y" , -- YERU
	[0x042C] = "ʹ" , [0x044C] = "'" , -- SOFT SIGN
	[0x042D] = "E" , [0x044D] = "e" , -- E
	[0x042E] = "Yu", [0x044E] = "yu", -- YU
	[0x042F] = "Ya", [0x044F] = "ya"  -- YA
}

local gives_e = {
	[0x04D8] = true, [0x04D9] = true, -- SCHWA
	[0x0411] = true, [0x0431] = true, -- BE
	[0x0412] = true, [0x0432] = true, -- VE
	[0x0413] = true, [0x0433] = true, -- GHE
	[0x04BA] = true, [0x04BB] = true, -- SHHA
	[0x0414] = true, [0x0434] = true, -- DE
	[0x0416] = true, [0x0436] = true, -- ZHE
	[0x0496] = true, [0x0497] = true, -- ZHE WITH DESCENDER
	[0x0417] = true, [0x0437] = true, -- ZE
	[0x0419] = true, [0x0439] = true, -- SHORT I
	[0x041A] = true, [0x043A] = true, -- KA
	[0x041B] = true, [0x043B] = true, -- EL
	[0x041C] = true, [0x043C] = true, -- EM
	[0x041D] = true, [0x043D] = true, -- EN
	[0x04A2] = true, [0x04A3] = true, -- EN WITH DESCENDER
	[0x041F] = true, [0x043F] = true, -- PE
	[0x0420] = true, [0x0440] = true, -- ER
	[0x0421] = true, [0x0441] = true, -- ES
	[0x0422] = true, [0x0442] = true, -- TE
	[0x0424] = true, [0x0444] = true, -- EF
	[0x0425] = true, [0x0445] = true, -- HA
	[0x0426] = true, [0x0446] = true, -- TSE
	[0x0427] = true, [0x0447] = true, -- CHE
	[0x0428] = true, [0x0448] = true, -- SHA
	[0x0429] = true, [0x0449] = true  -- SHCHA
}

local tt_Mong = {
	["ᡃ"] = "ː",		["ᠠ"] = "a",	["ᡄ"] = "e",	["ᡅ"] = "i",	["ᡆ"] = "o",
	["ᡈ"] = "ö",	["ᡇ"] = "u",	["ᡉ"] = "ü",	["ᠨ"] = "n",	["ᡊ"] = "ng",
	["ᡋ"] = "b",	["ᡌ"] = "p",	["ᡍ"] = "x",	["ᡎ"] = "g",	["ᡏ"] = "m",	["ᠯ"] = "l",	["ᠰ"] = "s",	["ᠱ"] = "š",
	["ᡐ"] = "t",	["ᡑ"] = "d",	["ᡒ"] = "ċ",	["ᡓ"] = "j",	["ᡔ"] = "ć",
	["ᡕ"] = "y",	["ᠷ"] = "r",	["ᡖ"] = "w",	["ᠺ"] = "k",	["ᡗ"] = "ģ",	["ᡙ"] = "h",
	["ᡚ"] = "ĵ",	["ᡛ"] = "ń",	["ᡜ"] = "ź",	["ᢘ"] = "t",	["ᢙ"] = "ž",
	["᠎"] = "-",	["︖"] = "?",	["︕"] = "!",	["᠂"] = ",",	["᠃"] = "."
}

function export.tr(text, lang, sc)
	local result = {}
	local last = false
	
	for num in mw.ustring.gcodepoint(text) do
		if (num == 0x0415) or (num == 0x0435) then -- CYRILLIC CAPITAL/SMALL LETTER IE
			if gives_e[last] then
				table.insert(result, num == 0x0415 and "E" or "e")
			else
				table.insert(result, num == 0x0415 and "Ye" or "ye")
			end
		else
			table.insert(result, trtab[num] or mw.ustring.char(num))
		end
		if (num ~= 0x0300) and (num ~= 0x0301) then -- COMBINING GRAVE/ACUTE ACCENT
			last = num
		end
	end

	return table.concat(result)
end

return export