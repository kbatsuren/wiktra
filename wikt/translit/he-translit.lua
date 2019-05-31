-- This module will transliterate Hebrew language text per WT:HE TR.
-- Language code: 
--[[
heb – Modern Hebrew
hbo – Classical Hebrew (liturgical)
smp – Samaritan Hebrew (liturgical)
obm – Moabite (extinct)
xdm – Edomite (extinct)
]]
local export = {}
local U = mw.ustring.char
local gsub = mw.ustring.gsub

local sheva = U(0x05B0)
local hataf_segol = U(0x05B1)
local hataf_patah = U(0x05B2)
local hataf_qamats = U(0x05B3)
local hiriq = U(0x05B4)
local tsere = U(0x05B5)
local segol = U(0x05B6)
local patah = U(0x05B7)
local qamats = U(0x05B8)
local qamats_qatan = U(0x05C7)
local holam = U(0x05B9)
local holam_haser_for_waw = U(0x05BA)
local qubuts = U(0x05BB)
local dagesh_mappiq = U(0x05BC)
local shin_dot = U(0x05C1)
local sin_dot = U(0x05C2)

local macron_above = U(0x0304)
local macron_below = U(0x0331)
local macron = "[" .. macron_above .. macron_below .. "]"

local alef = "א"
local he = "ה"
local waw = "ו"
local yod = "י"
local vowel_letters = alef .. he .. waw .. yod
local vowel_letter = "[" .. vowel_letters .. "]"

-- '0' represents silent sheva
local vowel_points = (
	sheva .. hataf_segol .. hataf_patah .. hataf_qamats .. hiriq .. tsere ..
	segol .. patah .. qamats .. qamats_qatan .. holam .. qubuts .. '0' ..
	holam_haser_for_waw
)
local vowel_point = "[" .. vowel_points .. "]"
local short_vowels = segol .. patah .. hiriq .. qubuts .. qamats_qatan
local short_vowel = "[" .. short_vowels .. "]"

local shuruq = waw .. dagesh_mappiq
local holam_male = waw .. holam

-- use dummies characters that do not match as punctuation
-- the dummy letter stands in for final silent alef or he, or for the hiatus before a furtive patah,
-- or comes before a pre-transliterated waw to aid in matching
local dummy_letter = U(0x0627) -- ARABIC LETTER ALEF
local dummy_geresh = U(0x064E) -- ARABIC FATHA
local dummy_gershayim = U(0x064B) -- ARABIC FATHATAN
local real_geresh = '׳'
local real_gershayim = '״'
local letter_modifier = "[" .. shin_dot .. sin_dot .. "]?[" .. dummy_geresh .. dummy_gershayim .. "]?"
local letters = "אבגדהוזחטיכךלמםנןסעפףצץקרשת"
local letter = "[" .. letters .. dummy_letter .. "]" .. letter_modifier
local letter_not_waw = "[אבגדהזחטיכךלמםנןסעפףצץקרשת" .. dummy_letter .. "]" .. letter_modifier
local gutturals = "אהחע"
local guttural = "[" .. gutturals .. "]"

local vowel_letter_or_geresh = "[" .. vowel_letters .. dummy_geresh .. dummy_gershayim .. "]"

-- note, the geresh and gershayim are included in this, which is why dummies are used in their place
local word_break_chars = "%s%p"
local word_break = "[" .. word_break_chars .. "]"
local word_start = "%f[^" .. word_break_chars .. "]" -- matches the boundary but not the actual word break characters
local word_end = "%f[" .. word_break_chars .. "]" -- matches the boundary but not the actual word break characters

local tr_vowels = "aeiouāēīōūəăĕŏ0"

local biblical_to_modern = {
	['ʾ'] = '\'',
	['b' .. macron_below] = 'v',
	['g' .. macron_above] = 'g',
	['d' .. macron_below] = 'd',
	['w'] = 'v',
	['ž'] = 'zh',
	['ḥ'] = 'kh',
	['ṭ'] = 't',
	['k' .. macron_below] = 'kh',
	['ʿ'] = '\'',
	['p' .. macron_above] = 'f',
	['ṣ'] = 'ts',
	['č'] = 'ch',
	['q'] = 'k',
	['š'] = 'sh',
	['ś'] = 's',
	['t' .. macron_below] = 't',

	['ə'] = '\'',
	['ĕ'] = 'e',
	['ă'] = 'a',
	['ŏ'] = 'o',
	['ī'] = 'i',
	['ē'] = 'e',
	['ā'] = 'a',
	['ō'] = 'o',
	['ū'] = 'u',
}

-- helper function to remove vowel letters but keep gereshes
local function gereshes(str)
	return gsub(str, vowel_letter, '')
end

