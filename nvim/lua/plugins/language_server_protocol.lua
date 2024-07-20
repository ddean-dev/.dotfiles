return {
	{
		"williamboman/mason.nvim",
		config = function()
			require("mason").setup({
				ui = {
					border = "rounded",
				},
			})
		end,
	},
	{
		"folke/lazydev.nvim",
		ft = "lua",
		opts = {
			---@type boolean|(fun(root:string):boolean?)
			enabled = function(root_dir)
				local found = root_dir:find("/.dotfiles")
				return found ~= nil
			end,
		},
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
			lsp.setup({
				ensure_installed = {
					"typos_lsp", --spellcheck
					"marksman", --markdown
					"jsonls", --json
					"yamlls", --yaml
					"taplo", --toml

					"bashls", --bash
					"lua_ls", --lua

					"eslint", --javascript, typescript
					"tsserver", --typescript
					"cssls", --css

					"gopls", --go
					"pyright", --python
					"ruff_lsp", --python
					"rust_analyzer", --rust

					"docker_compose_language_service", --docker
					"dockerls", --docker
				},
				automatic_installation = true,
			})
			require("mason-lspconfig").setup_handlers({
				function(server_name)
					require("lspconfig")[server_name].setup({})
				end,
			})
		end,
	},
}
