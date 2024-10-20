return {
  --theme
  {
    "wurli/cobalt.nvim",
    config = function()
        vim.cmd[[colorscheme cobalt]]
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
  
  