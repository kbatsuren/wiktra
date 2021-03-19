# Wiktra - Python tool of Wiktionary Transliteration modules

Wiktra is a unicode transliteration tool as a python port of Wiktionary transliteration modules that are written in Lua at the following link.
https://en.wiktionary.org/wiki/Category:Transliteration_modules

Currently, Wiktra supports 181 languages (using non-roman orthography) and its 60 different ortographies, and the table in the supporting languages section displays their language name and corresponding 3-letter codes.

## Installation && Setup

As much as you want to use your favorite version of Python, it is recommended to employ 3.5 version on the grounds that the module utilizes lupa-1.8. Lupa enables Python to adopt functionalities of Lua language, in which most of the transliteration modules are written.

The following commands prepare a python environment via Anaconda, which promotes the version and the module dependencies:

First:
```sh
$ pip install lupa
$ conda create -n scr2scr_env python=3.5
```

Second:
```sh
$ conda activate scr2scr_env
```

Start your Python (3.5.x):
```sh
$ python
```

## Fixing LuaError: module 'wikt.mw' not found:
This error is raising due to lupa is not able to find a current directory. 
Easiest way to fix this issue is as follows:
  
In Windows you can see similar error: 
![image](https://user-images.githubusercontent.com/50955407/111557773-4671bc80-87c8-11eb-909d-bbb028b8b4a4.png)

Here all you need to do is two things. 
  1) create a folder 'lua' in 'C:\ProgramData\Miniconda3\'
  2) copy the entire folder of wikt into 'C:\ProgramData\Miniconda3\lua'

It should be similar to Linux and MacOs.

## Example

After placing the package directory inside your project directory or paths subscribed by Python, just run the following:

```sh
from wiktra import translite as tr
```
The package offers only function `translite` and it prompts you to provide two parameters (text, 639-2 code):

```sh
#mongolian script
tr('монгол бичлэг', 'mon')
> mongol bichleg

#hindu script
tr('हिंदी लिपि', 'hin')
> hindee lipi
```

