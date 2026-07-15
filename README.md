# Neovim configuration

Personal [LazyVim](https://www.lazyvim.org/) configuration for general editing
and polyglot development. It is currently used with Neovim 0.12.4.

## Highlights

- Language support for Docker, Go, Java, JSON, Kotlin, Markdown, Terraform,
  TOML, TypeScript, and YAML through LazyVim extras.
- Telescope search includes hidden files while excluding `.git` contents.
- Neo-tree keeps filtered items visible so hidden and ignored files remain easy
  to inspect.
- Go tests run through neotest and `gotestsum`, with DAP support for debugging
  individual tests or entire files.
- Java uses JDTLS with per-project workspaces, Lombok support, debugging, tests,
  and parameter-name inlay hints.
- Formatting and linting extensions include `sqlfluff` and a custom
  `markdownlint-cli2` configuration.
- Copilot, CopilotChat, DAP, mini.diff, Trouble, CodeCompanion, and
  nvim-surround are available alongside LazyVim's defaults.
- Personal commands provide quick access to notes and configuration files;
  `:ReloadFromDisk` refreshes unmodified buffers and restarts language tooling.

See [nvim.shortcuts.md](./nvim.shortcuts.md) for the working keymap and command
reference. Inside Neovim, `:SC` opens that file and `<leader>sk` searches all
active keymaps.

## Requirements

Install these before starting Neovim:

- Neovim, Git, and [ripgrep](https://github.com/BurntSushi/ripgrep)
- A C compiler and build tools for plugins with native extensions
- A Nerd Font for LazyVim's icons
- The language runtimes and command-line tools needed for the projects being
  edited, such as Go, a JDK, Node.js, and Terraform
- Lazygit for the `<leader>gg` integration

Lazy.nvim bootstraps itself on first launch. LazyVim and Mason then install the
configured plugins, language servers, debuggers, formatters, and linters. The Go
test adapter also installs `gotestsum` with `go install`, so a working Go
toolchain and network connection are required when it is first built.

## Installation

Back up any existing Neovim configuration and data first, then clone this
repository:

```sh
mv ~/.config/nvim ~/.config/nvim.backup
git clone git@github.com:davelawson/nvim.git ~/.config/nvim
nvim
```

The first launch downloads the plugin manager and configured plugins. Within
Neovim, use `:Lazy` to inspect plugin installation, `:Mason` to inspect external
tools, and `:checkhealth` to diagnose missing system dependencies.

## Layout

| Path | Purpose |
| --- | --- |
| `init.lua` | Bootstrap plus personal commands and global mappings |
| `lazyvim.json` | Enabled LazyVim extras |
| `lua/config/` | Lazy setup, options, keymaps, and autocommands |
| `lua/plugins/` | Plugin additions and overrides |
| `ftplugin/` | Buffer-local settings for individual file types |
| `filetype.lua` | Additional file-extension detection |
| `nvim.shortcuts.md` | Personal shortcut and command reference |

Plugin revisions are recorded in `lazy-lock.json` for reproducible installs.
