return {
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
      { 'K',         vim.lsp.buf.hover,          desc = "Hover" },
      { '<C-K>',     vim.lsp.buf.signature_help, desc = "Signature Help", mode = { "n", "i" } },
      { '<C-Enter>', vim.lsp.buf.code_action,    desc = "Code Action",    mode = { "n", "i" } },
      { '<leader>r', vim.lsp.buf.rename,         desc = "Rename" },
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
}
