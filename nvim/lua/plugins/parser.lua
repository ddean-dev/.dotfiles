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
