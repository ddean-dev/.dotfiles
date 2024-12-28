return {
	{
		"lewis6991/gitsigns.nvim",
		config = function()
			require("gitsigns").setup({
				signcolumn = true,
				numhl = false,
				signs_staged_enabled = true,
				word_diff = false,
				current_line_blame = true,
				current_line_blame_opts = {
					virt_text_pos = "right_align",
					ignore_whitespace = true,
				},
				current_line_blame_formatter = "<author>, <author_time:%Y-%m-%d> ",
				on_attach = function()
					local gitsigns = require("gitsigns")
					-- Navigation
					vim.keymap.set("n", "]g", "<cmd>Gitsigns next_hunk<CR>", { desc = "Next git change" })
					vim.keymap.set("n", "[g", "<cmd>Gitsigns prev_hunk<CR>", { desc = "Prev git change" })
					vim.keymap.set("n", "<leader>gu", ":Gitsigns reset_hunk<CR>", { desc = "Undo Changes" })
					vim.keymap.set({ "o", "x" }, "ig", ":<C-U>Gitsigns select_hunk<CR>", { desc = "Select Hunk" })
					vim.keymap.set({ "o", "x" }, "ag", ":<C-U>Gitsigns select_hunk<CR>", { desc = "Select Hunk" })
					vim.keymap.set("n", "<leader>gd", gitsigns.preview_hunk, { desc = "Diff Hunk" })
					vim.keymap.set("n", "<leader>gb", gitsigns.blame_line, { desc = "Blame Line" })
					vim.keymap.set("n", "<leader>gs", gitsigns.stage_hunk, { desc = "Stage Hunk" })
				end,
				diff_opts = {
					ignore_whitespace = true,
					algorithm = "histogram",
					internal = true,
				},
			})
		end,
	},
}
