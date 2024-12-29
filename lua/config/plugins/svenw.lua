return {
	"AckslD/swenv.nvim",
	event = "VeryLazy",
	config = function()
		require("swenv").setup({
			get_venvs = function(venvs_path)
				return require("swenv.api").get_venvs(venvs_path)
			end,
			venvs_path = vim.fn.expand("$HOME/.conda/envs"),
			post_set_venv = function()
				vim.cmd([[LspRestart]])
			end,
		})
		vim.keymap.set("n", "<leader>Cc", "<cmd>lua require('swenv.api').pick_venv()<CR>", { desc = "Choose venv" })
	end,
}
