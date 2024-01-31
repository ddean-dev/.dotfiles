return {
  {
    "folke/tokyonight.nvim",
    lazy = true,
    opts = { style = "moon" },
    init = function()
      vim.cmd [[colorscheme tokyonight]]
    end,
  },
  { "lukas-reineke/indent-blankline.nvim", main = "ibl", opts = {} },
  {
    "norcalli/nvim-colorizer.lua",
    config = function() require("colorizer").setup() end,
  },
}
