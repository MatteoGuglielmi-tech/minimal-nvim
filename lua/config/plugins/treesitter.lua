---@diagnostic disable: undefined-field, unused-local
-- useful cmds: Inspect and InspectTree

local ts_textobjects_opts = require("config.treesitter.treesitter-textobjects")
local ts_context_opts = require("config.treesitter.treesitter-context")

return {
	"nvim-treesitter/nvim-treesitter",
	version = false,
	build = ":TSUpdate",
	event = { "BufReadPre", "BufNewFile" },
	lazy = false,
	dependencies = {
		-- this is counter intuitive based on names, but `nvim-treesitter-textobjects` needs to be loaded before `treesitter` runs `setup()`
		"nvim-treesitter/nvim-treesitter-textobjects",
		{
		 "nvim-treesitter/nvim-treesitter-context",
			enabled=false
		},
	},
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
			disable = function(lang, buf)
				local max_filesize = 100 * 1024 * 1024 -- 100 MiB
				local ok, stats = pcall(vim.loop.fs_stat, vim.api.nvim_buf_get_name(buf))
				if ok and stats and stats.size > max_filesize then
					return true
				end
			end,
			additional_vim_regex_highlighting = { "markdown", "markdown_inline" },
		},
		indent = { enable = true, disable = { "markdown", "markdown_inline" } },
		incremental_selection = { enable = false },
		textobjects = ts_textobjects_opts,
		context = ts_context_opts,
	},
}
