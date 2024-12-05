vim.g.mapleader = ' '             -- Sets the global leader key to space
vim.g.maplocalleader = ' '        -- Sets the local leader key to space
vim.g.have_nerd_font = true       -- Enables the use of Nerd Fonts for icons in the UI
vim.opt.termguicolors = true      -- Enables true color support in the terminal
vim.opt.number = true             -- Enables line numbers
vim.opt.relativenumber = true     -- Enables relative line numbers for easier navigation
vim.opt.mouse = ''                -- Enables mouse support in all modes
vim.opt.showmode = false          -- Disables showing the mode (useful when a statusline plugin is used)
vim.opt.clipboard = 'unnamedplus' -- Allows access to the system clipboard
-- vim.g.loaded_netrw = 1 -- Disables the default netrw file explorer
-- vim.g.loaded_netrwPlugin = 1 -- Disables the netrw plugin to avoid conflicts with other file explorers
vim.opt.tabstop = 2 -- Sets the number of spaces that a tab counts for
vim.opt.shiftwidth = 2 -- Sets the number of spaces used for indentation
vim.opt.expandtab = true -- Converts tabs to spaces
vim.opt.autoindent = true -- Maintains the indent level of the previous line
vim.opt.breakindent = true -- Wraps long lines while preserving indentation
vim.opt.undofile = true -- Enables persistent undo, allowing undos after closing files
vim.opt.ignorecase = true -- Ignores case in search patterns
vim.opt.smartcase = true -- Overrides `ignorecase` if the search pattern contains uppercase characters
vim.opt.signcolumn = 'yes' -- Always shows the sign column to avoid shifting text
vim.opt.updatetime = 250 -- Reduces the time for swap file updates and cursor hold
vim.opt.timeoutlen = 1000 -- Sets the time to wait for a mapped sequence to complete (in milliseconds)
vim.opt.splitright = true -- Opens vertical splits to the right of the current window
vim.opt.splitbelow = true -- Opens horizontal splits below the current window
vim.opt.list = true -- Shows hidden characters (like tabs and spaces)
vim.opt.listchars = { tab = '» ', trail = '·', nbsp = '␣' } -- Sets the symbols for tabs, trailing spaces, and non-breaking spaces
vim.opt.inccommand = 'split' -- Shows incremental live preview of search and replace in a split
vim.opt.cursorline = true -- Highlights the current line for better visibility
vim.opt.scrolloff = 10 -- Keeps 10 lines of context above and below the cursor while scrolling

vim.opt.swapfile = false -- Disables the use of swap files
vim.opt.backup = false -- Disables the use of backup files
vim.o.sessionoptions = "blank,buffers,curdir,folds,help,tabpages,winsize,winpos,terminal,localoptions"

-- Mapeamento para salvar com Ctrl + S no modo normal
vim.keymap.set('n', '<C-s>', ':w<CR>', { noremap = true, silent = true })

-- Mapeamento para salvar com Ctrl + S no modo de inserção
vim.keymap.set("i", "<C-s>", "<Esc>:w<CR>", { noremap = true, silent = true })

-- Mapeamento para salvar com Ctrl + S no modo visual
vim.keymap.set('v', '<C-s>', '<Esc>:w<CR>gv', { noremap = true, silent = true })


--open netrw
vim.keymap.set("n", "<C-e>", function()
  if vim.bo.filetype == "netrw" then
    vim.cmd("bd")      -- Fecha o netrw se estiver aberto
  else
    vim.cmd("Explore") -- Abre o netrw se não estiver aberto
  end
end, { desc = "Toggle File Explorer" })


-- Set highlight on search, but clear on pressing <Esc> in normal mode
vim.opt.hlsearch = true
vim.keymap.set('n', '<Esc>', '<cmd>nohlsearch<CR>')

-- -- NOTE: nvim tree keybind
-- vim.keymap.set('n', '<C-g>', ':NvimTreeToggle<CR>', { desc = 'Toggle NvimTree' })

-- NOTE: Neo-Tree keybind
vim.keymap.set('n', '<C-g>', ':Neotree float filesystem reveal=true<CR>',
  { desc = 'Toggle Neo-Tree in float and reveal buffer' })

-- Diagnostic keymapsneo tree
vim.keymap.set('n', '[d', vim.diagnostic.goto_prev, { desc = 'Go to previous [D]iagnostic message' })
vim.keymap.set('n', ']d', vim.diagnostic.goto_next, { desc = 'Go to next [D]iagnostic message' })
vim.keymap.set('n', '<leader>e', vim.diagnostic.open_float, { desc = 'Show diagnostic [E]rror messages' })
vim.keymap.set('n', '<leader>q', vim.diagnostic.setloclist, { desc = 'Open diagnostic [Q]uickfix list' })

-- Exit terminal mode in the builtin terminal with a shortcut that is a bit easier
-- for people to discover. Otherwise, you normally need to press <C-\><C-n>, which
-- is not what someone will guess without a bit more experience.
--
-- NOTE: This won't work in all terminal emulators/tmux/etc. Try your own mapping
-- or just use <C-\><C-n> to exit terminal mode
vim.keymap.set('t', '<Esc><Esc>', '<C-\\><C-n>', { desc = 'Exit terminal mode' })

