if [ -x "$(command -v keychain)" ]; then
  eval `keychain --eval --quiet --agents ssh`
  if ! ssh-add -l > /dev/null ; then
    ssh-add -q ~/.ssh/id_ed25519
  fi
fi