local biblical = {
	{
		-- replace geresh and gershayim with their dummy equivalents so that they won't match as word boundaries
		[real_geresh] = dummy_geresh,
		[real_gershayim] = dummy_gershayim,
	},

	{
		-- The default order is: consonant, vowel point, dagesh or mappiq, shin or sin dot.
		-- The desired order is: consonant, shin or sin dot, dagesh or mappiq, vowel point.
		-- Also, move geresh and gershayim closer to the letter for easier handling (will be moved back later if not actually a modifier)
		["([" .. letters .. "])(" .. vowel_point .. "*)(" .. dagesh_mappiq .. "*)([" .. shin_dot .. sin_dot .. "]*)([" .. dummy_geresh .. dummy_gershayim .. "]*)"] = "%1%4%5%3%2",
	},

	{
		-- special case: change qamats in כל to qamats qatan
		-- the problem is that כל might be preceded by prefixed clitics, which maybe be chained indefinitely,
		-- while other unrelated words might happen to end in כל with a qamats gadol; therefore, match either
		-- the entire word or only when preceded by a precisely recognized prefix
		[word_start .. "(כ" .. dagesh_mappiq .. "?)" .. qamats .. "(ל)" .. word_end] = "%1" .. qamats_qatan .. "%2",
		["([הבכל]" .. dagesh_mappiq .. "?" .. patah .. "כ" .. dagesh_mappiq .. ")" .. qamats .. "(ל)" .. word_end] = "%1" .. qamats_qatan .. "%2",
		["(מ" .. dagesh_mappiq .. "?" .. hiriq .. "כ" .. dagesh_mappiq .. ")" .. qamats .. "(ל)" .. word_end] = "%1" .. qamats_qatan .. "%2",
		["(ש" .. shin_dot .. dagesh_mappiq .. "?[" .. segol .. patah .. "]כ" .. dagesh_mappiq .. ")" .. qamats .. "(ל)" .. word_end] = "%1" .. qamats_qatan .. "%2", -- patah is very archaic
		["([ובכלד]" .. dagesh_mappiq .. "?" .. sheva .. "כ)" .. qamats .. "(ל)" .. word_end] = "%1" .. qamats_qatan .. "%2",
	},

	{
		-- remove final alef and he, but only when preceded by a vowel
		["(" .. vowel_point .. vowel_letter_or_geresh .. "*)[" .. alef .. he .. "]" .. word_end] = "%1" .. dummy_letter,
		["(" .. shuruq .. vowel_letter_or_geresh .. "*)[" .. alef .. he .. "]" .. word_end] = "%1" .. dummy_letter,
	},

	{
		-- these are the cases, other than the above, where a final letter should be ignored
		[hiriq .. vowel_letter_or_geresh .. "-[" .. yod .. dummy_letter .. "]" .. word_end] = "ī",
		["([" .. tsere .. segol .. "])" .. vowel_letter_or_geresh .. "-[" .. yod .. "]" .. word_end] = "%1",
		["([" .. holam .. qubuts .. "])" .. vowel_letter_or_geresh .. "-[" .. waw .. "]" .. word_end] = "%1",
	},

	{
		[sheva .. "(" .. letter .. ")" .. sheva] = "0%1" .. sheva, -- two shevas in a row
		["(" .. short_vowel .. letter .. ")" .. sheva] = "%10", -- after a short vowel, assume(!) a silent sheva
		["(" .. guttural .. ")" .. sheva] = "%10", -- gutturals cannot have a vocal sheva

		["(" .. vowel_point .. ")" .. shuruq] = "%1" .. dummy_letter .. "ww", -- when waw + dagesh is not a shuruq
		["(" .. vowel_point .. vowel_letter_or_geresh .. "-)" .. shuruq .. "(" .. vowel_letter_or_geresh .. "-" .. vowel_point .. ")"] = "%1" .. dummy_letter .. "ww%2", -- when waw + dagesh is not a shuruq
		["(" .. vowel_point .. ")" .. holam_male] = "%1" .. dummy_letter .. "w" .. holam, -- when waw + holam is not a holam male

		["([" .. alef .. he .. "])" .. dagesh_mappiq] = "%1", -- handle mappiq (very rarely occurs on an alef)
	},

	{
		[shuruq .. shuruq] = shuruq .. "ww", -- another potential case when waw + dagesh is not a shuruq
		[shuruq .. holam_male] = shuruq .. "w" .. holam, -- another potential case when waw + holam is not a holam male

		-- tentatively lengthen hiriqs with vowel letters
		[hiriq .. "(" .. vowel_letter_or_geresh .. "+)(" .. letter .. ")"] = function(vlg, l) return "ī" .. gereshes(vlg) .. l end,

		-- rearrange furtive patach (mappiq should already have been removed, but handle it just in case)
		["(" .. guttural .. dagesh_mappiq .. "?)" .. patah .. word_end] = dummy_letter .. "a%1",
	},

	{
		-- remove vowel letters
		["(" .. letter .. ")(" .. vowel_letter_or_geresh .. "+)" .. shuruq] = function(l, vlg) return l .. gereshes(vlg) .. shuruq end,
		[shuruq .. "(" .. vowel_letter_or_geresh .. "+)" .. "(" .. letter_not_waw .. ")"] = function(vlg, l) return shuruq .. gereshes(vlg) .. l end,
		[shuruq .. "(" .. vowel_letter_or_geresh .. "+)" .. "(" .. waw .. "[^" .. holam .. dagesh_mappiq .. "])"] = function(vlg, l) return shuruq .. gereshes(vlg) .. l end,
		["(" .. vowel_point .. ")" .. "(" .. vowel_letter_or_geresh .. "+)" .. "(" .. letter_not_waw .. ")"] = function(vp, vlg, l) return vp .. gereshes(vlg) .. l end,
		["(" .. vowel_point .. ")" .. "(" .. vowel_letter_or_geresh .. "+)" .. "(" .. waw .. "[^" .. holam .. dagesh_mappiq .. "])"] = function(vp, vlg, l) return vp .. gereshes(vlg) .. l end,
	},

	{
		-- handle two-character combinations first
		['ג' .. dummy_geresh] = 'j',
		['ז' .. dummy_geresh] = 'ž',
		['[צץ]' .. dummy_geresh] = 'č',
		['ש' .. shin_dot] = 'š',
		['ש' .. sin_dot] = 'ś',
	},

	{
		['א'] = 'ʾ',
		['ב'] = 'b' .. macron_below,
		['ג'] = 'g' .. macron_above,
		['ד'] = 'd' .. macron_below,
		['ה'] = 'h',
		['ז'] = 'z',
		['ח'] = 'ḥ',
		['ט'] = 'ṭ',
		['י'] = 'y',
		['[כך]'] = 'k' .. macron_below,
		['ל'] = 'l',
		['[מם]'] = 'm',
		['[נן]'] = 'n',
		['ס'] = 's',
		['ע'] = 'ʿ',
		['[פף]'] = 'p' .. macron_above,
		['[צץ]'] = 'ṣ',
		['ק'] = 'q',
		['ר'] = 'r',
		['ת'] = 't' .. macron_below,
	},

	{
		[word_start .. '([bgdkptj])' .. macron .. '?' .. dagesh_mappiq] = '%1', -- assume(!) dagesh qal at the beginning of a word
		['[0' .. sheva .. ']([bgdkptj])' .. macron .. '?' .. dagesh_mappiq] = '0%1', -- dagesh qal after sheva, and assume(!) silent sheva
		['(%l)0%1'] = '%1' .. sheva .. '%1', -- vocal sheva between identical consonants
		[shuruq] = 'ū',
	},

	{
		-- restore geresh and gershayim order
		["([" .. dummy_geresh .. dummy_gershayim .. "])(" .. dagesh_mappiq .. "*)(" .. vowel_point .. "*)"] = "%2%3%1",
	},

	{
		-- handle ירושלם
		[hiriq .. patah] = "ayi", -- in this case, the vowels are reversed by Unicode normalization rules
		[patah .. hiriq] = "ayi", -- just in case they're in the correct order
		[hiriq .. qamats] = "āyi", -- pausal form of above
		[qamats .. hiriq] = "āyi", -- as above
		-- handle ירושלמה
		["[0" .. sheva .. "]" .. patah] = "ay", -- in this case, the vowels are reversed by Unicode normalization rules
		[patah .. "[0" .. sheva .. "]"] = "ay", -- just in case they're in the correct order
		["[0" .. sheva .. "]" .. qamats] = "āy", -- pausal form of above
		[qamats .. "[0" .. sheva .. "]"] = "āy", -- as above
	},

	{
		[sheva] = 'ə',
		[hataf_segol] = 'ĕ',
		[hataf_patah] = 'ă',
		[hataf_qamats] = 'ŏ',
		[hiriq] = 'i',
		[tsere] = 'ē',
		[segol] = 'e',
		[patah] = 'a',
		[qamats] = 'ā',
		[qamats_qatan] = 'o',
		[qubuts] = 'u',
		[shin_dot] = '',
		[sin_dot] = '',
		[holam_male] = 'ō',
		[waw .. holam_haser_for_waw] = 'wō',
	},

	{
		['(.)' .. macron .. '?' .. dagesh_mappiq] = '%1%1', -- gemination
	},

	{
		['(śśā)[שś](k' .. macron_below .. ')'] = '%1%2', -- special case for יששכר
	},

	{
		['ā(%l' .. macron .. '?0)'] = 'o%1', -- assume(!) qamats qatan before silent sheva

		[holam] = 'ō',
		['ו'] = 'w',
		['ש'] = 'š', -- assume(!) shin if no shin or sin dot
	},

	{
		-- handle bgdkpt letters in unvocalized words (such as acronyms)
		[word_start .. "([^" .. tr_vowels .. "]-[bgdkpt]" .. macron .. "[^" .. tr_vowels .. "]-)" .. word_end] = function(w) return gsub(w, "([bgdkpt])" .. macron, "%1") end
	},

	{
		["[0" .. dummy_letter .. "]"] = "",

		-- short vowels in non-final closed syllables (this rule should be expanded)
		["ū(%l)%1"] = "u%1%1",
		["ī(%l)%1"] = "i%1%1",
	},

	{
		['ə' .. word_end] = "", -- final sheva is always silent

		[dummy_geresh] = '′',
		[dummy_gershayim] = '″',
		['׃'] = '.', -- sof pasuq
		['־'] = '-', -- maqaf
	},
}

