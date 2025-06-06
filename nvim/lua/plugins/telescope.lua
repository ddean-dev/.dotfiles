return {
	{
		"nvim-telescope/telescope.nvim",
		tag = "0.1.5",
		dependencies = { "nvim-lua/plenary.nvim", "nvim-telescope/telescope-fzf-native.nvim" },
		lazy = false,
		keys = {
			{ "<leader><space>", "<cmd>Telescope find_files<cr>", desc = "Find File" },
			{ "<leader>/", "<cmd>Telescope live_grep<cr>", desc = "Live Grep" },
			{ "<leader>.", "<cmd>Telescope current_buffer_fuzzy_find<cr>", desc = "Fuzzy Find" },
			{ "<leader>b", "<cmd>Telescope buffers<cr>", desc = "Buffers" },
			{ "<leader>j", "<cmd>Telescope jumplist<cr>", desc = "Jumplist" },
			{ "<leader>m", "<cmd>Telescope marks<cr>", desc = "Marks" },
			-- { "<leader>h", "<cmd>Telescope help_tags<cr>", desc = "Help Search" },
			-- { "<leader>m", "<cmd>Telescope man_pages<cr>", desc = "Manual Pages" },
			{ "<leader>d", "<cmd>Telescope diagnostics bufnr=0<cr>", desc = "Diagnostics" },
			{ "<leader>gh", "<cmd>Telescope git_bcommits<cr>", desc = "History" },
			{ "<leader>gc", "<cmd>Telescope git_commits<cr>", desc = "Commits" },
			{ "<leader>gb", "<cmd>Telescope git_branches<cr>", desc = "Branches" },
			{ "<leader>c", "<cmd>Telescope git_status<cr>", desc = "Git Changes" },
			{ "grD", "<cmd>Telescope lsp_declarations<cr>", desc = "Go to Declaration" },
			{ "grd", "<cmd>Telescope lsp_definitions<cr>", desc = "Go to Definition" },
			{ "gri", "<cmd>Telescope lsp_implementations<cr>", desc = "Go to Implementation" },
			{ "grr", "<cmd>Telescope lsp_references<cr>", desc = "Go to References" },
			{ "gO", "<cmd>Telescope lsp_dynamic_workspace_symbols<cr>", desc = "Symbols" },
			{ "<leader>q", "<cmd>Telescope quickfix<cr>", { desc = "Code Action" } },
		},
		opts = {
			defaults = {
				wrap_results = true,
			},
			pickers = {
				find_files = {
					find_command = { "rg", "--files", "--hidden", "-g", "!.git" },
				},
			},
		},
	},
	{
		"nvim-telescope/telescope-file-browser.nvim",
		dependencies = { "nvim-telescope/telescope.nvim", "nvim-lua/plenary.nvim" },
		config = function()
			require("telescope").load_extension("file_browser")
		end,
		keys = {
			{ "<leader>f", "<cmd>Telescope file_browser path=%:p:h select_buffer=true<cr>", desc = "File Browser" },
		},
	},
	{
		"debugloop/telescope-undo.nvim",
		dependencies = {
			"nvim-telescope/telescope.nvim",
			"nvim-lua/plenary.nvim",
		},
		keys = {
			{ "<leader>u", "<cmd>Telescope undo<cr>", desc = "Undo History" },
		},
		config = function()
			require("telescope").setup({
				extensions = {
					undo = {
						mappings = {
							i = {
								["<cr>"] = require("telescope-undo.actions").restore,
								["<C-y>"] = require("telescope-undo.actions").yank_deletions,
							},
						},
					},
				},
			})
			require("telescope").load_extension("undo")
		end,
	},
	{
		"nvim-telescope/telescope-symbols.nvim",
		dependencies = { "nvim-telescope/telescope.nvim" },
	},
	{
		"benfowler/telescope-luasnip.nvim",
		dependencies = { "nvim-telescope/telescope.nvim" },
		keys = {
			{ "<leader>s", "<cmd>Telescope luasnip<cr>", desc = "Snippets" },
		},
		config = function()
			require("telescope").load_extension("luasnip")
			local lst = require("telescope").extensions.luasnip
		end,
	},
	{
		"junegunn/fzf",
	},
	{
		"junegunn/fzf.vim",
		keys = {
			-- { "<leader><space>", "<cmd>Files<cr>", desc = "Find File" },
			-- { "<leader>/", "<cmd>Rg<cr>", desc = "Live Grep" },
		},
	},
}
