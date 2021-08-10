#!/usr/bin/env python3
# -*- coding: utf-8 -*-

# pip install pywikiapi

import argparse
import logging
import subprocess
import re
import json
from wiktra.Wiktra import *
from yaplon import reader, writer
from collections import OrderedDict
import langcodes

import pywikiapi

logging.basicConfig(level=logging.INFO)


def sortOD(od):
    res = OrderedDict()
    for k, v in sorted(od.items()):
        if isinstance(v, dict):
            res[k] = sortOD(v)
        else:
            res[k] = v
    return res


class WiktionaryModuleDownload(object):

    re_require = re.compile(r"""(require|loadData)[\( ]['"][Mm]odule:(.*?)['"]""")
    exclude_modules = [
        "ja",
        "ja/k2r-old",
        "ko-translit",
        "Shah-translit",
        "th-translit",
        "th-hom",
        "th-pron",
        "tts-pron",
        "tts-translit",
        "zh-sortkey",
        "transliteration module testcases",
        "cjs-translit/testcases",
        "labels",
        "labels/data",
        "labels/data/functions",
        "labels/data/subvarieties",
        "qualifier",
        "omk-translit/testcases",
        "ky-translit/sandbox/testcases",
        "ky-translit/testcases",
    ]
    tr = Transliterator()

    def __init__(self, output_folder, force=False, deps=True):
        self.lua_folder = Path(output_folder, "translit")
        self.data_folder = Path(output_folder, "data")
        self.force = force
        self.deps = deps
        for p in (self.lua_folder, self.data_folder):
            if not Path(p).is_dir():
                Path(p).mkdir(parents=True, exist_ok=True)
        self.wk = pywikiapi.Site(
            "https://en.wiktionary.org/w/api.php", json_object_hook=pywikiapi.AttrDict
        )
        self.downloaded = []

    def check_write(self, path):
        if Path(path).exists() and not self.force:
            return False
        else:
            return True

    def get_module_code(self, page="Goth-translit"):
        try:
            res = self.wk("parse", page=f"Module:{page}", prop="wikitext")
        except pywikiapi.utils.ApiError:
            return ""
        return res.parse.wikitext

    def write_modules_category(self, cat="Transliteration_modules"):
        logging.info(f"Category: '{cat}'")
        for r in self.wk.query(list="categorymembers", cmtitle=f"Category:{cat}"):
            for page in r.categorymembers:
                page = page.title.split(":")
                if page[0] == "Module":
                    if len(page) > 1:
                        if page[1] != "User":
                            self.write_module(page[1])

    def special_process(self, page, text):
        text = text
        if page in ("languages/alldata"):
            for m in re.findall(r"""\[['"]Module:(languages/.*?)['"]\]""", text):
                if self.deps:
                    self.write_module(m)
            text = re.sub(
                r"""(\[['"])Module:(.*?)(['"]\])""",
                r"\1\2\3",
                text,
            )
        elif page in ("translit-redirect"):
            text = text.replace(
                '''pcall(require, "Module:"''',
                '''pcall(require, ""''',
            )
        elif page in ("xal-translit"):
            text = text.replace(
                """\ʺ""",
                """ʺ""",
            )
        elif page in ("UnitTests"):
            text = text.replace(
                '''require"Module:Unicode data"''',
                """require("Unicode data")""",
            )
        return text

    def preprocess_lua_file(self, path):
        cmd = [
            "lua-format",
            "--in-place",
            "--column-limit=999",
            "--column-table-limit=999",
            "--single-quote-to-double-quote",
            "--no-spaces-inside-functiondef-parens",
            "--no-spaces-inside-functioncall-parens",
            path,
        ]
        res = subprocess.run(cmd, capture_output=True)
        if res.returncode:
            logging.error(f"""Luaformat failed: {res.stderr}""")

    def write_module(self, page="Goth-translit", parent=None):
        text = ""
        inpath = Path(page)
        outfolder = Path(self.lua_folder, inpath.parent)
        outpath = Path(outfolder, f"{inpath.name}.lua")
        if self.check_write(outpath) and page not in self.exclude_modules:
            info = f"Page: '{page}'"
            if parent:
                info = f"Page: '{parent}' > " + info
            logging.info(info)
            text = self.get_module_code(page)
            if len(text):
                if not outfolder.is_dir():
                    outfolder.mkdir(parents=True, exist_ok=True)
                self.downloaded.append(page)
                with open(outpath, "w", encoding="utf-8") as f:
                    f.write(text)
                self.preprocess_lua_file(outpath)
                with open(outpath, "r", encoding="utf-8") as f:
                    text = f.read()
                for fun, mod in self.re_require.findall(text):
                    if mod not in self.downloaded and self.deps:
                        self.write_module(mod, parent=page)
                    text = re.sub(
                        r"""(require|loadData)([\( ])(['"])([Mm]odule:)("""
                        + mod
                        + r""")(['"])""",
                        r"\1\2\3" + r"\5" + r"\6",
                        text,
                    )
                text = text.replace("""loadData("Module:""", '''loadData("''')
                text = text.replace("""require("Module:""", '''require("''')
                text = self.special_process(page, text)
                with open(outpath, "w", encoding="utf-8") as f:
                    f.write(text)

    def exec_module(self, prefix, mod):
        to_exec = mod
        if len(prefix):
            to_exec = f"""{prefix}/{mod}"""
        logging.info(f"Executing {to_exec}")
        res = ""
        path = Path(self.lua_folder, to_exec + ".lua")
        with open(Path(path), "r", encoding="utf8") as f:
            lua_str = f.read()
            try:
                res = self.tr.e(lua_str)
            except lupa._lupa.LuaError as err:
                mods = re.findall(r"""module '(.*?)' not found""", str(err))
                for smod in mods:
                    if self.deps:
                        sto_exec = f"""{mod}"""
                        if prefix:
                            sto_exec = f"""{prefix}/{sto_exec}"""
                        logging.info(f"From execution writing {sto_exec}")
                        self.write_module(sto_exec)
        return None

    def _rebuild_data(self):
        lua_str = f"""res = require("JSON").toJSON(require("make-data-lang"))"""
        self.data_lang = json.loads(self.tr.e(lua_str))
        with open(
            Path(self.data_folder, "data_custom.yaml"), "r", encoding="utf-8"
        ) as f:
            data_custom = reader.yaml(f)
        self.data_lang.update(data_custom)

    def _fix_script(self, script):
        suffix = ''
        script_rec = script.split("-")
        if len(script_rec) > 1:
            script_iso = script_rec[1]
        elif script == 'polytonic':
            script = "Grek-polyton"
            script_iso = "Grek"
            suffix += f'''polyton'''
        else:
            script_iso = script
        return script, script_iso, suffix

    def _struct_data(self):
        self.data = OrderedDict()
        self.data["Latn"] = OrderedDict()
        for k, v in self.data_lang.items():
            script, script_iso, script_suffix = self._fix_script(
                v.get("script", "Latn"))
            to_script, to_script_iso, to_script_suffix = self._fix_script(
                v.get("to_script", "Latn"))
            lang = v.get("lang", "und")
            lang_tag = ''
            lang_code = None
            lang_suf = None
            if len(lang):
                lang_rec = lang.split("-")
                lang_code = lang_rec[0]
                if len(lang_rec) > 1:
                    lang_suf = lang_rec[1]
            if lang_code:
                lang_tag += f'{lang_code}-'
            lang_tag += f'{script_iso}'
            if script_suffix:
                lang_tag += f'-x-{script_suffix}'
            if lang_suf:
                lang_tag += f'-x-{lang_suf}'
            lang_data = dict(v)
            if 'translit' in lang_data:
                del lang_data['translit']
                if 'translit_override' in lang_data:
                    del lang_data['translit_override']
                self.data[script_iso] = self.data.get(script_iso, OrderedDict())
                self.data[script_iso][lang] = self.data[script_iso].get(
                    lang, lang_data)
                self.data[script_iso][lang][
                    'script_iso'] = script_iso
                self.data[script_iso][lang][
                    'script_suffix'] = script_suffix
                self.data[script_iso][lang]['lang_tag'] = lang_tag
                lc = langcodes.Language.get(lang_tag)
                self.data[script_iso][lang][
                    'population'] = lc.speaking_population()
                self.data[script_iso][lang][to_script_iso] = self.data[script_iso][
                    lang].get(to_script_iso, OrderedDict())
                self.data[script_iso][lang][to_script_iso]['script_iso'] = to_script_iso
                self.data[script_iso][lang][to_script_iso]['script'] = to_script
                self.data[script_iso][lang][to_script_iso]['translit'] = v.get('translit', '')
                self.data[script_iso][lang][to_script_iso]['override'] = v.get('translit_override', False)

    def _find_best_lang_for_script(self):
        und = None
        for script, langs in self.data.items():
            if 'und' not in langs:
                und = OrderedDict()
                und['population'] = -1
                for lang, langrec in langs.items():
                    if langrec['population'] > und['population']:
                        und = langrec
                langs['und'] = und

    def _save_data(self):
        data = sortOD(self.data)
        with open(Path(self.data_folder, "data.json"), "w", encoding="utf-8") as f:
            json.dump(data, f)
        with open(Path(self.data_folder, "data.yaml"), "w", encoding="utf-8") as f:
            writer.yaml(data, f)

    def update_data(self):
        self._rebuild_data()
        with open(Path(self.data_folder, "data_lang.json"),
                  "w",
                  encoding="utf-8") as f:
            json.dump(self.data_lang, f)
        with open(Path(self.data_folder, "data_lang.yaml"),
                  "w",
                  encoding="utf-8") as f:
            writer.yaml(self.data_lang, f)
        self._struct_data()
        self._find_best_lang_for_script()
        self._save_data()

    def test_load(self):
        reqs = []
        mods = [
            str(Path(p.parent, p.stem)).replace(str(self.lua_folder), 'translit')
            for p in Path(self.lua_folder).glob("**/*.lua")
        ]
        for mod in mods:
            reqs.append(f"""require("{mod}")""")
        sreqs = "\n".join(reqs)
        l = f"""
        {sreqs}
        res = "OK"
        """
        return self.tr.e(l)


