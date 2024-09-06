return {
	{
		"loctvl842/monokai-pro.nvim",
		config = function()
			require("monokai-pro").setup({
				transparent_background = false,
				terminal_colors = true,
				devicons = true, -- highlight the icons of `nvim-web-devicons`
				styles = {
					comment = { italic = true },
					keyword = { italic = true }, -- any other keyword
					type = { italic = true }, -- (preferred) int, long, char, etc
					storageclass = { italic = true }, -- static, register, volatile, etc
					structure = { italic = true }, -- struct, union, enum, etc
					parameter = { italic = true }, -- parameter pass in function
					annotation = { italic = true },
					tag_attribute = { italic = true }, -- attribute of tag in reactjs
				},
				filter = "spectrum", -- classic | octagon | pro | machine | ristretto | spectrum
				inc_search = "background", -- underline | background
				background_clear = {
					"float_win",
					"telescope",
					"nvim-tree",
				},
				plugins = {
					indent_blankline = {
						context_highlight = "default", -- default | pro
						context_start_underline = false,
					},
				},
			})
			-- vim.cmd([[colorscheme monokai-pro]])
		end,
	},

	{
		"catppuccin/nvim",
		name = "catppuccin",
		priority = 1000,
		config = function()
			require("catppuccin").setup({
				flavour = "macchiato", -- latte, frappe, macchiato, mocha
				background = { -- :h background
					light = "latte",
					dark = "mocha",
				},
				styles = { -- Handles the styles of general hi groups (see `:h highlight-args`):
					comments = { "italic" },
					conditionals = {},
					loops = { "underline" },
					functions = { "bold" },
					keywords = { "underdashed" },
					strings = {},
					variables = {},
					numbers = {},
					booleans = {},
					properties = { "italic" },
					types = {},
					operators = {},
					-- miscs = {}, -- Uncomment to turn off hard-coded styles
				},
				default_integrations = true,
				integrations = {
					cmp = true,
					gitsigns = true,
					treesitter = true,
					fidget = false,
					harpoon = false,
					indent_blankline = {
						enabled = true,
						scope_color = "lavender", -- catppuccin color (eg. `lavender`) Default: text
						colored_indent_levels = false,
					},
					mason = false,
					neogit = true,
					dap = true,
					dap_ui = true,
					native_lsp = {
						enabled = true,
						inlay_hints = {
							background = true,
						},
					},
					nvim_surround = false,
					telescope = {
						enabled = true,
					},
					lsp_trouble = false,
				},
			})

			-- setup must be called before loading
			vim.cmd.colorscheme("catppuccin")
		end,
	},

	{
		"folke/tokyonight.nvim",
		lazy = false,
		priority = 1000,
		config = function()
			require("tokyonight").setup({
				style = "storm",
				-- Change the "hint" color to the "orange" color, and make the "error" color bright red
				on_colors = function(colors)
					colors.hint = colors.orange
					colors.error = "#ff0000"
				end,
				on_highlights = function(hl, c)
					local prompt = "#2d3149"
					hl.TelescopeNormal = {
						bg = c.bg_dark,
						fg = c.fg_dark,
					}
					hl.TelescopeBorder = {
						bg = c.bg_dark,
						fg = c.bg_dark,
					}
					hl.TelescopePromptNormal = {
						bg = prompt,
					}
					hl.TelescopePromptBorder = {
						bg = prompt,
						fg = prompt,
					}
					hl.TelescopePromptTitle = {
						bg = prompt,
						fg = prompt,
					}
					hl.TelescopePreviewTitle = {
						bg = c.bg_dark,
						fg = c.bg_dark,
					}
					hl.TelescopeResultsTitle = {
						bg = c.bg_dark,
						fg = c.bg_dark,
					}
				end,
			})
			-- vim.cmd([[colorscheme tokyonight-storm]])
		end,
	},
	{
		"projekt0n/github-nvim-theme",
		lazy = false,
		priority = 1000,
		config = function()
			require("github-theme").setup({
				options = {
					compile_path = vim.fn.stdpath("cache") .. "/github-theme",
					styles = {
						comments = "italic",
						functions = "bold, underline",
						keywords = "bold",
						variables = "NONE",
						conditionals = "NONE",
						constants = "NONE",
						numbers = "NONE",
						operators = "NONE",
						strings = "italic",
						types = "NONE",
					},
				},
			})

			-- vim.cmd("colorscheme github_dark_dimmed")
			-- vim.cmd("colorscheme github_dark")
		end,
	},
}
