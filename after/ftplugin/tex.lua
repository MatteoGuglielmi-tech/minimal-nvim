-- vim.g.tex_flavor = "latex"

vim.opt_local.shiftwidth = 2
vim.opt_local.tabstop = 2
vim.opt_local.softtabstop = 2
vim.opt_local.expandtab = true

--[[
Previewer modes
plain: Typeset the current version of the document in the buffer. (default)
diff: Typeset the diff of the current version against the saved version.
git: Typeset the current version of the document against the git master. 
]]

vim.keymap.set("n", "<leader>lp", "<cmd>LatexPreviewToggle<CR>", { desc = "[L]aTeX [P]review" })
vim.keymap.set("n", "<leader>lm", "<cmd>PrevLatexPreviewMode<CR>", { desc = "[L]aTeX previous preview [M]ode" })
vim.keymap.set("n", "<leader>ln", "<cmd>NextLatexPreviewMode<CR>", { desc = "[L]aTeX previous preview [M]ode" })
