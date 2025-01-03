return {
	"nvim-lualine/lualine.nvim",
	-- dependencies = { "nvim-tree/nvim-web-devicons" },
	dependencies = {
		{
			"echasnovski/mini.icons",
			version = "*",
			config = function()
				require("mini.icons").setup()
			end,
		},
	},

	config = function()
		local lualine = require("lualine")
		-- local lazy_status = require("lazy.status")

		local trouble = require("trouble")
		local symbols = trouble.statusline({
			mode = "lsp_document_symbols",
			groups = {},
			title = false,
			filter = { range = true },
			format = "{kind_icon}{symbol.name}||",
			hl_group = "lualine_c_normal",
		})

		lualine.setup({
			options = {
				theme = "duskfox", --"tokyonight", --"monokai-pro", --"kanagawa" -- "onedark"
				component_separators = { left = "", right = "" },
				section_separators = { left = "", right = "" },
			},
			sections = {
				lualine_a = { "mode" },
				lualine_b = {
					{ "branch", icon = "" },
					-- "harpoon_component",
					{
						"diff",
						colored = true,
						symbols = { added = "+", modified = "~", removed = "-" }, -- Changes the symbols used by the diff.
						source = nil,
					},
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
						symbols.get,
						-- cond = symbols.has,
					},
				},
				lualine_x = {
					-- {
					-- 	lazy_status.updates,
					-- 	cond = lazy_status.has_updates,
					-- 	color = { fg = "#ff9e64" },
					-- },
					{ "encoding" },
					{
						"fileformat",
						symbols = {
							unix = "", -- e712
							-- dos = "", -- e70f
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
