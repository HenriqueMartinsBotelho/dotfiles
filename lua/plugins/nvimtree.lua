return {
  'nvim-tree/nvim-tree.lua',
  config = function()
    local api = require "nvim-tree.api"
    require("nvim-tree").setup({
      filters = {
        dotfiles = false,
        git_clean = false,
        no_buffer = false,
        custom = { 'node_modules' },
      }
    })

    vim.keymap.set('n', '<leader>t', function()
      api.tree.toggle({ path = "<args>", find_file = true, update_root = false, focus = true, })
    end, { desc = 'Nvim [T]ree toggle' })
  end
}
