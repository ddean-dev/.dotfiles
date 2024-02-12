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
if [ -x "$(command -v keychain)" ]; then
  eval `keychain --eval --quiet --agents ssh`
fi
if [ -x "$(command -v eza)" ]; then
  alias ls='eza --icons'
  alias dir='eza --long --header --git --time-style=iso --icons'
fi
if [ -x "$(command -v nvim)" ]; then
  alias vim='nvim'
  export EDITOR=nvim
  export MANPAGER='nvim +Man!'
fi
if [ -x "$(command -v lazygit)" ]; then
  alias lg='lazygit'
fi
if [ -x "$(command -v tmux)" ]; then
  alias tx="tmux new-session -A -s MAIN"
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

# Start tmux
if command -v tmux &> /dev/null && [ -n "$PS1" ] && [[ ! "$TERM" =~ screen ]] && [[ ! "$TERM" =~ tmux ]] && [ -z "$TMUX" ]; then
  tmux new-session -A -s MAIN
fi
