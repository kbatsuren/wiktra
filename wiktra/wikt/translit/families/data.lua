--[=[
	This module contains definitions for all language family codes on Wiktionary.
]=] --
local m = {}

m["aav"] = {canonicalName = "Austroasiatic", aliases = {"Austro-Asiatic"}, wikidata_item = 33199}

m["aav-khs"] = {canonicalName = "Khasian", aliases = {"Khasic"}, family = "aav", wikidata_item = 3073734}

m["aav-nic"] = {canonicalName = "Nicobarese", family = "aav", wikidata_item = 217380}

m["aav-pkl"] = {canonicalName = "Pnar-Khasi-Lyngngam", family = "aav-khs"}

m["afa"] = {canonicalName = "Afroasiatic", aliases = {"Afro-Asiatic"}, wikidata_item = 25268}

m["alg"] = {canonicalName = "Algonquian", family = "aql", wikidata_item = 33392}

m["alg-abp"] = {canonicalName = "Abenaki-Penobscot", family = "alg-eas", wikidata_item = 197936}

m["alg-ara"] = {canonicalName = "Arapahoan", family = "alg", wikidata_item = 2153686}

m["alg-eas"] = {canonicalName = "Eastern Algonquian", family = "alg", wikidata_item = 2257525}

m["alg-sfk"] = {canonicalName = "Sac-Fox-Kickapoo", family = "alg", wikidata_item = 1440172}

m["alv"] = {canonicalName = "Atlantic-Congo", family = "nic", wikidata_item = 771124}

m["alv-aah"] = {canonicalName = "Ayere-Ahan", family = "alv-von", wikidata_item = 750953}

m["alv-ada"] = {canonicalName = "Adamawa", family = "alv-sav", wikidata_item = 32906}

m["alv-bag"] = {canonicalName = "Baga", family = "alv-mel"}

m["alv-bak"] = {canonicalName = "Bak", family = "alv-sng", wikidata_item = 1708174}

m["alv-bam"] = {canonicalName = "Bambukic", aliases = {"Yungur-Jen"}, family = "alv-ada", wikidata_item = 4853456}

m["alv-bny"] = {canonicalName = "Banyum", family = "alv-nyn"}

m["alv-bua"] = {canonicalName = "Bua", family = "alv-mbd", wikidata_item = 4982094}

m["alv-bwj"] = {canonicalName = "Bikwin-Jen", family = "alv-bam"}

m["alv-cng"] = {canonicalName = "Cangin", family = "alv-fwo", wikidata_item = 1033184}

m["alv-ctn"] = {canonicalName = "Central Tano", aliases = {"Akan"}, family = "alv-ptn", wikidata_item = 1658486}

m["alv-dlt"] = {canonicalName = "Delta Edoid", family = "alv-edo"}

m["alv-dur"] = {canonicalName = "Duru", family = "alv-lni", wikidata_item = 5316788}

m["alv-ede"] = {canonicalName = "Ede", family = "alv-yor", wikidata_item = 35368}

m["alv-edo"] = {canonicalName = "Edoid", family = "alv-von", wikidata_item = 1287469}

m["alv-eeo"] = {canonicalName = "Edo-Esan-Ora", family = "alv-nce"}

m["alv-fli"] = {canonicalName = "Fali", family = "alv", wikidata_item = 3450166}

m["alv-fwo"] = {canonicalName = "Fula-Wolof", family = "alv-sng", wikidata_item = 12631267}

m["alv-gba"] = {canonicalName = "Gbaya", family = "alv-sav", wikidata_item = 3099986, protoLanguage = "gba"}

m["alv-gbe"] = {canonicalName = "Gbe", family = "alv-von", wikidata_item = 668284}

m["alv-gbf"] = {canonicalName = "Eastern Gbaya", family = "alv-gba"}

m["alv-gbs"] = {canonicalName = "Southern Gbaya", family = "alv-gba"}

m["alv-gbw"] = {canonicalName = "Western Gbaya", family = "alv-gba"}

m["alv-gda"] = {canonicalName = "Ga-Dangme", family = "alv-kwa", wikidata_item = 3443338}

m["alv-gng"] = {canonicalName = "Guang", family = "alv-ptn", wikidata_item = 684009}

m["alv-gtm"] = {canonicalName = "Ghana-Togo Mountain", aliases = {"Togo Remnant", "Central Togo"}, family = "alv-kwa", wikidata_item = 493020}

m["alv-hei"] = {canonicalName = "Heiban", family = "alv-the"}

m["alv-ido"] = {canonicalName = "Idomoid", family = "alv-von", wikidata_item = 974196}

m["alv-igb"] = {canonicalName = "Igboid", family = "alv-von", wikidata_item = 1429100}

m["alv-jfe"] = {canonicalName = "Jola-Felupe", aliases = {"Ejamat"}, family = "alv-jol", wikidata_item = 1708174}

m["alv-jol"] = {canonicalName = "Jola", aliases = {"Diola"}, family = "alv-bak", wikidata_item = 35176}

m["alv-kim"] = {canonicalName = "Kim", family = "alv-mbd", wikidata_item = 6409701}

m["alv-kis"] = {canonicalName = "Kissi", family = "alv-mel"}

m["alv-krb"] = {canonicalName = "Karaboro", family = "alv-snf", wikidata_item = 4213541}

m["alv-ktg"] = {canonicalName = "Ka-Togo", family = "alv-gtm", wikidata_item = 5972796}

m["alv-kul"] = {canonicalName = "Kulango", family = "alv-sav", wikidata_item = 16977424, aliases = {"Kulango-Lorhon", "Kulango-Lorom"}}

m["alv-kwa"] = {canonicalName = "Kwa", family = "nic-vco", wikidata_item = 33430}

m["alv-lag"] = {canonicalName = "Lagoon", family = "alv-kwa"}

m["alv-lek"] = {
    canonicalName = "Leko",
    otherNames = {"Sambaic"}, -- appears to be an alias in Glottolog
    family = "alv-lni",
    wikidata_item = 6520642
}

m["alv-lim"] = {canonicalName = "Limba", family = "alv"}

m["alv-lni"] = {canonicalName = "Leko-Nimbari", otherNames = {"Central Adamawa"}, aliases = {"Chamba-Mumuye"}, family = "alv-ada", wikidata_item = 1708170}

m["alv-mbd"] = {canonicalName = "Mbum-Day", family = "alv-ada", wikidata_item = 6799816}

m["alv-mbm"] = {canonicalName = "Mbum", family = "alv-mbd", wikidata_item = 6799814}

m["alv-mel"] = {canonicalName = "Mel", family = "alv", wikidata_item = 12122355}

m["alv-mum"] = {canonicalName = "Mumuye", family = "alv-mye", wikidata_item = 84607009}

m["alv-mye"] = {canonicalName = "Mumuye-Yendang", family = "alv-lni", wikidata_item = 6935539}

m["alv-nal"] = {canonicalName = "Nalu", family = "alv-sng"}

m["alv-nce"] = {canonicalName = "North-Central Edoid", family = "alv-edo"}

m["alv-ngb"] = {canonicalName = "Nupe-Gbagyi", aliases = {"Nupe-Gbari"}, family = "alv-nup"}

m["alv-ntg"] = {canonicalName = "Na-Togo", family = "alv-gtm"}

m["alv-nup"] = {canonicalName = "Nupoid", family = "alv-von", wikidata_item = 1429143}

m["alv-nwd"] = {canonicalName = "Northwestern Edoid", family = "alv-edo"}

m["alv-nyn"] = {canonicalName = "Nyun", family = "alv-fwo"}

m["alv-pap"] = {canonicalName = "Papel", family = "alv-bak", wikidata_item = 7132562}

m["alv-pph"] = {canonicalName = "Phla–Pherá", family = "alv-gbe", wikidata_item = 3849625}

m["alv-ptn"] = {canonicalName = "Potou-Tano", family = "alv-kwa", wikidata_item = 1475003}

m["alv-sav"] = {canonicalName = "Savanna", family = "nic-vco", wikidata_item = 4403672, aliases = {"Savannas"}}

m["alv-sma"] = {canonicalName = "Suppire-Mamara", family = "alv-snf", wikidata_item = 4446348}

m["alv-snf"] = {canonicalName = "Senufo", family = "alv", wikidata_item = 33795, aliases = {"Senufic", "Senoufo"}}

m["alv-sng"] = {canonicalName = "Senegambian", family = "alv", wikidata_item = 1708753}

m["alv-snr"] = {canonicalName = "Senari", family = "alv-snf", wikidata_item = 4416084}

m["alv-swd"] = {canonicalName = "Southwestern Edoid", family = "alv-edo"}

m["alv-tal"] = {canonicalName = "Talodi", family = "alv-the", wikidata_item = 12643302}

m["alv-tdj"] = {canonicalName = "Tagwana-Djimini", family = "alv-snf", wikidata_item = 7675362}

m["alv-ten"] = {canonicalName = "Tenda", family = "alv-fwo", wikidata_item = 3217535}

m["alv-the"] = {canonicalName = "Talodi-Heiban", family = "alv", wikidata_item = 1521145}

m["alv-von"] = {canonicalName = "Volta-Niger", family = "nic-vco", wikidata_item = 34177}

m["alv-wan"] = {canonicalName = "Wara-Natyoro", family = "alv-sav", wikidata_item = 7968830}

m["alv-wjk"] = {canonicalName = "Waja-Kam", family = "alv-ada"}

m["alv-yek"] = {canonicalName = "Yekhee", family = "alv-nce"}

m["alv-yor"] = {canonicalName = "Yoruboid", family = "alv-von", wikidata_item = 1789745}

m["alv-yun"] = {canonicalName = "Yungur", aliases = {"Bena-Mboi"}, family = "alv-bam"}

m["apa"] = {canonicalName = "Apachean", aliases = {"Southern Athabaskan"}, family = "ath", wikidata_item = 27758}

m["aqa"] = {canonicalName = "Alacalufan", wikidata_item = 1288430}

m["aql"] = {canonicalName = "Algic", aliases = {"Algonquian-Ritwan", "Algonquian-Wiyot-Yurok"}, wikidata_item = 721612}

m["art"] = {canonicalName = "constructed", aliases = {"artificial", "planned"}, family = "qfa-not", wikidata_item = 33215}

m["ath"] = {canonicalName = "Athabaskan", family = "xnd", wikidata_item = 27475}

m["ath-nor"] = {canonicalName = "North Athabaskan", aliases = {"Northern Athabaskan"}, family = "ath"}

m["ath-pco"] = {canonicalName = "Pacific Coast Athabaskan", family = "ath", wikidata_item = 20654}

m["auf"] = {canonicalName = "Arauan", aliases = {"Arahuan", "Arauán", "Arawa", "Arawan", "Arawán"}, wikidata_item = 626772}

--[=[
	Exceptional language and family codes for Australian Aboriginal languages
	can use the prefix "aus-", though "aus" is no longer itself a family code.
]=] --
m["aus-arn"] = {canonicalName = "Arnhem", aliases = {"Gunwinyguan", "Macro-Gunwinyguan"}, wikidata_item = 2581700}

m["aus-bub"] = {canonicalName = "Bunuban", aliases = {"Bunaban"}, wikidata_item = 2495148}

m["aus-cww"] = {canonicalName = "Central New South Wales", family = "aus-pam", wikidata_item = 5061507}

m["aus-dal"] = {canonicalName = "Daly", wikidata_item = 2478079}

m["aus-dyb"] = {canonicalName = "Dyirbalic", family = "aus-pam", wikidata_item = 1850666}

m["aus-gar"] = {canonicalName = "Garawan", wikidata_item = 5521951}

m["aus-gun"] = {canonicalName = "Gunwinyguan", aliases = {"Gunwingguan"}, family = "aus-arn", wikidata_item = 2581700}

m["aus-jar"] = {canonicalName = "Jarrakan", wikidata_item = 2039423}

m["aus-kar"] = {canonicalName = "Karnic", family = "aus-pam", wikidata_item = 4215578}

m["aus-mir"] = {canonicalName = "Mirndi", wikidata_item = 4294095}

m["aus-nga"] = {canonicalName = "Ngayarda", family = "aus-psw", wikidata_item = 16153490}

m["aus-nyu"] = {canonicalName = "Nyulnyulan", wikidata_item = 2039408}

m["aus-pam"] = {canonicalName = "Pama-Nyungan", wikidata_item = 33942}

m["aus-pmn"] = {canonicalName = "Paman", family = "aus-pam", wikidata_item = 2640654}

m["aus-psw"] = {canonicalName = "Southwest Pama-Nyungan", family = "aus-pam", wikidata_item = 2258160}

m["aus-rnd"] = {canonicalName = "Arandic", family = "aus-pam", wikidata_item = 4784071}

m["aus-tnk"] = {canonicalName = "Tangkic", wikidata_item = 1823065}

m["aus-wdj"] = {canonicalName = "Iwaidjan", aliases = {"Yiwaidjan"}, wikidata_item = 4196968}

m["aus-wor"] = {canonicalName = "Worrorran", wikidata_item = 2038619}

