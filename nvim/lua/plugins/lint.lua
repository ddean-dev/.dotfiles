return {
  "williamboman/mason.nvim",
  {
    "mfussenegger/nvim-lint",
    config = function()
      vim.api.nvim_create_autocmd({ "TextChanged" }, {
        callback = function()
          require("lint").try_lint()
        end,
      })
    end
  },
  { "rshkarin/mason-nvim-lint", dependencies = { "williamboman/mason.nvim", "mfussenegger/nvim-lint" } },
}
