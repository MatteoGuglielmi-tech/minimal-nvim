return {
	"linux-cultist/venv-selector.nvim",
	dependencies = {
		"neovim/nvim-lspconfig",
		"mfussenegger/nvim-dap",
		"mfussenegger/nvim-dap-python",
		"nvim-telescope/telescope.nvim",
	},
	lazy = false,
	branch = "main",
	keys = {
		{ "<leader>vs", "<cmd>VenvSelect<CR>" },
	},
	enabled = false,
	opts = {
		search = {
			anaconda_base = {
				command = "fd /bin/python$ "
					.. vim.fn.expand("$HOME/.softwares/miniforge3/envs")
					.. " --full-path --color never -E /proc",
				type = "anaconda",
			},
		},
	},
}