m["aus-yid"] = {canonicalName = "Yidinyic", family = "aus-pam", wikidata_item = 4205849}

m["aus-yng"] = {canonicalName = "Yangmanic", wikidata_item = 42727644}

m["aus-yol"] = {canonicalName = "Yolngu", aliases = {"Yolŋu", "Yolngu Matha"}, family = "aus-pam", wikidata_item = 2511254}

m["aus-yuk"] = {canonicalName = "Yuin-Kuric", family = "aus-pam", wikidata_item = 3833021}

m["awd"] = {canonicalName = "Arawakan", aliases = {"Arawak", "Maipurean", "Maipuran"}, wikidata_item = 626753}

m["awd-nwk"] = {canonicalName = "Nawiki", aliases = {"Newiki"}, family = "awd"}

m["awd-taa"] = {canonicalName = "Ta-Arawakan", aliases = {"Ta-Arawak", "Ta-Maipurean"}, family = "awd", wikidata_item = 7672731}

m["azc"] = {canonicalName = "Uto-Aztecan", aliases = {"Uto-Aztekan"}, wikidata_item = 34073}

m["azc-cup"] = {canonicalName = "Cupan", family = "azc-tak", wikidata_item = 19866871}

m["azc-nah"] = {canonicalName = "Nahuan", aliases = {"Aztecan"}, family = "azc", wikidata_item = 11965602}

m["azc-num"] = {canonicalName = "Numic", family = "azc", wikidata_item = 2657541}

m["azc-tak"] = {canonicalName = "Takic", family = "azc", wikidata_item = 1280305}

m["azc-trc"] = {canonicalName = "Taracahitic", aliases = {"Taracahitan"}, family = "azc", wikidata_item = 4245032}

m["bad"] = {canonicalName = "Banda", family = "nic-ubg", wikidata_item = 806234}

m["bad-cnt"] = {canonicalName = "Central Banda", family = "bad", wikidata_item = 3438391}

m["bai"] = {canonicalName = "Bamileke", family = "nic-gre", wikidata_item = 806005}

m["bat"] = {canonicalName = "Baltic", family = "ine-bsl", wikidata_item = 33136}

m["ber"] = {canonicalName = "Berber", aliases = {"Tamazight"}, family = "afa", wikidata_item = 25448}

m["bnt"] = {canonicalName = "Bantu", family = "nic-bds", wikidata_item = 33146}

m["bnt-baf"] = {canonicalName = "Bafia", family = "bnt", wikidata_item = 799784}

m["bnt-bbo"] = {canonicalName = "Bafo-Bonkeng", family = "bnt-saw"}

m["bnt-bdz"] = {canonicalName = "Boma-Dzing", family = "bnt", wikidata_item = 1729203}

m["bnt-bek"] = {canonicalName = "Bekwilic", family = "bnt-ndb"}

m["bnt-bki"] = {canonicalName = "Bena-Kinga", family = "bnt-bne", wikidata_item = 16113307}

m["bnt-bmo"] = {canonicalName = "Bangi-Moi", family = "bnt-bnm"}

m["bnt-bne"] = {canonicalName = "Northeast Bantu", family = "bnt", wikidata_item = 7057832}

m["bnt-bnm"] = {canonicalName = "Bangi-Ntomba", family = "bnt-bte", wikidata_item = 806477}

m["bnt-boa"] = {canonicalName = "Boan", aliases = {"Buan", "Ababuan"}, family = "bnt", wikidata_item = 4931250}

m["bnt-bot"] = {canonicalName = "Botatwe", family = "bnt", wikidata_item = 4948532}

m["bnt-bsa"] = {canonicalName = "Basaa", family = "bnt", wikidata_item = 809739}

m["bnt-bsh"] = {canonicalName = "Bushoong", family = "bnt-bte", wikidata_item = 5001551}

m["bnt-bso"] = {canonicalName = "Southern Bantu", family = "bnt", wikidata_item = 980498}

m["bnt-bta"] = {canonicalName = "Bati-Angba", otherNames = {"Late Bomokandian"}, aliases = {"Bwa"}, family = "bnt-boa", wikidata_item = 4869303}

m["bnt-btb"] = {canonicalName = "Beti", family = "bnt", wikidata_item = 35118}

m["bnt-bte"] = {canonicalName = "Bangi-Tetela", family = "bnt", wikidata_item = 4855181}

m["bnt-bun"] = {canonicalName = "Buja-Ngombe", family = "bnt-mbb", wikidata_item = 4986733}

m["bnt-chg"] = {canonicalName = "Chaga", family = "bnt-cht", wikidata_item = 33016}

m["bnt-cht"] = {canonicalName = "Chaga-Taita", family = "bnt-bne"}

m["bnt-clu"] = {canonicalName = "Chokwe-Luchazi", family = "bnt", wikidata_item = 3339273}

m["bnt-com"] = {canonicalName = "Comorian", family = "bnt-sab", wikidata_item = 33077}

m["bnt-glb"] = {canonicalName = "Great Lakes Bantu", family = "bnt-bne", wikidata_item = 5599420}

m["bnt-haj"] = {canonicalName = "Haya-Jita", family = "bnt-glb", wikidata_item = 25502360}

m["bnt-kak"] = {canonicalName = "Kako", family = "bnt-pob"}

m["bnt-kav"] = {canonicalName = "Kavango", family = "bnt-ksb"}

m["bnt-kbi"] = {canonicalName = "Komo-Bira", family = "bnt-boa", wikidata_item = 6428591}

m["bnt-kel"] = {canonicalName = "Kele", aliases = {"Sheke"}, family = "bnt-kts", wikidata_item = 1738162}

m["bnt-kil"] = {canonicalName = "Kilombero", family = "bnt", wikidata_item = 6408121}

m["bnt-kka"] = {canonicalName = "Kikuyu-Kamba", aliases = {"Thagiicu"}, family = "bnt-bne", wikidata_item = 18419596}

m["bnt-kmb"] = {canonicalName = "Kimbundu", family = "bnt", wikidata_item = 16947687}

m["bnt-kng"] = {canonicalName = "Kongo", family = "bnt", wikidata_item = 6429214}

m["bnt-kpw"] = {canonicalName = "Kpwe", family = "bnt-saw"}

m["bnt-ksb"] = {canonicalName = "Kavango-Southwest Bantu", family = "bnt", wikidata_item = 6379098}

m["bnt-kts"] = {canonicalName = "Kele-Tsogo", family = "bnt", wikidata_item = 6385577}

m["bnt-lbn"] = {canonicalName = "Luban", family = "bnt", wikidata_item = 4536504}

m["bnt-leb"] = {canonicalName = "Lebonya", family = "bnt", wikidata_item = 6511395}

m["bnt-lgb"] = {canonicalName = "Lega-Binja", family = "bnt", wikidata_item = 6517694}

m["bnt-lok"] = {canonicalName = "Logooli-Kuria", family = "bnt-glb"}

m["bnt-lub"] = {canonicalName = "Luba", family = "bnt-lbn"}

m["bnt-lun"] = {canonicalName = "Lunda", family = "bnt", wikidata_item = 6704091}

m["bnt-mak"] = {canonicalName = "Makua", aliases = {"Makhuwa"}, family = "bnt-bso", wikidata_item = 6740431}

m["bnt-mbb"] = {canonicalName = "Mboshi-Buja", family = "bnt", wikidata_item = 6799764}

m["bnt-mbe"] = {canonicalName = "Mbole-Enya", family = "bnt", wikidata_item = 6799728}

m["bnt-mbi"] = {canonicalName = "Mbinga", family = "bnt-rur"}

m["bnt-mbo"] = {canonicalName = "Mboshi", family = "bnt-mbb", wikidata_item = 6799763}

m["bnt-mbt"] = {canonicalName = "Mbete", family = "bnt-tmb", wikidata_item = 1346910, aliases = {"Mbere"}}

m["bnt-mby"] = {canonicalName = "Mbeya", family = "bnt-ruk"}

m["bnt-mij"] = {canonicalName = "Mijikenda", family = "bnt-sab", wikidata_item = 6845474}

m["bnt-mka"] = {canonicalName = "Makaa", family = "bnt-ndb"}

m["bnt-mne"] = {canonicalName = "Manenguba", aliases = {"Mbo", "Ngoe"}, family = "bnt", wikidata_item = 31147471}

m["bnt-mnj"] = {canonicalName = "Makaa-Njem", family = "bnt-pob", wikidata_item = 1603899}

m["bnt-mon"] = {canonicalName = "Mongo", family = "bnt-bnm"}

m["bnt-mra"] = {canonicalName = "Mbugwe-Rangi", family = "bnt", wikidata_item = 6799795}

m["bnt-msl"] = {canonicalName = "Masaba-Luhya", family = "bnt-glb", wikidata_item = 12636428}

m["bnt-mwi"] = {canonicalName = "Mwika", family = "bnt-ruk"}

m["bnt-ncb"] = {canonicalName = "Northeast Coast Bantu", family = "bnt-bne", wikidata_item = 7057848}

m["bnt-ndb"] = {canonicalName = "Ndzem-Bomwali", family = "bnt-mnj"}

m["bnt-ngn"] = {canonicalName = "Ngondi-Ngiri", family = "bnt-mbb", wikidata_item = 7022532}

m["bnt-ngu"] = {canonicalName = "Nguni", aliases = {"Ngoni"}, family = "bnt-bso", wikidata_item = 961559}

m["bnt-nya"] = {canonicalName = "Nyali", family = "bnt-leb", wikidata_item = 7070832}

m["bnt-nyb"] = {canonicalName = "Nyanga-Buyi", family = "bnt", wikidata_item = 7070882}

m["bnt-nyg"] = {canonicalName = "Nyoro-Ganda", family = "bnt-glb", wikidata_item = 12638666}

m["bnt-nys"] = {canonicalName = "Nyasa", family = "bnt", wikidata_item = 7070921}

m["bnt-nze"] = {canonicalName = "Nzebi", family = "bnt-tmb", wikidata_item = 1755498, aliases = {"Njebi"}}

m["bnt-ova"] = {canonicalName = "Ovambo", aliases = {"Oshivambo", "Oshiwambo", "Owambo"}, family = "bnt-swb", wikidata_item = 36489}

m["bnt-par"] = {canonicalName = "Pare", family = "bnt-ncb"}

m["bnt-pen"] = {canonicalName = "Pende", family = "bnt", wikidata_item = 7162373}

m["bnt-pob"] = {canonicalName = "Pomo-Bomwali", family = "bnt"}

m["bnt-ruk"] = {canonicalName = "Rukwa", family = "bnt", wikidata_item = 7378902}

m["bnt-run"] = {canonicalName = "Rungwe", family = "bnt-ruk"}

m["bnt-rur"] = {canonicalName = "Rufiji-Ruvuma", family = "bnt", wikidata_item = 7377947}

m["bnt-ruv"] = {canonicalName = "Ruvu", family = "bnt-ncb"}

m["bnt-rvm"] = {canonicalName = "Ruvuma", family = "bnt-rur"}

m["bnt-sab"] = {canonicalName = "Sabaki", family = "bnt-ncb", wikidata_item = 2209395}

m["bnt-saw"] = {canonicalName = "Sawabantu", family = "bnt", wikidata_item = 532003}

m["bnt-sbi"] = {canonicalName = "Sabi", family = "bnt", wikidata_item = 7396071}

m["bnt-seu"] = {canonicalName = "Seuta", family = "bnt-ncb"}

m["bnt-shh"] = {canonicalName = "Shi-Havu", family = "bnt-glb"}

m["bnt-sho"] = {canonicalName = "Shona", family = "bnt", wikidata_item = 2904660}

m["bnt-sir"] = {canonicalName = "Sira", family = "bnt", wikidata_item = 1436372, aliases = {"Shira-Punu"}}

m["bnt-ske"] = {canonicalName = "Soko-Kele", family = "bnt-bte"}

m["bnt-sna"] = {canonicalName = "Sena", family = "bnt-nys"}

m["bnt-sts"] = {canonicalName = "Sotho-Tswana", family = "bnt-bso", wikidata_item = 2038386}

m["bnt-swb"] = {canonicalName = "Southwest Bantu", family = "bnt-ksb"}

m["bnt-swh"] = {canonicalName = "Swahili", family = "bnt-sab"}

m["bnt-tek"] = {canonicalName = "Teke", family = "bnt-tmb", wikidata_item = 36528}

m["bnt-tet"] = {canonicalName = "Tetela", family = "bnt-bte", wikidata_item = 7706059}

m["bnt-tkc"] = {canonicalName = "Central Teke", family = "bnt-tek"}

m["bnt-tkm"] = {canonicalName = "Takama", family = "bnt-bne"}

m["bnt-tmb"] = {canonicalName = "Teke-Mbede", family = "bnt", wikidata_item = 7695332, aliases = {"Teke-Mbere"}}

m["bnt-tso"] = {
    canonicalName = "Tsogo",
    otherNames = {"Okani"}, -- appears to be an alias in Glottolog
    family = "bnt-kts",
    wikidata_item = 2458420
}

