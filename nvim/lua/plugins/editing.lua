return {
	{
		"gbprod/yanky.nvim",
		dependencies = {
			{ "kkharji/sqlite.lua" },
		},
		opts = {
			ring = { storage = "sqlite" },
		},
		keys = {
			{
				"<C-v>",
				function()
					require("telescope").extensions.yank_history.yank_history({})
				end,
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
			{ "<c-p>", "<Plug>(YankyPreviousEntry)", desc = "Select previous entry through yank history" },
			{ "<c-n>", "<Plug>(YankyNextEntry)", desc = "Select next entry through yank history" },
		},
	},
}
