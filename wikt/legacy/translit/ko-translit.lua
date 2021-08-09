-- This module will transliterate Korean language text. It is also used to transliterate Jeju (jje).

local export = {}
local gsub = mw.ustring.gsub
local match = mw.ustring.match

function export.tr(word, sc, lang)
	word = gsub(word, "%([一丁-龯㐀-䶵]+%)", "")
	word = gsub(word, "—", "-")
	
	if match(word, "^[ㅂㅈㄷㄱㅅㅁㄴㅇㄹㅎㅋㅌㅊㅍㄸㅃㅉㄲㅆㅛㅕㅑㅐㅔㅗㅓㅏㅣㅠㅜㅡㅖㅒ%-]+$") then
		return (gsub(word,
			"[ㅂㅈㄷㄱㅅㅁㄴㅇㄹㅎㅋㅌㅊㅍㄸㅃㅉㄲㅆㅛㅕㅑㅐㅔㅗㅓㅏㅣㅠㅜㅡㅖㅒ]", {
				["ㅂ"] = "b", ["ㅈ"] = "j", ["ㄷ"] = "d", ["ㄱ"] = "g", ["ㅅ"] = "s", 
				["ㅁ"] = "m", ["ㄴ"] = "n", ["ㅇ"] = "/", ["ㄹ"] = "l", ["ㅎ"] = "h", 
				["ㅋ"] = "k", ["ㅌ"] = "t", ["ㅊ"] = "ch", ["ㅍ"] = "p", 
				["ㄸ"] = "tt", ["ㅃ"] = "pp", ["ㅉ"] = "jj", ["ㄲ"] = "kk", ["ㅆ"] = "ss", 
				["ㅛ"] = "yo", ["ㅕ"] = "yeo", ["ㅑ"] = "ya", ["ㅐ"] = "ae", ["ㅔ"] = "e", 
				["ㅗ"] = "o", ["ㅓ"] = "eo", ["ㅏ"] = "a", ["ㅣ"] = "i", ["ㅠ"] = "yu", 
				["ㅜ"] = "u", ["ㅡ"] = "eu", ["ㅖ"] = "ye", ["ㅒ"] = "yae" }
			))
	end
	
	if not match(word, "[가-힣]") then
		return nil
	end
	local m_pron = require("/usr/local/lib/lua/wikt/translit/ko-pron")
	local revised = m_pron.romanise(word, 2, {}, true)
	
	if not revised then
		return nil
	end
	
	if match(revised, "[%.%?%!]") then
		revised = mw.ustring.upper(mw.ustring.sub(revised, 1, 1)) .. mw.ustring.sub(revised, 2, -1)
		revised = gsub(revised, "([%.%?%!]) ([a-z%'])", "%1 ^%2")
		revised = gsub(revised, "^%'%'%'", "'''^")
	end
	revised = gsub(revised, "%^%'%'%'", "'''^")
	revised = gsub(revised, "%^%l", mw.ustring.upper)
	revised = gsub(revised, '%^', '')
	revised = gsub(revised, "%-'''%-", "'''-")
	revised = gsub(revised, "%-%-", "-")
	
	return revised
end

export.tr_revised = export.tr

return export

