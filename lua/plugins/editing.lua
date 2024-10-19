return {
    {
      -- Plugin para comentar linhas e blocos de código
      'numToStr/Comment.nvim',
      event = 'BufReadPre',
      dependencies = {
        'JoosepAlviste/nvim-ts-context-commentstring',
        'nvim-treesitter/nvim-treesitter',
      },
      config = function()
        local prehook = require('ts_context_commentstring.integrations.comment_nvim').create_pre_hook()
        require('Comment').setup {
          padding = true,
          sticky = true,
          ignore = '^$',
          toggler = {
            line = 'gcc',
            block = 'gbc',
          },
          opleader = {
            line = 'gc',
            block = 'gb',
          },
          extra = {
            above = 'gcO',
            below = 'gco',
            eol = 'gcA',
          },
          mappings = {
            basic = true,
            extra = true,
            extended = false,
          },
          pre_hook = prehook,
          post_hook = prehook,
        }
      end,
    },
    {
      -- Plugin para destacar comentários TODO, FIX, etc.
      'folke/todo-comments.nvim',
      event = 'VimEnter',
      dependencies = { 'nvim-lua/plenary.nvim' },
      opts = { signs = false },
    },
    {
      -- Plugin para manipular estruturas de código (unir e dividir)
      'Wansmer/treesj',
      keys = { '<space>m', '<space>j', '<space>s' },
      dependencies = { 'nvim-treesitter/nvim-treesitter' },
      config = function()
        require('treesj').setup {}
      end,
    },
    {
      -- Plugin para formatação automática
      'stevearc/conform.nvim',
      lazy = false,
      keys = {
        {
          '<leader>f',
          function()
            require('conform').format { async = true, lsp_fallback = true }
          end,
          mode = '',
          desc = '[F]ormat buffer',
        },
      },
      opts = {
        notify_on_error = false,
        format_on_save = function(bufnr)
          local disable_filetypes = { c = true, cpp = true, javascript = false }
          return {
            timeout_ms = 500,
            lsp_fallback = not disable_filetypes[vim.bo[bufnr].filetype],
          }
        end,
        formatters_by_ft = {
          lua = { 'stylua' },
          javascript = { { 'prettierd' } },
        },
      },
    },
  }
  