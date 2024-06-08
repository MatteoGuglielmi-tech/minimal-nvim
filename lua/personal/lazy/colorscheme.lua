return {
	{
		"folke/tokyonight.nvim",
		lazy = false,
		priority = 1000,
		config = function()
			require("tokyonight").setup({
				style = "moon", -- `storm`, `moon`, a darker variant `night` and `day`
				transparent = false, -- Enable this to disable setting the background color
				terminal_colors = true, -- Configure the colors used when opening a `:terminal` in [Neovim](https://github.com/neovim/neovim)
				styles = {
					comments = { italic = true },
					keywords = { italic = true, underline = true },
					functions = { bold = true, italic = true },
					variables = {},
					-- Background styles. Can be "dark", "transparent" or "normal"
					sidebars = "dark", -- style for sidebars, see below
					floats = "transparent", -- style for floating windows
				},
				sidebars = { "qf", "help" }, -- Set a darker background on sidebar-like windows. For example: `["qf", "vista_kind", "terminal", "packer"]`
				hide_inactive_statusline = false, -- Enabling this option, will hide inactive statuslines and replace them with a thin border instead. Should work with the standard **StatusLine** and **LuaLine**.
				dim_inactive = false, -- dims inactive windows
				lualine_bold = true, -- When `true`, section headers in the lualine theme will be bold
			})

			--vim.cmd [[
			--colorscheme tokyonight
			--]]
		end,
	},

	{
		"navarasu/onedark.nvim",
		name = "onedark",
		config = function()
			require("onedark").setup({
				style = "darker", --'dark', 'darker', 'cool', 'deep', 'warm', 'warmer' and 'light'
				transparent = false, -- Show/hide background
				term_colors = true,
				code_style = {
					comments = "italic",
					keywords = "italic,underline",
					functions = "bold,italic",
					strings = "none",
					variables = "none",
				},
			})

			--require('onedark').load()
			-- vim.cmd([[ colorscheme onedark ]])
		end,
	},

	{
		"rose-pine/neovim",
		name = "rose-pine",

		config = function()
			require("rose-pine").setup({
				variant = "moon", -- auto, main, moon, or dawn
				dark_variant = "moon", -- main, moon, or dawn
			})
			vim.cmd("colorscheme rose-pine-moon")
		end,
	},

	{
		"catppuccin/nvim",
		name = "catppuccin",
		lazy = false,
		priority = 1000,
		config = function()
			require("catppuccin").setup({
				term_colors = true,
				transparent_background = false,
				styles = {
					comments = { "italic" },
					conditionals = {},
					loops = { "bold" },
					functions = { "bold", "italic" },
					keywords = { "italic", "underline" },
					strings = {},
					variables = {},
					numbers = {},
					booleans = { "italic" },
					properties = {},
					types = {},
					operators = {},
				},
				-- color_overrides = {
				-- mocha = {
				-- base = "#000000",
				-- mantle = "#000000",
				-- crust = "#000000",
				-- },
				-- },
				integrations = {
					fidget = true,
					gitsigns = true,
					harpoon = true,
					indent_blankline = {
						enabled = false,
						scope_color = "sapphire",
						colored_indent_levels = false,
					},
					mason = true,
					neogit = true,
					cmp = true,
					dap = true,
					dap_ui = true,
					native_lsp = {
						enabled = true,
						virtual_text = {
							errors = { "italic" },
							hints = { "italic" },
							warnings = { "italic" },
							information = { "italic" },
						},
						underlines = {
							errors = { "underline" },
							hints = { "underline" },
							warnings = { "underline" },
							information = { "underline" },
						},
						inlay_hints = {
							background = true,
						},
						treesitter = true,
						telescope = true,
						lsp_trouble = true,
					},
				},
			})
			-- vim.cmd("colorscheme catppuccin")
		end,
	},
}
