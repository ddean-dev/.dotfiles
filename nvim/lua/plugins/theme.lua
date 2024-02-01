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
return {
  {
    'nvim-lualine/lualine.nvim',
    dependencies = { 'nvim-tree/nvim-web-devicons' },
    opts = {
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
    config = function(_, opts) require('lualine').setup(opts) end,
  },
  { "lukas-reineke/indent-blankline.nvim", main = "ibl", opts = {} },
}
