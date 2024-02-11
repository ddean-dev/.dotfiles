return {
  {
    "nvim-treesitter/nvim-treesitter",
    build = ":TSUpdate",
    config = function()
      ---@diagnostic disable-next-line: missing-fields
      require("nvim-treesitter.configs").setup({
        auto_install = true,
        highlight = { enable = true },
        indent = { enable = true },
        incremental_selection = { enable = true },
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
      { '<leader>q', vim.lsp.buf.code_action, desc = "Quick Action" },
      { '<leader>r', vim.lsp.buf.rename,      desc = "Rename" },
      { 'K',         vim.lsp.buf.hover,       desc = "Hover" },
    },
  },
  {
    "williamboman/mason-lspconfig.nvim",
    config = function()
      local lsp = require("mason-lspconfig")
      lsp.setup()
      require("mason-lspconfig").setup_handlers {
        function(server_name)
          require("lspconfig")[server_name].setup({})
        end,
      }
    end,
  },
  {
    "nvim-treesitter/nvim-treesitter-textobjects",
    dependencies = { "nvim-treesitter/nvim-treesitter" },
    config = function()
      ---@diagnostic disable-next-line: missing-fields
      require('nvim-treesitter.configs').setup({
        textobjects = {
          select = {
            enable = true,
            keymaps = {
              ["af"] = { query = "@function.outer", desc = "function" },
              ["if"] = { query = "@function.inner", desc = "function" },
              ["ac"] = { query = "@class.outer", desc = "class" },
              ["ic"] = { query = "@class.inner", desc = "class" },
              ["ab"] = { query = "@block.outer", desc = "block" },
              ["ib"] = { query = "@block.inner", desc = "block" },
              ["al"] = { query = "@loop.outer", desc = "loop" },
              ["il"] = { query = "@loop.inner", desc = "loop" },
            }
          },
          swap = { enable = true },
          move = {
            enable = true,
            goto_next = {
              ["]f"] = { query = "@function.outer", desc = "Next function" },
              ["]c"] = { query = "@class.outer", desc = "Next class" },
              ["]b"] = { query = "@block.outer", desc = "Next block" },
              ["]s"] = { query = "@statement.outer", desc = "next statement" },
            },
            goto_previous = {
              ["[f"] = { query = "@function.outer", desc = "Previous function" },
              ["[c"] = { query = "@class.outer", desc = "Previous class" },
              ["[b"] = { query = "@block.outer", desc = "Previous block" },
              ["[s"] = { query = "@statement.outer", desc = "Previous statement" },
            }
          },
          lsp_interop = { enable = true },
        },
      })
    end
  },
  {
    "nvim-treesitter/nvim-treesitter-context",
    config = function()
      require('treesitter-context').setup({
        enable = true,
        separator = "·",
        max_lines = 3,
        trim_scope = 'outer',
      })
    end
  }
}
