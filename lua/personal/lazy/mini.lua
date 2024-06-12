return {
	"echasnovski/mini.nvim",
	version = "*",
	config = function()
		require("mini.ai").setup({
			mappings = {
				around = "a",
				inside = "i",
				goto_left = "g[",
				goto_right = "g]",
			},
			n_lines = 500,
		})

		require("mini.surround").setup({
			mappings = {
				add = "sa", -- Add surrounding in Normal and Visual modes
				delete = "sd", -- Delete surrounding
				find = "sf", -- Find surrounding (to the right)
				find_left = "sF", -- Find surrounding (to the left)
				highlight = "sH", -- Highlight surrounding
				replace = "sr", -- Replace surrounding
				update_n_lines = "sn", -- Update `n_lines`

				suffix_last = "l", -- Suffix to search with "prev" method
				suffix_next = "n", -- Suffix to search with "next" method
			},
		})
	end,
}
