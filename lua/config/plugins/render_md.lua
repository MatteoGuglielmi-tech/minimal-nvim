return {
	"MeanderingProgrammer/render-markdown.nvim",
	dependencies = { "nvim-treesitter/nvim-treesitter", "nvim-mini/mini.nvim" },
	---@module 'render-markdown'
	---@type render.md.UserConfig
	keys = {
		{
			"<leader>Mr",
			"<cmd>RenderMarkdown toggle<CR>",
			desc = "[M]arkdown [R]ender toggle",
			ft = "markdown",
		},
	},
	opts = {
		-- off by default: the first <leader>Mr turns the renderer on
		enabled = false,
		completions = { blink = { enabled = true } },
	},
}
