return {
	{
		"nanozuki/tabby.nvim",
		dependencies = "nvim-tree/nvim-web-devicons",
		config = function()
			vim.o.showtabline = 2
			vim.api.nvim_set_keymap("n", "<leader>tn", ":$tabnew<CR>", { noremap = true, desc = "New Tab" })
			vim.api.nvim_set_keymap("n", "<leader>tq", ":tabclose<CR>", { noremap = true, desc = "Close Tab" })
			vim.api.nvim_set_keymap("n", "<leader>t[", ":-tabmove<CR>", { noremap = true, desc = "Move Prev" })
			vim.api.nvim_set_keymap("n", "<leader>t]", ":+tabmove<CR>", { noremap = true, desc = "Move Next" })
			vim.api.nvim_set_keymap("n", "<leader>1", "1gt", { noremap = true })
			vim.api.nvim_set_keymap("n", "<leader>2", "2gt", { noremap = true })
			vim.api.nvim_set_keymap("n", "<leader>3", "3gt", { noremap = true })
			vim.api.nvim_set_keymap("n", "<leader>4", "4gt", { noremap = true })
			vim.api.nvim_set_keymap("n", "<leader>5", "5gt", { noremap = true })

			local theme = {
				fill = "TabLineFill",
				head = "TabLine",
				current_tab = "TabLineSel",
				tab = "TabLine",
				win = "TabLine",
				tail = "TabLine",
			}
			require("tabby").setup({
				option = {
					theme = theme,
					nerdfont = true,
					buf_name = {
						mode = "unique",
					},
				},
				line = function(line)
					return {
						{
							{ "   ", hl = theme.head },
							line.sep(" ", theme.head, theme.fill),
						},
						line.tabs().foreach(function(tab)
							local hl = tab.is_current() and theme.current_tab or theme.tab
							local icon = ""
							local curWin = tab.wins().filter(function(win)
								return win.is_current()
							end).wins[1]
							if curWin then
								icon = curWin.file_icon() or ""
							end
							return {
								"",
								tab.number(),
								"",
								icon,
								tab.name(),
								tab.close_btn(""),
								line.sep(" ", hl, theme.fill),
								hl = hl,
								margin = " ",
							}
						end),
						line.spacer(),
						hl = theme.fill,
					}
				end,
			})
		end,
	},
}