function export.tr(text, lang, sc)
	-- default to modern for Hebrew, but not for other languages, such as Aramaic
	local modern = lang == "he"
	return export.biblical(text, modern)
end

function export.biblical(text, modern)
	-- decompose
	text = mw.ustring.toNFD(text)

	-- wrap with spaces to make initial and final replacements easier
	text = ' ' .. text .. ' '

	for _, replacements in ipairs(biblical) do
		for regex, replacement in pairs(replacements) do
			text = gsub(text, regex, replacement)
		end
	end

	-- unwrap spaces
	text = mw.ustring.match(text, "^ (.*) $")
	if text == nil then error("Something went wrong, wrapped spaces were deleted.") end

	-- must happen before recomposition
	if modern then
		text = gsub(text, "([%lʾʿ])%1", "%1")
		text = gsub(text, "[%lʾʿ]" .. macron .. "?", function(x) return biblical_to_modern[x] or x end)
		text = gsub(text, "''", "'")
	end

	-- recompose
	text = mw.ustring.toNFC(text)

	return text
end

return export

-- 10 tests failed. (refresh)

-- test_biblical:
-- Text	Expected	Actual	Differs at	Comments
-- Passed	בַּיִת‎	bayiṯ	bayiṯ		
-- Passed	בֵּית‎	bēṯ	bēṯ		
-- Passed	בָּתִּים‎	bāttīm	bāttīm		
-- Passed	מַחֲנֶה‎	maḥăne	maḥăne		
-- Passed	בָּרָא‎	bārā	bārā		
-- Passed	רֶגֶל‎	reḡel	reḡel		
-- Passed	כֹּהֵן‎	kōhēn	kōhēn		
-- Passed	מֶלֶךְ‎	meleḵ	meleḵ		
-- Passed	מַמְלָכָה‎	mamlāḵā	mamlāḵā		
-- Passed	הַמַּמְלָכָה‎	hammamlāḵā	hammamlāḵā		
-- Passed	הַלְּלוּיָהּ‎	halləlūyāh	halləlūyāh		
-- Passed	הַלְלוּיָהּ‎	haləlūyāh	haləlūyāh		
-- Passed	יָדַע‎	yāḏaʿ	yāḏaʿ		
-- Passed	שָׁבוּעַ‎	šāḇūaʿ	šāḇūaʿ		
-- Passed	רוּחַ‎	rūaḥ	rūaḥ		
-- Passed	גָּבֹהַּ‎	gāḇōah	gāḇōah		
-- Passed	מָשִׁיחַ‎	māšīaḥ	māšīaḥ		
-- Passed	רֵיחַ‎	rēaḥ	rēaḥ		
-- Passed	שָׂדֶה‎	śāḏe	śāḏe		
-- Passed	שְׂדֵה‎	śəḏē	śəḏē		
-- Passed	בָּנַי‎	bānay	bānay		
-- Passed	בְּנֵי‎	bənē	bənē		
-- Passed	צָרְכִּי‎	ṣorkī	ṣorkī		
-- Passed	חָכְמָה‎	ḥāḵəmā	ḥāḵəmā		ambiguous case: could be ḥāḵəmā or ḥoḵmā, but I think ḥāḵəmā is the preferred default
-- Passed	שִׁפְרָה‎	šip̄rā	šip̄rā		
-- Passed	שָׁכְבְּךָ‎	šoḵbəḵā	šoḵbəḵā		
-- Passed	הָפְכָּה‎	hop̄kā	hop̄kā		made-up word, but a particular potentially problematic Unicode situation
-- Passed	קָטְבּוֹ‎	qoṭbō	qoṭbō		another particular potentially problematic Unicode situation
-- Passed	נִשְׂרְפָה‎	niśrəp̄ā	niśrəp̄ā		
-- Passed	בָּנָיו‎	bānāw	bānāw		
-- Passed	בָּנֶיהָ‎	bānehā	bānehā		
-- Passed	מִצְוֹת‎	miṣwōṯ	miṣwōṯ		
-- Passed	זִוּוּג‎	ziwwūḡ	ziwwūḡ		
-- Passed	רֹאשׁ‎	rōš	rōš		
-- Passed	רֵאשִׁית‎	rēšīṯ	rēšīṯ		
-- Passed	רִאשׁוֹן‎	rīšōn	rīšōn		
-- Passed	מְלָאכָה‎	məlāḵā	məlāḵā		
-- Passed	מְלֶאכֶת‎	məleḵeṯ	məleḵeṯ		
-- Passed	חֵטְא‎	ḥēṭ	ḥēṭ		
-- Passed	בָּרָאתָ‎	bārāṯā	bārāṯā		
-- Passed	חַטֹּאות‎	ḥaṭṭōṯ	ḥaṭṭōṯ		
-- Passed	יְראוּ‎	yərū	yərū		
-- Passed	וַיֶּאְסֹר‎	wayyeʾsōr	wayyeʾsōr		
-- Passed	הָחְלַט‎	hoḥlaṭ	hoḥlaṭ		
-- Passed	וַיֵּבְךְּ‎	wayyēḇk	wayyēḇk		
-- Passed	אַרְאֶךָּ‎	ʾarʾekkā	ʾarʾekkā		
-- Passed	וַיַּשְׁקְ‎	wayyašq	wayyašq		
-- Passed	אַתְּ‎	ʾatt	ʾatt		
-- Passed	וּוָווֹ‎	ūwāwō	ūwāwō		
-- Passed	וָו‎	wāw	wāw		
-- Passed	תָּו‎	tāw	tāw		
-- Passed	קַו‎	qaw	qaw		
-- Passed	לָאו‎	lāw	lāw		
-- Passed	חַי‎	ḥay	ḥay		
-- Passed	חָי‎	ḥāy	ḥāy		pausal
-- Passed	פִּיו‎	pīw	pīw		
-- Passed	כִּסְלֵו‎	kislēw	kislēw		
-- Passed	גּוֹי‎	gōy	gōy		
-- Passed	גֹּי‎	gōy	gōy		
-- Passed	גֹּיִים‎	gōyīm	gōyīm		
-- Passed	רָאוּי‎	rāʾūy	rāʾūy		
-- Passed	קִיא‎	qī	qī		
-- Failed	יָבִיאוּ‎	yāḇīʾū	yāḇīū	5	
-- Failed	יְבִיאוּן‎	yəḇīʾūn	yəḇīūn	5	
-- Passed	מֵאוּן‎	mēʾūn	mēʾūn		
-- Failed	מֵיאוּן‎	mēʾūn	mēyūn	3	
-- Passed	בּוֹאוּ‎	bōʾū	bōʾū		
-- Passed	בֹּאוּ‎	bōʾū	bōʾū		
-- Passed	בּוּאוּ‎	būʾū	būʾū		made-up word, but may help identify the issue
-- Passed	אָבִיאָה‎	ʾāḇīʾā	ʾāḇīʾā		
-- Passed	מֵאָה‎	mēʾā	mēʾā		
-- Passed	גֵּיאָהּ‎	gēʾāh	gēʾāh		
-- Passed	אָבוֹאָה‎	ʾāḇōʾā	ʾāḇōʾā		
-- Passed	אָבֹאָה‎	ʾāḇōʾā	ʾāḇōʾā		
-- Passed	נְשׂוּאָה‎	nəśūʾā	nəśūʾā		
-- Failed	קִיאוֹ‎	qīʾō	qīō	3	
-- Passed	גֵּאוֹ‎	gēʾō	gēʾō		
-- Passed	גֵּיאוֹ‎	gēʾō	gēʾō		
-- Passed	בּוֹאוֹ‎	bōʾō	bōʾō		
-- Passed	בֹּאוֹ‎	bōʾō	bōʾō		
-- Passed	מִלּוּאוֹ‎	millūʾō	millūʾō		
-- Passed	מִי‎	mī	mī		
-- Passed	אִיִּים‎	ʾiyyīm	ʾiyyīm		
-- Passed	אִיּוֹב‎	ʾiyyōḇ	ʾiyyōḇ		
-- Passed	אִיּוּן‎	ʾiyyūn	ʾiyyūn		
-- Passed	אַיִן‎	ʾayin	ʾayin		
-- Passed	בּוֹא‎	bō	bō		
-- Passed	יְפֵהפֶה‎	yəp̄ēp̄e	yəp̄ēp̄e		
-- Passed	אֹהֶל‎	ʾōhel	ʾōhel		
-- Passed	הָאֹהֱלָה‎	hāʾōhĕlā	hāʾōhĕlā		
-- Failed	אָהֳלוֹ‎	ʾohŏlō	ʾāhŏlō	2	
-- Failed	אָהָלְךָ‎	ʾoholəḵā	ʾāhāləḵā	2	
-- Passed	יִשָּׂשכָר‎	yiśśāḵār	yiśśāḵār		Still undecided if this actually needs to be handled
-- Passed	הוֹשִׁיעָה נָּא‎	hōšīʿā nnā	hōšīʿā nnā		
-- Passed	עַד בֹּאֲךָ‎	ʿaḏ bōʾăḵā	ʿaḏ bōʾăḵā		
-- Passed	וַיַּשְׁקְ אֶת הַצֹּאן‎	wayyašq ʾeṯ haṣṣōn	wayyašq ʾeṯ haṣṣōn		
-- Passed	בְּנֵי בְרָק‎	bənē ḇərāq	bənē ḇərāq		
-- Passed	בְרָק‎	ḇərāq	ḇərāq		
-- Passed	אִישׁ יְהוּדִי הָיָה בְּשׁוּשַׁן הַבִּירָה וּשְׁמוֹ מָרְדֳּכַי בֶּן יָאִיר בֶּן־שִׁמְעִי בֶּן־קִישׁ אִישׁ יְמִינִי׃‎	ʾīš yəhūḏī hāyā bəšūšan habbīrā ūšəmō mordŏḵay ben yāʾīr ben-šimʿī ben-qīš ʾīš yəmīnī.	ʾīš yəhūḏī hāyā bəšūšan habbīrā ūšəmō mordŏḵay ben yāʾīr ben-šimʿī ben-qīš ʾīš yəmīnī.		
-- Failed	אִ֣ישׁ יְהוּדִ֔י הָיָ֖ה בְּשׁוּשַׁ֣ן הַבִּירָ֑ה וּשְׁמ֣וֹ מָרְדֳּכַ֗י בֶּ֣ן יָאִ֧יר בֶּן־שִׁמְעִ֛י בֶּן־קִ֖ישׁ אִ֥ישׁ יְמִינִֽי׃‎	ʾīš yəhūḏī hāyā bəšūšan habbīrā ūšəmō mordŏḵay ben yāʾīr ben-šimʿī ben-qīš ʾīš yəmīnī.	ʾi֣yš yəhūḏi֔y hāyā֖h bəšūša֣n habbīrā֑h ūšəm֣ō mordŏḵa֗y be֣n yāʾi֧yr ben-šimʿi֛y ben-qi֖yš ʾi֥yš yəmīniֽy.	2	fully accented verse; stress should not be indicated in the final syllable
-- Failed	וַיְהִי הַמַּבּוּל אַרְבָּעִים יוֹם עַל־הָאָרֶץ וַיִּרְבּוּ הַמַּיִם וַיִּשְׂאוּ אֶת־הַתֵּבָה וַתָּרָם מֵעַל הָאָרֶץ׃‎‎	wayəhī hammabbūl ʾarbāʿīm yōm ʿal-hāʾā́reṣ wayyirbū hammáyim wayyiśəʾū ʾeṯ-hattēḇā wattā́rom mēʿal hāʾāreṣ.	wayhī hammabbūl ʾarbāʿīm yōm ʿal-hāʾāreṣ wayyirbū hammayim wayyiśʾū ʾeṯ-hattēḇā wattārām mēʿal hāʾāreṣ.‎	4	a reminder of why this is hard
-- Failed	וַיְהִ֧י הַמַּבּ֛וּל אַרְבָּעִ֥ים י֖וֹם עַל־הָאָ֑רֶץ וַיִּרְבּ֣וּ הַמַּ֗יִם וַיִּשְׂאוּ֙ אֶת־הַתֵּבָ֔ה וַתָּ֖רָם מֵעַ֥ל הָאָֽרֶץ׃‎	wayəhī hammabbūl ʾarbāʿīm yōm ʿal-hāʾā́reṣ wayyirbū hammáyim wayyiśəʾū ʾeṯ-hattēḇā wattā́rom mēʿal hāʾāreṣ.	wayhi֧y hammabb֛ūl ʾarbāʿi֥ym y֖ōm ʿal-hāʾā֑reṣ wayyirb֣ū hamma֗yim wayyiśʾū֙ ʾeṯ-hattēḇā֔h wattā֖rām mēʿa֥l hāʾāֽreṣ.	4	fully accented verse version of the above
-- implicit ktiv/qre that would be nice to have
-- Passed	הִוא‎	hī	hī		
-- Passed	יְרוּשָׁלִַם‎	yərūšālayim	yərūšālayim		
-- Passed	יְרוּשָׁלִָם‎	yərūšālāyim	yərūšālāyim		pausal form
-- Passed	יְרוּשָׁלְַמָה‎	yərūšālaymā	yərūšālaymā		
-- Passed	יְרוּשָׁלְָמָה‎	yərūšālāymā	yərūšālāymā		
-- ktiv male tests
-- Passed	חַיָּיב‎	ḥayyāḇ	ḥayyāḇ		
-- Passed	חַוָּוה‎	ḥawwā	ḥawwā		
-- Passed	הֱוֵוה‎	hĕwē	hĕwē		
-- Passed	הַיְינוּ‎	haynū	haynū		
-- Passed	הִתְכַּוְּונוּ‎	hiṯkawwənū	hiṯkawwənū		
-- Passed	גַּוְונָא‎	gawnā	gawnā		
-- Passed	מְייוּחָד‎	məyūḥāḏ	məyūḥāḏ		there is no way to tell that it really should be məyuḥāḏ, but anyway this test is for the double yod
-- Passed	כְּדַאי‎	kəḏay	kəḏay		
-- Passed	כּוּלָּם‎	kullām	kullām		shuruk does not necessarily imply a long vowel
-- Passed	קִידּוּשׁ‎	qiddūš	qiddūš		chiriq male does not necessarily imply a long vowel
-- test_translit_hebrew:
-- Text	Expected	Actual	Differs at	Comments
-- Passed	מַקְלֵעַ‎	maklea'	maklea'		
-- Passed	אַבְּסוּרְד‎	'ab'sur'd	'ab'sur'd		not sure about what should be expected here
-- Passed	בִּיּוֹמֶטְרִיָּה‎	biyometriya	biyometriya		
-- Passed	קַפְרִיסִין‎	kafrisin	kafrisin		
-- Passed	חֹרֶף‎	khoref	khoref		
-- Failed	טוּרְקִיז‎	turkiz	tur'kiz	4	
-- Passed	טַחַב‎	takhav	takhav		
-- Passed	יִוָּלֵד‎	yivaled	yivaled		
-- Passed	יָקִינְתּוֹן‎	yakinton	yakinton		
-- Passed	כֻּתְנָה‎	kutna	kutna		
-- Passed	נַגָּרִיָּה‎	nagariya	nagariya		
-- Passed	נַעֲלֶה‎	na'ale	na'ale		
-- Passed	מִצְווֹת‎	mitsvot	mitsvot		
-- Passed	מָקוֹם‎	makom	makom		
-- Passed	פֶּרוּאָנִי‎	peru'ani	peru'ani		
-- Passed	צִדְפָּה‎	tsidpa	tsidpa		
-- Passed	תׇּכְנָה‎	tokhna	tokhna		
-- Passed	רְאוּ‎	r'u	r'u		
-- Passed	גּ׳וּק‎	juk	juk		
-- Passed	ג׳וּק‎	juk	juk		
-- Passed	גִּ׳ירָאפָה‎	jirafa	jirafa		
-- Passed	גִ׳ירָאפָה‎	jirafa	jirafa		
-- Passed	זַ׳רְגוֹן‎	zhargon	zhargon		
-- Passed	קַפּוּצִ׳ינוֹ‎	kapuchino	kapuchino		
-- Passed	סְקוֹץ׳‎	s'koch	s'koch		
-- Passed	סְתוֹם תַּ׳פֶּה‎	s'tom ta′pe	s'tom ta′pe		
-- Passed	אִמָּא׳לֶה‎	'ima′le	'ima′le		
-- Passed	חָזָ״ל‎	khaza″l	khaza″l		
-- Passed	נַחַ״ל‎	nakha″l	nakha″l		
-- Passed	רה״מ‎	rh″m	rh″m		
-- Passed	ב״ה‎	b″h	b″h		
-- Passed	ת״א‎	t″'	t″'		
-- -- Unit tests for [[Module:he-translit]]. Refresh page to run tests.
-- local tests = require('Module:UnitTests')
-- local he_translit = require('Module:he-translit')
-- local full_link = require('Module:links').full_link
-- local lang = require('Module:languages').getByCode('he')
-- local sc = require('Module:scripts').getByCode('Hebr')

