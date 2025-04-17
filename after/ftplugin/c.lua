vim.opt_local.expandtab = true
vim.opt_local.shiftwidth = 4
vim.opt_local.softtabstop = 4
vim.opt_local.formatoptions:append({ c = true, r = true, o = true, q = true })

-- fallback on conform.format
-- vim.keymap.set("n", "<leader>f", vim.lsp.buf.format, { desc = "[F]ormat buffer" })
