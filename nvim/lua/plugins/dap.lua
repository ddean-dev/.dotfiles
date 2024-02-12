return {
  {
    "mfussenegger/nvim-dap",
    keys = {
      { '<Leader>b', function() require('dap').toggle_breakpoint() end, desc = "Breakpoint" },
      { '<F5>',      function() require('dap').continue() end,          desc = "Continue" },
      { '<F10>',     function() require('dap').step_over() end,         desc = "Step Over" },
      { '<F11>',     function() require('dap').step_into() end,         desc = "Step Into" },
      { '<F12>',     function() require('dap').step_out() end,          desc = "Step Out" },
    },
    config = function()
      vim.fn.sign_define('DapBreakpoint', { text = '', texthl = 'DapBreakpoint' })
    end
  },
  {
    "jay-babu/mason-nvim-dap.nvim",
    dependencies = {
      "williamboman/mason.nvim",
      "mfussenegger/nvim-dap",
    },
    config = function()
      require("mason-nvim-dap").setup({
        ensure_installed = {},
        automatic_installation = true,
        handlers = {},
      })
    end
  },
  {
    "theHamsta/nvim-dap-virtual-text",
    config = function()
      require("nvim-dap-virtual-text").setup({})
    end
  },
  {
    "nvim-telescope/telescope-dap.nvim",
    dependencies = "nvim-telescope/telescope.nvim",
    keys = {
      { "<leader>B", "<cmd>Telescope dap list_breakpoints<cr>", desc = "Breakpoints", }
    },
    config = function()
      require('telescope').load_extension('dap')
    end
  },
}
