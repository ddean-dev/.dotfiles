local telescope = require("telescope.builtin")
local map = vim.keymap.set

vim.g.mapleader = " "

-- File Management
map({ "i", "x", "n", "s" }, "<C-s>", "<cmd>w<cr><esc>", { desc = "Save file" })
map("n", "<C-n>", "<cmd>enew<cr>", { desc = "New File" })

-- Move to window using the <ctrl> hjkl keys
map("n", "<C-h>", "<C-w>h", { desc = "Go to left window", remap = true })
map("n", "<C-j>", "<C-w>j", { desc = "Go to lower window", remap = true })
map("n", "<C-k>", "<C-w>k", { desc = "Go to upper window", remap = true })
map("n", "<C-l>", "<C-w>l", { desc = "Go to right window", remap = true })

-- Telescope
map("n", "<leader> ", telescope.find_files, {desc = "Find Files"})
map("n", "<leader>/", telescope.live_grep, {desc = "Grep"})
