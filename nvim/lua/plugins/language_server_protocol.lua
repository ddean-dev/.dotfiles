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
				"wowlua_ls", --wowlua

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

			--setup custom provider wowlua_ls
			vim.lsp.config("wowlua_ls", {
				cmd = { "wowlua_ls" },
				filetypes = { "lua" },
				root_markers = { ".wowluarc.json" },
				root_dir = function(bufnr, on_dir)
					local root_markers = { ".wowluarc.json" }
					local cwd = vim.fs.root(bufnr, root_markers)
					if cwd then
						on_dir(cwd)
					end
				end,
				workspace_required = false,
			})

			--disable lua_ls if wowlua_ls active
			vim.lsp.config("lua_ls", {
				root_dir = function(bufnr, on_dir)
					if vim.fs.root(bufnr, { ".wowluarc.json" }) then
						return
					end
					on_dir(vim.fs.root(bufnr, { ".luarc.json" }) or vim.fn.getcwd())
				end,
			})

			--enable servers
			for _, server_name in pairs(useDefaults) do
				vim.lsp.enable(server_name)
			end

			--config diagnostics
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
}
