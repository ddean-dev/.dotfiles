return {
	{
		"mfussenegger/nvim-lint",
		dependencies = { "williamboman/mason.nvim" },
		config = function()
			require("lint").linters_by_ft = {
				javascript = { "eslint" },
				typescript = { "eslint" },
			}
			vim.api.nvim_create_autocmd({ "TextChanged", "BufWritePost", "BufEnter" }, {
				callback = function()
					require("lint").try_lint()
				end,
			})
		end,
	},
	{
		"rshkarin/mason-nvim-lint",
		dependencies = { "williamboman/mason.nvim", "mfussenegger/nvim-lint" },
		config = function()
			require("mason-nvim-lint").setup({
				ensure_installed = {
					"jsonlint", --json
					"eslint_d", --javascript,typescript
				},
				automatic_installation = true,
				quiet_mode = true,
			})
		end,
	},
}
