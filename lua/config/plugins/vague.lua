return {
	"vague2k/vague.nvim",
	lazy = false,
	priority = 100,
	config = function()
		require("vague").setup({
			plugins = {
				blink = {
					match = "bold",
					match_fuzzy = "bold",
				},
			},
		})

		vim.cmd("colorscheme vague")
	end,
}
