return {
	"saghen/blink.cmp",
	dependencies = {
		"rafamadriz/friendly-snippets",
		"echasnovski/mini.icons",
		"moyiz/blink-emoji.nvim",
		-- "milanglacier/minuet-ai.nvim",
		"folke/lazydev.nvim",
	},
	version = "1.*",
	opts = {
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
			default = { "lsp", "path", "snippets", "buffer", "emoji", "lazydev" },
			providers = {
				emoji = {
					module = "blink-emoji",
					name = "Emoji",
					score_offset = 15,
					opts = {
						insert = true,
						---@type string|table|fun():table
						trigger = function()
							return { ":" }
						end,
					},
				},
				-- minuet = {
				-- 	name = "minuet",
				-- 	module = "minuet.blink",
				-- 	async = true,
				-- 	timeout_ms = 3000,
				-- 	score_offset = 50,
				-- },
				lazydev = {
					name = "LazyDev",
					module = "lazydev.integrations.blink",
					score_offset = 100,
				},
			},
		},

		-- non-default opts
		completion = {
			accept = { auto_brackets = { enabled = true } },
			-- trigger = { prefetch_on_insert = false },
			menu = {
				auto_show = true,
				draw = {
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
		-- opts_extend = { "sources.default" },
	},
}
