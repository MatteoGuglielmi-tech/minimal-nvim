vim.bo.commentstring = "// %s"
vim.opt_local.expandtab = true
vim.opt_local.tabstop = 4
vim.opt_local.softtabstop = 4
vim.opt_local.shiftwidth = 4
vim.opt_local.formatoptions:append({ c = true, r = true, o = true, q = true })

local ok, jdtls = pcall(require, "jdtls")
if not ok then
	return
end

local root_markers = {
	"mvnw",
	"gradlew",
	"pom.xml",
	"build.gradle",
	"build.gradle.kts",
	"settings.gradle",
	"settings.gradle.kts",
	".git",
}

local root_dir = vim.fs.root(0, root_markers) or vim.fn.getcwd()
local project_name = vim.fn.fnamemodify(root_dir:gsub("[/\\]$", ""), ":t")
if project_name == "" then
	project_name = "default"
end

local workspace_dir = vim.fs.joinpath(vim.fn.stdpath("cache"), "jdtls", "workspace", project_name)
vim.fn.mkdir(workspace_dir, "p")

local jdtls_cmd = vim.fn.exepath("jdtls")
if jdtls_cmd == "" then
	jdtls_cmd = vim.fs.joinpath(vim.fn.stdpath("data"), "mason", "bin", "jdtls")
end

jdtls.start_or_attach({
	name = "jdtls",
	cmd = { jdtls_cmd, "-data", workspace_dir },
	root_dir = root_dir,
	settings = {
		java = {},
	},
	init_options = {
		bundles = {},
	},
})

local opts = { buffer = true }
vim.keymap.set(
	"n",
	"<leader>jo",
	jdtls.organize_imports,
	vim.tbl_extend("force", opts, { desc = "Java: Organize Imports" })
)
vim.keymap.set(
	"n",
	"<leader>jv",
	jdtls.extract_variable,
	vim.tbl_extend("force", opts, { desc = "Java: Extract Variable" })
)
vim.keymap.set("x", "<leader>jv", function()
	jdtls.extract_variable(true)
end, vim.tbl_extend("force", opts, { desc = "Java: Extract Variable" }))
vim.keymap.set(
	"n",
	"<leader>jc",
	jdtls.extract_constant,
	vim.tbl_extend("force", opts, { desc = "Java: Extract Constant" })
)
vim.keymap.set("x", "<leader>jc", function()
	jdtls.extract_constant(true)
end, vim.tbl_extend("force", opts, { desc = "Java: Extract Constant" }))
vim.keymap.set("x", "<leader>jm", function()
	jdtls.extract_method(true)
end, vim.tbl_extend("force", opts, { desc = "Java: Extract Method" }))
