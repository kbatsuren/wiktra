import lupa
from lupa import LuaRuntime

lua = LuaRuntime(unpack_returned_tuples=True)
#lua.execute("dir = io.popen'cd':read'*l'")
#lua.execute('package.path = package.path .. ";" .. dir.."\\\?.lua"')
lua.execute("mw = require('wikt.mw')")
lua.execute("mw.text = require('wikt.mw-text')")
lua.execute("mw.ustring = require ('wikt.ustring.ustring')")

lang_map = {
    'amh' : ('ethi','Ethi')
    'rus' : ('ru', 'Cyrl'),
    'cre' : ('cr', 'Cans'),
    'pka' : ('brah', 'Brah'),
    'inc-ash' : ('brah', 'Brah'),
    'prt' : ('prti', 'Parthian'),
    'ete' : ('cprt', 'Cprt'),
    'ave' : ('avst', 'Avst'),
    'guj' : ('gu', 'Gujr'),
    'yuk' : ('ykg', 'Cyrl'),
    'ady' : ('ady', 'Cyrl'),
    'ava' : ('av', 'Cyrl'),
    'ukr' : ('uk', 'Cyrl'),
    'xal' : ('xal', 'Cyrl'),
    'tib' : ('bo', 'Tibt'),
    'heb' : ('he', 'Hebr'),
    'mya' : ('my', 'Mymr'),
    'rue' : ('rue', 'Cyrl'),
    'kdr' : ('kdr', 'Cyrl'),
    'sin' : ('si', 'Sinh'),
    'kum' : ('kum', 'Cyrl'),
    'arm' : ('armn', 'Armn'),
    'bud' : ('bdk', 'Cyrl'),
    'dun' : ('dng', 'Cyrl'),
    'urd' : ('ur', 'ur-Arab'),
    'got' : ('goth', 'Goth'),
    'kip' : ('qwm', 'Latn'),
    'ben' : ('bn', 'Beng'),
    'lim' : ('lif', 'Limb'),
    'pra' : ('inc-ash', 'Brah'),
    'mas' : ('inc-mas', 'Beng'),
    'tha' : ('th', 'Thai'),
    'lep' : ('lep', 'Lepc'),
    'eng' : ('en', 'Latn'),
    'abq' : ('abq', 'Latn'),
    'bua' : ('bua', 'Cyrl'),
    'lez' : ('lez', 'Cyrl'),
    'mon' : ('mon', 'Cyrl'),
    'uig' : ('ug', 'ug-Arab'),
    'khi' : ('kjj', 'Cyrl'),
    'chr' : ('cher', 'Cher'),
    'bho' : ('bho', 'Deva'),
    'new' : ('new', 'Deva'),
    'hin' : ('hi', 'Deva'),
    'mal' : ('ml', 'Mlym'),
    'man' : ('mani', 'Mani'),
    'mdf' : ('mdf', 'Cyrl'),
    'sat' : ('sat', 'Olck'),
    'tel' : ('te', 'Telu'),
    'mkd' : ('mk', 'Cyrl'),
    'smi' : ('sjd', 'Cyrl'),
    'kbd' : ('kbd', 'Cyrl'),
    'abk' : ('ab', 'Cyrl'),
    'kor' : ('ko', 'Kore'),
    'mnc' : ('mns', 'Mong'),
    'kca' : ('kca', 'Cyrl'),
    'kha' : ('khar', 'Khar'),
    'bel' : ('be', 'Cyrl'),
    'kom' : ('kv', 'Cyrl'),
    'cop' : ('copt', 'Copt'),
    'kur' : ('kmr', 'Latn'),
    'lak' : ('lbe', 'Cyrl'),
    'ita' : ('ital', 'Ital'),
    'lao' : ('lo', 'Laoo'),
    'mar' : ('mr', 'Deva'),
    'udi' : ('udi', 'Cyrl'),
    'eth' : ('ethi', 'Ethi'),
    'lin' : ('linb', 'Linb'),
    'iku' : ('iu', 'Cans'),
    'myv' : ('myv', 'Cyrl'),
    'kan' : ('kn', 'Knda'),
    'tam' : ('ta', 'Taml'),
    'kaa' : ('kaa', 'Latn'),
    'bul' : ('bg', 'Cyrl'),
    'jav' : ('jv', 'Latn'),
    'oss' : ('os', 'Cyrl'),
    'che' : ('ce', 'Cyrl'),
    'kas' : ('ks', 'ks-Arab'),
    'pal' : ('phli', 'Phli'),
    'sah' : ('sah', 'Cyrl'),
    'chm' : ('chm', 'Cyrl'),
    'kaz' : ('kk', 'Cyrl'),
    'kjk' : ('kjh', 'Cyrl'),
    'fas' : ('fa', 'fa-Arab'),
    'iii' : ('ii', 'Yiii'),
    'tgk' : ('tg', 'Cyrl'),
    'bak' : ('ba', 'Cyrl'),
    'krc' : ('krc', 'Cyrl'),
    'ori' : ('or', 'Orya'),
    'eve' : ('eve', 'Cyrl'),
    'khm' : ('km', 'Khmr'),
    'xbc' : ('xbc', 'Grek'),
    'san' : ('sa', 'Deva'),
    'nsk' : ('nsk', 'Cans'),
    'udm' : ('udm', 'Cyrl'),
    'nog' : ('nog', 'Cyrl'),
    'can' : ('cans', 'Cans'),
    'ain' : ('ain', 'Kana'),
    'nep' : ('ne', 'Deva'),
    'geo' : ('geor', 'Geor'),
    'niv' : ('niv', 'Cyrl'),
    'lyc' : ('lyci', 'Lyci'),
    'sar' : ('sarb', 'Sarb'),
    'chu' : ('cv', 'Cyrl'),
    'peo' : ('peo', 'Xpeo'),
    'cho' : ('cyrs-glag', 'Cyrs'),
    'dar' : ('dar', 'Cyrl'),
    'pan' : ('guru', 'Guru'),
    'alt' : ('altai', 'Cyrl'),
    'inh' : ('inh', 'Cyrl'),
    'ara' : ('ar', 'Arab'),
    'tyv' : ('tyv', 'Cyrl'),
    'gre' : ('el', 'Grek'),
    'tat' : ('tt', 'Cyrl'),
    'aho' : ('ahom', 'Ahom'),
    'tal' : ('talu', ''),
    'lyd' : ('lydi', 'Lydi'),
    'dlg' : ('dlg', 'Cyrl'),
    'kir' : ('ky', 'Cyrl'),
    'asm' : ('as', 'as-Beng'),
    'div' : ('dv', 'Thaa'),
    'ber' : ('ber', 'Tfng'),
    'grc' : ('grc', 'polythonic'),
    'xmk' : ('grc', 'polythonic'),
    'grc-c' : ('cprt', 'Cprt'),
    'evn' : ('evn', 'Cyrl')
}

def translite(text, lang):
    lang_tup = lang_map[lang.lower()]
    lua_str = 'res = require("wikt.translit.' + lang_tup[0] + '-translit").tr("' + \
              text + '", "' + lang_tup[0] + '", "' + lang_tup[1] + '")'
    lua.execute(lua_str)
    return lua.globals().res
