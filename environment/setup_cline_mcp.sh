#!/bin/bash

CLINE_CONFIG="$HOME/.vscode/User/globalStorage/saoudrizwan.claude-dev/settings/cline_mcp_settings.json"
PROJECT_ROOT="$(pwd)"

# Create MCP config with current project path only if it doesn't exist
if [ ! -f "$CLINE_CONFIG" ]; then
  cat > "$CLINE_CONFIG" << EOF
{
  "mcpServers": {
    "filesystem": {
      "command": "npx",
      "args": ["-y", "@modelcontextprotocol/server-filesystem", "$PROJECT_ROOT"]
    },
    "github": {
      "command": "npx", 
      "args": ["-y", "@modelcontextprotocol/server-github"],
      "env": {"GITHUB_PERSONAL_ACCESS_TOKEN": "\${GITHUB_TOKEN}"}
    }
  }
}
EOF

  echo "MCP configuration created for Cline extension."
else
  echo "Cline MCP configuration already exists, skipping creation"
fi