def cli():
    parser = argparse.ArgumentParser(
        prog="wiktrapy_update",
        description="""Downloads specified Lua modules from Wiktionary""",
    )
    parser.add_argument(
        "-o",
        "--output",
        default=Path(lua_folder, "wikt"),
        required=False,
        metavar="folder",
        dest="output",
        help="""Folder in which the code will be created""",
    )
    parser.add_argument(
        "-p",
        "--page",
        default=None,
        required=False,
        metavar="page",
        dest="page",
        help="""Get specific page""",
    )
    parser.add_argument(
        "-f",
        "--force",
        action="store_true",
        dest="force",
        help="""Force overwrite""",
    )
    parser.add_argument(
        "-D",
        "--no-dependencies",
        action="store_true",
        dest="no_deps",
        help="""Ignore dependencies""",
    )
    parser.add_argument(
        "-d",
        "--data",
        action="store_true",
        dest="data_only",
        help="""Only update data""",
    )
    parser.add_argument(
        "-t",
        "--test",
        action="store_true",
        dest="test_only",
        help="""Only test loading Lua""",
    )
    return parser


def main(*args, **kwargs):
    parser = cli(*args, **kwargs)
    args = parser.parse_args()
    wkd = WiktionaryModuleDownload(args.output, force=args.force, deps=not args.no_deps)
    if args.page:
        wkd.write_module(args.page)
    elif args.data_only:
        logging.info("# Updating data")
        wkd.update_data()
    elif args.test_only:
        logging.info("# Testing")
        wkd.test_load()
    else:
        logging.info("# Writing transliteration modules")
        wkd.write_modules_category("Transliteration_modules")
        logging.info("# Writing additional modules")
        for mod in [
            "languages/byTranslitModule",
            "languages/extradata2",
            "languages/extradata3",
            "languages/extradatax",
            "scripts/code_to_canonical_name",
        ] + [f"languages/extradata3/{chr(l)}" for l in range(ord("a"), ord("z") + 1)]:
            wkd.write_module(mod)
        logging.info("# Testing")
        wkd.test_load()
        logging.info("# Updating data")
        wkd.update_data()

if __name__ == "__main__":
    main()
