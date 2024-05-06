return {
  'stevearc/conform.nvim',
  config = function()
    vim.keymap.set({ "i", "x", "n", "s" }, "<M-s>", "<cmd>up<cr><esc>", { desc = "Save file" })
    vim.keymap.set({ "i", "x", "n", "s" }, "<C-s>", function()
      vim.cmd.stopinsert()
      require("conform").format({
        lsp_fallback = true,
        timeout_ms = 500,
      })
      vim.cmd.wall()
    end, { desc = "Save file" })
  end
}
