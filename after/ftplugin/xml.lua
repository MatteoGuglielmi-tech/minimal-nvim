vim.bo.commentstring = "<!-- %s -->"
vim.opt_local.expandtab = true
vim.opt_local.tabstop = 2
vim.opt_local.softtabstop = 2
vim.opt_local.shiftwidth = 2
vim.opt_local.formatoptions:append({ c = true, r = true, o = true, q = true })

local bufnr = vim.api.nvim_get_current_buf()

local function map_xml_lsp_aliases(client)
	if client.name ~= "lemminx" then
		return
	end

	if client:supports_method("textDocument/rename", bufnr) then
		vim.keymap.set("n", "<leader>xr", vim.lsp.buf.rename, { buffer = bufnr, desc = "XML: Rename Symbol" })
	end

	if client:supports_method("textDocument/codeAction", bufnr) then
		vim.keymap.set("n", "<leader>xa", vim.lsp.buf.code_action, { buffer = bufnr, desc = "XML: Code Action" })
	end
end

local function map_attached_xml_clients()
	for _, client in ipairs(vim.lsp.get_clients({ bufnr = bufnr })) do
		map_xml_lsp_aliases(client)
	end
end

map_attached_xml_clients()
vim.defer_fn(function()
	if vim.api.nvim_buf_is_valid(bufnr) then
		map_attached_xml_clients()
	end
end, 100)

vim.api.nvim_create_autocmd("LspAttach", {
	buffer = bufnr,
	callback = function(event)
		local client = vim.lsp.get_client_by_id(event.data.client_id)
		if client then
			map_xml_lsp_aliases(client)
		end
	end,
})
