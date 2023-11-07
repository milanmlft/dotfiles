#!/usr/bin/env bash

## Update Brewfile
brew bundle dump --describe --force --file $HOME/.Brewfile

## Remove VSCode lines
sed --in-place --follow-symlinks '/^vscode/d' $HOME/.Brewfile
