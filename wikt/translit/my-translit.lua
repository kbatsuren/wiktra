-- This module will transliterate Burmese language text per the MLCTS scheme.
-- Language code: mya

local export = {}
local gsub = mw.ustring.gsub

local symbols = {
	["၀"] = "0", ["၁"] = "1", ["၂"] = "2", ["၃"] = "3", ["၄"] = "4", 
	["၅"] = "5", ["၆"] = "6", ["၇"] = "7", ["၈"] = "8", ["၉"] = "9", 
	["၊"] = "&#124;", ["။"] = "&#124;&#124;"
}

function export.tr(text, lang, sc, debug_mode)
	local m_pron = require("/usr/local/lib/lua/wikt/translit/my-pron").get_romanisation
	text = gsub(text, ".", symbols)
	for word in mw.ustring.gmatch(text, "[က-႟ꩠ-ꩻ]+") do
		success, translit = pcall(m_pron, word, nil, { 2, ["type"] = "orthographic", ["name"] = "MLCTS" }, 2, "translit_module")
		if success then
			text = gsub(text, word, translit, 1)
		else
			return nil
		end
	end
	if mw.ustring.match(text, "[က-႟ꩠ-ꩻ]") and not debug_mode then
		return nil
	end
	return text
end

return export

-- 2 tests failed. (refresh)

-- test_translit:
-- Text	Expected	Actual	Differs at
-- Failed	သျှိုး		(nil)	N/A
-- Failed	ယောက်ျား	yaukya:	(nil)	N/A
-- Passed	ပြဿနာ	pra.ssa.na	pra.ssa.na	
-- Passed	ဩစတြီးယား	au:ca.tri:ya:	au:ca.tri:ya:	
-- Passed	အီကွေဒေါ	i-kwedau:	i-kwedau:	
-- Passed	ဘင်္ဂလားဒေ့ရှ်	bhangga.la:de.hr	bhangga.la:de.hr	
-- Passed	ဘလော့ဂ်	bha.laug.	bha.laug.	
-- Passed	အကျဉ်းထောင်	a.kyany:htaung	a.kyany:htaung	
-- Passed	တာ့ခ်မင်နစ္စတန်	tahk.mangnacca.tan	tahk.mangnacca.tan	
-- Passed	နှစ်သစ်ကူး မင်္ဂလာပါ	hnacsacku: mangga.lapa	hnacsacku: mangga.lapa	
-- Passed	ဆယ့်လေး	hcai.le:	hcai.le:	
-- Passed	ဗော့ဒ်ကာ၏	baud.kae	baud.kae	
-- Passed	သမီး၏	sa.mi:e	sa.mi:e	
-- Passed	အီးမေးလ်၏	i:mel:e	i:mel:e	
-- Passed	ကြိုဆိုပါ၏	kruihcuipae	kruihcuipae	
-- Passed	ဥက္ကဌ	ukka.hta.	ukka.hta.	
-- Passed	၊	|	|	
-- Passed	။	||	||	
-- Passed	ထိုင်းနိုင်ငံ	htuing:nuingngam	htuing:nuingngam	
-- Passed	ယိုးဒယားနိုင်ငံ	yui:da.ya:nuingngam	yui:da.ya:nuingngam	
-- Passed	ကိုယ့်မင်းကိုယ့်ချင်း	kuiy.mang:kuiy.hkyang:	kuiy.mang:kuiy.hkyang:	
-- Passed	ကမ်းခြေ	kam:hkre	kam:hkre	
-- Passed	ဝိဇ္ဇာ	wijja	wijja	
-- Passed	ဒုက္ခ	dukhka.	dukhka.	
-- Passed	ကဏ္ဍ	kanda.	kanda.	
-- Passed	မန္တလေး	manta.le:	manta.le:	
-- Passed	ပိဿာ	pi.ssa	pi.ssa	
-- Passed	ကြက်ဆင်	krakhcang	krakhcang	
-- Passed	မြန်မာဘာသာ	mranmabhasa	mranmabhasa	
-- Passed	ဒူးရင်းသီး	du:rang:si:	du:rang:si:	
-- Passed	ကျောင်းသူ	kyaung:su	kyaung:su	
-- Passed	အင်္ဂလိပ်	angga.lip	angga.lip	
-- Passed	ကမ္ဘာ	kambha	kambha	
-- Passed	ရင်ဘတ်	rangbhat	rangbhat	
-- Passed	ရုပ်ရှင်ရုံ	ruphrang-rum	ruphrang-rum	
-- Passed	နွေဦးပေါက်	nweu:pauk	nweu:pauk	
-- Passed	စာကြည့်တိုက်	ca-krany.tuik	ca-krany.tuik	
-- Passed	နှာခေါင်း	hnahkaung:	hnahkaung:	
-- Passed	ဆောင်းဦး	hcaung:u:	hcaung:u:	
-- Passed	ဗမာစကား	ba.maca.ka:	ba.maca.ka:	
-- Passed	သန်ကောင်	sankaung	sankaung	
-- Passed	သည်းခြေ	sany:hkre	sany:hkre	
-- Passed	သင်္ချိုင်း	sanghkyuing:	sanghkyuing:	
-- Passed	နာမည်	namany	namany	
-- Passed	ဒေါင်း	daung:	daung:	
-- Passed	ရင်ပတ်	rangpat	rangpat	
-- Passed	မျောက်	myauk	myauk	
-- Passed	မျက်စိ	myakci.	myakci.	
-- Passed	မိန်းမ	min:ma.	min:ma.	
-- Passed	လွတ်လပ်ခွင့်	lwatlaphkwang.	lwatlaphkwang.	
-- Passed	လှေ	hle	hle	
-- Passed	ဆေးရုံ	hce:rum	hce:rum	
-- Passed	ဘာသာဗေဒ	bhasabeda.	bhasabeda.	
-- Passed	ဘူတာရုံ	bhutarum	bhutarum	
-- Passed	တက္ကသိုလ်	takka.suil	takka.suil	
-- Passed	တရုတ်စကား	ta.rutca.ka:	ta.rutca.ka:	
-- Passed	ဗုဒ္ဓ	buddha.	buddha.	
-- Passed	ဂြိုဟ်	gruih	gruih	
-- Passed	အင်္ဂလိပ်ဘာသာ	angga.lipbhasa	angga.lipbhasa	
-- Passed	အဏ္ဏဝါ	anna.wa	anna.wa	
-- Passed	ဦးချို	u:hkyui	u:hkyui	
-- Passed	အိပ်ရာ	ip-ra	ip-ra	
-- Passed	အဘိဓာန်	a.bhi.dhan	a.bhi.dhan	
-- Passed	လမ်းလျှောက်	lam:hlyauk	lam:hlyauk	
-- Passed	ရန်ဖြစ်	ranhprac	ranhprac	
-- Passed	အော့အန်	au.an	au.an	
-- Passed	ပြည်ထောင်စု မြန်မာ နိုင်ငံတော်	pranyhtaungcu. mranma nuingngamtau	pranyhtaungcu. mranma nuingngamtau	
-- Passed	အိန္ဒိယနိုင်ငံ	indi.ya.nuingngam	indi.ya.nuingngam	
-- Passed	ရန်ကုန်မြို့	rankunmrui.	rankunmrui.	
-- Passed	ထိုင်ဝမ်	htuing-wam	htuing-wam	
-- Passed	အီတလီနိုင်ငံ	ita.linuingngam	ita.linuingngam	
-- Passed	ရွှေဖရုံသီး	hrwehpa.rumsi:	hrwehpa.rumsi:	
-- Passed	ဖြစ်ခေါင့်ဖြစ်ခဲ	hprachkaung.hprachkai:	hprachkaung.hprachkai:	
-- Passed	ခေါင့်	hkaung.	hkaung.	
-- Passed	ဝက်အူ	wak-u	wak-u	
-- Passed	ဥစ်	uc	uc	
-- Passed	မလာနိုင်ပါဘူး။	ma.lanuingpabhu:||	ma.lanuingpabhu:||	
-- local tests = require('Module:UnitTests')
-- local my_translit = require('Module:my-translit')
 
