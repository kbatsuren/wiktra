mw = require('mw')
mw.text = require('mw-text')
mw.ustring = require ('ustring/ustring')

kan= require ('translit/kn-translit')
kan.tr('ಲಲ','kn','Knda')
kan.tr('ಅಕ್ಕಿ','kn','Knda')

hin = require ('translit/hi-translit')
hin.tr('चमचा', 'hi', 'Deva')
hin.tr('प्यार', 'hi', 'Deva')
hin.tr('भारतीय', 'hi', 'Deva')
hin.tr('प्यार', 'hi', 'Deva')
hin.tr('हमसफ़र', 'hi', 'Deva')
hin.tr('चमत्कार', 'hi', 'Deva')
hin.tr('कयामत', 'hi', 'Deva')
hin.tr('काफी', 'hi', 'Deva')
 


guj = require ('translit/gu-translit')
guj.tr('અંક મેળવવો','gu', 'Gujr')
ยูโด
ยูโด

tha = require ('translit/th-translit')
tha = require 'translit/tha-pron'
tha.tr('ยูโด','th', 'Thai') 
tha.tr('ผล็อย','th', 'Thai') 
tha.tr('ยูโด','th', 'Thai') 
-- 
-- works 
tha.tr('เหดสุดวิไส','th', 'Thai')
-- not works
tha.tr('ไวน์มุสกาเดต์','th', 'Thai')

tha.tr('สวย','th', 'Thai')
tha.tr('เหดสุดวิไส','th', 'Thai')
tha.tr('เหนื่อย','th', 'Thai')

san = require ('translit/sa-translit')

san.tr('सोऽहम्','sa', 'Deva')
san.tr('दुःख','sa', 'Deva')

pa = require ('translit/guru-translit')
pa.tr("ਅਣਸੁਣਿਆ", 'pa', 'Guru')

mn = require ('translit/mon-translit')
mn.tr('хаврын сайхан өдөр', 'mn', 'Cyrl')

bg = require ('translit/bg-translit')
bg.tr('жудо сумо', 'bg', 'Cyrl')

fas = require ('translit/fa-translit')
fas.tr("آب تنی", 'fa', 'fa-Arab')
fas.tr("اجازه عبور دادن", 'fa', 'fa-Arab')
fas.tr("أحَد أعْضاء الثالُوث الأقْدَس", 'fa', 'fa-Arab')

pnb = require ('translit/fa-translit')
pnb.tr("سکھ مت", 'pnb', 'fa-Arab')
pnb.tr("روزہ", 'pnb', 'fa-Arab')


heb = require ('translit/he-translit')
heb.tr('הַמַּמְלָכָה', 'he', 'Hebr')
heb.tr("!בַּעֲלַת בַּיִת", 'he', 'Hebr')
heb.tr("בֵּית-הָעִירִיָּה", 'he', 'Hebr')
heb.tr("לשון הקודש", 'he', 'Hebr')


grc = require ('translit/grc-translit')
grc.tr('σάἁμον', 'el', "polytonic")
grc.tr("θάλαμος ψύξης υγρών", 'el', "polytonic")

abk = require ('translit/ab-translit')
abk.tr("ааероплан",'ab', 'Cyrl')

abq = require ('translit/abq-translit')
abq.tr("август",'abq', 'Cyrl')

ady = require ('translit/ady-translit')
ady.tr('бгъотагъэ', 'ady', 'Cyrl')
ady.tr("помидор", 'ady', 'Cyrl')
ady.tr("бзэгужъый", 'ady', 'Cyrl')

alt = require ('translit/altai-translit')

alt.tr("булут", 'alt', 'Cyrl')

ava = require ('translit/av-translit')
ava.tr("чӏегӏера", 'ava', 'Cyrl')

bua = require ('translit/bua-translit')
bua.tr("hархяаг", 'bua', 'Cyrl')
bua.tr("аяга", 'bua', 'Cyrl')


che = require ('translit/ce-translit')
che.tr("буьйсанан мокха хьоза", 'ce', 'Cyrl')

chv = require ('translit/cv-translit')
chv.tr("сăмахсен кĕнеки", 'cv', 'Cyrl')

cop = require ('translit/copt-translit')
cop.tr("ⲡⲁⲧⲣⲓⲁⲣⲭⲏⲥ", 'copt', 'Coptic')