-- local function link(term)
-- 	return full_link{lang = lang, sc = sc, term = term}
-- end

-- function tests:do_test_translit(system)
-- 	local tr
-- 	if system == "modern" then
-- 		local modern = he_translit.tr
-- 		function tr(text)
-- 			return modern(text, 'he', 'Hebr')
-- 		end
-- 	elseif system == "biblical" then
-- 		tr = he_translit.biblical
-- 	end
	
-- 	return function (self, text, expected_tr, comment)
-- 		self:equals(link(text), tr(text), expected_tr, {comment=comment})
-- 	end
-- end

-- function tests:test_translit_hebrew()
-- 	local examples = {
-- 		{ 'מַקְלֵעַ', "maklea'" },
-- 		{ 'אַבְּסוּרְד', "'ab'sur'd" , "not sure about what should be expected here"},
-- 		-- { 'ביומטריה', ? },
-- 		{ 'בִּיּוֹמֶטְרִיָּה', "biyometriya" },
-- 		{ 'קַפְרִיסִין', "kafrisin" },
-- 		{ 'חֹרֶף', "khoref" },
-- 		{ 'טוּרְקִיז', "turkiz" },
-- 		{ 'טַחַב', "takhav" },
-- 		{ 'יִוָּלֵד', "yivaled" },
-- 		{ 'יָקִינְתּוֹן', "yakinton" },
-- 		{ 'כֻּתְנָה', "kutna" },
-- 		{ 'נַגָּרִיָּה', "nagariya" },
-- 		{ 'נַעֲלֶה', "na'ale" },
-- 		{ 'מִצְווֹת', "mitsvot" },
-- 		{ 'מָקוֹם', "makom" },
-- 		{ 'פֶּרוּאָנִי', "peru'ani" },
-- 		{ 'צִדְפָּה', "tsidpa" },
-- 		{ 'תׇּכְנָה', "tokhna" },
-- 		{ 'רְאוּ', "r'u" },

-- 		{ 'גּ׳וּק', "juk" },
-- 		{ 'ג׳וּק', "juk" },
-- 		{ 'גִּ׳ירָאפָה', "jirafa" },
-- 		{ 'גִ׳ירָאפָה', "jirafa" },
-- 		{ 'זַ׳רְגוֹן', "zhargon" },
-- 		{ 'קַפּוּצִ׳ינוֹ', "kapuchino" },

-- 		{ 'סְקוֹץ׳', "s'koch" },
-- 		{ 'סְתוֹם תַּ׳פֶּה', "s'tom ta′pe" },
-- 		{ 'אִמָּא׳לֶה', "'ima′le" },
-- 		{ 'חָזָ״ל', "khaza″l" },
-- 		{ 'נַחַ״ל', "nakha″l" },
-- 		{ 'רה״מ', "rh″m" },
-- 		{ 'ב״ה', "b″h" },
-- 		{ 'ת״א', "t″'" },
-- 	}
	