-- function tests:check_tr(Mymr, Latn)
-- 	self:equals(('<span class="Mymr" lang="my">[[%s#Burmese|%s]]</span>'):format(Mymr, Mymr), my_translit.tr(Mymr, 'my', 'Mymr'), Latn)
-- end

-- function tests:test_translit()
	
-- 	self:check_tr("သျှိုး", "")
-- 	self:check_tr("ယောက်ျား", "yaukya:")
-- 	self:check_tr("ပြဿနာ", "pra.ssa.na")
-- 	self:check_tr("ဩစတြီးယား", "au:ca.tri:ya:")
-- 	self:check_tr("အီကွေဒေါ", "i-kwedau:")
-- 	self:check_tr("ဘင်္ဂလားဒေ့ရှ်", "bhangga.la:de.hr")
-- 	self:check_tr("ဘလော့ဂ်", "bha.laug.")
-- 	self:check_tr("အကျဉ်းထောင်", "a.kyany:htaung")
-- 	self:check_tr("တာ့ခ်မင်နစ္စတန်", "tahk.mangnacca.tan")
-- 	self:check_tr("နှစ်သစ်ကူး မင်္ဂလာပါ", "hnacsacku: mangga.lapa")
-- 	self:check_tr("ဆယ့်လေး", "hcai.le:")
-- 	self:check_tr("ဗော့ဒ်ကာ၏", "baud.kae")
-- 	self:check_tr("သမီး၏", "sa.mi:e")
-- 	self:check_tr("အီးမေးလ်၏", "i:mel:e")
-- 	self:check_tr("ကြိုဆိုပါ၏", "kruihcuipae")
-- 	self:check_tr("ဥက္ကဌ", "ukka.hta.")
-- 	self:check_tr("၊", "&#124;")
-- 	self:check_tr("။", "&#124;&#124;")
-- 	self:check_tr("ထိုင်းနိုင်ငံ", "htuing:nuingngam")
-- 	self:check_tr("ယိုးဒယားနိုင်ငံ", "yui:da.ya:nuingngam")
-- 	self:check_tr("ကိုယ့်မင်းကိုယ့်ချင်း", "kuiy.mang:kuiy.hkyang:")
-- 	self:check_tr("ကမ်းခြေ", "kam:hkre")
-- 	self:check_tr("ဝိဇ္ဇာ", "wijja")
-- 	self:check_tr("ဒုက္ခ", "dukhka.")
-- 	self:check_tr("ကဏ္ဍ", "kanda.")
-- 	self:check_tr("မန္တလေး", "manta.le:")
-- 	self:check_tr("ပိဿာ", "pi.ssa")
-- 	self:check_tr("ကြက်ဆင်", "krakhcang")
-- 	self:check_tr("မြန်မာဘာသာ", "mranmabhasa")
-- 	self:check_tr("ဒူးရင်းသီး", "du:rang:si:")
-- 	self:check_tr("ကျောင်းသူ", "kyaung:su")
-- 	self:check_tr("အင်္ဂလိပ်", "angga.lip")
-- 	self:check_tr("ကမ္ဘာ", "kambha")
-- 	self:check_tr("ရင်ဘတ်", "rangbhat")
-- 	self:check_tr("ရုပ်ရှင်ရုံ", "ruphrang-rum")
-- 	self:check_tr("နွေဦးပေါက်", "nweu:pauk")
-- 	self:check_tr("စာကြည့်တိုက်", "ca-krany.tuik")
-- 	self:check_tr("နှာခေါင်း", "hnahkaung:")
-- 	self:check_tr("ဆောင်းဦး", "hcaung:u:")
-- 	self:check_tr("ဗမာစကား", "ba.maca.ka:")
-- 	self:check_tr("သန်ကောင်", "sankaung")
-- 	self:check_tr("သည်းခြေ", "sany:hkre")
-- 	self:check_tr("သင်္ချိုင်း", "sanghkyuing:")
-- 	self:check_tr("နာမည်", "namany")
-- 	self:check_tr("ဒေါင်း", "daung:")
-- 	self:check_tr("ရင်ပတ်", "rangpat")
-- 	self:check_tr("မျောက်", "myauk")
-- 	self:check_tr("မျက်စိ", "myakci.")
-- 	self:check_tr("မိန်းမ", "min:ma.")
-- 	self:check_tr("လွတ်လပ်ခွင့်", "lwatlaphkwang.")
-- 	self:check_tr("လှေ", "hle")
-- 	self:check_tr("ဆေးရုံ", "hce:rum")
-- 	self:check_tr("ဘာသာဗေဒ", "bhasabeda.")
-- 	self:check_tr("ဘူတာရုံ", "bhutarum")
-- 	self:check_tr("တက္ကသိုလ်", "takka.suil")
-- 	self:check_tr("တရုတ်စကား", "ta.rutca.ka:")
-- 	self:check_tr("ဗုဒ္ဓ", "buddha.")
-- 	self:check_tr("ဂြိုဟ်", "gruih")
-- 	self:check_tr("အင်္ဂလိပ်ဘာသာ", "angga.lipbhasa")
-- 	self:check_tr("အဏ္ဏဝါ", "anna.wa")
-- 	self:check_tr("ဦးချို", "u:hkyui")
-- 	self:check_tr("အိပ်ရာ", "ip-ra")
-- 	self:check_tr("အဘိဓာန်", "a.bhi.dhan")
-- 	self:check_tr("လမ်းလျှောက်", "lam:hlyauk")
-- 	self:check_tr("ရန်ဖြစ်", "ranhprac")
-- 	self:check_tr("အော့အန်", "au.an")
-- 	self:check_tr("ပြည်ထောင်စု မြန်မာ နိုင်ငံတော်", "pranyhtaungcu. mranma nuingngamtau")
-- 	self:check_tr("အိန္ဒိယနိုင်ငံ", "indi.ya.nuingngam")
-- 	self:check_tr("ရန်ကုန်မြို့", "rankunmrui.")
-- 	self:check_tr("ထိုင်ဝမ်", 'htuing-wam')
-- 	self:check_tr("အီတလီနိုင်ငံ", 'ita.linuingngam')
-- 	self:check_tr("ရွှေဖရုံသီး", 'hrwehpa.rumsi:')
--     self:check_tr("ဖြစ်ခေါင့်ဖြစ်ခဲ", 'hprachkaung.hprachkai:')
--     self:check_tr("ခေါင့်", "hkaung.")
--     self:check_tr("ဝက်အူ", "wak-u")
--     self:check_tr("ဥစ်", "uc")
--     self:check_tr("မလာနိုင်ပါဘူး။", "ma.lanuingpabhu:&#124;&#124;")
-- end

-- return tests