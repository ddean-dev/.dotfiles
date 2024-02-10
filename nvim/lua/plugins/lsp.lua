return {
  {
    "nvim-treesitter/nvim-treesitter",
    build = ":TSUpdate",
    config = function()
      ---@diagnostic disable-next-line: missing-fields
      require 'nvim-treesitter.configs'.setup({
        auto_install = true,
      })
    end,
  },
  {
    "williamboman/mason.nvim",
    config = function()
      require("mason").setup({
        ui = {
          border = "rounded"
        },
      })
    end,
  },
  {
    "folke/neodev.nvim",
    config = function()
      require("neodev").setup({
        override = function(root_dir, library)
          if root_dir:find("/.dotfiles", 1, true) == 1 then
            library.enabled = true
            library.plugins = true
          end
        end,
      })
    end,
  },
  {
    "neovim/nvim-lspconfig",
    dependencies = { "folke/neodev.nvim" },
    keys = {
      { '<leader>q',  vim.lsp.buf.code_action, desc = "Quick Action" },
      { '<leader>cr', vim.lsp.buf.rename,      desc = "Rename" },
      { 'K',          vim.lsp.buf.hover,       desc = "Hover" }
    },
  },
  {
    "williamboman/mason-lspconfig.nvim",
    config = function()
      local lsp = require("mason-lspconfig")
      lsp.setup()
      require("mason-lspconfig").setup_handlers {
        function(server_name)
          require("lspconfig")[server_name].setup {}
        end,
      }
    end,
  },
  {
    "nvim-treesitter/nvim-treesitter-textobjects",
    dependencies = { "nvim-treesitter/nvim-treesitter" },
    opts = {},
    config = function(_, opts)
      require('nvim-treesitter.configs').setup(opts)
    end
  },
}
