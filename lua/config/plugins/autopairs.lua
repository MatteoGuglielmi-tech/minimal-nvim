return {
	"windwp/nvim-autopairs",
	event = "InsertEnter",
	dependencies = { "saghen/blink.cmp" },
	config = function()
		require("nvim-autopairs").setup({})
	end,
}