-- TIP: Disable arrow keys in normal mode
-- vim.keymap.set('n', '<left>', '<cmd>echo "Use h to move!!"<CR>')
-- vim.keymap.set('n', '<right>', '<cmd>echo "Use l to move!!"<CR>')
-- vim.keymap.set('n', '<up>', '<cmd>echo "Use k to move!!"<CR>')
-- vim.keymap.set('n', '<down>', '<cmd>echo "Use j to move!!"<CR>')

-- Keybinds to make split navigation easier.
--  Use CTRL+<hjkl> to switch between windows
--
--  See `:help wincmd` for a list of all window commands
vim.keymap.set('n', '<C-h>', '<C-w><C-h>', { desc = 'Move focus to the left window' })
vim.keymap.set('n', '<C-l>', '<C-w><C-l>', { desc = 'Move focus to the right window' })
vim.keymap.set('n', '<C-j>', '<C-w><C-j>', { desc = 'Move focus to the lower window' })
vim.keymap.set('n', '<C-k>', '<C-w><C-k>', { desc = 'Move focus to the upper window' })


-- Ir para a aba anterior e próxima
vim.keymap.set('n', '<leader>tp', ':tabprevious<CR>', { desc = 'Go to previous tab' })
vim.keymap.set('n', '<leader>tn', ':tabnext<CR>', { desc = 'Go to next tab' })

--fzf
vim.keymap.set('n', '<leader>ff', ':Files<CR>', { silent = true })
vim.keymap.set('n', '<leader>fg', ':Files<CR>', { silent = true })
vim.keymap.set('n', '<leader>fb', ':Buffer<CR>', { silent = true })

--ripgrep
vim.keymap.set('n', '<leader>ft', ':Rg!', { silent = true })

--quickfix
vim.keymap.set('n', '<leader>qo', ':copen<CR>', { desc = 'Open Quickfix' })
vim.keymap.set('n', '<leader>qc', ':cclose<CR>', { desc = 'Close Quickfix' })
vim.keymap.set('n', '<leader>qn', ':cnext<CR>', { desc = 'Next Quickfix Entry' })
vim.keymap.set('n', '<leader>qp', ':cprex<CR>', { desc = 'Previous Quickfix Entry' })
--make a shortcut to clear the quickfix

-- Send file to my other computer
local function call_python_script_with_filepath()
  local filepath = vim.fn.expand('%:p') -- Get the full path of the current file
  local python_script = "~/dev/net/client.py"
  local command = string.format("python3 %s 192.168.100.6 %s", python_script, filepath)
  vim.fn.system(command)
end

vim.keymap.set('n', '<leader>rp', call_python_script_with_filepath, { noremap = true, silent = false })


-- [[ Basic Autocommands ]]
--  See `:help lua-guide-autocommands`

-- Highlight when yanking (copying) text
--  Try it with `yap` in normal mode
--  See `:help vim.highlight.on_yank()`
vim.api.nvim_create_autocmd('TextYankPost', {
  desc = 'Highlight when yanking (copying) text',
  group = vim.api.nvim_create_augroup('kickstart-highlight-yank', { clear = true }),
  callback = function()
    vim.highlight.on_yank()
  end,
})

-- Enable/disable diagnostics
vim.keymap.set('n', '<leader>d', function()
  local current_value = vim.diagnostic.is_disabled(0)
  if current_value then
    vim.diagnostic.enable(0)
    print("Diagnostics enabled")
  else
    vim.diagnostic.disable(0)
    print("Diagnostics disabled")
  end
end)




-- [[ Install `lazy.nvim` plugin manager ]]
--    See `:help lazy.nvim.txt` or https://github.com/folke/lazy.nvim for more info
local lazypath = vim.fn.stdpath 'data' .. '/lazy/lazy.nvim'
if not vim.loop.fs_stat(lazypath) then
  local lazyrepo = 'https://github.com/folke/lazy.nvim.git'
  vim.fn.system { 'git', 'clone', '--filter=blob:none', '--branch=stable', lazyrepo, lazypath }
end ---@diagnostic disable-next-line: undefined-field
vim.opt.rtp:prepend(lazypath)





-- I like to call the plugins one by one too help in debugging
require('lazy').setup({
  require('plugins.autopairs'),
  require('plugins.editing'),
  require('plugins.git'),
  require('plugins.lint'),
  require('plugins.lsp'),
  require('plugins.search'),
  require('plugins.treesister'),
  require('plugins.session'),
  require('plugins.autocomplete')
}, {
  ui = {
    -- Se você estiver usando uma Nerd Font, defina icons como uma tabela vazia para usar os ícones padrão
    icons = vim.g.have_nerd_font and {} or {
      cmd = '⌘',
      config = '🛠',
      event = '📅',
      ft = '📂',
      init = '⚙',
      keys = '🗝',
      plugin = '🔌',
      runtime = '💻',
      require = '🌙',
      source = '📄',
      start = '🚀',
      task = '📌',
      lazy = '💤 ',
    },
  },
})


-- The line beneath this is called `modeline`. See `:help modeline`
-- vim: ts=2 sts=2 sw=2 et
