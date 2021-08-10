#!/usr/bin/env python3
# -*- coding: utf-8 -*-
"""
"""

import wiktra
from argparse import ArgumentParser
import logging
from pathlib import Path

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
    else:
        text = opts["text"]
    tr = wiktra.Wiktra.Transliterator()
    res = tr.tr(text, opts["in_lang"], opts["in_script"])
    print(res)


if __name__ == "__main__":
    main()
