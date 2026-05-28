local angularls_path = vim.fn.stdpath("data") .. "/mason/packages/angular-language-service"

return {
	on_new_config = function(new_config, new_root_dir)
		new_config.cmd = {
			"ngserver",
			"--stdio",
			-- typescript must be resolved from the project's own node_modules
			"--tsProbeLocations", new_root_dir .. "/node_modules",
			-- @angular/language-server lives in the mason package
			"--ngProbeLocations", angularls_path .. "/node_modules",
		}
	end,
}
