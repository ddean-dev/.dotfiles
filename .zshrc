# Start Tmux (if not in ssh/tmux/screen session)
if [ -x "$(command -v tmux)" ] && [ -n "$PS1" ] && [ -z "$SSH_CLIENT" ] && [ -z "$SSH_TTY" ] && [[ ! "$TERM" =~ screen ]] && [[ ! "$TERM" =~ tmux ]] && [ -z "$TMUX" ]; then
  tmux new-session -A -s MAIN
fi

# Keybindings
bindkey -e
bindkey "^[[1;5D" backward-word
bindkey "^[[1;5C" forward-word
bindkey "^[[1~" beginning-of-line
bindkey "^[[4~" end-of-line

# Environment
alias reload='source $HOME/.zshrc'
if [ -x "/home/linuxbrew/.linuxbrew/bin/brew" ]; then
  eval "$(/home/linuxbrew/.linuxbrew/bin/brew shellenv)"
fi
if [ -x "$(command -v starship)" ]; then
  eval "$(starship init zsh)"
fi
if [ -x "$(command -v tmux)" ]; then
  alias tx="tmux new-session -A -s MAIN"
fi
if [[ $TMUX ]]; then
  alias clear='clear && tmux clear-history'
fi
if [ -x "$(command -v fzf)" ]; then
  export FZF_DEFAULT_OPTS='--tmux center'
  source <(fzf --zsh)
fi
if [ -x "$(command -v keychain)" ]; then
  eval `keychain --eval --quiet`
  if ! ssh-add -l > /dev/null ; then
    ssh-add -q ~/.ssh/id_ed25519
  fi
fi
if [ -x "$(command -v eza)" ]; then
  alias ls='eza --icons'
  alias dir='eza --long --header --git --time-style=iso --icons'
fi
if [ -x "$(command -v nvim)" ]; then
  alias vim='nvim'
fi
if [ -x "$(command -v lazygit)" ]; then
  alias lg='lazygit'
fi
if [ -x "$(command -v bat)" ]; then
  alias cat='bat'
fi
if [ -x "$(command -v rg)" ]; then
  alias grep='rg'
fi
if [ -x "$(command -v duf)" ]; then
  alias df='duf'
fi
if [ -x "$(command -v btm)" ]; then
  alias top='btm'
fi
if [ -x "$(command -v go)" ]; then
  alias gooutdated="go list -f '{{if not .Indirect}}{{if .Update}}{{.}}{{end}}{{end}}' -u -m all | column -t"
fi

# ZSH settings
HISTFILE=~/.histfile
HISTSIZE=1000
SAVEHIST=1000

# Set cursor type
echo '\e[5 q'

# Completion Settings
autoload -Uz compinit; compinit
zstyle ':completion:*' menu select=1
zstyle ':completion:*' verbose true
zstyle ':completion:*' matcher-list '' 'm:{[:lower:][:upper:]}={[:upper:][:lower:]}' 'r:|[._-]=** r:|=** l:|=*'
if [ -x "$(command -v fzf)" ]; then
  source /usr/share/zsh/plugins/fzf-tab/fzf-tab.zsh
  zstyle ':fzf-tab:*' fzf-command ftb-tmux-popup
  zstyle ':fzf-tab:*' popup-min-size 120 40
  zstyle ':fzf-tab:complete:*:*' fzf-preview '~/.dotfiles/fzf-tab-format.sh ${(Q)realpath}'
  zstyle ':fzf-tab:complete:*:options' fzf-preview
  zstyle ':fzf-tab:complete:*:argument-1' fzf-preview
fi

# Syntax Highlighting
if [ -f "/usr/share/zsh/plugins/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh" ]; then
  source /usr/share/zsh/plugins/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh
elif [ -x "/home/linuxbrew/.linuxbrew/bin/brew" ]; then
  if [ -f "$(brew --prefix)/share/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh" ]; then
    source $(brew --prefix)/share/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh
  fi
fi

