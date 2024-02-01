return {
  {
    "folke/noice.nvim",
    event = "VeryLazy",
    opts = {},
    dependencies = { "MunifTanjim/nui.nvim" },
  },
  {
    "vigoux/notifier.nvim",
    config = function()
      require('notifier').setup({
        notify = {
          clear_time = 5000,         -- Time in milliseconds before removing a vim.notify notification, 0 to make them sticky
          min_level = vim.log.levels.INFO, -- Minimum log level to print the notification
        },
      })
    end,
  },
  --  {
  --    "rcarriga/nvim-notify",
  --    dependencies = { 'nvim-telescope/telescope.nvim' },
  --    keys = {
  --      { "<leader>n", "<cmd>Telescope notify<cr>", desc = "Notifications" },
  --    }
  --  },
  {
    'nvim-lualine/lualine.nvim',
    dependencies = { 'nvim-tree/nvim-web-devicons' },
    config = function() require('lualine').setup() end,
  },
  {
    "folke/which-key.nvim",
    event = "VeryLazy",
    init = function()
      vim.o.timeout = true
      vim.o.timeoutlen = 300
    end,
    opts = {
      plugins = { spelling = true },
      defaults = {
        mode = { "n", "v" },
        ["<leader>q"] = { name = "Quit" },
        ["<leader>w"] = { name = "+windows" },
      },
    },
    config = function(_, opts)
      local wk = require("which-key")
      wk.setup(opts)
      wk.register(opts.defaults)
    end,
  },
}
