-- The module does various things related to Japanese.

-- Testcases
-- Module:ja/testcases

-- Functions
-- hira_to_kata:
-- {{#invoke:ja|hira_to_kata|おはようございます}} → オハヨウゴザイマス
-- kata_to_hira:
-- {{#invoke:ja|kata_to_hira|アメリカンアパレル}} → あめりかんあぱれる
-- kana_to_romaji:
-- {{#invoke:ja|kana_to_romaji|おやすみなさい}} → oyasuminasai
-- {{#invoke:ja|kana_to_romaji|バックブリーカー}} → bakkuburīkā
-- {{#invoke:ja|kana_to_romaji|「^すげぇ やん！」}} → “Sugē yan!”
-- romaji_to_kata:
-- {{#invoke:ja|romaji_to_kata|bakkurasshu}} → バックラッシュ
-- script:
-- {{#invoke:ja|script|どうも有難う御座います}} → Hira+Hani
-- {{#invoke:ja|script|どうぞよろしく}} → Hira
-- {{#invoke:ja|script|アメリカ合衆国}} → Kana+Hani
-- sort:
-- {{#invoke:ja|sort|バックラッシュ}} → |sort=はっくらっしゅ'
-- {{#invoke:ja|sort|どうぞよろしく}} → |sort=とうぞよろしく'
-- {{#invoke:ja|sort|アメリカ}} → |sort=あめりか
-- Uses
-- It is used by

-- {{ja-new}} (which uses it substitutively)
-- {{ja-verbconj}} and its subtemplates
-- {{ja-noun}}, {{ja-verb}}, {{ja-adj}}, {{ja-pos}}, and {{ja-verb-suru}} which detect the script, generate romanizations, generate sort keys
-- {{ja-readingcat}}, {{ja-readascat}} to generate romanizations, sort keys, count morae, perform checks
-- {{ja-readings}} (Module:ja-kanji-readings) to generate romanizations and to convert from hiragana to katakana for on readings in Module:ja/data/jouyou-yomi

local export = {}

--local titleObj = mw.title.getCurrentTitle()
--local pagename = titleObj.text
--local namespace = titleObj.nsText

local str_gsub = string.gsub
local find = mw.ustring.find
local length = mw.ustring.len
local trim = mw.text.trim
local split = mw.text.split
local sub, gsub = mw.ustring.sub, mw.ustring.gsub
local match, gmatch = mw.ustring.match, mw.ustring.gmatch
local to_cp, to_char = mw.ustring.codepoint, mw.ustring.char

--local Jpan = require("Module:scripts").getByCode("Jpan")
--local lang = require("Module:languages").getByCode("ja")

-- note that arrays loaded by mw.loadData cannot be directly used by gsub
local data = {}

-- romaji with diacritics to romaji without
data.rd={
	['ā']='aa',['ē']='ee',['ī']='ii',['ō']='ou',['ū']='uu'
};

-- **OLD VERSION**
-- **do not remove until [[Special:WhatLinksHere/Template:tracking/ja/k2r_diff]] is OK**
-- equivalent katakana = romaji pairs, k=r or kr
-- clever trick: replaces ン with n@
data.kr_old={
	["ア"] = "a", ["イ"] = "i", ["イィ"] = "yi", ["イェ"] = "ye", ["ウ"] = "u", ["ヴ"] = "vu", ["ヴァ"] = "va", ["ヴィ"] = "vi", ["ヴィェ"] = "vye", ["ヴェ"] = "ve", ["ヴォ"] = "vo", ["ヴャ"] = "vya", ["ヴュ"] = "vyu", ["ヴョ"] = "vyo", ["ウァ"] = "wa", ["ウィ"] = "wi", ["ウゥ"] = "wu", ["ウェ"] = "we", ["ウォ"] = "wo", ["ウュ"] = "wyu", ["エ"] = "e", ["オ"] = "o", ["カ"] = "ka", ["キ"] = "ki", ["キェ"] = "kye", ["キャ"] = "kya", ["キュ"] = "kyu", ["キョ"] = "kyo", ["ガ"] = "ga", ["ギ"] = "gi", ["ギェ"] = "gye", ["ギャ"] = "gya", ["ギュ"] = "gyu", ["ギョ"] = "gyo", ["ク"] = "ku", ["クァ"] = "kwa", ["クィ"] = "kwi", ["クェ"] = "kwe", ["クォ"] = "kwo", ["クヮ"] = "kwa", ["グ"] = "gu", ["グァ"] = "gwa", ["グィ"] = "gwi", ["グェ"] = "gwe", ["グォ"] = "gwo", ["グヮ"] = "gwa", ["ケ"] = "ke", ["ゲ"] = "ge", ["コ"] = "ko", ["ゴ"] = "go", ["サ"] = "sa", ["ザ"] = "za", ["シ"] = "shi", ["シェ"] = "she", ["シャ"] = "sha", ["シュ"] = "shu", ["ショ"] = "sho", ["ジ"] = "ji", ["ジェ"] = "je", ["ジャ"] = "ja", ["ジュ"] = "ju", ["ジョ"] = "jo", ["ス"] = "su", ["スィ"] = "si", ["ズ"] = "zu", ["ズィ"] = "zi", ["セ"] = "se", ["ゼ"] = "ze", ["ソ"] = "so", ["ゾ"] = "zo", ["タ"] = "ta", ["ダ"] = "da", ["チ"] = "chi", ["チェ"] = "che", ["チャ"] = "cha", ["チュ"] = "chu", ["チョ"] = "cho", ["ヂ"] = "ji", ["ヂャ"] = "ja", ["ヂュ"] = "ju", ["ヂョ"] = "jo", ["ヅ"] = "zu", ["ツ"] = "tsu", ["ツァ"] = "tsa", ["ツィ"] = "tsi", ["ツェ"] = "tse", ["ツォ"] = "tso", ["ツュ"] = "tsyu", ["テ"] = "te", ["ティ"] = "ti", ["テュ"] = "tyu", ["デ"] = "de", ["ディ"] = "di", ["デュ"] = "dyu", ["ト"] = "to", ["トゥ"] = "tu", ["ド"] = "do", ["ドゥ"] = "du", ["ナ"] = "na", ["ニ"] = "ni", ["ニェ"] = "nye", ["ニャ"] = "nya", ["ニュ"] = "nyu", ["ニョ"] = "nyo", ["ヌ"] = "nu", ["ネ"] = "ne", ["ノ"] = "no", ["ハ"] = "ha", ["バ"] = "ba", ["パ"] = "pa", ["ヒ"] = "hi", ["ビ"] = "bi", ["ピ"] = "pi", ["ヒェ"] = "hye", ["ヒャ"] = "hya", ["ヒュ"] = "hyu", ["ヒョ"] = "hyo", ["ビェ"] = "bye", ["ピェ"] = "pye", ["ビャ"] = "bya", ["ピャ"] = "pya", ["ビュ"] = "byu", ["ピュ"] = "pyu", ["ビョ"] = "byo", ["ピョ"] = "pyo", ["フ"] = "fu", ["ファ"] = "fa", ["フィ"] = "fi", ["ブィ"] = "bi", ["フィェ"] = "fye", ["フェ"] = "fe", ["フォ"] = "fo", ["フャ"] = "fya", ["フュ"] = "fyu", ["フョ"] = "fyo", ["ブ"] = "bu", ["プ"] = "pu", ["ヘ"] = "he", ["ベ"] = "be", ["ペ"] = "pe", ["ホ"] = "ho", ["ボ"] = "bo", ["ポ"] = "po", ["ホゥ"] = "hu", ["マ"] = "ma", ["ミ"] = "mi", ["ミェ"] = "mye", ["ミャ"] = "mya", ["ミュ"] = "myu", ["ミョ"] = "myo", ["ム"] = "mu", ["メ"] = "me", ["モ"] = "mo", ["ヤ"] = "ya", ["ユ"] = "yu", ["ヨ"] = "yo", ["ラ"] = "ra", ["リ"] = "ri", ["ラ゜"] = "la", ["リ゜"] = "li", ["リェ"] = "rye", ["リャ"] = "rya", ["リュ"] = "ryu", ["リョ"] = "ryo", ["ル"] = "ru", ["ル゜"] = "lu", ["レ゜"] = "le", ["レ"] = "re", ["ロ"] = "ro", ["ロ゜"] = "lo", ["ワ"] = "wa", ["ヷ"] = "va", ["ヰ"] = "wi", ["ヸ"] = "vi", ["ヱ"] = "we", ["ヹ"] = "ve", ["ヲ"] = "o", ["ヺ"] = "vo", ["ン"] = "n@",
	["アァ"] = "ā", 
	["ハァ"] = "hā", 
	["ヨォ"] = "yō", ["ヤァ"] = "yā", ["ユゥ"] = "yū",
	["ナァ"] = "nā", ["ネェ"] = "nē",
	["、"] = ", ", ["。"] = ". ", ["・"] = " ", ["「"] = '“', ["」"] = '”', ["『"] = '“', ["』"] = '”', ["＝"] = "-", ["゠"] = "-", ["，"] = ", ", ["："] = ": ", ["～"] = "~", 
	["〰"] = "~",
};	

-- **NEW VERSION**
-- equivalent katakana = romaji pairs, k=r or kr
-- clever trick: replaces ン with n¤
-- x=sh, q=ch, c=ts
data.kr={
	["ア"] =  "a", ["イ"] =  "i", ["ウ"] =  "u", ["エ"] =  "e", ["オ"] =  "o",
	["カ"] = "ka", ["キ"] = "ki", ["ク"] = "ku", ["ケ"] = "ke", ["コ"] = "ko",
	["サ"] = "sa", ["シ"] = "xi", ["ス"] = "su", ["セ"] = "se", ["ソ"] = "so",
	["タ"] = "ta", ["チ"] = "qi", ["ツ"] = "cu", ["テ"] = "te", ["ト"] = "to",
	["ナ"] = "na", ["ニ"] = "ni", ["ヌ"] = "nu", ["ネ"] = "ne", ["ノ"] = "no",
	["ハ"] = "ha", ["ヒ"] = "hi", ["フ"] = "fu", ["ヘ"] = "he", ["ホ"] = "ho",
	["マ"] = "ma", ["ミ"] = "mi", ["ム"] = "mu", ["メ"] = "me", ["モ"] = "mo",
	["ヤ"] = "ya",                ["ユ"] = "yu",                ["ヨ"] = "yo",
	["ラ"] = "ra", ["リ"] = "ri", ["ル"] = "ru", ["レ"] = "re", ["ロ"] = "ro",
	["ワ"] = "wa", ["ヰ"] = "wi",                ["ヱ"] = "we", ["ヲ"] =  "o",

	["ン"] = "n¤",

	["ガ"] = "ga", ["ギ"] = "gi", ["グ"] = "gu", ["ゲ"] = "ge", ["ゴ"] = "go",
	["ザ"] = "za", ["ジ"] = "ji", ["ズ"] = "zu", ["ゼ"] = "ze", ["ゾ"] = "zo",
	["ダ"] = "da", ["ヂ"] = "ji", ["ヅ"] = "zu", ["デ"] = "de", ["ド"] = "do",
	["バ"] = "ba", ["ビ"] = "bi", ["ブ"] = "bu", ["ベ"] = "be", ["ボ"] = "bo",
	["パ"] = "pa", ["ピ"] = "pi", ["プ"] = "pu", ["ペ"] = "pe", ["ポ"] = "po",
	["ヷ"] = "va", ["ヸ"] = "vi", ["ヴ"] = "vu", ["ヹ"] = "ve", ["ヺ"] = "vo",

	["・"] = " ",
	["！"] = "◆!◇", ["？"] = "◆?◇",
	["（"] = "◇(◆", ["）"] = "◆)◇",
	["「"] = '◇“◆', ["」"] = '◆”◇', ["『"] = '◇“◆', ["』"] = '◆”◇', ["“"] = '◇“◆', ["”"] = '◆”◇',
	["："] = "◆:◇",
	["～"] = "~", ["〜"] = "~", ["〰"] = "~", -- fullwidth tilde vs. wave dash vs. fancy chouonpu
	["、"] = "◆,◇", ["，"] = "◆,◇",           -- ideographic comma vs. fullwidth comma
	["＝"] = "-", ["゠"] = "-",               -- fullwidth equals sign vs. official unicode character
	["※"] = "◆†◇",
	-- ["。"] = "◆.◇", -- fullwidth period is handled by the module code itself
};

-- equivalent romaji = katakana pairs, r=k or rk
data.rk={
	['wyu']='ウュ',['vyu']='ヴュ',['vyo']='ヴョ',['vye']='ヴィェ',['vya']='ヴャ',['tyu']='テュ',['ryu']='リュ',['ryo']='リョ',['rye']='リェ',['rya']='リャ',['pyu']='ピュ',['pyo']='ピョ',['pye']='ピェ',['pya']='ピャ',['nyu']='ニュ',['nyo']='ニョ',['nye']='ニェ',['nya']='ニャ',['myu']='ミュ',['myo']='ミョ',['mye']='ミェ',['mya']='ミャ',['kyu']='キュ',['kyo']='キョ',['kye']='キェ',['kya']='キャ',['kwo']='クォ',['kwi']='クィ',['kwe']='クェ',['kwa']='クァ',['kwa']='クヮ',['hyu']='ヒュ',['hyo']='ヒョ',['hye']='ヒェ',['hya']='ヒャ',['gyu']='ギュ',['gyo']='ギョ',['gye']='ギェ',['gya']='ギャ',['gwo']='グォ',['gwi']='グィ',['gwe']='グェ',['gwa']='グァ',['gwa']='グヮ',['fyu']='フュ',['fyo']='フョ',['fye']='フィェ',['fya']='フャ',['dyu']='デュ',['byu']='ビュ',['byo']='ビョ',['bye']='ビェ',['bya']='ビャ',['zu']='ズ',['zo']='ゾ',['zi']='ズィ',['ze']='ゼ',['za']='ザ',['yu']='ユ',['yo']='ヨ',['yi']='イィ',['ye']='イェ',['ya']='ヤ',['wu']='ウゥ',['wo']='ウォ',['wi']='ウィ',['we']='ウェ',['wa']='ワ',['vu']='ヴ',['vo']='ヴォ',['vi']='ヴィ',['ve']='ヴェ',['va']='ヴァ',['tu']='トゥ',['to']='ト',['ti']='ティ',['te']='テ',['ta']='タ',['su']='ス',['so']='ソ',['si']='スィ',['se']='セ',['sa']='サ',['ru']='ル',['ro']='ロ',['ri']='リ',['re']='レ',['ra']='ラ',['pu']='プ',['po']='ポ',['pi']='ピ',['pe']='ペ',['pa']='パ',['mu']='ム',['mo']='モ',['mi']='ミ',['me']='メ',['ma']='マ',['lu']='ル゜',['lo']='ロ゜',['li']='リ゜',['le']='レ゜',['la']='ラ゜',['ku']='ク',['ko']='コ',['ki']='キ',['ke']='ケ',['ka']='カ',['ju']='ジュ',['jo']='ジョ',['ji']='ジ',['je']='ジェ',['ja']='ジャ',['hu']='ホゥ',['ho']='ホ',['hi']='ヒ',['he']='ヘ',['ha']='ハ',['gu']='グ',['go']='ゴ',['gi']='ギ',['ge']='ゲ',['ga']='ガ',['fu']='フ',['fo']='フォ',['fi']='フィ',['fe']='フェ',['fa']='ファ',['du']='ドゥ',['do']='ド',['di']='ディ',['de']='デ',['da']='ダ',['bu']='ブ',['bo']='ボ',['bi']='ビ',['be']='ベ',['ba']='バ'
};

-- hiragana with dakuten to empty
data.dakuten={
	['が']='',['ぎ']='',['ぐ']='',['げ']='',['ご']='',['ざ']='',['じ']='',['ず']='',['ぜ']='',['ぞ']='',['だ']='',['ぢ']='',['づ']='',['で']='',['ど']='',['ば']='',['び']='',['ぶ']='',['べ']='',['ぼ']='',['ゔ']=''
}

-- hiragana with dakuten or handakuten to those without
data.tenconv={
	['が']='か',['ぎ']='き',['ぐ']='く',['げ']='け',['ご']='こ',['ざ']='さ',['じ']='し',['ず']='す',['ぜ']='せ',['ぞ']='そ',['だ']='た',['ぢ']='ち',['づ']='つ',['で']='て',['ど']='と',['ば']='は',['び']='ひ',['ぶ']='ふ',['べ']='へ',['ぼ']='ほ',['ぱ']='は',['ぴ']='ひ',['ぷ']='ふ',['ぺ']='へ',['ぽ']='ほ',['ゔ']='う'
}

-- hiragana with handakuten to empty
data.handakuten={
	['ぱ']='',['ぴ']='',['ぷ']='',['ぺ']='',['ぽ']=''
}

-- all small hiragana except small tsu (useful when counting morae)
data.nonmora_to_empty={
	['ぁ']='',['ぅ']='',['ぃ']='',['ぇ']='',['ぉ']='',['ゃ']='',['ゅ']='',['ょ']=''
}

data.longvowels={
	['あー']='ああ',['いー']='いい',['うー']='うう',['えー']='ええ',['おー']='おお',['ぁー']='ぁあ',['ぃー']='ぃい',['ぅー']='ぅう',['ぇー']='ぇえ',['ぉー']='ぉお', ['かー']='かあ',['きー']='きい',['くー']='くう',['けー']='けえ',['こー']='こお',['さー']='さあ',['しー']='しい',['すー']='すう',['せー']='せえ',['そー']='そお',['たー']='たあ',['ちー']='ちい',['つー']='つう',['てー']='てえ',['とー']='とお',['なー']='なあ',['にー']='にい',['ぬー']='ぬう',['ねー']='ねえ',['のー']='のお',['はー']='はあ',['ひー']='ひい',['ふー']='ふう',['へー']='へえ',['ほー']='ほお',['まー']='まあ',['みー']='みい',['むー']='むう',['めー']='めえ',['もー']='もお',['やー']='やあ',['ゆー']='ゆう',['よー']='よお',['ゃー']='ゃあ',['ゅー']='ゅう',['ょー']='ょお',['らー']='らあ',['りー']='りい',['るー']='るう',['れー']='れえ',['ろー']='ろお',['わー']='わあ'
}

data.joyo_kanji = ([[
亜哀挨愛曖悪握圧扱宛嵐安案暗以衣位囲医依委威為畏胃尉異移萎偉椅彙意違維慰遺緯域育一
壱逸茨芋引印因咽姻員院淫陰飲隠韻右宇羽雨唄鬱畝浦運雲永泳英映栄営詠影鋭衛易疫益液駅悦越謁閲円延沿炎
宴怨媛援園煙猿遠鉛塩演縁艶汚王凹央応往押旺欧殴桜翁奥横岡屋億憶臆虞乙俺卸音恩温穏下化火加可仮何花佳
価果河苛科架夏家荷華菓貨渦過嫁暇禍靴寡歌箇稼課蚊牙瓦我画芽賀雅餓介回灰会快戒改怪拐悔海界皆械絵開階
塊楷解潰壊懐諧貝外劾害崖涯街慨蓋該概骸垣柿各角拡革格核殻郭覚較隔閣確獲嚇穫学岳楽額顎掛潟括活喝渇割
葛滑褐轄且株釜鎌刈干刊甘汗缶完肝官冠巻看陥乾勘患貫寒喚堪換敢棺款間閑勧寛幹感漢慣管関歓監緩憾還館環
簡観韓艦鑑丸含岸岩玩眼頑顔願企伎危机気岐希忌汽奇祈季紀軌既記起飢鬼帰基寄規亀喜幾揮期棋貴棄毀旗器畿
輝機騎技宜偽欺義疑儀戯擬犠議菊吉喫詰却客脚逆虐九久及弓丘旧休吸朽臼求究泣急級糾宮救球給嗅窮牛去巨居
拒拠挙虚許距魚御漁凶共叫狂京享供協況峡挟狭恐恭胸脅強教郷境橋矯鏡競響驚仰暁業凝曲局極玉巾斤均近金菌
勤琴筋僅禁緊錦謹襟吟銀区句苦駆具惧愚空偶遇隅串屈掘窟熊繰君訓勲薫軍郡群兄刑形系径茎係型契計恵啓掲渓
経蛍敬景軽傾携継詣慶憬稽憩警鶏芸迎鯨隙劇撃激桁欠穴血決結傑潔月犬件見券肩建研県倹兼剣拳軒健険圏堅検
嫌献絹遣権憲賢謙鍵繭顕験懸元幻玄言弦限原現舷減源厳己戸古呼固孤弧股虎故枯個庫湖雇誇鼓錮顧五互午呉後
娯悟碁語誤護口工公勾孔功巧広甲交光向后好江考行坑孝抗攻更効幸拘肯侯厚恒洪皇紅荒郊香候校耕航貢降高康
控梗黄喉慌港硬絞項溝鉱構綱酵稿興衡鋼講購乞号合拷剛傲豪克告谷刻国黒穀酷獄骨駒込頃今困昆恨根婚混痕紺
魂墾懇左佐沙査砂唆差詐鎖座挫才再災妻采砕宰栽彩採済祭斎細菜最裁債催塞歳載際埼在材剤財罪崎作削昨柵索
策酢搾錯咲冊札刷刹拶殺察撮擦雑皿三山参桟蚕惨産傘散算酸賛残斬暫士子支止氏仕史司四市矢旨死糸至伺志私
使刺始姉枝祉肢姿思指施師恣紙脂視紫詞歯嗣試詩資飼誌雌摯賜諮示字寺次耳自似児事侍治持時滋慈辞磁餌璽鹿
式識軸七叱失室疾執湿嫉漆質実芝写社車舎者射捨赦斜煮遮謝邪蛇尺借酌釈爵若弱寂手主守朱取狩首殊珠酒腫種
趣寿受呪授需儒樹収囚州舟秀周宗拾秋臭修袖終羞習週就衆集愁酬醜蹴襲十汁充住柔重従渋銃獣縦叔祝宿淑粛縮
塾熟出述術俊春瞬旬巡盾准殉純循順準潤遵処初所書庶暑署緒諸女如助序叙徐除小升少召匠床抄肖尚招承昇松沼
昭宵将消症祥称笑唱商渉章紹訟勝掌晶焼焦硝粧詔証象傷奨照詳彰障憧衝賞償礁鐘上丈冗条状乗城浄剰常情場畳
蒸縄壌嬢錠譲醸色拭食植殖飾触嘱織職辱尻心申伸臣芯身辛侵信津神唇娠振浸真針深紳進森診寝慎新審震薪親人
刃仁尽迅甚陣尋腎須図水吹垂炊帥粋衰推酔遂睡穂随髄枢崇数据杉裾寸瀬是井世正生成西声制姓征性青斉政星牲
省凄逝清盛婿晴勢聖誠精製誓静請整醒税夕斥石赤昔析席脊隻惜戚責跡積績籍切折拙窃接設雪摂節説舌絶千川仙
占先宣専泉浅洗染扇栓旋船戦煎羨腺詮践箋銭潜線遷選薦繊鮮全前善然禅漸膳繕狙阻祖租素措粗組疎訴塑遡礎双
壮早争走奏相荘草送倉捜挿桑巣掃曹曽爽窓創喪痩葬装僧想層総遭槽踪操燥霜騒藻造像増憎蔵贈臓即束足促則息
捉速側測俗族属賊続卒率存村孫尊損遜他多汰打妥唾堕惰駄太対体耐待怠胎退帯泰堆袋逮替貸隊滞態戴大代台第
題滝宅択沢卓拓託濯諾濁但達脱奪棚誰丹旦担単炭胆探淡短嘆端綻誕鍛団男段断弾暖談壇地池知値恥致遅痴稚置
緻竹畜逐蓄築秩窒茶着嫡中仲虫沖宙忠抽注昼柱衷酎鋳駐著貯丁弔庁兆町長挑帳張彫眺釣頂鳥朝貼超腸跳徴嘲潮
澄調聴懲直勅捗沈珍朕陳賃鎮追椎墜通痛塚漬坪爪鶴低呈廷弟定底抵邸亭貞帝訂庭逓停偵堤提程艇締諦泥的笛摘
滴適敵溺迭哲鉄徹撤天典店点展添転塡田伝殿電斗吐妬徒途都渡塗賭土奴努度怒刀冬灯当投豆東到逃倒凍唐島桃
討透党悼盗陶塔搭棟湯痘登答等筒統稲踏糖頭謄藤闘騰同洞胴動堂童道働銅導瞳峠匿特得督徳篤毒独読栃凸突届
屯豚頓貪鈍曇丼那奈内梨謎鍋南軟難二尼弐匂肉虹日入乳尿任妊忍認寧熱年念捻粘燃悩納能脳農濃把波派破覇馬
婆罵拝杯背肺俳配排敗廃輩売倍梅培陪媒買賠白伯拍泊迫剥舶博薄麦漠縛爆箱箸畑肌八鉢発髪伐抜罰閥反半氾犯
帆汎伴判坂阪板版班畔般販斑飯搬煩頒範繁藩晩番蛮盤比皮妃否批彼披肥非卑飛疲秘被悲扉費碑罷避尾眉美備微
鼻膝肘匹必泌筆姫百氷表俵票評漂標苗秒病描猫品浜貧賓頻敏瓶不夫父付布扶府怖阜附訃負赴浮婦符富普腐敷膚
賦譜侮武部舞封風伏服副幅復福腹複覆払沸仏物粉紛雰噴墳憤奮分文聞丙平兵併並柄陛閉塀幣弊蔽餅米壁璧癖別
蔑片辺返変偏遍編弁便勉歩保哺捕補舗母募墓慕暮簿方包芳邦奉宝抱放法泡胞俸倣峰砲崩訪報蜂豊飽褒縫亡乏忙
坊妨忘防房肪某冒剖紡望傍帽棒貿貌暴膨謀頰北木朴牧睦僕墨撲没勃堀本奔翻凡盆麻摩磨魔毎妹枚昧埋幕膜枕又
末抹万満慢漫未味魅岬密蜜脈妙民眠矛務無夢霧娘名命明迷冥盟銘鳴滅免面綿麺茂模毛妄盲耗猛網目黙門紋問冶
夜野弥厄役約訳薬躍闇由油喩愉諭輸癒唯友有勇幽悠郵湧猶裕遊雄誘憂融優与予余誉預幼用羊妖洋要容庸揚揺葉
陽溶腰様瘍踊窯養擁謡曜抑沃浴欲翌翼拉裸羅来雷頼絡落酪辣乱卵覧濫藍欄吏利里理痢裏履璃離陸立律慄略柳流
留竜粒隆硫侶旅虜慮了両良料涼猟陵量僚領寮療瞭糧力緑林厘倫輪隣臨瑠涙累塁類令礼冷励戻例鈴零霊隷齢麗暦
歴列劣烈裂恋連廉練錬呂炉賂路露老労弄郎朗浪廊楼漏籠六録麓論和話賄脇惑枠湾腕]]):gsub("%s", "")

data.grade1 = ([[一右雨円王音下火花貝学気九休玉金空月犬見五口校左三山子四糸字耳七車手十出女小上森
人水正生夕石赤千川先早草足村大男竹中虫町天田土二日入年白八百文木本名目立力林六青
]]):gsub("%s", "")

data.grade2 = ([[引羽雲園遠何科夏家歌画回会海絵外角楽活間丸岩顔汽記帰弓牛魚京強教近兄形計元言原戸
古午後語工公広交光考行高黄合谷国黒今才細作算止市矢姉思紙寺自時室社弱首秋週春書少場色食心新親図数西
声星晴切雪船線前組走多太体台地池知茶昼長鳥朝直通弟店点電刀冬当東答頭同道読内南肉馬売買麦半番父風分
聞米歩母方北毎妹万明鳴毛門夜野友用曜来里理話
]]):gsub("%s", "")

data.grade3 = ([[丁世両主乗予事仕他代住使係倍全具写列助勉動勝化区医去反取受号向君味命和品員商問坂
央始委守安定実客宮宿寒対局屋岸島州帳平幸度庫庭式役待急息悪悲想意感所打投拾持指放整旅族昔昭暑暗曲有
服期板柱根植業様横橋次歯死氷決油波注泳洋流消深温港湖湯漢炭物球由申界畑病発登皮皿相県真着短研礼神祭
福秒究章童笛第筆等箱級終緑練羊美習者育苦荷落葉薬血表詩調談豆負起路身転軽農返追送速進遊運部都配酒重
鉄銀開院陽階集面題飲館駅鼻
]]):gsub("%s", "")

data.grade4 = ([[不争付令以仲伝位低例便信倉候借停健側働億兆児共兵典冷初別利刷副功加努労勇包卒協単
博印参史司各告周唱喜器囲固型堂塩士変夫失好季孫完官害察巣差希席帯底府康建径徒得必念愛成戦折挙改救敗
散料旗昨景最望未末札材束松果栄案梅械極標機欠歴残殺毒氏民求治法泣浅浴清満漁灯無然焼照熱牧特産的省祝
票種積競笑管節粉紀約結給続置老胃脈腸臣航良芸芽英菜街衣要覚観訓試説課議象貨貯費賞軍輪辞辺連達選郡量
録鏡関陸隊静順願類飛飯養験
]]):gsub("%s", "")

data.grade5 = ([[久仏仮件任似余価保修俵個備像再刊判制券則効務勢厚句可営因団圧在均基報境墓増夢妻婦
容寄富導居属布師常幹序弁張往復徳志応快性恩情態慣承技招授採接提損支政故敵断旧易暴条枝査格桜検構武比
永河液混減測準演潔災燃版犯状独率現留略益眼破確示祖禁移程税築精素経統絶綿総編績織罪群義耕職肥能興舌
舎術衛製複規解設許証評講謝識護豊財貧責貸貿賀資賛質輸述迷退逆造過適酸鉱銅銭防限険際雑非預領額飼
]]):gsub("%s", "")

data.grade6 = ([[並乱乳亡仁供俳値傷優党冊処刻割創劇勤危卵厳収后否吸呼善困垂城域奏奮姿存孝宅宇宗宙
宝宣密寸専射将尊就尺届展層己巻幕干幼庁座延律従忘忠憲我批担拝拡捨探推揮操敬映晩暖暮朗机枚染株棒模権
樹欲段沿泉洗派済源潮激灰熟片班異疑痛皇盛盟看砂磁私秘穀穴窓筋策簡糖系紅納純絹縦縮署翌聖肺背胸脳腹臓
臨至若著蒸蔵蚕衆裁装裏補視覧討訪訳詞誌認誕誠誤論諸警貴賃遺郵郷針鋼閉閣降陛除障難革頂骨
]]):gsub("%s", "")

data.secondary = ([[堀撃茂羅匂誇斉袋弊沃随崎逐漂枕且抗揺涙鐘鮮沢洞怠嬢嚇焦喩淡被般捜頰岳疲侵廷眺
稼唾塀霊迅附醜屈棋坊珍恐賓筒苗摘椎寝軟絞凡斑悦勧耐緩蔽坪沼衰譲柵蹴拷慶替愁繁皆覆雅沈踏疎継扶朕隔舗
妖粘喫炊抜賄悠弥腰崩倫循是阜脱掲舷冶紹沸頻押疾寂雄扇臆恋俊嫌乏契傾迎竜盤触硫括惰併滴凶墨俺鹿巾碁儀
訂袖弄箇堆贈踊萎碑褐騒井弔怖沙甘慨芝剛准玄股趣控販妬餅阪錬枯搾稲伴添抽鬼尾壁床滅轄拠繊拍幣掌惑腐埼
漏核奥棺虚譜嗣鉢潤寧姫陪鋭濯壱慰跳該靴症偶浸姻穫響澄尉蚊鈍鎌圏頑既又窒屯肖宜貞冠帥蛇欧仰宛煮伯撮伺
紳徴呈吹麺稽桁秀吉狂湿柄栓胆呉克廊双郊塑駐啓拒繕柔捗闘酎剥潟遡陥霧摩巨腫邦召杯購媒畳荒陵膨裾糾脂超
升丈芋禍伎麓儒錯梗丘媛甚膝猫娠隣閥罵符披洪瀬剰騰如琴猶徹錮紺頼弾巡廃隻嗅壇籠請縄凍詐励痕醸忙苛凝遜
寡詠監酢諧僧伐爽浪臭硬賠叱痩襲践匿矯培詣墾槽謁塁憂載越戴吏挑渓醒柿耗殖勘幅喚墜吟羞謡犠津撤輩喪催侮
鬱誰獲喉庸戻悼尿噴璃蓄遇錠杉雇緊免壌菌卑拐駒隆塗彙鉛胎惜江桑陣嫉顧懐彩鈴腎摯陳懲措遷茨軸旺辣彰突謀
怪唄覇爆漠箋傍餌鶏与抑頒采冗痘隙掛尚肝貢旨匠垣囚昇憧涯抱瞳砲舶漸殻携藻祈嫁塡濃遂浄懇婆廉酌虎韓恒畔
剖仙換豚慕乞嫡占泥艦咽叫呪郭逓緯普柳排赴酔艶曹飽兼幾威較薄脇渉促刑鼓呂傘丙斎猛逝膜肢斤慌称羨挫貪憬
唯宰勲舟香丹栽毀裂奇鍋賊遍畏斥枢懸乙鍛衝釜滞珠督飢履藤諦薦恭蛮扱佳痴酷拶虹裕捻哺偽臼畿盾蜂暇唆須粋
融窃礎閑吐娯麗崖妙粛依寛窟伏那汚環憩怨貫瞭芯畜綱墳露宵訴隷逸虞丼奈熊曇蓋憶忍煎淑詔盗謎虜牲簿跡瑠
齢剤浦秩恨迭端慮汰泡褒房雷凹濫栃豪抄渇愉尋殊酬蔑岐頓溺娘倒肘輝亜訟紡倣愚滋艇昧罰梨含駆婚戯祉邸尻窯
朽稿憾哀桃及魅髄奉烈菊雌穏軌捕煙妥葛揚韻絡峠遣璧湧旦煩磨錦楼泰鍵裸湾衷享婿妃謄擦炉躍狙唐俸項戚溝蜜
岡唇到悩侶薫爪亭漬逮膳串抵綻刺殿擁療勅獄累慈旋削蛍恣描顎嵐姓癒霜孔俗驚滝潜塞峡即釣孤析奨淫華遮却執
惨砕緻款曽彼寿塾封翁厄震紋把瘍伸炎餓互沖紛帝遵挟挨魂患弧峰妨紫瞬振黙厘爵殴閲倹拭攻帽込猿更汁肪範賦
偉釈礁忌郎鑑乾払叔託胞締離篤瓦衡宴髪繭壮甲盲援罷瓶凸幽翼飾征銃肩禅漆殉刈脊茎誓途粗怒隅脚喝悟欄御劣
索冥堤粧弦玩暫維搬肯献辱芳傲缶狭麻施尼鶴濁握勃但介溶藍猟虐拓慢塔晶叙浮距棟傑敢燥惧糧睦審奪葬軒据繰
拳戒聴腺企亀訃酪脅還渋妊貌透悔謙誘縛膚駄隠稚詰縫盆鋳鎮朱網欺架匹骸阻赦楷貼没泊充棄捉泌偏坑緒腕敏汗
拘畝賜桟睡剣痢祥逃募擬寮影雰詳酵胴諭幻疫避暁需掃踪昆誉挿刃騎弐概侯斗椅辛舞眠僚頃渦硝汎堪眉嘲債薪抹
璽朴岬摂僅慄闇拉埋塊侍肌滑佐菓賢僕奔癖拙荘矛塚違浜租診巧狩迫賭詮潰冒奴陶卸翻氾彫縁況堅妄崇了遭鎖帆
徐粒堕銘掘斜償択渡枠歓憤謹暦漫邪搭斬窮嘱撲偵庶刹箸為尽涼劾魔賂遅凄憎扉穂壊籍嘆某卓顕曖牙棚襟微獣陰
恥鯨慎旬諮歳哲恵致敷零藩諾咲勾
]]):gsub("%s", "")

data.jinmeiyo_kanji = ([[
丑丞乃之乎也云亘亙些亦亥亨亮仔伊伍伽佃佑伶侃侑俄俠俣俐倭俱倦倖偲傭儲允兎兜其冴凌凜凛凧凪凰凱函劉劫
勁勺勿匁匡廿卜卯卿厨厩叉叡叢叶只吾吞吻哉哨啄哩喬喧喰喋嘩嘉嘗噌噂圃圭坐尭堯坦埴堰堺堵塙壕壬夷奄奎套
娃姪姥娩嬉孟宏宋宕宥寅寓寵尖尤屑峨峻崚嵯嵩嶺巌巖已巳巴巫巷巽帖幌幡庄庇庚庵廟廻弘弛彗彦彪彬徠忽怜恢恰
恕悌惟惚悉惇惹惺惣慧憐戊或戟托按挺挽掬捲捷捺捧掠揃摑摺撒撰撞播撫擢孜敦斐斡斧斯於旭昂昊昏昌昴晏晃晄
晒晋晟晦晨智暉暢曙曝曳朋朔杏杖杜李杭杵杷枇柑柴柘柊柏柾柚桧檜栞桔桂栖桐栗梧梓梢梛梯桶梶椛梁棲椋椀楯
楚楕椿楠楓椰楢楊榎樺榊榛槙槇槍槌樫槻樟樋橘樽橙檎檀櫂櫛櫓欣欽歎此殆毅毘毬汀汝汐汲沌沓沫洸洲洵洛浩浬
淵淳渚渚淀淋渥湘湊湛溢滉溜漱漕漣澪濡瀕灘灸灼烏焰焚煌煤煉熙燕燎燦燭燿爾牒牟牡牽犀狼猪猪獅玖珂珈珊珀
玲琢琢琉瑛琥琶琵琳瑚瑞瑶瑳瓜瓢甥甫畠畢疋疏皐皓眸瞥矩砦砥砧硯碓碗碩碧磐磯祇祢禰祐祐祷禱禄祿禎禎禽禾
秦秤稀稔稟稜穣穰穹穿窄窪窺竣竪竺竿笈笹笙笠筈筑箕箔篇篠簞簾籾粥粟糊紘紗紐絃紬絆絢綺綜綴緋綾綸縞徽繫
繡纂纏羚翔翠耀而耶耽聡肇肋肴胤胡脩腔脹膏臥舜舵芥芹芭芙芦苑茄苔苺茅茉茸茜莞荻莫莉菅菫菖萄菩萌萠萊菱
葦葵萱葺萩董葡蓑蒔蒐蒼蒲蒙蓉蓮蔭蔣蔦蓬蔓蕎蕨蕉蕃蕪薙蕾蕗藁薩蘇蘭蝦蝶螺蟬蟹蠟衿袈袴裡裟裳襖訊訣註詢
詫誼諏諄諒謂諺讃豹貰賑赳跨蹄蹟輔輯輿轟辰辻迂迄辿迪迦這逞逗逢遥遙遁遼邑祁郁鄭酉醇醐醍醬釉釘釧銑鋒鋸
錘錐錆錫鍬鎧閃閏閤阿陀隈隼雀雁雛雫霞靖鞄鞍鞘鞠鞭頁頌頗顚颯饗馨馴馳駕駿驍魁魯鮎鯉鯛鰯鱒鱗鳩鳶鳳鴨鴻
鵜鵬鷗鷲鷺鷹麒麟麿黎黛鼎
亞惡爲榮衞圓緣薗應櫻奧橫溫價壞懷樂渴卷陷寬氣僞戲虛峽狹曉
駈勳薰惠揭鷄藝擊縣儉劍險圈檢顯驗嚴廣恆黃國黑碎雜兒濕實壽收從澁獸縱緖敍
將涉燒奬條狀乘淨剩疊孃讓釀眞寢愼盡粹醉穗瀨齊靜攝專戰纖禪壯爭莊搜巢曾裝瘦騷增藏臟卽帶
滯瀧單團彈晝鑄廳徵聽鎭轉傳嶋燈盜稻德拜盃賣髮拔晚祕冨拂佛步峯飜
每萬默埜彌藥與搖樣謠來賴覽龍凉綠淚壘禮曆歷鍊郞錄]]):gsub("%s", "")

-- Unicode normalization often converts these to the corresponding CJK Unified Ideographs characters
local compat_ideo = mw.ustring.char(0xF900) .. "-" .. mw.ustring.char(0xFAD9)

export.data = {
	joyo_kanji = data.joyo_kanji,
	jinmeiyo_kanji = data.jinmeiyo_kanji,
	grade1 = data.grade1,
	grade2 = data.grade2,
	grade3 = data.grade3,
	grade4 = data.grade4,
	grade5 = data.grade5,
	grade6 = data.grade6
}

local function track(code)
	if type(code) ~= "string" then
		error("The track function requires a string as argument.")
	end
	--require("Module:debug").track("ja/" .. code)
end

local function enlarge(text)
	return '<span style="font-size: 1.2em">' .. text .. '</span>'
end

local function change_codepoint(added_value)
	return function(char)
		return to_char(to_cp(char) + added_value)
	end
end

function export.hira_to_kata(text)
	if type(text) == "table" then text = text.args[1] end

	return (gsub(text, '[ぁ-ゖ]', change_codepoint(96)))
end

function export.kata_to_hira(text)
	if type(text) == "table" then text = text.args[1] end

	return (gsub(text, '[ァ-ヶ]', change_codepoint(-96)))
end

function export.fullwidth_to_halfwidth(text)
	if type(text) == "table" then text = text.args[1] end

	text = gsub(text, '　', ' ')
	return (gsub(text, '[！-～]', change_codepoint(-65248)))
end

function export.kana_to_romaji(text, options)
	-- options: no_diacritics, keep_period, hist, phonetic
	local str_find = string.find

	if type(text) == "table" then
		text = text.args[1]
	end

	if not options then options = {} end

	local tracking_has_percent = str_find(text, '%%')
	local text_old = ''
	-- if not options.hist then
	-- 	text_old = trim(require('Module:ja/k2r-old').kana_to_romaji(text, options.no_diacritics, options.keep_period))
	-- end

	-- conversions
	if not options.phonetic then
		text = gsub(text, '(%-)([はハ])$', '%1㊟㈛㊟%2') -- は as suffix (派 "-ha", etc.) and appearing at the end of string
		text = gsub(text, '(%-)([はハ]) ', '%1㊟㈛㊟%2 ') -- は as suffix and appearing mid-sentence
	end
	
	text = str_gsub(text, '％', '㊟㌫㊟') -- at [[見込む]], for example; avoid collision with % used in our ruby syntax
	text = str_gsub(text, '\'\'\'', '㊟⒝㊟')
	text = str_gsub(text, '<u>', '㊟㋑⒰㊟')
	text = str_gsub(text, '</u>', '㊟㋺⒰㊟')
	
	local text_styling = "㊟[㋑㋺⒝⒰]+㊟"
	
	-- avoid tampering with existing latin text: store it away
	local escape = {}
	local id = 0
	for latin in string.gmatch(text, "[a-z]+") do
		escape[id] = latin
		text = str_gsub(text, latin, "㊟㊕㊕㊟" .. id .. "㊟㊕㊕㊟")
		id = id + 1
	end

	-- special preformatting
	text = str_gsub(text, 'ヶげつ', 'かげつ')
	text = gsub(text, 'ヶ(' .. text_styling .. ')げつ', 'か%1げつ') -- 「'''ヶ'''げつ」
	text = str_gsub(text, 'ヶ', 'が')
	text = str_gsub(text, 'ヵ', 'か')
	text = gsub(text, '(.)[ゝヽ]', '%1%1')
	text = gsub(text, '(.)[ゞヾ]', function(char) return mw.ustring.toNFC(char .. char .. '゙') end) -- unicode hax

	-- [[Wiktionary:Grease_pit/2017/May#Formatting_for_individual_Japanese_readings]]
	if options.hist then
		text = gsub(text, '[やゆよわゐゑを]', '㊟⒳㊟%0')
		text = gsub(text, '.',
			{
				['つ'] = 'tu',
				['ち'] = 'ti',
				['づ'] = 'du',
				['ぢ'] = 'di',
				['し'] = 'si',
				['じ'] = 'zi',
				['ゐ'] = 'wi',
				['を'] = 'wo',
			}
		)
	end

	text = export.hira_to_kata(text)
	text = gsub(text, '.', data.kr)
	text = export.fullwidth_to_halfwidth(text)

	if options.hist then
		text = str_gsub(text, 'oo', 'o.o')
		text = str_gsub(text, 'ou', 'o.u')
		text = str_gsub(text, 'h', 'f')
		
		local old = text
		text = str_gsub(text, 'i㊟⒳㊟y', 'y') -- くゐやう kwyau
		text = str_gsub(text, '([kg])u㊟⒳㊟w', '%1w') 
		if old ~= text then
			--[=[
				There may be cases in which i or u is deleted incorrectly, and a
				period should be inserted.
				"Syncope" isn't quite accurate, as there wasn't a sound change.
				It's just an orthographic convention.
				[[Special:WhatLinksHere/Template:tracking/ja/mora syncope]]
			]=]
			mw.log(str_gsub(old, '㊟⒳㊟', '')  .. ' → ' .. str_gsub(text, '㊟⒳㊟', '') )
			track('mora syncope')
		end
		
		text = str_gsub(text, '㊟⒳㊟', '') -- ゑつ wetsu
	end

	-- markup
	text = str_gsub(text, '%%', '.') -- ruby "percent sign" syntax
	text = gsub(text, '([ッ¤])%.', '%1') -- 「し を ぼっ.す」; 「るい%じん%えん」→「rui.jin¤.en¤」

	-- 「テェェェ」→「テェーー」 (avoid funky romaji effected by the "(テュ→)teユ→tyu" line below)
	local kogaki_vowels = {'ァ','ィ','ゥ','ェ','ォ'}
	for _, char in ipairs(kogaki_vowels) do
		text = gsub(text, '('..char..')('..char..'+)', function(a,b) return a .. mw.ustring.rep('ー', length(b)) end)
	end

	-- (ゲェ→)geェ→gee (note that this causes things like ウゥ→ū and ギィ→gī)
	text = gsub(text, '[aiueo][ァィゥェォ]', {['aァ']='aa',['iィ']='ii',['uゥ']='uu',['eェ']='ee',['oォ']='oo',})

	-- (クヮ→)kuヮ→kwa
	text = gsub(text, '[u]([ヮ])', {['ヮ']='wa',})

	-- (クァ→)kuァ→kwa, (トァ→)toァ→twa, (ウィ→)uィ→wi
	text = gsub(text, '[uo]([ァィェォ])', {['ァ']='wa',['ィ']='wi',['ェ']='we',['ォ']='wo',})
	if not options.hist then
		-- (ツァ→)cwa→ca
		text = str_gsub(text, '([fvcsz])w', '%1')
	end

	-- (テュ→)teユ→tyu, (ギェ→)giェ→gye
	text = gsub(text, '[aiueo]([ャュェョ])', {['ャ']='ya',['ュ']='yu',['ェ']='ye',['ョ']='yo',})
	-- (ジュ→)jyu→ju
	text = gsub(text, '([xjq])y', '%1')

	-- (ティ→)teィ→ti (essentially forget about the vowel in between)
	text = gsub(text, '[aiueo]([ァィゥェォ])', {['ァ']='a',['ィ']='i',['ゥ']='u',['ェ']='e',['ォ']='o',})

	-- chouonpu and sokuon
	while str_find(text, '[aiueo]ー') or str_find(text, 'ッ *[bcdfghjklmnpqrstvwxyz]') or find(text, 'ッ' .. text_styling .. '[bcdfghjklmnpqrstvwxyz]') do
		text = str_gsub(text, '([aiueo])ー', '%1%1')
		text = str_gsub(text, 'ッ( *)([bcdfghjklmnpqrstvwxyz])', '%2%1%2')
		text = gsub(text, 'ッ(' .. text_styling .. ')([bcdfghjklmnpqrstvwxyz])', '%2%1%2')
	end
	-- deal with leftover sokuon not used as geminate
	text = str_gsub(text, 'ッ', '&apos;')

	-- (ん→)n¤
	text = str_gsub(text, '¤([aiueoy])', "'%1")
	text = str_gsub(text, '¤', '')

	-- は, へ
	if not options.phonetic and str_find(text, "h[ae]") then
		for i, v in ipairs{
			{ "ha", "wa" },
			{ "he", "e" }
		} do
			local thingy = '[^a-z.㊟-]' -- not sure what this should be named
			text = gsub(text, "(" .. thingy .. ")" .. v[1] .. "(" .. thingy .. ")", "%1" .. v[2] .. "%2")
			text = gsub(text, "(" .. thingy .. ")" .. v[1] .. "$", "%1" .. v[2])
			text = gsub(text, "^" .. v[1] .. "(" .. thingy .. ")", v[2] .. "%1")
			if find(text, text_styling) then
				text = gsub(text, "(" .. thingy .. ")" .. v[1] .. "(" .. text_styling .. thingy ..")", "%1" .. v[2] .. "%2")
				text = gsub(text, "(" .. thingy .. ")" .. v[1] .. "(" .. text_styling .. ")$", "%1" .. v[2] .. "%2")
				text = gsub(text, "(" .. thingy .. text_styling .. ")" .. v[1] .. "(" .. text_styling .. thingy ..")", "%1" .. v[2] .. "%2")
				text = gsub(text, "(" .. thingy .. text_styling .. ")" .. v[1] .. "(" .. text_styling .. ")$", "%1" .. v[2] .. "%2")
			end
		end
	end
	-- change only when
	--   ① not flanked by a-z or a period ("^sore wa nani$", "^hyappou no .he hitotsu$")
	--   ② at the end of the string and not preceded by a-z or a period ("^are wa$")
	--   ③ at the beginning of the string and not followed by a-z or a period ("^he ikou$") [not sure this is actually necessary, but I suppose it is consistent with ②]
	-- this also means that "^ha$" becomes "ha"
	-- period can be used next to the kana (either side) to force the "dumb" romanization (i.e. "ha", "he")

	-- fix sh, ch, ts
	local function handle_digraphs(geminate, intervening, main, following)
		--「めちゃ」→「mecha」
		--「めっちゃ」→「metcha」
		--「めっっちゃ」→「mettcha」
		local corresp_geminate_form = {['x']='s',['q']='t',['c']='t'}
		local corresp_main = {['x']='sh',['q']='ch',['c']='ts'}
		
		local geminate_repl, main_repl
		
		-- So as not to convert ch to tsh.
		if not following or main .. following ~= "ch" then
			main_repl = corresp_main[main]
		end
		
		if geminate ~= "" then
			geminate_repl = string.rep(corresp_geminate_form[main], #geminate)
		end
		
		return (geminate_repl or geminate) .. (intervening or "") .. (main_repl or main) .. (following or "")
	end
	
	local function handle_digraphs2(geminate, main, following)
		return handle_digraphs(geminate, nil, main, following)
	end
	
	text = gsub(text, '([xqc]+)(' .. text_styling .. ')([xqc])', handle_digraphs)
	text = gsub(text, '([xqc]*)([xqc])(.?)', handle_digraphs2)
	

	-- macrons
	-- Will cause problems if combined vowel-macron characters are used below.
	if not options.no_diacritics then
		if not options.phonetic then
			text = str_gsub(text, 'ou', 'ō')
		end
		local macron = to_char(0x304)
		text = str_gsub(
			text,
			'([oaeui])%1',
			'%1' .. macron
		)
	end

	-- remove markup and convert real periods
	if not options.keep_period then
		text = str_gsub(text, '%.', '')
		text = str_gsub(text, '。', '◆.◇')
	end

	-- 
	text = str_gsub(text, '◇◆', '')
	text = str_gsub(text, '◆◇', '')
	text = str_gsub(text, ' *◆ *', '')
	text = str_gsub(text, ' *◇ *', ' ')

	-- restore latin text
	text = str_gsub(text, "㊟㊕㊕㊟(%d+)㊟㊕㊕㊟", function(id) return escape[tonumber(id)] end)

	-- clean up spaces
	text = trim(text)
	text = str_gsub(text, ' +', ' ')
	
	-- remove double ampersands used in ruby
	text = str_gsub(text, '&&(.-)&&', '%1')

	-- uppercase markup
	text = str_gsub(text, "(%^)(㊟⒝㊟)", "%2%1") -- move ^ to an effective position if placed before bold markup
	text = str_gsub(text, "(%^)( )", "%2%1") -- same but with spaces
	text = gsub(text, '%^(.)', mw.ustring.upper) -- uppercase conversion

	-- clean up spaces again
	text = str_gsub(text, ' +', ' ')

	-- conversions
	text = str_gsub(text, '㊟⒝㊟', '\'\'\'')
	text = str_gsub(text, '㊟㋑⒰㊟', '<u>')
	text = str_gsub(text, '㊟㋺⒰㊟', '</u>')
	text = str_gsub(text, '㊟㈛㊟', '')
	text = str_gsub(text, '㊟㌫㊟', '%%')

	-- unicode NFC
	text = mw.ustring.toNFC(text)

	-- comparison with old "to romaji" code
	-- if not options.hist then
	-- 	-- comparison with old kana_to_romaji() code
	-- 	text_old = str_gsub(text_old, '%(ba%)', ' (ba)') -- avoid flooding the tracking template with na-adjectives. ← this *is* a problem though...
	-- 	if text ~= text_old then
	-- 		if mw.ustring.lower(text) == mw.ustring.lower(text_old) then
	-- 			track('k2r diff caps')
	-- 		elseif str_find(text_old, 'ッ') then
	-- 			track('k2r diff w xtu')
	-- 		elseif tracking_has_percent then
	-- 			track('k2r diff pc')
	-- 		elseif gsub(text, '%s*([“”!?])%s*', '%1') == gsub(text_old, '%s*([”!?])%s*', '%1') then
	-- 			track('k2r diff punc spacing')
	-- 		else
	-- 			track('k2r diff')
	-- 		end
	-- 		mw.log('new]' .. text .. '[')
	-- 		mw.log('old]' .. text_old .. '[')
	-- 	end
	-- end

	if find(text, '[ぁ-ー]') then
		track('k2r failure')
	end
	
	return text
end

-- removes spaces and hyphens from input
-- intended to be used when checking manual romaji to allow the
-- insertion of spaces or hyphens in manual romaji without appearing "wrong"
function export.rm_spaces_hyphens(f)
	local text = type(f) == 'table' and f.args[1] or f
	text = str_gsub(text, '.', { [' '] = '', ['-'] = '', ['.'] = '', ['\''] = '' })
	text = str_gsub(text, '&nbsp;', '')
	return text
end

function export.romaji_to_kata(f)
	local text = type(f) == 'table' and f.args[1] or f
	text = gsub(text, '.', data.rd)
	text = str_gsub(text, '(.)%1', {
		k = 'ッk', s = 'ッs', t = 'ッt', p = 'ッp',
		b = 'ッb', d = 'ッd', g = 'ッg', j = 'ッj'
	})
	text = str_gsub(text, 'tc', 'ッc')
	text = str_gsub(text, 'tsyu', 'ツュ')
	text = str_gsub(text, 'ts[uoiea]', {['tsu']='ツ',['tso']='ツォ',['tsi']='ツィ',['tse']='ツェ',['tsa']='ツァ'})
	text = str_gsub(text, 'sh[uoiea]', {['shu']='シュ',['sho']='ショ',['shi']='シ',['she']='シェ',['sha']='シャ'})
	text = str_gsub(text, 'ch[uoiea]', {['chu']='チュ',['cho']='チョ',['chi']='チ',['che']='チェ',['cha']='チャ'})
	text = str_gsub(text, "n[uoiea']?", {['nu']='ヌ',['no']='ノ',['ni']='ニ',['ne']='ネ',['na']='ナ'})
	text = str_gsub(text, '[wvtrpsnmlkjhgfdbzy][yw]?[uoiea]', data.rk)
	text = str_gsub(text, "n'?", 'ン')
	text = str_gsub(text, '[aeiou]', {
		u = 'ウ', o = 'オ', i = 'イ', e = 'エ', a = 'ア'
	})
	return text
end

-- expects: any mix of kanji and kana
-- determines the script types used
-- e.g. given イギリス人, it returns Kana+Hani
function export.script(f)
	text, script = type(f) == 'table' and f.args[1] or f, {}

	if find(text, '[ぁ-ゖ]') then
		table.insert(script, 'Hira')
	end
	-- TODO: there are two kanas.  This should insert Kata.
	if find(text, '[ァ-ヺー]') then
		table.insert(script, 'Kana')
	end
	-- 一 is unicode 4e00, previously used 丁 is 4e01
	if find(text, '[㐀-䶵一-鿌' .. compat_ideo .. '𠀀-𯨟]') then
		table.insert(script, 'Hani')
	end
	-- matching %a should have worked but matched the end of every string
	if find(text, '[a-zA-ZāēīōūĀĒĪŌŪａ-ｚＡ-Ｚ]') then
		table.insert(script, 'Romaji')
	end
	if find(text, '[0-9０-９]') then
		table.insert(script, 'Number')
	end
	if find(text, '[〆々]') then
		table.insert(script, 'Abbreviation')
	end

	return table.concat(script, '+')
end

-- when counting morae, most small hiragana belong to the previous mora,
-- so for purposes of counting them, they can be removed and the characters
-- can be counted to get the number of morae.  The exception is small tsu,
-- so data.nonmora_to_empty maps all small hiragana except small tsu.
function export.count_morae(text)
	if type(text) == "table" then
		text = text.args[1]
	end
	-- convert kata to hira (hira is untouched)
	text = export.kata_to_hira(text)
	-- remove all of the small hiragana such as ょ except small tsu
	text = gsub(text,'.',data.nonmora_to_empty)
	-- remove zero-width spaces
	text = gsub(text, '‎', '')
	-- return number of characters, which should be the number of morae
	return length(text)
end

-- accepts: any mix of kana
-- returns: a hiragana sort key designed for WMF software
-- this is like sort() but doesn't return |sort=sortkey,
-- just the sort key itself, but unlike sort(), this
-- replaces the long vowel mark with its vowel
function export.jsort(text)
	if type(text) == "table" then
		text = text.args[1]
	end
	local textsub = ''
	local convertedten = ''
	local result = ''
	local len = 1

	-- remove western spaces, hyphens, and periods
	-- diff=41967612: also remove caret
	text = gsub(text, '[ %-%.%^]', '')

	text = export.kata_to_hira(text)

	-- if the first character has dakuten, replace it with the corresponding
	-- character without dakuten and add an apostrophe to the end, e.g.
	-- がす > かす'
	if gsub(sub(text,1,1),'.',data.dakuten) == '' then
		len = length(text)
		textsub = sub(text,2,len)
		convertedten = gsub(sub(text,1,1),'.',data.tenconv)
		text = (convertedten .. textsub .. "'")
	else
		-- similar thing but with handuken and two apostrophes, e.g. ぱす -> はす''
		if gsub(sub(text,1,1),'.',data.handakuten) == '' then
			len = length(text)
			textsub = sub(text,2,len)
			convertedten = gsub(sub(text,1,1),'.',data.tenconv)
			text = (convertedten .. textsub .. "''")
		end
	end
	-- replace the long vowel mark with the vowel that it stands for
	for key,value in pairs(data.longvowels) do
		text = gsub(text,key,value)
	end
	return text
end

-- returns a sort key with |sort= in front, e.g.
-- |sort=はつぐん' if given ばつぐん
function export.sort(f)
	local text = type(f) == 'table' and f.args[1] or f
	local textsub = ''
	local convertedten = ''
	local result = ''
	local len = 1
	local kyreplace = ''
	kyreplace = gsub(text,'[ァ-ヺ]', '')
	if kyreplace == '' then
		result = ('|' .. 'sort' .. '=')
	end
	text = export.kata_to_hira(text)
	if gsub(sub(text,1,1),'.',data.dakuten) == '' then
		if kyreplace == '' then else result = ('|' .. 'sort' .. '=') end
		len = length(text)
		textsub = sub(text,2,len)
		convertedten = gsub(sub(text,1,1),'.',data.tenconv)
		result = (result .. convertedten .. textsub .. "'")
	else
		if gsub(sub(text,1,1),'.',data.handakuten) == '' then
			if kyreplace == '' then else result = ('|' .. 'sort' .. '=') end
			len = length(text)
			textsub = sub(text,2,len)
			convertedten = gsub(sub(text,1,1),'.',data.tenconv)
			result = (result .. convertedten .. textsub .. "''")
		else
			if kyreplace == '' then
				result = (result .. text)
			end
		end
	end
	return result
end

-- returns the "stem" of a verb or -i adjective, that is the term minus the final character
function export.definal(f)
	return sub(f.args[1],1,(length(f.args[1])-1))
end

function export.remove_ruby_markup(text)
	return string.gsub(text, "[%^%-%. %%]", "")
end

-- see also Template:JAruby
-- meant to be called from another module
function export.add_ruby_backend(term, kana, from_ja_link)
	if term == kana then
		return enlarge(term)
	end
	local pattern = ""
	-- holds the whole segments of markup enclosed in <ruby>...</ruby>
	local ruby_markup = {}
	-- range of kana: '[ぁ-ゖァ-ヺ]'
	-- nonkana: [^ぁ-ゖァ-ヺ]
	local kanji_pattern = "[A-Za-z0-9々㐀-䶵一-鿌" .. compat_ideo .. "𠀀-𯨟０-９Ａ-Ｚ]"
	
	local str_find = string.find
	local str_gsub = string.gsub
	
	-- If term and kana aren't identical, then term should contain stuff that can
	-- have kana put above it.
	if not find(term, kanji_pattern) then
		require("Module:debug").track("ja/ruby/no kanji")
		-- error("No kanji or other ruby-annotatable characters in first argument of add_ruby_backend.")
		return enlarge(term)
	end
	
	local orig_term = term
	
	-- Escape decimal numeric entities (such as &#32; representing a space) and HTML tags, which do not need ruby annotations.
	local function escape(t, i)
		return function(text, patt)
			return str_gsub(text, patt,
				function(capture)
					i = i + 1
					t[i] = capture
					return "㊟" .. string.rep("&", i) .. "㊟"
				end)
		end
	end
	
	local escaped1 = {}
	local escape1 = escape(escaped1, 0)
	
	term = escape1(term, "(&&.-&&)")
	term = escape1(term, "(&#x?%d+;)")
	term = escape1(term, "(&[A-Za-z]+;)")
	term = escape1(term, "(<[^>]+>)")
	
	local escaped2 = {}
	local escape2 = escape(escaped2, 0)
	
	kana = escape2(kana, "(&&.-&&)")
	kana = escape2(kana, "(&#%d+;)")
	kana = escape2(kana, "(&[A-Za-z]+;)")
	kana = escape2(kana, "(<[^>]+>)")
	
	if escaped1[1] or escaped2[1] then
		-- [[Special:WhatLinksHere/Template:tracking/ja/ruby/escaped]]
		require("Module:debug").track("ja/ruby/escaped")
	end
	
	if #escaped2 ~= #escaped1 then
		local relationship
		if #escaped1 > #escaped2 then
			relationship = "more"
		else
			relationship = "fewer"
		end
		
		mw.logObject(escaped1)
		mw.logObject(escaped2)
		error("There are " .. relationship .. " escaped things in the text to be annotated than in the ruby text.")
	end
	
	-- links without pipes will fail
	term = str_gsub(term, '%[%[([^|%]]+)%]%]', '[[%1|%1]]')

	-- remove links from kana
	kana = str_gsub(kana, '%[%[([^|%]]+)%]%]', '%1')
	kana = str_gsub(kana, '%[%[[^%]]+|([^%]]+)%]%]', '%1')

	-- build up pattern
	-- escape the magic characters in the term
	pattern = str_gsub(term, '%[%[[^%]]+|([^%]]+)%]%]', '%1')
	pattern = require("Module:string").pattern_escape(pattern)

	pattern = str_gsub(pattern, "[%[%]]+", " *")
	kana = str_gsub(kana, "[%[%]]+", '')
	pattern = str_gsub(pattern, " *('+) *", "%1")
	kana = str_gsub(kana, " *('+) *", "%1")
	pattern = str_gsub(pattern, " +", " ")
	kana = str_gsub(kana, " +", " ")

	-- remove periods and caret signs and hyphens
	pattern = str_gsub(pattern, '%%[.^-]', '')
	kana = str_gsub(kana, '[.^-]', '')

	-- in order to make a pattern that will find the ruby,
	-- replace every unbroken string of kanji with a sub-pattern
	
	-- mw.log("before adding (..-):", pattern)
	pattern = gsub(pattern, kanji_pattern .. '+', '(..-)')
	-- get a pattern like
	-- (.+)ばか(.+)ばか(.+)ばかばかばああか(.+) when given 超ばか猿超ばか猿超ばかばかばああか猿
	-- it turns out we need to keep the spaces sometimes
	-- so that kana don't "leak" in ambiguous cases like 捨すてて撤退 where it's not clear if it's
	-- す, てったい or すて, ったい.  only solution now is to put spaces in the "term" param
	-- if they fall between kana

	-- build up term (e.g. [[歌う|歌った]])
	local replaced = {}
	local count = 0
	term = str_gsub(term, '%]', '%]') -- escape the "]" character so that it cannot appear, example becomes [[歌う|歌った%]%]
	term = gsub(
		str_gsub(term, "%-", ""),
		kanji_pattern .. '+',
		function(text)
			count = count + 1
			-- remove spaces
			text = str_gsub(text, ' ', '')
			table.insert(replaced, text)
			return '[' .. count .. ']'
		end
	) -- example becomes [[[1]う|[2]った%]%]

	
	while str_find(term, '%[%[[^|]*%[%d+%][^|]*|') do
		term = str_gsub(
			term,
			'(%[%[[^|]*)%[(%d+)%]([^|]*|)',
			function(a,b,c)
				return a .. replaced[tonumber(b)] .. c
			end
		)
	end
	 -- example becomes [[歌う|[2]った%]%]
	
	-- anchor pattern at ends of string, because quantifiers are non-greedy
	pattern = "^" .. pattern .. "$"
	
	-- apply that pattern to the kana to collect the rubies
	-- if this fails, try it without spaces
	if find(kana, pattern) == nil then
		kana = str_gsub(kana, ' ', '')
		if not find(kana, pattern) then
			mw.log("failed match:", "\n", kana, #kana, "\n", pattern, #pattern, "\n", orig_term, #orig_term)
			error("The pattern did not match the kana.")
		end
	end
	
	local ruby = { match(kana, pattern) }
	if require("Module:fun").some(function(kana) return kana:find("^ +$") end, ruby) then
		-- [[Special:WhatLinksHere/Template:tracking/ja/ruby spaces]]
		track('ruby spaces')
		mw.log('One of the kana in the ruby table derived from ' .. kana .. ' contains nothing but spaces.')
	end
	-- local ruby = {}
	-- for c in gmatch(kana, pattern) do table.insert(ruby, c) end

	-- find the kanji strings again and combine them with their ruby to make the <ruby> markup
	local kanji_segments = {}
	for c in string.gmatch(term, '%[(%d+)%]') do
		table.insert(kanji_segments, replaced[tonumber(c)])
	end
	
	if #kanji_segments ~= #ruby then
		mw.logObject(kanji_segments)
		mw.logObject(ruby)
		error("There are " .. #kanji_segments .. " kanji segments but only " .. #ruby .. " ruby segments. There should be an equal number of each.")
	end
	
	for i, kanji_segment in pairs(kanji_segments) do
		if not ruby[i] then
			error('No ruby for kanji segment "' .. kanji_segment .. '".')
		end
		
		local kanji, kana
		if mw.ustring.len(kanji_segment) > 1 and mw.ustring.len(kanji_segment) == mw.ustring.len(ruby[i]) then
			-- Split kanji and kana into individual characters.
			kanji = mw.text.split(kanji_segment, "")
			kana = mw.text.split(ruby[i], "")
		else
			kanji, kana = { kanji_segment }, { ruby[i] }
		end
		
		--[[
			Apportions kana to kanji based on phonological rules.
			Moraic nasal and sokuon are grouped with the previous kana,
			then sequences containing long vowels are grouped together if
			necessary.
			This captures many of the easier cases.
			漢字(かんじ)	京都(きょうと)		一気(いっき)
				↓				↓					↓
			漢(かん)字(じ)	京(きょう)都(と)	一(いっ)気(き)
		]]
		if length(kanji_segment) > 1 and not find(ruby[i], "[ァ-ヶ]") then
			local value1, value2 = require("Module:User:Erutuon/ja").divideKana(kanji_segment, ruby[i])
			if value1 and value2 and #value1 == #value2 then
				kanji, kana = value1, value2
			end
		end
		
		local ruby_string = {}
		for i = 1, #kanji do
			-- To prevent, for instance, "stop" being annotated with "stop" in [[言う]].
			if kanji[i] == kana[i] then
				table.insert(ruby_string, kanji[i])
			else
				table.insert(ruby_string, "<ruby>" .. kanji[i] .. "<rp>&nbsp;(</rp><rt>" .. kana[i] .. "</rt><rp>) </rp></ruby>")
			end
		end
		table.insert(ruby_markup, table.concat(ruby_string))
	end

	count = 0
	term = str_gsub(term, '%[%d+%]', function()
		count = count + 1
		return ruby_markup[count]
	end)

	term = str_gsub(term, '%%%]', ']')
	term = str_gsub(term, '%%', '')
	term = str_gsub(term, ' ', '')
	
	term = str_gsub(term,
		"㊟(&+)㊟",
		function(ampersands)
			return escaped1[#ampersands]
		end)
	
	term = str_gsub(term, "&&(.-)&&", "%1")
	
	--done
	return enlarge(term)
end

-- do the work of Template:ja-kanji
-- function export.kanji(frame)
-- 	local pagename = mw.title.getCurrentTitle().text
-- 	-- only do this if this entry is a kanji page and not some user's page
-- 	if find(pagename, "[㐀-䶵一-鿌" .. compat_ideo .. "𠀀-𯨟]") then
-- 		local params = {
-- 			grade = {},
-- 			rs = {},
-- 			shin = {},
-- 			kyu = {},
-- 			head = {},
-- 		}
-- 		local args = require("Module:parameters").process(frame:getParent().args, params)
		
-- 		local rs = args["rs"] or require("Module:zh-sortkey").makeSortKey(pagename, "ja")
-- 		local shin = args["shin"]
-- 		local kyu = args["kyu"]
-- 		local head = args["head"]
		
-- 		local grade_replacements = {
-- 			c = "7",
-- 			n = "8",
-- 			uc = "9",
-- 			r = "0",
-- 		}
-- 		local grade = tonumber(args["grade"])
-- 		grade = grade_replacements[grade] or grade

-- 		local wikitext = {}
-- 		local categories = {}

-- 		local catsort = rs or pagename

-- 		-- display the kanji itself at the top at 275% size
-- 		table.insert(wikitext, '<div><span lang="ja" class="Jpan" style="font-size:275%; line-height:1;">' .. (args["head"] or pagename) .. '</span></div>')

-- 		-- display information for the grade

-- 		-- if grade was not specified, determine it now
-- 		if not grade then
-- 			grade = export.kanji_grade(pagename)
-- 		end
		
-- 		local in_parenthesis = {}
-- 		local grade_links = {
-- 			[1] = "[[w:Kyōiku kanji|grade 1 “Kyōiku” kanji]]",
-- 			[2] = "[[w:Kyōiku kanji|grade 2 “Kyōiku” kanji]]",
-- 			[3] = "[[w:Kyōiku kanji|grade 3 “Kyōiku” kanji]]",
-- 			[4] = "[[w:Kyōiku kanji|grade 4 “Kyōiku” kanji]]",
-- 			[5] = "[[w:Kyōiku kanji|grade 5 “Kyōiku” kanji]]",
-- 			[6] = "[[w:Kyōiku kanji|grade 6 “Kyōiku” kanji]]",
-- 			[7] = "[[w:Jōyō kanji|common “Jōyō” kanji]]",
-- 			[8] = "[[w:Jinmeiyō kanji|“Jinmeiyō” kanji used for names]]",
-- 			[9] = "[[w:Hyōgai kanji|uncommon “Hyōgai” kanji]]",
-- 			[0] = "[[w:Radical_(Chinese_character)|Radical]]",
-- 		}
-- 		if grade_links[grade] then
-- 			table.insert(in_parenthesis, grade_links[grade])
-- 		else
-- 			table.insert(categories, "[[Category:Japanese kanji missing grade|" .. catsort .. "]]")
-- 		end

-- 		-- link to shinjitai if shinjitai was specified, and link to kyujitai if kyujitai was specified

-- 		if kyu then
-- 			table.insert(in_parenthesis, '[[shinjitai]] kanji, [[kyūjitai]] form <span lang="ja" class="Jpan">[[' .. kyu .. '#Japanese|' .. kyu .. ']]</span>')
-- 		elseif shin then
-- 			table.insert(in_parenthesis, '[[kyūjitai]] kanji, [[shinjitai]] form <span lang="ja" class="Jpan">[[' .. shin .. '#Japanese|' .. shin .. ']]</span>')
-- 		end
-- 		table.insert(wikitext, "''(" .. table.concat(in_parenthesis, ",&nbsp;") .. "'')")

-- 		-- add categories
-- 		table.insert(categories, "[[Category:Japanese Han characters|" .. catsort .. "]]")
-- 		local grade_categories = {
-- 			[1] = "Grade 1 kanji",
-- 			[2] = "Grade 2 kanji",
-- 			[3] = "Grade 3 kanji",
-- 			[4] = "Grade 4 kanji",
-- 			[5] = "Grade 5 kanji",
-- 			[6] = "Grade 6 kanji",
-- 			[7] = "Common kanji",
-- 			[8] = "Kanji used for names",
-- 			[9] = "Uncommon kanji",
-- 			[0] = "CJKV radicals",
-- 		}
-- 		table.insert(categories, "[[Category:" .. (grade_categories[grade] or error("The grade " .. grade .. " is invalid.")) .. "|" .. (grade == "0" and " " or catsort) .. "]]")

-- 		-- error category
-- 		if not rs then
-- 			table.insert(categories, "[[Category:Japanese kanji missing radical and strokes]]")
-- 		end

-- 		return table.concat(wikitext, "") .. table.concat(categories, "\n")
-- 	end
-- end

local grade1_pattern = ('[' .. data.grade1 .. ']')
local grade2_pattern = ('[' .. data.grade2 .. ']')
local grade3_pattern = ('[' .. data.grade3 .. ']')
local grade4_pattern = ('[' .. data.grade4 .. ']')
local grade5_pattern = ('[' .. data.grade5 .. ']')
local grade6_pattern = ('[' .. data.grade6 .. ']')
local secondary_pattern = ('[' .. data.secondary .. ']')
local jinmeiyo_kanji_pattern = ('[' .. data.jinmeiyo_kanji .. ']')
local hyogaiji_pattern = ('[^' .. data.joyo_kanji .. data.jinmeiyo_kanji .. ']')

function export.kanji_grade(kanji)
	if type(kanji) == "table" then
		kanji = kanji.args[1]
	end

	if find(kanji, hyogaiji_pattern) then return 9
	elseif find(kanji, jinmeiyo_kanji_pattern) then return 8
	elseif find(kanji, secondary_pattern) then return 7
	elseif find(kanji, grade6_pattern) then return 6
	elseif find(kanji, grade5_pattern) then return 5
	elseif find(kanji, grade4_pattern) then return 4
	elseif find(kanji, grade3_pattern) then return 3
	elseif find(kanji, grade2_pattern) then return 2
	elseif find(kanji, grade1_pattern) then return 1
	end

	return false
end

-- function export.new(frame)
-- 	local args = frame:getParent().args

-- 	local function waapuro_r_to_kana(text)
-- 		return require("Module:typing-aids").replace{"ja", text}
-- 	end

-- 	local result = "==Japanese=="

-- 	if args["defs"] then
-- 		result = result .. "\n{{DEFAULTSORT:" .. args["defs"] .. "}}"
-- 	end
-- 	if args["wp"] then
-- 		result = result .. "\n{{wp|lang=ja" .. (args["wp"] ~= "y" and "|" .. args["wp"] or "") .. "}}"
-- 	end
-- 	wp_count = 2
-- 	while args["wp" .. wp_count] do
-- 		result = result .. "\n{{wp|lang=ja|" .. args["wp" .. wp_count] .. "}}"
-- 		wp_count = wp_count + 1
-- 	end
	
-- 	if args["swp"] then
-- 		result = result .. "\n{{swp|lang=ja" .. (args["swp"] ~= "y" and "|" .. args["swp"] or "") .. "}}"
-- 	end
-- 	swp_count = 2
-- 	while args["swp" .. swp_count] do
-- 		result = result .. "\n{{swp|lang=ja|" .. args["swp" .. swp_count] .. "}}"
-- 		swp_count = swp_count + 1
-- 	end
	
-- 	text = args[1] ~= "" and args[1] or pagename
-- 	text = gsub(text, "%-", "|")
-- 	text = waapuro_r_to_kana(text)

-- 	local function make_tab(original, yomi)
-- 		output_text = ""
-- 		original = gsub(original, " ", "|")
-- 		original = gsub(original, "%.", "|")
-- 		original = gsub(original, "%^", "")
-- 		if find(original, "<") then
-- 			for word in gmatch(original, "<([^>]+)>") do
-- 				output_text = output_text .. "|" .. word
-- 			end
-- 			yomi = yomi or "k"
-- 		else
-- 			output_text = gsub(original, ">([1-9])", "|k%1=")
-- 			output_text = find(output_text, "|") and "|" .. output_text or false
-- 		end
-- 		yomi = yomi or "o"
-- 		return "\n{{ja-kanjitab" .. (output_text or "") .. (yomi == "n" and "" or "|yomi=" .. yomi) .. (args["sork"] and "|sort=" .. args["sork"] or sortkey or "") .. (args["r"] and "|r=" .. args["r"] or "") .. "}}", yomi
-- 	end
-- 	if find(pagename, "[㐀-䶵一-鿌" .. compat_ideo .. "𠀀-𯨟]") then
-- 		to_add, yomi = make_tab(text, args["yomi"])
-- 		result = result .. to_add
-- 	end

-- 	if find(text, "<") then
-- 		text = gsub(text, "[<>]", "")
-- 	else
-- 		text = gsub(text, "^[^>|]+>%d+([^>|]+)", "%1")
-- 		text = gsub(text, "|[^>|]+>%d+([^>|]+)", "%1")
-- 		text = gsub(text, "([あかがさざただなはばぱまやらわ])|(あ)", "%1.%2")
-- 		text = gsub(text, "([いきぎしじちぢにひびぴみり])|(い)", "%1.%2")
-- 		text = gsub(text, "([うくぐすずつづぬふむゆる])|(う)", "%1.%2")
-- 		text = gsub(text, "([えけげせぜてでねへめれ])|([えい])", "%1.%2")
-- 		text = gsub(text, "([おこごそぞとどのほぼぽもよろ])|([おう])", "%1.%2")
-- 		text = gsub(text, "|", "")
-- 	end
	
-- 	if args["wpd"] then
-- 		result = result .. "\n{{swp|lang=ja" .. (args["wpd"] ~= "y" and "|" .. args["wpd"] or "") .. "}}"
-- 	end
-- 	wpd_count = 2
-- 	while args["wpd" .. wpd_count] do
-- 		result = result .. "\n{{swp|lang=ja|" .. args["wpd" .. wpd_count] .. "}}"
-- 		wpd_count = wpd_count + 1
-- 	end
	
-- 	local function other(class, title, args)
-- 		local code, i = "", 2
		
-- 		if args[class] then
-- 			code = code .. "\n\n===" .. title .. "===\n* {{ja-l|" .. args[class] .. "}}"

-- 			while args[class .. i] do
-- 				code = code .. "\n* {{ja-l|" .. args[class .. i] .. "}}"
-- 				i = i + 1
-- 			end
-- 		end

-- 		code = gsub(code, "{{ja%-l\|([^%|%}]+)[:：]", "{{ja-r|%1|") -- change something like "{{ja-l|辞典:じてん}}" to "{{ja-r|辞典|じてん}}"
-- 		code = gsub(code, "{{ja%-l\|([ぁ-ー ^%%.]+)}}", "{{ja-r|%1}}") -- change something like "{{ja-l|じてん}}" to "{{ja-r|じてん}}"

-- 		return code
-- 	end

-- 	result = result .. other("alt", "Alternative forms", args)

-- 	sortkey = export.script(text) == "Kana" and export.sort(text) or false
-- 	if sortkey and sortkey == "|sort=" .. text then
-- 		sortkey = false
-- 	end

-- 	if args["d"] or args["e"] or args["we1"] or args["yo1"] or args["b"] or args["lb"] or args["c"] or args["co1"] or args["pr1"] or args["su1"] then
-- 		result = result .. "\n\n===Etymology===\n"
-- 		if args["we1"] then
-- 			result = result .. "{{waei|" .. args["we1"] .. "|" .. args["we2"]
-- 						we_count = 3
-- 						while args["we" .. we_count] do
-- 						      result = result .. "|" .. args["we" .. we_count]
-- 						      we_count = we_count + 1
-- 						end
-- 			result = result .. (args["defs"] and "" or args["sort"] and "|sort=" .. args["sort"] or sortkey or "") .. "}}"
-- 			if args["pr1"] then
-- 				result = result .. ", equivalent to {{pre|ja|" .. args["pr1"] .. "|" .. args["pr2"] .. (args["tr1"] and "|tr1=" .. args["tr1"] or "") .. (args["tr2"] and "|tr2=" .. args["tr2"] or "") .. (args["pos1"] and "|pos1=" .. args["pos1"] or "") .. (args["pos2"] and "|pos2=" .. args["pos2"] or "") .. (args["t1"] and "|t1=" .. args["t1"] or "") .. (args["t2"] and "|t2=" .. args["t2"] or "") .. (args["defs"] and "" or args["sort"] and "|sort=" .. args["sort"] or sortkey or "") .. "}}"
-- 			else
-- 				if args["su1"] then
-- 					result = result .. ", equivalent to {{suf|ja|" .. args["su1"] .. "|" .. args["su2"] .. (args["tr1"] and "|tr1=" .. args["tr1"] or "") .. (args["tr2"] and "|tr2=" .. args["tr2"] or "") .. (args["pos1"] and "|pos1=" .. args["pos1"] or "") .. (args["pos2"] and "|pos2=" .. args["pos2"] or "") .. (args["t1"] and "|t1=" .. args["t1"] or "") .. (args["t2"] and "|t2=" .. args["t2"] or "") .. (args["defs"] and "" or args["sort"] and "|sort=" .. args["sort"] or sortkey or "") .. "}}"
-- 				else
-- 					if args["co1"] then
-- 						result = result .. ", equivalent to {{af|ja|" .. args["co1"] .. (args["tr1"] and "|tr1=" .. args["tr1"] or "") .. (args["pos1"] and "|pos1=" .. args["pos1"] or "") .. (args["t1"] and "|t1=" .. args["t1"] or "") .. "|" .. args["co2"] .. (args["tr2"] and "|tr2=" .. args["tr2"] or "") .. (args["pos2"] and "|pos2=" .. args["pos2"] or "") .. (args["t2"] and "|t2=" .. args["t2"] or "")
-- 						co_count = 3
-- 						while args["co" .. co_count] do
-- 						      result = result .. "|" .. args["co" .. co_count] .. (args["tr" .. co_count] and "|tr" .. co_count .. "=" .. args["tr" .. co_count] or "") .. (args["pos" .. co_count] and "|pos" .. co_count .. "=" .. args["pos" .. co_count] or "") .. (args["t" .. co_count] and "|t" .. co_count .. "=" .. args["t" .. co_count] or "")
-- 						      co_count = co_count + 1
-- 						end
-- 						result = result .. (args["defs"] and "" or args["sort"] and "|sort=" .. args["sort"] or sortkey or "") .. "}}"
-- 			end
-- 			end
-- 			end
-- 		else
-- 		if args["yo1"] then
-- 							result = result .. "{{yoji|" .. args["yo1"] .. "|" .. args["yo2"] .. (args["yo3"] and "|" .. args["yo3"] or "") .. (args["yo4"] and "|" .. args["yo4"] or "") .. (args["tr1"] and "|tr1=" .. args["tr1"] or "") .. (args["tr2"] and "|tr2=" .. args["tr2"] or "") .. (args["tr3"] and "|tr3=" .. args["tr3"] or "") .. (args["tr4"] and "|tr4=" .. args["tr4"] or "") .. (args["pos1"] and "|pos1=" .. args["pos1"] or "") .. (args["pos2"] and "|pos2=" .. args["pos2"] or "") .. (args["pos3"] and "|pos3=" .. args["pos3"] or "") .. (args["pos4"] and "|pos4=" .. args["pos4"] or "") .. (args["t1"] and "|t1=" .. args["t1"] or "") .. (args["t2"] and "|t2=" .. args["t2"] or "") .. (args["t3"] and "|t3=" .. args["t3"] or "") .. (args["t4"] and "|t4=" .. args["t4"] or "") .. (args["defs"] and "" or args["sort"] and "|sort=" .. args["sort"] or sortkey or "") .. "}}"
-- 		else
-- 		if args["c"] then
-- 							result = result .. "{{cal|ja|" .. (args["cl"] or "en") .. (args["c"] and "|" .. args["c"] or "") .. (args["tr"] and "|tr=" .. args["tr"] or "") .. (args["t"] and "||" .. args["t"] or "") .. (args["lit"] and "|lit=" .. args["lit"] or "") .. (args["pos"] and "|pos=" .. args["pos"] or "") .. (args["g"] and "|g=" .. args["g"] or "") .. (args["defs"] and "" or args["sort"] and "|sort=" .. args["sort"] or sortkey or "") .. "}}"
-- 			if args["pr1"] then
-- 				result = result .. ", equivalent to {{pre|ja|" .. args["pr1"] .. "|" .. args["pr2"] .. (args["tr1"] and "|tr1=" .. args["tr1"] or "") .. (args["tr2"] and "|tr2=" .. args["tr2"] or "") .. (args["pos1"] and "|pos1=" .. args["pos1"] or "") .. (args["pos2"] and "|pos2=" .. args["pos2"] or "") .. (args["t1"] and "|t1=" .. args["t1"] or "") .. (args["t2"] and "|t2=" .. args["t2"] or "") .. (args["defs"] and "" or args["sort"] and "|sort=" .. args["sort"] or sortkey or "") .. "}}"
-- 			else
-- 				if args["su1"] then
-- 					result = result .. ", equivalent to {{suf|ja|" .. args["su1"] .. "|" .. args["su2"] .. (args["tr1"] and "|tr1=" .. args["tr1"] or "") .. (args["tr2"] and "|tr2=" .. args["tr2"] or "") .. (args["pos1"] and "|pos1=" .. args["pos1"] or "") .. (args["pos2"] and "|pos2=" .. args["pos2"] or "") .. (args["t1"] and "|t1=" .. args["t1"] or "") .. (args["t2"] and "|t2=" .. args["t2"] or "") .. (args["defs"] and "" or args["sort"] and "|sort=" .. args["sort"] or sortkey or "") .. "}}"
-- 				else
-- 					if args["co1"] then
-- 						result = result .. ", equivalent to {{af|ja|" .. args["co1"] .. (args["tr1"] and "|tr1=" .. args["tr1"] or "") .. (args["pos1"] and "|pos1=" .. args["pos1"] or "") .. (args["t1"] and "|t1=" .. args["t1"] or "") .. "|" .. args["co2"] .. (args["tr2"] and "|tr2=" .. args["tr2"] or "") .. (args["pos2"] and "|pos2=" .. args["pos2"] or "") .. (args["t2"] and "|t2=" .. args["t2"] or "")
-- 						co_count = 3
-- 						while args["co" .. co_count] do
-- 						      result = result .. "|" .. args["co" .. co_count] .. (args["tr" .. co_count] and "|tr" .. co_count .. "=" .. args["tr" .. co_count] or "") .. (args["pos" .. co_count] and "|pos" .. co_count .. "=" .. args["pos" .. co_count] or "") .. (args["t" .. co_count] and "|t" .. co_count .. "=" .. args["t" .. co_count] or "")
-- 						      co_count = co_count + 1
-- 						end
-- 						result = result .. (args["defs"] and "" or args["sort"] and "|sort=" .. args["sort"] or sortkey or "") .. "}}"
-- 			end
-- 			end
-- 			end
-- 						else
-- 			if args["pr1"] then
-- 				result = result .. "From {{pre|ja|" .. args["pr1"] .. "|" .. args["pr2"] .. (args["tr1"] and "|tr1=" .. args["tr1"] or "") .. (args["tr2"] and "|tr2=" .. args["tr2"] or "") .. (args["pos1"] and "|pos1=" .. args["pos1"] or "") .. (args["pos2"] and "|pos2=" .. args["pos2"] or "") .. (args["t1"] and "|t1=" .. args["t1"] or "") .. (args["t2"] and "|t2=" .. args["t2"] or "") .. (args["defs"] and "" or args["sort"] and "|sort=" .. args["sort"] or sortkey or "") .. "}}"
-- 			else
-- 				if args["su1"] then
-- 					result = result .. "From {{suf|ja|" .. args["su1"] .. "|" .. args["su2"] .. (args["tr1"] and "|tr1=" .. args["tr1"] or "") .. (args["tr2"] and "|tr2=" .. args["tr2"] or "") .. (args["pos1"] and "|pos1=" .. args["pos1"] or "") .. (args["pos2"] and "|pos2=" .. args["pos2"] or "") .. (args["t1"] and "|t1=" .. args["t1"] or "") .. (args["t2"] and "|t2=" .. args["t2"] or "") .. (args["defs"] and "" or args["sort"] and "|sort=" .. args["sort"] or sortkey or "") .. "}}"
-- 				else
-- 					if args["co1"] then
-- 						result = result .. "From {{af|ja|" .. args["co1"] .. (args["tr1"] and "|tr1=" .. args["tr1"] or "") .. (args["pos1"] and "|pos1=" .. args["pos1"] or "") .. (args["t1"] and "|t1=" .. args["t1"] or "") .. "|" .. args["co2"] .. (args["tr2"] and "|tr2=" .. args["tr2"] or "") .. (args["pos2"] and "|pos2=" .. args["pos2"] or "") .. (args["t2"] and "|t2=" .. args["t2"] or "")
-- 						co_count = 3
-- 						while args["co" .. co_count] do
-- 						      result = result .. "|" .. args["co" .. co_count] .. (args["tr" .. co_count] and "|tr" .. co_count .. "=" .. args["tr" .. co_count] or "") .. (args["pos" .. co_count] and "|pos" .. co_count .. "=" .. args["pos" .. co_count] or "") .. (args["t" .. co_count] and "|t" .. co_count .. "=" .. args["t" .. co_count] or "")
-- 						      co_count = co_count + 1
-- 						end
-- 						result = result .. (args["defs"] and "" or args["sort"] and "|sort=" .. args["sort"] or sortkey or "") .. "}}"
-- 					else
-- 						if args["b"] then
-- 							result = result .. "From {{bor|ja|" .. (args["bl"] or "en") .. (args["b"] and "|" .. args["b"] or "") .. (args["tr"] and "|tr=" .. args["tr"] or "") .. (args["t"] and "||" .. args["t"] or "") .. (args["lit"] and "|lit=" .. args["lit"] or "") .. (args["pos"] and "|pos=" .. args["pos"] or "") .. (args["g"] and "|g=" .. args["g"] or "") .. (args["defs"] and "" or args["sort"] and "|sort=" .. args["sort"] or sortkey or "") .. "}}"
-- 						else
-- 						if args["lb"] then
-- 							result = result .. "{{lbor|ja|" .. (args["lbl"] or "grc") .. (args["lb"] and "|" .. args["lb"] or "") .. (args["tr"] and "|tr=" .. args["tr"] or "") .. (args["t"] and "||" .. args["t"] or "") .. (args["lit"] and "|lit=" .. args["lit"] or "") .. (args["pos"] and "|pos=" .. args["pos"] or "") .. (args["g"] and "|g=" .. args["g"] or "") .. (args["defs"] and "" or args["sort"] and "|sort=" .. args["sort"] or sortkey or "") .. "}}"
-- 						else
-- 							result = result .. (args["e"] or
-- 								("From {{der|ja|" .. (args["dl"] or "en") .. (args["d"] and "|" .. args["d"] or "") .. (args["tr"] and "|tr=" .. args["tr"] or "") .. (args["t"] and "||" .. args["t"] or "") .. (args["lit"] and "|lit=" .. args["lit"] or "") .. (args["pos"] and "|pos=" .. args["pos"] or "") .. (args["g"] and "|g=" .. args["g"] or "") .. (args["defs"] and "" or args["sort"] and "|sort=" .. args["sort"] or sortkey or "") .. "}}"))
-- 						end
-- 						end
-- 						end
-- 						end
-- 					end
-- 				end
-- 			end
-- 		end
-- 							result = result .. (args["e_ref"] and args["e_ref"] or "")
-- 		end

-- 	if not args["nop"] then
-- 		result = result .. "\n\n===Pronunciation===\n{{ja-pron" .. (args[1] ~= "" and "|" .. gsub(text, '%^', '') or "")
-- 		if args["y"] == "n" or yomi == "n" then
-- 			result = result .. ""
-- 		else if args["y"] and args["y"] ~= "n" then
-- 			result = result .. "|y=" .. args["y"]
-- 		else if yomi then
-- 			if yomi == "irr" then
-- 			result = result .. "|y=i"
-- 			else
-- 				result = result .. "|y=" .. yomi
-- 			end
-- 			end
-- 		end
-- 		end
-- 		result = result .. (args["acc"] and "|acc=" .. args["acc"] or "") .. (args["acc_ref"] and "|acc_ref=" .. args["acc_ref"] or "")
-- 		acc_count = 2
-- 		while args["acc" .. acc_count] do
-- 		      result = result .. "|acc" .. acc_count .. "=" .. args["acc" .. acc_count] .. (args["acc" .. acc_count .. "_ref"] and "|acc" .. acc_count .. "_ref=" .. args["acc" .. acc_count .. "_ref"] or "")
-- 		      acc_count = acc_count + 1
-- 		end
-- 		result = result .. (args["dev"] and "|dev=" .. args["dev"] or "") .. "}}"
--         if args["hmp"] then
--            if yomi and not (yomi == "n" or y == "n") then result = result .. "\n** "
--            else result = result .. "\n* "
--                end
--         result = result .. (args["hmp"] and "{{hmp|" .. args["hmp"] or "")
-- 		hmp_count = 2
--         while args["hmp" .. hmp_count] do
-- 		      result = result .. "|" .. args["hmp" .. hmp_count]
-- 		      hmp_count = hmp_count + 1
--         end
--         result = result .. (args["defs"] and "" or args["sort"] and "|sort=" .. args["sort"] or sortkey or "") .. "|lang=ja}}"
--                end
-- 	end

-- 	local pos = args[2] ~= "" and args[2] or "n"
-- 	local pos_table = {
-- 		[""] = { "Noun", "noun", true },
-- 		["n"] = { "Noun", "noun", true },
-- 		["s"] = { "Noun", "noun", true, "Verb", "verb-suru" },
-- 		["noun"] = { "Noun", "noun", true },
-- 		["suru"] = { "Noun", "noun", true, "Verb", "verb-suru" },
-- 		["an"] = { "Adjective", "adj", true, "Noun", "noun" },
-- 		["anoun"] = { "Adjective", "adj", true, "Noun", "noun" },
-- 		["v"] = { "Verb", "verb", true },
-- 		["verb"] = { "Verb", "verb", true },
-- 		["vform"] = { "Verb", "verb form", true },
-- 		["verb form"] = { "Verb", "verb form", true },
-- 		["a"] = { "Adjective", "adj", true },
-- 		["adj"] = { "Adjective", "adj", true },
-- 		["adjective"] = { "Adjective", "adj", true },
-- 		["adv"] = { "Adverb", "adverb", false },
-- 		["adverb"] = { "Adverb", "adverb", false },
-- 		["as"] = { "Adverb", "adverb", false, "Verb", "verb-suru" },
-- 		["pron"] = { "Pronoun", "pronoun", false },
-- 		["pronoun"] = { "Pronoun", "pronoun", false },
-- 		["pn"] = { "Proper noun", "proper", false },
-- 		["propn"] = { "Proper noun", "proper", false },
-- 		["proper"] = { "Proper noun", "proper", false },
-- 		["proper noun"] = { "Proper noun", "proper", false },
-- 		["ph"] = { "Phrase", "phrase", true },
-- 		["phrase"] = { "Phrase", "phrase", true },
-- 		["interjection"] = { "Interjection", "interjection", false },
-- 		["intj"] = { "Interjection", "interjection", false },
-- 		["conj"] = { "Conjunction", "conjunction", false },
-- 		["part"] = { "Particle", "particle", false },
-- 		["prep"] = { "Preposition", "preposition", false },
-- 		["suf"] = { "Suffix", "suffix", false },
-- 		["suffix"] = { "Suffix", "suffix", false },
-- 		["pref"] = { "Prefix", "prefix", false },
-- 		["prefix"] = { "Prefix", "prefix", false },
-- 		["prov"] = { "Proverb", "proverb", false },
-- 		["idiom"] = { "Idiom", "idiom", false },
-- 	}

-- 	result = result .. "\n\n===" .. pos_table[pos][1] .. "===\n{{ja-" .. 
-- 		(not pos_table[pos][3] and "pos|" or "") .. pos_table[pos][2] ..
-- 		(args[1] ~= "" and "|" .. text or "") .. 
-- 		(args["head"] and "|head=" .. args["head"] or "") ..
-- 		(args["cnt"] and "|count=" .. args["cnt"] or "") .. 
-- 		(args["kyu"] and "|kyu=" .. args["kyu"] or "") .. 
-- 		(args["sin"] and "|shin=" .. args["sin"] or "") .. 
-- 		(args["ak"] and "|" .. waapuro_r_to_kana(args["ak"]) or "") .. 
-- 		(args["ak2"] and "|" .. waapuro_r_to_kana(args["ak2"]) or "") .. 
-- 		(args["ak3"] and "|" .. waapuro_r_to_kana(args["ak3"]) or "") .. 
-- 		(args["rom"] and "|rom=" .. args["rom"] or "") .. 
-- 		(args["hh"] and "|hhira=" .. waapuro_r_to_kana(args["hh"]) or "") .. 
-- 		(args["hk"] and "|hkata=" .. waapuro_r_to_kana(args["hk"]) or "")

-- 	if pos_table[pos][1] == "Adjective" then
-- 		result = result .. "|infl=" .. (args["infl"] and args["infl"] or "na")
-- 	end

-- 	result = result .. (args["type"] and "|type=" .. args["type"] or "") .. (args["tran"] and "|tran=" .. args["tran"] or "") .. "}}"
-- 	result = result .. "\n\n# " .. (args[3] or "{{rfdef|ja}}")

-- 	if args["eg"] then
-- 		result = result .. "\n#" .. args["eg"]
-- 	end
-- 	eg_count = 2
-- 	while args["eg" .. eg_count] do
-- 		result = result .. "\n#" .. args["eg" .. eg_count]
-- 		eg_count = eg_count + 1
-- 	end

-- 	if pos_table[pos][1] == "Adjective" then
-- 		result = result .. "\n\n====Inflection====\n"
-- 		if args["infl"] == "i" or args["infl"] == "い" then
-- 			result = result .. "{{ja-i" .. (args[1] ~= "" and "|" .. sub(text, 1, -2) or "") .. "}}"
-- 		else
-- 			result = result .. "{{ja-na" .. (args[1] ~= "" and "|" .. text or "") .. "}}"
-- 		end
-- 	end

-- 	if pos_table[pos][2] == "verb" then
-- 		result = result .. "\n\n====Conjugation====\n{{ja-"
-- 		penul, cons = text, text
-- 		penul, cons = sub(penul, -2, -2), sub(cons, -1, -1)
-- 		penul, cons = export.hira_to_kata(penul), export.hira_to_kata(cons)
-- 		penul, cons = gsub(penul, ".", data.kr), gsub(cons, ".", data.kr)
-- 		penul, cons = sub(penul, -1, -1), sub(cons, 1, 1)
-- 		if cons == "u" then
-- 			cons = ""
-- 		elseif cons == "c" then
-- 			cons = "ts"
-- 		end
-- 		if args["type"] == "2" then
-- 			result = result .. "ichi"
-- 		else
-- 			result = result .. "go-" .. cons .. "u"
-- 		end

-- 		result = result .. (args[1] ~= "" and "|" .. sub(text, 1, -2) or "") .. "}}"
-- 	end

-- 	if pos_table[pos][4] and args[4] ~= "" then
-- 		result = result .. "\n\n===" .. pos_table[pos][4] .. "===\n{{ja-" .. pos_table[pos][5] .. (args[1] ~= "" and "|" .. text or "") ..
-- 			(args["head"] and "|head=" .. args["head"] or "") ..
-- 			(args["cnt"] and "|count=" .. args["cnt"] or "") .. 
-- 			(args["kyu"] and "|kyu=" .. args["kyu"] or "") .. 
-- 			(args["sin"] and "|shin=" .. args["sin"] or "") .. 
-- 			(args["ak"] and "|" .. waapuro_r_to_kana(args["ak"]) or "") .. 
-- 			(args["ak2"] and "|" .. waapuro_r_to_kana(args["ak2"]) or "") .. 
-- 			(args["ak3"] and "|" .. waapuro_r_to_kana(args["ak3"]) or "") .. 
-- 			(args["rom"] and "|rom=" .. args["rom"] or "") .. 
-- 			(args["hh"] and "|hhira=" .. waapuro_r_to_kana(args["hh"]) or "") .. 
-- 			(args["hk"] and "|hkata=" .. waapuro_r_to_kana(args["hk"]) or "") ..
-- 			(args["type"] and "|type=" .. args["type"] or "") .. (args["tran"] and "|tr=" .. args["tran"] or "") .. "}}\n\n# " .. (args[4] or "{{rfdef|ja}}")

-- 		if pos_table[pos][4] == "Verb" then
-- 			result = result .. "\n\n====Conjugation====\n{{ja-suru" .. (args[1] ~= "" and "|" .. text or "") .. "}}"
-- 		end
-- 	end

-- 	if args["use"] then
-- 		result = result .. "\n\n====Usage notes====\n* " .. args["use"]
-- 	end

-- 	result = result .. other("syn", "=Synonyms=", args)
-- 	result = result .. other("ant", "=Antonyms=", args)
-- 	result = result .. other("der", "=Derived terms=", args)
-- 	result = result .. other("rel", "=Related terms=", args)

-- 	if args["dzh"] or args["den"] or args["dko"] or args["dvi"] then
-- 		result = result .. "\n\n===Descendants===\n" .. (args["dzh"] and "* {{desc|zh|" .. args["dzh"] .. (args["dzhb"] and "|bor=y" or "") .. (args["dzhd"] and "|der=y" or "") .. (args["dzhc"] and "|clq=y" or "") .. "}}" or "")
-- 		if args["dzh"] then
-- 			if args["den"] or args["dko"] or args["dvi"] then
-- 				result = result .. "\n"
-- 			end
-- 		end
-- 		result = result .. (args["den"] and "* {{desc|en|" .. args["den"] .. (args["denb"] and "|bor=y" or "") .. (args["dend"] and "|der=y" or "") .. (args["denc"] and "|clq=y" or "") .. "}}" or "")
-- 		if args["den"] then
-- 			if args["dko"] or args["dvi"] then
-- 				result = result .. "\n"
-- 			end
-- 		end
-- 		result = result .. (args["dko"] and "* {{desc|ko|" .. args["dko"] .. (args["dkob"] and "|bor=y" or "") .. (args["dkod"] and "|der=y" or "") .. (args["dkoc"] and "|clq=y" or "") .. "}}" or "")
-- 		if args["dko"] then
-- 			if args["dvi"] then
-- 				result = result .. "\n"
-- 			end
-- 		end
-- 		result = result .. (args["dvi"] and "* {{desc|vi|" .. args["dvi"] .. (args["dvib"] and "|bor=y" or "") .. (args["dvid"] and "|der=y" or "") .. (args["dvic"] and "|clq=y" or "") .. "}}" or "")
-- 	end
-- 	result = result .. other("ana", "Anagrams", args)
-- 	result = result .. other("also", "See also", args)

-- 	if args["acc_ref"] or args["e_ref"] then
-- 		result = result .. "\n\n===References===\n<references/>"
-- 	end

-- 	if args["cn"] then
-- 		result = result .. "\n\n{{cln|ja|" .. args["cn"]
-- 	cn_count = 2
-- 	while args["cn" .. cn_count] do
-- 		result = result .. "|" .. args["cn" .. cn_count]
-- 		cn_count = cn_count + 1
-- 	end
-- 		result = result .. (args["defs"] and "" or args["sort"] and "|sort=" .. args["sort"] or sortkey or "") .. "}}"
-- 	end
-- 	if args["ct"] then
-- 		result = result .. (args["cn"] and "\n" or "\n\n") .. "{{C|ja|" .. args["ct"]
-- 	ct_count = 2
-- 	while args["ct" .. ct_count] do
-- 		result = result .. "|" .. args["ct" .. ct_count]
-- 		ct_count = ct_count + 1
-- 	end
-- 		result = result .. (args["defs"] and "" or args["sort"] and "|sort=" .. args["sort"] or sortkey or "") .. "}}"
-- 	end

-- 	if args["k"] then
-- 		result = result .."\n\n----\n\n==Korean==\n{{ko-hanjatab}}\n\n===" .. pos_table[args["kp"] or "n"][1] ..
-- 			"===\n{{ko-" .. pos_table[args["kp"] or "n"][2] .. "|hangeul=" .. args["k"] .. (args["mr"] and "|mr=" .. args["mr"] or "") .. (args["yl"] and "|y=" .. args["yl"] or "") .. "}}" ..
-- 			"\n\n# {{hanja form of|" .. args["k"] .. "|" .. (args["kd"] or args[3]) .. "}}"
-- 	end

-- 	return result
-- end

return export

-- All tests passed. (refresh)

-- test_all:
-- Text	Expected	Actual
-- Passed	アイェキキェ ヴィェウィフエ	ayekikye vyewifue	ayekikye vyewifue
-- Passed	しんい	shin'i	shin'i
-- Passed	かいしょないしぎょうしょで ひょうげんされる しゃくじとしての かんじを、きょくどに そうたいかした ものである	kaishonaishigyoushode hyougensareru shakujitoshiteno kanjio, kyokudoni soutaikashita monodearu	kaishonaishigyoushode hyougensareru shakujitoshiteno kanjio, kyokudoni soutaikashita monodearu
-- Passed	かいしょないしぎょうしょで ひょうげんされる しゃくじとしての かんじを、きょくどに そうたいかした ものである	kaishonaishigyōshode hyōgensareru shakujitoshiteno kanjio, kyokudoni sōtaikashita monodearu	kaishonaishigyōshode hyōgensareru shakujitoshiteno kanjio, kyokudoni sōtaikashita monodearu
-- Passed	しんかんせん	shinkansen	shinkansen
-- Passed	こううん	kōun	kōun
-- Passed	これはテストです。	korehatesutodesu.	korehatesutodesu.
-- Passed	これ　は　テスト　です。それ　は。それ　は	kore wa tesuto desu. sore wa. sore wa	kore wa tesuto desu. sore wa. sore wa
-- Passed	^ウィキペディア　へ　^ようこそ	Wikipedia e Yōkoso	Wikipedia e Yōkoso
-- Passed	^ウィキペディア　へ　^ようこそ	Wikipedia e Yōkoso	Wikipedia e Yōkoso
-- Passed	は　うはう　う　は　う　は	wa uhau u wa u wa	wa uhau u wa u wa
-- Passed	へ　うへう　う　へ　う　へ	e uheu u e u e	e uheu u e u e
-- Passed	.は　うはう　う　.は　う　.は	ha uhau u ha u ha	ha uhau u ha u ha
-- Passed	は.　うはう　う　は.　う　は.	ha uhau u ha u ha	ha uhau u ha u ha
-- Passed	^これ ^は ^テスト ^です。^へ　へ	Kore Wa Tesuto Desu. E e	Kore Wa Tesuto Desu. E e
-- Passed	^ちょ% ^はっ%かい	Cho Hakkai	Cho Hakkai
-- Passed	てにをは	tenioha	tenioha
-- Passed	ぎゃく-ハーレム	gyaku-hāremu	gyaku-hāremu
-- Passed	ねこ-は	neko-ha	neko-ha
-- Passed	ねこ-は	neko-ha	neko-ha
-- Passed	ねこ-は の	neko-ha no	neko-ha no
-- Passed	ねこ-は の	neko-ha no	neko-ha no
-- Passed	は	ha	ha
-- Passed	は	ha	ha
-- Passed	は	ha	ha
-- Passed	それ は ね	sore wa ne	sore wa ne
-- Passed	こんにち は	konnichi wa	konnichi wa
-- Passed	それ は ね	sore wa ne	sore wa ne
-- Passed	うぉ	wo	wo
-- Passed	は は では　^はっけん　はっけん 「はっけん」 はっけん	wa wa deha Hakken hakken “hakken” hakken	wa wa deha Hakken hakken “hakken” hakken
-- Passed	は は では　^はっけん　はっけん 「はっけん」 はっけん	wa wa deha Hakken hakken “hakken” hakken	wa wa deha Hakken hakken “hakken” hakken
-- Passed	ぎゃ　ぎぃ　ぎゅ　ぎぇ　ぎょ。くぁ　くぃ　くぅ　くぇ　くぉ	gya gī gyu gye gyo. kwa kwi kū kwe kwo	gya gī gyu gye gyo. kwa kwi kū kwe kwo
-- Passed	うぁ　うぃ　うぅ　うぇ　うぉ。ヴぁ　ヴぃ　ヴ　ヴぇ　ヴぉ	wa wi ū we wo. va vi vu ve vo	wa wi ū we wo. va vi vu ve vo
-- Passed	ふぁ　ふぃ　ふ　ふぇ　ふぉ	fa fi fu fe fo	fa fi fu fe fo
-- Passed	てぃ　でぃ　とぅ　どぅ　すぁ　すぃ　しぃ　しぇ　しょ　ちぃ ぢぃ　つぉ　てぇ　てゅ　とぁ　とぃ　ふょ　てょ	ti di tu du sa si shī she sho chī jī tso tē tyu twa twi fyo tyo	ti di tu du sa si shī she sho chī jī tso tē tyu twa twi fyo tyo
-- Passed	ねぃ　ぬゃ	ni nya	ni nya
-- Passed	ねぇ、	nē,	nē,
-- Passed	シークヮーサー	shīkwāsā	shīkwāsā
-- Passed	りゃくしょう　じょうず　つみき　ツァーリ　ちゅうか　つづけて そっち　がっしょう　マッツァーリ	ryakushō jōzu tsumiki tsāri chūka tsuzukete sotchi gasshō mattsāri	ryakushō jōzu tsumiki tsāri chūka tsuzukete sotchi gasshō mattsāri
-- Passed	こー　やって。ばっさり	kō yatte. bassari	kō yatte. bassari
-- Passed	し を ぼっ.す	shi o bossu	shi o bossu
-- Passed	がーー	gāa	gāa
-- Passed	が　がー　がーー　がーーー　がーーーー　がーーーーー	ga gā gāa gāā gāāa gāāā	ga gā gāa gāā gāāa gāāā
-- Passed	じと　じっと　じっっと　じっっっと　じっっっっと　じっっっっっと	jito jitto jittto jitttto jittttto jitttttto	jito jitto jittto jitttto jittttto jitttttto
-- Passed	めっちゃ　めっっちゃ　めっっっちゃ	metcha mettcha metttcha	metcha mettcha metttcha
-- Passed	あっ　あーっ　あぁーっ　あああっっっ	a' ā' āa' āa'''	a' ā' āa' āa'''
-- Passed	はええ	haē	haē
-- Passed	まてぇぇぇ	matēē	matēē
-- Passed	あっ と いう ま に	at to iu ma ni	at to iu ma ni
-- Passed	あっ、まちがえた	a', machigaeta	a', machigaeta
-- Passed	あっ と いう ま に	at to iu ma ni	at to iu ma ni
-- Passed	だまって	damatte	damatte
-- Passed	いっぱつ の じゅうだん	ippatsu no jūdan	ippatsu no jūdan
-- Passed	じゅうにヶげつ　せきヶはら	jūnikagetsu sekigahara	jūnikagetsu sekigahara
-- Passed	じゅうにヶげつ　せきヶはら	jūnikagetsu sekigahara	jūnikagetsu sekigahara
-- Passed	いっヵげつ いっヵげつ	ikkagetsu ikkagetsu	ikkagetsu ikkagetsu
-- Passed	けんいち　にちようび　こんや	ken'ichi nichiyōbi kon'ya	ken'ichi nichiyōbi kon'ya
-- Passed	すゞき　あゝ	suzuki ā	suzuki ā
-- Passed	ほっする	hossuru	hossuru
-- Passed	みっつ	mittsu	mittsu
-- Passed	ち	chi	chi
-- Passed	めっちゃ	metcha	metcha
-- Passed	あ～ あ〜 あ〰	a~ a~ a~	a~ a~ a~
-- Passed	あ！！！！	a!!!!	a!!!!
-- Passed	200％	200%	200%
-- Passed	jyouzu　じょうず	jyouzu jōzu	jyouzu jōzu
-- Passed	^トゥットゥルー♪　^まゆしぃ☆です	Tutturū♪ Mayushī☆desu	Tutturū♪ Mayushī☆desu
-- Passed	「^だって、すてき な まち です し、それ に なんと いって も この じょうひん な ふいんき！^ザ・お-じょう-さま！^くうき も バラ の かおり が する と いう かっ！」	“Datte, suteki na machi desu shi, sore ni nanto itte mo kono jōhin na fuinki! Za o-jō-sama! Kūki mo bara no kaori ga suru to iu ka'!”	“Datte, suteki na machi desu shi, sore ni nanto itte mo kono jōhin na fuinki! Za o-jō-sama! Kūki mo bara no kaori ga suru to iu ka'!”
-- Passed	historical: づ	du	du
-- Passed	historical: ず	zu	zu
-- Passed	historical: ぢ	di	di
-- Passed	historical: じ	zi	zi
-- Passed	historical: きやう	kyau	kyau
-- Passed	historical: くゑ	kwe	kwe
-- Passed	historical: きよ	kyo	kyo
-- Passed	historical: くゐよく	kwyoku	kwyoku
-- Passed	historical: きよう	kyou	kyou
-- Passed	historical: すゐ	suwi	suwi
-- Passed	historical: おお	oo	oo
-- Passed	historical: おう	ou	ou
-- Passed	historical: はん	fan	fan
-- Passed	historical: しよう	syou	syou
-- Passed	historical: し.よう	siyou	siyou
-- Passed	historical: つ.ゑ	tuwe	tuwe
-- Passed	historical: つ	tu	tu
-- Passed	historical: ち	ti	ti
-- Passed	historical: ちや	tya	tya
-- Passed	ayekikye vyewifue	アイェキキェ ヴィェウィフエ	アイェキキェ ヴィェウィフエ
-- Passed	shinkansen	シンカンセン	シンカンセン
-- Passed	shin'i	シンイ	シンイ
-- Passed	shin'ya shinya	シンヤ シニャ	シンヤ シニャ
-- Passed	na ni nu ne no nya nyu nye nyo	ナ ニ ヌ ネ ノ ニャ ニュ ニェ ニョ	ナ ニ ヌ ネ ノ ニャ ニュ ニェ ニョ
-- Passed	bakkurasshu	バックラッシュ	バックラッシュ
-- Passed	あいこくしん愛国心メ	Hira+Kana+Hani	Hira+Kana+Hani
-- Passed	あいこくしん愛国心	Hira+Hani	Hira+Hani
-- Passed	ァー	Kana	Kana
-- Passed	あっぷるringo	Hira+Romaji	Hira+Romaji
-- Passed	ニッポン1１	Kana+Number	Kana+Number
-- Passed	ニッポンｎｉｐｐｏｎ	Kana+Romaji	Kana+Romaji
-- Passed	一つ	Hira+Hani	Hira+Hani
-- Passed	〆る	Hira+Abbreviation	Hira+Abbreviation
-- Passed	アメリカじん	あめりかじん	あめりかじん
-- Passed	うぃきぺでぃあ　デス	ウィキペディア　デス	ウィキペディア　デス
-- Passed	jsort: でーじ	てえじ'	てえじ'
-- Passed	count_morae: しゃっきんジャー	6	6
-- Passed	rm_spaces_hyphens: ishu kakutōgi sen	ishukakutōgisen	ishukakutōgisen
-- Passed	kanji_grade: 立	1	1
-- Passed	kanji_grade: 尊立	6	6
-- Passed	kanji_grade: 藉尊立	9	9
-- -- Unit tests for [[Module:ja]]. Click talk page to run tests.
-- local p = require('Module:UnitTests')
-- local m = require('Module:ja')

-- function p:k2r(original, romaji)
-- 	self:equals(original, m.kana_to_romaji(original), romaji)
-- end

-- function p:k2r_no_diacritics(original, romaji)
-- 	self:equals(original, m.kana_to_romaji(original, {no_diacritics = true}), romaji)
-- end

-- function p:k2r_hist(original, romaji)
-- 	self:equals("historical: " .. original, m.kana_to_romaji(original, {hist = true}), romaji)
-- end

-- function p:r2k(original, katakana)
-- 	self:equals(original, m.romaji_to_kata(original), katakana)
-- end

-- function p:script_detection(original, script)
-- 	self:equals(original, m.script(original), script)
-- end

-- function p:k2h(original, hiragana)
-- 	self:equals(original, m.kata_to_hira(original), hiragana)
-- end

-- function p:h2k(original, katakana)
-- 	self:equals(original, m.hira_to_kata(original), katakana)
-- end

-- function p:other(fun, original, output)
-- 	local mf

-- 	if fun == 'jsort' then mf = m.jsort
-- 	elseif fun == 'count_morae' then mf = m.count_morae
-- 	elseif fun == 'rm_spaces_hyphens' then mf = m.rm_spaces_hyphens
-- 	elseif fun == 'kanji_grade' then mf = m.kanji_grade
-- 	end

-- 	self:equals(fun .. ': ' .. original, mf(original), output)
-- end

-- function p:test_all()
-- 	self:k2r("アイェキキェ ヴィェウィフエ", "ayekikye vyewifue")
-- 	self:k2r("しんい", "shin'i")
-- 	self:k2r_no_diacritics("かいしょないしぎょうしょで ひょうげんされる しゃくじとしての かんじを、きょくどに そうたいかした ものである", "kaishonaishigyoushode hyougensareru shakujitoshiteno kanjio, kyokudoni soutaikashita monodearu")
-- 	self:k2r("かいしょないしぎょうしょで ひょうげんされる しゃくじとしての かんじを、きょくどに そうたいかした ものである", "kaishonaishigyōshode hyōgensareru shakujitoshiteno kanjio, kyokudoni sōtaikashita monodearu")
-- 	self:k2r("しんかんせん", "shinkansen")
-- 	-- ====
-- 	self:k2r("こううん", "kōun")
-- 	self:k2r("これはテストです。", "korehatesutodesu.")
-- 	self:k2r("これ　は　テスト　です。それ　は。それ　は", "kore wa tesuto desu. sore wa. sore wa")
-- 	self:k2r("'''^ウィキペディア'''　へ　^ようこそ", "'''Wikipedia''' e Yōkoso")
-- 	self:k2r("^'''ウィキペディア'''　へ　^ようこそ", "'''Wikipedia''' e Yōkoso")
-- 	-- ====
-- 	self:k2r("は　うはう　う　は　う　は", "wa uhau u wa u wa")
-- 	self:k2r("へ　うへう　う　へ　う　へ", "e uheu u e u e")
-- 	self:k2r(".は　うはう　う　.は　う　.は", "ha uhau u ha u ha")
-- 	self:k2r("は.　うはう　う　は.　う　は.", "ha uhau u ha u ha")
-- 	self:k2r("^これ ^は ^テスト ^です。^へ　へ", "Kore Wa Tesuto Desu. E e") -- but what kind of sick monster capitalizes particles
-- 	self:k2r("^ちょ% ^はっ%かい", "Cho Hakkai")
-- 	self:k2r("てにをは", "tenioha")
-- 	self:k2r("ぎゃく-ハーレム", "gyaku-hāremu")
-- 	self:k2r("ねこ-は", "neko-ha")
-- 	self:k2r("ねこ-'''は'''", "neko-'''ha'''")
-- 	self:k2r("ねこ-は の", "neko-ha no")
-- 	self:k2r("ねこ-'''は''' の", "neko-'''ha''' no")
-- 	self:k2r("は", "ha")
-- 	self:k2r("'''は'''", "'''ha'''")
-- 	self:k2r("<u>は</u>", "<u>ha</u>")
-- 	self:k2r("それ は ね", "sore wa ne")
-- 	self:k2r("'''こんにち は'''", "'''konnichi wa'''")
-- 	self:k2r("それ '''は''' ね", "sore '''wa''' ne")
-- 	-- ====
-- --[[
-- 	self:k2r("^へ　へ。", "E e.") -- doesn't work as of jan 2017 probably because the code detects へ + the two surrounding
-- 	self:k2r("^へ へ。", "E e.") -- characters, and if the first へ is processed the other does not have a preceding
-- 	self:k2r("^へ　へ　x", "E e x") -- character to allow it to be detected (can be easily fixed but has not proven
-- 	self:k2r("^へ へ　x", "E e x") -- itself to need fixing yet)
-- ]]
-- 	self:k2r("うぉ", "wo")
-- 	self:k2r("は は では　^はっけん　はっけん 「はっけん」 '''はっけん'''", "wa wa deha Hakken hakken “hakken” '''hakken'''")
-- 	self:k2r("は は では　^はっけん　はっけん 「はっけん」 '''はっけん'''", "wa wa deha Hakken hakken “hakken” '''hakken'''")
-- 	-- ====
-- 	self:k2r("ぎゃ　ぎぃ　ぎゅ　ぎぇ　ぎょ。くぁ　くぃ　くぅ　くぇ　くぉ", "gya gī gyu gye gyo. kwa kwi kū kwe kwo")
-- 	self:k2r("うぁ　うぃ　うぅ　うぇ　うぉ。ヴぁ　ヴぃ　ヴ　ヴぇ　ヴぉ", "wa wi ū we wo. va vi vu ve vo")
-- 	self:k2r("ふぁ　ふぃ　ふ　ふぇ　ふぉ", "fa fi fu fe fo")
-- 	self:k2r("てぃ　でぃ　とぅ　どぅ　すぁ　すぃ　しぃ　しぇ　しょ　ちぃ ぢぃ　つぉ　てぇ　てゅ　とぁ　とぃ　ふょ　てょ", "ti di tu du sa si shī she sho chī jī tso tē tyu twa twi fyo tyo")
-- 	self:k2r("ねぃ　ぬゃ", "ni nya") -- ¯\_(ツ)_/¯
-- 	self:k2r("ねぇ、", "nē,")
-- 	self:k2r("シークヮーサー", "shīkwāsā")
-- 	-- ====
-- 	self:k2r("りゃくしょう　じょうず　つみき　ツァーリ　ちゅうか　つづけて そっち　がっしょう　マッツァーリ", "ryakushō jōzu tsumiki tsāri chūka tsuzukete sotchi gasshō mattsāri")
-- 	self:k2r("こー　やって。ばっさり", "kō yatte. bassari")
-- 	self:k2r("し を ぼっ.す", "shi o bossu")
-- 	self:k2r("がーー", "gāa")
-- 	self:k2r("が　がー　がーー　がーーー　がーーーー　がーーーーー", "ga gā gāa gāā gāāa gāāā")
-- 	self:k2r("じと　じっと　じっっと　じっっっと　じっっっっと　じっっっっっと", "jito jitto jittto jitttto jittttto jitttttto")
-- 	self:k2r("めっちゃ　めっっちゃ　めっっっちゃ", "metcha mettcha metttcha")
-- 	self:k2r("あっ　あーっ　あぁーっ　あああっっっ", "a&apos; ā&apos; āa&apos; āa&apos;&apos;&apos;")
-- 	self:k2r("はええ", "haē")
-- 	self:k2r("まてぇぇぇ", "matēē")
-- 	self:k2r("あっ と いう ま に", "at to iu ma ni")
-- 	self:k2r("あっ、まちがえた", "a&apos;, machigaeta")
-- --[[
-- 	self:k2r("あっ. まちがえた", "ah machigaeta") -- conflicts with the "し を ぼっ.す" test for now
-- ]]
-- 	self:k2r("あっ と いう ま に", "at to iu ma ni")
-- 	self:k2r("'''だまっ'''て", "'''damat'''te")
-- 	self:k2r("いっ'''ぱつ''' の じゅうだん", "ip'''patsu''' no jūdan")
-- 	-- ====
-- 	self:k2r("じゅうにヶげつ　せきヶはら", "jūnikagetsu sekigahara")
-- 	self:k2r("じゅうに'''ヶ'''げつ　せき'''ヶ'''はら", "jūni'''ka'''getsu seki'''ga'''hara")
-- 	self:k2r("いっヵげつ いっ'''ヵ'''げつ", "ikkagetsu ik'''ka'''getsu")
-- 	self:k2r("けんいち　にちようび　こんや", "ken'ichi nichiyōbi kon'ya")
-- 	self:k2r("すゞき　あゝ", "suzuki ā")
-- 	self:k2r("<u>ほっ</u>する", "<u>hos</u>suru")
-- 	self:k2r("<u>みっ</u>つ", "<u>mit</u>tsu")
-- 	self:k2r("<u>ち</u>", "<u>chi</u>")
-- 	self:k2r("<u>めっ</u>ちゃ", "<u>met</u>cha")
-- 	-- ====
-- 	self:k2r("あ～ あ〜 あ〰", "a~ a~ a~")
-- 	self:k2r("あ！！！！", "a!!!!")
-- 	self:k2r("200％", "200%")
-- 	-- ====
-- 	self:k2r("jyouzu　じょうず", "jyouzu jōzu")
-- 	self:k2r("^トゥットゥルー♪　^まゆしぃ☆です", "Tutturū♪ Mayushī☆desu")
-- 	self:k2r("「^だって、すてき な まち です し、それ に なんと いって も この じょうひん な ふいんき！^'''ザ'''・お-じょう-さま！^くうき も バラ の かおり が する と いう かっ！」", "“Datte, suteki na machi desu shi, sore ni nanto itte mo kono jōhin na fuinki! '''Za''' o-jō-sama! Kūki mo bara no kaori ga suru to iu ka&apos;!”")
-- 	-- ====
-- --[[
-- 	self:k2r("あっあ", "?")
-- 	self:k2r("ウッーウッーウマウマ", "?")
-- 	self:k2r("あ゙ あ゛", "?")
-- ]]

-- 	self:k2r_hist("づ", "du")
-- 	self:k2r_hist("ず", "zu")
-- 	self:k2r_hist("ぢ", "di")
-- 	self:k2r_hist("じ", "zi")
-- 	self:k2r_hist("きやう", "kyau")
-- 	self:k2r_hist("くゑ", "kwe")
-- 	self:k2r_hist("きよ", "kyo")
-- 	self:k2r_hist("くゐよく", "kwyoku")
-- 	self:k2r_hist("きよう", "kyou")
-- 	-- ===
-- 	self:k2r_hist('すゐ', 'suwi')
-- 	-- ====
-- 	self:k2r_hist("おお", "oo") -- [[Talk:公]]
-- 	self:k2r_hist("おう", "ou")
-- 	self:k2r_hist("はん", "fan")
-- 	self:k2r_hist("しよう", "syou")
-- 	self:k2r_hist("し.よう", "siyou")
-- 	-- ====
-- 	self:k2r_hist("つ.ゑ", "tuwe")
-- 	self:k2r_hist("つ", "tu")
-- 	self:k2r_hist("ち", "ti")
-- 	self:k2r_hist("ちや", "tya")

-- 	self:r2k("ayekikye vyewifue", "アイェキキェ ヴィェウィフエ")
-- 	self:r2k("shinkansen", "シンカンセン")
-- 	self:r2k("shin'i", "シンイ")
-- 	self:r2k("shin'ya shinya", "シンヤ シニャ")
-- 	self:r2k("na ni nu ne no nya nyu nye nyo", "ナ ニ ヌ ネ ノ ニャ ニュ ニェ ニョ")
-- 	self:r2k("bakkurasshu", "バックラッシュ")

-- 	self:script_detection('あいこくしん愛国心メ', 'Hira+Kana+Hani')
-- 	self:script_detection('あいこくしん愛国心', 'Hira+Hani')
-- 	self:script_detection('ァー', 'Kana')
-- 	self:script_detection('あっぷるringo', 'Hira+Romaji')
-- 	self:script_detection('ニッポン1１', 'Kana+Number')
-- 	self:script_detection('ニッポンｎｉｐｐｏｎ', 'Kana+Romaji')
-- 	self:script_detection('一つ', 'Hira+Hani')
-- 	self:script_detection('〆る', 'Hira+Abbreviation')

-- 	self:k2h('アメリカじん', 'あめりかじん')

-- 	self:h2k('うぃきぺでぃあ　デス', 'ウィキペディア　デス')

-- 	self:other('jsort', 'でーじ', 'てえじ\'')

-- 	self:other('count_morae', 'しゃっきんジャー', 6)

-- 	self:other('rm_spaces_hyphens', 'ishu kakutōgi sen', 'ishukakutōgisen')

-- 	self:other('kanji_grade', '立', 1)
-- 	self:other('kanji_grade', '尊立', 6)
-- 	self:other('kanji_grade', '藉尊立', 9)
-- end
 
-- return p