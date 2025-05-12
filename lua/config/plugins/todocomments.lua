return {
	"folke/todo-comments.nvim",
	dependencies = { "nvim-lua/plenary.nvim" },
	config = function()
		require("todo-comments").setup({
			keywords = {
				FIX = { icon = " ", color = "error", alt = { "FIXME", "BUG", "FIXIT", "ISSUE", "fix", "bug" } },
				TODO = { icon = " ", color = "info", alt = { "todo" } },
				HACK = { icon = " ", color = "warning", alt = { "KEY", "hack" } },
				WARN = {
					icon = " ",
					color = "warning",
					alt = { "WARNING", "REMIND", "warning", "reminder", "important" },
				},
				PERF = { icon = "", alt = { "OPTIM", "PERFORMANCE", "OPTIMIZE", "perf", "optimize", "improvement" } },
				NOTE = { icon = "", color = "hint", alt = { "INFO", "note", "info" } },
				TEST = { icon = "⏲ ", color = "test", alt = { "TESTING", "PASSED", "FAILED", "test" } },
			},
		})
	end,
}
