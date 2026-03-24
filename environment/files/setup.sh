#!/bin/bash

# link in vscode settings
rm /root/capsule/code/.vscode/Machine/settings.json
ln -s /root/vscode_machine_settings.json /root/capsule/code/.vscode/Machine/settings.json


DIRECTORY=/root/.dotfiles
# install dotfiles via git if $DOTFILES_REPO is set
# TODO: move this into chezmoi scripts in dotfiles instead?
if test -n "$DOTFILES_REPO"; then
  if [ -d "$DIRECTORY" ]; then
    echo "updating dotfiles"
    cd $DIRECTORY
    git pull
  else
    echo "installing dotfiles"
    git clone $DOTFILES_REPO $DIRECTORY --depth 1
    cd $DIRECTORY
  fi
  # install script should be idempotent, fast, and ideally not overwrite user changes
  bash install.sh
  cd -
fi