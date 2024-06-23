vim.opt_local.expandtab = true
vim.opt_local.shiftwidth = 4
vim.opt_local.softtabstop = 4
vim.opt_local.formatoptions:append({ c = true, r = true, o = true, q = true })

vim.keymap.set(
	"n",
	"<leader>ce",
	"<cmd>lua require('swenv.api').pick_venv()<CR>",
	{ desc = "Choose python environment" }
)

local mason_path = vim.fn.glob(vim.fn.stdpath("data") .. "/mason/")
pcall(function()
	-- /home/matteo/.local/share/nvim/mason/packages/debugpy/venv/bin
	require("dap-python").setup(mason_path .. "packages/debugpy/venv/bin/python")
end)

table.insert(require("dap").configurations.python, {
	type = "python",
	request = "launch",
	args = "-Xfrozen_modules=off",
	name = "Python launch config",
	program = "${file}",
	-- ... more options, see https://github.com/microsoft/debugpy/wiki/Debugsconfiguration-settings
})
