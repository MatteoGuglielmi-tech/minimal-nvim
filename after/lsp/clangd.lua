return {
	cmd = { "clangd" },
	filetypes = { "c", "c~", "cpp" },
	single_file_support = true,
	settings = {
		clangd = {
			InlayHints = {
				ParameterNames = true,
				DeducedTypes = true,
			},
		},
	},
}
