return {
  {
    "mfussenegger/nvim-lint",
    dependencies = { "williamboman/mason.nvim" },
    config = function()
      vim.api.nvim_create_autocmd({ "TextChanged" }, {
        callback = function()
          require("lint").try_lint()
        end,
      })
    end
  },
  {
    "rshkarin/mason-nvim-lint",
    dependencies = { "williamboman/mason.nvim", "mfussenegger/nvim-lint" },
    config = function()
      require("mason-nvim-lint").setup({
        ensure_installed = { "luacheck" },
        automatic_installation = true,
        quiet_mode = true,
      })
    end
  },
}
