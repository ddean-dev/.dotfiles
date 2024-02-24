vim.g.mapleader = " "
vim.g.maplocalleader = "\\"
vim.keymap.set({ "i", "n" }, "<esc>", "<cmd>noh<cr><esc>", { desc = "Escape and clear hlsearch" })
vim.keymap.set("v", "<", "<gv", { desc = "Decrease indent" })
vim.keymap.set("v", ">", ">gv", { desc = "Increase indent" })
vim.keymap.set("n", "<C-Right>", "w", { desc = "Right word" })
vim.keymap.set("n", "<C-Left>", "b", { desc = "Left word" })
vim.keymap.set("n", "<C-w>%", "<cmd>vsplit<cr>", { desc = "Split Right" })
vim.keymap.set("n", '<C-w>"', "<cmd>split<cr>", { desc = "Split Below" })

return {}
