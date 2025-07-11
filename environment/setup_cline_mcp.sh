#!/bin/bash

CLINE_CONFIG="$HOME/.vscode/User/globalStorage/saoudrizwan.claude-dev/settings/cline_mcp_settings.json"
PROJECT_ROOT="$(pwd)"

# Check if config needs to be created or updated
needs_update=false

if [ ! -f "$CLINE_CONFIG" ]; then
  needs_update=true
  echo "MCP configuration file not found, creating..."
elif [ -f "$CLINE_CONFIG" ] && ! grep -q '"aind-metadata-mcp"' "$CLINE_CONFIG" 2>/dev/null; then
  needs_update=true
  echo "MCP configuration exists but is empty or incomplete, updating..."
fi

if [ "$needs_update" = true ]; then
  cat > "$CLINE_CONFIG" << EOF
{
  "mcpServers": {
    "aind-metadata-mcp": {
      "command": "aind-metadata-mcp"
    }
  }
}
EOF

  echo "MCP configuration created for Cline extension."
else
  echo "Cline MCP configuration already exists, skipping creation"
fi
