return {
	"mfussenegger/nvim-dap-python",
	dependencies = {
		"mfussenegger/nvim-dap",
	},
	config = function()
		local mason_path = vim.fn.glob(vim.fn.stdpath("data") .. "/mason/")
		pcall(function()
			-- /home/matteo/.local/share/nvim/mason/packages/debugpy/venv/bin
			require("dap-python").setup(mason_path .. "packages/debugpy/venv/bin/python")
		end)
	end,
}
