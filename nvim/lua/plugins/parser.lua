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
        incremental_selection = {
          enable = true,
          keymaps = {
            init_selection = "va.",
            node_incremental = ".",
            node_decremental = ",",
            scope_incremental = false,
            scope_decremental = false,
          },
        },
      })
    end,
  },
  {
    "nvim-treesitter/nvim-treesitter-context",
    config = function()
      local context = require("treesitter-context")
      vim.keymap.set("n", "gC", context.go_to_context, { desc = "Go to context" })
      context.setup({
        enable = true,
        separator = "·",
        max_lines = 3,
        trim_scope = 'outer',
      })
    end
  },
}
