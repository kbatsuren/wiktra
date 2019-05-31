from wiktionaryparser import WiktionaryParser
import Wiktra as wt
print('Hello World!')

# parser = WiktionaryParser()
#
# parser.set_default_language('vietnamese')
#
# parser.include_relation('alternative forms')
#
# word = parser.fetch('bôm')
#
# print(word)
#
#
# word = parser.fetch('test')
# another_word = parser.fetch('test', 'french')
#
# print(word)
#
# print(another_word)

print(wt.translite('монгол улс мандтугай', 'mongolian'))