return {
	"stevearc/conform.nvim",
	keys = {
		{
			mode = { "n", "x", "o" },
			"<leader>f",
			function()
				require("conform").format({ async = true, lsp_fallback = true })
			end,
			desc = "[F]ormat buffer",
		},
	},
	opts = {
		notify_on_error = true,
		format_on_save = false,

		formatters = {
			["markdown-toc"] = {
				condition = function(_, ctx)
					for _, line in ipairs(vim.api.nvim_buf_get_lines(ctx.buf, 0, -1, false)) do
						if line:find("<!%-%- toc %-%->") then
							return true
						end
					end
				end,
			},
		},

		formatters_by_ft = {
			json = { "jq" },
			jsonc = { "prettier" },
			lua = { "stylua" },
			python = {
				"ruff_fix", -- Fixes auto-fixable lint errors
				"ruff_format", -- Runs Ruff's formatter
				-- "ruff_organize_imports", -- Organizes imports
			},
			yaml = { "yamlfix" },
			markdown = { "prettier", "markdown-toc" },
			["markdown.mdx"] = { "prettier", "markdown-toc" },
			rust = { "rustfmt", lsp_format = "fallback" },
			bash = { "beautysh" },
			zsh = { "beautysh" },
			typescript = { "prettier" },
			javascript = { "prettier" },
			typescriptreact = { "prettier" },
			javascriptreact = { "prettier" },
			html = { "prettier" },
			java = { "google-java-format" },
			xml = { "xmlformatter" },
			xsd = { "xmlformatter" },
			xsl = { "xmlformatter" },
			xslt = { "xmlformatter" },
			svg = { "xmlformatter" },
			sql = { "sqruff" },
			["*"] = {},
		},
	},
}
