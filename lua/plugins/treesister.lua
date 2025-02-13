return {
    {
      -- Plugin para destaque de sintaxe avançado
      'nvim-treesitter/nvim-treesitter',
      build = ':TSUpdate',
      opts = {
        ensure_installed = {
          'bash',
          'c',
          'diff',
          'html',
          'lua',
          'luadoc',
          'markdown',
          'vim',
          'vimdoc',
          'json',
        },
        auto_install = true,
        highlight = {
          enable = true,
          additional_vim_regex_highlighting = { 'ruby' },
        },
        indent = { enable = true, disable = { 'ruby' } },
      },
      config = function(_, opts)
        require('nvim-treesitter.install').prefer_git = true
        require('nvim-treesitter.configs').setup(opts)
      end,
    },
  }
  