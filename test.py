import lupa
from lupa import LuaRuntime
lua = LuaRuntime(unpack_returned_tuples=True)

lua.eval('1+1')
lua_func = lua.eval('function(f, n) return f(n) end')

def py_add1(n): return n+1

print(lua_func(py_add1, 2))

lua.execute("mw = require 'wikt.mw'")
lua.execute("mw.text = require('wikt.mw-text')")
lua.execute("mw.ustring = require ('wikt.ustring.ustring')");

lua.execute ("kan = require ('wikt.translit.kn-translit')")

g = lua.globals()

lua.execute ("a=kan.tr('ಲಲ','kn','Knda')")

print(g.a)
lua.execute ("a=kan.tr('ಅಕ್ಕಿ','kn','Knda')")
print(g.a)


lua.execute ("hin = require ('wikt.translit.hi-translit')")
lua.execute ("a=hin.tr('देवनागरी', 'hi', 'Deva')")

# lua.execute ("hin = require ('wikt.translit.bn-translit')")
# lua.execute ("a = hin.tr('নি্র্যাতন নি্র্য্যাতন', 'bn', 'Beng')")
print(g.a)


lua.execute ("arb = require ('wikt.translit.ar-translit')")
lua.execute ("a = arb.tr('اَلْعَرَبِيَّة','ar','Arab')")

print(g.a)

lua.execute ("heb = require ('wikt.translit.he-translit')")
lua.execute ("heb.tr('לשון הקודש', 'he', 'Hebr')")

print(g.a)


lua.execute ("ben = require ('wikt.translit.bn-translit')")
lua.execute ("a=ben.tr('বাংলা', 'bn', 'Deva')")

print(g.a)