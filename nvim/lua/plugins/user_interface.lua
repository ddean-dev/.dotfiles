return {
	{
		"folke/noice.nvim",
		event = "VeryLazy",
		opts = {
			lsp = {
				override = {
					["vim.lsp.util.convert_input_to_markdown_lines"] = true,
					["cmp.entry.get_documentation"] = true,
				},
			},
			presets = {
				command_palette = false,
				long_message_to_split = true,
				inc_rename = true,
				lsp_doc_border = true,
			},
		},
		dependencies = { "MunifTanjim/nui.nvim", "rcarriga/nvim-notify" },
	},
	{ "stevearc/dressing.nvim" },
	{
		"rcarriga/nvim-notify",
		opts = {
			stages = "static",
		},
		keys = {
			{
				"<leader>n",
				function()
					require("notify").dismiss({ silent = true, pending = true })
					require("telescope").extensions.notify.notify()
				end,
				desc = "Notifications",
			},
		},
	},
	{
		"folke/which-key.nvim",
		event = "VeryLazy",
		config = function()
			local wk = require("which-key")
			wk.setup({
				preset = "modern",
				plugins = { spelling = true },
				spec = {
					{ "<leader>g", group = "Git" },
					{ "<leader>t", group = "Tab" },
					{ "<leader>D", group = "Debugger" },
					{ "<leader>1", hidden = true },
					{ "<leader>2", hidden = true },
					{ "<leader>3", hidden = true },
					{ "<leader>4", hidden = true },
					{ "<leader>5", hidden = true },
				},
			})
		end,
	},
	{
		"MeanderingProgrammer/markdown.nvim",
		dependencies = { "nvim-treesitter/nvim-treesitter", "nvim-tree/nvim-web-devicons" },
		config = function()
			require("render-markdown").setup({
				heading = {
					backgrounds = {
						"Folded",
					},
					icons = { "󰠶 " },
				},
				code = {
					style = "language",
				},
			})
		end,
	},
	{
		"karb94/neoscroll.nvim",
		opts = {
			hide_cursor = false,
		},
		keys = {
			{
				"<PageUp>",
				function()
					require("neoscroll").ctrl_u({ duration = 150, move_cursor = true })
				end,
				mode = { "n", "i" },
			},
			{
				"<PageDown>",
				function()
					require("neoscroll").ctrl_d({ duration = 150, move_cursor = true })
				end,
				mode = { "n", "i" },
			},
		},
	},
	{
		"sphamba/smear-cursor.nvim",
		opts = {},
	},
}
