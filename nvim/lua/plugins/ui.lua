local colors = {
  black     = 0,
  red       = 1,
  green     = 2,
  blue      = 4,
  yellow    = 3,
  magenta   = 5,
  cyan      = 6,
  lightgray = 7,
  darkgray  = 8,
  white     = 15,
}

if vim.o.background == "light" then
  colors.black = 15
  colors.white = 0
  colors.lightgray = 8
  colors.darkgray = 7
end

return {
  {
    "folke/noice.nvim",
    event = "VeryLazy",
    opts = {
      lsp = {
        override = {
          ["vim.lsp.util.convert_input_to_markdown_lines"] = true,
          ["vim.lsp.util.stylize_markdown"] = true,
          ["cmp.entry.get_documentation"] = true,
        },
      },
      presets = {
        command_palette = false,
        long_message_to_split = true,
        inc_rename = true,
        lsp_doc_border = true,
      },
    },
    dependencies = { "MunifTanjim/nui.nvim", 'rcarriga/nvim-notify' },
  },
  { "stevearc/dressing.nvim" },
  {
    "rcarriga/nvim-notify",
    opts = {
      stages = "static",
    },
    keys = {
      { "<leader>n", "<cmd>Telescope notify<cr>", desc = "Notifications" },
    },
  },
  {
    "folke/which-key.nvim",
    event = "VeryLazy",
    init = function()
      vim.o.timeout = true
      vim.o.timeoutlen = 300
    end,
    opts = {
      plugins = { spelling = true },
      defaults = {
        mode = { "n", "v" },
        ["<leader>w"] = { name = "+windows" },
      },
    },
    config = function(_, opts)
      local wk = require("which-key")
      wk.setup(opts)
      wk.register(opts.defaults)
    end,
  },
  {
    'nvim-lualine/lualine.nvim',
    dependencies = { 'nvim-tree/nvim-web-devicons', 'folke/noice.nvim' },
    opts = {
      sections = {
        lualine_a = {
          "mode",
          {
            "macro-recording",
            fmt = function()
              local recording_register = vim.fn.reg_recording()
              if recording_register == "" then
                return ""
              else
                return "[Recording @" .. recording_register .. "]"
              end
            end,
          },
        }
      },
      options = {
        component_separators = { left = '', right = '' },
        section_separators = { left = '', right = '' },
        theme = {
          normal = {
            a = { bg = colors.blue, fg = colors.black, gui = 'bold' },
            b = { bg = colors.darkgray, fg = colors.white },
            c = { bg = colors.black, fg = colors.white }
          },
          insert = {
            a = { bg = colors.cyan, fg = colors.black, gui = 'bold' },
            b = { bg = colors.darkgray, fg = colors.white },
            c = { bg = colors.black, fg = colors.white }
          },
          visual = {
            a = { bg = colors.green, fg = colors.black, gui = 'bold' },
            b = { bg = colors.darkgray, fg = colors.white },
            c = { bg = colors.black, fg = colors.white }
          },
          replace = {
            a = { bg = colors.red, fg = colors.black, gui = 'bold' },
            b = { bg = colors.darkgray, fg = colors.white },
            c = { bg = colors.black, fg = colors.white }
          },
          command = {
            a = { bg = colors.yellow, fg = colors.black, gui = 'bold' },
            b = { bg = colors.darkgray, fg = colors.white },
            c = { bg = colors.black, fg = colors.white }
          },
          inactive = {
            a = { bg = colors.lightgray, fg = colors.black, gui = 'bold' },
            b = { bg = colors.darkgray, fg = colors.white },
            c = { bg = colors.black, fg = colors.white }
          }
        },
      },
    },
    config = function(_, opts)
      require('lualine').setup(opts)
      vim.api.nvim_create_autocmd("RecordingLeave", {
        callback = function()
          vim.schedule_wrap(function()
            require('lualine').refresh({
              place = { "statusline" },
            })
          end)
        end,
      })
    end,
  },
}