m["bnt-tsr"] = {canonicalName = "Tswa-Ronga", family = "bnt-bso", wikidata_item = 12643962}

m["bnt-yak"] = {canonicalName = "Yaka", family = "bnt", wikidata_item = 8047027}

m["bnt-yko"] = {canonicalName = "Yasa-Kombe", family = "bnt-saw"}

m["bnt-zbi"] = {canonicalName = "Zamba-Binza", family = "bnt-bnm"}

m["btk"] = {canonicalName = "Batak", family = "poz-nws", wikidata_item = 1998595}

--[=[
	Exceptional language and family codes for Central American Indian languages
	may use the prefix "cai-", though "cai" is no longer itself a family code.
]=] --

--[=[
	Exceptional language and family codes for Caucasian languages can use
	the prefix "cau-", though "cau" is no longer itself a family code.
]=] --

m["cau-abz"] = {canonicalName = "Abkhaz-Abaza", otherNames = {"Abkhaz-Tapanta"}, aliases = {"Abazgi"}, family = "cau-nwc", wikidata_item = 4663617}

m["cau-ava"] = {canonicalName = "Avaro-Andian", otherNames = {"Andian"}, aliases = {"Avar-Andian", "Avar-Andi", "Avar-Andic"}, family = "cau-nec", wikidata_item = 4827766}

m["cau-cir"] = {canonicalName = "Circassian", aliases = {"Cherkess"}, family = "cau-nwc", wikidata_item = 858543}

m["cau-drg"] = {canonicalName = "Dargwa", otherNames = {"Dargin"}, family = "cau-nec", wikidata_item = 5222637}

m["cau-lzg"] = {canonicalName = "Lezghian", aliases = {"Lezgi", "Lezgian", "Lezgic"}, family = "cau-nec", wikidata_item = 2144370}

m["cau-nkh"] = {canonicalName = "Nakh", aliases = {"North-Central Caucasian"}, family = "cau-nec", wikidata_item = 24441}

m["cau-nec"] = {canonicalName = "Northeast Caucasian", aliases = {"Dagestanian", "Nakho-Dagestanian", "Caspian"}, family = "ccn", wikidata_item = 27387}

m["cau-nwc"] = {canonicalName = "Northwest Caucasian", aliases = {"Abkhazo-Adyghean", "Abkhaz-Adyghe", "Pontic"}, family = "ccn", wikidata_item = 33852}

m["cau-tsz"] = {canonicalName = "Tsezian", aliases = {"Tsezic", "Didoic"}, family = "cau-nec", wikidata_item = 1651530}

m["cau-vay"] = {canonicalName = "Vainakh", aliases = {"Veinakh", "Vaynakh"}, family = "cau-nkh", wikidata_item = 4102486}

m["cba"] = {
    canonicalName = "Chibchan",
    family = "qfa-mch", -- or none if Macro-Chibchan is considered undemonstrated
    wikidata_item = 520478
}

m["ccn"] = {canonicalName = "North Caucasian", wikidata_item = 33732}

m["ccs"] = {canonicalName = "Kartvelian", aliases = {"South Caucasian"}, wikidata_item = 34030}

m["ccs-gzn"] = {canonicalName = "Georgian-Zan", aliases = {"Karto-Zan"}, family = "ccs", wikidata_item = 34030}

m["ccs-zan"] = {canonicalName = "Zan", aliases = {"Zanuri", "Colchian"}, family = "ccs-gzn", wikidata_item = 2606912}

m["cdc"] = {canonicalName = "Chadic", family = "afa", wikidata_item = 33184}

m["cdc-cbm"] = {canonicalName = "Central Chadic", aliases = {"Biu-Mandara"}, family = "cdc", wikidata_item = 2251547}

m["cdc-est"] = {canonicalName = "East Chadic", family = "cdc", wikidata_item = 2276221}

m["cdc-mas"] = {canonicalName = "Masa", family = "cdc", wikidata_item = 2136092}

m["cdc-wst"] = {canonicalName = "West Chadic", family = "cdc", wikidata_item = 2447774}

m["cdd"] = {canonicalName = "Caddoan", wikidata_item = 1025090}

m["cel"] = {canonicalName = "Celtic", family = "ine", wikidata_item = 25293}

m["cel-bry"] = {canonicalName = "Brythonic", family = "cel", wikidata_item = 156877}

m["cel-gae"] = {canonicalName = "Goidelic", aliases = {"Gaelic"}, protoLanguage = "pgl", family = "cel", wikidata_item = 56433}

m["chi"] = {canonicalName = "Chimakuan", wikidata_item = 1073088}

m["cmc"] = {canonicalName = "Chamic", family = "poz-mcm", wikidata_item = 2997506}

m["crp"] = {canonicalName = "creole or pidgin", family = "qfa-not"}

m["csu"] = {canonicalName = "Central Sudanic", family = "ssa", wikidata_item = 190822}

m["csu-bba"] = {canonicalName = "Bongo-Bagirmi", family = "csu", wikidata_item = 3505042}

m["csu-bbk"] = {canonicalName = "Bongo-Baka", family = "csu-bba", wikidata_item = 4941917}

m["csu-bgr"] = {canonicalName = "Bagirmi", family = "csu-bba", wikidata_item = 4841948, aliases = {"Bagirmic"}}

m["csu-bkr"] = {canonicalName = "Birri-Kresh", family = "csu"}

m["csu-ecs"] = {canonicalName = "Eastern Central Sudanic", family = "csu", wikidata_item = 16911698, aliases = {"East Central Sudanic", "Central Sudanic East", "Lendu-Mangbetu"}}

m["csu-kab"] = {canonicalName = "Kaba", family = "csu-bba", wikidata_item = 6343715}

m["csu-lnd"] = {canonicalName = "Lendu", family = "csu-ecs", wikidata_item = 6522357, aliases = {"Lenduic"}}

m["csu-maa"] = {canonicalName = "Mangbetu", family = "csu-ecs", wikidata_item = 6748874, aliases = {"Mangbetu-Asoa", "Mangbetu-Asua"}}

m["csu-mle"] = {canonicalName = "Mangbutu-Lese", family = "csu-ecs", wikidata_item = 17009406, aliases = {"Mangbutu–Efe", "Mangbutu", "Membi-Mangbutu-Efe"}}

m["csu-mma"] = {canonicalName = "Moru-Madi", family = "csu-ecs", wikidata_item = 6915156}

m["csu-sar"] = {canonicalName = "Sara", family = "csu-bba", wikidata_item = 2036691}

m["csu-val"] = {canonicalName = "Vale", family = "csu-bba", wikidata_item = 7909520}

m["cus"] = {canonicalName = "Cushitic", family = "afa", wikidata_item = 33248}

m["day"] = {canonicalName = "Land Dayak", family = "poz-bop", wikidata_item = 2760613}

m["del"] = {canonicalName = "Lenape", aliases = {"Delaware"}, family = "alg-eas", wikidata_item = 2665761}

m["dmn"] = {canonicalName = "Mande", family = "nic", wikidata_item = 33681}

m["dmn-bbu"] = {canonicalName = "Bisa-Busa", family = "dmn-mde", wikidata_item = 12627956}

m["dmn-emn"] = {canonicalName = "East Manding", family = "dmn-man"}

m["dmn-jje"] = {canonicalName = "Jogo-Jeri", family = "dmn-mjo"}

m["dmn-man"] = {canonicalName = "Manding", family = "dmn-mmo", wikidata_item = 35772}

m["dmn-mda"] = {canonicalName = "Mano-Dan", family = "dmn-mse"}

m["dmn-mdc"] = {canonicalName = "Central Mande", family = "dmn-mdw", wikidata_item = 5972907}

m["dmn-mde"] = {canonicalName = "Eastern Mande", family = "dmn", wikidata_item = 12633080}

m["dmn-mdw"] = {canonicalName = "Western Mande", family = "dmn", wikidata_item = 16113831}

m["dmn-mjo"] = {canonicalName = "Manding-Jogo", family = "dmn-mdc", wikidata_item = 12636153}

m["dmn-mmo"] = {canonicalName = "Manding-Mokole", family = "dmn-mva"}

m["dmn-mnk"] = {canonicalName = "Maninka", family = "dmn-emn"}

m["dmn-mnw"] = {canonicalName = "Northwestern Mande", family = "dmn-mdw", wikidata_item = 5972910}

m["dmn-mok"] = {canonicalName = "Mokole", family = "dmn-mmo", wikidata_item = 16935447}

m["dmn-mse"] = {canonicalName = "Southeastern Mande", family = "dmn-mde", wikidata_item = 5972912}

m["dmn-msw"] = {canonicalName = "Southwestern Mande", family = "dmn-mdw", wikidata_item = 12633904}

m["dmn-mva"] = {canonicalName = "Manding-Vai", family = "dmn-mjo"}

m["dmn-nbe"] = {canonicalName = "Nwa-Beng", family = "dmn-mse"}

m["dmn-sam"] = {canonicalName = "Samo", family = "dmn-bbu", aliases = {"Samuic"}, wikidata_item = 36327}

m["dmn-smg"] = {canonicalName = "Samogo", family = "dmn-mnw", wikidata_item = 7410000, aliases = {"Duun-Seenku"}}

m["dmn-snb"] = {canonicalName = "Soninke-Bobo", family = "dmn-mnw", wikidata_item = 16111680}

m["dmn-sya"] = {canonicalName = "Susu-Yalunka", family = "dmn-mdc"}

m["dmn-vak"] = {canonicalName = "Vai-Kono", family = "dmn-mva"}

m["dmn-wmn"] = {canonicalName = "West Manding", family = "dmn-man"}

m["dra"] = {canonicalName = "Dravidian", wikidata_item = 33311}

m["egx"] = {canonicalName = "Egyptian", protoLanguage = "egy", family = "afa", wikidata_item = 50868}

m["esx"] = {canonicalName = "Eskimo-Aleut", wikidata_item = 25946}

m["esx-esk"] = {canonicalName = "Eskimo", family = "esx", wikidata_item = 25946}

m["esx-inu"] = {canonicalName = "Inuit", family = "esx-esk", wikidata_item = 27796}

m["euq"] = {canonicalName = "Vasconic", wikidata_item = 4669240}

m["fiu-fin"] = {canonicalName = "Finnic", family = "urj", wikidata_item = 33328}

m["gem"] = {canonicalName = "Germanic", family = "ine", wikidata_item = 21200}

m["gme"] = {canonicalName = "East Germanic", family = "gem", wikidata_item = 108662}

m["gmq"] = {canonicalName = "North Germanic", family = "gem", wikidata_item = 106085}

m["gmw"] = {canonicalName = "West Germanic", family = "gem", wikidata_item = 26721}

m["gmw-fri"] = {canonicalName = "Frisian", protoLanguage = "ofs", family = "gmw", wikidata_item = 25325}

m["grk"] = {canonicalName = "Hellenic", aliases = {"Greek"}, family = "ine", wikidata_item = 2042538}

m["him"] = {canonicalName = "Western Pahari", aliases = {"Himachali"}, family = "inc-pah", wikidata_item = 12645574}

m["hmn"] = {canonicalName = "Hmong", family = "hmx", wikidata_item = 3307894}

m["hmx"] = {canonicalName = "Hmong-Mien", aliases = {"Miao-Yao"}, wikidata_item = 33322}

m["hmx-mie"] = {canonicalName = "Mien", family = "hmx", wikidata_item = 7992695}

m["hok"] = {canonicalName = "Hokan", wikidata_item = 33406}

m["hyx"] = {canonicalName = "Armenian", family = "ine", wikidata_item = 8785}

m["iir"] = {canonicalName = "Indo-Iranian", family = "ine", wikidata_item = 33514}

m["iir-nur"] = {canonicalName = "Nuristani", family = "iir", wikidata_item = 161804}

m["nur-nor"] = {canonicalName = "Northern Nuristani", family = "iir-nur"}

m["nur-sou"] = {canonicalName = "Southern Nuristani", family = "iir-nur"}

m["ijo"] = {
    canonicalName = "Ijoid",
    otherNames = {"Ijaw"}, -- Ijaw may be a subfamily
    family = "nic",
    wikidata_item = 1325759
}

m["inc"] = {canonicalName = "Indo-Aryan", aliases = {"Indic"}, family = "iir", wikidata_item = 33577}

m["inc-bhi"] = {canonicalName = "Bhil", family = "inc-cen", wikidata_item = 4901727}

m["inc-cen"] = {canonicalName = "Central Indo-Aryan", family = "inc-psu", wikidata_item = 10979187, protoLanguage = "inc-cen-pro"}

m["inc-dar"] = {canonicalName = "Dardic", family = "inc-old", wikidata_item = 161101}

m["inc-eas"] = {canonicalName = "Eastern Indo-Aryan", family = "inc", wikidata_item = 16590069, protoLanguage = "inc-mgd"}

m["inc-hie"] = {canonicalName = "Eastern Hindi", aliases = {"Purabiyā"}, family = "inc", wikidata_item = 4126648, protoLanguage = "inc-pka"}

