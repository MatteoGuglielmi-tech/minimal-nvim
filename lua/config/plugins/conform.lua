return {
	"stevearc/conform.nvim",
	lazy = false,
	keys = {
		-- {
		-- 	"<leader>f",
		-- 	function()
		-- 		require("conform").format({ async = true, lsp_fallback = true })
		-- 	end,
		-- 	mode = "n",
		-- 	desc = "[F]ormat buffer",
		-- },
	},
	opts = {
		notify_on_error = true,
		format_on_save = function(bufnr)
			local disable_filetypes = { json = true, c = true, cpp = true }
			return {
				timeout_ms = 500,
				lsp_fallback = not disable_filetypes[vim.bo[bufnr].filetype],
			}
		end,
		formatters_by_ft = {
			lua = { "stylua" },
			python = { "black", "isort", "docformatter" },
			-- mojo = { "mojo_formatter" },
			yaml = { "yamlfix" },
			markdown = { "cbfmt" },
			rust = { "rustfmt", lsp_format = "fallback" },
			["*"] = {},
		},
	},
}
