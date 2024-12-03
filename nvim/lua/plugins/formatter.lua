return {
	"williamboman/mason.nvim",
	{
		"stevearc/conform.nvim",
		config = function()
			require("conform").setup({
				formatters_by_ft = {
					lua = { "stylua" },
					javascript = { "prettier" },
					typescript = { "prettier" },
					jsx = { "prettier" },
					tsx = { "prettier" },
					html = { "prettier" },
					css = { "prettier" },
					json = { "prettier" },
					yaml = { "prettier" },
					go = { "goimports", "gofmt" },
					shell = { "shfmt" },
					proto = { "buf" },
				},
			})
			vim.keymap.set({ "i", "x", "n", "s" }, "<M-s>", "<cmd>up<cr><esc>", { desc = "Save file" })
			vim.keymap.set({ "i", "x", "n", "s" }, "<C-s>", function()
				vim.cmd.stopinsert()
				require("conform").format({
					lsp_fallback = true,
					timeout_ms = 500,
				})
				vim.cmd.up()
			end, { desc = "Save file" })
		end,
	},
	{
		"zapling/mason-conform.nvim",
		config = function()
			require("mason-conform").setup()
		end,
	},
}
