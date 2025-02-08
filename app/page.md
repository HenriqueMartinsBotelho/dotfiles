# Neovim Distro Documentation

Welcome to the NextVim

This Neovim distribution comes pre-configured with a set of options, keybindings, autocommands, and plugin integrations designed to streamline your editing experience.

---

## Table of Contents

1. [Prerequisites](#prerequisites)
2. [Installation](#installation)
3. [Configuration Overview](#configuration-overview)
4. [Keybindings](#keybindings)
5. [Plugins and Plugin Manager](#plugins-and-plugin-manager)
6. [Custom Functions](#custom-functions)
7. [Autocommands](#autocommands)
8. [Troubleshooting and Customization](#troubleshooting-and-customization)
9. [Credits and Further Reading](#credits-and-further-reading)

---

## Prerequisites

- **Neovim v0.8+** – This configuration is written in Lua and requires a recent version of Neovim.
- **Nerd Font (optional)** – The distro supports Nerd Font icons. Set `vim.g.have_nerd_font = true` to enable icon support.
- **Python3** – For the file sending feature (see [Custom Functions](#send-file-to-other-computer)).

---

## Installation

1. **Clone or download the configuration:**

   Place the configuration file (typically `init.lua` or a file sourced by it) in your Neovim configuration directory:

   - **Unix/macOS:** `~/.config/nvim/`
   - **Windows:** `%APPDATA%\nvim\`

2. **Install the Plugin Manager (`lazy.nvim`):**

   The distro uses [lazy.nvim](https://github.com/folke/lazy.nvim) for managing plugins. The configuration file automatically clones the plugin manager into your Neovim data directory if it isn’t already installed.

3. **Launch Neovim:**

   Open Neovim and run `:Lazy` to see the plugin manager interface. Plugins will be installed automatically based on the configuration.

---

## Configuration Overview

The configuration file sets various options to enhance your editing experience. Here’s a brief overview:

- **Leader Keys:**
  - Global and local leader keys are set to **Space**.
- **User Interface:**
  - **True color support:** `vim.opt.termguicolors = true`
  - **Line numbers:** Both absolute (`number`) and relative (`relativenumber`)
  - **Cursorline:** Highlights the current line.
  - **Sign Column:** Always visible to avoid text shifting.
- **Clipboard:**
  - Uses the system clipboard via `unnamedplus`.
- **File Explorer:**
  - Disables the built-in `netrw` to avoid conflicts.
- **Indentation and Formatting:**
  - Sets a tab stop and shift width of 2 spaces.
  - Converts tabs to spaces.
  - Enables automatic indentation and break indentation.
- **Search and Navigation:**
  - Case-insensitive search with smart case override.
  - Incremental live preview for search and replace.
  - Scroll offset is set to keep 10 lines visible above and below the cursor.
- **Swap and Backup Files:**
  - Disables swap files and backups for a cleaner workspace.
- **Session Options:**
  - Configured to restore most aspects of the session (buffers, folds, window sizes, etc.)

---

## Keybindings

This configuration provides several custom keybindings to speed up common tasks.

### General File Operations

- **Save File:**
  - Normal Mode: `<C-s>` executes `:w`
  - Insert Mode: `<C-s>` leaves insert mode and writes the file.
  - Visual Mode: `<C-s>` writes the file and reselects the visual area.

### File Explorer Toggle

- **Toggle Netrw File Explorer:**

  - `<C-e>`: Opens `netrw` if not active; closes it if already open.

- **Toggle Neo-Tree File Explorer:**
  - `<C-g>`: Opens Neo-Tree in a floating window with the current file revealed.

### Navigation Between Splits and Tabs

- **Window Navigation:**

  - `<C-h>`: Move focus to the left split.
  - `<C-l>`: Move focus to the right split.
  - `<C-j>`: Move focus to the lower split.
  - `<C-k>`: Move focus to the upper split.

- **Tab Navigation:**
  - `<leader>tp`: Go to the previous tab.
  - `<leader>tn`: Go to the next tab.

### Diagnostic and Search

- **Diagnostic Navigation:**

  - `[d` and `]d`: Jump to the previous/next diagnostic message.
  - `<leader>e`: Show diagnostic messages in a floating window.
  - `<leader>q`: Open diagnostic quickfix list.
  - `<leader>d`: Toggle diagnostics on/off.

- **Search with Ripgrep:**

  - `<leader>ft`: Opens Ripgrep (using `:Rg!`) for full-text search.

- **Quickfix List:**
  - `<leader>qo`: Open Quickfix list.
  - `<leader>qc`: Close Quickfix list.
  - `<leader>qn` / `<leader>qp`: Navigate to the next or previous Quickfix entry.

### Terminal Mode

- **Exit Terminal Mode:**
  - In terminal mode, press `<Esc><Esc>` to exit to normal mode. (This simplifies the default `<C-\><C-n>` sequence.)

---

## Plugins and Plugin Manager

This distro uses [lazy.nvim](https://github.com/folke/lazy.nvim) as its plugin manager. The plugins are loaded from a dedicated folder (e.g., `plugins/`) and include features for:

- **Auto Pairs:** Automatic insertion of matching brackets and quotes.
- **Editing Enhancements:** Various tools to streamline text editing.
- **Git Integration:** Git tools and status indicators.
- **Linting:** Integration with linters to highlight issues.
- **LSP:** Language Server Protocol configurations for better code intelligence.
- **Search Tools:** Enhanced searching and filtering.
- **Tree-sitter:** Improved syntax highlighting and code parsing.
- **Autocomplete:** Code completion features.
- **File Explorer:** Integration with Neo-Tree.
- **Multicursor:** Support for multiple cursors and simultaneous editing.

When you start Neovim, `lazy.nvim` will load these modules as defined in the setup block:

```lua
require('lazy').setup({
  require('plugins.autopairs'),
  require('plugins.editing'),
  require('plugins.git'),
  require('plugins.lint'),
  require('plugins.lsp'),
  require('plugins.search'),
  require('plugins.treesister'),
  require('plugins.autocomplete'),
  require('plugins.nvimtree'),
  require('plugins.multicursor')
}, { ... })
```

Customize this list by editing or adding modules in the plugins folder.

---

## Custom Functions

### Send File to Another Computer

This distribution includes a custom Lua function that sends the current file to another computer via a Python script.

- **Keybinding:** `<leader>rp`
- **How It Works:**
  - The function retrieves the current file’s full path.
  - It calls a Python script (`~/dev/net/client.py`) with the IP address `192.168.100.6` and the file path as arguments.

Make sure that:

- The Python script exists at the specified path.
- The target computer is reachable over the network.
- You have Python3 installed.

The code snippet:

```lua
local function call_python_script_with_filepath()
  local filepath = vim.fn.expand('%:p') -- Get the full path of the current file
  local python_script = "~/dev/net/client.py"
  local command = string.format("python3 %s 192.168.100.6 %s", python_script, filepath)
  vim.fn.system(command)
end

vim.keymap.set('n', '<leader>rp', call_python_script_with_filepath, { noremap = true, silent = false })
```

---

## Autocommands

### Yank Highlighting

Whenever you yank (copy) text, an autocommand highlights the yanked text briefly:

```lua
vim.api.nvim_create_autocmd('TextYankPost', {
  desc = 'Highlight when yanking (copying) text',
  group = vim.api.nvim_create_augroup('kickstart-highlight-yank', { clear = true }),
  callback = function()
    vim.highlight.on_yank()
  end,
})
```

This visual cue helps confirm that the desired text was copied.

---

## Troubleshooting and Customization

- **Disabling Plugins:**  
  If a plugin causes issues, you can disable it by removing or commenting out its `require` statement in the `lazy.setup` configuration.

- **Modifying Keybindings:**  
  Most keybindings are set using `vim.keymap.set`. Change the key sequences or commands as needed by editing the mapping lines.

- **Changing Options:**  
  Adjust options (e.g., tabstop, shiftwidth, line numbers) by modifying the corresponding `vim.opt` settings.

- **Further Documentation:**  
  Use Neovim’s built-in help (e.g., `:help vim.opt`) for more details on each setting.

---

## Credits and Further Reading

- **Neovim:** [https://neovim.io/](https://neovim.io/)
- **lazy.nvim:** [https://github.com/folke/lazy.nvim](https://github.com/folke/lazy.nvim)
- **Nerd Fonts:** [https://www.nerdfonts.com/](https://www.nerdfonts.com/)
- **Lua for Neovim:** [:help lua-guide](https://neovim.io/doc/user/lua-guide.html)

This distro is designed to be a starting point. Feel free to customize and extend it to suit your workflow.

Happy coding!

---

_End of Documentation_

---

You now have a comprehensive guide to help you understand and use this Neovim distribution. Enjoy your enhanced editing experience!
