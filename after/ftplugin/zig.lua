vim.opt_local.expandtab = true
vim.opt_local.shiftwidth = 4
vim.opt_local.softtabstop = 4
vim.opt_local.formatoptions:append({ c = true, r = true, o = true, q = true })

-- terminal
local job_id = 0
vim.keymap.set("n", "<leader>ct", function()
	vim.fn.chansend(job_id, { "zig run main.zig" })
end)
