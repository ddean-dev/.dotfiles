return {
	{
		"mfussenegger/nvim-lint",
		dependencies = { "williamboman/mason.nvim" },
		config = function()
			require("lint").linters_by_ft = {
				ts = { "eslint_d" },
				tx = { "eslint_d" },
				js = { "eslint_d" },
				jsx = { "eslint_d" },
			}
			vim.api.nvim_create_autocmd({ "TextChanged", "BufWritePost", "BufEnter" }, {
				callback = function()
					require("lint").try_lint(nil, { ignore_errors = false })
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
					"eslint_d", --javascript,typescript
					"staticcheck", --golang
				},
				ignore_install = {},
				automatic_installation = true,
				quiet_mode = true,
			})
		end,
	},
}
