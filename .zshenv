if [ -x "$(command -v go)" ]; then
  export GOPATH=$HOME/go
  export PATH=$GOPATH/bin:$PATH
fi

if [ -x "$(command -v cargo)" ]; then
  export PATH=$HOME/.cargo/bin:$PATH
fi

if [ -x "$(command -v pnpm)" ]; then
  export PNPM_HOME="$HOME/.local/share/pnpm"
  case ":$PATH:" in
    *":$PNPM_HOME/bin:"*) ;;
    *) export PATH="$PNPM_HOME/bin:$PATH" ;;
  esac
fi

if [ -x "$(command -v nvim)" ]; then
  export EDITOR=nvim
  export MANPAGER='nvim +Man!'
fi

if [ -x "$(command -v podman)" ]; then
  export DOCKER_HOST="unix://$XDG_RUNTIME_DIR/podman/podman.sock"
fi
