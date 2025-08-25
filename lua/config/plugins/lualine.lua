return {
	"nvim-lualine/lualine.nvim",
	dependencies = {
		{ "echasnovski/mini.icons" },
		{ "folke/noice.nvim" },
	},

	config = function()
		local lualine = require("lualine")

		lualine.setup({
			options = {
				theme = "auto", --"rose-pine",
				component_separators = { left = "", right = "" },
				section_separators = { left = "", right = "" },
			},
			sections = {
				lualine_a = { "mode" },
				lualine_b = {
					{ "branch", icon = "" },
					{
						"diff",
						colored = true,
						symbols = { added = "+", modified = "~", removed = "-" }, -- Changes the symbols used by the diff.
						source = nil,
					},
					{ "lsp_status" },
					{
						"diagnostics",
						sources = { "nvim_diagnostic" },
						sections = { "error", "warn", "info", "hint" },
						colored = true,
						update_in_insert = false,
						always_visible = false,
					},
					{ "filename", path = 1 },
				},
				lualine_c = {
					{
						require("noice").api.status.mode.get,
						cond = require("noice").api.status.mode.has,
						color = { fg = "#ff9e64" },
					},
				},
				lualine_x = {
					{ "encoding" },
					{
						"fileformat",
						symbols = {
							mac = "",
							unix = "",
						},
					},
					{ "filetype" },
				},
			},
			inactive_sections = {
				lualine_a = {},
				lualine_b = {},
				lualine_c = { "filename" },
				lualine_x = { "location" },
				lualine_y = {},
				lualine_z = {},
			},
		})
	end,
}
