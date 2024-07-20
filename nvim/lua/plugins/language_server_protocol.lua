return {
	{
		"williamboman/mason.nvim",
		config = function()
			require("mason").setup({})
		end,
	},
	{
		"folke/neodev.nvim",
		config = function()
			require("neodev").setup({
				override = function(root_dir, library)
					if root_dir:find("/.dotfiles", 1, true) == 1 then
						library.enabled = true
						library.plugins = true
					end
				end,
			})
		end,
	},
	{
		"neovim/nvim-lspconfig",
		dependencies = { "folke/neodev.nvim" },
		config = function()
			vim.api.nvim_create_autocmd("LspAttach", {
				callback = function()
					vim.keymap.set("n", "K", vim.lsp.buf.hover, { desc = "Hover" })
					vim.keymap.set({ "n", "i" }, "<C-k>", vim.lsp.buf.signature_help, { desc = "Signature Help" })
					vim.keymap.set("n", "<leader>q", vim.lsp.buf.code_action, { desc = "Code Action" })
					vim.keymap.set("n", "<leader>r", vim.lsp.buf.rename, { desc = "Rename" })
				end,
			})
		end,
	},
	{
		"williamboman/mason-lspconfig.nvim",
		config = function()
			local lsp = require("mason-lspconfig")
			lsp.setup()
			require("mason-lspconfig").setup_handlers({
				function(server_name)
					require("lspconfig")[server_name].setup({})
				end,
			})
		end,
	},
}
