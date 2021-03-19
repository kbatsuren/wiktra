# Wiktra - Python tool of Wiktionary Transliteration modules

Wiktra is a unicode transliteration tool as a python port of Wiktionary transliteration modules that are written in Lua at the following link.
https://en.wiktionary.org/wiki/Category:Transliteration_modules

Currently, Wiktra supports 181 languages and its 60 different orthographies, and the table in the supporting languages section displays their language name and corresponding 3-letter codes. This tool is used to build a large-scale, high quality cognate database, called (CogNet)[www.github.com/kbatsuren/CogNet].

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

#devanagari script
tr('हिंदी लिपि', 'hin')
> hindee lipi
```

## Example comparison with the state-of-the-art universal transliteration tools
![alt text](http://ukc.disi.unitn.it/wp-content/uploads/2019/08/comparison_wiktra.jpg)


## Supporting Languages


|     | Language                     | iso-3 in use | wiktionary code | Supporting script        | examples                                                      |
|-----|------------------------------|--------------|-----------------|--------------------------|---------------------------------------------------------------|
| 1   | Abaza                        | abq          | abq             | Latn                     |                                                               |
| 2   | Abkhazian                    | abk          | ab              | Cyrillic                 |                                                               |
| 3   | Adyghe                       | ady          | ady             | Cyrillic                 |                                                               |
| 4   | Ahom                         | aho          | aho             | Ahom                     | [Ahom testcases](https://en.wiktionary.org/wiki/Module:Ahom-translit/testcases) |
| 5   | Ainu                         | ain          | ain             | Kana                     | [Ainu testcases](https://en.wiktionary.org/wiki/Module:ain-translit/testcases)  |
| 6   | Altai, Southern              | alt          | altai           | Cyrillic                 |                                                               |
| 7   | Amharic                      | amh          | am              | Ethiopic                 | [Amharic testcases](https://en.wiktionary.org/wiki/Module:Ethi-translit/testcases) |
| 8   | Ancient Greek                | grc-c        | grc             | Cypriot script           |                                                               |
| 9   | Ancient Greek                | grc          | grc             | Greek (Polythonic)       | [tests](https://en.wiktionary.org/wiki/Module:grc-translit/testcases)  |
| 10  | Ancient Macedonian           | xmk          | xmk             | Greek (Polythonic)       | [tests](https://en.wiktionary.org/wiki/Module:grc-translit/testcases)  |
| 11  | Arabic                       | ara          | ar              | Arab                     | [tests](https://en.wiktionary.org/wiki/Module:ar-translit/testcases)   |
| 12  | Ardhamagadhi Prakrit         | pka          | pka             | Brahmi                   |                                                               |
| 13  | Armenian                     | arm          | armn            | Armn                     |                                                               |
| 14  | Ashokan Prakrit              | inc-ash      | inc-ash         | Brahmi                   |                                                               |
| 15  | Ashokan Prakrit              | inc-ash-k    | inc-ash         | Kharoshthi script        | [tests](https://en.wiktionary.org/wiki/Module:Khar-translit/testcases) |
| 16  | Assamese                     | asm          | as              | as-Beng                  |                                                               |
| 17  | Avaric                       | ava          | av              | Cyrillic                 |                                                               |
| 18  | Avestan                      | ave          | avst            | Avst                     |                                                               |
| 19  | Awadhi                       | awa          | awa             | Devanagari               |                                                               |
| 20  | Bactrian                     | xbc          | xbc             | Grek                     |                                                               |
| 21  | Bagheli                      | bfy          | bfy             | Devanagari               |                                                               |
| 22  | Bashkir                      | bak          | ba              | Cyrillic                 |                                                               |
| 23  | Bats                         | bbl          | bbl             | Georgian script          | [tests](https://en.wiktionary.org/wiki/Module:Geor-translit/testcases) |
| 24  | Belarusian                   | bel          | be              | Cyrillic                 |                                                               |
| 25  | Bengali                      | ben          | bn              | Beng                     | [tests](https://en.wiktionary.org/wiki/Module:bn-translit/testcases)   |
| 26  | Berber*                      | ber          | ber             | Tfng                     |                                                               |
| 27  | Bhadrawahi                   | bhd          | bhd             | Devanagari               |                                                               |
| 28  | Bhojpuri                     | bho          | bho             | Devanagari               |                                                               |
| 29  | Bilaspuri                    | kfs          | kfs             | Devanagari               |                                                               |
| 30  | Blin                         | byn          | byn             | Ethiopic                 | [tests](https://en.wiktionary.org/wiki/Module:Ethi-translit/testcases) |
| 31  | Braj                         | bra          | bra             | Devanagari               |                                                               |
| 32  | Budukh                       | bud          | bdk             | Cyrillic                 |                                                               |
| 33  | Bulgarian                    | bul          | bg              | Cyrillic                 |                                                               |
| 34  | Bundeli                      | bns          | bns             | Devanagari               |                                                               |
| 35  | Burmese                      | mya          | my              | Burmese                  |                                                               |
| 36  | Buryat                       | bua          | bua             | Cyrillic                 |                                                               |
| 37  | Canadian syllabics           | cans         | cans            | Canadian syllabics       |                                                               |
| 38  | Cappadocian Greek            | cpg          | cpg             | Greek (Polythonic)       | [tests](https://en.wiktionary.org/wiki/Module:grc-translit/testcases)  |
| 39  | Chaha                        | sem-cha      | sem-cha         | Ethiopic                 | [tests](https://en.wiktionary.org/wiki/Module:Ethi-translit/testcases) |
| 40  | Chambeali                    | cdh          | cdh             | Devanagari               |                                                               |
| 41  | Chechen                      | che          | ce              | Cyrillic                 |                                                               |
| 42  | Cherokee                     | chr          | cher            | Cher                     |                                                               |
| 43  | Churahi                      | cdj          | cdj             | Devanagari               |                                                               |
| 44  | Church Slavic                | chu          | cv              | Cyrillic                 |                                                               |
| 45  | Coptic                       | cop          | copt            | Copt                     |                                                               |
| 46  | Cree                         | cre          | cr              | Cans                     |                                                               |
| 47  | Dargwa                       | dar          | dar             | Cyrillic                 |                                                               |
| 48  | Dhivehi                      | div          | dv              | Thaa                     |                                                               |
| 49  | Dogri                        | doi-d        | doi             | Devanagari               |                                                               |
| 50  | Dolgan                       | dlg          | dlg             | Cyrillic                 |                                                               |
| 51  | Doteli                       | dty          | dty             | Devanagari               |                                                               |
| 52  | Dungan                       | dng          | dng             | Cyrillic                 |                                                               |
| 53  | Eastern Mari                 | chm          | chm             | Cyrillic                 |                                                               |
| 54  | Erzya                        | myv          | myv             | Cyrillic                 |                                                               |
| 55  | Even                         | eve          | eve             | Cyrillic                 |                                                               |
| 56  | Evenki                       | evn          | evn             | Cyrillic                 |                                                               |
| 57  | Gaddi                        | gbk          | gbk             | Devanagari               |                                                               |
| 58  | Gandhari                     | pgd-k        | pgd             | Kharoshthi script        | [tests](https://en.wiktionary.org/wiki/Module:Khar-translit/testcases) |
| 59  | Garhwali                     | gbm          | gbm             | Devanagari               |                                                               |
| 60  | Ge'ez                        | gez          | gez             | Ethiopic                 | [tests](https://en.wiktionary.org/wiki/Module:Ethi-translit/testcases) |
| 61  | Georgian                     | geo          | geor            | Georgian script          | [tests](https://en.wiktionary.org/wiki/Module:Geor-translit/testcases) |
| 62  | Gothic                       | got          | goth            | Gothic script            |                                                               |
| 63  | Gujarati                     | guj          | gu              | Gujarati                 | [tests](https://en.wiktionary.org/wiki/Module:gu-translit/testcases)   |
| 64  | Hadrami                      | xhd          | xhd             | Old South Arabian script |                                                               |
| 65  | Harami                       | xha          | xha             | Old South Arabian script |                                                               |
| 66  | Harari                       | har          | har             | Ethiopic                 | [tests](https://en.wiktionary.org/wiki/Module:Ethi-translit/testcases) |
| 67  | Haryanvi                     | bgc          | bgc             | Devanagari               |                                                               |
| 68  | Hebrew                       | heb          | he              | Hebrew                   |                                                               |
| 69  | Hindi                        | hin          | hi              | Devanagari               | [tests](https://en.wiktionary.org/wiki/Module:hi-translit/testcases)   |
| 70  | Ingush                       | inh          | inh             | Cyrillic                 |                                                               |
| 71  | Inuktitut                    | iku          | iu              | Cans                     |                                                               |
| 72  | Javanese (also Old Javanese) | jav          | jv              | Latn                     |                                                               |
| 73  | Kabardian                    | kbd          | kbd             | Cyrillic                 |                                                               |
| 74  | Kachchi                      | kfr          | kfr             | Gujarati                 | [tests](https://en.wiktionary.org/wiki/Module:gu-translit/testcases)   |
| 75  | Kalmyk                       | xal          | xal             | Cyrillic                 | [tests](https://en.wiktionary.org/wiki/Module:xal-translit/testcases)  |
| 76  | Kangri                       | xnr          | xnr             | Devanagari               |                                                               |
| 77  | Kannada                      | kan          | kn              | Knda                     |                                                               |
| 78  | Karachay-Balkar              | krc          | krc             | Cyrillic                 |                                                               |
| 79  | Karaim                       | kdr          | kdr             | Cyrillic                 |                                                               |
| 80  | Karakalpak                   | kaa          | kaa             | Latn                     |                                                               |
| 81  | Kashmiri                     | kas          | ks              | Kashmiri arabic          |                                                               |
| 82  | Kazakh                       | kaz          | kk              | Cyrillic                 |                                                               |
| 83  | Khakas                       | kjh          | kjh             | Cyrillic                 |                                                               |
| 84  | Khanty                       | kca          | kca             | Cyrillic                 |                                                               |
| 85  | Khinalugh                    | kjj          | kjj             | Cyrillic                 |                                                               |
| 86  | Khmer                        | khm          | km              | Khmer script             |                                                               |
| 87  | Khotanese                    | kho          | kho             | Brahmi                   |                                                               |
| 88  | Kildin Sami                  | sjd          | sjd             | Cyrillic                 |                                                               |
| 89  | Kipchak                      | qwm          | qwm             | Latn                     |                                                               |
| 90  | Komi-Permyak                 | koi          | koi             | Cyrillic                 |                                                               |
| 91  | Komi-Zyrian                  | kpv          | kpv             | Cyrillic                 |                                                               |
| 92  | Konkani                      | kok          | kok             | Devanagari               |                                                               |
| 93  | Korean                       | kor          | ko              | Kore                     |                                                               |
| 94  | Kullu Pahari                 | kfx          | kfx             | Devanagari               |                                                               |
| 95  | Kumyk                        | kum          | kum             | Cyrillic                 |                                                               |
| 96  | Kyrgyz                       | kir          | ky              | Cyrillic                 |                                                               |
| 97  | Lak                          | lbe          | lbe             | Cyrillic                 |                                                               |
| 98  | Lao                          | lao          | lo              | Laoo                     |                                                               |
| 99  | Latin-to-Tamil               | tam          | en-ta           | Latn                     |                                                               |
| 100 | Laz                          | lzz          | lzz             | Georgian script          | [tests](https://en.wiktionary.org/wiki/Module:Geor-translit/testcases) |
| 101 | Lepcha                       | lep          | lep             | Lepcha                   |                                                               |
| 102 | Lezgi                        | lez          | lez             | Cyrillic                 |                                                               |
| 103 | Limbu                        | lif          | lif             | Limbu                    |                                                               |
| 104 | Lü                           | khb          | khb             | New Tai Lue              |                                                               |
| 105 | Lycian                       | xlc          | xlc             | Lycian                   |                                                               |
| 106 | Lydian                       | xld          | xld             | Lydi                     |                                                               |
| 107 | Macedonian                   | mkd          | mk              | Cyrillic                 |                                                               |
| 108 | Magadhi Prakrit              | inc-mgd      | inc-mgd         | Brahmi                   |                                                               |
| 109 | Maharastri Prakrit           | pmh          | pmh             | Brahmi                   |                                                               |
| 110 | Mahasu Pahari                | bfz          | bfz             | Devanagari               |                                                               |
| 111 | Malayalam                    | mal          | ml              | Mlym                     |                                                               |
| 112 | Mandeali                     | mjl          | mjl             | Devanagari               |                                                               |
| 113 | Mansi                        | mns          | mns             | Cyrillic                 |                                                               |
| 114 | Marathi                      | mar          | mr              | Devanagari               |                                                               |
| 115 | Marwari                      | mwr          | mwr             | Devanagari               |                                                               |
| 116 | Mewari                       | mtr          | mtr             | Devanagari               |                                                               |
| 117 | Middle Assamese              | inc-mas      | inc-mas         | Assamese                 |                                                               |
| 118 | Middle   Persian             | pal-m        | pal             | Manichaean script        |                                                               |
| 119 | Middle Persian               | pal-p        | pal             | Phli                     |                                                               |
| 120 | Minaean                      | inm          | inm             | Old South Arabian script |                                                               |
| 121 | Mingrelian                   | xmf          | xmf             | Georgian script          | [tests](https://en.wiktionary.org/wiki/Module:Geor-translit/testcases) |
| 122 | Moksha                       | mdf          | mdf             | Cyrillic                 |                                                               |
| 123 | Mongolian                    | mon          | mon             | Cyrillic                 |                                                               |
| 124 | Mundari                      | unr          | unr             | Devanagari               |                                                               |
| 125 | Mycenaean Greek              | gmy          | gmy             | Linear B script          |                                                               |
| 126 | Naskapi                      | nsk          | nsk             | Canadian syllabics       |                                                               |
| 127 | Nepali                       | nep          | ne              | Devanagari               |                                                               |
| 128 | Newar                        | new          | new             | Devanagari               |                                                               |
| 129 | Nivkh                        | niv          | niv             | Cyrillic                 |                                                               |
| 130 | Nogai                        | nog          | nog             | Cyrillic                 |                                                               |
| 131 | Northern Kurdish             | kmr          | kmr             | Latn                     |                                                               |
| 132 | Northern Yukaghir            | ykg          | ykg             | Cyrillic                 |                                                               |
| 133 | Old Church Slavonic          | chu-old-c    | cu              | Old Cyrillic alphabets   |                                                               |
| 134 | Old Church Slavonic          | chu-old-g    | cu              | Glagolitic alphabets     |                                                               |
| 135 | Old East Slavic              | orv          | orv             | Old Cyrillic alphabets   |                                                               |
| 136 | Old Georgian                 | oge          | oge             | Georgian script          | [tests](https://en.wiktionary.org/wiki/Module:Geor-translit/testcases) |
| 137 | Old Hindi                    | inc-ohi      | inc-ohi         | Devanagari               | [tests](https://en.wiktionary.org/wiki/Module:sa-translit/testcases)   |
| 138 | Old Italic,  Etruscan, Old Latin, North Picene, Oscan, South Picene, Camunic, Faliscan, Lemnian, Lepontic, Raetic, Umbrian and Venetic                  | ita-old      | ital            | Old Italic script        |                                                               |
| 139 | Old Marathi                  | omr          | omr             | Devanagari               |                                                               |
| 140 | Old Novgorodian              | zle-ono-c    | zle-ono         | Old Cyrillic alphabets   |                                                               |
| 141 | Old Novgorodian              | zle-ono-g    | zle-ono         | Glagolitic alphabets     |                                                               |
| 142 | Old Ossetic                  | oos          | oos             | Greek (Polythonic)       | [tests](https://en.wiktionary.org/wiki/Module:grc-translit/testcases)  |
| 143 | Old Persian                  | peo          | peo             | Old Persian              |                                                               |
| 144 | Old Tamil                    | oty          | oty             | Brahmi                   |                                                               |
| 145 | Orya                         | ori          | or              | Oriya                    |                                                               |
| 146 | Ossetian                     | oss          | os              | Cyrillic                 |                                                               |
| 147 | Paeonian                     | ine-pae      | ine-pae         | Greek (Polythonic)       | [tests](https://en.wiktionary.org/wiki/Module:grc-translit/testcases)  |
| 148 | Paisaci Prakrit              | inc-psc      | inc-psc         | Brahmi                   |                                                               |
| 149 | Palya Bareli                 | bpx          | bpx             | Devanagari               |                                                               |
| 150 | Pangwali                     | pgg          | pgg             | Devanagari               |                                                               |
| 151 | Parthian                     | xpr          | xpr             | Manichaean script        |                                                               |
| 152 | Parthian                     | xpr          | xpr             | Parthian                 |                                                               |
| 153 | Persian                      | fas          | fa              | fa-Arab                  | [tests](https://en.wiktionary.org/wiki/Module:fa-translit/testcases)   |
| 154 | Phrygian                     | xpg          | xpg             | Greek (Polythonic)       | [tests](https://en.wiktionary.org/wiki/Module:grc-translit/testcases)  |
| 155 | Pontic Greek                 | pnt          | pnt             | Greek (Polythonic)       | [tests](https://en.wiktionary.org/wiki/Module:grc-translit/testcases)  |
| 156 | Punjabi                      | pan          | pal             | Guru                     |                                                               |
| 157 | Qatabanian                   | xqt          | xqt             | Old South Arabian script |                                                               |
| 158 | Russian                      | rus          | ru              | Cyrillic                 | [tests](https://en.wiktionary.org/wiki/Module:ru-translit/testcases)   |
| 159 | Rusyn                        | rue          | rue             | Cyrillic                 |                                                               |
| 160 | Sabaean                      | xsa          | xsa             | Old South Arabian script |                                                               |
| 161 | Sambalpuri                   | spv          | spv             | Oriya                    |                                                               |
| 162 | Sanskrit                     | san          | sa              | Devanagari               |                                                               |
| 163 | Santali                      | sat          | sat             | Ol Chiki                 |                                                               |
| 164 | Sauraseni Prakrit            | psu          | psu             | Brahmi                   |                                                               |
| 165 | Sichuan Yi                   | iii          | ii              | Yi script                |                                                               |
| 166 | Sinhalese                    | sin          | si              | Sinh                     |                                                               |
| 167 | Sogdian                      | sog          | sog             | Manichaean script        |                                                               |
| 168 | Tajik                        | tgk          | tg              | Cyrillic                 |                                                               |
| 169 | Takka Apabhramsa             | inc-tak      | inc-tak         | Devanagari               |                                                               |
| 170 | Tamil                        | tam          | ta              | Tamil                    |                                                               |
| 171 | Tatar                        | tat          | tt              | Cyrillic                 |                                                               |
| 172 | Telugu                       | tel          | te              | Telu                     | [tests](https://en.wiktionary.org/wiki/Module:te-translit/testcases)   |
| 173 | Thai*                        | tha          | th              | Thai                     | [tests](https://en.wiktionary.org/wiki/Module:th-translit/testcases)   |
| 174 | Thracian                     | txh          | txh             | Greek                    |                                                               |
| 175 | Tibetan                      | bod          | bo              | Tibetan                  | [tests](https://en.wiktionary.org/wiki/Module:bo-translit/testcases)   |
| 176 | Tigre                        | tig          | tig             | Ethiopic                 | [tests](https://en.wiktionary.org/wiki/Module:Ethi-translit/testcases) |
| 177 | Tigrinya                     | tir          | ti              | Ethiopic                 | [tests](https://en.wiktionary.org/wiki/Module:Ethi-translit/testcases) |
| 178 | Tuvan                        | tyv          | tyv             | Cyrillic                 |                                                               |
| 179 | Udi                          | udi          | udi             | Cyrillic                 |                                                               |
| 180 | Udi                          | udi          | udi             | Georgian script          | [tests](https://en.wiktionary.org/wiki/Module:Geor-translit/testcases) |
| 181 | Udmurt                       | udm          | udm             | Cyrillic                 |                                                               |
| 182 | Ukrainian                    | ukr          | uk              | Cyrillic                 | [tests](https://en.wiktionary.org/wiki/Module:uk-translit/testcases)   |
| 183 | Urdu                         | urd          | ur              | Urdu Arabic              |                                                               |
| 184 | Uyghur                       | uig          | ug              | Uyghur Arabic            | [tests](https://en.wiktionary.org/wiki/Module:ug-translit/testcases)   |
| 185 | Vaghri                       | vgr          | vgr             | Gujarati                 | [tests](https://en.wiktionary.org/wiki/Module:gu-translit/testcases)   |
| 186 | Vracada Apabhramsa           | inc-vra      | inc-vra         | Devanagari               |                                                               |
| 187 | Wakhi                        | wbl          | wbl             | Cyrillic                 |                                                               |
| 188 | Yagnobi                      | yai          | yai             | Cyrillic                 |                                                               |
| 189 | Yakut                        | sah          | sah             | Cyrillic                 |                                                               |


## License
This tool is available under the Creative Commons Attribution-ShareAlike License. Read more about this license from https://creativecommons.org/licenses/by-sa/3.0/.


## Reference
For the acedemic use, please cite the following article:

Khuyagbaatar Batsuren, Gabor Bella, and Fausto Giunchiglia – CogNet: A large-scale cognate database, Proceedings of The 57th Annual Meeting of the Association for Computational Linguistics (ACL), 2019.
