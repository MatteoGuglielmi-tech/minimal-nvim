-- Highlight when yanking text
vim.api.nvim_create_autocmd("TextYankPost", {
	desc = "Highlight when yanking (copying) text",
	group = vim.api.nvim_create_augroup("highlight-yank", { clear = true }),

	callback = function()
		vim.highlight.on_yank({ higroup = "Visual", timeout = 40 })
	end,
})

-- set formatoptions for autosaving
--  c: Auto-wrap comments using textwidth
--  r: Automatically insert the current comment leader after hitting <Enter> in Insert mode.
--  o: Automatically insert the current comment leader after hitting 'o' or 'O' in Normal mode.
vim.api.nvim_create_autocmd({ "BufWinEnter" }, {
	callback = function()
		vim.cmd("set formatoptions-=cro")
	end,
})

-- this command ensures that when opening a buffer of a specific file type, the latter is silently closed and not added to the buffer list
vim.api.nvim_create_autocmd({ "FileType" }, {
	pattern = {
		"git",
		"help",
		"man",
		"lspinfo",
		"nvim",
		"",
	},
	callback = function()
		vim.cmd([[
nnoremap <silent> <buffer> q :close<CR>
set nobuflisted
]])
	end,
})

-- when entering a terminal, this command ensures that we enter normal mode
vim.api.nvim_create_autocmd({ "CmdWinEnter" }, {
	callback = function()
		vim.cmd("quit")
	end,
})

-- when splittings, this command ensures that the window sizes are equal
vim.api.nvim_create_autocmd({ "VimResized" }, {
	callback = function()
		vim.cmd("tabdo wincmd =")
	end,
})

vim.api.nvim_create_autocmd({ "BufWinEnter" }, {
	pattern = { "*" },
	callback = function()
		vim.cmd("checktime")
	end,
})

-- this autocommand enables spell checking and line wrapping for filetypes in "pattern"
vim.api.nvim_create_autocmd({ "FileType" }, {
	pattern = { "gitcommit", "markdown", "NeogitCommitMessage", "latex", "plaintex", "tex" },
	callback = function()
		vim.opt_local.wrap = true
		vim.opt_local.spell = true
	end,
})

vim.api.nvim_create_autocmd("LspAttach", {
	group = vim.api.nvim_create_augroup("lsp", { clear = true }),
	callback = function(event)
		local map = function(keys, func, desc)
			vim.keymap.set("n", keys, func, { buffer = event.buf, desc = "LSP: " .. desc })
		end

		local client = vim.lsp.get_client_by_id(event.data.client_id)
		if not client then
			return
		end

		-- Jump among diagnostics ---
		map("[d", "<cmd>lua vim.diagnostic.goto_prev()<CR>", "Previous diagnostic")
		map("]d", "<cmd>lua vim.diagnostic.goto_next()<CR>", "Next diagnostic")
		map("<leader>tw", "<cmd>Trouble diagnostics<CR>", "[T]rouble: [W]orkspace Diagnostic")
		map("<leader>tb", "<cmd>Trouble diagnostics toggle filter.buf=0<CR>", "[T]rouble: [B]uffer Diagnostics")
		--------------------------

		-- Jump around ---
		--  To jump back, press <C-t>.
		map("gd", require("telescope.builtin").lsp_definitions, "Telescope: [G]oto [D]definition")
		map("<leader>tr", "<cmd>Trouble lsp_references<CR>", "[T]rouble: [R]eferences")
		map("<leader>ti", "<cmd>Trouble lsp_implementations<CR>", "[T]rouble: [I]mplementation")
		map("<leader>gr", require("telescope.builtin").lsp_references, "Telescope: [G]oto [R]eferences")
		-- map("<leader>ti", require("telescope.builtin").lsp_implementations, "[T]elescope: [I]mplementations")
		--------------------------

		-- Fuzzy find symbols ---
		map("<leader>bs", require("telescope.builtin").lsp_document_symbols, "Telescope: [B]uffer [S]symbols")
		map(
			"<leader>ws",
			require("telescope.builtin").lsp_dynamic_workspace_symbols,
			"Telescope: [W]orkspace [S]symbols"
		)
		--------------------------

		-- Rename all occurences of word under cursor ---
		map("<leader>rn", vim.lsp.buf.rename, "LSP: [R]e[n]ame")
		--------------------------

		-- Check code actions proposed by lsp ---
		---@diagnostic disable-next-line: missing-parameter, param-type-mismatch
		if client.supports_method("textDocument/codeAction") then
			map("<leader>ca", vim.lsp.buf.code_action, "LSP: [C]ode [A]ction")
		end
		--------------------------

		-- Check documentation for symbol under cursor ---
		map("K", vim.lsp.buf.hover, "LSP: Hover Documentation")
		--------------------------

		-- map("gD", vim.lsp.buf.declaration, "LSP: [G]oto [D]eclaration")

		-- Ghost hints ---
		local bufnr = event.buf
		vim.keymap.set("n", "<leader>th", function()
			vim.lsp.inlay_hint.enable(not vim.lsp.inlay_hint.is_enabled())
		end, { buffer = bufnr, desc = "LSP: [T]oggle Inlay [H]ints" })

		-- enable inlay hints automatically when the LSP attaches
		vim.lsp.inlay_hint.enable(true, { buffer = bufnr })
		--------------------------
	end,
})

vim.api.nvim_create_autocmd("LspDetach", {
	group = vim.api.nvim_create_augroup("lsp_detach", { clear = true }),
	callback = function(event2)
		vim.lsp.buf.clear_references()
		vim.api.nvim_clear_autocmds({ group = "lsp_detach", buffer = event2.buf })
	end,
})

local lint_augroup = vim.api.nvim_create_augroup("lint", { clear = true })
vim.api.nvim_create_autocmd({ "BufEnter", "BufWritePost", "InsertLeave" }, {
	group = lint_augroup,
	callback = function()
		require("lint").try_lint()
	end,
})
