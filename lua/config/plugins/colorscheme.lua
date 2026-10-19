return {
	{
		"rose-pine/neovim",
		lazy = false,
		priority = 1000,
		name = "rose-pine",
		-- enabled = false,
		config = function()
			-- @constant defaults to gold, identical to @string (rose-pine.lua:285/219).
			-- Repaint constants iris so ALL-CAPS names don't read as strings.
			require("rose-pine").setup({
				highlight_groups = {
					["@constant"] = { fg = "iris" },
					["@constant.builtin"] = { fg = "iris" },
				},
			})
			vim.cmd("colorscheme rose-pine-moon")
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
			require("catppuccin").setup({
				flavour = "macchiato", -- latte, frappe, macchiato, mocha
			})
			vim.cmd.colorscheme("catppuccin-nvim")
		end,
	},
}
