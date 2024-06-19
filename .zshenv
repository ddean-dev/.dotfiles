if [ -x "$(command -v go)" ]; then
  export PATH=$HOME/go/bin:$PATH
fi

if [ -x "$(command -v pnpm)" ]; then
  export PNPM_HOME="/home/nibrodooh/.local/share/pnpm"
  case ":$PATH:" in
    *":$PNPM_HOME:"*) ;;
    *) export PATH="$PNPM_HOME:$PATH" ;;
  esac
  export ESLINT_USE_FLAT_CONFIG=true
fi

if [ -s "/home/nibrodooh/.bun/_bun" ]; then
  source "/home/nibrodooh/.bun/_bun"
  export BUN_INSTALL="$HOME/.bun"
  export PATH="$BUN_INSTALL/bin:$PATH"
fi
