return {
	"utilyre/barbecue.nvim",
	name = "barbecue",
	event = "BufEnter",
	version = "*",
	dependencies = {
		"SmiteshP/nvim-navic",
		{ "nvim-tree/nvim-web-devicons", opts = {} },
	},
	opts = {
		symbols = {
			-- separator = "", -- nightfox do not like this sep, tokyonight does
			separator = " ",
		},
		show_modified = true,
	},
	keys = {
		{
			"<leader>bt",
			function()
				require("barbecue.ui").toggle()
			end,
			desc = "[B]arbecue [T]oggle",
		},
	},
}
