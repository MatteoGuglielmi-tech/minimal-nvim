local M = {}

---Define which command to call when formatting code (auto switch between pixi and Mason)
---@param formatter_name string
---@return string
function M.get_formatter_command(formatter_name)
	local pixi_root = vim.fn.expand("$PIXI_PROJECT_ROOT")
	if pixi_root ~= "" and pixi_root ~= "$PIXI_PROJECT_ROOT" then
		local pixi_formatter = pixi_root .. "/.pixi/envs/default/bin/" .. formatter_name
		if vim.fn.executable(pixi_formatter) == 1 then
			return pixi_formatter
		end
	end

	-- Search for pixi.toml
	local current_file = vim.fn.expand("%:p")
	local pixi_toml = vim.fs.find("pixi.toml", {
		path = current_file ~= "" and current_file or vim.fn.getcwd(),
		upward = true,
		type = "file",
	})[1]

	if pixi_toml then
		local project_root = vim.fn.fnamemodify(pixi_toml, ":h")
		local pixi_formatter = project_root .. "/.pixi/envs/default/bin/" .. formatter_name
		if vim.fn.executable(pixi_formatter) == 1 then
			return pixi_formatter
		end
	end

	-- Fall back to Mason
	local mason_formatter = vim.fn.stdpath("data") .. "/mason/bin/" .. formatter_name
	if vim.fn.executable(mason_formatter) == 1 then
		return mason_formatter
	end

	-- System fallback
	return formatter_name
end


return M
