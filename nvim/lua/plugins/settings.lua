vim.cmd [[colorscheme nib]]
vim.g.autoformat = true                       -- Format on save
vim.opt.autowriteall = true                   -- Allow autosaving
vim.opt.clipboard = "unnamedplus"             -- Sync with system clipboard
vim.opt.completeopt = "menu,menuone,noselect" -- Use gui menus for compleions
vim.opt.conceallevel = 2                      -- Hide * markup for bold and italic, but not markers with substitutions
vim.opt.confirm = true                        -- Confirm to save changes before exiting modified buffer
vim.opt.cursorline = true                     -- Enable highlighting of the current line
vim.opt.expandtab = true                      -- Use spaces instead of tabs
vim.opt.formatoptions = "jcroqlnt"            -- formatting options tcqj
vim.opt.grepformat = "%f:%l:%c:%m"            -- grep settings
vim.opt.grepprg = "rg --vimgrep"              -- grep settings
vim.opt.ignorecase = true                     -- Ignore case
vim.opt.inccommand = "nosplit"                -- preview incremental substitute
vim.opt.laststatus = 3                        -- global statusline
vim.opt.list = true                           -- Show some invisible characters (tabs...
vim.opt.mouse = "a"                           -- Enable mouse mode
vim.opt.number = true                         -- Print line number
vim.opt.pumheight = 10                        -- Maximum number of entries in a popup
vim.opt.relativenumber = true                 -- Relative line numbers
vim.opt.scrolloff = 4                         -- Lines of context
vim.opt.shiftround = true                     -- Round indent
vim.opt.shiftwidth = 2                        -- Size of an indent
vim.opt.shortmess:append(
  { W = true, I = true, c = true, C = true }  -- Prevent "Press Enter" prompts
)
vim.opt.showcmdloc = "statusline"
vim.opt.sidescrolloff = 8              -- Columns of context
vim.opt.signcolumn = "yes"             -- Always show the signcolumn
vim.opt.smartcase = true               -- Don't ignore case with capitals
vim.opt.smartindent = true             -- Insert indents automatically
vim.opt.spelllang = { "en_ca", "en" }  -- Set spelling to canadian
vim.opt.splitbelow = true              -- Put new windows below current
vim.opt.splitkeep = "screen"           -- Keep scroll when spliting
vim.opt.splitright = true              -- Put new windows right of current
vim.opt.tabstop = 2                    -- Number of spaces tabs count for
vim.opt.timeoutlen = 300               -- Lower timeout to feel more responsive
vim.opt.undofile = true                -- Maintain undo history between sessions
vim.opt.undolevels = 10000             -- How many undo's to keep
vim.opt.updatetime = 200               -- Keeps swapfile updated in case of crash
vim.opt.virtualedit = "block"          -- Allow cursor to move where there is no text in visual block mode
vim.opt.wildmode = "longest:full,full" -- Command-line completion mode
vim.opt.winminwidth = 5                -- Minimum window width
vim.opt.wrap = false                   -- Disable line wrap
vim.opt.colorcolumn = "120"            -- set long line warning
vim.opt.foldcolumn = '0'               -- don't show fold column
vim.opt.foldlevel = 99
vim.opt.foldlevelstart = 99
vim.opt.foldenable = true
vim.opt.fillchars = {
  foldopen = "",
  foldclose = "",
  fold = " ",
  foldsep = " ",
  diff = "╱",
  eob = " ",
}

-- Remove "How to diable mouse" prompt on mouse menus
vim.cmd [[aunmenu PopUp.How-to\ disable\ mouse]]
vim.cmd [[aunmenu PopUp.-1-]]

-- Set Icons
local icons = {
  diagnostics = {
    Error = "",
    Warn  = "",
    Hint  = "",
    Info  = "",
  },
}
for type, icon in pairs(icons.diagnostics) do
  local hl = "DiagnosticSign" .. type
  vim.fn.sign_define(hl, { text = icon, texthl = hl, numhl = hl })
end

return {}
