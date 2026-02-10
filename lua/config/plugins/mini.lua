return {
	"nvim-mini/mini.nvim",
	version = false,
	config = function()
		require("mini.ai").setup({
			custom_textobjects = {
				-- Disable mini.ai defaults that conflict with your treesitter-textobjects
				a = false,
				f = false,
			},
		})
	end,
}
