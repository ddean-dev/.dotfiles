return {
	{
		"hrsh7th/nvim-cmp",
		event = "InsertEnter",
		dependencies = {
			"hrsh7th/cmp-nvim-lsp",
			"hrsh7th/cmp-buffer",
			"hrsh7th/cmp-path",
			"hrsh7th/cmp-nvim-lsp-signature-help",
			"L3MON4D3/LuaSnip",
		},
		opts = function()
			vim.api.nvim_set_hl(0, "CmpGhostText", { link = "Comment", default = true })
			local cmp = require("cmp")
			local luasnip = require("luasnip")
			local defaults = require("cmp.config.default")()
			return {
				completion = {
					completeopt = "menu,menuone,noinsert",
				},
				mapping = cmp.mapping.preset.insert({
					["<C-Space>"] = cmp.mapping.complete(),
					["<CR>"] = cmp.mapping.confirm({
						select = true,
						behavior = cmp.ConfirmBehavior.Replace,
					}),
					["<esc>"] = function(fallback)
						if cmp.visible() then
							cmp.abort()
						else
							fallback()
						end
					end,
					["<Tab>"] = cmp.mapping(function(fallback)
						if luasnip.locally_jumpable(1) then
							luasnip.jump(1)
						else
							fallback()
						end
					end, { "i", "s" }),
					["<S-Tab>"] = cmp.mapping(function(fallback)
						if luasnip.locally_jumpable(-1) then
							luasnip.jump(-1)
						else
							fallback()
						end
					end, { "i", "s" }),
				}),
				sources = cmp.config.sources({
					{ name = "nvim_lsp" },
					{ name = "luasnip" },
					{ name = "path" },
				}),
				sorting = defaults.sorting,
				snippet = {
					expand = function(args)
						require("luasnip").lsp_expand(args.body)
					end,
				},
			}
		end,
		config = function(_, opts)
			for _, source in ipairs(opts.sources) do
				source.group_index = source.group_index or 1
			end
			require("cmp").setup(opts)
		end,
	},
	{ "rafamadriz/friendly-snippets" },
	{
		"L3MON4D3/LuaSnip",
		dependencies = { "rafamadriz/friendly-snippets" },
		build = "make install_jsregexp",
		config = function()
			require("luasnip.loaders.from_vscode").lazy_load()
		end,
	},
	"hrsh7th/cmp-nvim-lsp",
	"hrsh7th/cmp-buffer",
	"hrsh7th/cmp-cmdline",
	{
		"danymat/neogen",
		config = function()
			require("neogen").setup({ snippet_engine = "luasnip" })
		end,
		version = "*",
		keys = {
			{
				"<leader>a",
				function()
					require("neogen").generate()
				end,
				desc = "Annotate",
			},
		},
	},
}
