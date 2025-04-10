return {
	{
		"mfussenegger/nvim-dap",
		keys = {
			{
				"<f1>",
				function()
					require("dap").toggle_breakpoint()
				end,
				desc = "Breakpoint",
			},
			{
				"<f5>",
				function()
					require("dap").continue()
				end,
				desc = "Continue",
			},
			{
				"<f10>",
				function()
					require("dap").step_over()
				end,
				desc = "Step Over",
			},
			{
				"<f11>",
				function()
					require("dap").step_into()
				end,
				desc = "Step Into",
			},
			{
				"<f12>",
				function()
					require("dap").step_out()
				end,
				desc = "Step Out",
			},
			{
				"<leader>Do",
				function()
					require("dap").repl.toggle()
				end,
				desc = "Open REPL",
			},
		},
		config = function()
			vim.fn.sign_define("DapBreakpoint", { text = "", texthl = "DapBreakpoint" })
		end,
	},
	{
		"theHamsta/nvim-dap-virtual-text",
		config = function()
			require("nvim-dap-virtual-text").setup({})
		end,
	},
	{
		"nvim-telescope/telescope-dap.nvim",
		dependencies = "nvim-telescope/telescope.nvim",
		keys = {
			{ "<leader>Db", "<cmd>Telescope dap list_breakpoints<cr>", desc = "Breakpoints" },
			{ "<leader>Df", "<cmd>Telescope dap frames<cr>", desc = "Frames" },
			{ "<leader>Dv", "<cmd>Telescope dap variables<cr>", desc = "Variables" },
		},
		config = function()
			require("telescope").load_extension("dap")
		end,
	},
	{
		"rcarriga/nvim-dap-ui",
		dependencies = { "mfussenegger/nvim-dap", "nvim-neotest/nvim-nio" },
		keys = {
			{
				"<leader>DD",
				function()
					require("dapui").toggle({})
				end,
				desc = "Dap UI",
			},
		},
		config = function(_, opts)
			require("dapui").setup(opts)
		end,
	},
	{
		"nvim-neotest/neotest",
		dependencies = {
			"nvim-neotest/nvim-nio",
			"nvim-lua/plenary.nvim",
			"antoinemadec/FixCursorHold.nvim",
			"nvim-treesitter/nvim-treesitter",
			{ "fredrikaverpil/neotest-golang", version = "*" },
		},
		config = function()
			require("neotest").setup({
				adapters = {
					require("neotest-golang")({}),
				},
			})
		end,
		keys = {
			{
				"<leader>Dt",
				function()
					require("neotest").run.run()
				end,
				desc = "Run Test",
			},
			{
				"<leader>DT",
				function()
					require("neotest").run.run({ strategy = "dap" })
				end,
				desc = "Debug Test",
			},
		},
	},
	{
		"leoluz/nvim-dap-go",
		config = function()
			require("dap-go").setup()
		end,
	},
}
