return {
	{
		"stevearc/oil.nvim",
		---@module 'oil'
		---@type oil.SetupOpts
		dependencies = {
			{
				"echasnovski/mini.icons",
				version = "*",
				config = function()
					require("mini.icons").setup()
				end,
			},
		},
		-- dependencies = { "nvim-tree/nvim-web-devicons" },
		config = function()
			require("oil").setup({
				default_file_explorer = true,
				view_options = { show_hidden = true },
				delete_to_trash = false,
				skip_confirm_for_simple_edits = false,
				prompt_save_on_select_new_entry = true,
				keymaps = {
					["g?"] = { "actions.show_help", mode = "n" },
					["<CR>"] = "actions.select",
					["<C-s>"] = { "actions.select", opts = { vertical = true } },
					["<C-h>"] = { "actions.select", opts = { horizontal = true } },
					["<C-t>"] = { "actions.select", opts = { tab = true } },
					["<C-p>"] = "actions.preview",
					["<C-c>"] = { "actions.close", mode = "n" },
					["<C-l>"] = "actions.refresh",
					["-"] = { "actions.parent", mode = "n" },
					["_"] = { "actions.open_cwd", mode = "n" },
					["`"] = { "actions.cd", mode = "n" },
					["~"] = { "actions.cd", opts = { scope = "tab" }, mode = "n" },
					["gs"] = { "actions.change_sort", mode = "n" },
					["gx"] = "actions.open_external",
					["g."] = { "actions.toggle_hidden", mode = "n" },
					["g\\"] = { "actions.toggle_trash", mode = "n" },
				},
			})

			vim.keymap.set("n", "-", "<CMD>Oil<CR>", { desc = "Open parent directory" })
			vim.keymap.set("n", "<leader>-", require("oil").toggle_float)
		end,
	},
}
