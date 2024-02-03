return {
  {
    'nvim-telescope/telescope.nvim',
    tag = '0.1.5',
    dependencies = { 'nvim-lua/plenary.nvim' },
    lazy = false,
    keys = {
      { "<leader><space>", "<cmd>Telescope find_files<cr>", desc = "Find File" },
      { "<leader>/",       "<cmd>Telescope live_grep<cr>",  desc = "Live Grep" },
      { "<leader>b",       "<cmd>Telescope buffers<cr>",    desc = "Buffers" },
      { "<leader>h",       "<cmd>Telescope help_tags<cr>",  desc = "Help Search" },
    },
    opts = {
      pickers = {
        find_files = {
          find_command = { 'rg', '--files', '--hidden', '-g', '!.git' },
        }
      }
    },
  },
  {
    "nvim-telescope/telescope-file-browser.nvim",
    dependencies = { "nvim-telescope/telescope.nvim", "nvim-lua/plenary.nvim" },
    config = function() require("telescope").load_extension("file_browser") end,
    keys = {
      { "<leader>f", "<cmd>Telescope file_browser path=%:p:h select_buffer=true<cr>", desc = "File Browser" },
    },
  },
  {
    "debugloop/telescope-undo.nvim",
    dependencies = {
      "nvim-telescope/telescope.nvim",
      "nvim-lua/plenary.nvim",
    },
    keys = {
      { "<leader>u", "<cmd>Telescope undo<cr>", desc = "Undo History" },
    },
    config = function(_, opts)
      require("telescope").setup(opts)
      require("telescope").load_extension("undo")
    end,
  },
}
