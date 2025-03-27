return {
	"mrcjkb/rustaceanvim",
	version = "^5",
	init = function()
		vim.g.rustaceanvim = {
			-- LSP configuration
			server = {
				cmd = function()
					local mason_registry = require("mason-registry")
					if mason_registry.is_installed("rust-analyzer") then
						-- This may need to be tweaked depending on the operating system.
						local ra = mason_registry.get_package("rust-analyzer")
						local ra_filename = ra:get_receipt():get().links.bin["rust-analyzer"]
						return { ("%s/%s"):format(ra:get_install_path(), ra_filename or "rust-analyzer") }
					else
						-- global installation
						return { "rust-analyzer" }
					end
				end,
				settings = {
					-- rust-analyzer language server configuration
					["rust-analyzer"] = {
						inlayHints = {
							bindingModeHints = {
								enable = false,
							},
							chainingHints = {
								enable = true,
							},
							closingBraceHints = {
								enable = true,
								minLines = 25,
							},
							closureReturnTypeHints = {
								enable = "never",
							},
							lifetimeElisionHints = {
								enable = "never",
								useParameterNames = false,
							},
							maxLength = 25,
							parameterHints = {
								enable = true,
							},
							reborrowHints = {
								enable = "never",
							},
							renderColons = true,
							typeHints = {
								enable = true,
								hideClosureInitialization = false,
								hideNamedConstructor = false,
							},
							checkOnSave = false,
						},
					},
				},
			},
			-- DAP configuration
			-- dap = {},
		}
	end,
	lazy = false,
}
