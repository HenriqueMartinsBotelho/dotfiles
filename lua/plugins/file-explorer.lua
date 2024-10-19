return {
    {
      -- Plugin para explorar arquivos com janela flutuante
      'nvim-neo-tree/neo-tree.nvim',
      branch = 'v3.x',
      dependencies = {
        'nvim-lua/plenary.nvim',
        'nvim-tree/nvim-web-devicons',
        'MunifTanjim/nui.nvim',
      },
      config = function()
        require('neo-tree').setup {
          window = {
            position = 'float',
            popup = {
              size = {
                height = '80%',
                width = '40%',
              },
              border = 'rounded',
              position = {
                row = 1,
                col = 1,
              },
              offset = {
                row = 0,
                col = 2,
              },
            },
          },
          filesystem = {
            follow_current_file = {
              enabled = true,
            },
            hijack_netrw_behavior = 'open_default',
            use_libuv_file_watcher = true,
            filtered_items = {
              hide_dotfiles = false,
            },
          },
          buffers = {
            follow_current_file = {
              enabled = true,
            },
          },
        }
      end,
    },
  }
  