return {
  {
    "lewis6991/gitsigns.nvim",
    config = function()
      require("gitsigns").setup({
        signcolumn              = false,
        numhl                   = true,
        current_line_blame      = true,
        current_line_blame_opts = {
          virt_text_pos = 'right_align',
          ignore_whitespace = true,
        },
        on_attach               = function()
          -- Navigation
          vim.keymap.set('n', ']g', "<cmd>Gitsigns next_hunk<CR>", { desc = "Next git change" })
          vim.keymap.set('n', '[g', "<cmd>Gitsigns prev_hunk<CR>", { desc = "Prev git change" })
          vim.keymap.set('n', '<leader>U', ':Gitsigns reset_hunk<CR>', { desc = "Undo Changes" })
          vim.keymap.set({ 'o', 'x' }, 'ig', ':<C-U>Gitsigns select_hunk<CR>', { desc = "Git changes" })
        end,
      })
    end
  },
}
