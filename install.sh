#!/usr/bin/env bash

VERSION_LUA="5.3.5"
VERSION_LUAROCKS="3.9.2"

#install packages
#sudo apt update && sudo apt upgrade
#sudo apt install -y zsh exa git curl screen tmux zip unzip golang fuse libfuse2

# Install starship
if ! [ -x "$(command -v starship)" ]; then
  echo "downloading starship"
  curl -sS https://starship.rs/install.sh | sh
fi

# Install nvim
if ! [ -x "$(command -v nvim)" ]; then
  echo "downloading nvim"
  curl -LO https://github.com/neovim/neovim/releases/latest/download/nvim.appimage
  chmod +x nvim.appimage
  sudo mv nvim.appimage /usr/local/bin/nvim
fi

# Install lazygit
if ! [ -x "$(command -v lazygit)" ]; then
  echo "downloading lazygit"
  LAZYGIT_VERSION=$(curl -s "https://api.github.com/repos/jesseduffield/lazygit/releases/latest" | grep -Po '"tag_name": "v\K[^"]*')
  curl -Lo lazygit.tar.gz "https://github.com/jesseduffield/lazygit/releases/latest/download/lazygit_${LAZYGIT_VERSION}_Linux_x86_64.tar.gz"
  tar xf lazygit.tar.gz lazygit
  sudo install lazygit /usr/local/bin
fi

# Install pnpm
if ! [ -x "$(command -v pnpm)" ]; then
  echo "downloading pnpm"
  curl -fsSL https://get.pnpm.io/install.sh | sh -
fi

# Install lua
if ! [ -x "$(command -v lua)" ]; then
  curl -Lo "lua.tar.gz" "http://www.lua.org/ftp/lua-$VERSION_LUA.tar.gz"
  tar -zxf "lua.tar.gz"
  cd lua
  sudo make install
  cd ..
  rm -r lua
  rm lua.tar.gz

  curl -Lo "luarocks.tar.gz" "https://luarocks.org/releases/luarocks-$VERSION_LUA.tar.gz"
  tar -zxpf luarocks.tar.gz
  cd luarocks
  ./configure && make && sudo make install
  cd ..
  rm -r luarocks
  rm luarocks.tar.gz
fi

#update config folder
#if [ -e "$HOME/.dotfiles" ]; then
#  echo "pulling dotfiles"
#  git -C "$HOME/.dotfiles" pull
#else
#  echo "cloning dotfiles"
#  git clone "https://github.com/ddean-dev/.dotfiles.git" "$HOME/.dotfiles/"
#fi

#symlink config files
#ln -svf "$HOME/.dotfiles/.zshrc" "$HOME/.zshrc"
#ln -svf "$HOME/.dotfiles/.gitconfig" "$HOME/.gitconfig"
#ln -svf "$HOME/.dotfiles/nvim" "$HOME/.config/nvim"

#ensure zsh is shell
#echo "Setting Shell to ZSH"
#chsh -s $(which zsh)

#setup ssh key

#setup signing key

