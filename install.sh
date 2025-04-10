#!/bin/bash

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
  if [ ! -x "$(command -v brew)" ] && [ ! -x "$(command -v pacman)" ]; then
    bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
    eval "$(/home/linuxbrew/.linuxbrew/bin/brew shellenv)"
  fi
  brew install \
    starship neovim lazygit lazydocker \
    bottom pamburus/tap/hl
  npm install -g @bitwarden/cli pnpm
elif [ -x "$(command -v pacman)" ]; then
  sudo pacman -Syu
  sudo pacman -Sy --needed \
    git keychain man-pages man-db base-devel wl-clipboard \
    tmux zsh zsh-syntax-highlighting starship clipcat \
    eza bat ripgrep fzf duf bottom hl jq \
    cmake nodejs npm luarocks go zig rust \
    neovim lazygit docker docker-compose docker-buildx bitwarden \
    typos-lsp lua-language-server bash-language-server gopls pyright ruff \
    shfmt stylua
  if [ ! -x "$(command -v yay)" ]; then
    git clone https://aur.archlinux.org/yay.git
    cd yay
    makepkg -si
    cd ..
    rm -rf yay
  fi
  yay -Syu
  yay -Sy --needed lazydocker golangci-lint docker-ls snapd
  sudo npm i -g typescript eslint eslint_d prettier typescript-language-server vscode-langservers-extracted
  go install github.com/go-delve/delve/cmd/dlv@latest
  go install github.com/nametake/golangci-lint-langserver@latest
  go install github.com/docker/docker-language-server/cmd/docker-language-server@latest
fi

echo "#####################"
echo "# Updating Dotfiles #"
echo "#####################"
if [ ! -d "$HOME/.dotfiles/" ]; then
  git clone https://github.com/ddean-dev/.dotfiles "$HOME/.dotfiles/"
fi
git -C "$HOME/.dotfiles/" fetch
git -C "$HOME/.dotfiles/" pull
if [ ! -d "/usr/share/zsh/plugins/fzf-tab" ]; then
  sudo git clone https://github.com/Aloxaf/fzf-tab.git "/usr/share/zsh/plugins/fzf-tab"
fi
sudo git -C "/usr/share/zsh/plugins/fzf-tab" fetch
sudo git -C "/usr/share/zsh/plugins/fzf-tab" pull

echo "##################################"
echo "# Symlinking configuration files #"
echo "##################################"
ln -sfT "$HOME/.dotfiles/.zshrc" "$HOME/.zshrc"
ln -sfT "$HOME/.dotfiles/.zprofile" "$HOME/.zprofile"
ln -sfT "$HOME/.dotfiles/.zshenv" "$HOME/.zshenv"
ln -sfT "$HOME/.dotfiles/.gitconfig" "$HOME/.gitconfig"
ln -sfT "$HOME/.dotfiles/.tmux.conf" "$HOME/.tmux.conf"
ln -sfT "$HOME/.dotfiles/.wezterm.lua" "$HOME/.wezterm.lua"
mkdir -p "$HOME/.config/"
ln -sfTn "$HOME/.dotfiles/nvim" "$HOME/.config/nvim"
ln -sfTn "$HOME/.dotfiles/lazygit" "$HOME/.config/lazygit"
ln -sfTn "$HOME/.dotfiles/hl" "$HOME/.config/hl"
ln -sfTn "$HOME/.dotfiles/clipcat" "$HOME/.config/clipcat"
ln -sfT "$HOME/.dotfiles/starship.toml" "$HOME/.config/starship.toml"
chmod +x "$HOME/.dotfiles/fzf-tab-format.sh"

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