dlg = require ('translit/dlg-translit')
dlg.tr("былыт", 'dlg', 'Cyrl')

dng = require ('translit/dng-translit')
dng.tr("музей", 'dng', 'Cyrl')

div = require ('translit/dv-translit')
div.tr("ފިރިހެން ހަށި", "dv", "Thaa")

grc = require ('translit/grc-translit')
grc.tr("ἐξητηριος λόγος", 'grc', "polytonic")

hye = require 'translit/armn-translit'
hye.tr("Հայաստան", "hy", "Armn")
hye.tr("ալցհայմերի հիվանդություն", "hy", "Armn")

inh = require 'translit/inh-translit'
inh.tr("аьккхий-мархий бутт", 'inh', 'Cyrl')

inh = require 'translit/inh-translit'
inh.tr("аьккхий-мархий бутт", 'inh', 'Cyrl')

---
kaa = require 'translit/kaa-translit'
kaa.tr("аьккхий-мархий бутт", 'kaa', 'Cyrl')

kaz = require 'translit/kk-translit'
kaz.tr("аьккхий-мархий бутт", 'inh', 'Cyrl')

kbd = require 'translit/kbd-translit'
kbd.tr("аьккхий-мархий бутт", 'kbd', 'Cyrl')

khm = require 'translit/km-translit'
khm.tr("ការអោយរួចជាអ្នកជា", 'km', 'Khmr')
khm.tr("កាលប្បវត្តិវិទ្យា", 'km', 'Khmr')

kir = require 'translit/ky-translit'
kir.tr("аьккхий-мархий бутт", 'ky', 'Cyrl')

kjh = require 'translit/kjh-translit'
kjh.tr("аьккхий-мархий бутт", 'kjh', 'Cyrl')

koi = require 'translit/kv-translit'
koi.tr("аьккхий-мархий бутт", 'koi', 'Cyrl')

kor = require 'translit/ko-translit'
kor.tr("사무실에서.", "ko", "Kore")
kor.tr("모든 인간은 태어날 때부터 자유로우며 그 존엄과 권리에 있어 동등하다.", "ko", "Kore")

krc = require 'translit/krc-translit'
krc.tr("агъач къоян", "krc", "Cyrl")

lbe = require 'translit/lbe-translit'
lbe.tr("ахънилсри", "lbe", "Cyrl")

mar = require 'translit/mr-translit'
mar.tr("ऑस्ट्रेलिया", 'mr', 'Deva')
mar.tr("अमेरिकन इंग्लिश", 'mr', 'Deva')

lbe = require 'translit/lbe-translit'
lbe.tr("ахънилсри", "lbe", "Cyrl")

lzz = require 'translit/geor-translit'
lzz.tr("ფანწალა", "lzz", "Geor")

ben = require 'translit/bn-translit'
ben.tr("নি্র্যাতন নি্র্য্যাতন", "bn", "Beng")
ben.tr("গোলমাল", "bn", "Beng")
ben.tr("বিশ্বাস", "bn", "Beng")

ben.tr("অপমান", "bn", "Beng")
ben.tr("পশ্চিমবাংলা", "bn", "Beng")
ben.tr("মতামত", "bn", "Beng")
ben.tr("নি্র্যাতন নি্র্য্যাতন", "bn", "Beng")


pan = require ('translit/guru-translit')
pan.tr("ਬਦਚਲਣੀ ਦੁਰਾਚਾਰ",'pan', 'Guru')

rus = require ('translit/ru-translit')
rus.tr("без",'ru', 'Cyrl')

sat = require 'translit/sat-translit'
sat.tr("ᱜᱚᱱᱰ ᱜᱟᱨᱩᱲ", 'sat', 'Olck')

sin = require 'translit/si-translit'
sin.tr("ඉලෙක්ට්‍රොනික විද්‍යාව", 'si', 'Sinh')

tat = require 'translit/tt-translit'
tat.tr("чәршәмбе", 'tt', 'Cyrl')

tgk = require 'translit/tg-translit'
tgk.tr("машин","tg","Cyrl")

uig = require 'translit/ug-translit'
uig.tr("бирйуза","ug","Cyrl")
uig.tr("ئىقتىسادشۇناسلىق","ug","ug-Arab")

