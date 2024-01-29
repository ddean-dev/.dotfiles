return {
  {
    "folke/noice.nvim",
    event = "VeryLazy",
    opts = {},
    dependencies = {"MunifTanjim/nui.nvim", "rcarriga/nvim-notify"},
  },
  {
    'nvim-lualine/lualine.nvim',
    dependencies = { 'nvim-tree/nvim-web-devicons' },
    init = function ()
      require('lualine').setup() 
    end,
  },
  {
    "folke/which-key.nvim",
    event = "VeryLazy",
    init = function()
      vim.o.timeout = true
      vim.o.timeoutlen = 300
    end,
    opts = {},
  },
}
