return {
	{
		"mfussenegger/nvim-lint",
		config = function()
			require("lint").linters_by_ft = {
				ts = { "eslint_d" },
				tx = { "eslint_d" },
				js = { "eslint_d" },
				jsx = { "eslint_d" },
				go = { "golangcilint" },
			}
			vim.api.nvim_create_autocmd({ "TextChanged", "BufWritePost", "BufEnter" }, {
				callback = function()
					require("lint").try_lint(nil, { ignore_errors = false })
				end,
			})
		end,
	},
}
