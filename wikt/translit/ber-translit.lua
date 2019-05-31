-- This module transliterates Tifinagh script and is currently used by Central Atlas Tamazight.
-- Language code: tzm
local export = {}

local t2l_common = {
	["ⴰ"] = "a",
	["ⴱ"] = "b",
	["ⴲ"] = "b",
	["ⴳ"] = "g",
	["ⴴ"] = "g",
	["ⴵ"] = "ǧ",
	["ⴶ"] = "ǧ",
	["ⴷ"] = "d",
	["ⴸ"] = "d",
	["ⴹ"] = "ḍ",
	["ⴺ"] = "ḍ",
	["ⴻ"] = "e",
	["ⴼ"] = "f",
	["ⴽ"] = "k",
	["ⴾ"] = "k",
	["ⴿ"] = "k",
	["ⵀ"] = "h", -- tmh, thv, taq, ttq, thz: "b"
	["ⵁ"] = "h",
	["ⵂ"] = "h",
	["ⵃ"] = "ḥ",
	["ⵄ"] = "ɛ",
	["ⵅ"] = "x",
	["ⵆ"] = "x",
	["ⵇ"] = "q",
	["ⵈ"] = "q",
	["ⵉ"] = "i",
	["ⵊ"] = "j",
	["ⵋ"] = "j",
	["ⵌ"] = "j",
	["ⵍ"] = "l",
	["ⵎ"] = "m",
	["ⵏ"] = "n",
	["ⵐ"] = "ny",
	["ⵑ"] = "ng",
	["ⵒ"] = "p",
	["ⵓ"] = "u", -- tmh, thv, taq, ttq, thz: "w"
	["ⵔ"] = "r",
	["ⵕ"] = "ṛ",
	["ⵖ"] = "ɣ",
	["ⵗ"] = "ɣ",
	["ⵘ"] = "j", -- thz: "ɣ"
	["ⵙ"] = "s",
	["ⵚ"] = "ṣ",
	["ⵛ"] = "š",
	["ⵜ"] = "t",
	["ⵝ"] = "t",
	["ⵞ"] = "č",
	["ⵟ"] = "ṭ",
	["ⵠ"] = "v",
	["ⵡ"] = "w",
	["ⵢ"] = "y",
	["ⵣ"] = "z",
	["ⵤ"] = "z",
	["ⵥ"] = "ẓ",
	["ⵦ"] = "e",
	["ⵧ"] = "o",
	["ⵯ"] = "ʷ",
	["⵰"] = ".",
	["⵿"] = "",
}

local t2l_alt = {
	["tmh"] = {
		["ⵀ"] = "b",
		["ⵓ"] = "w",
	},
	["thz"] = {
		["ⵀ"] = "b",
		["ⵓ"] = "w",
		["ⵘ"] = "ɣ",
	},
}
t2l_alt["thv"] = t2l_alt["tmh"]
t2l_alt["taq"] = t2l_alt["tmh"]
t2l_alt["ttq"] = t2l_alt["tmh"]

function export.tr(text, lang, sc)
	if not sc then
		sc = require("Module:scripts").findBestScript(text, require("Module:languages").getByCode(lang or "ber")):getCode()
	end

	if sc == "Arab" then
		-- perhaps will be implemented in the future
		text = nil
	elseif sc == "Latn" then
		-- no need to transliterate
		text = nil
	elseif sc == "Tfng" then
		if t2l_alt[lang] then
			text = mw.ustring.gsub(text, '.', t2l_alt[lang])
		end
		text = mw.ustring.gsub(text, '.', t2l_common)
	end

	return text
end

return export