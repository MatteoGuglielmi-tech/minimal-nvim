return {
	"mfussenegger/nvim-lint",
	event = { "BufReadPre", "BufNewFile" },
	config = function()
		require("lint").linters_by_ft = {
			-- c = { "cpplint" },
			gitcommit = { "commitlint" },
			markdown = { "markdownlint" },
			bash = { "shellcheck" },
			zsh = { "zsh" },
		}
	end,
}
