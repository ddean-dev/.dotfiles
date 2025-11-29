return {
	{
		"folke/lazydev.nvim",
		ft = "lua",
		opts = {
			enabled = function(root_dir)
				local found = root_dir:find("/.dotfiles")
				return found ~= nil
			end,
		},
	},
	{
		"neovim/nvim-lspconfig",
		dependencies = { "folke/neodev.nvim", "saghen/blink.cmp" },
		config = function()
			local useDefaults = {
				"typos_lsp", --spellcheck

				"marksman", --markdown
				"jsonls", --json
				"taplo", --toml

				"bashls", --bash
				"lua_ls", --lua

				"eslint", --javascript, typescript
				"ts_ls", --typescript
				"cssls", --css

				"gopls", --go
				"golangci_lint_ls", --go
				"pyright", --python
				"ruff", --python
				"rust_analyzer", --rust

				"docker_compose_language_service", --docker
				"dockerls", --docker
			}
			for _, server_name in pairs(useDefaults) do
				local lspserver = require("lspconfig")[server_name]
				if lspserver.setup then
					lspserver.setup({})
				end
			end
			vim.diagnostic.config({
				virtual_lines = {
					current_line = true,
				},
				float = {
					scope = "cursor",
				},
				underline = true,
				signs = {
					text = {
						[vim.diagnostic.severity.ERROR] = " ",
						[vim.diagnostic.severity.WARN] = " ",
						[vim.diagnostic.severity.HINT] = " ",
						[vim.diagnostic.severity.INFO] = " ",
					},
					linehl = {
						[vim.diagnostic.severity.ERROR] = "DiagnosticSignError",
						[vim.diagnostic.severity.WARN] = "DiagnosticSignWarn",
						[vim.diagnostic.severity.HINT] = "DiagnosticSignHint",
						[vim.diagnostic.severity.INFO] = "DiagnosticSignInfo",
					},
					numhl = {
						[vim.diagnostic.severity.ERROR] = "DiagnosticSignError",
						[vim.diagnostic.severity.WARN] = "DiagnosticSignWarn",
						[vim.diagnostic.severity.HINT] = "DiagnosticSignHint",
						[vim.diagnostic.severity.INFO] = "DiagnosticSignInfo",
					},
				},
			})
		end,
	},
	{
		"elixir-tools/elixir-tools.nvim",
		event = { "BufReadPre", "BufNewFile" },
		config = function()
			require("elixir").setup({
				nextls = { enable = true },
				elixirls = { enable = true },
				projectionist = { enable = true },
			})
		end,
	},
}
