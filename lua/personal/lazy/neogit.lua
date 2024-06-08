return {
	"neogitorg/neogit",
	event = "VeryLazy",
	dependencies = {
		"nvim-lua/plenary.nvim",
		"nvim-telescope/telescope.nvim",
		"sindrets/diffview.nvim",
	},
	config = function()
		require("neogit").setup({
			disable_commit_confirmation = false,
			integrations = { diffview = true },
		})

		vim.keymap.set("n", "<leader>gg", "<cmd>Neogit<CR>", { desc = "Neogit" })
	end,
}
