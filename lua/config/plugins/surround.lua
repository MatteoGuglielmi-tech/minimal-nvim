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
			keymaps = {
				normal = "yw",
				normal_cur = "yww",
				visual = "w",
				delete = "dw",
				change = "cw",
			},
		})

	end,
}
