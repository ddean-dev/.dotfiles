return {
  { "nvim-treesitter/nvim-treesitter", build = ":TSUpdate" },
  {
    "williamboman/mason.nvim",
    opts = {
      ui = {
        border = "single"
      },
    },
    config = function(_, opts) require("mason").setup(opts) end,
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
    config = function()
      vim.api.nvim_create_autocmd('LspAttach', {
        callback = function()
          vim.keymap.set('n', 'gD', vim.lsp.buf.declaration, { desc = "Go to Declaration" })
          vim.keymap.set('n', 'gd', vim.lsp.buf.definition, { desc = "Go to Definition" })
          vim.keymap.set('n', 'K', vim.lsp.buf.hover, { desc = "Hover" })
          vim.keymap.set('n', 'gi', vim.lsp.buf.implementation, { desc = "Go to Implementation" })
        end
      })
    end
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
}
