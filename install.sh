#!/bin/bash

# Install homebrew
if [ ! -x "$(command -v brew)" ]; then
  bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
  eval "$(/home/linuxbrew/.linuxbrew/bin/brew shellenv)"
fi

# Install packages from brew
brew install starship keychain eza neovim lazygit bat ripgrep fzf node pnpm luarocks go zig rust cmake

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
echo "Add below key to GitHub"
cat ~/.ssh/id_ed25519.pub
echo "Add above key to GitHub"
