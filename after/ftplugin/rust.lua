vim.opt_local.expandtab = true
vim.opt_local.shiftwidth = 4
vim.opt_local.softtabstop = 4
vim.opt_local.formatoptions:append({ c = true, r = true, o = true, q = true })

local bufnr = vim.api.nvim_get_current_buf()
vim.keymap.set("n", "<leader>rca", function()
	vim.cmd.RustLsp("codeAction")
end, { silent = true, buffer = bufnr, desc = "[C]ode [A]ction for Rust" })

-- Override Neovim's built-in hover keymap with rustaceanvim's hover actions
vim.keymap.set("n", "K", function()
	vim.cmd.RustLsp({ "hover", "actions" })
end, { silent = true, buffer = bufnr, desc = "[H]over for Rust" })

vim.keymap.set("n", "<leader>rem", function()
	vim.cmd.RustLsp("expandMacro")
end, { silent = true, buffer = bufnr, desc = "[R]ust [E]xpand [M]acro" })

vim.keymap.set("n", "<leader>rmu", function()
	vim.cmd.RustLsp({ "moveItem", "up" })
end, { silent = true, buffer = bufnr, desc = "[R]ust [M]ove item [U]p" })

vim.keymap.set("n", "<leader>rmd", function()
	vim.cmd.RustLsp({ "moveItem", "down" })
end, { silent = true, buffer = bufnr, desc = "[R]ust [M]ove item [D]own" })

vim.keymap.set("n", "<leader>ree", function()
	vim.cmd.RustLsp({ "explainError", "cycle" })
end, { silent = true, buffer = bufnr, desc = "[R]ust [E]xplain [E]rror" })

vim.keymap.set("n", "<leader>rrd", function()
	vim.cmd.RustLsp({ "renderDiagnostic", "cycle" })
end, { silent = true, buffer = bufnr, desc = "[R]ust [R]ender [D]iagnostics" })

vim.keymap.set("n", "<leader>rjr", function()
	vim.cmd.RustLsp("relatedDiagnostics")
end, { silent = true, buffer = bufnr, desc = "[R]ust [J]ump to [R]elated Diagnostic" })

vim.keymap.set("n", "<leader>rjl", function()
	vim.cmd.RustLsp("joinLines")
end, { silent = true, buffer = bufnr, desc = "[R]ust [J]oin [L]ines" })

vim.keymap.set("n", "<leader>rfc", function()
	vim.cmd.RustLsp("flyCheck")
end, { silent = true, buffer = bufnr, desc = "[R]ust [F]ly [C]heck" })
