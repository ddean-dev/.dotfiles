#!/usr/bin/env bash

# Install packages from apt
sudo apt update && sudo apt upgrade
sudo apt install -y zsh exa git curl screen tmux zip unzip golang fuse libfuse2 build-essential

# Install homebrew
if [ ! -x "$(command -v brew)"]; then
	bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
	eval "$(/home/linuxbrew/.linuxbrew/bin/brew shellenv)"
fi

# Install packages from brew
brew update && brew upgrade
brew install starship neovim lazygit node pnpm luarocks

# Symlink config files
ln -svf "$HOME/.dotfiles/.zshrc" "$HOME/.zshrc"
ln -svf "$HOME/.dotfiles/.gitconfig" "$HOME/.gitconfig"
ln -svf "$HOME/.dotfiles/nvim" "$HOME/.config/nvim"

# Ensure zsh is shell
echo "Setting Shell to ZSH"
chsh -s $(which zsh)

# Setup ssh key
if [ ! -f "$HOME/.ssh/id_ed25519" ]; then
	echo "Generating SSH Key"
	ssh-keygen -t ed25519 -C "david@ddean.dev"
	eval "$(ssh-agent -s)"
	ssh-add ~/.ssh/id_ed25519
fi

echo "Add below key to GitHub"
cat ~/.ssh/id_ed25519.pub
echo "Add above key to GitHub"

#setup signing key
