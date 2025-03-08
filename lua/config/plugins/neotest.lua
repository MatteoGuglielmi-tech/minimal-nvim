return {
	"nvim-neotest/neotest",
	dependencies = {
		"nvim-neotest/nvim-nio",
		"nvim-lua/plenary.nvim",
		"antoinemadec/FixCursorHold.nvim",
		"nvim-treesitter/nvim-treesitter",
		-- adapters
		{ "nvim-neotest/neotest-python" },
	},
	config = function()
		---@diagnostic disable-next-line: missing-fields
		require("neotest").setup({
			adapters = {
				require("neotest-python")({
					dap = { justMyCode = false },
					args = { "--log-level", "DEBUG" },
					runner = "pytest",
					python = (vim.fn.expand("$CONDA_PREFIX")) .. "/bin/python",
				}),
				require("rustaceanvim.neotest"),

				vim.keymap.set("n", "<leader>rt", function()
					require("neotest").run.run()
				end, { desc = "[R]un the nearest [T]est" }),
				vim.keymap.set("n", "<leader>rf", function()
					require("neotest").run.run(vim.fn.expand("%"))
				end, { desc = "[R]un the current [F]ile" }),
				vim.keymap.set("n", "<leader>dt", function()
					require("neotest").run.run({ strategy = "dap" })
				end, { desc = "[D]ebug the nearest [T]est" }),
				vim.keymap.set("n", "<leader>st", function()
					require("neotest").run.stop()
				end, { desc = "[S]top the nearest [T]est" }),
				vim.keymap.set("n", "<leader>at", function()
					require("neotest").run.attach()
				end, { desc = "[A]ttach the nearest [T]est" }),
				vim.keymap.set("n", "<leader>ot", function()
					require("neotest").output()
				end, { desc = "Displays [O]utput of the [T]est" }),
				vim.keymap.set("n", "<leader>wt", function()
					require("neotest").watch()
				end, { desc = "[W]atch files related to [T]ests for changes and re-run tests" }),
			},
		})
	end,
}
