#!/usr/bin/env python3
# -*- coding: utf-8 -*-

# pip install pywikiapi

import argparse
import logging
import subprocess
import re
from wiktra.Wiktra import *

import pywikiapi

logging.basicConfig(level=logging.INFO)


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
    ]

    def __init__(self, output_folder, force=False, deps=True):
        self.outf = output_folder
        self.force = force
        self.deps = deps
        if not Path(self.outf).is_dir():
            Path(self.outf).mkdir(parents=True, exist_ok=True)
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
            text = text.replace(
                """mname:gsub("data", "extradata")""", """mname:gsub("data", "data")"""
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
        outfolder = Path(self.outf, inpath.parent)
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
        self.lua = LuaRuntime(unpack_returned_tuples=True)
        logging.info(f"Executing {to_exec}")
        res = ""
        path = Path(self.outf, to_exec + ".lua")
        with open(Path(path), "r", encoding="utf8") as f:
            lua_str = f.read()
            try:
                self.lua.execute(lua_str)
                res = self.lua.globals().res
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


def cli():
    parser = argparse.ArgumentParser(
        prog="wiktrapy_update",
        description="""Downloads specified Lua modules from Wiktionary""",
    )
    parser.add_argument(
        "-o",
        "--output",
        default=Path(lua_folder, "wikt", "translit"),
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
    return parser


def main(*args, **kwargs):
    parser = cli(*args, **kwargs)
    args = parser.parse_args()
    wkd = WiktionaryModuleDownload(
        args.output,
        force=args.force,
        deps=not args.no_deps
    )
    if args.page:
        wkd.write_module(args.page)
    else:
        logging.info("# Writing transliteration modules")
        wkd.write_modules_category("Transliteration_modules")
        logging.info("# Writing additional modules")
        for mod in [
            "languages/byTranslitModule",
            "scripts/code_to_canonical_name",
        ]:
            wkd.write_module(mod)


if __name__ == "__main__":
    main()
