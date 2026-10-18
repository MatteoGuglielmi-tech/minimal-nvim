-- rust-analyzer needs cargo/rustc on PATH to load the workspace, and the
-- rust-src sources to resolve std/core (hover and go-to-definition on std
-- items such as `str::lines`).
--
-- The Rust toolchain used by these projects is installed by pixi inside
-- <project>/.pixi/envs/<env>/bin, which is not on the global PATH when
-- Neovim is not started from a `pixi shell`. Expose it here: this file is
-- sourced before rustaceanvim's own ftplugin, which is what starts the LSP.
local function expose_pixi_toolchain()
	local project_root = vim.fs.root(vim.api.nvim_buf_get_name(0), ".pixi")
	if not project_root then
		return
	end

	local env_name = vim.env.PIXI_ENVIRONMENT_NAME
	if env_name == nil or env_name == "" then
		env_name = "default"
	end

	local bin = project_root .. "/.pixi/envs/" .. env_name .. "/bin"
	if vim.fn.isdirectory(bin) == 0 then
		return
	end

	-- Drop previously injected pixi bins so the most recently opened project wins.
	local dirs = vim.tbl_filter(function(dir)
		return not dir:match("/%.pixi/envs/[^/]+/bin$")
	end, vim.split(vim.env.PATH or "", ":", { plain = true, trimempty = true }))

	table.insert(dirs, 1, bin)
	vim.env.PATH = table.concat(dirs, ":")
end

expose_pixi_toolchain()
