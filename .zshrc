# Start Tmux (if not in ssh/tmux/screen session)
if [ -x "$(command -v tmux)" ] && [ -n "$PS1" ] && [ -z "$SSH_CLIENT" ] && [ -z "$SSH_TTY" ] && [[ ! "$TERM" =~ screen ]] && [[ ! "$TERM" =~ tmux ]] && [ -z "$TMUX" ]; then
  tmux new-session -A -s MAIN
  exit
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
if [[ $TMUX ]]; then
  alias clear='clear && tmux clear-history'
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
if [ -x "$(command -v nvim)" ]; then
  alias vim='nvim'
  export EDITOR=nvim
  export MANPAGER='nvim +Man!'
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
if [ -x "$(command -v pnpm)" ]; then
  export PNPM_HOME="/home/ddean/.local/share/pnpm"
  case ":$PATH:" in
  *":$PNPM_HOME:"*) ;;
  *) export PATH="$PNPM_HOME:$PATH" ;;
  esac
fi


# ZSH settings
HISTFILE=~/.histfile
HISTSIZE=1000
SAVEHIST=1000

# Set cursor type
echo '\e[5 q'

# Completion Settings
zstyle ':completion:*' list-colors ''
zstyle ':completion:*' list-prompt %SAt %p: Hit TAB for more, or the character to insert%s
zstyle ':completion:*' matcher-list '' 'm:{[:lower:][:upper:]}={[:upper:][:lower:]}' 'r:|[._-]=** r:|=** l:|=*'
zstyle ':completion:*' menu select=1
zstyle ':completion:*' select-prompt %SScrolling active: current selection at %p%s
zstyle ':completion:*' verbose true
autoload -Uz compinit; compinit

# Syntax Highlighting
if [ -f "$(brew --prefix)/share/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh" ]; then
  source $(brew --prefix)/share/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh
fi
