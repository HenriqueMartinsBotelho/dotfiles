return {
  --theme
  {
    "edmondburnett/leeward.nvim",
    lazy = false,
    priority = 1000,
    opts = {
        theme = "dark",
    },
    config = function()
        require("leeward").setup()
        require("leeward").load()
    end
},
      -- messages, cmdline and the popupmenu    
    
      -- statusline
      {
        "nvim-lualine/lualine.nvim",
        config = function()
          require('lualine').setup {
            options = {
              theme = 'catppuccin',
              component_separators = '|',
              section_separators = '',
            },
            sections = {
              lualine_b = {'branch', 'diff'},
              lualine_c = {'filename'},
              lualine_x = {'encoding', 'fileformat', 'filetype'},
            },
          }
        end,
      },  
    }
  
  