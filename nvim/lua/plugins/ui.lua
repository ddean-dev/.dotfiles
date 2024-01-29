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
    opts = {
      plugins = {spelling = true},
      defaults = {
        mode = { "n", "v" },
        ["<leader>q"] = { name = "+quit" },
        ["<leader>w"] = { name = "+windows" },
--        ["g"] = { name = "+goto" },
--        ["gs"] = { name = "+surround" },
--        ["]"] = { name = "+next" },
--        ["["] = { name = "+prev" },
--        ["<leader><tab>"] = { name = "+tabs" },
--        ["<leader>b"] = { name = "+buffer" },
--        ["<leader>c"] = { name = "+code" },
--        ["<leader>g"] = { name = "+git" },
--        ["<leader>gh"] = { name = "+hunks" },
--        ["<leader>s"] = { name = "+search" },
--        ["<leader>u"] = { name = "+ui" },
--        ["<leader>x"] = { name = "+diagnostics/quickfix"},
      },
    },
    config = function(_, opts)
      local wk = require("which-key")
      wk.setup(opts)
      wk.register(opts.defaults)
    end,
  },
}
