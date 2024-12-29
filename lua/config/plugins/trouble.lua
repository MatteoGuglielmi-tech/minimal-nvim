return {
	{
		"folke/trouble.nvim",
		dependencies = { "echasnovski/mini.icons" },
		opts = {},
		cmd = "Trouble",
		keys = {
			{ "<leader>td", "<cmd>Trouble diagnostics<CR>", { desc = "Document Diagnostic (Trouble)" } },
			{
				"<leader>tc",
				"<cmd>Trouble diagnostics toggle filter.buf=0<CR>",
				{ desc = "Buffer Diagnostics (Trouble)" },
			},
			{ "<leader>tl", "<cmd>Trouble loclist toggle<CR>", { desc = "Loclist Toggle (Trouble)" } },
			{ "<leader>tq", "<cmd>Trouble qflist toggle<CR>", { desc = "Quickfix list (Trouble)" } },
			{ "<leader>tt", "<cmd>Trouble todo<CR>", { desc = "Toggle TODO (Trouble)" } },
		},
	},
}
