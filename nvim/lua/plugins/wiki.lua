return {
	{
		"epwalsh/obsidian.nvim",
		version = "*", -- use latest release instead of latest commit
		lazy = true,
		dependencies = {
			"nvim-lua/plenary.nvim",
			"ibhagwan/fzf-lua",
			"saghen/blink.cmp",
		},
		ft = "markdown",
		opts = {
			workspaces = {
				{
					name = "personal",
					path = "~/Documents/notes",
				},
			},
		},
	},
	{
		"MeanderingProgrammer/render-markdown.nvim",
		dependencies = { "nvim-tree/nvim-web-devicons" }, -- if you prefer nvim-web-devicons
		opts = {
			heading = {
				icons = { "󰉫 ", "󰉬 ", "󰉭 ", "󰉮 ", "󰉯 ", "󰉰 " },
				position = "eol",
			},
			bullet = {
				right_pad = 1,
			},
			quote = {
				repeat_linebreak = true,
			},
			indent = {
				enabled = true,
			},
		},
	},
}
