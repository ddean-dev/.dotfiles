#!/bin/bash

# Clone .dotfiles repo
if [ ! -d "$HOME/.dotfiles/" ]; then
  git clone https://github.com/ddean-dev/.dotfiles "$HOME/.dotfiles/"
fi
git -C "$HOME/.dotfiles/" fetch
git -C "$HOME/.dotfiles/" pull

# List of packages to install
PACKAGES=""
PACKAGES="$PACKAGES starship zsh-syntax-highlighting keychain"
PACKAGES="$PACKAGES neovim lazygit"
PACKAGES="$PACKAGES eza bat ripgrep fzf duf bottom"
PACKAGES="$PACKAGES node pnpm luarocks go zig rust cmake"

# TODO: install via native package managers

# Install via hoebrew
if [ ! -x "$(command -v brew)" ]; then
  bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
  eval "$(/home/linuxbrew/.linuxbrew/bin/brew shellenv)"
fi
brew install $PACKAGES

# Intall tmux package manager
if [ ! -d "$HOME/.tmux/plugins/tpm" ]; then
  git clone https://github.com/tmux-plugins/tpm "$HOME/.tmux/plugins/tpm"
fi

# Symlink config files
ln -sfT "$HOME/.dotfiles/.zshrc" "$HOME/.zshrc"
ln -sfT "$HOME/.dotfiles/.zprofile" "$HOME/.zprofile"
ln -sfT "$HOME/.dotfiles/.zshenv" "$HOME/.zshenv"
ln -sfT "$HOME/.dotfiles/.gitconfig" "$HOME/.gitconfig"
ln -sfT "$HOME/.dotfiles/.tmux.conf" "$HOME/.tmux.conf"
mkdir -p "$HOME/.config/"
ln -sfTn "$HOME/.dotfiles/nvim" "$HOME/.config/nvim"
ln -sfT "$HOME/.dotfiles/lazygit/config.yml" "$HOME/.config/lazygit/config.yml"

# Setup ssh key
if [ ! -f "$HOME/.ssh/id_ed25519" ]; then
  echo "Generating SSH Key"
  ssh-keygen -t ed25519 -C "david@ddean.dev"
  eval `keychain --eval --quiet --agents ssh`
  ssh-add ~/.ssh/id_ed25519
fi
echo ""
echo "###########################"
echo "# Add below key to GitHub #"
echo "###########################"
cat ~/.ssh/id_ed25519.pub
echo "###########################"
echo "# Add above key to GitHub #"
echo "###########################"
