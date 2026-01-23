return {
	{
		"stevearc/oil.nvim",
		dependencies = { "nvim-tree/nvim-web-devicons" },
		config = function()
			require("oil").setup({
				default_file_explorer = true,
				view_options = {
					show_hidden = true,
				},
				keymaps = {
					["<C-s>"] = false,
					["<C-h>"] = false,
					["<C-t>"] = false,
					["<leader>f"] = false,
					["<esc>"] = { "actions.close", mode = "n" },
					["<backspace>"] = { "actions.parent", mode = "n" },
				},
				float = {
					max_width = 0.8,
					border = "rounded",
				},
			})
		end,
		keys = {
			{
				"<leader>f",
				function()
					local oil = require("oil")
					oil.open_float(nil, nil, function()
						oil.open_preview()
					end)
				end,
				desc = "File Manager",
			},
		},
	},
}
