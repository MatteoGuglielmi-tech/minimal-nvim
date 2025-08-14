-- `ds` - delete a surrounding
-- `cs` - change a surrounding
-- `ys` - add a surrounding ( needs an action afterwards )
-- `yss` - add a surrounding to the current line
-- `ySS` - add a surrounding and place the surrounded text on a new line

return {
	"kylechui/nvim-surround",
	version = "^3.0.0",
	event = "VeryLazy",
	config = function()
		require("nvim-surround").setup({
			-- general rule is that if the key ends in "_line", the delimiter pair is added on new lines.
			-- If the key ends in "_cur", the surround is performed around the current line.
			keymaps = {
				normal = "ys",
				normal_cur = "yss",
				visual = "w",
				delete = "ds",
				change = "cs",
			},
		})

	end,
}
