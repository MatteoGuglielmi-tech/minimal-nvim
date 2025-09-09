vim.opt_local.expandtab = true
vim.opt_local.shiftwidth = 4
vim.opt_local.softtabstop = 4
vim.opt_local.formatoptions:append({ c = true, r = true, o = true, q = true })

local bufnr = vim.api.nvim_get_current_buf()
vim.keymap.set("n", "<leader>rca", function()
	vim.cmd.RustLsp("codeAction")
end, { silent = true, buffer = bufnr, desc = "[R]ust: [c]ode [a]ction" })

-- Override Neovim's built-in hover keymap with rustaceanvim's hover actions
vim.keymap.set("n", "K", function()
	vim.cmd.RustLsp({ "hover", "actions" })
end, { silent = true, buffer = bufnr, desc = "Rust: hover [K]" })

vim.keymap.set("n", "<leader>rem", function()
	vim.cmd.RustLsp("expandMacro")
end, { silent = true, buffer = bufnr, desc = "[R]ust: [e]xpand [m]acro" })

vim.keymap.set("n", "<leader>rmu", function()
	vim.cmd.RustLsp({ "moveItem", "up" })
end, { silent = true, buffer = bufnr, desc = "[R]ust: [m]ove item [u]p" })

vim.keymap.set("n", "<leader>rmd", function()
	vim.cmd.RustLsp({ "moveItem", "down" })
end, { silent = true, buffer = bufnr, desc = "[R]ust: [m]ove item [d]own" })

vim.keymap.set("n", "<leader>ree", function()
	vim.cmd.RustLsp({ "explainError", "cycle" })
end, { silent = true, buffer = bufnr, desc = "[R]ust: [e]xplain [e]rror" })

vim.keymap.set("n", "<leader>rrd", function()
	vim.cmd.RustLsp({ "renderDiagnostic", "cycle" })
end, { silent = true, buffer = bufnr, desc = "[R]ust: [r]ender [d]iagnostics" })

vim.keymap.set("n", "<leader>rjr", function()
	vim.cmd.RustLsp("relatedDiagnostics")
end, { silent = true, buffer = bufnr, desc = "[R]ust [J]ump to [R]elated Diagnostic" })

vim.keymap.set("n", "<leader>rjl", function()
	vim.cmd.RustLsp("joinLines")
end, { silent = true, buffer = bufnr, desc = "[R]ust: [j]oin [l]ines" })

vim.keymap.set("n", "<leader>rfc", function()
	vim.cmd.RustLsp("flyCheck")
end, { silent = true, buffer = bufnr, desc = "[R]ust: [f]ly [c]heck" })
