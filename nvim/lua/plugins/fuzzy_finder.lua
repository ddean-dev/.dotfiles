return {
	{
		"junegunn/fzf",
	},
	{
		"ibhagwan/fzf-lua",
		dependencies = { "junegunn/fzf", "nvim-tree/nvim-web-devicons" },
		config = function()
			require("fzf-lua").register_ui_select()
		end,
		keys = {
			{
				"<leader><space>",
				function()
					require("fzf-lua").files()
				end,
				desc = "Find File",
			},
			{
				"<leader>/",
				function()
					require("fzf-lua").live_grep()
				end,
				desc = "Find in Directory",
			},
			{
				"<leader>b",
				function()
					require("fzf-lua").buffers()
				end,
				"<cmd>FzfLua Buffers<cr>",
				desc = "Buffers",
			},
			{
				"<leader>m",
				function()
					require("fzf-lua").marks()
				end,
				desc = "Marks",
			},
			{
				"<leader>j",
				function()
					require("fzf-lua").jumps()
				end,
				desc = "Jumplist",
			},
			{
				"<leader>.",
				function()
					require("fzf-lua").blines()
				end,
				desc = "Find in Buffer",
			},
			{
				"<leader>c",
				function()
					require("fzf-lua").git_status()
				end,
				desc = "Git Changes",
			},
			{
				"grD",
				function()
					require("fzf-lua").lsp_declarations()
				end,
				desc = "Go to Declaration",
			},
			{
				"grd",
				function()
					require("fzf-lua").lsp_definitions()
				end,
				desc = "Go to Definition",
			},
			{
				"gri",
				function()
					require("fzf-lua").lsp_implementations()
				end,
				desc = "Go to Implementation",
			},
			{
				"grr",
				function()
					require("fzf-lua").lsp_references()
				end,
				desc = "Go to References",
			},
			{
				"<leader>s",
				function()
					require("fzf-lua").lsp_document_symbols()
				end,
				desc = "Symbols",
			},
			{
				"<leader>d",
				function()
					require("fzf-lua").lsp_document_diagnostics()
				end,
				desc = "Diagnostics",
			},
			-- {
			-- 	"<leader>q",
			-- 	function()
			-- 		require("fzf-lua").lsp_code_actions()
			-- 	end,
			-- 	{ desc = "Code Action" },
			-- },
			{
				"<leader>u",
				function()
					require("fzf-lua").undotree()
				end,
				desc = "Undo History",
			},
			{
				"<leader>Db",
				function()
					require("fzf-lua").dap_breakpoints()
				end,
				desc = "Breakpoints",
			},
			{
				"<leader>Df",
				function()
					require("fzf-lua").dap_frames()
				end,
				desc = "Frames",
			},
			{
				"<leader>Dv",
				function()
					require("fzf-lua").dap_breakpoints()
				end,
				desc = "Variables",
			},
		},
	},
}
