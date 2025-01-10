return {
	"saghen/blink.cmp",
	dependencies = {
		"rafamadriz/friendly-snippets",
		"echasnovski/mini.icons",
	},

	version = "*",

	opts = {
		-- default opts
		keymap = {
			preset = "default",
			["<C-f>"] = { "snippet_forward" },
			["<C-b>"] = { "snippet_backward" },
		},

		appearance = {
			use_nvim_cmp_as_default = true,
			nerd_font_variant = "mono",
		},
		signature = { enabled = true },

		sources = {
			default = { "lsp", "path", "snippets", "buffer" },
			-- disable blink completion on cmdline
			-- cmdline = {},
		},

		-- non-default opts
		completion = {
			accept = { auto_brackets = { enabled = true } },

			menu = {
				auto_show = true,
				-- draw = {
				-- 	columns = {
				-- 		{ "label", "label_description", gap = 1 },
				-- 		{ "kind_icon", "kind" },
				-- 	},
				-- },
			},

			ghost_text = { enabled = false },
			documentation = { auto_show = true, auto_show_delay_ms = 500 },
		},
	},
	opts_extend = { "sources.default" },
}
