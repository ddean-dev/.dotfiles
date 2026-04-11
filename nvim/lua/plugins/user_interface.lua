return {
	{
		"folke/noice.nvim",
		dependencies = { "MunifTanjim/nui.nvim", "rcarriga/nvim-notify" },
		event = "VeryLazy",
		opts = {
			lsp = {
				override = {
					["vim.lsp.util.convert_input_to_markdown_lines"] = true,
					["cmp.entry.get_documentation"] = true,
				},
			},
			presets = {
				command_palette = false,
				long_message_to_split = true,
				inc_rename = true,
				lsp_doc_border = true,
			},
		},
	},
	{ "stevearc/dressing.nvim" },
	{
		"rcarriga/nvim-notify",
		opts = {
			stages = "static",
		},
		keys = {
			{
				"<leader>n",
				function()
					local colors = {
						[vim.log.levels.ERROR] = "NotifyERRORTitle",
						["ERROR"] = "NotifyERRORTitle",
						[vim.log.levels.WARN] = "NotifyWARNTitle",
						["WARN"] = "NotifyWARNTitle",
						[vim.log.levels.INFO] = "NotifyINFOTitle",
						["INFO"] = "NotifyINFOTitle",
						[vim.log.levels.DEBUG] = "NotifyDEBUGTitle",
						["DEBUG"] = "NotifyDEBUGTitle",
						[vim.log.levels.TRACE] = "NotifyTRACETitle",
						["TRACE"] = "NotifyTRACETitle",
					}
					require("notify").dismiss({ silent = true, pending = true })
					require("fzf-lua").fzf_exec(function(next)
						local hist = require("notify").history()
						for i = #hist, 1, -1 do
							local notif = hist[i]
							local msg = notif.icon
							for _, value in ipairs(notif.title) do
								msg = msg .. " " .. value
							end
							for _, value in ipairs(notif.message) do
								msg = msg .. "\n" .. value
							end
							msg = require("fzf-lua").utils.ansi_from_hl(colors[notif.level], msg)
							next(msg)
						end
						next()
					end, {
						color_icons = true,
						fzf_opts = {
							["--read0"] = "",
							["--gap"] = "",
							["--wrap"] = "",
						},
					})
				end,
				desc = "Notifications",
			},
		},
	},
	{
		"folke/which-key.nvim",
		event = "VeryLazy",
		config = function()
			local wk = require("which-key")
			wk.setup({
				preset = "modern",
				plugins = { spelling = true },
				spec = {
					{ "<leader>g", group = "Git" },
					{ "<leader>t", group = "Tab" },
					{ "<leader>D", group = "Debugger" },
					{ "<leader>1", hidden = true },
					{ "<leader>2", hidden = true },
					{ "<leader>3", hidden = true },
					{ "<leader>4", hidden = true },
					{ "<leader>5", hidden = true },
				},
			})
		end,
	},
	{
		"sphamba/smear-cursor.nvim",
		opts = {},
	},
}
