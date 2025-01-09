return {
	"nvim-telescope/telescope.nvim",
	branch = "0.1.x",
	event = "VimEnter",
	build = ":TSUpdate",
	dependencies = {
		"nvim-lua/plenary.nvim",
		{ "nvim-telescope/telescope-fzf-native.nvim", build = "make" },
		{ "nvim-telescope/telescope-ui-select.nvim" },
		{ "echasnovski/mini.icons" },
		-- { "nvim-tree/nvim-web-devicons", enabled = vim.g.have_nerd_font },
	},
	config = function()
		local actions = require("telescope.actions")
		local open_with_trouble = require("trouble.sources.telescope").open
		local add_to_trouble = require("trouble.sources.telescope").add

		require("telescope").setup({
			defaults = {
				mappings = {
					i = { ["<C-t>"] = open_with_trouble },
					n = { ["<C-t>"] = open_with_trouble },
				},
			},
			pickers = {
				find_files = { theme = "ivy" },
				builtin = { theme = "ivy" },
				live_grep = { theme = "ivy" },
				diagnostics = { theme = "ivy" },
				current_buffer_fuzzy_find = { theme = "ivy" },
				lsp_references = { theme = "ivy" },
			},
			extensions = {
				fzf = {},
				["ui-select"] = {
					require("telescope.themes").get_ivy(),
				},
			},
		})
		pcall(require("telescope").load_extension, "fzf")
		pcall(require("telescope").load_extension, "ui-select")
		pcall(require("telescope").load_extension, "bookmarks")

		local builtin = require("telescope.builtin")
		vim.keymap.set("n", "<leader>fh", builtin.help_tags, { desc = "[F]ind [H]elp" })
		vim.keymap.set("n", "<leader>fk", builtin.keymaps, { desc = "[F]ind [K]eymaps" })
		vim.keymap.set("n", "<leader>ff", builtin.find_files, { desc = "[F]ind [F]iles" })
		vim.keymap.set("n", "<leader>fs", builtin.builtin, { desc = "[F]ind [S]elect Telescope" })
		vim.keymap.set("n", "<leader>fw", builtin.grep_string, { desc = "[F]ind current [W]ord" })
		-- vim.keymap.set("n", "<leader>fg", builtin.live_grep, { desc = "[F]ind by [G]rep" })
		vim.keymap.set("n", "<leader>fd", builtin.diagnostics, { desc = "[F]ind [D]iagnostics" })
		-- vim.keymap.set("n", "<leader>fr", builtin.resume, { desc = "[F]ind [R]esume" })
		vim.keymap.set("n", "<leader>f.", builtin.oldfiles, { desc = '[F]ind Recent Files ("." for repeat)' })
		vim.keymap.set("n", "<leader><leader>", builtin.buffers, { desc = "[ ] Find existing buffers" })

		vim.keymap.set(
			"n",
			"<leader>fc",
			builtin.current_buffer_fuzzy_find,
			{ desc = "[F]uzzily search in [C]urrent buffer" }
		)

		vim.keymap.set("n", "<leader>f/", function()
			builtin.live_grep({
				grep_open_files = true,
				prompt_title = "Live Grep in Open Files",
			})
		end, { desc = "[F]ind [/] in Open Files" })

		-- Shortcut for searching your Neovim configuration files
		vim.keymap.set("n", "<leader>fn", function()
			builtin.find_files({ cwd = vim.fn.stdpath("config"), prompt_title = "Search Neovim config" })
		end, { desc = "[F]ind [N]eovim files" })

		require("config.telescope.multigrep").setup()
	end,
}
