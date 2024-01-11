#!/usr/bin/env bash

#install packages
sudo apt update && sudo apt upgrade
sudo apt install -y zsh exa curl zip unzip golang fuse libfuse2
if ! [ -x "$(command -v starship)" ]; then
	echo "downloading starship"
	curl -sS https://starship.rs/install.sh | sh
fi
if ! [ -x "$(command -v nvim)" ]; then
	echo "downloading nvim"
	curl -LO https://github.com/neovim/neovim/releases/latest/download/nvim.appimage
	chmod +x nvim.appimage
	sudo mv nvim.appimage /usr/local/bin/nvim
fi
if ! [ -x "$(command -v pnpm)" ]; then
	echo "downloading pnpm"
	curl -fsSL https://get.pnpm.io/install.sh | sh -
fi

#update config folder
if [ -e "$HOME/.dotfiles" ]; then
	echo "pulling dotfiles"
	git -C "$HOME/.dotfiles" pull
else
	echo "cloning dotfiles"
	git clone "https://github.com/ddean-dev/.dotfiles.git" ~/.dotfiles/
fi

#symlink config files
ln -svf "$HOME/.dotfiles/.zshrc" "$HOME/.zshrc"
ln -svf "$HOME/.dotfiles/.gitconfig" "$HOME/.gitconfig"

#ensure zsh is shell
chsh -s $(which zsh)

#setup ssh key
#setup signing key
#setup ???
