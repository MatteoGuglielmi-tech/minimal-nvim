-- INFO: in the following, default mappings:
-- `ds` - delete a surrounding
-- `cs` - change a surrounding
-- `ys` - add a surrounding
-- `yS` - add a surrounding and place the surrounded text on a new line + indent insert
-- `yss` - add a surrounding to the whole visual_line
-- `ySs` - add a surrounding to the whole visual_block
-- `ySS` - same as `ySs`

-- INFO: examples of usage with 'Hello world' string:
-- 'iw' - inner word --> ("ysiw]" with cursor on 'Hello') 'Hello world!' --> '[Hello] world'
-- "yss)" - surround whole line with brackets --> 'Hello world!' --> '(Hello world!)'

return {
	"kylechui/nvim-surround",
	event = "VeryLazy",
	config = function()
		require("nvim-surround").setup({
			keymaps = { -- vim-surround style keymaps
				insert = "<C-g>s",
				insert_line = "<C-g>S",
				normal = "s",
				normal_cur = "ss",
				normal_line = "S",
				normal_cur_line = "SS",
				visual = "s",
				visual_line = "gS",
				delete = "ds",
				change = "cs",
			},
		})

		vim.cmd([[nmap <leader>' siw']])
	end,
}
