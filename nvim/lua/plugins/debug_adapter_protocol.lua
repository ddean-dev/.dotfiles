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
		"jay-babu/mason-nvim-dap.nvim",
		dependencies = {
			"williamboman/mason.nvim",
			"mfussenegger/nvim-dap",
		},
		config = function()
			require("mason-nvim-dap").setup({
				ensure_installed = {
					"firefox-debug-adapter", --browser
					"js-debug-adapter", --javascript
					"codelldb", --rust
					"debugpy", --python
					"delve", --go
				},
				automatic_installation = true,
				handlers = {},
			})
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
}
