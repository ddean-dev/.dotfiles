function _G.NewHelpSplit()
	if vim.bo.buftype == "help" or vim.bo.filetype == "man" then
		local origin_win = vim.fn.win_getid(vim.fn.winnr("#"))
		local help_win = vim.api.nvim_get_current_win()
		local help_buf = vim.fn.bufnr()
		vim.api.nvim_set_current_win(origin_win)
		vim.api.nvim_win_close(help_win, false)
		vim.cmd("vsplit")
		vim.api.nvim_win_set_buf(vim.api.nvim_get_current_win(), help_buf)
	end
end

vim.cmd([[
  augroup HelpSplit
    autocmd!
    autocmd WinNew * autocmd BufEnter * ++once lua _G.NewHelpSplit()
  augroup end
]])

return {}
