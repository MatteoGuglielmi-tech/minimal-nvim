return {
	"julianolf/nvim-dap-lldb",
	dependencies = { "mfussenegger/nvim-dap" },
	ft = { "rust" },
	config = function()
		local dap = require("dap")
		local dap_lldb = require("dap-lldb")

		-- register the adapter
		dap.adapters.codelldb = {
			type = "server",
			port = "${port}",
			executable = {
				-- command = codelldb_path,
				command = "/Users/matteoguglielmi/.local/share/nvim/mason/packages/codelldb/codelldb",
				args = { "--port", "${port}" },
			},
		}

		-- rust
		dap.configurations.rust = {
			{
				name = "Launch file",
				type = "codelldb",
				request = "launch",
				program = function()
					return vim.fn.input("Path to executable: ", vim.fn.getcwd() .. "/target/debug/", "file")
				end,
				cwd = "${workspaceFolder}",
				stopOnEntry = false,
			},
		}

		-- dap.configurations.cpp = dap.configurations.rust
		-- dap.configurations.c = dap.configurations.rust

		vim.keymap.set("n", "<leader>drt", function()
			dap_lldb.debug_test()
		end, { desc = "[D]ap: debug [r]ust [t]est" })
	end,
}
