#!/usr/bin/env bash
# -*- coding: utf-8 -*-

/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"

brew install lua
brew install luajit-openresty && brew link --force luajit-openresty
brew install python
