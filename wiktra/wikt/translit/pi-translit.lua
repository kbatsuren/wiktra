local export = {}
local gsub = mw.ustring.gsub

function export.trwo(text, lang, sc, options)
    if (sc == "Brah") then
        text = require("Brah-translit").tr(text, lang, sc)
    elseif (sc == "Deva") then
        text = require("sa-translit").tr(text, lang, sc)
    elseif (sc == "Sinh") then
        text = require("si-translit").tr(text, lang, sc)
    elseif sc == "Beng" or sc == "Mymr" or sc == "Lana" or sc == "Khmr" or sc == "Thai" or sc == "Laoo" then
        local u = mw.ustring.char
        local function dc(x) -- Use this to make marks legible.  The name 'dc' means 'drop carrier'.
            return gsub(x, "[𑀓कকකကกᨠកກ]", "") -- These are the letter ka in the 9 supported Indic scripts.
        end
        local consonants = { -- And parts 1 of NFC-multipart independent vowels!
            -- Bengali
            ["ক"] = "k",
            ["খ"] = "kh",
            ["গ"] = "g",
            ["ঘ"] = "gh",
            ["ঙ"] = "ṅ",
            ["চ"] = "c",
            ["ছ"] = "ch",
            ["জ"] = "j",
            ["ঝ"] = "jh",
            ["ঞ"] = "ñ",
            ["ট"] = "ṭ",
            ["ঠ"] = "ṭh",
            ["ড"] = "ḍ",
            ["ঢ"] = "ḍh",
            ["ণ"] = "ṇ",
            ["ত"] = "t",
            ["থ"] = "th",
            ["দ"] = "d",
            ["ধ"] = "dh",
            ["ন"] = "n",
            ["প"] = "p",
            ["ফ"] = "ph",
            ["ব"] = "b",
            ["ভ"] = "bh",
            ["ম"] = "m",
            ["য"] = "y",
            ["র"] = "r",
            ["ল"] = "l",
            ["ল়"] = "ḷ", -- xx['व']='v',
            ["শ"] = "ś",
            ["ষ"] = "ṣ",
            ["স"] = "s",
            ["হ"] = "h",
            ["ৰ"] = "v",
            ["ৰ" .. u(0x200d)] = "v",
            ["ৱ"] = "v",
            -- Myanmar
            ["က"] = "k",
            ["ခ"] = "kh",
            ["ဂ"] = "g",
            ["ဃ"] = "gh",
            ["င"] = "ṅ",
            ["စ"] = "c",
            ["ဆ"] = "ch",
            ["ဇ"] = "j",
            ["ဈ"] = "jh",
            ["ဉ"] = "ñ",
            ["ဋ"] = "ṭ",
            ["ဌ"] = "ṭh",
            ["ဍ"] = "ḍ",
            ["ဎ"] = "ḍh",
            ["ဏ"] = "ṇ",
            ["တ"] = "t",
            ["ထ"] = "th",
            ["ဒ"] = "d",
            ["ဓ"] = "dh",
            ["န"] = "n",
            ["ပ"] = "p",
            ["ဖ"] = "ph",
            ["ဗ"] = "b",
            ["ဘ"] = "bh",
            ["မ"] = "m",
            ["ယ"] = "y",
            ["ရ"] = "r",
            ["လ"] = "l",
            ["ဝ"] = "v",
            ["ဠ"] = "ḷ",
            ["ၐ"] = "ś",
            ["ၑ"] = "ṣ",
            ["သ"] = "s",
            ["ဟ"] = "h",
            ["ည"] = "ññ",
            ["ဿ"] = "ss",
            ["အ"] = "ʼ",
            -- Subscript consonants: 103B..103E, 105E..1060
            [dc("ကျ")] = "y",
            [dc("ကြ")] = "r",
            [dc("ကွ")] = "v",
            [dc("ကှ")] = "h",
            [dc("ကၞ")] = "n",
            [dc("ကၟ")] = "m",
            [dc("ကၠ")] = "l",
            -- Mon Pali consonants
            ["ၚ"] = "ṅ",
            ["ၛ"] = "jh",
            -- Shan (Pali) consonants - Excludes SHAN THA, MEDIAL WA, SIGN SHAW
            ["ၵ"] = "k",
            ["ၶ"] = "kh",
            ["ၷ"] = "g",
            ["ꧠ"] = "gh", -- ['']='ṅ',
            ["ၸ"] = "c",
            ["ꧡ"] = "ch",
            ["ၹ"] = "j",
            ["ꧢ"] = "jh",
            ["ၺ"] = "ñ",
            ["ꩦ"] = "ṭ",
            ["ꩧ"] = "ṭh",
            ["ꩨ"] = "ḍ",
            ["ꩩ"] = "ḍh",
            ["ꧣ"] = "ṇ",
            --			['']='t', ['']='th',
            ["ၻ"] = "d",
            ["ꩪ"] = "dh",
            ["ၼ"] = "n",
            --			['']='p',
            ["ၽ"] = "ph",
            ["ၿ"] = "b",
            ["ꧤ"] = "bh", -- ['']='m',
            --			['']='y', ['']='r', ['']='l', ['']='v',
            ["ꩮ"] = "ḷ",
            --			['']='ś', ['']='ṣ', ['']='s',
            ["ႁ"] = "h",
            --		    ['']='ññ', ['']='ss',
            ["ဢ"] = "ʼ",
            -- Other first parts of independent vowels.
            ["ဣ"] = "i",
            ["ဥ"] = "u",
            -- Lanna
            ["ᨠ"] = "k",
            ["ᨡ"] = "kh",
            ["ᨣ"] = "g",
            ["ᨥ"] = "gh",
            ["ᨦ"] = "ṅ",
            ["ᨧ"] = "c",
            ["ᨨ"] = "ch",
            ["ᨩ"] = "j",
            ["ᨫ"] = "jh",
            ["ᨬ"] = "ñ",
            ["ᨭ"] = "ṭ",
            ["ᨮ"] = "ṭh",
            ["ᨯ"] = "ḍ",
            ["ᨰ"] = "ḍh",
            ["ᨱ"] = "ṇ",
            ["ᨲ"] = "t",
            ["ᨳ"] = "th",
            ["ᨴ"] = "d",
            ["ᨵ"] = "dh",
            ["ᨶ"] = "n",
            ["ᨷ"] = "p",
            ["ᨸ"] = "p",
            ["ᨹ"] = "ph",
            ["ᨻ"] = "b",
            ["ᨽ"] = "bh",
            ["ᨾ"] = "m",
            ["ᨿ"] = "y",
            ["ᩁ"] = "r",
            ["ᩃ"] = "l",
            ["ᩅ"] = "v",
            ["ᩊ"] = "ḷ",
            ["ᩆ"] = "ś",
            ["ᩇ"] = "ṣ",
            ["ᩈ"] = "s",
            ["ᩉ"] = "h",
            ["ᩔ"] = "ss",
            ["ᩋ"] = "ʼ",
            ["ᩐ"] = "ū",
            -- Subscript consonants: 1A55, 1A56, 1A5B to 1A5E
            [dc("ᨠᩕ")] = "r",
            [dc("ᨠᩖ")] = "l",
            [dc("ᨠᩛ")] = "ṭh",
            [dc("ᨠᩜ")] = "m",
            [dc("ᨠᩝ")] = "p",
            [dc("ᨠᩞ")] = "s",
            -- Khmer
            ["ក"] = "k",
            ["ខ"] = "kh",
            ["គ"] = "g",
            ["ឃ"] = "gh",
            ["ង"] = "ṅ",
            ["ច"] = "c",
            ["ឆ"] = "ch",
            ["ជ"] = "j",
            ["ឈ"] = "jh",
            ["ញ"] = "ñ",
            ["ដ"] = "ṭ",
            ["ឋ"] = "ṭh",
            ["ឌ"] = "ḍ",
            ["ឍ"] = "ḍh",
            ["ណ"] = "ṇ",
            ["ត"] = "t",
            ["ថ"] = "th",
            ["ទ"] = "d",
            ["ធ"] = "dh",
            ["ន"] = "n",
            ["ប"] = "p",
            ["ផ"] = "ph",
            ["ព"] = "b",
            ["ភ"] = "bh",
            ["ម"] = "m",
            ["យ"] = "y",
            ["រ"] = "r",
            ["ល"] = "l",
            ["វ"] = "v",
            ["ឡ"] = "ḷ",
            ["ឝ"] = "ś",
            ["ឞ"] = "ṣ",
            ["ស"] = "s",
            ["ហ"] = "h",
            ["អ"] = "ʼ",
            -- Thai
            ["ก"] = "k",
            ["ข"] = "kh",
            ["ค"] = "g",
            ["ฆ"] = "gh",
            ["ง"] = "ṅ",
            ["จ"] = "c",
            ["ฉ"] = "ch",
            ["ช"] = "j",
            ["ฌ"] = "jh",
            ["ญ"] = "ñ",
            ["ฏ"] = "ṭ",
            ["ฐ"] = "ṭh",
            ["ฑ"] = "ḍ",
            ["ฒ"] = "ḍh",
            ["ณ"] = "ṇ",
            ["ต"] = "t",
            ["ถ"] = "th",
            ["ท"] = "d",
            ["ธ"] = "dh",
            ["น"] = "n",
            ["ป"] = "p",
            ["ผ"] = "ph",
            ["พ"] = "b",
            ["ภ"] = "bh",
            ["ม"] = "m",
            ["ย"] = "y",
            ["ร"] = "r",
            ["ล"] = "l",
            ["ว"] = "v",
            ["ฬ"] = "ḷ",
            ["ศ"] = "ś",
            ["ษ"] = "ṣ",
            ["ส"] = "s",
            ["ห"] = "h",
            ["อ"] = "", -- ['อ'] = 'ʼ',

            -- Lao
            ["ກ"] = "k",
            ["ຂ"] = "kh",
            ["ຄ"] = "g",
            ["ຆ"] = "gh",
            ["ງ"] = "ṅ",
            ["ຈ"] = "c",
            ["ຉ"] = "ch",
            ["ຊ"] = "j",
            ["ຌ"] = "jh",
            ["ຎ"] = "ñ",
            ["ຏ"] = "ṭ",
            ["ຐ"] = "ṭh",
            ["ຑ"] = "ḍ",
            ["ຒ"] = "ḍh",
            ["ຓ"] = "ṇ",
            ["ຕ"] = "t",
            ["ຖ"] = "th",
            ["ທ"] = "d",
            ["ຘ"] = "dh",
            ["ນ"] = "n",
            ["ປ"] = "p",
            ["ຜ"] = "ph",
            ["ພ"] = "b",
            ["ຠ"] = "bh",
            ["ມ"] = "m",
            ["ຍ"] = "y",
            ["ຢ"] = "y",
            ["ຣ"] = "r",
            ["ລ"] = "l",
            ["ວ"] = "v",
            ["ຬ"] = "ḷ",
            ["ຨ"] = "ś",
            ["ຩ"] = "ṣ",
            ["ສ"] = "s",
            ["ຫ"] = "h",
            ["ອ"] = "", -- ['ອ'] = 'ʼ',
            ["ດ"] = "d"
        }

        local diacritics = {
            -- Bengali - only NFC needed
            [dc("কা")] = "ā",
            [dc("কি")] = "i",
            [dc("কী")] = "ī",
            [dc("কু")] = "u",
            [dc("কূ")] = "ū",
            [dc("কৃ")] = "ṛ",
            [dc("কৄ")] = "ṝ",
            [dc("কৢ")] = "ḷ",
            [dc("কৣ")] = "ḹ",
            [dc("কে")] = "e",
            [dc("কৈ")] = "ai",
            [dc("কো")] = "o",
            [dc("কৌ")] = "au",
            [dc("ক্")] = "",
            -- Myanmar
            [dc("ကာ")] = "ā",
            [dc("ကါ")] = "ā",
            [dc("ကိ")] = "i",
            [dc("ကီ")] = "ī",
            [dc("ကု")] = "u",
            [dc("ကူ")] = "ū",
            [dc("ကၖ")] = "ṛ",
            [dc("ကၗ")] = "ṝ",
            [dc("ကၘ")] = "ḷ",
            [dc("ကၙ")] = "ḹ",
            [dc("ကေ")] = "e",
            [dc("ကဲ")] = "ai",
            -- The following are multicharacter!
            [dc("ကော")] = "o",
            [dc("ကော်")] = "au",
            [dc("က်က္")] = "",
            [dc("ကေါ")] = "o",
            [dc("ကေါ်")] = "au",
            [dc("က္")] = "",
            [dc("က်")] = "",
            -- Mon - treatment of Sanskrit au is to be determined!
            [dc("ကဳ")] = "ī",
            -- Shan
            [dc("ကႃ")] = "ā",
            [dc("ကေႃ")] = "o",
            -- Lanna
            [dc("ᨠᩣ")] = "ā",
            [dc("ᨠᩤ")] = "ā",
            [dc("ᨠᩥ")] = "i",
            [dc("ᨠᩦ")] = "ī",
            [dc("ᨠᩩ")] = "u",
            [dc("ᨠᩪ")] = "ū",
            ["ᩂ"] = "ṛ",
            ["ᩄ"] = "ḷ", -- Syllabic consonants may be very wrong!
            [dc("ᨠᩮ")] = "e",
            [dc("ᨠᩱ")] = "ai",
            [dc("ᨠᩰ")] = "o",
            -- The next two rows are are multicharacter!
            [dc("ᨠᩮᩣ")] = "o",
            [dc("ᨠᩮᩢᩣ")] = "au",
            [dc("ᨠᩮᩫᩢᩣ")] = "au",
            [dc("ᨠᩮᩫᩣ")] = "au",
            [dc("ᨠᩮᩤ")] = "o",
            [dc("ᨠᩮᩢᩤ")] = "au",
            [dc("ᨠᩮᩫᩢᩤ")] = "au",
            [dc("ᨠᩮᩫᩤ")] = "au",
            [dc("ᨠ᩠")] = "",
            [dc("ᨠ᩺")] = "",
            [dc("ᨠ᩼")] = "",
            -- Khmer
            [dc("កា")] = "ā",
            [dc("កិ")] = "i",
            [dc("កី")] = "ī",
            [dc("កុ")] = "u",
            [dc("កូ")] = "ū",
            [dc("ក្ឫ")] = "ṛ",
            [dc("ក្ឬ")] = "ṝ",
            [dc("ក្ឭ")] = "ḷ",
            [dc("ក្ឮ")] = "ḹ", -- Multipart
            [dc("កេ")] = "e",
            [dc("កៃ")] = "ai",
            [dc("កោ")] = "o",
            [dc("កៅ")] = "au",
            [dc("ក្")] = "",
            [dc("ក៑")] = "",
            -- Thai
            [dc("กั")] = "a",
            ["า"] = "ā",
            [dc("กิ")] = "i",
            [dc("กี")] = "ī",
            [dc("กุ")] = "u",
            [dc("กู")] = "ū",
            ["ฤ"] = "ṛ",
            ["ฤๅ"] = "ṝ",
            ["ฦ"] = "ḷ",
            ["ฦๅ"] = "ḹ", -- Multipart
            ["เ"] = "e",
            ["ไ"] = "ai",
            ["โ"] = "o",
            ["เา"] = "au",
            [dc("กฺ")] = "",
            [dc("ก์")] = "",
            ["ะ"] = "a",
            [dc("กึ")] = "iṃ", -- Induced by jackbooted I/O
            -- Lao
            [dc("ກັ")] = "a",
            ["າ"] = "ā",
            [dc("ກິ")] = "i",
            [dc("ກີ")] = "ī",
            [dc("ກຸ")] = "u",
            [dc("ກູ")] = "ū",
            --			['ฤ']='ṛ', ['ฤๅ')]='ṝ', ['ฦ']='ḷ', ['ฦๅ']='ḹ', -- Multipart
            ["ເ"] = "e",
            ["ໄ"] = "ai",
            ["ໂ"] = "o",
            [dc("ເກົາ")] = "au",
            [dc("ກ຺")] = "",
            [dc("ກ໌")] = "",
            ["ະ"] = "a",
            [dc("ກຶ")] = "iṃ", -- Induced by jackbooted I/O
            -- Results of subscripts - for 2nd level special subscripts.
            ["ṭ"] = "ṭ",
            ["n"] = "n",
            ["p"] = "p",
            ["m"] = "m",
            ["y"] = "y",
            ["r"] = "r",
            ["l"] = "l",
            ["w"] = "w",
            ["s"] = "s",
            ["h"] = "h"
        }

        local tt = {
            -- Bengali independent vowels
            ["অ"] = "a",
            ["আ"] = "ā",
            ["ই"] = "i",
            ["ঈ"] = "ī",
            ["উ"] = "u",
            ["ঊ"] = "ū",
            ["ঋ"] = "ṛ",
            ["ৠ"] = "ṝ",
            ["ঌ"] = "ḷ",
            ["ৡ"] = "ḹ",
            ["এ"] = "e",
            ["ঐ"] = "ai",
            ["ও"] = "o",
            ["ঔ"] = "au",
            -- chandrabindu, anusvara, visarga & avagraha
            [dc("কঁ")] = "m̐",
            [dc("কং")] = "ṃ",
            ["ঃ"] = "ḥ",
            ["ঽ"] = "’",
            -- numerals
            ["০"] = "0",
            ["১"] = "1",
            ["২"] = "2",
            ["৩"] = "3",
            ["৪"] = "4",
            ["৫"] = "5",
            ["৬"] = "6",
            ["৭"] = "7",
            ["৮"] = "8",
            ["৯"] = "9",
            -- Myanmar independent vowels
            ["အ"] = "a",
            ["အာ"] = "ā",
            ["ဣ"] = "i",
            ["ဤ"] = "ī",
            ["ဥ"] = "u",
            ["ဦ"] = "ū",
            ["ၒ"] = "ṛ",
            ["ၓ"] = "ṝ",
            ["ၔ"] = "ḷ",
            ["ၕ"] = "ḹ",
            ["ဧ"] = "e",
            ["အဲ"] = "ai",
            ["ဩ"] = "o",
            ["ဪ"] = "au", -- 2 of these are multi-character keys!
            -- Mon
            ["ဣဳ"] = "ī",
            ["ဥု"] = "ū",
            ["ဨ"] = "e",
            -- Shan
            ["ဢ"] = "a",
            ["ဢႃ"] = "ā",
            ["ဢိ"] = "i",
            ["ဢီ"] = "ī",
            ["ဢု"] = "u",
            ["ဢူ"] = "ū",
            ["ဢေ"] = "e",
            ["ဢေႃ"] = "o",
            ["ဢဲ"] = "ai",
            ["ဢော်"] = "au",
            -- chandrabindu, anusvara, visarga & avagraha
            --			[dc('က')]='m̐', 
            [dc("ကံ")] = "ṃ",
            ["း"] = "ḥ",
            --  		['']='’',
            -- numerals
            ["၀"] = "0",
            ["၁"] = "1",
            ["၂"] = "2",
            ["၃"] = "3",
            ["၄"] = "4",
            ["၅"] = "5",
            ["၆"] = "6",
            ["၇"] = "7",
            ["၈"] = "8",
            ["၉"] = "9",
            -- Lanna independent vowels
            ["ᩋ"] = "a",
            ["ᩋᩣ"] = "ā",
            ["ᩍ"] = "i",
            ["ᩎ"] = "ī",
            ["ᩏ"] = "u",
            ["ᩐ"] = "ū",
            ["ᩂ"] = "ṛ", -- ['']='ṝ',
            ["ᩄ"] = "ḷ",
            --			['']='ḹ',
            ["ᩑ"] = "e",
            ["ᩒ"] = "o",
            ["ᩋᩰ"] = "o",
            ["ᩋᩮᩣ"] = "o",
            ["ᩐᩣ"] = "au",
            ["ᩋᩱ"] = "ai",
            --			['']='ai', ['']='au', 
            -- chandrabindu, anusvara, visarga & avagraha
            --			[dc('')]='m̐',
            [dc("ᨠᩴ")] = "ṃ",
            ["ᩡ"] = "ḥ",
            [dc("ᨠᩘ")] = "ṅ",
            --			['']='’',
            -- numerals
            ["᪀"] = "0",
            ["᪁"] = "1",
            ["᪂"] = "2",
            ["᪃"] = "3",
            ["᪄"] = "4",
            ["᪅"] = "5",
            ["᪆"] = "6",
            ["᪇"] = "7",
            ["᪈"] = "8",
            ["᪉"] = "9",
            ["᪐"] = "0",
            ["᪑"] = "1",
            ["᪒"] = "2",
            ["᪓"] = "3",
            ["᪔"] = "4",
            ["᪕"] = "5",
            ["᪖"] = "6",
            ["᪗"] = "7",
            ["᪘"] = "8",
            ["᪙"] = "9",
            -- Khmer independent vowels
            ["អ"] = "a",
            ["អា"] = "ā",
            ["ឥ"] = "i",
            ["ឦ"] = "ī",
            ["ឧ"] = "u",
            ["ឨ"] = "ū",
            ["ឫ"] = "ṛ",
            ["ឬ"] = "ṝ",
            ["ឭ"] = "ḷ",
            ["ឮ"] = "ḹ",
            ["ឯ"] = "e",
            ["ឰ"] = "ai",
            ["ឱ"] = "o",
            ["ឲ"] = "o",
            ["ឳ"] = "au",
            -- chandrabindu, anusvara, visarga & avagraha
            --			[dc('ក')]='m̐',
            [dc("កំ")] = "ṃ",
            ["ះ"] = "ḥ",
            --			['']='’',
            -- numerals
            ["០"] = "0",
            ["១"] = "1",
            ["២"] = "2",
            ["៣"] = "3",
            ["៤"] = "4",
            ["៥"] = "5",
            ["៦"] = "6",
            ["៧"] = "7",
            ["៨"] = "8",
            ["៩"] = "9",
            ["៰"] = "0",
            ["៱"] = "1",
            ["៲"] = "2",
            ["៳"] = "3",
            ["៴"] = "4",
            ["៵"] = "5",
            ["៶"] = "6",
            ["៷"] = "7",
            ["៸"] = "8",
            ["៹"] = "9",
            -- Thai miscellanea
            -- independent vowels
            ["ฤ"] = "ṛ",
            ["ฤๅ"] = "ṝ",
            ["ฦ"] = "ḷ",
            ["ฦๅ"] = "ḹ",
            -- chandrabindu, anusvara, visarga & avagraha
            --			[dc('ក')]='m̐',
            [dc("กํ")] = "ṃ",
            ["ะ"] = "ḥ",
            --			['']='’',
            -- numerals
            ["๐"] = "0",
            ["๑"] = "1",
            ["๒"] = "2",
            ["๓"] = "3",
            ["๔"] = "4",
            ["๕"] = "5",
            ["๖"] = "6",
            ["๗"] = "7",
            ["๘"] = "8",
            ["๙"] = "9",
            -- Lao miscellanea
            -- chandrabindu, anusvara, visarga & avagraha
            --			[dc('ក')]='m̐',
            [dc("ກໍ")] = "ṃ",
            ["ະ"] = "ḥ",
            --			['']='’',
            -- numerals
            ["໐"] = "0",
            ["໑"] = "1",
            ["໒"] = "2",
            ["໓"] = "3",
            ["໔"] = "4",
            ["໕"] = "5",
            ["໖"] = "6",
            ["໗"] = "7",
            ["໘"] = "8",
            ["໙"] = "9",
            -- All scripts
            -- punctuation        
            ["॥"] = ".",
            ["။"] = ".",
            ["᪩"] = ".",
            ["᪫"] = ".",
            ["៕"] = ".",
            ["๚"] = ".", -- double danda
            ["।"] = ".",
            ["၊"] = ".",
            ["‌᪨"] = ".",
            ["᪪"] = ".",
            ["។"] = ".",
            ["ฯ"] = ".",
            ["ຯ"] = ".", -- danda
            -- Vedic extensions
            ["ᳵ"] = "x",
            ["ᳶ"] = "f",
            -- Om
            --  		['ॐ']='oṃ',
            -- reconstructed
            ["*"] = ""
        }
        -- Also handle subscript consonants encoded as marks.
        local S = dc("ကျကြကွကှကၞကၟကၠ") .. -- Myanmar subscripts
        dc("ᨠᩕᨠᩖᨠᩛᨠᩜᨠᩝᨠᩞ") -- Lanna subscripts
        -- consonants and part 1 of NFC-multi-part independent vowels.
        local C = "[কখগঘঙচছজঝঞটঠডঢণতথদধনপফবভমযরলवळশষসহৰৱ" .. -- Bengali
        "ကခဂဃငစဆဇဈဉဋဌဍဎဏတထဒဓနပဖဗဘမယရလဝဠၐၑသဟညဿအ" .. -- Myanmar Part 1
        "ၚၛၵၶၷꧠၸꧡၹꧢၺꩦꩧꩨꩩꧣၻꩪၼၽၿꧤꩮႁဢဣဥ" .. -- Myanmar Part 2 (Mon and Shan)
        "ᨠᨡᨣᨥᨦᨧᨨᨩᨫᨬᨭᨮᨯᨰᨱᨲᨳᨴᨵᨶᨷᨸᨹᨻᨽᨾᨿᩁᩃᩅᩊᩆᩇᩈᩉᩔᩋᩐ" .. -- Lanna
        "កខគឃងចឆជឈញដឋឌឍណតថទធនបផពភមយរលវឡឝសឞហអ" .. -- Khmer
        "กขคฆงจฉชฌญฏฐฑฒณตถทธนปผพภมยรลวศษสหฬอฤฦ" .. -- Thai.
        "ກຂຄຆງຈຉຊຌຎຏຐຑຒຓຕຖທຘນປຜພຠມຍຢຣລວຨຩສຫຬອ" .. -- Lao
        S .. "][" .. u(0x09bc, 0x200d) .. "]?" -- And allow Bengali nukta or necessary ZWJ.

        -- One character diacritics 
        local dia = dc("[কাকিকীকুকূকৃকৄকৢকৣকেকৈকোকৌক্" .. -- Bengali
        "ကာကါကိကီကုကူကၖကၗကၘကၙကေကဲက္က်ကဳကႃ" .. -- Myanmar
        "ᨠᩣᨠᩤᨠᩥᨠᩦᨠᩩᨠᩪᩂᩄᨠᩮᨠᩱᨠᩰᨠ᩠ᨠ᩺ᨠ᩼" .. -- Lanna
        "ᨠᩫᩢ" .. -- Lanna diacritics in second or third place.
        "កាកិកីកុកូកេកៃកោកៅក្ក៑" .. -- Khmer
        "กักุิกูีเโไาๅฤฦกฺกึก์" .. -- Thai
        "ກັກຸິກູີເກົາໂໄກ຺ກຶກ໌" .. -- Lao
        "]")
        local diax = {}
        local ti = table.insert;
        ti(diax, "(")
        ti(diax, dia)
        ti(diax, "?")
        ti(diax, dia)
        ti(diax, "?")
        ti(diax, dia)
        ti(diax, "?")
        ti(diax, dia)
        ti(diax, "?)")
        diax = table.concat(diax)
        local explicit = nil
        if options and options.impl then
            if options.impl == "yes" then
                explicit = false
            elseif options.impl == "no" then
                explicit = true
            end
        end
        if sc == "Khmr" then
            dep_liquid = "(" .. C .. dc(")(ក្)") .. "([ឫឬឭឮ])"; -- Avoid gsub in gsub bug.
            text = gsub(text, dep_liquid, function(c, j, d) return consonants[c] .. d end)
            -- Regularise robat
            robat_fix3 = "(" .. C .. dc("ក្") .. C .. dc("ក្") .. C .. ")(" .. dc("ក៌)")
            robat_fix2 = "(" .. C .. dc("ក្") .. C .. ")(" .. dc("ក៌)")
            robat_fix1 = "(" .. C .. ")(" .. dc("ក៌)")
            derobatted = "រ្" .. "%1"
            text = gsub(text, robat_fix3, derobatted)
            text = gsub(text, robat_fix2, derobatted)
            text = gsub(text, robat_fix1, derobatted)
        elseif sc == "Thai" or sc == "Laoo" then
            local match = mw.ustring.match
            local v1 = dc("[กัກັ]")
            local v2 = dc("[กัะກັະ]")
            local va = dc("[กฺ]")
            if lang == "sa" then
                if match(text, v1) then explicit = true end -- SARA A is visarga!
            else
                if match(text, v2) then explicit = true end
            end
            local yLao, nuktaed
            if sc == "Laoo" then
                if options and options.y then
                    if options.y == "yaa" or options.y == "ຢ" then
                        yLao = "yaa"
                    elseif options.y == "yung" or options.y == "ຍ" then
                        yLao = "yung"
                    end
                end
                if not yLao then
                    if match(text, "ຢ") then
                        yLao = "yaa"
                    else
                        yLao = "yung"
                    end
                end
                if explicit then
                    nuktaed = match(text, u(0xeba))
                else
                    local str
                    if lang == "sa" then
                        str = dc("ກ຺[ກັາກຸິກູີ]")
                    else
                        str = dc("ກ຺[ກັາກຸິກູີະ]")
                    end
                    nuktaed = match(text, str)
                end
                if nuktaed then -- Convert to extended alphabet
                    rs = {["ຄ຺"] = "ຆ", ["ສ຺"] = "ຉ", ["ຊ຺"] = "ຌ", ["ຍ຺"] = "ຎ", ["ຕ຺"] = "ຏ", ["ຖ຺"] = "ຐ", ["ດ"] = "ຑ", ["ນ຺"] = "ຓ", ["ທ຺"] = "ຘ", ["ພ຺"] = "ຠ", ["ລ຺"] = "ຬ", ["ງ຺"] = dc("ໍກ")}
                    text = gsub(text, "[ຄສຊຍຕຖດນທພລງ]" .. u(0xeba) .. "?", rs)
                    explicit = true
                end
                if yLao == "yaa" then text = gsub(text, "ຍ", "ຎ") end
            end
            if match(text, va) then explicit = false end
            if explicit == nil then
                -- It looks as though gsub (from dc()) and match interfere, so need local variables.
                local ngf1 = dc("[กักิกุກັກິກຸ][งງ]$")
                local ngf2 = dc("[กักิกุກັກິກຸ][งງ] ")
                if (match(text, ngf1) or match(text, ngf2)) then explicit = true end
            end
            if not explicit then
                diax = gsub(diax, "[ฤฦ]", "า") -- Treat as ฤ and ฦ consonants.
                local search = "([เโไເໂໄ])(" .. C .. ")([" .. u(0x0e3a, 0xeba) .. "])"
                local longswap = function(p, c, v) return c .. v .. p end
                text = gsub(text, search, longswap)
                text = gsub(text, search, longswap)
            end
            if false and sc == "Laoo" then -- Keep around for future debugging
                local nr = "F"
                if nuktaed then nr = "T" end
                if yLao then
                    nr = nr .. yLao
                else
                    nr = nr .. "y?"
                end
                nr = nr .. "-"
                if not options or not options.impl then
                    if explicit == nil then
                        text = "GN-" .. nr .. text
                    elseif explicit == false then
                        text = "GI-" .. nr .. text
                    else
                        text = "GE-" .. nr .. text
                    end
                elseif options.impl == "both" then
                    if explicit == nil then
                        text = "N-" .. nr .. text
                    elseif explicit == false then
                        text = "I-" .. nr .. text
                    else
                        text = "E-" .. nr .. text
                    end
                elseif options.impl == "yes" then
                    text = "Y-" .. nr .. text
                elseif options.impl == "no" then
                    text = "N-" .. nr .. text
                elseif options.impl then
                    text = options.impl .. nr .. text
                end
            end
            local pair = "([เโไເໂໄ])(" .. C .. ")"
            text = gsub(text, pair, "%2%1")
            if explicit and lang ~= "sa" then -- SARA A is a vowel.
                diax = "([ะະ" .. string.sub(diax, 3)
            end
            if explicit and sc == "Laoo" then -- Clean up clusters
                ass = {["ກຄ"] = "ຄຄ", ["ດຈ"] = "ຈຈ", ["ດຊ"] = "ຊຊ", ["ດຕ"] = "ຕຕ", ["ດຖ"] = "ຕຖ", ["ດທ"] = "ທທ", ["ດສ"] = "ສສ", ["ຍຈ"] = "ຎຈ", ["ຍສ"] = "ຎຉ", ["ຍຊ"] = "ຎຊ", ["ນຈ"] = "ນຈ", ["ນສ"] = "ຎຉ", ["ນຊ"] = "ຎຊ", ["ນຍ"] = "ຎຎ", ["ບປ"] = "ປປ", ["ບຜ"] = "ປຜ", ["ບພ"] = "ພພ", ["ບ"] = "ປ"}
                text = gsub(text, "[ກດບຍນ][ຄຕຖທປຜພສລຈສຊຍ]?", ass)
            end
        end
        if sc == "Lana" then
            -- Disambiguate lanna combining loop below.
            cl_search = dc("[ᨲᨻᨾ]ᨠᩛ")
            text = gsub(text, cl_search, {["ᨲᩛ"] = "ᨲ᩠ᨳ", ["ᨻᩛ"] = "ᨻ᩠ᨻ", ["ᨾᩛ"] = "ᨾ᩠ᨻ"})
        end
        if sc == "Mymr" or sc == "Lana" then
            local fn = function(c, d) return consonants[c] .. d end
            local search = "(" .. C .. ")([" .. S .. "])"
            text = gsub(text, search, fn);
            text = gsub(text, search, fn); -- and again
        end
        if sc == "Beng" then
            -- Aberrant conversion:
            text = gsub(text, u(0x09b2, 0x9cd, 0x9bc, 0x9cd, 0x9b9), "ḷহ") -- raw
            text = gsub(text, u(0x09b2, 0x9bc, 0x9cd, 0x9cd, 0x9b9), "ḷহ") -- NFC
            -- Proper conversion:
            text = gsub(text, u(0x09b2, 0x9cd, 0x9bc, 0x9b9), "ḷহ") -- not NFC
            --			text = gsub(text, u(0x09b2, 0x9bc, 0x9cd, 0x9b9), 'ḷহ') -- NFC
        end
        text = gsub(text, "(" .. C .. ")" .. diax, function(c, d)
            local val = tt[c .. d]
            if val then return val end
            local cn = consonants[c]
            if not cn then return "X(" .. c .. ")" end
            if d ~= "" then
                return cn .. (diacritics[d] or "NIL(" .. d .. ")")
            elseif explicit then
                return cn
            else
                return cn .. "a"
            end
        end)
        text = gsub(text, ".", tt)
        -- Bodge alphabetic Thai and Lao anusvara
        if explicit and text then
            text = gsub(text, "ṅ$", "ṃ")
            text = gsub(text, "ṅ([^kg])", "ṃ%1")
        end
    else
        text = nil -- Not ready for use yet!
    end
    return text
end

function export.tr(text, lang, sc) return export.trwo(text, lang, sc, {}) end

return export
