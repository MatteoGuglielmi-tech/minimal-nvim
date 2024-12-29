return {
	"catppuccin/nvim",
	name = "catppuccin",
	priority = 1000,
	config = function()
		require("catppuccin").setup({
			flavour = "frappe", -- latte, frappe, macchiato, mocha
			background = {
				light = "latte",
				dark = "frappe",
			},
			styles = { -- Handles the styles of general hi groups (see `:h highlight-args`):
				comments = { "italic" },
				conditionals = {},
				loops = { "underline" },
				functions = { "italic" },
				keywords = {},
				strings = {},
				variables = {},
				numbers = {},
				booleans = {},
				properties = {},
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
}
