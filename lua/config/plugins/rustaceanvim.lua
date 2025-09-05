return {
	"mrcjkb/rustaceanvim",
	version = "^6",
	lazy = false,
	init = function()
		vim.g.rustaceanvim = {
			settings = {
				["rust-analyzer"] = {
					check = {
						command = "clippy",
					},
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
				-- DAP configuration
				-- dap = {},
			},
		}
	end,
}
