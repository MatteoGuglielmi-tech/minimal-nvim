return {
	"mfussenegger/nvim-lint",
	event = { "BufReadPre", "BufNewFile" },
	config = function()
		require("lint").linters_by_ft = {
			gitcommit = { "commitlint" },
			bash = { "shellcheck" },
			zsh = { "zsh" },
		}
	end,
}
