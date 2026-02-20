---@diagnostic disable: undefined-field, unused-local
-- useful cmds: Inspect and InspectTree

return {
	"nvim-treesitter/nvim-treesitter",
	version = false,
	build = ":TSUpdate",
	event = { "BufReadPre", "BufNewFile" },
	lazy = false,
	opts = {
		ensure_installed = {
			"rust",
			"lua",
			"c",
			"cpp",
			"vim",
			"vimdoc",
			"query",
			"javascript",
			"typescript",
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
		},
		sync_install = false,
		auto_install = true,
		highlight = {
			enable = true,
			additional_vim_regex_highlighting = { "markdown", "markdown_inline" },
		},
		indent = { enable = true, disable = { "markdown", "markdown_inline" } },
		incremental_selection = { enable = false },
	},
}
