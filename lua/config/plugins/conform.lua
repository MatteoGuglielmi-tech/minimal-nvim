return {
	"stevearc/conform.nvim",
	keys = {
		{
			mode = { "n", "v" },
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
		-- format_on_save = function(bufnr)
		-- 	local disable_filetypes = { json = true, c = true, cpp = true }
		-- 	return {
		-- 		timeout_ms = 1000,
		-- 		lsp_fallback = not disable_filetypes[vim.bo[bufnr].filetype],
		-- 	}
		-- end,

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
			black = {
				prepend_args = { "--fast" },
			},
		},

		formatters_by_ft = {
			lua = { "stylua" },
			python = { "black", "isort" },
			-- mojo = { "mojo_formatter" },
			yaml = { "yamlfix" },
			markdown = { "prettier", "markdown-toc" },
			["markdown.mdx"] = { "prettier", "markdown-toc" },
			rust = { "rustfmt", lsp_format = "fallback" },
			["*"] = {},
		},
	},
}
