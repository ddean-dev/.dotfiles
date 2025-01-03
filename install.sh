#!/bin/bash

if [ ! -x "$(command -v brew)" ]; then
  echo "#######################"
  echo "# Installing Homebrew #"
  echo "#######################"
  bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
  eval "$(/home/linuxbrew/.linuxbrew/bin/brew shellenv)"
fi

echo "#######################"
echo "# Installing Packages #"
echo "#######################"
if [ -x "$(command -v apt)" ]; then
  sudo apt update && sudo apt upgrade
  sudo apt install \
    git ssh keychain \
    tmux zsh zsh-syntax-highlighting \
    eza bat ripgrep fzf duf \
    nodejs npm lua5.4 luarocks golang rust-all
  brew install \
    starship neovim lazygit lazydocker \
    bottom pamburus/tap/hl
  npm install -g @bitwarden/cli pnpm
elif [ -x "$(command -v pacman)" ]; then
  sudo pacman -Syu
  sudo pacman -Sy --needed \
    git keychain man-pages man-db \
    zsh zsh-syntax-highlighting starship \
    bat ripgrep fzf duf bottom \
    cmake pnpm luarocks go zig rust
  brew install neovim lazygit lazydocker eza pamburus/tap/hl node
  npm install -g @bitwarden/cli
fi

echo "#####################"
echo "# Updating Dotfiles #"
echo "#####################"
if [ ! -d "$HOME/.dotfiles/" ]; then
  git clone https://github.com/ddean-dev/.dotfiles "$HOME/.dotfiles/"
fi
git -C "$HOME/.dotfiles/" fetch
git -C "$HOME/.dotfiles/" pull

echo "##################################"
echo "# Symlinking configuration files #"
echo "##################################"
ln -sfT "$HOME/.dotfiles/.zshrc" "$HOME/.zshrc"
ln -sfT "$HOME/.dotfiles/.zprofile" "$HOME/.zprofile"
ln -sfT "$HOME/.dotfiles/.zshenv" "$HOME/.zshenv"
ln -sfT "$HOME/.dotfiles/.gitconfig" "$HOME/.gitconfig"
ln -sfT "$HOME/.dotfiles/.tmux.conf" "$HOME/.tmux.conf"
mkdir -p "$HOME/.config/"
ln -sfTn "$HOME/.dotfiles/nvim" "$HOME/.config/nvim"
ln -sfTn "$HOME/.dotfiles/lazygit" "$HOME/.config/lazygit"
ln -sfTn "$HOME/.dotfiles/hl" "$HOME/.config/hl"
ln -sfT "$HOME/.dotfiles/starship.toml" "$HOME/.config/starship.toml"

if [ ! -f "$HOME/.ssh/id_ed25519" ]; then
  echo "######################"
  echo "# Generating SSH Key #"
  echo "######################"
  ssh-keygen -t ed25519 -C "david@ddean.dev"
  eval $(keychain --eval --quiet --agents ssh)
  ssh-add ~/.ssh/id_ed25519
fi

# Display ssh key
echo "###########################"
echo "# Add below key to GitHub #"
echo "###########################"
cat ~/.ssh/id_ed25519.pub
echo "###########################"
echo "# Add above key to GitHub #"
echo "###########################"