-- 	Text	Expected	Actual	Differs at
-- Passed	위키백과는 위키를 이용하여 전 세계 사람들이 함께 만들어가는 웹 기반의 다언어 백과사전입니다.	Wikibaekgwaneun wikireul iyonghayeo jeon segye saramdeuri hamkke mandeureoganeun wep gibanui da-eoneo baekgwasajeonimnida.	Wikibaekgwaneun wikireul iyonghayeo jeon segye saramdeuri hamkke mandeureoganeun wep gibanui da-eoneo baekgwasajeonimnida.	
-- Passed	위키백과는 중립적이고 검증 가능한 자유 콘텐츠 백과사전의 제공을 목적으로 하는 프로젝트로, 누구나 참여하여 문서를 수정하고 발전시킬 수 있습니다.	Wikibaekgwaneun jungnipjeogigo geomjeung ganeunghan jayu kontencheu baekgwasajeonui jegong-eul mokjeogeuro haneun peurojekteuro, nuguna chamyeohayeo munseoreul sujeonghago baljeonsikil su itseumnida.	Wikibaekgwaneun jungnipjeogigo geomjeung ganeunghan jayu kontencheu baekgwasajeonui jegong-eul mokjeogeuro haneun peurojekteuro, nuguna chamyeohayeo munseoreul sujeonghago baljeonsikil su itseumnida.	
-- Passed	한국어(韓國語)는 주로 한반도에서 쓰이는 언어로, 대한민국에서는 한국어, 한국말이라고 부른다.	Han-gugeoneun juro hanbando-eseo sseu-ineun eoneoro, daehanmin-gugeseoneun han-gugeo, han-gungmarirago bureunda.	Han-gugeoneun juro hanbando-eseo sseu-ineun eoneoro, daehanmin-gugeseoneun han-gugeo, han-gungmarirago bureunda.	
-- Passed	조선민주주의인민공화국에서는 조선어(朝鮮語), 중국(조선족 위주)에서도 조선어(朝鮮語)로 불린다.	Joseonminjujuuiinmin-gonghwagugeseoneun joseoneo, jungguk(joseonjok wiju)eseodo joseoneoro bullinda.	Joseonminjujuuiinmin-gonghwagugeseoneun joseoneo, jungguk(joseonjok wiju)eseodo joseoneoro bullinda.	
-- Passed	카자흐스탄 등 구 소련의 고려인들 사이에서는 고려말(高麗말)로 불린다.	Kajaheuseutan deung gu soryeonui goryeoindeul saieseoneun goryeomal(高麗mal)ro bullinda.	Kajaheuseutan deung gu soryeonui goryeoindeul saieseoneun goryeomal(高麗mal)ro bullinda.	
-- Passed	인간은 천부척으로 이성과 양싱을 부여받았으며 서로 형첸개의 청신으로 헹동하여야 한다.	In-ganeun cheonbucheogeuro iseonggwa yangsing-eul buyeobadasseumyeo seoro hyeongchen-gae-ui cheongsineuro hengdonghayeoya handa.	In-ganeun cheonbucheogeuro iseonggwa yangsing-eul buyeobadasseumyeo seoro hyeongchen-gae-ui cheongsineuro hengdonghayeoya handa.	
-- Passed	모든 인간은 태어날 때부터 자유로우며 그 존엄과 권리에 있어 동등하다.	Modeun in-ganeun taeeonal ttaebuteo jayuroumyeo geu joneomgwa gwollie isseo dongdeunghada.	Modeun in-ganeun taeeonal ttaebuteo jayuroumyeo geu joneomgwa gwollie isseo dongdeunghada.	
-- Passed	모든 人間은 태어날 때부터 自由로우며 그 尊嚴과 權利에 있어 同等하다.	Modeun 人間eun taeeonal ttaebuteo 自由roumyeo geu 尊嚴gwa 權利e isseo 同等hada.	Modeun 人間eun taeeonal ttaebuteo 自由roumyeo geu 尊嚴gwa 權利e isseo 同等hada.	
-- Passed	人間은 天賦的으로 理性과 良心을 賦與받았으며 서로 兄弟愛의 精神으로 行動하여야 한다.	人間eun 天賦的euro 理性gwa 良心eul 賦與badasseumyeo seoro 兄弟愛ui 精神euro 行動hayeoya handa.	人間eun 天賦的euro 理性gwa 良心eul 賦與badasseumyeo seoro 兄弟愛ui 精神euro 行動hayeoya handa.	
-- test_translit_revised_words:
-- Text	Expected	Actual	Differs at
-- Passed	미얀마	miyanma	miyanma	
-- Passed	버마	beoma	beoma	
-- Passed	확인	hwagin	hwagin	
-- Passed	직접	jikjeop	jikjeop	
-- Passed	있다	itda	itda	
-- Passed	녹말	nongmal	nongmal	
-- Passed	같이	gachi	gachi	
-- Passed	바깥	bakkat	bakkat	
-- Passed	런던	reondeon	reondeon	
-- Passed	먹다	meokda	meokda	
-- Passed	사무실에서	samusireseo	samusireseo	
-- Passed	죄송합니다	joesonghamnida	joesonghamnida	
-- Passed	있습니다	itseumnida	itseumnida	
-- Passed	강홍립	ganghongnip	ganghongnip	
-- Passed	메가폰	megapon	megapon	
-- Passed	갋	gal	gal	
-- Passed	갌	gal	gal	
-- Passed	갍	gal	gal	
-- Passed	갎	gap	gap	
-- Passed	갏	gal	gal	
-- Passed	갋갌갍갎갏	galgalgalgapgal	galgalgalgapgal	
-- Passed	갈비뼈	galbippyeo	galbippyeo	
-- Passed	값	gap	gap	
-- Passed	값의	gapsui	gapsui	
-- Passed	갏의	garui	garui	
-- Passed	갌의	galsui	galsui	
-- Passed	있습니다	itseumnida	itseumnida	
-- Passed	없다	eopda	eopda	
-- Passed	그렇다	geureota	geureota	
-- Passed	굵다	gukda	gukda	
-- Passed	귀찮다	gwichanta	gwichanta	
-- Passed	편찮다	pyeonchanta	pyeonchanta	
-- -- Unit tests for [[Module:ko-translit]]. Refresh page to run tests.
-- local tests = require('Module:UnitTests')
-- local ko_translit = require('Module:ko-translit')

