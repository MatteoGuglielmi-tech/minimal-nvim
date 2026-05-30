return {
  {
    name = "darcula",
    dir = vim.fn.stdpath("config"),
    lazy = false,
    enabled = false,
    priority = 1000,
    config = function()
        vim.cmd.colorscheme("darcula")
      end,
  },

	{
		"rose-pine/neovim",
		lazy = false,
		priority = 1000,
		name = "rose-pine",
		config = function()
			vim.cmd("colorscheme rose-pine")
		end,
	},

	{
		"Aejkatappaja/sora",
		lazy = false,
		priority = 1000,
		enabled = false,
		opts = {},
		config = function(_, opts)
			require("sora").setup(opts)
			vim.cmd("colorscheme sora")
		end,
	},

	{
		"catppuccin/nvim",
		name = "catppuccin",
		priority = 1000,
		lazy = false,
		enabled = false,
		config = function()
			vim.cmd.colorscheme("catppuccin-macchiato")
		end,
	},
}
