return {
	"numToStr/Comment.nvim",
	event = "VeryLazy",
	config = function()
		require("Comment").setup()
		vim.keymap.set(
			"n",
			"<leader>/",
			'<cmd>lua require("Comment.api").toggle.linewise.current()<CR>',
			{ desc = "Comment line" }
		)
	end,
}