m["inc-hiw"] = {canonicalName = "Western Hindi", family = "inc-cen", wikidata_item = 12600937, protoLanguage = "inc-sap"}

m["inc-hnd"] = {canonicalName = "Hindustani", aliases = {"Hindi-Urdu"}, family = "inc-hiw", wikidata_item = 11051}

m["inc-ins"] = {canonicalName = "Insular Indo-Aryan", family = "inc", protoLanguage = "elu-prk"}

m["inc-mid"] = {canonicalName = "Middle Indo-Aryan", aliases = {"Middle Indic"}, family = "inc", wikidata_item = 3236316}

m["inc-nwe"] = {canonicalName = "Northwestern Indo-Aryan", family = "inc-psu", wikidata_item = 41355020, protoLanguage = "inc-psc"}

m["inc-nor"] = {canonicalName = "Northern Indo-Aryan", family = "inc", wikidata_item = 12642170, protoLanguage = "inc-kha"}

m["inc-old"] = {canonicalName = "Old Indo-Aryan", aliases = {"Old Indic"}, family = "inc", protoLanguage = "sa"}

m["inc-pah"] = {canonicalName = "Pahari", aliases = {"Pahadi"}, family = "inc-nor", wikidata_item = 946077}

m["inc-pan"] = {canonicalName = "Punjabi-Lahnda", family = "inc-nwe", protoLanguage = "inc-tak"}

m["inc-psu"] = {canonicalName = "Sauraseni Prakrit", aliases = {"Sauraseni", "Shauraseni"}, family = "pra"}

m["inc-rom"] = {canonicalName = "Romani", aliases = {"Romany", "Gypsy", "Gipsy"}, protoLanguage = "rom", family = "inc-psu", wikidata_item = 13201}

m["inc-snd"] = {canonicalName = "Sindhi", family = "inc-nwe", wikidata_item = 7522212, protoLanguage = "inc-vra"}

m["inc-sou"] = {canonicalName = "Southern Indo-Aryan", family = "inc", wikidata_item = 12179304, protoLanguage = "pmh"}

m["inc-wes"] = {canonicalName = "Western Indo-Aryan", family = "inc-psu", protoLanguage = "inc-gup"}

m["ine"] = {canonicalName = "Indo-European", aliases = {"Indo-Germanic"}, wikidata_item = 19860}

m["ine-ana"] = {canonicalName = "Anatolian", family = "ine", wikidata_item = 147085}

m["ine-bsl"] = {canonicalName = "Balto-Slavic", family = "ine", wikidata_item = 147356}

m["ine-toc"] = {canonicalName = "Tocharian", aliases = {"Tokharian"}, family = "ine", wikidata_item = 37029}

m["ira"] = {canonicalName = "Iranian", family = "iir", wikidata_item = 33527}

m["ira-csp"] = {canonicalName = "Caspian", family = "ira-mpr"}

m["ira-cen"] = {canonicalName = "Central Iranian", family = "ira"}

m["xme"] = {canonicalName = "Median", family = "ira-mpr", protoLanguage = "xme-old"}

m["ira-mny"] = {canonicalName = "Munji-Yidgha", aliases = {"Yidgha-Munji"}, family = "ira-sym"}

m["ira-msh"] = {canonicalName = "Mazanderani-Shahmirzadi", family = "ira-csp"}

m["ira-nei"] = {canonicalName = "Northeastern Iranian", family = "ira"}

m["ira-nwi"] = {canonicalName = "Northwestern Iranian", family = "ira-wes"}

m["ira-orp"] = {canonicalName = "Ormuri-Parachi", family = "ira-sei"}

m["ira-pat"] = {canonicalName = "Pathan", family = "ira-sei", protoLanguage = "ira-pat-pro"}

m["ira-sbc"] = {canonicalName = "Sogdo-Bactrian", family = "ira-nei"}

m["xsc"] = {canonicalName = "Scythian", family = "ira-nei"}

m["xsc-skw"] = {canonicalName = "Saka-Wakhi", family = "xsc"}

m["xsc-sak"] = {canonicalName = "Sakan", aliases = {"Saka"}, family = "xsc-skw"}

m["ira-mpr"] = {canonicalName = "Medo-Parthian", aliases = {"Partho-Median"}, family = "ira-nwi"}

m["ira-kms"] = {canonicalName = "Komisenian", aliases = {"Semnani"}, family = "ira-mpr"}

m["ira-sgi"] = {canonicalName = "Sanglechi-Ishkashimi", family = "ira-sei"}

m["ira-shy"] = {canonicalName = "Shughni-Yazghulami", family = "ira-sym"}

m["ira-sgc"] = {canonicalName = "Sogdic", aliases = {"Sogdian"}, family = "ira-sbc"}

m["ira-sei"] = {canonicalName = "Southeastern Iranian", family = "ira"}

m["ira-swi"] = {canonicalName = "Southwestern Iranian", family = "ira-wes"}

m["ira-sym"] = {canonicalName = "Shughni-Yazghulami-Munji", family = "ira-sei"}

m["xme-ttc"] = {canonicalName = "Tatic", family = "xme", protoLanguage = "xme-ttc-pro"}

m["ira-wes"] = {canonicalName = "Western Iranian", family = "ira", wikidata_item = 129850}

m["ira-zgr"] = {canonicalName = "Zaza-Gorani", aliases = {"Zaza-Gurani", "Gorani-Zaza"}, family = "ira-mpr"}

m["iro"] = {canonicalName = "Iroquoian", wikidata_item = 33623}

m["itc"] = {canonicalName = "Italic", family = "ine", wikidata_item = 131848}

m["jpx"] = {canonicalName = "Japonic", aliases = {"Japanese", "Japanese-Ryukyuan"}, wikidata_item = 33612}

m["jpx-ryu"] = {canonicalName = "Ryukyuan", family = "jpx", wikidata_item = 56393}

m["kar"] = {canonicalName = "Karen", family = "sit", wikidata_item = 1364815}

--[=[
	Exceptional language and family codes for Khoisan and Kordofanian languages can use
	the prefix "khi-" and "kdo-" respectively, though they are no longer family codes themselves.
]=] --

m["khi-kal"] = {canonicalName = "Kalahari Khoe", family = "khi-kho"}

m["khi-khk"] = {canonicalName = "Khoekhoe", family = "khi-kho"}

m["khi-kkw"] = {canonicalName = "Khoe-Kwadi", aliases = {"Kwadi-Khoe"}, wikidata_item = 3833005}

m["khi-kho"] = {canonicalName = "Khoe", aliases = {"Central Khoisan"}, family = "khi-kkw", wikidata_item = 2736449}

m["khi-kxa"] = {canonicalName = "Kx'a", aliases = {"Kxa", "Ju-ǂHoan"}, wikidata_item = 6450587}

m["khi-tuu"] = {canonicalName = "Tuu", aliases = {"Kwi", "Taa-Kwi", "Southern Khoisan", "Taa-ǃKwi", "Taa-ǃUi", "ǃUi-Taa"}, wikidata_item = 631046}

m["kro"] = {canonicalName = "Kru", family = "nic-vco", wikidata_item = 33535}

m["kro-aiz"] = {canonicalName = "Aizi", family = "kro", wikidata_item = 4699431}

m["kro-bet"] = {canonicalName = "Bété", family = "kro-ekr", wikidata_item = 32956}

m["kro-did"] = {canonicalName = "Dida", family = "kro-ekr", wikidata_item = 32685}

m["kro-ekr"] = {canonicalName = "Eastern Kru", family = "kro", wikidata_item = 5972899}

m["kro-grb"] = {canonicalName = "Grebo", family = "kro-wkr", wikidata_item = 5601537}

m["kro-wee"] = {canonicalName = "Wee", family = "kro-wkr"}

m["kro-wkr"] = {canonicalName = "Western Kru", family = "kro", wikidata_item = 5972897}

m["ku"] = {canonicalName = "Kurdish", family = "ira-nwi", protoLanguage = "ku-pro", wikidata_item = 36368}

m["map"] = {canonicalName = "Austronesian", wikidata_item = 49228}

m["map-ata"] = {canonicalName = "Atayalic", family = "map", wikidata_item = 716610}

m["mkh"] = {canonicalName = "Mon-Khmer", family = "aav", wikidata_item = 33199}

m["mkh-asl"] = {canonicalName = "Aslian", family = "mkh", wikidata_item = 3111082}

m["mkh-ban"] = {canonicalName = "Bahnaric", family = "mkh", wikidata_item = 56309}

m["mkh-kat"] = {canonicalName = "Katuic", family = "mkh", wikidata_item = 56697}

m["mkh-khm"] = {canonicalName = "Khmuic", family = "mkh", wikidata_item = 1323245}

m["mkh-kmr"] = {canonicalName = "Khmeric", family = "mkh"}

m["mkh-mnc"] = {canonicalName = "Monic", family = "mkh", wikidata_item = 3217497}

m["mkh-mng"] = {canonicalName = "Mangic", family = "mkh", wikidata_item = 3509556}

m["mkh-nbn"] = {canonicalName = "North Bahnaric", family = "mkh-ban", wikidata_item = 56309}

m["mkh-pal"] = {canonicalName = "Palaungic", family = "mkh", wikidata_item = 2391173}

m["mkh-pea"] = {canonicalName = "Pearic", family = "mkh", wikidata_item = 3073022}

m["mkh-pkn"] = {canonicalName = "Pakanic", family = "mkh-mng"}

m["mkh-vie"] = {canonicalName = "Vietic", family = "mkh", wikidata_item = 2355546}

m["mno"] = {canonicalName = "Manobo", family = "phi", wikidata_item = 3217483}

m["mun"] = {canonicalName = "Munda", family = "aav", wikidata_item = 33892}

m["myn"] = {canonicalName = "Mayan", wikidata_item = 33738}

--[=[
	Exceptional language and family codes for North American Indian languages
	can use the prefix "nai-", though "nai" is no longer itself a family code.
]=] --
m["nai-cat"] = {canonicalName = "Catawban", family = "nai-sca", wikidata_item = 3446638}

m["nai-chu"] = {canonicalName = "Chumashan", wikidata_item = 1288420}

m["nai-ckn"] = {canonicalName = "Chinookan", wikidata_item = 610586}

m["nai-coo"] = {canonicalName = "Coosan", wikidata_item = 940278}

m["nai-ker"] = {canonicalName = "Keresan", wikidata_item = 35878}

m["nai-klp"] = {canonicalName = "Kalapuyan", wikidata_item = 1569040}

m["nai-kta"] = {canonicalName = "Kiowa-Tanoan", wikidata_item = 386288}

m["nai-len"] = {canonicalName = "Lencan", aliases = {"Lenca"}, wikidata_item = 36189}

m["nai-mdu"] = {canonicalName = "Maiduan", wikidata_item = 33502}

m["nai-miz"] = {canonicalName = "Mixe-Zoquean", aliases = {"Mixe-Zoque"}, wikidata_item = 954016}

m["nai-min"] = {canonicalName = "Misumalpan", aliases = {"Misuluan", "Misumalpa"}, family = "qfa-mch", wikidata_item = 281693}

m["nai-mus"] = {canonicalName = "Muskogean", aliases = {"Muskhogean"}, wikidata_item = 902978}

m["nai-pak"] = {canonicalName = "Pakawan", family = "hok", wikidata_item = 65085487}

m["nai-pal"] = {canonicalName = "Palaihnihan", wikidata_item = 1288332}

m["nai-plp"] = {canonicalName = "Plateau Penutian", wikidata_item = 2307476}

m["nai-pom"] = {canonicalName = "Pomoan", aliases = {"Pomo", "Kulanapan"}, family = "hok", wikidata_item = 2618420}

m["nai-sca"] = {canonicalName = "Siouan-Catawban", wikidata_item = 34181}

m["nai-shp"] = {canonicalName = "Sahaptian", wikidata_item = 114782, family = "nai-plp"}

m["nai-shs"] = {canonicalName = "Shastan", family = "hok", wikidata_item = 2991735}

m["nai-tot"] = {canonicalName = "Totozoquean", wikidata_item = 7828419}

m["nai-ttn"] = {canonicalName = "Totonacan", aliases = {"Totonac-Tepehua", "Totonacan-Tepehuan"}, varieties = {"Totonac"}, wikidata_item = 34039}

m["nai-tqn"] = {canonicalName = "Tequistlatecan", aliases = {"Tequistlatec", "Chontal", "Chontalan", "Oaxacan Chontal", "Chontal of Oaxaca"}, family = "hok", wikidata_item = 1754988}

m["nai-tsi"] = {canonicalName = "Tsimshianic", wikidata_item = 34134}

m["nai-utn"] = {canonicalName = "Utian", aliases = {"Miwok-Costanoan", "Mutsun"}, family = "nai-you", wikidata_item = 13371763}

m["nai-wtq"] = {canonicalName = "Wintuan", aliases = {"Wintun"}, wikidata_item = 1294259}

m["nai-xin"] = {canonicalName = "Xincan", aliases = {"Xinca"}, wikidata_item = 1546494}

