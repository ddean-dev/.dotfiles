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
    --TODO: Return to main branch if https://github.com/rshkarin/mason-nvim-lint/pull/2 merged
    --"rshkarin/mason-nvim-lint",
    "ddean-dev/mason-nvim-lint",
    branch = "quiet-mode",
    dependencies = { "williamboman/mason.nvim", "mfussenegger/nvim-lint" },
    config = function()
      require("mason-nvim-lint").setup({
        ensure_installed = {},
        automatic_installation = true,
        quiet_mode = true,
      })
    end
  },
}
