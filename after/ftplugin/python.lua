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
