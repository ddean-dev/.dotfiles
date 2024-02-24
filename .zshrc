# Start Tmux
if command -v tmux &> /dev/null && [ -n "$PS1" ] && [[ ! "$TERM" =~ screen ]] && [[ ! "$TERM" =~ tmux ]] && [ -z "$TMUX" ]; then
  eval "$(tmux new-session -A -s MAIN)"
fi

# Keybindings
bindkey -e
bindkey "^[[1;5D" backward-word
bindkey "^[[1;5C" forward-word

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
if [ -x "$(command -v keychain)" ]; then
  eval `keychain --eval --quiet --agents ssh`
  if ! ssh-add -l > /dev/null ; then
    ssh-add -q ~/.ssh/id_ed25519
  fi
fi
if [ -x "$(command -v eza)" ]; then
  alias ls='eza --icons'
  alias dir='eza --long --header --git --time-style=iso --icons'
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
if [ -x "$(command -v nvim)" ]; then
  alias vim='nvim'
  export EDITOR=nvim
  export MANPAGER='nvim +Man!'
fi
if [ -x "$(command -v lazygit)" ]; then
  alias lg='lazygit'
fi

# ZSH settings
HISTFILE=~/.histfile
HISTSIZE=1000
SAVEHIST=1000

# Completion Settings
zstyle ':completion:*' list-colors ''
zstyle ':completion:*' list-prompt %SAt %p: Hit TAB for more, or the character to insert%s
zstyle ':completion:*' matcher-list '' 'm:{[:lower:][:upper:]}={[:upper:][:lower:]}' 'r:|[._-]=** r:|=** l:|=*'
zstyle ':completion:*' menu select=1
zstyle ':completion:*' select-prompt %SScrolling active: current selection at %p%s
zstyle ':completion:*' verbose true
autoload -Uz compinit; compinit
