return {
	{
		"ThePrimeagen/harpoon",
		branch = "harpoon2",
		dependencies = { "nvim-lua/plenary.nvim" },
		keys = {
			-- disable harpoon <C-i> mapping
			{ "<C=i>", false },
		},

		config = function()
			local harpoon = require("harpoon")
			harpoon:setup({})

			local toggle_telescope = require("config.telescope.harpoon")

			vim.keymap.set("n", "<leader>m", function()
				harpoon:list():add()
			end)

			vim.keymap.set("n", "<TAB>", function()
				harpoon.ui:toggle_quick_menu(harpoon:list())
			end)
			vim.keymap.set("n", "<C-e>", function()
				toggle_telescope(harpoon)
			end, { desc = "Open harpoon window" })

			vim.keymap.set("n", ".", function()
				harpoon:list():prev()
			end, { desc = "Navigate to prev item in harpoon list" })

			vim.keymap.set("n", ",", function()
				harpoon:list():next()
			end, { desc = "Navigate to next item in harpoon list" })
		end,
	},
}
