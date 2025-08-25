return {
	"folke/noice.nvim",
	event = "VeryLazy",
	dependencies = {
		{ "MunifTanjim/nui.nvim" },
		{ "nvim-telescope/telescope.nvim" },
	},

	config = function()
		require("noice").setup({
			lsp = {
				override = {
					["vim.lsp.util.convert_input_to_markdown_lines"] = true,
					["vim.lsp.util.stylize_markdown"] = true,
					-- ["blink.cmp.show_documentation"] = true,
				},
			},
			presets = {
				bottom_search = true, -- use a classic bottom cmdline for search
				command_palette = true, -- position the cmdline and popupmenu together
				long_message_to_split = true, -- long messages will be sent to a split
				inc_rename = false,
				lsp_doc_border = false,
			},
		})

		vim.keymap.set("n", "<leader>nm", "<cmd>Noice telescope<CR>", { desc = "Show [N]eovim [M]essages in Telescope view." })
		vim.keymap.set("n", "<leader>ne", "<cmd>Noice errors<CR>", { desc = "Show [N]eovim [E]rror messages in Telescope view." })
		vim.keymap.set("n", "<leader>nl", "<cmd>Noice last<CR>", { desc = "Show [N]eovim [L]ast message in a popup view." })
	end,
}
