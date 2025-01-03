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
			-- separator = "",  -- nightfox do not like this sep, tokyonight does
			separator = " ",
		},
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

	-- config = function()
	-- 	local paint = require("config.colors").getColorizedString
	-- 	require("barbecue").setup({
	-- 		symbols = {
	-- 			-- separator = "",  -- nightfox do not like this sep, tokyonight does
	-- 			-- separator = require("config.colors").getColorizedString(" ", "yellow"),
	-- 			separator = paint(" ", "yellow"),
	-- 		},
	-- 	})
	-- end,
}
