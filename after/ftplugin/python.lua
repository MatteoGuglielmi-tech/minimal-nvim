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

-- terminal
local job_id = 0
vim.keymap.set("n", "<space>st", function()
	vim.cmd.vnew()
	vim.cmd.term()
	vim.cmd.wincmd("J")
	vim.api.nvim_win_set_height(0, 15)
	job_id = vim.bo.channel
end, { desc = "Add terminal split" })

vim.keymap.set("n", "<leader>ct", function()
	vim.fn.chansend(job_id, { "py main.py" })
end)
