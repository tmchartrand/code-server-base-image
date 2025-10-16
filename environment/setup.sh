#!/bin/bash

# link in vscode settings
rm /root/capsule/code/.vscode/Machine/settings.json
ln -s /root/vscode_machine_settings.json /root/capsule/code/.vscode/Machine/settings.json
ln -s /root/mcp.json /root/capsule/code/.vscode/Machine/mcp.json

# Cline MCP settings
CLINE_DIR="$HOME/capsule/code/.vscode/User/globalStorage/saoudrizwan.claude-dev/settings"
CLINE_CONFIG="$CLINE_DIR/cline_mcp_settings.json"

if [ ! -f "$CLINE_CONFIG" ]; then
  mkdir -p $CLINE_DIR
  cat > "$CLINE_CONFIG" << EOF
{
  "mcpServers": {
    "aind-metadata-mcp": {
      "command": "aind-metadata-mcp"
    }
  }
}
EOF
fi

DIRECTORY=/root/.dotfiles
# install dotfiles via git if $DOTFILES_REPO is set
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