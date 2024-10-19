return {
  {
    'nvim-telescope/telescope.nvim',
    event = 'VimEnter',
    dependencies = {
      'nvim-lua/plenary.nvim',
      {
        'nvim-telescope/telescope-fzf-native.nvim',
        build = 'make',
        cond = function()
          return vim.fn.executable 'make' == 1
        end,
      },
      'nvim-telescope/telescope-ui-select.nvim',
      { 'nvim-tree/nvim-web-devicons' },
    },
    config = function()
      local telescope = require('telescope')
      local actions = require('telescope.actions')

      telescope.setup{
        defaults = {
          prompt_prefix = '🔍 ',
          selection_caret = ' ',
          path_display = { 'smart' },
          mappings = {
            i = {
              ['<C-j>'] = actions.move_selection_next,
              ['<C-k>'] = actions.move_selection_previous,
              ['<esc>'] = actions.close,
            },
          },
        },
        pickers = {
          find_files = {
            hidden = true,
          },
        },
        extensions = {
          fzf = {
            fuzzy = true,
            override_generic_sorter = true,
            override_file_sorter = true,
            case_mode = 'smart_case',
          },
        },
      }

      -- Load extensions
      telescope.load_extension('fzf')
      telescope.load_extension('ui-select')

      -- Key mappings
      local keymap = vim.keymap.set
      local opts = { noremap = true, silent = true, desc = '' }

      -- General pickers
      keymap('n', '<leader>ff', '<cmd>Telescope find_files<cr>', { desc = 'Find Files' })
      keymap('n', '<leader>fg', '<cmd>Telescope live_grep<cr>', { desc = 'Live Grep' })
      keymap('n', '<leader>fb', '<cmd>Telescope buffers<cr>', { desc = 'Buffers' })
      keymap('n', '<leader>fh', '<cmd>Telescope help_tags<cr>', { desc = 'Help Tags' })
      keymap('n', '<leader>fo', '<cmd>Telescope oldfiles<cr>', { desc = 'Recent Files' })
      keymap('n', '<leader>fc', '<cmd>Telescope commands<cr>', { desc = 'Commands' })
      keymap('n', '<leader>fm', '<cmd>Telescope marks<cr>', { desc = 'Marks' })
      keymap('n', '<leader>fr', '<cmd>Telescope registers<cr>', { desc = 'Registers' })
      keymap('n', '<leader>fk', '<cmd>Telescope keymaps<cr>', { desc = 'Keymaps' })
      keymap('n', '<leader>ft', '<cmd>Telescope filetypes<cr>', { desc = 'File Types' })
      keymap('n', '<leader>fs', '<cmd>Telescope spell_suggest<cr>', { desc = 'Spell Suggest' })
      keymap('n', '<leader>f/', '<cmd>Telescope current_buffer_fuzzy_find<cr>', { desc = 'Search in Buffer' })


      -- LSP pickers
      keymap('n', 'gd', '<cmd>Telescope lsp_definitions<cr>', { desc = 'LSP Definitions' })
      keymap('n', 'gi', '<cmd>Telescope lsp_implementations<cr>', { desc = 'LSP Implementations' })
      keymap('n', '<leader>ls', '<cmd>Telescope lsp_document_symbols<cr>', { desc = 'Document Symbols' })
      keymap('n', '<leader>ld', '<cmd>Telescope diagnostics bufnr=0<cr>', { desc = 'Document Diagnostics' })

    end,
  },
}
