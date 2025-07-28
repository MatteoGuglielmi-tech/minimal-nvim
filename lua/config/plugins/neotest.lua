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
				-- require("rustaceanvim.neotest"),
			},
		})

		vim.keymap.set("n", "<leader>nr", function()
			require("neotest").run.run()
		end, { desc = "[N]eotest: [r]un nearest test" })

		vim.keymap.set("n", "<leader>nf", function()
			require("neotest").run.run(vim.fn.expand("%"))
		end, { desc = "[N]eotest: run the current [f]ile" })

		vim.keymap.set("n", "<leader>nd", function()
			require("neotest").run.run({strategy = "dap", suite=false})
		end, { desc = "[N]eotest: [d]ebug the nearest test" })

		vim.keymap.set("n", "<leader>ns", function()
			require("neotest").run.stop()
		end, { desc = "[N]eotest: [s]top nearest test" })

		vim.keymap.set("n", "<leader>na", function()
			require("neotest").run.attach()
		end, { desc = "[N]eotst: [a]ttach the nearest test" })

		vim.keymap.set("n", "<leader>no", function()
			require("neotest").output.open({ enter = true, short = true })
		end, { desc = "[N]eotest: displays nearest test [o]utput" })

		vim.keymap.set("n", "<leader>nt", function()
			require("neotest").output_panel.toggle()
		end, { desc = "[N]eotest: [t]oggle output panel" })

		vim.keymap.set("n", "<leader>nw", function()
			require("neotest").watch()
		end, { desc = "[N]eotest: [w]atch files related to [t]ests for changes and re-run tests" })

		vim.keymap.set("n", "<leader>ni", function()
			require("neotest").summary.toggle()
		end, { desc = "[N]eotest: test [i]nfo (summary)" })

		vim.keymap.set("n", "[f", function()
			require("neotest").jump.prev({ status = "failed" })
		end, { desc = "[N]eotest: jump to previous failed test" })

		vim.keymap.set("n", "]f", function()
			require("neotest").jump.next({ status = "failed" })
		end, { desc = "[N]eotest: jump to next failed test" })

		vim.keymap.set("n", "[t", function()
			require("neotest").jump.prev()
		end, { desc = "[N]eotest: jump to previous failed test" })

		vim.keymap.set("n", "]t", function()
			require("neotest").jump.next()
		end, { desc = "[N]eotest: jump to next failed test" })
	end,
}
