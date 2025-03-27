local M = {}

local function filter(arr, func)
	local new_idx = 1
	local size_orig = #arr
	for i, v in pairs(arr) do
		if func(v, i) then
			arr[new_idx] = v
			new_idx = new_idx + 1
		end
	end
	for k = new_idx, size_orig do
		arr[k] = nil
	end
end

local function filter_diagnostics(diagnostic)
	if diagnostic.source ~= "Pyright" then
		return true
	end

	if diagnostic.message == '"kwargs" is not accessed' or diagnostic.message == '"args" is not accessed' then
		return false
	end

	if string.match(diagnostic.message, '"_.+" is not accessed') then
		return false
	end

	return true
end

function M.custom_on_publish_diagnostics(a, params, c)
	filter(params.diagnostics, filter_diagnostics)
	vim.lsp.diagnostic.on_publish_diagnostics(a, params, c)
end

return M
