-- Nibrodooh's Improved but Basic

vim.opt.termguicolors = false
vim.opt.guicursor = "n-v-c:block,i-ci-ve:ver25-blinkon100,r-cr:hor20-blinkon100,o:hor50,sm:block-blinkon100"

if vim.g.colors_name then
	vim.cmd("hi clear")
end

vim.g.colors_name = "nib"

local c = {
	black = 0,
	red = 1,
	green = 2,
	blue = 4,
	yellow = 3,
	magenta = 5,
	cyan = 6,
	lightgray = 7,
	darkgray = 8,
	brightred = 9,
	brightgreen = 10,
	brightyellow = 11,
	brightblue = 12,
	brightmagenta = 13,
	brightcyan = 14,
	white = 15,
}

local theme = {
	-- Cursor
	TermCursor = { cterm = { reverse = true } },
	CursorColumn = { ctermbg = c.lightgray },
	ColorColumn = { ctermfg = c.lightgray, ctermbg = c.darkgray },
	CursorLine = {},

	-- UI
	WinSeparator = { ctermfg = c.lightgray },

	-- Gutter
	LineNr = { ctermfg = c.darkgray },
	CursorLineNr = { ctermfg = c.lightgray },
	SignColumn = { ctermbg = "NONE" },
	FoldColumn = { ctermfg = c.lightgray, ctermbg = "NONE" },

	-- Search and Selection
	IncSearch = { cterm = { reverse = true } },
	Visual = { ctermfg = "NONE", ctermbg = "NONE", cterm = { reverse = true } },
	Search = { ctermfg = c.black, ctermbg = c.brightyellow },
	MatchParen = { ctermbg = c.brightgreen },
	Folded = { ctermbg = c.black },

	-- Status Bar
	StatusLine = { ctermfg = c.white, ctermbg = "NONE" },
	StatusLineNC = { ctermfg = c.lightgray, ctermbg = c.darkgray },
	TabLine = { ctermfg = c.white, ctermbg = c.darkgray },
	TabLineFill = { ctermfg = c.darkgray, ctermbg = c.black },
	TabLineSel = { ctermfg = c.black, ctermbg = c.white },

	-- Popup Menus
	Pmenu = { ctermbg = c.black },
	PmenuExtra = { ctermbg = c.darkgray },
	PmenuSel = { cterm = { reverse = true } },
	PmenuSbar = { ctermfg = c.white, ctermbg = c.lightgray },
	PmenuThumb = { cterm = { reverse = true } },
	FloatBorder = { ctermfg = c.blue },

	-- Special Characters
	SpecialKey = { ctermfg = c.brightred },
	NonText = { ctermfg = c.brightblue },
	Conceal = { ctermfg = c.lightgray, ctermbg = c.lightgray },

	-- Prompts
	Directory = { ctermfg = c.blue },
	Question = { ctermfg = c.green },
	Title = { ctermfg = c.magenta },
	MoreMsg = { ctermfg = c.green },
	WarningMsg = { ctermfg = c.black, ctermbg = c.brightyellow },
	ErrorMsg = { ctermfg = c.white, ctermbg = c.brightred },
	WildMenu = { ctermfg = c.black, ctermbg = c.brightblue },

	-- Spelling
	SpellBad = { ctermbg = c.brightred },
	SpellRare = { ctermbg = c.brightmagenta },
	SpellLocal = { ctermbg = c.brightcyan },
	SpellCap = { ctermfg = c.brightyellow },

	-- VCS
	DiffAdd = { ctermfg = c.black, ctermbg = c.green },
	DiffChange = { ctermfg = c.black, ctermbg = c.yellow },
	DiffDelete = { ctermfg = c.black, ctermbg = c.red },
	DiffText = { ctermfg = c.black, ctermbg = c.brightyellow },

	--LSP
	Comment = { ctermfg = c.darkgray },
	Constant = { ctermfg = c.yellow },
	Float = { ctermfg = c.brightred },
	Identifier = { ctermfg = c.blue },
	Function = { ctermfg = c.brightblue },
	Statement = { ctermfg = c.cyan },
	PreProc = { ctermfg = c.red },
	Type = { ctermfg = c.green },
	Special = { ctermfg = c.brightmagenta },
	Underlined = { cterm = { underline = true }, ctermfg = c.brightcyan },
	Ignore = { ctermfg = c.darkgray, cterm = { strikethrough = true } },
	Error = { ctermfg = c.white, ctermbg = c.brightred },
	Todo = { cterm = { underline = true }, ctermfg = c.black, ctermbg = c.brightyellow },

	-- Noice(https://github.com/folke/noice.nvim)
	NoiceCursor = { cterm = { reverse = true } },

	-- Notify(https://github.com/rcarriga/nvim-notify)
	NotifyERRORTitle = { ctermfg = c.red },
	NotifyWARNTitle = { ctermfg = c.yellow },
	NotifyINFOTitle = { ctermfg = c.white },
	NotifyDEBUGTitle = { ctermfg = c.blue },
	NotifyTRACETitle = { ctermfg = c.cyan },
	NotifyERRORIcon = { ctermfg = c.red },
	NotifyWARNIcon = { ctermfg = c.yellow },
	NotifyINFOIcon = { ctermfg = c.white },
	NotifyDEBUGIcon = { ctermfg = c.blue },
	NotifyTRACEIcon = { ctermfg = c.cyan },
	NotifyERRORBorder = { ctermfg = c.red },
	NotifyWARNBorder = { ctermfg = c.yellow },
	NotifyINFOBorder = { ctermfg = c.white },
	NotifyDEBUGBorder = { ctermfg = c.blue },
	NotifyTRACEBorder = { ctermfg = c.cyan },
	NotifyERRORBody = { link = "Normal" },
	NotifyWARNBody = { link = "Normal" },
	NotifyINFOBody = { link = "Normal" },
	NotifyDEBUGBody = { link = "Normal" },
	NotifyTRACEBody = { link = "Normal" },

	-- Indent Blankline(https://github.com/lukas-reineke/indent-blankline.nvim)
	IblIndent = { ctermfg = c.darkgray },

	-- GitSigns(https://github.com/lewis6991/gitsigns.nvim)
	GitSignsAddNr = { ctermbg = c.green },
	GitSignsChangeNr = { ctermbg = c.yellow },
	GitSignsDeleteNr = { ctermbg = c.red },
	GitSignsAddInline = { ctermbg = c.green },
	GitSignsChangeInline = { ctermbg = c.yellow },
	GitSignsDeleteInline = { ctermbg = c.red },

	-- TreeSitterContext (https://github.com/nvim-treesitter/nvim-treesitter-context)
	TreesitterContext = { cterm = { italic = true } },
	TreesitterContextLineNumber = { cterm = { italic = true } },
	TreesitterContextSeparator = { ctermfg = c.darkgray },

	-- DAP
	DapBreakpoint = { ctermfg = c.brightred },
	DapLogpoint = { ctermfg = c.brightyellow },

	--WhichKey (https://github.com/folke/which-key.nvim)
	WhichKeyBorder = { ctermfg = c.blue },
	WhichKeyNormal = { ctermfg = c.lightgray },
}

for group, colors in pairs(theme) do
	vim.api.nvim_set_hl(0, group, colors)
end
