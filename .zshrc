# Keybindings
bindkey -e
bindkey "^[[1;5D" backward-word
bindkey "^[[1;5C" forward-word

# Aliases
alias ls='eza --icons'
alias dir='eza --long --header --git --time-style=iso --icons'
function lk { cd "$(walk --icons "$@")" }
alias vim='nvim'
alias vi='nvim'
alias lg='lazygit'
alias reload='source $HOME/.zshrc'

# Environment
export EDITOR=nvim
export MANPAGER='nvim +Man!'

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

eval "$(/home/linuxbrew/.linuxbrew/bin/brew shellenv)"
eval "$(starship init zsh)"

# Start tmux
if command -v tmux &> /dev/null && [ -n "$PS1" ] && [[ ! "$TERM" =~ screen ]] && [[ ! "$TERM" =~ tmux ]] && [ -z "$TMUX" ]; then
  exec tmux new-session -A -s LOCAL
fi