m["nai-yok"] = {canonicalName = "Yokutsan", aliases = {"Yokuts", "Mariposan", "Mariposa"}, family = "nai-you", wikidata_item = 34249}

m["nai-you"] = {canonicalName = "Yok-Utian", wikidata_item = 2886186}

m["nai-yuc"] = {canonicalName = "Yuman-Cochimí", wikidata_item = 579137}

m["ngf"] = {canonicalName = "Trans-New Guinea", wikidata_item = 34018}

m["ngf-fin"] = {canonicalName = "Finisterre", family = "ngf", wikidata_item = 5450373}

m["ngf-mad"] = {canonicalName = "Madang", family = "ngf", wikidata_item = 11217556}

m["ngf-okk"] = {canonicalName = "Ok", family = "ngf", wikidata_item = 7081687}

m["ngf-sbh"] = {canonicalName = "South Bird's Head", family = "ngf", wikidata_item = 7566330}

m["nic"] = {canonicalName = "Niger-Congo", aliases = {"Niger-Kordofanian"}, wikidata_item = 33838}

m["nic-alu"] = {canonicalName = "Alumic", family = "nic-plt", wikidata_item = 4737355}

m["nic-bas"] = {canonicalName = "Basa", family = "nic-knj", wikidata_item = 4866154}

m["nic-bbe"] = {canonicalName = "Eastern Beboid", family = "nic-beb"}

m["nic-bco"] = {canonicalName = "Benue-Congo", family = "nic-vco", wikidata_item = 33253}

m["nic-bcr"] = {canonicalName = "Bantoid-Cross", family = "nic-bco", wikidata_item = 806983}

m["nic-bdn"] = {canonicalName = "Northern Bantoid", aliases = {"North Bantoid"}, family = "nic-bod"}

m["nic-bds"] = {canonicalName = "Southern Bantoid", aliases = {"Wide Bantu", "Bin"}, family = "nic-bod", wikidata_item = 3183152}

m["nic-beb"] = {canonicalName = "Beboid", family = "nic-bds", wikidata_item = 813549}

m["nic-ben"] = {canonicalName = "Bendi", family = "nic-bcr", wikidata_item = 4887065}

m["nic-beo"] = {canonicalName = "Beromic", family = "nic-plt", wikidata_item = 4894642}

m["nic-bod"] = {canonicalName = "Bantoid", family = "nic-bcr", wikidata_item = 806992}

m["nic-buk"] = {canonicalName = "Buli-Koma", family = "nic-ovo"}

m["nic-bwa"] = {canonicalName = "Bwa", otherNames = {"Bwamu", "Bomu"}, family = "nic-gur", wikidata_item = 12628562}

m["nic-cde"] = {canonicalName = "Central Delta", family = "nic-cri", wikidata_item = 3813191}

m["nic-cri"] = {canonicalName = "Cross River", family = "nic-bcr", wikidata_item = 1141096}

m["nic-dag"] = {canonicalName = "Dagbani", family = "nic-wov"}

m["nic-dak"] = {canonicalName = "Dakoid", family = "nic-bdn", wikidata_item = 1157745}

m["nic-dge"] = {canonicalName = "Escarpment Dogon", family = "qfa-dgn", wikidata_item = 5397128}

m["nic-dgw"] = {canonicalName = "West Dogon", family = "qfa-dgn"}

m["nic-eko"] = {canonicalName = "Ekoid", family = "nic-bds", wikidata_item = 1323395}

m["nic-eov"] = {canonicalName = "Eastern Oti-Volta", family = "nic-ovo", aliases = {"Samba"}}

m["nic-fru"] = {canonicalName = "Furu", family = "nic-bds", wikidata_item = 5509783}

m["nic-gne"] = {canonicalName = "Eastern Gurunsi", aliases = {"Eastern Grũsi"}, family = "nic-gns", wikidata_item = 12633072}

m["nic-gnn"] = {canonicalName = "Northern Gurunsi", aliases = {"Northern Grũsi"}, family = "nic-gns"}

m["nic-gnw"] = {canonicalName = "Western Gurunsi", aliases = {"Western Grũsi"}, family = "nic-gns"}

m["nic-gns"] = {canonicalName = "Gurunsi", aliases = {"Grũsi"}, family = "nic-gur", wikidata_item = 721007}

m["nic-gre"] = {canonicalName = "Eastern Grassfields", family = "nic-grf", wikidata_item = 5330160}

m["nic-grf"] = {canonicalName = "Grassfields", aliases = {"Grassfields Bantu", "Wide Grassfields"}, family = "nic-bds", wikidata_item = 750932}

m["nic-grm"] = {canonicalName = "Gurma", family = "nic-ovo", wikidata_item = 30587833}

m["nic-grs"] = {canonicalName = "Southwest Grassfields", family = "nic-grf", wikidata_item = 7571285}

m["nic-gur"] = {canonicalName = "Gur", aliases = {"Voltaic"}, family = "alv-sav", wikidata_item = 33536}

m["nic-ief"] = {canonicalName = "Ibibio-Efik", family = "nic-lcr", wikidata_item = 2743643}

m["nic-jer"] = {canonicalName = "Jera", family = "nic-kne"}

m["nic-jkn"] = {canonicalName = "Jukunoid", family = "nic-pla", wikidata_item = 1711622}

m["nic-jrn"] = {canonicalName = "Jarawan", family = "nic-mba", wikidata_item = 1683430}

m["nic-jrw"] = {canonicalName = "Jarawa", family = "nic-jrn", wikidata_item = 35423}

m["nic-kam"] = {canonicalName = "Kambari", family = "nic-knj", wikidata_item = 6356294}

m["nic-ktl"] = {canonicalName = "Katloid", family = "nic"}

m["nic-kau"] = {canonicalName = "Kauru", family = "nic-kne"}

m["nic-kmk"] = {canonicalName = "Kamuku", family = "nic-knj", wikidata_item = 6359821}

m["nic-kne"] = {canonicalName = "East Kainji", family = "nic-knj", wikidata_item = 5328687}

m["nic-knj"] = {canonicalName = "Kainji", family = "nic-pla", wikidata_item = 681495}

m["nic-knn"] = {canonicalName = "Northwest Kainji", family = "nic-knj", wikidata_item = 7060098}

m["nic-ktl"] = {canonicalName = "Katloid", aliases = {"Katla", "Katla-Tima"}, family = "nic", wikidata_item = 6377681}

m["nic-lcr"] = {canonicalName = "Lower Cross River", family = "nic-cri", wikidata_item = 3813193}

m["nic-mam"] = {canonicalName = "Mamfe", aliases = {"Nyang"}, family = "nic-bds", wikidata_item = 2005898}

m["nic-mba"] = {canonicalName = "Mbam", family = "nic-bds", wikidata_item = 687826}

m["nic-mbc"] = {canonicalName = "Mba", family = "nic-ubg", wikidata_item = 6799561}

m["nic-mbw"] = {canonicalName = "West Mbam", family = "nic-mba"}

m["nic-mmb"] = {
    canonicalName = "Mambiloid",
    otherNames = {"North Bantoid"}, -- per Wikipedia, North Bantoid is the parent family
    family = "nic-bdn",
    wikidata_item = 1888151
}

m["nic-mom"] = {canonicalName = "Momo", family = "nic-grf", wikidata_item = 6897393}

m["nic-mre"] = {canonicalName = "Moré", family = "nic-wov"}

m["nic-ngd"] = {canonicalName = "Ngbandi", family = "nic-ubg", wikidata_item = 36439}

m["nic-nge"] = {canonicalName = "Ngemba", family = "nic-gre", wikidata_item = 7022271}

m["nic-ngk"] = {canonicalName = "Ngbaka", family = "nic-ubg", wikidata_item = 3217499}

m["nic-nin"] = {canonicalName = "Ninzic", family = "nic-plt", wikidata_item = 7039282}

m["nic-nka"] = {canonicalName = "Nkambe", family = "nic-gre", wikidata_item = 7042520}

m["nic-nkb"] = {canonicalName = "Baka", family = "nic-nkw"}

m["nic-nke"] = {canonicalName = "Eastern Ngbaka", family = "nic-ngk"}

m["nic-nkg"] = {canonicalName = "Gbanziri", family = "nic-nkw"}

m["nic-nkk"] = {canonicalName = "Kpala", family = "nic-nkw"}

m["nic-nkm"] = {canonicalName = "Mbaka", family = "nic-nkw"}

m["nic-nkw"] = {canonicalName = "Western Ngbaka", family = "nic-ngk"}

m["nic-npd"] = {canonicalName = "North Plateau Dogon", family = "qfa-dgn"}

m["nic-nun"] = {canonicalName = "Nun", family = "nic-gre", wikidata_item = 13654297}

m["nic-nwa"] = {canonicalName = "Nanga-Walo", family = "qfa-dgn"}

m["nic-ogo"] = {canonicalName = "Ogoni", aliases = {"Ogonoid"}, family = "nic-cri", wikidata_item = 2350726}

m["nic-ovo"] = {canonicalName = "Oti-Volta", family = "nic-gur", wikidata_item = 1157178}

m["nic-pla"] = {canonicalName = "Platoid", aliases = {"Central Nigerian"}, family = "nic-bco", wikidata_item = 453244}

m["nic-plc"] = {canonicalName = "Central Plateau", family = "nic-plt", wikidata_item = 5061668}

m["nic-pld"] = {canonicalName = "Plains Dogon", family = "qfa-dgn"}

m["nic-ple"] = {canonicalName = "East Plateau", family = "nic-plt", wikidata_item = 5329154}

m["nic-pls"] = {canonicalName = "South Plateau", aliases = {"Jilic-Eggonic"}, family = "nic-plt", wikidata_item = 7568236}

m["nic-plt"] = {canonicalName = "Plateau", family = "nic-pla", wikidata_item = 1267471}

m["nic-ras"] = {canonicalName = "Rashad", family = "nic", wikidata_item = 3401986}

m["nic-rnc"] = {canonicalName = "Central Ring", family = "nic-rng"}

m["nic-rng"] = {canonicalName = "Ring", aliases = {"Ring Road"}, family = "nic-grf", wikidata_item = 2269051}

m["nic-rnn"] = {canonicalName = "Northern Ring", family = "nic-rng"}

m["nic-rnw"] = {canonicalName = "Western Ring", family = "nic-rng"}

m["nic-ser"] = {canonicalName = "Sere", family = "nic-ubg", wikidata_item = 7453058}

m["nic-shi"] = {canonicalName = "Shiroro", aliases = {"Pongu"}, family = "nic-knj", wikidata_item = 7498953}

m["nic-sis"] = {canonicalName = "Sisaala", family = "nic-gnw", wikidata_item = 36532}

m["nic-tar"] = {canonicalName = "Tarokoid", family = "nic-plt", wikidata_item = 2394472}

m["nic-tiv"] = {canonicalName = "Tivoid", family = "nic-bds", wikidata_item = 752377}

m["nic-tvc"] = {canonicalName = "Central Tivoid", family = "nic-tiv"}

m["nic-tvn"] = {canonicalName = "Northern Tivoid", family = "nic-tiv"}

m["nic-ubg"] = {
    canonicalName = "Ubangian",
    family = "nic-vco", -- or none
    wikidata_item = 33932
}

m["nic-uce"] = {canonicalName = "East-West Upper Cross River", family = "nic-ucr"}

m["nic-ucn"] = {canonicalName = "North-South Upper Cross River", family = "nic-ucr"}

m["nic-ucr"] = {canonicalName = "Upper Cross River", aliases = {"Upper Cross"}, family = "nic-cri", wikidata_item = 4108624}

m["nic-vco"] = {canonicalName = "Volta-Congo", family = "alv", wikidata_item = 37228}

m["nic-wov"] = {canonicalName = "Western Oti-Volta", family = "nic-ovo", aliases = {"Moré-Dagbani"}}

m["nic-ykb"] = {canonicalName = "Yukubenic", aliases = {"Oohum"}, family = "nic-plt", wikidata_item = 16909196}

m["nic-ymb"] = {canonicalName = "Yambasa", family = "nic-mba"}

m["nic-yon"] = {canonicalName = "Yom-Nawdm", family = "nic-ovo", aliases = {"Moré-Dagbani"}}

m["nub"] = {canonicalName = "Nubian", family = "sdv-nes", wikidata_item = 1517194}

m["nub-hil"] = {canonicalName = "Hill Nubian", family = "nub", wikidata_item = 5762211, aliases = {"Kordofan Nubian"}}

m["omq"] = {canonicalName = "Oto-Manguean", wikidata_item = 33669}

m["omq-cha"] = {canonicalName = "Chatino", family = "omq-zap", wikidata_item = 35111}

m["omq-chi"] = {canonicalName = "Chinantecan", family = "omq", wikidata_item = 35828}

m["omq-cui"] = {canonicalName = "Cuicatec", family = "omq-mix", wikidata_item = 616024}

m["omq-maz"] = {canonicalName = "Mazatecan", aliases = {"Mazatec"}, family = "omq", wikidata_item = 36230}

