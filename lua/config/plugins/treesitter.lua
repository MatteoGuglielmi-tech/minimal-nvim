-- useful cmds: Inspect and InspectTree
return {
	"nvim-treesitter/nvim-treesitter",
	branch = "main",
	lazy = false,
	build = ":TSUpdate",
	config = function()
		-- master `ensure_installed` parity: install the fixed set at startup.
		-- Async; no-op for already-installed parsers. Highlight + auto-install
		-- live in the FileType autocmd (lua/config/autocmds.lua).
		require("nvim-treesitter").install({
			"rust",
			"lua",
			"c",
			"cpp",
			"vim",
			"vimdoc",
			"query",
			"javascript",
			"typescript",
			"tsx",
			"python",
			"json",
			"toml",
			"markdown",
			"markdown_inline",
			"html",
			"yaml",
			"latex",
			"jinja",
			"jinja_inline",
			"gitcommit",
			"php",
			"java",
			"xml",
			"bash", -- zsh filetype highlights via bash (see autocmds.lua register)
		})
	end,
}
