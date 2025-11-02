local lspconfig_utils = require("config.lsp_utils.lsp_utils")

return {
	filetypes = { "python" },
	before_init = function(_, config)
		local python_path = lspconfig_utils.get_python_path()
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
}
