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
      })
    end
  },
}
