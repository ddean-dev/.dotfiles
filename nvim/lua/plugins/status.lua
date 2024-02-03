local c = {
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
  c.black = 15
  c.white = 0
  c.lightgray = 8
  c.darkgray = 7
end

return {
  {
    'nvim-lualine/lualine.nvim',
    dependencies = { 'nvim-tree/nvim-web-devicons', 'folke/noice.nvim' },
    opts = {
      sections = {
        lualine_a = { 'mode', {
          "macro-recording",
          fmt = function()
            local recording_register = vim.fn.reg_recording()
            if recording_register == "" then
              return ""
            else
              return "[Recording @" .. recording_register .. "]"
            end
          end,
        }, },
        lualine_b = { {
          'branch',
          on_click = function()
            require("telescope.builtin").git_branches()
          end
        }, 'diff', 'diagnostics' },
        lualine_c = { { 'filename', path = 1 } },
        lualine_x = { 'selectioncount', 'searchcount' },
        lualine_y = { 'encoding', 'fileformat', 'filetype' },
        lualine_z = { 'location' },
      },
      options = {
        component_separators = { left = '', right = '' },
        section_separators = { left = '', right = '' },
        theme = {
          normal = {
            a = { bg = c.blue, fg = c.black, gui = 'bold' },
            b = { bg = c.darkgray, fg = c.white },
            c = { bg = c.black, fg = c.white }
          },
          insert = {
            a = { bg = c.cyan, fg = c.black, gui = 'bold' },
            b = { bg = c.darkgray, fg = c.white },
            c = { bg = c.black, fg = c.white }
          },
          visual = {
            a = { bg = c.green, fg = c.black, gui = 'bold' },
            b = { bg = c.darkgray, fg = c.white },
            c = { bg = c.black, fg = c.white }
          },
          replace = {
            a = { bg = c.red, fg = c.black, gui = 'bold' },
            b = { bg = c.darkgray, fg = c.white },
            c = { bg = c.black, fg = c.white }
          },
          command = {
            a = { bg = c.yellow, fg = c.black, gui = 'bold' },
            b = { bg = c.darkgray, fg = c.white },
            c = { bg = c.black, fg = c.white }
          },
          inactive = {
            a = { bg = c.lightgray, fg = c.black, gui = 'bold' },
            b = { bg = c.darkgray, fg = c.white },
            c = { bg = c.black, fg = c.white }
          }
        },
      },
    },
    config = function(_, opts)
      require('lualine').setup(opts)
    end,
  },
}
