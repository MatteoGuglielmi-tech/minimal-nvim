local M = {}

function M.get_python_path()
	local pixi_python = M.get_pixi_python_path()
	if pixi_python then
		return pixi_python
	end

	return M.get_conda_python_path()
end

function M.get_pixi_python_path()
	local pixi_root = vim.fn.expand("$PIXI_PROJECT_ROOT")
	if pixi_root ~= "" and pixi_root ~= "$PIXI_PROJECT_ROOT" then
		local python_path = pixi_root .. "/.pixi/envs/dev/bin/python"
		if vim.fn.executable(python_path) == 1 then
			return python_path
		end
	end
	return nil
end

function M.get_conda_python_path()
	local conda_prefix = vim.fn.expand("$CONDA_PREFIX")
	if conda_prefix == nil or conda_prefix == "" then
		return nil
	end
	if conda_prefix then
		return conda_prefix .. "/bin/python"
	end
	return nil
end

return M
