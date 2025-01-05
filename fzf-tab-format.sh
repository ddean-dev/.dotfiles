#!/usr/bin/env sh
if [ -d "$1" ]; then
  eza --tree --colour=always --icons "$1"
else
  bat --color=always -p "$1"
fi
