#!/bin/bash

# link in vscode settings
rm /root/capsule/code/.vscode/Machine/settings.json
ln -s /root/vscode_machine_settings.json /root/capsule/code/.vscode/Machine/settings.json

VSCODE_DIR=/root/capsule/code/.vscode/User/
VSCODE_CONFIG="$VSCODE_DIR/mcp.json"
if [ ! -f "$VSCODE_CONFIG" ]; then
  mkdir -p $VSCODE_DIR
  cp /root/mcp.json "$VSCODE_CONFIG"
fi
# Cline MCP settings
CLINE_DIR="$HOME/capsule/code/.vscode/User/globalStorage/saoudrizwan.claude-dev/settings"
CLINE_CONFIG="$CLINE_DIR/cline_mcp_settings.json"

if [ ! -f "$CLINE_CONFIG" ]; then
  mkdir -p $CLINE_DIR
  cp /root/cline_mcp_settings.json "$CLINE_CONFIG"
fi

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