return {
	{
		"rest-nvim/rest.nvim",
		keys = {
			{ "<leader>H", "<cmd>Rest run<cr>", desc = "HTTP Request" },
		},
		config = function()
			require("telescope").load_extension("rest")
		end,
	},
}
