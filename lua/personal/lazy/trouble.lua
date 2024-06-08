return {
	{
		"folke/trouble.nvim",
		dependencies = { "nvim-tree/nvim-web-devicons" },
		cmd = "Trouble",
		config = function()
			require("trouble").setup()
			vim.keymap.set(
				"n",
				"<leader>td",
				"<cmd>Trouble diagnostics<CR>",
				{ desc = "Document Diagnostic (Trouble)" }
			)
			vim.keymap.set("n", "<leader>tr", "<cmd>Trouble lsp_references<CR>", { desc = "LSP References (Trouble)" })
			vim.keymap.set(
				"n",
				"<leader>tc",
				"<cmd>Trouble diagnostics toggle filter.buf=0<CR>",
				{ desc = "Buffer Diagnostics (Trouble)" }
			)
			vim.keymap.set("n", "<leader>tl", "<cmd>Trouble loclist toggle<CR>", { desc = "Loclist Toggle (Trouble)" })
			vim.keymap.set("n", "<leader>tq", "<cmd>Trouble qflist toggle<CR>", { desc = "Quickfix list (Trouble)" })
			vim.keymap.set(
				"n",
				"<leader>ti",
				"<cmd>Trouble lsp_implementations<CR>",
				{ desc = "LSP implementations (Trouble)" }
			)
			vim.keymap.set("n", "<leader>tt", "<cmd>Trouble todo<CR>", { desc = "Toggle TODO (Trouble)" })
		end,
	},
}
