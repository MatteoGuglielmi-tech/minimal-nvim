return {
	"ThePrimeagen/harpoon",
	event = "VeryLazy",
	dependencies = {
		{ "nvim-lua/plenary.nvim" },
	},

	config = function()
		vim.keymap.set("n", "<TAB>", "<cmd>lua require('harpoon.ui').toggle_quick_menu()<CR>", {})
		vim.keymap.set("n", "<leader>m", "<cmd>lua require('harpoon.mark').add_file()<CR>", { desc = "Mark file" })
		vim.keymap.set(
			"n",
			".",
			"<cmd>lua require('harpoon.ui').nav_next()<CR>",
			{ desc = "Navigate to next item in harpoon list" }
		)
		vim.keymap.set(
			"n",
			",",
			"<cmd>lua require('harpoon.ui').nav_prev()<CR>",
			{ desc = "Navigate to previous item in harpoon list" }
		)
	end,
}
