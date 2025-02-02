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
			["<C-f>"] = { "snippet_forward", "fallback" },
			["<C-b>"] = { "snippet_backward", "fallback" },
			["<C-s>"] = { "show_signature", "hide_signature", "fallback" },
			["<C-u>"] = { "scroll_documentation_up", "fallback" },
			["<C-d>"] = { "scroll_documentation_down", "fallback" },
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
				draw = {
					-- 	columns = {
					-- 		{ "label", "label_description", gap = 1 },
					-- 		{ "kind_icon", "kind" },
					-- 	},
					components = {
						kind_icon = {
							ellipsis = false,
							text = function(ctx)
								local kind_icon, _, _ = require("mini.icons").get("lsp", ctx.kind)
								return kind_icon
							end,

							-- use highlights from mini
							highlight = function(ctx)
								local _, hl, _ = require("mini.icons").get("lsp", ctx.kind)
								return hl
							end,
						},
					},
				},
			},

			ghost_text = { enabled = false },
			documentation = { auto_show = true, auto_show_delay_ms = 500 },
		},
	},
	-- opts_extend = { "sources.default" },
}
