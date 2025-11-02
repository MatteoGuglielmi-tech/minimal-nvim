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
