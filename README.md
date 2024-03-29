# Wiktra - Transliteration tool using Wiktionary transliteration modules

**Wiktra** is a Unicode transliteration tool, written in Python. It’s available as the `wiktrapy` CLI app and the `wiktra` Python 3 module.

Internally, it uses transliteration modules [from Wiktionary](https://en.wiktionary.org/wiki/Category:Transliteration_modules). These modules are written in Lua by the Wiktionary linguists and developers. Therefore, Wiktra offers the highest quality of rule-based transliterations.

Wiktra 1.0 was originally developed by [Khuyagbaatar Batsuren](https://github.com/kbatsuren). Wiktra 2 was rewritten by [Adam Twardoch](https://twardoch.github.io/).

Locations:

- [kbatsuren/wiktra](https://github.com/kbatsuren/wiktra/) — the upstream location, slower releases
- [twardoch/wiktra2](https://github.com/twardoch/wiktra2/) — active development

Wiktra 2 supports 514 languages in 102 scripts with the new API (nearly all of languages supported by Wiktionary, except Korean, Japanese and Thai), and 181 languages and its 60 orthographies in the legacy API.

## Installation

### Version 2

_(This has been tested on macOS 11.)_ Unfortunately, it hasn't been working on Ubuntu and Windows 10. We are working on testing these installations and fixing the bugs. 

#### First installation

[Download](https://github.com/kbatsuren/wiktra/archive/refs/heads/master.zip) and unzip the current repo content. Then, in Terminal, `cd` to the main folder and run:

```
./install-mac.sh
python3 -m pip install --upgrade .
```

This will install `brew` if needed, the installs `lua`, `luarocks`, `lua-format`, `luajit` and `python3`. Finally, it installs some Python dependencies, such as `lupa` or `pywikiapi`.

#### Updates

```sh
python3 -m pip install --upgrade git+https://github.com/kbatsuren/wiktra/
```

### Other systems, version 1

_This is from the original version 1. Quite possibly the Version 2 instructions (see above) should work instead._

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

### Troubleshooting

_This should no longer be an issue with version 2._

If you get `LuaError: module 'wikt.mw' not found`, try:

- create a folder `lua` in `C:\ProgramData\Miniconda3\`
- copy the entire folder of wikt from this project and paste it into `C:\ProgramData\Miniconda3\lua`

## Usage

### Command-line, version 2

```sh
$ wiktrapy -h

usage: wiktrapy [-h] [-t TEXT] [-i FILE] [-l LANG] [-s SCRIPT] [-o SCRIPT] [-x] [--stats] [-v] [-V]

optional arguments:
  -h, --help            show this help message and exit
  -t TEXT, --text TEXT
  -i FILE, --input FILE
  -l LANG, --lang LANG  Input language as ISO 639-2 code
  -s SCRIPT, --script SCRIPT
                        Input script as ISO 15924 code
  -o SCRIPT, --to-script SCRIPT
                        Output script as ISO 15924 code
  -x, --explicit        Explicit language/script, no fuzzy matching
  --stats               List supported scripts and orthographies
  -v, --verbose         -v show progress, -vv show debug
  -V, --version         show version and exit
```

Example:

```sh
$ wiktrapy -t "Привет" -l ru -s Cyrl
Privet
```

Or from stdin / via piping:

```sh
$ echo Привет | wiktrapy
Privet
```


### Python, version 2 new API

```python
from wiktra.Wiktra import Transliterator
tr = Transliterator()

print(tr.tr("Привет", lang='ru', sc='Cyrl', to_sc='Latn', explicit=True)
```

or less efficiently:

```python
from wiktra import tr
print(tr("Привет"))
```

- If `explicit` is `True`, you need to specify `lang` as the input language (using Wiktionary/ISO codes), `sc` as the input script (using ISO 15924 codes), and optionally `to_sc` as the output script (`Latn` is assumed if absent).

- If `explicit` is `False` or omitted, Wiktra will guess the `sc` if it’s not specified, and will assume the `und` (undefined) input language for that script. Sometimes Wiktionary provides a generic script transliterator. If Wiktionary has multiple script transliterators, the language with the largest speaking population also serves as "undefined". For example, for `Cyrl` (Cyrillic script), `ru` (Russian language) serves as `und` (undefined) and is used if you only specify the script or Wiktra guesses `Cyrl` as the script.
- Using the class is more efficient for multiple transliterations

Use `wiktrapy --stats` to list all supported script and language codes, or see the [`data.yaml`](wiktra/wikt/data/data.yaml). The YAML file also lists the Wiktionary transliteration modules used.

### Python, legacy `translite` function

```python
from wiktra.Wiktra import translite as tr
```

With the function `translite`, you need to provide the text and the lang code (see table below for reference):

```sh
#mongolian script
tr('монгол бичлэг', 'mon')
> mongol bichleg

#devanagari script
tr('हिंदी लिपि', 'hin')
> hindee lipi
```


## Supported scripts and languages

### CLI tool and new Python API

- scripts: Aghb Ahom Arab Armi Armn Avst Bali Beng Bhks Brah Brai Cans Cher Chrs Copt Cprt Cyrl Cyrs Deva Dogr Ethi Geok Geor Glag Goth Gran Grek Gujr Guru Hani Hatr Hebr Ital Java Kali Kham Khar Khmr Knda Kore Kthi Lana Laoo Latn Lepc Limb Linb Lyci Lydi Mahj Mand Mani Merc Mero Mlym Modi Mong Mymr Narb Nbat Newa Ogam Olck Orkh Orya Palm Perm Phag Phli Phlv Phnx Prti Rohg Runr Samr Sarb Saur Shrd Sidd Sind Sinh Sogd Sogo Soyo Sund Sylo Takr Tale Talu Taml Tavt Telu Tfng Thaa Thai Tibt Tirh Ugar Vaii Xpeo Yiii Zanb

- languages: und-Aghb xag-Aghb aho-Ahom und-Ahom ar-Arab awa-Arab bhd-Arab chg-Arab ckb-Arab cpg-Arab dng-Arab doi-Arab hac-Arab inc-opa-Arab kfr-Arab kk-Arab kmr-Arab kok-Arab ks-Arab ky-Arab lki-Arab nog-Arab pa-Arab rif-Arab sdh-Arab shi-Arab tg-Arab tt-Arab tzm-Arab ug-Arab und-Arab xco-Arab xng-Arab xnr-Arab arc-Armi und-Armi xco-Armi axm-Armn hy-Armn kmr-Armn qwm-Armn rmi-Armn udi-Armn und-Armn xcl-Armn ae-Avst pal-Avst und-Avst sa-Bali und-Bali as-Beng bn-Beng inc-mas-Beng inc-mbn-Beng inc-oas-Beng inc-ork-Beng pi-Beng rhg-Beng rkt-Beng sa-Beng syl-Beng und-Beng sa-Bhks und-Bhks inc-ash-Brah inc-mgd-Brah inc-pra-Brah inc-psc-Brah kho-Brah oty-Brah pi-Brah pka-Brah pmh-Brah psu-Brah sa-Brah und-Brah xtq-Brah ar-Brai el-Brai hy-Brai ko-Brai ru-Brai th-Brai und-Brai cr-Cans crj-Cans crl-Cans iu-Cans nsk-Cans und-Cans chr-Cher und-Cher und-Chrs xco-Chrs cop-Copt und-Copt grc-Cprt und-Cprt ab-Cyrl abq-Cyrl ady-Cyrl alt-Cyrl atv-Cyrl av-Cyrl ba-Cyrl bdk-Cyrl be-Cyrl bg-Cyrl bua-Cyrl ce-Cyrl chm-Cyrl cv-Cyrl dar-Cyrl ddo-Cyrl dng-Cyrl eve-Cyrl evn-Cyrl gin-Cyrl huz-Cyrl inh-Cyrl jdt-Cyrl kap-Cyrl kbd-Cyrl kca-Cyrl khv-Cyrl kjh-Cyrl kjj-Cyrl kk-Cyrl kmr-Cyrl koi-Cyrl kpv-Cyrl krc-Cyrl kum-Cyrl ky-Cyrl lbe-Cyrl lez-Cyrl mdf-Cyrl mk-Cyrl mn-Cyrl mns-Cyrl mrj-Cyrl myv-Cyrl niv-Cyrl nog-Cyrl omk-Cyrl os-Cyrl pnt-Cyrl ru-Cyrl rue-Cyrl sah-Cyrl sgh-Cyrl sjd-Cyrl sva-Cyrl tab-Cyrl tg-Cyrl tt-Cyrl tyv-Cyrl udi-Cyrl udm-Cyrl ug-Cyrl uk-Cyrl und-Cyrl wbl-Cyrl xal-Cyrl yai-Cyrl ykg-Cyrl yux-Cyrl cu-Cyrs orv-Cyrs und-Cyrs zle-ono-Cyrs awa-Deva bfy-Deva bfz-Deva bgc-Deva bhd-Deva bho-Deva bns-Deva bpx-Deva bra-Deva brx-Deva cdh-Deva cdj-Deva doi-Deva dty-Deva gbk-Deva gbm-Deva hi-Deva inc-ogu-Deva inc-ohi-Deva inc-pra-Deva inc-tak-Deva inc-vra-Deva kfs-Deva kfx-Deva kok-Deva ks-Deva mai-Deva mjl-Deva mr-Deva mtr-Deva mwr-Deva ne-Deva new-Deva omr-Deva pgd-Deva pgg-Deva pi-Deva pka-Deva pmh-Deva psu-Deva sa-Deva saz-Deva und-Deva unr-Deva xnr-Deva ybi-Deva doi-Dogr und-Dogr am-Ethi byn-Ethi dlk-Ethi gez-Ethi har-Ethi sem-cha-Ethi ti-Ethi tig-Ethi und-Ethi ka-Geok und-Geok ab-Geor bbl-Geor ka-Geor lzz-Geor oge-Geor os-Geor sva-Geor udi-Geor und-Geor xmf-Geor cu-Glag und-Glag zle-ono-Glag got-Goth und-Goth sa-Gran und-Gran cpg-Grek el-Grek grc-Grek ine-pae-Grek oos-Grek pnt-Grek txh-Grek und-Grek xbc-Grek xmk-Grek xpg-Grek ae-Gujr gu-Gujr kfr-Gujr sa-Gujr und-Gujr vgr-Gujr inc-opa-Guru pa-Guru sa-Guru und-Guru dng-Hani und-Hani arc-Hatr und-Hatr ar-Hebr jdt-Hebr ka-Hebr und-Hebr yi-Hebr ett-Ital itc-ola-Ital nrp-Ital osc-Ital spx-Ital und-Ital xcc-Ital xfa-Ital xle-Ital xlp-Ital xrr-Ital xum-Ital xve-Ital jv-Java kaw-Java sa-Java und-Java kyu-Kali und-Kali und-Kham inc-ash-Khar kho-Khar pgd-Khar pra-niy-Khar sa-Khar und-Khar xtq-Khar km-Khmr pi-Khmr sa-Khmr und-Khmr dra-mkn-Knda dra-okn-Knda inc-pra-Knda kn-Knda kok-Knda sa-Knda tcy-Knda und-Knda ko-Kore und-Kore awa-Kthi bho-Kthi hi-Kthi mai-Kthi und-Kthi pi-Lana sa-Lana und-Lana lo-Laoo pi-Laoo sa-Laoo und-Laoo und-Latn lep-Lepc und-Lepc lif-Limb und-Limb gmy-Linb und-Linb und-Lyci xlc-Lyci und-Lydi xld-Lydi mwr-Mahj und-Mahj arc-Mand und-Mand pal-Mani sog-Mani und-Mani xbc-Mani xpr-Mani und-Merc xmr-Merc und-Mero xmr-Mero kok-Mlym ml-Mlym sa-Mlym und-Mlym mr-Modi omr-Modi sa-Modi und-Modi bua-Mong cmg-Mong mn-Mong mnc-Mong und-Mong xng-Mong xwo-Mong ksw-Mymr my-Mymr pi-Mymr rhg-Mymr sa-Mymr shn-Mymr und-Mymr sem-dad-Narb sem-dum-Narb sem-has-Narb sem-his-Narb sem-saf-Narb sem-tay-Narb sem-tha-Narb und-Narb arc-Nbat und-Nbat bn-Newa hi-Newa mai-Newa ne-Newa new-Newa sa-Newa und-Newa pgl-Ogam und-Ogam sat-Olck und-Olck otk-Orkh und-Orkh or-Orya sa-Orya spv-Orya und-Orya arc-Palm und-Palm koi-Perm und-Perm und-Phag xng-Phag pal-Phli und-Phli pal-Phlv und-Phlv xco-Phlv arc-Phnx obm-Phnx phn-Phnx sem-amm-Phnx und-Phnx xdm-Phnx xpu-Phnx und-Prti xpr-Prti rhg-Rohg und-Rohg ang-Runr gmq-pro-Runr got-Runr non-Runr und-Runr arc-Samr sam-Samr und-Samr inm-Sarb sem-srb-Sarb und-Sarb xha-Sarb xhd-Sarb xqt-Sarb xsa-Sarb sa-Saur saz-Saur und-Saur ks-Shrd sa-Shrd und-Shrd sa-Sidd und-Sidd und-Sind pi-Sinh sa-Sinh si-Sinh und-Sinh sog-Sogd und-Sogd xco-Sogd sog-Sogo und-Sogo mn-Soyo und-Soyo su-Sund und-Sund syl-Sylo und-Sylo cdh-Takr doi-Takr gbk-Takr kfs-Takr mjl-Takr pgg-Takr und-Takr xnr-Takr tdd-Tale und-Tale khb-Talu und-Talu sa-Taml saz-Taml ta-Taml und-Taml und-Tavt sa-Telu te-Telu und-Telu rif-Tfng shi-Tfng tzm-Tfng und-Tfng zgh-Tfng dv-Thaa und-Thaa pi-Thai sa-Thai th-Thai und-Thai bo-Tibt dz-Tibt lbj-Tibt sa-Tibt sip-Tibt und-Tibt mai-Tirh sa-Tirh und-Tirh uga-Ugar und-Ugar und-Vaii vai-Vaii peo-Xpeo und-Xpeo ii-Yiii und-Yiii mn-Zanb und-Zanb

### Legacy `translite` function


|     | Language                     | iso-3 in use | wiktionary code | Supporting script        | examples                                                      |
|-----|------------------------------|--------------|-----------------|--------------------------|---------------------------------------------------------------|
| 1   | Abaza                        | abq          | abq             | Cyrillic                 |                                                               |
| 2   | Abkhazian                    | abk          | ab              | Cyrillic                 |                                                               |
| 3   | Adyghe                       | ady          | ady             | Cyrillic                 |                                                               |
| 4   | Ahom                         | aho          | aho             | Ahom                     | [tests](https://en.wiktionary.org/wiki/Module:Ahom-translit/testcases) |
| 5   | Ainu                         | ain          | ain             | Kana                     | [tests](https://en.wiktionary.org/wiki/Module:ain-translit/testcases)  |
| 6   | Altai, Southern              | alt          | altai           | Cyrillic                 |                                                               |
| 7   | Amharic                      | amh          | am              | Ethiopic                 | [tests](https://en.wiktionary.org/wiki/Module:Ethi-translit/testcases) |
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
| 72  | Javanese                     | jav          | jv              | Javanese                 |                                                               |
| 73  | Kabardian                    | kbd          | kbd             | Cyrillic                 |                                                               |
| 74  | Kachchi                      | kfr          | kfr             | Gujarati                 | [tests](https://en.wiktionary.org/wiki/Module:gu-translit/testcases)   |
| 75  | Kalmyk                       | xal          | xal             | Cyrillic                 | [tests](https://en.wiktionary.org/wiki/Module:xal-translit/testcases)  |
| 76  | Kangri                       | xnr          | xnr             | Devanagari               |                                                               |
| 77  | Kannada                      | kan          | kn              | Knda                     |                                                               |
| 78  | Karachay-Balkar              | krc          | krc             | Cyrillic                 |                                                               |
| 79  | Karaim                       | kdr          | kdr             | Cyrillic                 |                                                               |
| 80  | Karakalpak                   | kaa          | kaa             | Cyrillic                 |                                                               |
| 81  | Kashmiri                     | kas          | ks              | Kashmiri arabic          |                                                               |
| 81  | Kashmiri                     | kas-d        | ks              | Kashmiri devanagri       |                                                               |
| 82  | Kazakh                       | kaz          | kk              | Cyrillic                 |                                                               |
| 83  | Khakas                       | kjh          | kjh             | Cyrillic                 |                                                               |
| 84  | Khanty                       | kca          | kca             | Cyrillic                 |                                                               |
| 85  | Khinalugh                    | kjj          | kjj             | Cyrillic                 |                                                               |
| 86  | Khmer                        | khm          | km              | Khmer script             |                                                               |
| 87  | Khotanese                    | kho          | kho             | Brahmi                   |                                                               |
| 88  | Kildin Sami                  | sjd          | sjd             | Cyrillic                 |                                                               |
| 89  | Kipchak                      | qwm          | qwm             | Armn                     |                                                               |
| 90  | Komi-Permyak                 | koi          | koi             | Cyrillic                 |                                                               |
| 91  | Komi-Zyrian                  | kpv          | kpv             | Cyrillic                 |                                                               |
| 92  | Konkani                      | kok          | kok             | Devanagari               |                                                               |
| 93  | Korean                       | kor          | ko              | Kore                     | [tests](https://en.wiktionary.org/wiki/Module:ko-translit/testcases)|
| 94  | Kullu Pahari                 | kfx          | kfx             | Devanagari               |                                                               |
| 95  | Kumyk                        | kum          | kum             | Cyrillic                 |                                                               |
| 96  | Kyrgyz                       | kir          | ky              | Cyrillic                 |                                                               |
| 97  | Lak                          | lbe          | lbe             | Cyrillic                 |                                                               |
| 98  | Lao                          | lao          | lo              | Laoo                     |                                                               |
| 99  | Latin-to-Tamil               | tam          | en-ta           | Latn                     | |
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
| 131 | Northern Kurdish             | kmr          | kmr             | Cyrillic                 |                                                               |
| 132 | Northern Yukaghir            | ykg          | ykg             | Cyrillic                 |                                                               |
| 133 | Old Church Slavonic          | chu-old-c    | cu              | Old Cyrillic alphabets   |                                                               |
| 134 | Old Church Slavonic          | chu-old-g    | cu              | Glagolitic alphabets     |                                                               |
| 135 | Old East Slavic              | orv          | orv             | Old Cyrillic alphabets   |                                                               |
| 136 | Old Georgian                 | oge          | oge             | Georgian script          | [tests](https://en.wiktionary.org/wiki/Module:Geor-translit/testcases) |
| 137 | Old Hindi                    | inc-ohi      | inc-ohi         | Devanagari               | [tests](https://en.wiktionary.org/wiki/Module:sa-translit/testcases)   |
| 138 | Old Italic                   | Old Italic script        |                                                               |
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
| 156 | Punjabi                      | pan          | pal             | Guru                     | [tests](https://en.wiktionary.org/wiki/Module:Guru-translit/testcases) |
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
| 170 | Tamil                        | tam          | ta              | Tamil                    |[tests](https://en.wiktionary.org/wiki/Module:ta-translit/testcases)|
| 171 | Tatar                        | tat          | tt              | Cyrillic                 |                                                               |
| 172 | Telugu                       | tel          | te              | Telu                     | [tests](https://en.wiktionary.org/wiki/Module:te-translit/testcases)   |
| 173 | Thai*                        | tha          | th              | Thai                     | [tests](https://en.wiktionary.org/wiki/Module:th-translit/testcases)   |
| 174 | Thracian                     | txh          | txh             | Greek                    | [tests](https://en.wiktionary.org/wiki/Module:el-translit/testcases)|
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
| 190 | Modern Greek (new)           | ell          | el              | Greek                    | [tests](https://en.wiktionary.org/wiki/Module:el-translit/testcases)|

## Updating

This tool an update its stored Wiktionary modules. See `wiktrapy_update -h` for details.

## License

This tool is available under the [GPLv2](./LICENSE) license.
