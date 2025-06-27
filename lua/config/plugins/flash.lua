return {
	"folke/flash.nvim",
	event = "VeryLazy",
	---@type Flash.Config
	opts = {},
	-- stylua: ignore
	keys = {
	  -- jump() allows to jump between tags
	  { "//", mode = { "n", "x", "o" }, function() require("flash").jump() end, desc = "Flash" },
	  -- treesitter() allows to select and jump among semantic block parsed by treesitter
	  { "S", mode = { "n" }, function() require("flash").treesitter() end, desc = "Flash Treesitter" },
	  -- remote() takes a motion, performs and operation and then the cursor goes back to previous location
	  -- e.g. ym<text to search><tag>y
	  -- this motion allows to copy the entire line wherein <text to search> is locted and then go bakc to initial line
	  { "m", mode = "o", function() require("flash").remote() end, desc = "remote flash" },
	},
}
