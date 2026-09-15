return {
	{
		"https://github.com/arborist-ts/arborist.nvim",
		init = function()
			require("arborist").setup()
		end,
	},
	{
		"aaronik/treewalker.nvim",
		opts = {
			highlight = true, -- Whether to briefly highlight the node after jumping to it
		},
		keys = {
			{ "<M-Up>", "<cmd>Treewalker Up<cr>", { noremap = true, silent = true }, mode = { "n", "v", "i" } },
			{ "<M-Down>", "<cmd>Treewalker Down<cr>", { noremap = true, silent = true }, mode = { "n", "v", "i" } },
			{ "<M-Right>", "<cmd>Treewalker Right<cr>", { noremap = true, silent = true }, mode = { "n", "v", "i" } },
			{ "<M-Left>", "<cmd>Treewalker Left<cr>", { noremap = true, silent = true }, mode = { "n", "v", "i" } },
		},
	},
}