## Example comparison with the state-of-the-art universal transliteration tools
![alt text](http://ukc.disi.unitn.it/wp-content/uploads/2019/08/comparison_wiktra.jpg)


## Supporting Languages


|     | Language                     | iso-3 in use | wiktionary code | Supporting script        | examples                                                      |
|-----|------------------------------|--------------|-----------------|--------------------------|---------------------------------------------------------------|
| 1   | Abaza                        | abq          | abq             | Latn                     |                                                               |
| 2   | Abkhazian                    | abk          | ab              | Cyrl                     |                                                               |
| 3   | Adyghe                       | ady          | ady             | Cyrl                     |                                                               |
| 4   | Ahom                         | aho          | aho             | Ahom                     | https://en.wiktionary.org/wiki/Module:Ahom-translit/testcases |
| 5   | Ainu                         | ain          | ain             | Kana                     | https://en.wiktionary.org/wiki/Module:ain-translit/testcases  |
| 6   | Altai, Southern              | alt          | altai           | Cyrl                     |                                                               |
| 7   | Amharic                      | amh          | am              | Ethiopic                 | https://en.wiktionary.org/wiki/Module:Ethi-translit/testcases |
| 8   | Ancient Greek                | grc-c        | grc             | Cypriot script           |                                                               |
| 9   | Ancient Greek                | grc          | grc             | Greek (Polythonic)       | https://en.wiktionary.org/wiki/Module:grc-translit/testcases  |
| 10  | Ancient Macedonian           | xmk          | xmk             | Greek (Polythonic)       | https://en.wiktionary.org/wiki/Module:grc-translit/testcases  |
| 11  | Arabic                       | ara          | ar              | Arab                     | https://en.wiktionary.org/wiki/Module:ar-translit/testcases   |
| 12  | Ardhamagadhi Prakrit         | pka          | pka             | Brahmi                   |                                                               |
| 13  | Armenian                     | arm          | armn            | Armn                     |                                                               |
| 14  | Ashokan Prakrit              | inc-ash      | inc-ash         | Brahmi                   |                                                               |
| 15  | Ashokan Prakrit              | inc-ash-k    | inc-ash         | Kharoshthi script        | https://en.wiktionary.org/wiki/Module:Khar-translit/testcases |
| 16  | Assamese                     | asm          | as              | as-Beng                  |                                                               |
| 17  | Avaric                       | ava          | av              | Cyrl                     |                                                               |
| 18  | Avestan                      | ave          | avst            | Avst                     |                                                               |
| 19  | Awadhi                       | awa          | awa             | Devanagari               |                                                               |
| 20  | Bactrian                     | xbc          | xbc             | Grek                     |                                                               |
| 21  | Bagheli                      | bfy          | bfy             | Devanagari               |                                                               |
| 22  | Bashkir                      | bak          | ba              | Cyrl                     |                                                               |
| 23  | Bats                         | bbl          | bbl             | Georgian script          | https://en.wiktionary.org/wiki/Module:Geor-translit/testcases |
| 24  | Belarusian                   | bel          | be              | Cyrl                     |                                                               |
| 25  | Bengali                      | ben          | bn              | Beng                     |                                                               |
| 26  | Berber*                      | ber          | ber             | Tfng                     |                                                               |
| 27  | Bhadrawahi                   | bhd          | bhd             | Devanagari               |                                                               |
| 28  | Bhojpuri                     | bho          | bho             | Deva                     |                                                               |
| 29  | Bilaspuri                    | kfs          | kfs             | Devanagari               |                                                               |
| 30  | Blin                         | byn          | byn             | Ethiopic                 | https://en.wiktionary.org/wiki/Module:Ethi-translit/testcases |
| 31  | Braj                         | bra          | bra             | Devanagari               |                                                               |
| 32  | Budukh                       | bud          | bdk             | Cyrl                     |                                                               |
| 33  | Bulgarian                    | bul          | bg              | Cyrl                     |                                                               |
| 34  | Bundeli                      | bns          | bns             | Devanagari               |                                                               |
| 35  | Burmese                      | mya          | my              | Burmese                  |                                                               |
| 36  | Buryat                       | bua          | bua             | Cyrl                     |                                                               |
| 37  | Canadian syllabics           | cans         | cans            | Canadian syllabics       |                                                               |
| 38  | Cappadocian Greek            | cpg          | cpg             | Greek (Polythonic)       | https://en.wiktionary.org/wiki/Module:grc-translit/testcases  |
| 39  | Chaha                        | sem-cha      | sem-cha         | Ethiopic                 | https://en.wiktionary.org/wiki/Module:Ethi-translit/testcases |
| 40  | Chambeali                    | cdh          | cdh             | Devanagari               |                                                               |
| 41  | Chechen                      | che          | ce              | Cyrl                     |                                                               |
| 42  | Cherokee                     | chr          | cher            | Cher                     |                                                               |
| 43  | Churahi                      | cdj          | cdj             | Devanagari               |                                                               |
| 44  | Church Slavic                | chu          | cv              | Cyrl                     |                                                               |
| 45  | Coptic                       | cop          | copt            | Copt                     |                                                               |
| 46  | Cree                         | cre          | cr              | Cans                     |                                                               |
| 47  | Dargwa                       | dar          | dar             | Cyrl                     |                                                               |
| 48  | Dhivehi                      | div          | dv              | Thaa                     |                                                               |
| 49  | Dogri                        | doi-d        | doi             | Devanagari               |                                                               |
| 50  | Dolgan                       | dlg          | dlg             | Cyrl                     |                                                               |
| 51  | Doteli                       | dty          | dty             | Deva                     |                                                               |
| 52  | Dungan                       | dng          | dng             | Cyrl                     |                                                               |
| 53  | Eastern Mari                 | chm          | chm             | Cyrl                     |                                                               |
| 54  | Erzya                        | myv          | myv             | Cyrl                     |                                                               |
| 55  | Even                         | eve          | eve             | Cyrl                     |                                                               |
| 56  | Evenki                       | evn          | evn             | Cyrl                     |                                                               |
| 57  | Gaddi                        | gbk          | gbk             | Devanagari               |                                                               |
| 58  | Gandhari                     | pgd-k        | pgd             | Kharoshthi script        | https://en.wiktionary.org/wiki/Module:Khar-translit/testcases |
| 59  | Garhwali                     | gbm          | gbm             | Devanagari               |                                                               |
| 60  | Ge'ez                        | gez          | gez             | Ethiopic                 | https://en.wiktionary.org/wiki/Module:Ethi-translit/testcases |
| 61  | Georgian                     | geo          | geor            | Georgian script          | https://en.wiktionary.org/wiki/Module:Geor-translit/testcases |
| 62  | Gothic                       | got          | goth            | Gothic script            |                                                               |
| 63  | Gujarati                     | guj          | gu              | Gujarati                 | https://en.wiktionary.org/wiki/Module:gu-translit/testcases   |
| 64  | Hadrami                      | xhd          | xhd             | Old South Arabian script |                                                               |
| 65  | Harami                       | xha          | xha             | Old South Arabian script |                                                               |
| 66  | Harari                       | har          | har             | Ethiopic                 | https://en.wiktionary.org/wiki/Module:Ethi-translit/testcases |
| 67  | Haryanvi                     | bgc          | bgc             | Devanagari               |                                                               |
| 68  | Hebrew                       | heb          | he              | Hebrew                   |                                                               |
| 69  | Hindi                        | hin          | hi              | Devanagari               |                                                               |
| 70  | Ingush                       | inh          | inh             | Cyrl                     |                                                               |
| 71  | Inuktitut                    | iku          | iu              | Cans                     |                                                               |
| 72  | Javanese (also Old Javanese) | jav          | jv              | Latn                     |                                                               |
| 73  | Kabardian                    | kbd          | kbd             | Cyrl                     |                                                               |
| 74  | Kachchi                      | kfr          | kfr             | Gujarati                 | https://en.wiktionary.org/wiki/Module:gu-translit/testcases   |
| 75  | Kalmyk                       | xal          | xal             | Cyrl                     | https://en.wiktionary.org/wiki/Module:xal-translit/testcases  |
| 76  | Kangri                       | xnr          | xnr             | Devanagari               |                                                               |
| 77  | Kannada                      | kan          | kn              | Knda                     |                                                               |
| 78  | Karachay-Balkar              | krc          | krc             | Cyrl                     |                                                               |
| 79  | Karaim                       | kdr          | kdr             | Cyrl                     |                                                               |
| 80  | Karakalpak                   | kaa          | kaa             | Latn                     |                                                               |
| 81  | Kashmiri                     | kas          | ks              | Kashmiri arabic          |                                                               |
| 82  | Kazakh                       | kaz          | kk              | Cyrl                     |                                                               |
| 83  | Khakas                       | kjh          | kjh             | Cyrl                     |                                                               |
| 84  | Khanty                       | kca          | kca             | Cyrl                     |                                                               |
| 85  | Khinalugh                    | kjj          | kjj             | Cyrl                     |                                                               |
| 86  | Khmer                        | khm          | km              | Khmer script             |                                                               |
| 87  | Khotanese                    | kho          | kho             | Brahmi                   |                                                               |
| 88  | Kildin Sami                  | sjd          | sjd             | Cyrl                     |                                                               |
| 89  | Kipchak                      | qwm          | qwm             | Latn                     |                                                               |
| 90  | Komi-Permyak                 | koi          | koi             | Cyrl                     |                                                               |
| 91  | Komi-Zyrian                  | kpv          | kpv             | Cyrl                     |                                                               |
| 92  | Konkani                      | kok          | kok             | Deva                     |                                                               |
| 93  | Korean                       | kor          | ko              | Kore                     |                                                               |
| 94  | Kullu Pahari                 | kfx          | kfx             | Devanagari               |                                                               |
| 95  | Kumyk                        | kum          | kum             | Cyrl                     |                                                               |
| 96  | Kyrgyz                       | kir          | ky              | Cyrl                     |                                                               |
| 97  | Lak                          | lbe          | lbe             | Cyrl                     |                                                               |
| 98  | Lao                          | lao          | lo              | Laoo                     |                                                               |
| 99  | Latin-to-Tamil               | tam          | en-ta           | Latn                     |                                                               |
| 100 | Laz                          | lzz          | lzz             | Georgian script          | https://en.wiktionary.org/wiki/Module:Geor-translit/testcases |
| 101 | Lepcha                       | lep          | lep             | Lepcha                   |                                                               |
| 102 | Lezgi                        | lez          | lez             | Cyrl                     |                                                               |
| 103 | Limbu                        | lif          | lif             | Limbu                    |                                                               |
| 104 | Lü                           | khb          | khb             | New Tai Lue              |                                                               |
| 105 | Lycian                       | xlc          | xlc             | Lycian                   |                                                               |
| 106 | Lydian                       | xld          | xld             | Lydi                     |                                                               |
| 107 | Macedonian                   | mkd          | mk              | Cyrl                     |                                                               |
| 108 | Magadhi Prakrit              | inc-mgd      | inc-mgd         | Brahmi                   |                                                               |
| 109 | Maharastri Prakrit           | pmh          | pmh             | Brahmi                   |                                                               |
| 110 | Mahasu Pahari                | bfz          | bfz             | Devanagari               |                                                               |
| 111 | Malayalam                    | mal          | ml              | Mlym                     |                                                               |
| 112 | Mandeali                     | mjl          | mjl             | Devanagari               |                                                               |
| 113 | Mansi                        | mns          | mns             | Cyrl                     |                                                               |
| 114 | Marathi                      | mar          | mr              | Deva                     |                                                               |
| 115 | Marwari                      | mwr          | mwr             | Devanagari               |                                                               |
| 116 | Mewari                       | mtr          | mtr             | Devanagari               |                                                               |
| 117 | Middle Assamese              | inc-mas      | inc-mas         | Assamese                 |                                                               |
| 118 | Middle   Persian             | pal-m        | pal             | Manichaean script        |                                                               |
| 119 | Middle Persian               | pal-p        | pal             | Phli                     |                                                               |
| 120 | Minaean                      | inm          | inm             | Old South Arabian script |                                                               |
| 121 | Mingrelian                   | xmf          | xmf             | Georgian script          | https://en.wiktionary.org/wiki/Module:Geor-translit/testcases |
| 122 | Moksha                       | mdf          | mdf             | Cyrl                     |                                                               |
| 123 | Mongolian                    | mon          | mon             | Cyrl                     |                                                               |
| 124 | Mundari                      | unr          | unr             | Devanagari               |                                                               |
| 125 | Mycenaean Greek              | gmy          | gmy             | Linear B script          |                                                               |
| 126 | Naskapi                      | nsk          | nsk             | Canadian syllabics       |                                                               |
| 127 | Nepali                       | nep          | ne              | Deva                     |                                                               |
| 128 | Newar                        | new          | new             | Deva                     |                                                               |
| 129 | Nivkh                        | niv          | niv             | Cyrl                     |                                                               |
| 130 | Nogai                        | nog          | nog             | Cyrl                     |                                                               |
| 131 | Northern Kurdish             | kmr          | kmr             | Latn                     |                                                               |
| 132 | Northern Yukaghir            | ykg          | ykg             | Cyrl                     |                                                               |
| 133 | Old Church Slavonic          | chu-old-c    | cu              | Old Cyrillic alphabets   |                                                               |
| 134 | Old Church Slavonic          | chu-old-g    | cu              | Glagolitic alphabets     |                                                               |
| 135 | Old East Slavic              | orv          | orv             | Old Cyrillic alphabets   |                                                               |
| 136 | Old Georgian                 | oge          | oge             | Georgian script          | https://en.wiktionary.org/wiki/Module:Geor-translit/testcases |
| 137 | Old Hindi                    | inc-ohi      | inc-ohi         | Deva                     | https://en.wiktionary.org/wiki/Module:sa-translit/testcases   |
| 138 | Old Italic                   | ita-old      | ital            | Old Italic script        |                                                               |
| 139 | Old Marathi                  | omr          | omr             | Deva                     |                                                               |
| 140 | Old Novgorodian              | zle-ono-c    | zle-ono         | Old Cyrillic alphabets   |                                                               |
| 141 | Old Novgorodian              | zle-ono-g    | zle-ono         | Glagolitic alphabets     |                                                               |
| 142 | Old Ossetic                  | oos          | oos             | Greek (Polythonic)       | https://en.wiktionary.org/wiki/Module:grc-translit/testcases  |
| 143 | Old Persian                  | peo          | peo             | Old Persian              |                                                               |
| 144 | Old Tamil                    | oty          | oty             | Brahmi                   |                                                               |
| 145 | Orya                         | ori          | or              | Oriya                    |                                                               |
| 146 | Ossetian                     | oss          | os              | Cyrl                     |                                                               |
| 147 | Paeonian                     | ine-pae      | ine-pae         | Greek (Polythonic)       | https://en.wiktionary.org/wiki/Module:grc-translit/testcases  |
| 148 | Paisaci Prakrit              | inc-psc      | inc-psc         | Brahmi                   |                                                               |
| 149 | Palya Bareli                 | bpx          | bpx             | Devanagari               |                                                               |
| 150 | Pangwali                     | pgg          | pgg             | Devanagari               |                                                               |
| 151 | Parthian                     | xpr          | xpr             | Manichaean script        |                                                               |
| 152 | Parthian                     | xpr          | xpr             | Parthian                 |                                                               |
| 153 | Persian                      | fas          | fa              | fa-Arab                  |                                                               |
| 154 | Phrygian                     | xpg          | xpg             | Greek (Polythonic)       | https://en.wiktionary.org/wiki/Module:grc-translit/testcases  |
| 155 | Pontic Greek                 | pnt          | pnt             | Greek (Polythonic)       | https://en.wiktionary.org/wiki/Module:grc-translit/testcases  |
| 156 | Punjabi                      | pan          | pal             | Guru                     |                                                               |
| 157 | Qatabanian                   | xqt          | xqt             | Old South Arabian script |                                                               |
| 158 | Russian                      | rus          | ru              | Cyrl                     | https://en.wiktionary.org/wiki/Module:ru-translit/testcases   |
| 159 | Rusyn                        | rue          | rue             | Cyrl                     |                                                               |
| 160 | Sabaean                      | xsa          | xsa             | Old South Arabian script |                                                               |
| 161 | Sambalpuri                   | spv          | spv             | Oriya                    |                                                               |
| 162 | Sanskrit                     | san          | sa              | Deva                     |                                                               |
| 163 | Santali                      | sat          | sat             | Ol Chiki                 |                                                               |
| 164 | Sauraseni Prakrit            | psu          | psu             | Brahmi                   |                                                               |
| 165 | Sichuan Yi                   | iii          | ii              | Yi script                |                                                               |
| 166 | Sinhalese                    | sin          | si              | Sinh                     |                                                               |
| 167 | Sogdian                      | sog          | sog             | Manichaean script        |                                                               |
| 168 | Tajik                        | tgk          | tg              | Cyrl                     |                                                               |
| 169 | Takka Apabhramsa             | inc-tak      | inc-tak         | Deva                     |                                                               |
| 170 | Tamil                        | tam          | ta              | Tamil                    |                                                               |
| 171 | Tatar                        | tat          | tt              | Cyrl                     |                                                               |
| 172 | Telugu                       | tel          | te              | Telu                     | https://en.wiktionary.org/wiki/Module:te-translit/testcases   |
| 173 | Thai*                        | tha          | th              | Thai                     | https://en.wiktionary.org/wiki/Module:th-translit/testcases   |
| 174 | Thracian                     | txh          | txh             | Greek                    |                                                               |
| 175 | Tibetan                      | bod          | bo              | Tibetan                  | https://en.wiktionary.org/wiki/Module:bo-translit/testcases   |
| 176 | Tigre                        | tig          | tig             | Ethiopic                 | https://en.wiktionary.org/wiki/Module:Ethi-translit/testcases |
| 177 | Tigrinya                     | tir          | ti              | Ethiopic                 | https://en.wiktionary.org/wiki/Module:Ethi-translit/testcases |
| 178 | Tuvan                        | tyv          | tyv             | Cyrl                     |                                                               |
| 179 | Udi                          | udi          | udi             | Cyrl                     |                                                               |
| 180 | Udi                          | udi          | udi             | Georgian script          | https://en.wiktionary.org/wiki/Module:Geor-translit/testcases |
| 181 | Udmurt                       | udm          | udm             | Cyrl                     |                                                               |
| 182 | Ukrainian                    | ukr          | uk              | Cyrl                     | https://en.wiktionary.org/wiki/Module:uk-translit/testcases   |
| 183 | Urdu                         | urd          | ur              | Urdu Arabic              |                                                               |
| 184 | Uyghur                       | uig          | ug              | Uyghur Arabic            | https://en.wiktionary.org/wiki/Module:ug-translit/testcases   |
| 185 | Vaghri                       | vgr          | vgr             | Gujarati                 | https://en.wiktionary.org/wiki/Module:gu-translit/testcases   |
| 186 | Vracada Apabhramsa           | inc-vra      | inc-vra         | Deva                     |                                                               |
| 187 | Wakhi                        | wbl          | wbl             | Cyrl                     |                                                               |
| 188 | Yagnobi                      | yai          | yai             | Cyrl                     |                                                               |
| 189 | Yakut                        | sah          | sah             | Cyrl                     |                                                               |


## License
This tool is available under the Creative Commons Attribution-ShareAlike License. Read more about this license from https://creativecommons.org/licenses/by-sa/3.0/.


## Reference
For the acedemic use, please cite the following article:

Khuyagbaatar Batsuren, Gabor Bella, and Fausto Giunchiglia – CogNet: A large-scale cognate database, Proceedings of The 57th Annual Meeting of the Association for Computational Linguistics (ACL), 2019.
