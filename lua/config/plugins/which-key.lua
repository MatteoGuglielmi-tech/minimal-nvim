return {
	"folke/which-key.nvim",
	event = "VeryLazy",
	config = function()
		local wk = require("which-key")
		wk.setup({
			plugins = {
				spelling = { enabled = true },
				presets = {
					operators = false,
					motions = false,
					windows = false,
				},
			},
		})
	end,
}
