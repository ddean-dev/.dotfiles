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
  SpecialKey   = { ctermfg = c.blue },
  TermCursor   = { cterm = { reverse = true } },
  NonText      = { ctermfg = c.brightblue },
  Directory    = { ctermfg = c.blue },
  ErrorMsg     = { ctermfg = c.white, ctermbg = c.red },
  IncSearch    = { cterm = { reverse = true } },
  MoreMsg      = { ctermfg = c.green },
  ModeMsg      = { cterm = { bold = true } },
  Question     = { ctermfg = c.green },
  Title        = { ctermfg = c.magenta },
  WarningMsg   = { ctermfg = c.red },
  WildMenu     = { ctermfg = c.black, ctermbg = c.brightyellow },
  Conceal      = { ctermfg = c.lightgray, ctermbg = c.lightgray },
  SpellBad     = { ctermbg = c.brightred },
  SpellRare    = { ctermbg = c.brightmagenta },
  SpellLocal   = { ctermbg = c.brightcyan },
  PmenuSbar    = { ctermbg = c.darkgray },
  PmenuThumb   = { ctermbg = c.black },
  TabLine      = { cterm = { underline = true }, ctermfg = c.black, ctermbg = c.lightgray },
  TabLineSel   = { cterm = { bold = true } },
  TabLineFill  = { cterm = { reverse = true } },
  CursorColumn = { ctermbg = c.lightgray },
  CursorLine   = { cterm = { underline = true } },
  MatchParen   = { ctermbg = c.brightcyan },
  Constant     = { ctermfg = c.red },
  Special      = { ctermfg = c.magenta },
  Identifier   = { cterm = {}, ctermfg = c.cyan },
  Statement    = { ctermfg = c.yellow },
  PreProc      = { ctermfg = c.magenta },
  Type         = { ctermfg = c.green },
  Underlined   = { cterm = { underline = true }, ctermfg = c.magenta },
  Ignore       = { ctermfg = c.white },
  Error        = { ctermfg = c.white, ctermbg = c.brightred },
  Todo         = { ctermfg = c.black, ctermbg = c.brightyellow },
  DiffAdd      = { ctermfg = c.black, ctermbg = c.green },
  DiffChange   = { ctermfg = c.black, ctermbg = c.yellow },
  DiffDelete   = { ctermfg = c.black, ctermbg = c.red },
  DiffText     = { ctermfg = c.black, ctermbg = c.brightyellow, cterm = { bold = true } },
  Visual       = { ctermfg = "NONE", ctermbg = "NONE", cterm = { reverse = true } },
  Search       = { ctermfg = c.black, ctermbg = c.brightyellow },
  SignColumn   = { ctermbg = "NONE" },
}

if vim.o.background == "light" then
  theme.LineNr       = { ctermfg = c.lightgray }
  theme.CursorLineNr = { ctermfg = c.darkgray }
  theme.Comment      = { ctermfg = c.lightgray }
  theme.ColorColumn  = { ctermfg = c.darkgray, ctermbg = c.lightgray }
  theme.Folded       = { ctermfg = c.darkgray, ctermbg = c.lightgray }
  theme.FoldColumn   = { ctermfg = c.darkgray, ctermbg = c.lightgray }
  theme.Pmenu        = { ctermfg = c.black, ctermbg = c.lightgray }
  theme.PmenuSel     = { ctermfg = c.lightgray, ctermbg = c.black }
  theme.SpellCap     = { ctermfg = c.darkgray, ctermbg = c.lightgray }
  theme.StatusLine   = { ctermfg = c.black, ctermbg = c.lightgray, cterm = { bold = true } }
  theme.StatusLineNC = { ctermfg = c.darkgray, ctermbg = c.lightgray, cterm = {} }
  theme.VertSplit    = { ctermfg = c.darkgray, ctermbg = c.lightgray, cterm = {} }
else
  theme.LineNr       = { ctermfg = c.darkgray }
  theme.CursorLineNr = { ctermfg = c.lightgray }
  theme.Comment      = { ctermfg = c.darkgray }
  theme.ColorColumn  = { ctermfg = c.lightgray, ctermbg = c.darkgray }
  theme.Folded       = { ctermfg = c.lightgray, ctermbg = c.darkgray }
  theme.FoldColumn   = { ctermfg = c.lightgray, ctermbg = c.darkgray }
  theme.Pmenu        = { ctermfg = c.white, ctermbg = c.ddarkgray }
  theme.PmenuSel     = { ctermfg = c.darkgray, ctermbg = c.white }
  theme.SpellCap     = { ctermfg = c.lightgray, ctermbg = c.darkgray }
  theme.StatusLine   = { ctermfg = c.white, ctermbg = c.ddarkgray, cterm = { bold = true } }
  theme.StatusLineNC = { ctermfg = c.lightgray, ctermbg = c.darkgray, cterm = {} }
  theme.VertSplit    = { ctermfg = c.lightgray, ctermbg = c.darkgray, cterm = {} }
end

for group, colors in pairs(theme) do
  vim.api.nvim_set_hl(0, group, colors)
end
