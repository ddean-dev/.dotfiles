return {
	{ "rafamadriz/friendly-snippets" },
	{
		"L3MON4D3/LuaSnip",
		dependencies = { "rafamadriz/friendly-snippets" },
		build = "make install_jsregexp",
		config = function()
			require("luasnip.loaders.from_vscode").lazy_load()
		end,
	},
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
	{
		"saghen/blink.cmp",
		dependencies = "rafamadriz/friendly-snippets",
		version = "*",
		---@module 'blink.cmp'
		---@type blink.cmp.Config
		opts = {
			keymap = { preset = "enter" },
			appearance = {
				use_nvim_cmp_as_default = true,
				nerd_font_variant = "mono",
			},
			completion = {
				accept = { auto_brackets = { enabled = false } },
				menu = { auto_show = false },
				documentation = { auto_show = true, auto_show_delay_ms = 500 },
				trigger = { show_on_trigger_character = true },
			},
			sources = {
				--default = { "lsp", "path", "snippets", "buffer" },
				default = { "lsp", "path", "snippets" },
			},
			snippets = { preset = "luasnip" },
			signature = { enabled = true },
		},
		opts_extend = { "sources.default" },
	},
}
