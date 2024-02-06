-- Nibrodooh's Improved but Basic

vim.opt.termguicolors = false

if vim.g.colors_name then
  vim.cmd("hi clear")
end

vim.g.colors_name = "nib"

local c = {
  black         = 0,
  red           = 1,
  green         = 2,
  blue          = 4,
  yellow        = 3,
  magenta       = 5,
  cyan          = 6,
  lightgray     = 7,
  darkgray      = 8,
  brightred     = 9,
  brightgreen   = 10,
  brightyellow  = 11,
  brightblue    = 12,
  brightmagenta = 13,
  brightcyan    = 14,
  white         = 15,
}

local theme = {
  -- Cursor
  TermCursor        = { cterm = { reverse = true } },
  CursorColumn      = { ctermbg = c.lightgray },
  ColorColumn       = { ctermfg = c.lightgray, ctermbg = c.darkgray },
  CursorLine        = { cterm = { underline = true } },

  -- UI
  WinSeparator      = { ctermfg = c.lightgray, ctermbg = c.darkgray },

  -- Gutter
  LineNr            = { ctermfg = c.darkgray },
  CursorLineNr      = { ctermfg = c.lightgray },
  SignColumn        = { ctermbg = "NONE" },
  FoldColumn        = { ctermfg = c.lightgray, ctermbg = "NONE" },

  -- Search and Selection
  IncSearch         = { cterm = { reverse = true } },
  Visual            = { ctermfg = "NONE", ctermbg = "NONE", cterm = { reverse = true } },
  Search            = { ctermfg = c.black, ctermbg = c.brightyellow },
  MatchParen        = { ctermbg = c.brightgreen },
  Folded            = { ctermfg = c.lightgray, ctermbg = c.darkgray },

  -- Satus Bar
  ModeMsg           = { cterm = { bold = true } },
  StatusLine        = { ctermfg = c.white, ctermbg = c.ddarkgray, cterm = { bold = true } },
  StatusLineNC      = { ctermfg = c.lightgray, ctermbg = c.darkgray },
  TabLine           = { cterm = { underline = true }, ctermfg = c.black, ctermbg = c.lightgray },
  TabLineSel        = { cterm = { bold = true } },
  TabLineFill       = { cterm = { reverse = true } },

  -- Popup Menu
  PmenuSbar         = { ctermbg = c.darkgray },
  PmenuThumb        = { ctermbg = c.black },
  Pmenu             = { ctermfg = c.white, ctermbg = c.ddarkgray },
  PmenuSel          = { ctermfg = c.darkgray, ctermbg = c.white },

  -- Special Characters
  SpecialKey        = { ctermfg = c.brightred },
  NonText           = { ctermfg = c.brightblue },
  Conceal           = { ctermfg = c.lightgray, ctermbg = c.lightgray },

  -- Prompts
  Directory         = { ctermfg = c.blue },
  Question          = { ctermfg = c.green },
  Title             = { ctermfg = c.magenta },
  MoreMsg           = { ctermfg = c.green },
  WarningMsg        = { ctermfg = c.white, ctermbg = c.brightyellow },
  ErrorMsg          = { ctermfg = c.white, ctermbg = c.brightred },
  WildMenu          = { ctermfg = c.black, ctermbg = c.brightblue },

  -- Spelling
  SpellBad          = { ctermbg = c.brightred },
  SpellRare         = { ctermbg = c.brightmagenta },
  SpellLocal        = { ctermbg = c.brightcyan },
  SpellCap          = { ctermfg = c.brightyellow },

  -- VCS
  DiffAdd           = { ctermfg = c.black, ctermbg = c.green },
  DiffChange        = { ctermfg = c.black, ctermbg = c.yellow },
  DiffDelete        = { ctermfg = c.black, ctermbg = c.red },
  DiffText          = { ctermfg = c.black, ctermbg = c.brightyellow, cterm = { bold = true } },

  --LSP
  Comment           = { ctermfg = c.darkgray },
  Constant          = { ctermfg = c.yellow },
  Identifier        = { ctermfg = c.white },
  Function          = { ctermfg = c.blue },
  Statement         = { ctermfg = c.cyan },
  PreProc           = { ctermfg = c.red },
  Type              = { ctermfg = c.green },
  Special           = { ctermfg = c.brightmagenta },
  Underlined        = { cterm = { underline = true }, ctermfg = c.brightcyan },
  Ignore            = { ctermfg = c.darkgray },
  Error             = { ctermfg = c.white, ctermbg = c.brightred },
  Todo              = { cterm = { underline = true }, ctermfg = c.black, ctermbg = c.brightyellow },

  --Rainbow
  RainbowRed        = { ctermfg = c.red },
  RainbowYellow     = { ctermfg = c.yellow },
  RainbowBlue       = { ctermfg = c.blue },
  RainbowMagenta    = { ctermfg = c.magenta },
  RainbowGreen      = { ctermfg = c.green },
  RainbowCyan       = { ctermfg = c.cyan },
  RainbowDarkGray   = { ctermfg = c.darkgray },

  --Noice()
  NoiceCursor       = { cterm = { reverse = true } },

  -- Notify(https://github.com/rcarriga/nvim-notify)
  NotifyERRORTitle  = { ctermfg = c.red },
  NotifyWARNTitle   = { ctermfg = c.yellow },
  NotifyINFOTitle   = { ctermfg = c.white },
  NotifyDEBUGTitle  = { ctermfg = c.blue },
  NotifyTRACETitle  = { ctermfg = c.cyan },
  NotifyERRORIcon   = { ctermfg = c.red },
  NotifyWARNIcon    = { ctermfg = c.yellow },
  NotifyINFOIcon    = { ctermfg = c.white },
  NotifyDEBUGIcon   = { ctermfg = c.blue },
  NotifyTRACEIcon   = { ctermfg = c.cyan },
  NotifyERRORBorder = { ctermfg = c.red },
  NotifyWARNBorder  = { ctermfg = c.yellow },
  NotifyINFOBorder  = { ctermfg = c.white },
  NotifyDEBUGBorder = { ctermfg = c.blue },
  NotifyTRACEBorder = { ctermfg = c.cyan },
  NotifyERRORBody   = { link = "Normal" },
  NotifyWARNBody    = { link = "Normal" },
  NotifyINFOBody    = { link = "Normal" },
  NotifyDEBUGBody   = { link = "Normal" },
  NotifyTRACEBody   = { link = "Normal" },
}

for group, colors in pairs(theme) do
  vim.api.nvim_set_hl(0, group, colors)
end
