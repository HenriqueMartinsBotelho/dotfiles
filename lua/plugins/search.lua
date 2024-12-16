return {
  "nvim-telescope/telescope.nvim",
  dependencies = { "nvim-lua/plenary.nvim" },
  config = function()
    local actions = require("telescope.actions")

    require("telescope").setup({
      defaults = {
        prompt_prefix = " ",
        selection_caret = " ",
        sorting_strategy = "ascending",
        layout_config = {
          horizontal = { preview_width = 0.5 },
        },
        mappings = {
          i = {
            -- Move through results with <C-j> / <C-k>
            ["<C-j>"] = actions.move_selection_next,
            ["<C-k>"] = actions.move_selection_previous,
            -- Close on <C-c>
            ["<C-c>"] = actions.close,

            -- Send the selected entry (or all selected entries if in multi-select mode)
            -- to the quickfix list, then open the quickfix list.
            ["<C-q>"] = function(prompt_bufnr)
              actions.smart_send_to_qflist(prompt_bufnr)
              actions.open_qflist(prompt_bufnr)
            end,
          },
          n = {
            ["<C-q>"] = function(prompt_bufnr)
              actions.smart_send_to_qflist(prompt_bufnr)
              actions.open_qflist(prompt_bufnr)
            end,
          },
        },
      },
      pickers = {
        quickfix = {
          theme = "ivy",
          layout_config = { height = 15 },
        },
      },
    })

    -- Telescope built-in pickers
    local builtin = require("telescope.builtin")

    -- Keymaps for quickfix related functionality
    vim.keymap.set("n", "<leader>qf", builtin.quickfix, { desc = "Telescope Quickfix List" })
    vim.keymap.set("n", "<leader>qh", builtin.quickfixhistory, { desc = "Telescope Quickfix History" })

    -- Optional: Keymaps for searching files, grep, etc.
    vim.keymap.set("n", "<leader>ff", builtin.find_files, { desc = "Find files" })
    vim.keymap.set("n", "<leader>fg", builtin.live_grep, { desc = "Live grep" })
    vim.keymap.set("n", "<leader>fb", builtin.buffers, { desc = "Find buffers" })
    vim.keymap.set("n", "<leader>fh", builtin.help_tags, { desc = "Help tags" })
  end,
}
