return {
	"neovim/nvim-lspconfig",
	dependencies = {
		{ "williamboman/mason.nvim", config = true },
		"williamboman/mason-lspconfig.nvim",
		"WhoIsSethDaniel/mason-tool-installer.nvim",

		{ "j-hui/fidget.nvim", opts = {} },
		{
			"stevearc/dressing.nvim",
			opts = {},
			dependencies = { "MunifTanjim/nui.nvim" },
		},
		-- { "folke/neodev.nvim", opts = {} },
	},
	config = function()
		local util = require("lspconfig.util")
		local capabilities = vim.lsp.protocol.make_client_capabilities()
		capabilities = vim.tbl_deep_extend("force", capabilities, require("cmp_nvim_lsp").default_capabilities())

		local default_diagnostic_config = {
			signs = {
				active = true,
				values = {
					{ name = "DiagnosticSignError", text = "" },
					{ name = "DiagnosticSignWarn", text = "" },
					{ name = "DiagnosticSignHint", text = "󰌶" },
					{ name = "DiagnosticSignInfo", text = "" },
				},
			},
			virtual_text = false,
			update_in_insert = false,
			underline = true,
			severity_sort = true,
			float = {
				focusable = true,
				style = "minimal",
				border = "rounded",
				source = "always",
				header = "",
				prefix = "",
			},
		}

		vim.diagnostic.config(default_diagnostic_config)
		local root_files = {
			".clangd",
			".clang-tidy",
			".clang-format",
			"compile_commands.json",
			"compile_flags.txt",
			"configure.ac", -- AutoTools
		}

		local servers = {
			lua_ls = {
				settings = {
					Lua = {
						format = {
							enable = true,
						},
						diagnostics = {
							globals = { "vim", "spec" },
						},
						runtime = {
							version = "LuaJIT",
							special = {
								spec = "require",
							},
						},
						workspace = {
							checkThirdParty = false,
							library = {
								[vim.fn.expand("$VIMRUNTIME/lua")] = true,
								[vim.fn.stdpath("config") .. "/lua"] = true,
							},
						},
						telemetry = {
							enable = false,
						},
					},
				},
			},

			bashls = {
				single_file_support = true,
				cmd = { "bash-language-server", "start" },
				filetypes = { "sh", "zsh" },
				settings = {
					bash = {
						format = {
							enable = true,
						},
					},
				},
			},

			pyright = {
				single_file_support = true,
				cmd = { "pyright-langserver", "--stdio" },
				filetypes = { "python" },
				settings = {
					pyright = {
						disableLanguageServices = false,
						disableOrganizeImports = true,
					},
					python = {
						analysis = {
							autoImportCompletions = true,
							autoSearchPaths = true,
							diagnosticMode = "workspace", -- openFilesOnly, workspace
							typeCheckingMode = "basic", -- off, basic, strict
							useLibraryCodeForTypes = true,
						},
					},
				},
				-- before_init = function(_, config)
				--   config.settings.python.pythonPath = get_python_path(config.root_dir)
				-- end,
			},

			marksman = {},
			texlab = {
				single_file_support = true,
				cmd = { "texlab" },
				settings = {
					texlab = {
						build = {
							args = {
								"-pdf",
								"-interaction=nonstopmode",
								"-synctex=1",
								"%f",
							},
							executable = "latexmk",
							onSave = true,
						},
						chktex = {
							onEdit = true,
							onOpenAndSave = false,
						},
						forwardSearch = {
							executable = "zathura",
							args = { "--synctex-forward", "%1:1:%f", "%p" },
						},
						lint = {
							onChange = true,
						},
						latexFormatter = "latexindent",
						latexindent = {
							modifyLineBreaks = true,
						},
					},
				},
				filetypes = { "tex", "bib", "plaintex" },
			},

			clangd = {
				cmd = { "clangd" },
				filetypes = { "c", "cpp" },
				single_file_support = true,
				root_dir = function(fname)
					return util.root_pattern(unpack(root_files)(fname) or util.find_git_ancestor(fname))
				end,
			},
			rust_analyzer = {},
		}

		vim.lsp.handlers["textDocument/signatureHelp"] = vim.lsp.with(vim.lsp.handlers.signature_help, {
			border = "rounded",
			focus = false,
			focusable = true,
			close_events = { "CursorMoved", "BufHidden", "InsertCharPre" },
		})

		require("mason").setup()

		-- You can add other tools here that you want Mason to install
		-- for you, so that they are available from within Neovim.
		local ensure_installed = vim.tbl_keys(servers or {})
		vim.list_extend(ensure_installed, {
			-- formatters
			"stylua",
			"autopep8",
			-- 'black',
			"clang-format",
			"shfmt",
			"yamlfix",
			-- checker
		})
		require("mason-tool-installer").setup({ ensure_installed = ensure_installed })

		require("mason-lspconfig").setup({
			handlers = {
				function(server_name)
					local server = servers[server_name] or {}
					-- This handles overriding only values explicitly passed
					-- by the server configuration above. Useful when disabling
					-- certain features of an LSP (for example, turning off formatting for tsserver)
					server.capabilities = vim.tbl_deep_extend("force", {}, capabilities, server.capabilities or {})
					require("lspconfig")[server_name].setup(server)
				end,
			},
		})
	end,
}
