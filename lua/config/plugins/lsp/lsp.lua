return {
	"neovim/nvim-lspconfig",
	dependencies = {
		{
			"folke/lazydev.nvim",
			ft = "lua",
			opts = {
				library = { { path = "${3rd}/luv/library", words = { "vim%.uv" } } },
			},
		},
		{ "antosha417/nvim-lsp-file-operations", config = true },
		{ "saghen/blink.cmp" },
		{ "williamboman/mason.nvim" },
		{ "williamboman/mason-lspconfig.nvim" },
		{ "WhoIsSethDaniel/mason-tool-installer.nvim" },
		{ "j-hui/fidget.nvim", opts = {} },
		{
			"stevearc/dressing.nvim",
			opts = {},
			dependencies = { "MunifTanjim/nui.nvim" },
		},
		{
			"SmiteshP/nvim-navbuddy",
			dependencies = {
				"SmiteshP/nvim-navic",
				"MunifTanjim/nui.nvim",
			},
			config = function()
				local navbuddy = require("nvim-navbuddy")
				local actions = require("nvim-navbuddy.actions")
				navbuddy.setup({
					lsp = { auto_attach = true },
					use_defualt_mappings = false,
					mappings = {
						["q"] = actions.close(),

						["j"] = actions.next_sibling(), -- down
						["k"] = actions.previous_sibling(), -- up

						["h"] = actions.parent(), -- Move to left panel
						["l"] = actions.children(), -- Move to right panel
						["0"] = actions.root(), -- Move to first panel

						["v"] = actions.visual_name(), -- Visual selection of name
						["V"] = actions.visual_scope(), -- Visual selection of scope

						["y"] = actions.yank_name(), -- Yank the name to system clipboard "+
						["Y"] = actions.yank_scope(), -- Yank the scope to system clipboard "+

						["i"] = actions.insert_name(), -- Insert at start of name
						["I"] = actions.insert_scope(), -- Insert at start of scope

						["a"] = actions.append_name(), -- Insert at end of name
						["A"] = actions.append_scope(), -- Insert at end of scope

						["r"] = actions.rename(), -- Rename currently focused symbol

						["d"] = actions.delete(), -- Delete scope

						["f"] = actions.fold_create(), -- Create fold of current scope
						["F"] = actions.fold_delete(), -- Delete fold of current scope

						["c"] = actions.comment(), -- Comment out current scope

						["<enter>"] = actions.select(), -- Goto selected symbol

						["J"] = actions.move_down(), -- Move focused node down
						["K"] = actions.move_up(), -- Move focused node up

						["s"] = actions.toggle_preview(), -- Show preview of current node

						["<C-v>"] = actions.vsplit(), -- Open selected node in a vertical split
						["<C-s>"] = actions.hsplit(), -- Open selected node in a horizontal split

						["t"] = actions.telescope({ -- Fuzzy finder at current level.
							layout_config = { -- All options that can be
								height = 0.60, -- passed to telescope.nvim's
								width = 0.60, -- default can be passed here.
								prompt_position = "top",
								preview_width = 0.50,
							},
							layout_strategy = "horizontal",
						}),

						["?"] = actions.help(), -- Open mappings help window
					},
				})
			end,
		},
	},

	config = function(_, opts)
		local icons = require("config.icons")
		local severity = vim.diagnostic.severity

		vim.diagnostic.config({
			signs = {
				text = {
					[severity.ERROR] = icons.diagnostics.BoldError,
					[severity.WARN] = icons.diagnostics.BoldWarning,
					[severity.HINT] = icons.diagnostics.BoldHint,
					[severity.INFO] = icons.diagnostics.BoldInformation,
				},
			},

			virtual_text = true,
			update_in_insert = false,
			underline = true,
			severity_sort = true,
			float = { focusable = true, border = "rounded" },
		})

		vim.lsp.buf.hover({ border = "rounded" })
		vim.lsp.buf.signature_help({ border = "rounded" })
	end,
}
