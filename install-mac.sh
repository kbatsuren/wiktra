#!/usr/bin/env bash
# -*- coding: utf-8 -*-

dir=${0%/*}
if [ "$dir" = "$0" ]; then
  dir="."
fi
cd "$dir"

# Check if brew is installed
if [ ! -x "$(which brew)" ]; then
	echo "# Installing 'brew'..."
	/bin/bash -c \
	"$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
fi

# Install lua if needed
if [ ! -x "$(which lua)" ]; then
	brew install lua
fi

# Install luarocks if needed
if [ ! -x "$(which luarocks)" ]; then
	brew install luarocks
fi

# Install luajit if needed
if [ ! -x "$(which luajit)" ]; then
	brew install luajit-openresty && \
	brew link --force luajit-openresty
fi

# Install python3 if needed
if [ ! -x "$(which python3)" ]; then
	brew install python
fi

# Install lua-format if needed
if [ ! -x "$(which lua-format)" ]; then
	luarocks install --server=https://luarocks.org/dev luaformatter
fi

python3 -m pip install --user --upgrade -r requirements.txt
python3 -m pip install --user --upgrade .
echo "# Done!"
