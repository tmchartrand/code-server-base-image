# code-server-base-image

A [CodeOcean](https://codeocean.com) capsule that builds a reusable Docker base image pre-configured with a browser-based VS Code environment.

## Purpose

This repository produces a base Docker image intended to be used as the foundation for CodeOcean compute capsules that require an interactive, browser-based coding environment. The image bundles:

- **[code-server](https://github.com/coder/code-server)** – VS Code running in the browser, with GitHub Copilot and Python development extensions pre-installed.
- **Preset machine settings** – Critical VS Code settings are applied at the *machine* level so they take effect for every user without requiring manual configuration.
- **[aind-metadata-mcp](https://github.com/AllenNeuralDynamics/aind-metadata-mcp)** – Pre-installed MCP (Model Context Protocol) server for Allen Institute for Neural Dynamics metadata.
- **Python 3.12.4 via Mambaforge** on Ubuntu 22.04 as the base runtime.

## Optional dotfiles support

On container startup, if the `DOTFILES_REPO` environment variable is set to a git repository URL, the setup script (`environment/files/setup.sh`) will:

1. Clone (or pull) the dotfiles repository to `~/.dotfiles`.
2. Run the repository's `install.sh` script, which is expected to be idempotent and non-destructive.

This allows individual users to personalize the environment without modifying the base image.

## Repository layout

```
environment/
  Dockerfile                 # Image definition
  files/
    setup.sh                 # Startup script sourced via ~/.profile
metadata/
  metadata.yml               # CodeOcean capsule metadata
code/
  run                        # Capsule entrypoint (minimal; image build is the primary output)
.codeocean/
  resources.json             # CodeOcean compute resource configuration
```

## Building

The image is built by CodeOcean when the capsule is run or its environment is rebuilt. The `Dockerfile` accepts the following build arguments:

| Argument | Description |
|---|---|
| `REGISTRY_HOST` | Hostname of the Docker registry supplying the base `mambaforge3` image |
| `GIT_ASKPASS` / `GIT_ACCESS_TOKEN` | Credentials used during the build for any authenticated git operations |