m["omq-mix"] = {canonicalName = "Mixtecan", family = "omq", wikidata_item = 21996392}

m["omq-mxt"] = {canonicalName = "Mixtec", family = "omq-mix", wikidata_item = 36363}

m["omq-otp"] = {canonicalName = "Oto-Pamean", family = "omq"}

m["omq-pop"] = {canonicalName = "Popolocan", family = "omq", wikidata_item = 5132273}

m["omq-tri"] = {canonicalName = "Trique", aliases = {"Triqui"}, family = "omq-mix", wikidata_item = 780200}

m["omq-zap"] = {canonicalName = "Zapotecan", family = "omq", wikidata_item = 8066463}

m["omq-zpc"] = {canonicalName = "Zapotec", family = "omq-zap", wikidata_item = 13214}

m["omv"] = {canonicalName = "Omotic", family = "afa", wikidata_item = 33860}

m["omv-aro"] = {canonicalName = "Aroid", family = "omv", wikidata_item = 3699526, aliases = {"Ari-Banna", "South Omotic", "Somotic"}}

m["omv-diz"] = {canonicalName = "Dizoid", family = "omv", wikidata_item = 430251, aliases = {"Maji", "Majoid"}}

m["omv-eom"] = {canonicalName = "East Ometo", family = "omv-ome", wikidata_item = 20527288}

m["omv-gon"] = {canonicalName = "Gonga", family = "omv", wikidata_item = 4143043, aliases = {"Kefoid"}}

m["omv-mao"] = {canonicalName = "Mao", family = "omv", wikidata_item = 1351495}

m["omv-nom"] = {canonicalName = "North Ometo", family = "omv-ome"}

m["omv-ome"] = {canonicalName = "Ometo", family = "omv", wikidata_item = 36310}

m["oto"] = {canonicalName = "Otomian", family = "omq", wikidata_item = 1270220}

m["oto-otm"] = {canonicalName = "Otomi", family = "oto"}

m["paa"] = {canonicalName = "Papuan", family = "qfa-not", wikidata_item = 236425}

m["paa-arf"] = {canonicalName = "Arafundi", wikidata_item = 4783702}

m["paa-asa"] = {canonicalName = "Arai-Samaia", wikidata_item = 48803569}

m["paa-bng"] = {canonicalName = "Baining", wikidata_item = 748487, aliases = {"East New Britain"}}

m["paa-brd"] = {canonicalName = "Border", wikidata_item = 1752158, aliases = {"Upper Tami"}}

m["paa-egb"] = {canonicalName = "East Geelvink Bay", wikidata_item = 1497678, aliases = {"East Cenderawasih"}}

m["paa-eng"] = {canonicalName = "Engan", wikidata_item = 3217449}

m["paa-iwm"] = {canonicalName = "Iwam", wikidata_item = 15147853}

m["paa-kag"] = { -- recode as ngf-kag?
    canonicalName = "Kainantu-Goroka",
    family = "ngf",
    wikidata_item = 3217463
}

m["paa-kiw"] = {canonicalName = "Kiwaian", wikidata_item = 338449}

m["paa-kut"] = {canonicalName = "Kutubuan", family = "paa-pag", wikidata_item = 48767893}

m["paa-kwm"] = {canonicalName = "Kwomtari", wikidata_item = 2075415}

m["paa-lkp"] = {canonicalName = "Lakes Plain", wikidata_item = 6478969}

m["paa-lsp"] = {canonicalName = "Lower Sepik", aliases = {"Nor-Pondo"}, wikidata_item = 7061700}

m["paa-mai"] = {canonicalName = "Mairasi", wikidata_item = 6736896}

m["paa-msk"] = {canonicalName = "Sko", aliases = {"Skou"}, wikidata_item = 953509}

m["paa-nbo"] = {canonicalName = "North Bougainville", wikidata_item = 749496}

m["paa-nim"] = {canonicalName = "Nimboran", wikidata_item = 12638426}

m["paa-pag"] = {canonicalName = "Papuan Gulf", wikidata_item = 48803685}

m["paa-pau"] = {canonicalName = "Pauwasi", wikidata_item = 7155496}

m["paa-ram"] = {canonicalName = "Ramu", wikidata_item = 3442808}

m["paa-sbo"] = {canonicalName = "South Bougainville", wikidata_item = 3217380}

m["paa-sen"] = {canonicalName = "Sentani", family = "paa-wpa", wikidata_item = 17044584}

m["paa-spk"] = {canonicalName = "Sepik", wikidata_item = 3508772}

m["paa-tkw"] = {canonicalName = "Tor-Kwerba", wikidata_item = 7827523}

m["paa-wpa"] = {canonicalName = "West Papuan", wikidata_item = 1363026}

m["paa-yam"] = {canonicalName = "Yam", aliases = {"Morehead and Upper Maro River"}, wikidata_item = 15062272}

m["paa-yua"] = {canonicalName = "Yuat", wikidata_item = 8060096}

m["phi"] = {canonicalName = "Philippine", family = "poz-bop", wikidata_item = 947858}

m["phi-kal"] = {canonicalName = "Kalamian", aliases = {"Calamian"}, family = "phi", wikidata_item = 3217466}

m["poz"] = {canonicalName = "Malayo-Polynesian", family = "map", wikidata_item = 143158}

m["poz-aay"] = {canonicalName = "Admiralty Islands", family = "poz-oce", wikidata_item = 2701306}

m["poz-bnn"] = {canonicalName = "North Bornean", family = "poz-bop", wikidata_item = 1427907}

m["poz-bop"] = {canonicalName = "Borneo-Philippines", family = "poz", wikidata_item = 4273393}

m["poz-bre"] = {canonicalName = "East Barito", family = "poz-bop", wikidata_item = 2701314}

m["poz-brw"] = {canonicalName = "West Barito", family = "poz-bop", wikidata_item = 2761679}

m["poz-btk"] = {canonicalName = "Bungku-Tolaki", family = "poz-clb", wikidata_item = 3217381}

m["poz-cet"] = {canonicalName = "Central-Eastern Malayo-Polynesian", family = "poz", wikidata_item = 2269883}

m["poz-clb"] = {canonicalName = "Celebic", family = "poz-sus", wikidata_item = 1078041}

m["poz-cln"] = {canonicalName = "New Caledonian", family = "poz-occ", wikidata_item = 3091221}

m["poz-cma"] = {canonicalName = "Central Maluku", family = "poz-cet", wikidata_item = 3217479}

m["poz-hce"] = {canonicalName = "Halmahera-Cenderawasih", family = "pqe", wikidata_item = 2526616}

m["poz-kal"] = {canonicalName = "Kaili-Pamona", family = "poz-clb", wikidata_item = 3217465}

m["poz-lgx"] = {canonicalName = "Lampungic", family = "poz-sus", wikidata_item = 49215}

m["poz-mcm"] = {canonicalName = "Malayo-Chamic", family = "poz-msa"}

m["poz-mic"] = {canonicalName = "Micronesian", family = "poz-occ", wikidata_item = 420591}

m["poz-mly"] = {canonicalName = "Malayic", family = "poz-mcm", wikidata_item = 662628}

m["poz-msa"] = {canonicalName = "Malayo-Sumbawan", family = "poz-sus", wikidata_item = 1363818}

m["poz-mun"] = {canonicalName = "Muna-Buton", family = "poz-clb", wikidata_item = 3037924}

m["poz-nws"] = {canonicalName = "Northwest Sumatran", family = "poz-sus", wikidata_item = 2071308}

m["poz-occ"] = {canonicalName = "Central-Eastern Oceanic", family = "poz-oce", wikidata_item = 2068435}

m["poz-oce"] = {canonicalName = "Oceanic", family = "pqe", wikidata_item = 324457}

m["poz-ocw"] = {canonicalName = "Western Oceanic", family = "poz-oce", wikidata_item = 2701282}

m["poz-pep"] = {canonicalName = "Eastern Polynesian", family = "poz-pnp", wikidata_item = 390979}

m["poz-pnp"] = {canonicalName = "Nuclear Polynesian", family = "poz-pol", wikidata_item = 743851}

m["poz-pol"] = {canonicalName = "Polynesian", family = "poz-occ", wikidata_item = 390979}

m["poz-san"] = {canonicalName = "Sabahan", family = "poz-bnn", wikidata_item = 3217517}

m["poz-sbj"] = {canonicalName = "Sama-Bajaw", family = "poz-bop", wikidata_item = 2160409}

m["poz-slb"] = {canonicalName = "Saluan-Banggai", family = "poz-clb", wikidata_item = 3217519}

m["poz-sls"] = {canonicalName = "Southeast Solomonic", family = "poz-occ", wikidata_item = 3119671}

m["poz-ssw"] = {canonicalName = "South Sulawesi", family = "poz-sus", wikidata_item = 2778190}

m["poz-sus"] = {canonicalName = "Sunda-Sulawesi", family = "poz", wikidata_item = 319552}

m["poz-swa"] = {canonicalName = "North Sarawakan", family = "poz-bnn", wikidata_item = 538569}

m["poz-tim"] = {canonicalName = "Timoric", family = "poz-cet", wikidata_item = 7806987}

m["poz-tot"] = {canonicalName = "Tomini-Tolitoli", family = "poz-clb", wikidata_item = 3217541}

m["poz-vnc"] = {canonicalName = "North-Central Vanuatu", family = "poz-occ", wikidata_item = 3039118}

m["poz-wot"] = {canonicalName = "Wotu-Wolio", family = "poz-clb", wikidata_item = 1041317}

m["pqe"] = {canonicalName = "Eastern Malayo-Polynesian", family = "poz-cet", wikidata_item = 2269883}

m["pra"] = {canonicalName = "Prakrit", family = "inc", wikidata_item = 192170}

m["qfa-adc"] = {canonicalName = "Central Great Andamanese", family = "qfa-adm"}

m["qfa-adm"] = {canonicalName = "Great Andamanese", wikidata_item = 3515103}

m["qfa-adn"] = {canonicalName = "Northern Great Andamanese", family = "qfa-adm"}

m["qfa-ads"] = {canonicalName = "Southern Great Andamanese", family = "qfa-adm"}

m["qfa-bet"] = {canonicalName = "Be-Tai", protoLanguage = "qfa-bet-pro", aliases = {"Tai-Be", "Daic-Beic", "Beic-Daic"}, family = "qfa-tak"}

m["qfa-buy"] = {canonicalName = "Buyang", family = "qfa-kra"}

m["qfa-cka"] = {canonicalName = "Chukotko-Kamchatkan", wikidata_item = 33255}

m["qfa-dgn"] = {canonicalName = "Dogon", family = "nic", wikidata_item = 1234776}

m["qfa-dny"] = {canonicalName = "Dene-Yeniseian", aliases = {"Dené-Yeniseian"}, wikidata_item = 21103}

m["qfa-gel"] = {canonicalName = "Gelao", family = "qfa-kra"}

m["qfa-hur"] = {canonicalName = "Hurro-Urartian", wikidata_item = 1144159}

m["qfa-iso"] = {canonicalName = "isolate", family = "qfa-not", wikidata_item = 33648}

m["qfa-kad"] = {
    canonicalName = "Kadu", -- considered either Nilo-Saharan or independent/none
    wikidata_item = 1720989
}

m["qfa-kms"] = {canonicalName = "Kam-Sui", family = "qfa-tak", wikidata_item = 1023641}

m["qfa-kor"] = {canonicalName = "Korean", wikidata_item = 11263525}

m["qfa-kra"] = {canonicalName = "Kra", family = "qfa-tak", wikidata_item = 1022087}

m["qfa-lic"] = {canonicalName = "Hlai", protoLanguage = "qfa-lic-pro", aliases = {"Hlaic"}, family = "qfa-tak", wikidata_item = 1023648}

m["qfa-mal"] = {canonicalName = "Left May", family = "paa-asa", wikidata_item = 614468}

m["qfa-mch"] = { -- used in both N and S America
    canonicalName = "Macro-Chibchan",
    wikidata_item = 3438062
}

m["qfa-mix"] = {canonicalName = "mixed", family = "qfa-not", wikidata_item = 33694}

m["qfa-not"] = {canonicalName = "not a family", family = "qfa-not"}

m["qfa-onb"] = {canonicalName = "Be", protoLanguage = "qfa-onb-pro", aliases = {"Ong-Be", "Beic"}, family = "qfa-bet"}

m["qfa-ong"] = {canonicalName = "Ongan", aliases = {"Angan", "South Andamanese", "Jarawa-Onge"}, wikidata_item = 2090575}

m["qfa-sub"] = {canonicalName = "substrate", wikidata_item = 20730913}

m["qfa-tak"] = {canonicalName = "Kra-Dai", aliases = {"Tai-Kadai", "Kadai"}, wikidata_item = 34171}

m["qfa-tap"] = {canonicalName = "Timor-Alor-Pantar", wikidata_item = 16590002}

m["qfa-tor"] = {canonicalName = "Torricelli", wikidata_item = 1333831}

m["qfa-tyn"] = {canonicalName = "Tyrsenian", wikidata_item = 1344038}

