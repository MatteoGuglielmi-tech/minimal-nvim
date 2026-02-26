return {
	"folke/todo-comments.nvim",
	dependencies = { "nvim-lua/plenary.nvim" },
	opts = {
		keywords = {
			FIX = { icon = " ", color = "error", alt = { "FIXME", "BUG" } },
			TODO = { icon = " ", color = "info" },
			HACK = { icon = " ", color = "warning", alt = { "KEY", "hack" } },
			WARN = { icon = " ", color = "warning", alt = { "WARNING", "REMIND" } },
			PERF = { icon = "", alt = { "OPTIM", "PERF", "OPTIMIZE" } },
			NOTE = { icon = "", color = "hint", alt = { "INFO" } },
			TEST = { icon = "⏲ ", color = "test", alt = { "TESTING", "PASSED", "FAILED" } },
		},
	},
	keys = {
		{
			"<leader>t",
			function()
				Snacks.picker.todo_comments()
			end,
			desc = "Todo",
		},
		{
			"<leader>T",
			function()
				vim.ui.input({ prompt = "Glob pattern (empty for all): " }, function(glob)
					if glob and glob ~= "" then
						Snacks.picker.todo_comments({ glob = glob })
					else
						Snacks.picker.todo_comments()
					end
				end)
			end,
			desc = "Todo with glob",
		},
		{
			"<leader>tc",
			function()
				Snacks.picker.todo_comments({ keywords = { "TODO", "FIX", "FIXME", "BUG" } })
			end,
			desc = "Todo/Fix/Fixme workspace",
		},
		{
			"<leader>tC",
			function()
				vim.ui.input({ prompt = "Glob pattern (empty for all): " }, function(glob)
					if glob and glob ~= "" then
						Snacks.picker.todo_comments({ keywords = { "TODO", "FIX", "FIXME", "BUG" }, glob = glob })
					else
						Snacks.picker.todo_comments({ keywords = { "TODO", "FIX", "FIXME", "BUG" } })
					end
				end)
			end,
			desc = "Todo/Fix/Fixme workspace with glob",
		},
		{
			"<leader>tb",
			function()
				Snacks.picker.todo_comments({
					keywords = { "TODO", "FIX", "FIXME", "BUG" },
					dirs = { vim.fn.expand("%:p") },
				})
			end,
			desc = "[T]odo comments in [B]uffer",
		},
	},
}
