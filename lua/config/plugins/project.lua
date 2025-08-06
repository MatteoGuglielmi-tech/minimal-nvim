return {
  "ahmedkhalf/project.nvim",
  config = function()
    require("project_nvim").setup({
      detection_methods = { "lsp", "pattern" },

      -- Patterns used to find the root directory
      patterns = {
        ".git",
        ".env",
        "README.md",
        "LICENSE",
        "pyproject.toml",
        "package.json",
				"setup/",
				"tests/",
				".vscode/"
      },
    })
  end,
}
