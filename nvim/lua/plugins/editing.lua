return {
	{
		"gbprod/yanky.nvim",
		dependencies = {
			{ "kkharji/sqlite.lua" },
			{ "ibhagwan/fzf-lua" },
		},
		opts = {
			ring = { storage = "sqlite" },
		},
		keys = {
			{
				"<leader>p",
				"<cmd>YankyRingHistory<cr>",
				desc = "Clipboard",
				mode = { "n", "i" },
			},
			{
				"y",
				"<Plug>(YankyYank)",
				desc = "Yank text",
				mode = { "n", "x" },
			},
			{
				"p",
				"<Plug>(YankyPutAfter)",
				desc = "Put yanked text after cursor",
				mode = { "n", "x" },
			},
			{
				"P",
				"<Plug>(YankyPutBefore)",
				desc = "Put yanked text before cursor",
				mode = { "n", "x" },
			},
		},
	},
}
