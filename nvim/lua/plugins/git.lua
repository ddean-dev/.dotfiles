return {
  {
    "lewis6991/gitsigns.nvim",
    config = function()
      require("gitsigns").setup({
        signcolumn                   = false,
        numhl                        = true,
        word_diff                    = false,
        current_line_blame           = true,
        current_line_blame_opts      = {
          virt_text_pos = 'right_align',
          ignore_whitespace = true,
        },
        current_line_blame_formatter = '<author>, <author_time:%Y-%m-%d> ',
        on_attach                    = function()
          -- Navigation
          vim.keymap.set('n', ']g', "<cmd>Gitsigns next_hunk<CR>", { desc = "Next git change" })
          vim.keymap.set('n', '[g', "<cmd>Gitsigns prev_hunk<CR>", { desc = "Prev git change" })
          vim.keymap.set('n', '<leader>gu', ':Gitsigns reset_hunk<CR>', { desc = "Undo Changes" })
          vim.keymap.set({ 'o', 'x' }, 'ig', ':<C-U>Gitsigns select_hunk<CR>', { desc = "Git changes" })
        end,
        diff_opts                    = {
          ignore_whitespace = true,
          algorithim = "histogram",
          internal = true,
        },
      })
    end
  },
}
