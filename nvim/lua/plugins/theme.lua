return {
  {
    "folke/tokyonight.nvim",
    lazy = true,
    opts = { style = "moon", transparent = true },
    init = function()
      vim.cmd[[colorscheme tokyonight]]
    end,
  },
}
