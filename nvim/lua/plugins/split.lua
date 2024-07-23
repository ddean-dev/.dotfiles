local group = vim.api.nvim_create_augroup("HelpSplit", { clear = true })
vim.api.nvim_create_autocmd("WinNew", {
	group = group,
	callback = function()
		vim.api.nvim_create_autocmd("BufEnter", {
			group = group,
			once = true,
			callback = function()
				if vim.bo.buftype ~= "help" and vim.bo.filetype ~= "man" then
					return
				end

				local origin_win = vim.fn.win_getid(vim.fn.winnr("#"))
				local help_win = vim.api.nvim_get_current_win()
				local help_buf = vim.fn.bufnr()
				local width = vim.fn.winwidth(origin_win)

				if width <= 90 then
					return
				end

				vim.api.nvim_set_current_win(origin_win)
				vim.api.nvim_win_close(help_win, false)
				vim.cmd("vsplit")
				vim.api.nvim_win_set_buf(vim.api.nvim_get_current_win(), help_buf)
			end,
		})
	end,
})

return {}
