return {
	{
		"folke/trouble.nvim",
		dependencies = { "nvim-telescope/telescope.nvim"},
		opts = {},
		cmd = "Trouble",
		keys = {
			{ "<leader>tw", "<cmd>Trouble todo<CR>", { desc = "[T]rouble TODO [W]orkspace" } },
			{ "<leader>tt", "<cmd>TodoTelescope<CR>", { desc = "[T]rouble TODO [T]elescope workspace" } },
			{ "<leader>ttb", "<cmd>Trouble todo focus=false filter.buf=0<CR>", { desc = "[T]rouble [T]oggle TODO current [B]uffer" } },
		},
	},
}

