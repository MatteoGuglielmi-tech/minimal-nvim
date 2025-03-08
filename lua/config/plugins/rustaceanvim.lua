return {
	"mrcjkb/rustaceanvim",
	version = "^5",
	init = function()
		vim.g.rustaceanvim = {
			-- tools = {},
			-- LSP configuration
			server = {
				-- on_attach = function(client, bufnr)
				-- you can also put keymaps in here
				-- end,
				default_settings = {
					-- rust-analyzer language server configuration
					["rust-analyzer"] = { checkOnSave = false },
				},
			},
			-- DAP configuration
			-- dap = {},
		}
	end,
	lazy = false,
}
