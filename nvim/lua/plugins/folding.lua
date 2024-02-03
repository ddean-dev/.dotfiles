return {
  {
    "lukas-reineke/indent-blankline.nvim",
    config = function()
      require("ibl").setup({
        indent = {
          highlight = {
            "RainbowBlue",
            "RainbowCyan",
            "RainbowGreen",
            "RainbowYellow",
            "RainbowRed",
            "RainbowMagenta",
          },
        },
      })
    end,
  },
  {
    'kevinhwang91/nvim-ufo',
    dependencies = 'kevinhwang91/promise-async',
    config = function()
      vim.keymap.set("n", "zM", require('ufo').openAllFolds, { desc = "Open all folds" })
      vim.keymap.set("n", "zR", require('ufo').openAllFolds, { desc = "Close all folds" })
      require('ufo').setup({
        provider_selector = function(bufnr, filetype, buftype)
          return { 'treesitter', 'indent' }
        end
      })
    end,
  },
}
