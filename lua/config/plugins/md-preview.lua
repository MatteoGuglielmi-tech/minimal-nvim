return {
	"iamcco/markdown-preview.nvim",
	cmd = { "MarkdownPreviewToggle", "MarkdownPreview", "MarkdownPreviewStop" },
	build = "cd app && yarn install",
	ft = { "markdown" },
	init = function()
		vim.g.mkdp_filetypes = { "markdown" }
	end,
	keys = {
		{
			"<leader>Mp",
			"<cmd>MarkdownPreviewToggle<CR>",
			desc = "[M]arkdown [P]review toggle",
			ft = "markdown",
		},
	},
}