yrk = require 'translit/sjd-translit'
yrk.tr("ӈылека", 'yrk', 'Cyrl')

xmf = require 'translit/geor-translit'
xmf.tr("აფხაზური", 'xmf', 'Geor')

asm = require 'translit/as-translit'
asm.tr ("জ্যোতি",'as','Beng')
asm.tr ("সঞ্জাত",'as','Beng')

asm.tr ("নি্র্যাতন নি্র্য্যাতন",'as','Beng')

tel = require 'translit/te-translit'
tel.tr("ఉత్పన్నమయిన",'te','Telu')
tel.tr("నీతికిసంబంధించిన పని",'te','Telu')

tam = require 'translit/ta-translit'
tam.tr("ஒழுக்கமானசெயல்", 'ta', 'Taml')
tam.tr("ஊட்டச்சத்து", 'ta', 'Taml')

ori = require 'translit/or-translit'
ori.tr("ଅନୁକୂଳତା",'or','Orya')

nep =require 'translit/ne-translit'
nep.tr("सच्चरित्रता",'ne', 'Deva')

mal = require 'translit/ml-translit'
mal.tr("ജന്മമെടുത്ത", 'ml', 'Mlym')

"नवेंच शिकिल्लें"

জ্যোতি

brx = require 'translit/hi-translit'
brx.tr("गोजोन नङि", 'brx', 'Deva')

mya= require 'translit/my-translit'
mya.tr("ခေါင်းစွပ်ဆွယ်တာ", "my", "Mymr")
mya.tr("ချူးအင်းဂမ်း", "my", "Mymr")

mya.tr("ငွေကြေးစုဆောင်းခြင်း", "my", "Mymr")
mya.tr("ကွန်ဖူး", "my", "Mymr")

amh = require 'translit/ethi-translit'
amh.tr("ልምቡጥ","am","Ethi")

tly = require 'translit/ug-translit'
tly.tr("вазах","tly","Cyrl")
tly.tr("ام روز","tly","ug-Arab")

bod = require 'translit/bo-translit'
bod.tr("གཟའ་ཉི་མ",'bo','Tibt')

jpa = require 'translit/ja'
jpa.kana_to_romaji("はっきり感じとれるほど")

ryu = require 'translit/ja'
ryu.kana_to_romaji("いいび")


chr = require 'translit/cher-translit'
chr.tr("ᏗᎦᎾᏙᎬ ᎠᏐᎠᏍᏙ", "chr", "Cher")

chu = require 'translit/cyrs-glag-translit'
chu.tr("ⰲⱑⱅⱃⱏ","chu","Glag")
chu.tr("ⱄⱏⰴⱃⰰⰲⱏ","chu","Glag")
chu.tr("цвѣтъ","chu","Cyrs")
chu.tr("тръжьникъ","chu","Glag")

iii = require 'translit/ii-translit'
iii.tr("ꃶ",'ii', 'Yiii')
iii.tr("ꀑ",'ii', 'Yiii')

kat =require 'translit/geor-translit'
kat.tr("აბრეშუმის ჭია","ka", "Geor")

lao = require ('translit/lo-translit')
lao.tr("ການທ່ອງທ່ຽວ",'lo', 'Laoo') 
lao.tr("ການສໍ້ລາດບັງຫຼວງ",'lo', 'Laoo') 


lao.tr("ดอกทานตะวัน",'lao', 'Thai') 
lao.tr("เด๊ดสะมอเร่",'lao', 'Thai') 

lao = require ('translit/th-pron')

lao.translit('ข้าว','th', 'Thai', 'paiboon', 'translit-module')
lao.translit("ການສຶກສາ",'th', 'Thai', 'paiboon', 'translit-module')
lao.translit('เด๊ดสะมอเร','th', 'Thai', 'royin', 'translit-module')
lao.translit('เด๊ดสะมอเร','th', 'Thai', 'ipa', 'translit-module')
lao.translit('เด๊ดสะมอเร','th', 'Thai', 'charPhon', 'translit-module')
lao.translit('เด๊ดสะมอเร','th', 'Thai', 'homophone', 'translit-module')
lao.translit('เด๊ดสะมอเร','th', 'Thai', 'file', 'translit-module')


2738
"агъач къоян"