m["qfa-yen"] = {canonicalName = "Yeniseian", aliases = {"Yeniseic", "Yenisei-Ostyak"}, family = "qfa-dny", wikidata_item = 27639}

m["qfa-yuk"] = {canonicalName = "Yukaghir", aliases = {"Yukagir", "Jukagir"}, wikidata_item = 34164}

m["qwe"] = {canonicalName = "Quechuan", wikidata_item = 5218}

m["roa"] = {canonicalName = "Romance", aliases = {"Romanic", "Latin", "Neolatin", "Neo-Latin"}, protoLanguage = "la", family = "itc", wikidata_item = 19814}

m["roa-eas"] = {canonicalName = "Eastern Romance", family = "roa", wikidata_item = 147576}

m["roa-ibe"] = {canonicalName = "West Iberian", family = "roa", wikidata_item = 1377152}

m["roa-itd"] = {canonicalName = "Italo-Dalmatian", family = "roa", wikidata_item = 3313381}

m["roa-git"] = {canonicalName = "Gallo-Italic", family = "roa", wikidata_item = 516074}

m["roa-oil"] = {canonicalName = "Oïl", protoLanguage = "fro", family = "roa", wikidata_item = 37351}

m["roa-rhe"] = {canonicalName = "Rhaeto-Romance", family = "roa", wikidata_item = 515593}

--[=[
	Exceptional language and family codes for South American Indian languages
	can use the prefix "sai-", though "sai" is no longer itself a family code.
]=] --
m["sai-ara"] = {canonicalName = "Araucanian", wikidata_item = 626630}

m["sai-aym"] = {canonicalName = "Aymaran", wikidata_item = 33010}

m["sai-bar"] = {canonicalName = "Barbacoan", aliases = {"Barbakoan"}, wikidata_item = 807304}

m["sai-bor"] = {canonicalName = "Boran", wikidata_item = 43079266}

m["sai-cah"] = {canonicalName = "Cahuapanan", wikidata_item = 1025793}

m["sai-car"] = {canonicalName = "Cariban", aliases = {"Carib"}, wikidata_item = 33090}

m["sai-cer"] = {canonicalName = "Cerrado", aliases = {"Amazonian Jê"}, family = "sai-jee", wikidata_item = 98078151}

m["sai-chc"] = {canonicalName = "Chocoan", aliases = {"Choco", "Chocó"}, wikidata_item = 1075616}

m["sai-cho"] = {canonicalName = "Chonan", aliases = {"Chon"}, wikidata_item = 33019}

m["sai-cje"] = {canonicalName = "Central Jê", aliases = {"Akuwẽ"}, family = "sai-cer", wikidata_item = 18010843}

m["sai-cpc"] = {canonicalName = "Chapacuran", wikidata_item = 1062626}

m["sai-crn"] = {canonicalName = "Charruan", aliases = {"Charrúan"}, wikidata_item = 3112423}

m["sai-ctc"] = {canonicalName = "Catacaoan", wikidata_item = 5051139}

m["sai-guc"] = {canonicalName = "Guaicuruan", aliases = {"Guaicurú", "Guaycuruana", "Guaikurú", "Guaycuruano", "Guaykuruan", "Waikurúan"}, family = "sai-mgc", wikidata_item = 1974973}

m["sai-guh"] = {canonicalName = "Guahiban", aliases = {"Guahiboan", "Guajiboan", "Wahivoan"}, wikidata_item = 944056}

m["sai-har"] = {canonicalName = "Harákmbut", aliases = {"Harákmbet"}, family = "sai-hkt", wikidata_item = 1584402}

m["sai-hkt"] = {canonicalName = "Harákmbut-Katukinan", wikidata_item = 17107635}

m["sai-hoc"] = {canonicalName = "Huitoto-Ocaina"}

m["sai-hrp"] = {canonicalName = "Huarpean", aliases = {"Warpean", "Huarpe", "Warpe"}, wikidata_item = 1578336}

m["sai-jee"] = {canonicalName = "Jê", aliases = {"Gê", "Jean", "Gean", "Jê-Kaingang", "Ye"}, family = "sai-mje", wikidata_item = 1483594}

m["sai-jir"] = {canonicalName = "Jirajaran", aliases = {"Hiraháran"}, wikidata_item = 3028651}

m["sai-jiv"] = {canonicalName = "Jivaroan", aliases = {"Hívaro", "Jibaro", "Jibaroan", "Jibaroana", "Jívaro"}, wikidata_item = 1393074}

m["sai-ktk"] = {canonicalName = "Katukinan", aliases = {"Catuquinan"}, family = "sai-hkt", wikidata_item = 2636000}

m["sai-mas"] = {canonicalName = "Mascoian", aliases = {"Mascoyan", "Maskoian", "Enlhet-Enenlhet"}, wikidata_item = 1906952}

m["sai-mgc"] = {canonicalName = "Mataco-Guaicuru", wikidata_item = 255512}

m["sai-mje"] = {canonicalName = "Macro-Jê", aliases = {"Macro-Gê"}, wikidata_item = 887133}

m["sai-mtc"] = {canonicalName = "Matacoan", family = "sai-mgc", wikidata_item = 2447424}

m["sai-mur"] = {canonicalName = "Muran", aliases = {"Mura"}, wikidata_item = 33826}

m["sai-nad"] = {canonicalName = "Nadahup", aliases = {"Makú", "Macú", "Vaupés-Japurá"}, wikidata_item = 1856439}

m["sai-nje"] = {canonicalName = "Northern Jê", aliases = {"Core Jê"}, family = "sai-cer", wikidata_item = 98078225}

m["sai-nmk"] = {canonicalName = "Nambikwaran", aliases = {"Nambicuaran", "Nambiquaran", "Nambikuaran"}, wikidata_item = 15548027}

m["sai-otm"] = {canonicalName = "Otomacoan", aliases = {"Otomákoan", "Otomakoan"}, wikidata_item = 3217503}

m["sai-pan"] = {canonicalName = "Panoan", aliases = {"Pano"}, family = "sai-pat", wikidata_item = 1544537}

m["sai-pat"] = {canonicalName = "Pano-Tacanan", aliases = {"Pano-Tacana", "Pano-Takana", "Páno-Takána", "Pano-Takánan"}, wikidata_item = 2475746}

m["sai-sje"] = {canonicalName = "Southern Jê", family = "sai-jee", wikidata_item = 98078245}

m["sai-tac"] = {canonicalName = "Tacanan", family = "sai-pat", wikidata_item = 3113762}

m["sai-tuc"] = {canonicalName = "Tucanoan", wikidata_item = 788144}

m["sai-tyu"] = {canonicalName = "Ticuna-Yuri", wikidata_item = 4467010}

m["sai-ucp"] = {canonicalName = "Uru-Chipaya", aliases = {"Uru-Chipayan"}, wikidata_item = 2475488}

m["sai-wic"] = {canonicalName = "Wichí", wikidata_item = 3027047}

m["sai-wit"] = {canonicalName = "Witotoan", aliases = {"Huitotoan", "Uitotoan"}, wikidata_item = 43079317, family = "sai-hoc"}

m["sai-ynm"] = {canonicalName = "Yanomami", aliases = {"Yanomam", "Shamatari", "Yamomami", "Yanomaman"}}

m["sai-zam"] = {canonicalName = "Zamucoan", aliases = {"Samúkoan"}, wikidata_item = 3048461}

m["sai-zap"] = {canonicalName = "Zaparoan", aliases = {"Záparoan", "Saparoan", "Sáparoan", "Záparo", "Zaparoano", "Zaparoana"}, wikidata_item = 33911}

m["sal"] = {canonicalName = "Salishan", wikidata_item = 33985}

m["sdv"] = {canonicalName = "Eastern Sudanic", family = "ssa", wikidata_item = 2036148}

m["sdv-bri"] = {canonicalName = "Bari", family = "sdv-nie"}

m["sdv-daj"] = {canonicalName = "Daju", family = "sdv", wikidata_item = 956724}

m["sdv-dnu"] = {canonicalName = "Dinka-Nuer", family = "sdv-niw"}

m["sdv-eje"] = {canonicalName = "Eastern Jebel", family = "sdv", wikidata_item = 3408878}

m["sdv-kln"] = {canonicalName = "Kalenjin", family = "sdv-nis", wikidata_item = 637228}

m["sdv-lma"] = {canonicalName = "Lotuko-Maa", family = "sdv-nie"}

m["sdv-lon"] = {canonicalName = "Northern Luo", family = "sdv-luo"}

m["sdv-los"] = {canonicalName = "Southern Luo", family = "sdv-luo", wikidata_item = 7570103}

m["sdv-luo"] = {canonicalName = "Luo", family = "sdv-niw"}

m["sdv-nes"] = {canonicalName = "Northern Eastern Sudanic", family = "sdv", wikidata_item = 4810496, aliases = {"Astaboran", "Ek Sudanic"}}

m["sdv-nie"] = {canonicalName = "Eastern Nilotic", family = "sdv-nil", wikidata_item = 153795}

m["sdv-nil"] = {canonicalName = "Nilotic", family = "sdv", wikidata_item = 513408}

m["sdv-nis"] = {canonicalName = "Southern Nilotic", family = "sdv-nil", wikidata_item = 1552410}

m["sdv-niw"] = {canonicalName = "Western Nilotic", family = "sdv-nil", wikidata_item = 3114989}

m["sdv-nma"] = {canonicalName = "Nandi-Markweta", family = "sdv-kln"}

m["sdv-nyi"] = {canonicalName = "Nyima", family = "sdv-nes", wikidata_item = 11688746, aliases = {"Nyimang"}}

m["sdv-tmn"] = {canonicalName = "Taman", family = "sdv-nes", wikidata_item = 3408873, aliases = {"Tamaic"}}

m["sdv-ttu"] = {canonicalName = "Teso-Turkana", family = "sdv-nie", wikidata_item = 7705551, aliases = {"Ateker"}}

m["sem"] = {canonicalName = "Semitic", family = "afa", wikidata_item = 34049}

m["sem-ara"] = {canonicalName = "Aramaic", protoLanguage = "arc", family = "sem-nwe", wikidata_item = 28602}

m["sem-arb"] = {canonicalName = "Arabic", protoLanguage = "ar", family = "sem-cen", wikidata_item = 164667}

m["sem-are"] = {canonicalName = "Eastern Aramaic", family = "sem-ara", wikidata_item = 3410322}

m["sem-arw"] = {canonicalName = "Western Aramaic", family = "sem-ara", wikidata_item = 3394214}

m["sem-ase"] = {canonicalName = "Southeastern Aramaic", family = "sem-are", wikidata_item = 3410322}

m["sem-can"] = {canonicalName = "Canaanite", family = "sem-nwe", wikidata_item = 747547}

m["sem-cen"] = {canonicalName = "Central Semitic", family = "sem-wes", wikidata_item = 3433228}

m["sem-cna"] = {canonicalName = "Central Neo-Aramaic", family = "sem-are", wikidata_item = 3410322}

m["sem-eas"] = {canonicalName = "East Semitic", family = "sem", wikidata_item = 164273}

m["sem-eth"] = {canonicalName = "Ethiopian Semitic", aliases = {"Afro-Semitic", "Ethiopian", "Ethiopic", "Ethiosemitic"}, family = "sem-wes", wikidata_item = 163629}

m["sem-nna"] = {canonicalName = "Northeastern Neo-Aramaic", family = "sem-are", wikidata_item = 2560578}

m["sem-nwe"] = {canonicalName = "Northwest Semitic", family = "sem-cen", wikidata_item = 162996}

m["sem-osa"] = {canonicalName = "Old South Arabian", aliases = {"Epigraphic South Arabian", "Sayhadic"}, family = "sem-cen", wikidata_item = 35025}

m["sem-sar"] = {canonicalName = "Modern South Arabian", family = "sem-wes", wikidata_item = 1981908}

m["sem-wes"] = {canonicalName = "West Semitic", family = "sem", wikidata_item = 124901}

m["sgn"] = {canonicalName = "sign", family = "qfa-not", wikidata_item = 34228}

m["sgn-fsl"] = {canonicalName = "French Sign Languages", family = "sgn", wikidata_item = 5501921}

m["sgn-gsl"] = {canonicalName = "German Sign Languages", family = "sgn", wikidata_item = 5551235}

m["sgn-jsl"] = {canonicalName = "Japanese Sign Languages", family = "sgn", wikidata_item = 11722508}

m["sio"] = {canonicalName = "Siouan", family = "nai-sca", wikidata_item = 34181}

m["sio-dhe"] = {canonicalName = "Dhegihan", family = "sio-msv", wikidata_item = 3217420}

m["sio-dkt"] = {canonicalName = "Dakotan", family = "sio-msv", wikidata_item = 17188640}

m["sio-mor"] = {canonicalName = "Missouri River Siouan", family = "sio", wikidata_item = 26807266}

m["sio-msv"] = {canonicalName = "Mississippi Valley Siouan", family = "sio", wikidata_item = 17188638}

m["sio-ohv"] = {canonicalName = "Ohio Valley Siouan", family = "sio", wikidata_item = 21070931}

