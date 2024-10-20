vim.g.mapleader = ' ' -- Sets the global leader key to space
vim.g.maplocalleader = ' ' -- Sets the local leader key to space
vim.g.have_nerd_font = true -- Enables the use of Nerd Fonts for icons in the UI
vim.opt.termguicolors = true -- Enables true color support in the terminal
vim.opt.number = true -- Enables line numbers
vim.opt.relativenumber = true -- Enables relative line numbers for easier navigation
vim.opt.mouse = 'a' -- Enables mouse support in all modes
vim.opt.showmode = false -- Disables showing the mode (useful when a statusline plugin is used)
vim.opt.clipboard = 'unnamedplus' -- Allows access to the system clipboard
vim.g.loaded_netrw = 1 -- Disables the default netrw file explorer
vim.g.loaded_netrwPlugin = 1 -- Disables the netrw plugin to avoid conflicts with other file explorers
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
vim.opt.timeoutlen = 300 -- Sets the time to wait for a mapped sequence to complete (in milliseconds)
vim.opt.splitright = true -- Opens vertical splits to the right of the current window
vim.opt.splitbelow = true -- Opens horizontal splits below the current window
vim.opt.list = true -- Shows hidden characters (like tabs and spaces)
vim.opt.listchars = { tab = '» ', trail = '·', nbsp = '␣' } -- Sets the symbols for tabs, trailing spaces, and non-breaking spaces
vim.opt.inccommand = 'split' -- Shows incremental live preview of search and replace in a split
vim.opt.cursorline = true -- Highlights the current line for better visibility
vim.opt.scrolloff = 10 -- Keeps 10 lines of context above and below the cursor while scrolling

vim.o.sessionoptions="blank,buffers,curdir,folds,help,tabpages,winsize,winpos,terminal,localoptions"

-- Mapeamento para salvar com Ctrl + S no modo normal
vim.keymap.set('n', '<C-s>', ':w<CR>', { noremap = true, silent = true })

-- Mapeamento para salvar com Ctrl + S no modo de inserção
vim.keymap.set('i', '<C-s>', '<Esc>:w<CR>a', { noremap = true, silent = true })

-- Mapeamento para salvar com Ctrl + S no modo visual
vim.keymap.set('v', '<C-s>', '<Esc>:w<CR>gv', { noremap = true, silent = true })


-- Set highlight on search, but clear on pressing <Esc> in normal mode
vim.opt.hlsearch = true
vim.keymap.set('n', '<Esc>', '<cmd>nohlsearch<CR>')

-- -- NOTE: nvim tree keybind
-- vim.keymap.set('n', '<C-g>', ':NvimTreeToggle<CR>', { desc = 'Toggle NvimTree' })

-- NOTE: Neo-Tree keybind
vim.keymap.set('n', '<C-g>', ':Neotree float filesystem reveal=true<CR>', { desc = 'Toggle Neo-Tree in float and reveal buffer' })

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



function OpenNotes()
  -- Primeiro, abra o arquivo desejado
  vim.cmd('edit C:\\Users\\henri\\dev\\anotacoes')  -- Certifique-se de que este caminho aponta para um arquivo existente
  local buf = vim.api.nvim_get_current_buf()
  
  -- Configure as dimensões da janela flutuante
  local width = math.floor(vim.o.columns * 0.8)
  local height = math.floor(vim.o.lines * 0.8)
  local opts = {
    style = 'minimal',
    relative = 'editor',
    width = width,
    height = height,
    row = math.floor((vim.o.lines - height) / 2),
    col = math.floor((vim.o.columns - width) / 2),
    border = 'rounded'
  }
  
  -- Abra a janela flutuante com o buffer do arquivo
  vim.api.nvim_open_win(buf, true, opts)
end


-- Mapear a função para um atalho
vim.api.nvim_set_keymap('n', '<F5>', ':lua OpenNotes()<CR>', { noremap = true, silent = true })



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
  require('plugins.file-explorer'),
  require('plugins.autocomplete'),
  require('plugins.git'),
  require('plugins.lint'),
  require('plugins.lsp'),
  require('plugins.search'),
  require('plugins.treesister'),
  require('plugins.ui'),
  require('plugins.session'),
  require('plugins.navigation')
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
