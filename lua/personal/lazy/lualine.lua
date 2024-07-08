return {
	"nvim-lualine/lualine.nvim",
	dependencies = { "nvim-tree/nvim-web-devicons" },

	config = function()
		local lualine = require("lualine")
		local lazy_status = require("lazy.status")

		local trouble = require("trouble")
		local symbols = trouble.statusline({
			mode = "lsp_document_symbols",
			groups = {},
			title = false,
			filter = { range = true },
			format = "{kind_icon} | {symbol.name:Normal}",
			hl_group = "lualine_c_normal",
		})

		lualine.setup({
			options = {
				theme = "monokai-pro", --"kanagawa" -- "onedark"
				component_separators = { left = "", right = "" },
				section_separators = { left = "", right = "" },
			},
			sections = {
				lualine_a = { "mode" },
				lualine_b = {
					{ "branch", icon = "" },
					"harpoon_component",
					{
						"diff",
						colored = true,
						diff_color = {
							added = "LuaLineDiffAdd", -- Changes the diff's added color
							modified = "LuaLineDiffChange", -- Changes the diff's modified color
							removed = "LuaLineDiffDelete", -- Changes the diff's removed color you
						},
						symbols = { added = "+", modified = "~", removed = "-" }, -- Changes the symbols used by the diff.
						source = nil,
					},
					{
						"diagnostics",
						sources = { "nvim_diagnostic" },
						sections = { "error", "warn", "info", "hint" },

						diagnostics_color = {
							error = "DiagnosticError", -- Changes diagnostics' error color.
							warn = "DiagnosticWarn", -- Changes diagnostics' warn color.
							info = "DiagnosticInfo", -- Changes diagnostics' info color.
							hint = "DiagnosticHint", -- Changes diagnostics' hint color.
						},
						-- symbols = { error = "E", warn = "W", info = "I", hint = "H" },
						colored = true, -- Displays diagnostics status in color if set to true.
						update_in_insert = false, -- Update diagnostics in insert mode.
						always_visible = false, -- Show diagnostics even if there are none.
					},
					{ "filename", path = 1 },
				},
				lualine_c = {
					{
						symbols.get,
						cond = symbols.has,
					},
				},
				lualine_x = {
					{
						lazy_status.updates,
						cond = lazy_status.has_updates,
						color = { fg = "#ff9e64" },
					},
					{ "encoding" },
					{
						"fileformat",
						symbols = {
							unix = "", -- e712
							dos = "", -- e70f
							mac = "", -- e711
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