m["sit"] = {canonicalName = "Sino-Tibetan", wikidata_item = 45961}

m["sit-aao"] = {canonicalName = "Ao", aliases = {"Central Naga languages"}, family = "sit", wikidata_item = 615474}

m["sit-alm"] = {canonicalName = "Almora", family = "sit-whm"}

m["sit-bdi"] = {canonicalName = "Bodish", family = "sit", wikidata_item = 1814078}

m["sit-dhi"] = {canonicalName = "Dhimalish", family = "sit", wikidata_item = 1207648}

m["sit-ebo"] = {canonicalName = "East Bodish", family = "sit-bdi", wikidata_item = 56402}

m["sit-gma"] = {canonicalName = "Greater Magaric", family = "sit", wikidata_item = 55612963}

m["sit-gsi"] = {canonicalName = "Greater Siangic", family = "sit", wikidata_item = 52698851}

m["sit-hrs"] = {canonicalName = "Hrusish", aliases = {"Southeast Kamengic"}, family = "sit", wikidata_item = 1632501}

m["sit-jnp"] = {canonicalName = "Jingphoic", aliases = {"Jingpho"}, family = "sit-jpl"}

m["sit-jpl"] = {canonicalName = "Kachin-Luic", aliases = {"Jingpho-Luish", "Jingpho-Asakian", "Kachinic"}, family = "tbq-bkj", wikidata_item = 1515454}

m["sit-kch"] = {canonicalName = "Konyak-Chang", family = "sit-kon"}

m["sit-kha"] = {canonicalName = "Kham", family = "sit-gma", wikidata_item = 33305}

m["sit-khb"] = {canonicalName = "Kho-Bwa", aliases = {"Bugunish", "Kamengic"}, family = "sit", wikidata_item = 6401917}

m["sit-kic"] = {canonicalName = "Central Kiranti", family = "sit-kir"}

m["sit-kie"] = {canonicalName = "Eastern Kiranti", family = "sit-kir"}

m["sit-kin"] = {canonicalName = "Kinnauri", family = "sit-whm"}

m["sit-kir"] = {canonicalName = "Kiranti", family = "sit", wikidata_item = 922148}

m["sit-kiw"] = {canonicalName = "Western Kiranti", family = "sit-kir", wikidata_item = 922148}

m["sit-kon"] = {canonicalName = "Konyak", family = "tbq-bkj", wikidata_item = 774590}

m["sit-kyk"] = {canonicalName = "Kyirong-Kagate", family = "sit-tib", wikidata_item = 6450957}

m["sit-lab"] = {canonicalName = "Ladakhi-Balti", family = "sit-tib", wikidata_item = 6450957}

m["sit-las"] = {canonicalName = "Lahuli-Spiti", family = "sit-tib", wikidata_item = 6473510}

m["sit-luu"] = {canonicalName = "Luish", aliases = {"Asakian", "Sak"}, family = "sit-jpl", wikidata_item = 55621439}

m["sit-mar"] = {canonicalName = "Maringic", family = "sit-tma"}

m["sit-mdz"] = {canonicalName = "Midzu", aliases = {"Geman", "Midzuish", "Miju-Meyor", "Southern Mishmi"}, family = "sit", wikidata_item = 6843504}

m["sit-mnz"] = {canonicalName = "Mondzish", aliases = {"Mangish"}, family = "tbq-lob", wikidata_item = 6898839}

m["sit-mru"] = {canonicalName = "Mruic", aliases = {"Mru-Hkongso"}, family = "sit", wikidata_item = 16908870}

m["sit-nax"] = {canonicalName = "Naic", aliases = {"Naxish"}, family = "tbq-buq", wikidata_item = 6982999}

m["sit-new"] = {canonicalName = "Newaric", family = "sit", wikidata_item = 55625069}

m["sit-nng"] = {canonicalName = "Nungish", aliases = {"Nung"}, family = "sit", wikidata_item = 1515482}

m["sit-qia"] = {canonicalName = "Qiangic", family = "tbq-buq", wikidata_item = 1636765}

m["sit-rgy"] = {canonicalName = "Rgyalrongic", aliases = {"Jiarongic"}, family = "sit-qia", wikidata_item = 56936}

m["sit-tam"] = {canonicalName = "Tamangic", aliases = {"West Bodish"}, family = "sit", wikidata_item = 3309439}

m["sit-tan"] = {canonicalName = "Tani", family = "sit", wikidata_item = 3217538}

m["sit-tib"] = {canonicalName = "Tibetic", family = "sit-bdi", wikidata_item = 1641150}

m["sit-tja"] = {canonicalName = "Tujia", family = "sit"}

m["sit-tma"] = {canonicalName = "Tangkhul-Maring", family = "sit"}

m["sit-tng"] = {canonicalName = "Tangkhulic", aliases = {"Tangkhul"}, family = "sit-tma", wikidata_item = 1516657}

m["sit-tno"] = {canonicalName = "Tangsa-Nocte", family = "sit-kon"}

m["sit-tsk"] = {canonicalName = "Tshangla", family = "sit-bdi"}

m["sit-whm"] = {canonicalName = "West Himalayish", family = "sit", wikidata_item = 2301695}

m["sit-zem"] = {canonicalName = "Zeme", aliases = {"Zeliangrong", "Zemeic"}, family = "sit", wikidata_item = 189291}

m["sla"] = {canonicalName = "Slavic", aliases = {"Slavonic"}, family = "ine-bsl", wikidata_item = 23526}

m["smi"] = {canonicalName = "Sami", aliases = {"Saami", "Samic", "Saamic"}, family = "urj", wikidata_item = 56463}

m["son"] = {canonicalName = "Songhay", aliases = {"Songhai"}, family = "ssa", wikidata_item = 505198}

m["sqj"] = {canonicalName = "Albanian", family = "ine", wikidata_item = 8748}

m["ssa"] = {
    canonicalName = "Nilo-Saharan", -- possibly not a genetic grouping
    wikidata_item = 33705
}

m["ssa-fur"] = {canonicalName = "Fur", family = "ssa", wikidata_item = 2989512}

m["ssa-klk"] = {canonicalName = "Kuliak", aliases = {"Rub"}, family = "ssa", wikidata_item = 1791476}

m["ssa-kom"] = {canonicalName = "Koman", family = "ssa", wikidata_item = 1781084}

m["ssa-sah"] = {canonicalName = "Saharan", family = "ssa", wikidata_item = 1757661}

m["syd"] = {canonicalName = "Samoyedic", aliases = {"Samoyed", "Samodeic"}, family = "urj", wikidata_item = 34005}

m["tai"] = {canonicalName = "Tai", aliases = {"Daic"}, family = "qfa-bet", wikidata_item = 749720}

m["tai-wen"] = {canonicalName = "Wenma-Southwestern Tai", family = "tai"}

m["tai-tay"] = {canonicalName = "Tày", family = "tai-wen"}

m["tai-sap"] = {canonicalName = "Sapa-Southwestern Tai", aliases = {"Sapa-Thai"}, family = "tai-wen"}

m["tai-swe"] = {canonicalName = "Southwestern Tai", family = "tai-sap", wikidata_item = 3447105}

m["tai-cho"] = {canonicalName = "Chongzuo Tai", family = "tai", wikidata_item = 13216}

m["tai-cen"] = {canonicalName = "Central Tai", family = "tai", wikidata_item = 5061891}

m["tai-nor"] = {canonicalName = "Northern Tai", family = "tai", wikidata_item = 7059014}

m["tbq"] = {canonicalName = "Tibeto-Burman", family = "sit", wikidata_item = 34064}

m["tbq-anp"] = {canonicalName = "Angami-Pochuri", family = "sit", wikidata_item = 530460}

m["tbq-bdg"] = {canonicalName = "Bodo-Garo", family = "tbq-bkj", wikidata_item = 4090000}

m["tbq-bkj"] = {
    canonicalName = "Sal",
    family = "sit",
    -- Brahmaputran appears to be Glottolog's term
    aliases = {"Bodo-Konyak-Jinghpaw", "Brahmaputran", "Jingpho-Konyak-Bodo"},
    wikidata_item = 889900
}

m["tbq-brm"] = {canonicalName = "Burmish", family = "tbq-lob", wikidata_item = 865713}

m["tbq-buq"] = {canonicalName = "Burmo-Qiangic", family = "sit", wikidata_item = 16056278}

m["tbq-kuk"] = {canonicalName = "Kukish", family = "sit", wikidata_item = 832413}

m["tbq-lal"] = {canonicalName = "Lalo", family = "tbq-lol", wikidata_item = 56548}

m["tbq-lob"] = {canonicalName = "Lolo-Burmese", family = "tbq-buq", wikidata_item = 1635712}

m["tbq-lol"] = {canonicalName = "Loloish", family = "tbq-lob", wikidata_item = 37035}

m["trk"] = {canonicalName = "Turkic", wikidata_item = 34090}

m["trk-kar"] = {canonicalName = "Karluk", aliases = {"Qarluq", "Uyghur-Uzbek", "Southeastern Turkic"}, varieties = {"Eastern Turkic"}, family = "trk"}

m["trk-kbu"] = {canonicalName = "Kipchak-Bulgar", aliases = {"Uralian", "Uralo-Caspian"}, family = "trk-kip", wikidata_item = 3512539}

m["trk-kcu"] = {canonicalName = "Kipchak-Cuman", aliases = {"Ponto-Caspian"}, family = "trk-kip", wikidata_item = 4370412}

m["trk-kip"] = {canonicalName = "Kipchak", otherNames = {"Western Turkic"}, aliases = {"Kypchak", "Qypchaq", "Northwestern Turkic", "Western Turkic"}, protoLanguage = "qwm", family = "trk", wikidata_item = 1339898}

m["trk-kno"] = {canonicalName = "Kipchak-Nogai", aliases = {"Aralo-Caspian"}, family = "trk-kip"}

m["trk-ogr"] = {canonicalName = "Oghur", aliases = {"Lir-Turkic", "r-Turkic"}, family = "trk", wikidata_item = 1422731}

m["trk-ogz"] = {canonicalName = "Oghuz", aliases = {"Southwestern Turkic"}, family = "trk", wikidata_item = 494600}

m["trk-sib"] = {canonicalName = "Siberian Turkic", otherNames = {"Northern Turkic"}, aliases = {"Northeastern Turkic"}, family = "trk"}

m["tup"] = {canonicalName = "Tupian", aliases = {"Tupi"}, wikidata_item = 34070}

m["tup-gua"] = {canonicalName = "Tupi-Guarani", aliases = {"Tupí-Guaraní"}, family = "tup", wikidata_item = 148610}

m["tuw"] = {canonicalName = "Tungusic", aliases = {"Manchu-Tungus", "Tungus"}, wikidata_item = 34230}

m["urj"] = {canonicalName = "Uralic", varieties = {"Finno-Ugric"}, wikidata_item = 34113}

m["urj-mdv"] = {canonicalName = "Mordvinic", family = "urj", wikidata_item = 627313}

m["urj-prm"] = {canonicalName = "Permic", family = "urj", wikidata_item = 161493}

m["urj-ugr"] = {canonicalName = "Ugric", family = "urj", wikidata_item = 156631}

m["wak"] = {canonicalName = "Wakashan", wikidata_item = 60069}

m["wen"] = {canonicalName = "Sorbian", aliases = {"Lusatian", "Wendish"}, family = "zlw", wikidata_item = 25442}

m["xgn"] = {canonicalName = "Mongolic", aliases = {"Mongolian"}, wikidata_item = 33750}

m["xnd"] = {canonicalName = "Na-Dene", aliases = {"Na-Dené"}, family = "qfa-dny", wikidata_item = 26986}

m["ypk"] = {canonicalName = "Yupik", aliases = {"Yup'ik", "Yuit"}, family = "esx-esk", wikidata_item = 27970}

m["zhx"] = {canonicalName = "Sinitic", aliases = {"Chinese"}, protoLanguage = "och", family = "sit", wikidata_item = 33857}

m["zhx-gba"] = {canonicalName = "Greater Bai", aliases = {"Macro-Bai"}, family = "zhx", wikidata_item = 16963847}

m["zhx-min"] = {canonicalName = "Min", protoLanguage = "zhx-min-pro", family = "zhx"}

m["zhx-min-hai"] = {canonicalName = "Coastal Min", family = "zhx-min"}

m["zhx-min-shn"] = {canonicalName = "Inland Min", family = "zhx-min"}

m["zle"] = {canonicalName = "East Slavic", protoLanguage = "orv", family = "sla", wikidata_item = 144713}

m["zls"] = {canonicalName = "South Slavic", family = "sla", wikidata_item = 146665}

m["zlw"] = {canonicalName = "West Slavic", family = "sla", wikidata_item = 145852}

m["zlw-lch"] = {canonicalName = "Lechitic", aliases = {"Lekhitic"}, family = "zlw", wikidata_item = 742782}

m["znd"] = {canonicalName = "Zande", family = "nic-ubg", wikidata_item = 8066072}

return m
