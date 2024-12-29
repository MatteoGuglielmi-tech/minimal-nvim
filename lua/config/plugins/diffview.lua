return {
	"sindrets/diffview.nvim",
	event = "VeryLazy",
	cmd = { "DiffviewOpen", "DiffviewClose", "DiffviewToggleFiles", "DiffviewFocusFiles" },
	config = function()
		require("diffview").setup({
			view = {
				merge_tool = {
					layout = "diff4_mixed",
					disable_diagnostics = true,
					winbar_info = true,
				},
			},
		})

		vim.keymap.set("n", "<leader>gd", "<cmd>DiffviewOpen<CR>", { desc = "DiffViewOpen" })
		vim.keymap.set("n", "<leader>gc", "<cmd>DiffviewClose<CR>", { desc = "DiffViewClose" })
	end,
}
