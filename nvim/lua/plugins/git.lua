return {
  {
    "lewis6991/gitsigns.nvim",
    opts = {
      signcolumn              = true,
      numhl                   = true,
      current_line_blame      = true,
      current_line_blame_opts = {
        virt_text_pos = 'right_align',
        ignore_whitespace = true,
      },
    },
    config = function(_, opts) require("gitsigns").setup(opts) end
  },
}
