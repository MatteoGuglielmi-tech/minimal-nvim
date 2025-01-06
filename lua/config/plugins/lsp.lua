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
		{ "williamboman/mason-lspconfig.nvim" }, -- apparently this is needed to make things work
		{ "WhoIsSethDaniel/mason-tool-installer.nvim" },
		{ "j-hui/fidget.nvim", opts = {} },
		{ "stevearc/dressing.nvim", opts = {}, dependencies = { "MunifTanjim/nui.nvim" } },
	},
	opts = {
		servers = {
			lua_ls = {},
			bashls = { filetypes = { "sh", "zsh" } },
			pyright = {},
			marksman = {},
			texlab = {},
			zls = {}, -- zig
			rust_analyzer = {}, -- rust
			clangd = {
				cmd = { "clangd" },
				filetypes = { "c", "cpp" },
				single_file_support = true,
				root_dir = function(fname)
					return require("lspconfig.util").root_pattern(unpack({
						".clangd",
						".clang-tidy",
						".clang-format",
						"compile_commands.json",
						"compile_flags.txt",
						"configure.ac",
					})(fname) or vim.fs.dirname(vim.fs.find(".git", { path = fname, upward = true })[1]))
				end,
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
			"cbfmt",

			-- linters
			-- c
			"cpplint",
			-- commit
			"commitlint",
			-- md
			"markdownlint",
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

		require("mason-tool-installer").setup({ ensure_installed = ensure_installed })
		require("mason-lspconfig").setup()

		for server, config in pairs(opts.servers) do
			config.capabilities = require("blink.cmp").get_lsp_capabilities(config.capabilities)
			lspconfig[server].setup(config)
		end
	end,
}