-- function tests:check_translit(hangul, romaja, nolink)
-- 	self:equals(
-- 		(nolink and '<span class="Kore mention"><!-- %s -->%s</span>' or '<span class="Kore mention">[[%s#Korean|%s]]</span>'):format(
-- 			hangul, hangul
-- 		),
-- 		(xlit or ko_translit.tr_revised)(hangul, 'ko', 'Kore', syldelim),
-- 		romaja 
-- 	)
-- end

-- function tests:test_translit_revised_sentences()
-- 	self:check_translit(
-- 		'위키백과는 위키를 이용하여 전 세계 사람들이 함께 만들어가는 웹 기반의 다언어 백과사전입니다.',
-- 		'Wikibaekgwaneun wikireul iyonghayeo jeon segye saramdeuri hamkke mandeureoganeun wep gibanui da-eoneo baekgwasajeonimnida.',
-- 		true
-- 	)
	
-- 	self:check_translit(
-- 		'위키백과는 중립적이고 검증 가능한 자유 콘텐츠 백과사전의 제공을 목적으로 하는 프로젝트로, 누구나 참여하여 문서를 수정하고 발전시킬 수 있습니다.',
-- 		'Wikibaekgwaneun jungnipjeogigo geomjeung ganeunghan jayu kontencheu baekgwasajeonui jegong-eul mokjeogeuro haneun peurojekteuro, nuguna chamyeohayeo munseoreul sujeonghago baljeonsikil su itseumnida.',
-- 		true
-- 	)

-- 	self:check_translit(
-- 		'한국어(韓國語)는 주로 한반도에서 쓰이는 언어로, 대한민국에서는 한국어, 한국말이라고 부른다.',
-- 		'Han-gugeoneun juro hanbando-eseo sseu-ineun eoneoro, daehanmin-gugeseoneun han-gugeo, han-gungmarirago bureunda.',
-- 		true
-- 	)

-- 	self:check_translit(
-- 		'조선민주주의인민공화국에서는 조선어(朝鮮語), 중국(조선족 위주)에서도 조선어(朝鮮語)로 불린다.',
-- 		'Joseonminjujuuiinmin-gonghwagugeseoneun joseoneo, jungguk(joseonjok wiju)eseodo joseoneoro bullinda.',
-- 		true
-- 	)