-- 	self:iterate(examples, self:do_test_translit("modern"))
-- end

-- function tests:test_biblical()
-- 	local examples = {
-- 		{ "בַּיִת", "bayiṯ" },
-- 		{ "בֵּית", "bēṯ" },
-- 		{ "בָּתִּים", "bāttīm" },
-- 		{ "מַחֲנֶה", "maḥăne" },
-- 		{ "בָּרָא", "bārā" },
-- 		{ "רֶגֶל", "reḡel" },
-- 		{ "כֹּהֵן", "kōhēn" },
-- 		{ "מֶלֶךְ", "meleḵ" },
-- 		{ "מַמְלָכָה", "mamlāḵā" },
-- 		{ "הַמַּמְלָכָה", "hammamlāḵā" },
-- 		{ "הַלְּלוּיָהּ", "halləlūyāh" },
-- 		{ "הַלְלוּיָהּ", "haləlūyāh" },
-- 		{ "יָדַע", "yāḏaʿ" },
-- 		{ "שָׁבוּעַ", "šāḇūaʿ" },
-- 		{ "רוּחַ", "rūaḥ" },
-- 		{ "גָּבֹהַּ", "gāḇōah" },
-- 		{ "מָשִׁיחַ", "māšīaḥ" },
-- 		{ "רֵיחַ", "rēaḥ" },
-- 		{ "שָׂדֶה", "śāḏe" },
-- 		{ "שְׂדֵה", "śəḏē" },
-- 		{ "בָּנַי", "bānay" },
-- 		{ "בְּנֵי", "bənē" },
-- 		{ "צָרְכִּי", "ṣorkī" },
-- 		{ "חָכְמָה", "ḥāḵəmā", "ambiguous case: could be ḥāḵəmā or ḥoḵmā, but I think ḥāḵəmā is the preferred default" },
-- 		{ "שִׁפְרָה", "šip̄rā" },
-- 		{ "שָׁכְבְּךָ", "šoḵbəḵā" },
-- 		{ "הָפְכָּה", "hop̄kā", "made-up word, but a particular potentially problematic Unicode situation" },
-- 		{ "קָטְבּוֹ", "qoṭbō", "another particular potentially problematic Unicode situation" },
-- 		{ "נִשְׂרְפָה", "niśrəp̄ā" },
-- 		{ "בָּנָיו", "bānāw" },
-- 		{ "בָּנֶיהָ", "bānehā" },
-- 		{ "מִצְוֹת", "miṣwōṯ" },
-- 		{ "זִוּוּג", "ziwwūḡ" },
-- 		{ "רֹאשׁ", "rōš" },
-- 		{ "רֵאשִׁית", "rēšīṯ" },
-- 		{ "רִאשׁוֹן", "rīšōn" },
-- 		{ "מְלָאכָה", "məlāḵā" },
-- 		{ "מְלֶאכֶת", "məleḵeṯ" },
-- 		{ "חֵטְא", "ḥēṭ" },
-- 		{ "בָּרָאתָ", "bārāṯā" },
-- 		{ "חַטֹּאות", "ḥaṭṭōṯ" },
-- 		{ "יְראוּ", "yərū" },
-- 		{ "וַיֶּאְסֹר", "wayyeʾsōr" },
-- 		{ "הָחְלַט", "hoḥlaṭ" },
-- 		{ "וַיֵּבְךְּ", "wayyēḇk" },
-- 		{ "אַרְאֶךָּ", "ʾarʾekkā" },
-- 		{ "וַיַּשְׁקְ", "wayyašq" },
-- 		{ "אַתְּ", "ʾatt" },
-- 		{ "וּוָווֹ", "ūwāwō" },
-- 		{ "וָו", "wāw" },
-- 		{ "תָּו", "tāw" },
-- 		{ "קַו", "qaw" },
-- 		{ "לָאו", "lāw" },
-- 		{ "חַי", "ḥay" },
-- 		{ "חָי", "ḥāy", "pausal" },
-- 		{ "פִּיו", "pīw" },
-- 		{ "כִּסְלֵו", "kislēw" },
-- 		{ "גּוֹי", "gōy" },
-- 		{ "גֹּי", "gōy" },
-- 		{ "גֹּיִים", "gōyīm" },
-- 		{ "רָאוּי", "rāʾūy" },
-- 		{ "קִיא", "qī" },
-- 		{ "יָבִיאוּ", "yāḇīʾū" },
-- 		{ "יְבִיאוּן", "yəḇīʾūn" },
-- 		{ "מֵאוּן", "mēʾūn" },
-- 		{ "מֵיאוּן", "mēʾūn" },
-- 		{ "בּוֹאוּ", "bōʾū" },
-- 		{ "בֹּאוּ", "bōʾū" },
-- 		{ "בּוּאוּ", "būʾū", "made-up word, but may help identify the issue" },
-- 		{ "אָבִיאָה", "ʾāḇīʾā" },
-- 		{ "מֵאָה", "mēʾā" },
-- 		{ "גֵּיאָהּ", "gēʾāh" },
-- 		{ "אָבוֹאָה", "ʾāḇōʾā" },
-- 		{ "אָבֹאָה", "ʾāḇōʾā" },
-- 		{ "נְשׂוּאָה", "nəśūʾā" },
-- 		{ "קִיאוֹ", "qīʾō" },
-- 		{ "גֵּאוֹ", "gēʾō" },
-- 		{ "גֵּיאוֹ", "gēʾō" },
-- 		{ "בּוֹאוֹ", "bōʾō" },
-- 		{ "בֹּאוֹ", "bōʾō" },
-- 		{ "מִלּוּאוֹ", "millūʾō" },
-- 		{ "מִי", "mī" },
-- 		{ "אִיִּים", "ʾiyyīm" },
-- 		{ "אִיּוֹב", "ʾiyyōḇ" },
-- 		{ "אִיּוּן", "ʾiyyūn" },
-- 		{ "אַיִן", "ʾayin" },
-- 		{ "בּוֹא", "bō" },
-- 		{ "יְפֵהפֶה", "yəp̄ēp̄e" },
-- 		{ "אֹהֶל", "ʾōhel" },
-- 		{ "הָאֹהֱלָה", "hāʾōhĕlā" },
-- 		{ "אָהֳלוֹ", "ʾohŏlō" },
-- 		{ "אָהָלְךָ", "ʾoholəḵā" },
-- 		{ "יִשָּׂשכָר", "yiśśāḵār", "Still undecided if this actually needs to be handled" },
-- 		{ "הוֹשִׁיעָה נָּא", "hōšīʿā nnā" },
-- 		{ "עַד בֹּאֲךָ", "ʿaḏ bōʾăḵā" },
-- 		{ "וַיַּשְׁקְ אֶת הַצֹּאן", "wayyašq ʾeṯ haṣṣōn" },
-- 		{ "בְּנֵי בְרָק", "bənē ḇərāq" },
-- 		{ "בְרָק", "ḇərāq" },
-- 		{ "אִישׁ יְהוּדִי הָיָה בְּשׁוּשַׁן הַבִּירָה וּשְׁמוֹ מָרְדֳּכַי בֶּן יָאִיר בֶּן־שִׁמְעִי בֶּן־קִישׁ אִישׁ יְמִינִי׃", "ʾīš yəhūḏī hāyā bəšūšan habbīrā ūšəmō mordŏḵay ben yāʾīr ben-šimʿī ben-qīš ʾīš yəmīnī." },
-- 		{ "אִ֣ישׁ יְהוּדִ֔י הָיָ֖ה בְּשׁוּשַׁ֣ן הַבִּירָ֑ה וּשְׁמ֣וֹ מָרְדֳּכַ֗י בֶּ֣ן יָאִ֧יר בֶּן־שִׁמְעִ֛י בֶּן־קִ֖ישׁ אִ֥ישׁ יְמִינִֽי׃", "ʾīš yəhūḏī hāyā bəšūšan habbīrā ūšəmō mordŏḵay ben yāʾīr ben-šimʿī ben-qīš ʾīš yəmīnī.", "fully accented verse; stress should not be indicated in the final syllable" },
-- 		{ "וַיְהִי הַמַּבּוּל אַרְבָּעִים יוֹם עַל־הָאָרֶץ וַיִּרְבּוּ הַמַּיִם וַיִּשְׂאוּ אֶת־הַתֵּבָה וַתָּרָם מֵעַל הָאָרֶץ׃‎", "wayəhī hammabbūl ʾarbāʿīm yōm ʿal-hāʾā́reṣ wayyirbū hammáyim wayyiśəʾū ʾeṯ-hattēḇā wattā́rom mēʿal hāʾāreṣ.", "a reminder of why this is hard" },
-- 		{ "וַיְהִ֧י הַמַּבּ֛וּל אַרְבָּעִ֥ים י֖וֹם עַל־הָאָ֑רֶץ וַיִּרְבּ֣וּ הַמַּ֗יִם וַיִּשְׂאוּ֙ אֶת־הַתֵּבָ֔ה וַתָּ֖רָם מֵעַ֥ל הָאָֽרֶץ׃", "wayəhī hammabbūl ʾarbāʿīm yōm ʿal-hāʾā́reṣ wayyirbū hammáyim wayyiśəʾū ʾeṯ-hattēḇā wattā́rom mēʿal hāʾāreṣ.", "fully accented verse version of the above" },

-- 		"implicit ktiv/qre that would be nice to have",
-- 		{ "הִוא", "hī" },
-- 		{ "יְרוּשָׁלִַם", "yərūšālayim" },
-- 		{ "יְרוּשָׁלִָם", "yərūšālāyim", "pausal form" },
-- 		{ "יְרוּשָׁלְַמָה", "yərūšālaymā" },
-- 		{ "יְרוּשָׁלְָמָה", "yərūšālāymā" },

-- 		"ktiv male tests",
-- 		{ "חַיָּיב", "ḥayyāḇ" },
-- 		{ "חַוָּוה", "ḥawwā" },
-- 		{ "הֱוֵוה", "hĕwē" },
-- 		{ "הַיְינוּ", "haynū" },
-- 		{ "הִתְכַּוְּונוּ", "hiṯkawwənū" },
-- 		{ "גַּוְונָא", "gawnā" },
-- 		{ "מְייוּחָד", "məyūḥāḏ" , "there is no way to tell that it really should be məyuḥāḏ, but anyway this test is for the double yod"},
-- 		{ "כְּדַאי", "kəḏay" },
-- 		{ "כּוּלָּם", "kullām", "shuruk does not necessarily imply a long vowel" },
-- 		{ "קִידּוּשׁ", "qiddūš", "chiriq male does not necessarily imply a long vowel" },
-- 	}
-- 	self:iterate(examples, self:do_test_translit("biblical"))
-- end
 
-- return tests