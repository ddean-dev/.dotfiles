return {
  {
    'nvim-telescope/telescope.nvim',
    tag = '0.1.5',
    dependencies = { 'nvim-lua/plenary.nvim' },
    keys = {
      { "<leader><space>", "<cmd>Telescope find_files<cr>", "Find File" },
      { "<leader>/",       "<cmd>Telescope live_grep<cr>",  desc = "Live Grep" },
      { "<leader>b",       "<cmd>Telescope buffers<cr>",    desc = "Buffers" },
    },
    opts = {
      pickers = {
        find_files = {
          find_command = { 'rg', '--files', '--hidden', '-g', '!.git' },
        }
      }
    },
    init = function()
      vim.api.nvim_create_autocmd("VimEnter", {
        callback = function()
          if vim.fn.argv(0) == "" then
            require("telescope.builtin").find_files()
          end
        end,
      })
    end,
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
  {
    "AckslD/nvim-neoclip.lua",
    requires = {
      { 'nvim-telescope/telescope.nvim' },
    },
    config = function()
      require('neoclip').setup()
    end,
    keys = {
      { "<leader>p",  "<cmd>Telescope neoclip<cr>",    desc = "Clipboard" },
      { "<leader>qa", "<cmd>Telescope macroscope<cr>", desc = "Macro History" }
    }
  }
}
