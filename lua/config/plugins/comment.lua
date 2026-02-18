return {
	"numToStr/Comment.nvim",
	event = "VeryLazy",
	config = function()
		require("Comment").setup({
			mappings = {
				basic = false,
				extra = false,
			},
		})

		--- normal mode
		vim.keymap.set(
			"n",
			"gcc",
			'<cmd>lua require("Comment.api").toggle.linewise.current()<CR>',
			{ desc = "Comment line" }
		)
		vim.keymap.set(
			"n",
			"gca",
			'<cmd>lua require("Comment.api").insert.linewise.eol()<CR>',
			{ desc = "Append comment to eol" }
		)

		--- Visual mode
		vim.keymap.set("x", "gc", "<Plug>(comment_toggle_linewise_visual)")
	end,
}
