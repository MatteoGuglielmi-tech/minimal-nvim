return {
	"tjdevries/present.nvim",
	lazy = true,
	opts = {},
	keys = {
		{
			"<leader>sp",
			function()
				require("present").start_presentation({})
			end,
			mode = "n",
			desc = "[S]tart [P]resentastion",
		},
	},
}
