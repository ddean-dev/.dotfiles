#!/usr/bin/env sh
if [ -d "$1" ]; then
  eza --tree --colour=always --icons "$1"
elif [ -f "$1" ]; then
  bat --color=always -p "$1"
else
  echo "$1"
fi
