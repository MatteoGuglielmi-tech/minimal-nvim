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
				"lemminx",
				"ts_ls",
				"angularls",
				"html",
				"intelephense",
			},
			-- jdtls managed by nvim-jdtls directly, not lspconfig
			-- rust_analyzer is managed by rustaceanvim, which starts its own
			-- client; letting lspconfig enable it too spawns a second
			-- rust-analyzer on every Rust buffer.
			automatic_enable = {
				exclude = { "jdtls", "rust_analyzer" },
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
				"beautysh",
				"yamlfix",
				"jq",
				"prettier",
				"xmlformatter",
				"google-java-format",

				"tree-sitter-cli",
				"jdtls",

				-- linters
				"cpplint",
				"commitlint",
				"shellcheck",
				"eslint_d",
			},
			auto_update = true,
			run_on_start = true,
		},
		dependencies = {
			"williamboman/mason.nvim",
		},
	},
}
