function clipboard()
  require("telescope").extensions.yank_history.yank_history({})
end

return {
  {
    "gbprod/yanky.nvim",
    dependencies = {
      { "kkharji/sqlite.lua" }
    },
    opts = {
      ring = { storage = "sqlite" },
    },
    keys = {
      { "<leader>p", clipboard,                                desc = "Clipboard" },
      { "y",         "<Plug>(YankyYank)",                      desc = "Yank text",                                 mode = { "n", "x" } },
      { "p",         "<Plug>(YankyPutAfter)",                  desc = "Put yanked text after cursor",              mode = { "n", "x" } },
      { "P",         "<Plug>(YankyPutBefore)",                 desc = "Put yanked text before cursor",             mode = { "n", "x" } },
      { "gp",        "<Plug>(YankyGPutAfter)",                 desc = "Put yanked text after selection",           mode = { "n", "x" } },
      { "gP",        "<Plug>(YankyGPutBefore)",                desc = "Put yanked text before selection",          mode = { "n", "x" } },
      { "<c-p>",     "<Plug>(YankyPreviousEntry)",             desc = "Select previous entry through yank history" },
      { "<c-n>",     "<Plug>(YankyNextEntry)",                 desc = "Select next entry through yank history" },
      { "]p",        "<Plug>(YankyPutIndentAfterLinewise)",    desc = "Put indented after cursor (linewise)" },
      { "[p",        "<Plug>(YankyPutIndentBeforeLinewise)",   desc = "Put indented before cursor (linewise)" },
      { "]P",        "<Plug>(YankyPutIndentAfterLinewise)",    desc = "Put indented after cursor (linewise)" },
      { "[P",        "<Plug>(YankyPutIndentBeforeLinewise)",   desc = "Put indented before cursor (linewise)" },
      { ">p",        "<Plug>(YankyPutIndentAfterShiftRight)",  desc = "Put and indent right" },
      { "<p",        "<Plug>(YankyPutIndentAfterShiftLeft)",   desc = "Put and indent left" },
      { ">P",        "<Plug>(YankyPutIndentBeforeShiftRight)", desc = "Put before and indent right" },
      { "<P",        "<Plug>(YankyPutIndentBeforeShiftLeft)",  desc = "Put before and indent left" },
      { "=p",        "<Plug>(YankyPutAfterFilter)",            desc = "Put after applying a filter" },
      { "=P",        "<Plug>(YankyPutBeforeFilter)",           desc = "Put before applying a filter" },
    },
  },
  {
    "ThePrimeagen/refactoring.nvim",
    keys = {
      { "<leader>ce", ":Refactor extract ",              desc = "Extract",              mode = "x" },
      { "<leader>cf", ":Refactor extract_to_file ",      desc = "Extract to File",      mode = "x" },
      { "<leader>cv", ":Refactor extract_var ",          desc = "Extract Variable",     mode = "x" },
      { "<leader>ci", ":Refactor inline_var",            desc = "Inline Variable",      mode = { "n", "x" } },
      { "<leader>cI", ":Refactor inline_func",           desc = "Inline Function", },
      { "<leader>cb", ":Refactor extract_block",         desc = "Extract Block" },
      { "<leader>cB", ":Refactor extract_block_to_file", desc = "Extract Block to File" },
    },
    dependencies = {
      "nvim-lua/plenary.nvim",
      "nvim-treesitter/nvim-treesitter",
    },
    config = function()
      require("refactoring").setup()
    end,
  },
}
