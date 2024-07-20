return {
	{
		"folke/noice.nvim",
		event = "VeryLazy",
		opts = {
			lsp = {
				override = {
					["vim.lsp.util.convert_input_to_markdown_lines"] = true,
					["vim.lsp.util.stylize_markdown"] = true,
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
			{ "<leader>n", "<cmd>Telescope notify<cr>", desc = "Notifications" },
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
					{ "<leader>D", group = "Debugger" },
				},
			})
		end,
	},
}
