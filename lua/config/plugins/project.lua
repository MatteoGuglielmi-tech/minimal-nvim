return {
  "ahmedkhalf/project.nvim",
  config = function()
    -- project.nvim (unmaintained) calls the deprecated vim.lsp.buf_get_clients().
    -- Alias it to the modern API (current-buffer default) to drop the warning.
    vim.lsp.buf_get_clients = function(bufnr)
      return vim.lsp.get_clients({ bufnr = bufnr or 0 })
    end

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
