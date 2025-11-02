return {
	{
		"williamboman/mason-lspconfig.nvim",
		opts = {
			-- list of servers for mason to install
			ensure_installed = {
				"lua_ls",
				"pyright",
				"bashls",
				"marksman",
				"texlab",
				"zls",
				"clangd",
			},
		},
		dependencies = {
			{
				"williamboman/mason.nvim",
				opts = {
					ui = {
						icons = {
							package_installed = "✓",
							package_pending = "➜ ",
							package_uninstalled = "✗",
						},
					},
				},
			},
			{
				"neovim/nvim-lspconfig",
			},
		},
	},
	{
		"WhoIsSethDaniel/mason-tool-installer.nvim",
		opts = {
			ensure_installed = {
				-- formatters
				"stylua",
				"black",
				"clang-format",
				"shfmt",
				"yamlfix",
				"prettier",

				-- linters
				"cpplint",
				"commitlint",
				"shellcheck",
			},
			auto_update = true,
			run_on_start = true,
		},
		dependencies = {
			"williamboman/mason.nvim",
		},
	},
}
