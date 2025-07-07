local lspconfig_utils = require("config.lsp_utils.lsp_utils")

return {
	"neovim/nvim-lspconfig",
	dependencies = {
		{
			"folke/lazydev.nvim",
			ft = "lua",
			opts = {
				library = {
					{ path = "${3rd}/luv/library", words = { "vim%.uv" } },
				},
			},
		},
		{ "saghen/blink.cmp" },
		{ "williamboman/mason.nvim" },
		{ "williamboman/mason-lspconfig.nvim" },
		{ "WhoIsSethDaniel/mason-tool-installer.nvim" },
		{ "j-hui/fidget.nvim", opts = {} },
		{ "stevearc/dressing.nvim", opts = {}, dependencies = { "MunifTanjim/nui.nvim" } },
	},
	opts = {
		servers = {
			-- Lua
			lua_ls = {
				settings = {
					Lua = {
						hint = { enable = true },
						telemetry = { enable = false },
						workspace = { checkThirdParty = false },
					},
				},
			},
			-- Python
			pyright = {
				filetypes = { "python" },
				before_init = function(_, config)
					local python_path = lspconfig_utils.get_conda_python_path()
					if python_path then
						config.settings = config.settings or {}
						config.settings.python = config.settings.python or {}
						config.settings.python.pythonPath = python_path
					end
				end,
				settings = {
					python = {
						analysis = {
							autoSearchPaths = true,
							useLibraryCodeForTypes = true,
						},
					},
				},
			},
			-- Bash
			bashls = { filetypes = { "sh" } },
			-- Markdown
			marksman = { filetypes = { "markdown", "markdown-inline" } },
			-- LaTeX
			texlab = { filetypes = { "latex" } },
			-- zig
			zls = {
				filetypes = { "zig" },
				settings = { zls = { enable_inlay_hints = true } },
			},
			-- C
			clangd = {
				cmd = { "clangd" },
				filetypes = { "c", "c~", "cpp" },
				single_file_support = true,
				settings = {
					clangd = {
						InlayHints = {
							-- Show hints for parameter names
							ParameterNames = true,
							-- Show hints for automatically deduced types
							DeducedTypes = true,
						},
					},
				},
			},
		},
	},

	config = function(_, opts)
		local lspconfig = require("lspconfig")
		require("mason").setup()

		local ensure_installed = vim.tbl_keys(opts.servers or {})
		vim.list_extend(ensure_installed, {
			-- formatters
			-- lua
			"stylua",
			-- python
			"black",
			"isort",
			"docformatter",
			-- c
			"clang-format",
			-- bash
			"shfmt",
			-- yml
			"yamlfix",
			-- md
			"prettier",

			-- linters
			-- c
			"cpplint",
			-- commit
			"commitlint",
			-- bash
			"shellcheck",
		})

		local icons = require("config.icons")

		vim.diagnostic.config({
			signs = {
				text = {
					[vim.diagnostic.severity.ERROR] = icons.diagnostics.Error,
					[vim.diagnostic.severity.WARN] = icons.diagnostics.BoldWarning,
					[vim.diagnostic.severity.HINT] = icons.diagnostics.BoldHint,
					[vim.diagnostic.severity.INFO] = icons.diagnostics.BoldInformation,
				},
			},
			virtual_text = true,
			update_in_insert = false,
			underline = true,
			severity_sort = true,
			float = {
				focusable = true,
				-- style = "minimal",
				border = "rounded",
				-- header = "",
				-- prefix = "",
				-- source = "always",
			},
		})

		vim.lsp.buf.hover({ border = "rounded" })
		vim.lsp.buf.signature_help({ border = "rounded" })
		vim.lsp.handlers["textDocument/publishDiagnostics"] = lspconfig_utils.custom_on_publish_diagnostics

		require("mason-tool-installer").setup({
			ensure_installed = ensure_installed,
			auto_update = true,
			run_on_start = true,
		})

		for server, config in pairs(opts.servers) do
			config.capabilities = require("blink.cmp").get_lsp_capabilities(config.capabilities)
			lspconfig[server].setup(config)
		end
	end,
}
