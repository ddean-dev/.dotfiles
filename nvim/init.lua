-- Setup Lazy.nvim
local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
  vim.fn.system({
    "git",
    "clone",
    "--filter=blob:none",
    "https://github.com/folke/lazy.nvim.git",
    "--branch=stable", -- latest stable release
    lazypath,
  })
end
vim.opt.rtp:prepend(lazypath)

-- Initialize Plugins
require("lazy").setup({
  {"folke/tokyonight.nvim"},
  {
    'nvim-treesitter/nvim-treesitter',
    build = ":TSUpdate",
  },
  {
    "nvim-treesitter/nvim-treesitter-textobjects",
    build = ":TSUpdate",
  },
  {
    "nvim-treesitter/nvim-treesitter-context",
    build = ":TSUpdate",
    opts = { mode = "cursor", max_lines = 3 },
  },
  {'williamboman/mason.nvim'},
  {'williamboman/mason-lspconfig.nvim'},
  {'neovim/nvim-lspconfig'},
  {'hrsh7th/cmp-nvim-lsp'},
  {'hrsh7th/nvim-cmp'},
  {"nvim-telescope/telescope.nvim", dependencies = { 'nvim-lua/plenary.nvim' }},
  {
    "folke/which-key.nvim",
    event = "VeryLazy",
    init = function()
      vim.o.timeout = true
      vim.o.timeoutlen = 500
    end,
    opts = {},
  },
  {
    'stevearc/dressing.nvim',
    opts = {},
  },
  {
    'nvim-lualine/lualine.nvim',
    dependencies = { 'nvim-tree/nvim-web-devicons' }
  },
  {"rcarriga/nvim-notify"},
  {
    "folke/noice.nvim",
    event = "VeryLazy",
    opts = {},
    dependencies = {
      "MunifTanjim/nui.nvim",
      "rcarriga/nvim-notify",
    }
  },
  { "lukas-reineke/indent-blankline.nvim", main = "ibl", opts = {} },
},
{
  checker = {
    enabled = true,
  }
})

vim.cmd.colorscheme("tokyonight-moon")
require('lualine').setup()
require('lspconfig').lua_ls.setup({})

--Load Config
require("ddean.keymap")
require("ddean.tab")
require("ddean.general")
