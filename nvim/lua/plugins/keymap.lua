vim.g.mapleader = " "
vim.g.maplocalleader = "\\"
vim.keymap.set({ "i", "n" }, "<esc>", "<cmd>noh<cr><esc>", { desc = "Escape and clear hlsearch" })
vim.keymap.set({ "i", "x", "n", "s" }, "<C-s>", "<cmd>up<cr><esc>", { desc = "Save file" })
vim.keymap.set("v", "<", "<gv", { desc = "Decrease indent" })
vim.keymap.set("v", ">", ">gv", { desc = "Increase indent" })
vim.keymap.set("n", "<C-Right>", "w", { desc = "Right word" })
vim.keymap.set("n", "<C-Left>", "b", { desc = "Left word" })

return {}
