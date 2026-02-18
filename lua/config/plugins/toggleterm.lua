return {
	"akinsho/toggleterm.nvim",
	version = "*",
	event = "VeryLazy",
	enabled=false,
	config = function()
		require("config.toggleterm_utils.tt_utils"):add_execs()

		require("toggleterm").setup({
			open_mapping = [[<C-\>]],
			persist_size = false,
			direction = "float",
			float_opts = {
				border = "rounded",
				winblend = 0,
			},
		})

		local opts = { noremap = true, silent = true }
		function _G.set_terminal_keymaps()
			vim.api.nvim_buf_set_keymap(0, "t", "<m-h>", [[<C-\><C-n><C-W>h]], opts)
			vim.api.nvim_buf_set_keymap(0, "t", "<m-j>", [[<C-\><C-n><C-W>j]], opts)
			vim.api.nvim_buf_set_keymap(0, "t", "<m-k>", [[<C-\><C-n><C-W>k]], opts)
			vim.api.nvim_buf_set_keymap(0, "t", "<m-l>", [[<C-\><C-n><C-W>l]], opts)
		end
	end,
}