-- 	self:check_translit(
-- 		'카자흐스탄 등 구 소련의 고려인들 사이에서는 고려말(高麗말)로 불린다.',
-- 		'Kajaheuseutan deung gu soryeonui goryeoindeul saieseoneun goryeomal(高麗mal)ro bullinda.',
-- 		true
-- 	)
	
-- 	self:check_translit(
-- 		'인간은 천부척으로 이성과 양싱을 부여받았으며 서로 형첸개의 청신으로 헹동하여야 한다.',
-- 		'In-ganeun cheonbucheogeuro iseonggwa yangsing-eul buyeobadasseumyeo seoro hyeongchen-gae-ui cheongsineuro hengdonghayeoya handa.',
-- 		true
-- 	)

-- 	self:check_translit(
-- 		'모든 인간은 태어날 때부터 자유로우며 그 존엄과 권리에 있어 동등하다.',
-- 		'Modeun in-ganeun taeeonal ttaebuteo jayuroumyeo geu joneomgwa gwollie isseo dongdeunghada.',
-- 		true
-- 	)

-- 	self:check_translit(
-- 		'모든 人間은 태어날 때부터 自由로우며 그 尊嚴과 權利에 있어 同等하다.',
-- 		'Modeun 人間eun taeeonal ttaebuteo 自由roumyeo geu 尊嚴gwa 權利e isseo 同等hada.',
-- 		true
-- 	)
-- 	self:check_translit(
-- 		'人間은 天賦的으로 理性과 良心을 賦與받았으며 서로 兄弟愛의 精神으로 行動하여야 한다.',
-- 		'人間eun 天賦的euro 理性gwa 良心eul 賦與badasseumyeo seoro 兄弟愛ui 精神euro 行動hayeoya handa.',
-- 		true
-- 	)	
-- end

-- function tests:test_translit_revised_words()
-- 	self:check_translit('미얀마'     , 'miyanma')
-- 	self:check_translit('버마'     , 'beoma')
-- 	self:check_translit('확인'     , 'hwagin')
-- 	self:check_translit('직접'     , 'jikjeop')
-- 	self:check_translit('있다'     , 'itda')
-- 	self:check_translit('녹말'     , 'nongmal')
-- 	self:check_translit('같이'     , 'gachi')
-- 	self:check_translit('바깥'     , 'bakkat')
-- 	self:check_translit('런던'     , 'reondeon')
-- 	self:check_translit('먹다'     , 'meokda')
-- 	self:check_translit('사무실에서', 'samusireseo')
-- 	self:check_translit('죄송합니다', 'joesonghamnida')
-- 	self:check_translit('있습니다'  , 'itseumnida')
-- 	self:check_translit('강홍립'    , 'ganghongnip')
-- 	self:check_translit('메가폰'    , 'megapon')
-- 	self:check_translit('갋'       , 'gal')
-- 	self:check_translit('갌'       , 'gal')
-- 	self:check_translit('갍'       , 'gal')
-- 	self:check_translit('갎'       , 'gap')
-- 	self:check_translit('갏'       , 'gal')
-- 	self:check_translit('갋갌갍갎갏', 'galgalgalgapgal')
-- 	self:check_translit('갈비뼈', 'galbippyeo')
-- 	self:check_translit('값', 'gap')
-- 	self:check_translit('값의', 'gapsui')
-- 	self:check_translit('갏의', 'garui')
-- 	self:check_translit('갌의', 'galsui')
-- 	self:check_translit('있습니다', 'itseumnida')
-- 	self:check_translit('없다', 'eopda')
-- 	self:check_translit('그렇다', 'geureota')
-- 	self:check_translit('굵다', 'gukda')
-- 	self:check_translit('귀찮다', 'gwichanta')
-- 	self:check_translit('편찮다', 'pyeonchanta')
-- end
 
-- return tests