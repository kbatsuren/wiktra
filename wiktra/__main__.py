#!/usr/bin/env python3
# -*- coding: utf-8 -*-
"""
"""

import wiktra
from argparse import ArgumentParser
import logging
from pathlib import Path
import sys

PROG = "wiktrapy"


def cli():
    parser = ArgumentParser(prog=f"{PROG}")
    parser.add_argument("-t", "--text", metavar="TEXT", dest="text")
    parser.add_argument("-i", "--input", metavar="FILE", dest="in_file")
    parser.add_argument(
        "-l",
        "--lang",
        metavar="LANG",
        dest="in_lang",
        default=None,
        help="Input language as ISO 639-2 code",
    )
    parser.add_argument(
        "-s",
        "--script",
        metavar="SCRIPT",
        dest="in_script",
        default=None,
        help="Input script as ISO 15924 code",
    )
    parser.add_argument(
        "-o",
        "--to-script",
        metavar="SCRIPT",
        dest="out_script",
        default="Latn",
        help="Output script as ISO 15924 code",
    )
    parser.add_argument(
        "-x",
        "--explicit",
        action="store_true",
        dest="explicit",
        help="""Explicit language/script, no fuzzy matching""",
    )
    parser.add_argument(
        "--stats",
        action="store_true",
        dest="stats",
        help="""List supported scripts and orthographies""",
    )
    parser.add_argument(
        "-v",
        "--verbose",
        action="count",
        default=1,
        help="-v show progress, -vv show debug",
    )
    parser.add_argument(
        "-V",
        "--version",
        action="version",
        version="%s %s" % (PROG, wiktra.__version__),
        help="show version and exit",
    )
    return parser


def main(*args, **kwargs):
    parser = cli(*args, **kwargs)
    args = parser.parse_args()
    args.verbose = 40 - (10 * args.verbose) if args.verbose > 0 else 0
    logging.basicConfig(
        level=args.verbose,
        format="%(asctime)s %(levelname)s: %(message)s",
        datefmt="%Y-%m-%d %H:%M:%S",
    )
    opts = vars(args)
    logging.debug("Running with options:\n%s" % repr(opts))
    del opts["verbose"]
    if opts["in_file"]:
        with open(Path(opts["in_file"]), "r", encoding="utf8") as f:
            text = f.read()
    elif opts["text"]:
        text = opts["text"]
    else:
        text = sys.stdin.read().rstrip()
    tr = wiktra.Wiktra.Transliterator()
    if opts.get("stats", False):
        print(f'{len(tr.mod_map.keys())} scripts: {" ".join(tr.mod_map.keys())}')
        print(f'{len(tr.lang_tags)} orthographies: {" ".join(tr.lang_tags)}')
    else:
        res = tr.tr(
            text,
            lang=opts["in_lang"],
            sc=opts["in_script"],
            to_sc=opts["out_script"],
            explicit=opts["explicit"],
        )
        print(res)


if __name__ == "__main__":
    main()
