return {
	"mfussenegger/nvim-dap-python",
	dependencies = { "mfussenegger/nvim-dap" },
	config = function ()
		local lspconfig_utils = require("config.lsp_utils.lsp_utils")
		local python_path = lspconfig_utils.get_conda_python_path()

		if python_path and vim.fn.executable(python_path) == 1 then
			-- Notify setup is running with found path
			vim.notify("✅ Found Conda Python for DAP: " .. python_path, vim.log.levels.INFO)
			require("dap-python").setup(python_path)
		else
			vim.notify(
				"❌ Conda Python not found or not executable. nvim-dap-python not configured.",
				vim.log.levels.WARN
			)
		end
	end
}
