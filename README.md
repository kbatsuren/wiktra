# Wiktra - Python tool of Wiktionary Transliteration modules

Wiktra is a unicode transliteration tool as a python port of Wiktionary transliteration modules that are written in Lua at the following link.
https://en.wiktionary.org/wiki/Category:Transliteration_modules

Currently, Wiktra supports 85 languages (using non-roman orthography) and the following table displays their language name and corresponding 3-letter codes.

## Installation && Setup

As much as you want to use your favorite version of Python, it is recommended to employ 3.5 version on the grounds that the module utilizes lupa-1.8. Lupa enables Python to adopt functionalities of Lua language, in which most of the transliteration modules are written.

The following commands prepare a python environment via Anaconda, which promotes the version and the module dependencies:

First:
```sh
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


## License
This tool is available under the Creative Commons Attribution-ShareAlike License. Read more about this license from https://creativecommons.org/licenses/by-sa/3.0/.


## Reference
For the acedemic use, please cite the following article:

Khuyagbaatar Batsuren, Gabor Bella, and Fausto Giunchiglia – CogNet: A large-scale cognate database, Proceedings of The 57th Annual Meeting of the Association for Computational Linguistics (ACL), 2019.

