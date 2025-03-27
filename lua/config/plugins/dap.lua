return {
	"rcarriga/nvim-dap-ui",
	dependencies = {
		"nvim-neotest/nvim-nio",
		{
			"jay-babu/mason-nvim-dap.nvim",
			dependencies = {
				"williamboman/mason.nvim",
				"mfussenegger/nvim-dap",
			},
		},
		"theHamsta/nvim-dap-virtual-text",
	},
	config = function()
		local dap = require("dap")
		local dapui = require("dapui")
		local dapuiconfig = require("config.dapuiconf").config()

		require("mason-nvim-dap").setup({
			automatic_installation = true,
			handlers = {},
			ensure_installed = {
				-- debuggers
				"python",
			},
		})

		---@diagnostic disable-next-line: missing-fields
		require("nvim-dap-virtual-text").setup({})

		local map = function(obj, icon, thl, lhl, nhl)
			vim.fn.sign_define(obj, { text = icon, texthl = thl, linehl = lhl, numhl = nhl })
		end
		map("DapBreakpoint", "", "Error", "", "")
		map("DapBreakpointRejected", "", "DiagnosticsSignError", "", "DiagnosticsSignError")
		map("DapStopped", "", "DiagnosticSignWarn", "Visual", "DiagnosticSignWarn")

		local cond_breakpoint = function()
			dap.set_breakpoint(vim.fn.input("Breakpoint condition: "))
		end

		local dap_ui_hover = function()
			dap.ui.widgets.hover()
		end

		local dap_ui_eval = function()
			dapui.eval(vim.fn.input("[Expression] > "))
		end

		dap.set_log_level("info")

		vim.keymap.set("n", "<F5>", dap.continue, { desc = "Debug: Start/Continue" })
		vim.keymap.set("n", "<S-F5>", dap.restart, { desc = "Debug: ReStart" })
		vim.keymap.set("n", "<C-F5>", dap.terminate, { desc = "Debug : Terminate" })
		vim.keymap.set("n", "<C-M-F5>", dap.close, { desc = "Debug : Close" })
		vim.keymap.set("n", "<F6>", dap.run_to_cursor, { desc = "Run to cursor" })
		vim.keymap.set("n", "<F10>", dap.step_over, { desc = "Debug: Step Over" })
		vim.keymap.set("n", "<F11>", dap.step_into, { desc = "Debug: Step Into" })
		vim.keymap.set("n", "<F12>", dap.step_out, { desc = "Debug: Step Out" })

		vim.keymap.set("n", "<F9>", dap.toggle_breakpoint, { desc = "Debug: Toggle Breakpoint" })
		vim.keymap.set("n", "<leader>dB", cond_breakpoint, { desc = "Debug: Set Breakpoint" })
		vim.keymap.set("n", "<leader>de", dap_ui_eval, { desc = "Evaluate Input" })

		vim.keymap.set("n", "<leader>dD", dap.disconnect, { desc = "Debug : Disconnect" })
		vim.keymap.set("n", "<leader>di", dap.step_back, { desc = "Debug: Step Back" })

		dapui.setup(dapuiconfig)

		vim.keymap.set("n", "<leader>dK", dap_ui_hover, { desc = "Debug : Info expression under cursor" })
		vim.keymap.set("n", "<leader>dt", dapui.toggle, { desc = "Debug: See last session result." })

		dap.listeners.before.attach.dapui_config = function()
			dapui.open()
		end
		dap.listeners.before.launch.dapui_config = function()
			dapui.open()
		end
		dap.listeners.before.event_terminated.dapui_config = function()
			dapui.close()
		end
		dap.listeners.before.event_exited.dapui_config = function()
			dapui.close()
		end

		-- configure codelldb adapter
		local mason_path = vim.fn.glob(vim.fn.stdpath("data") .. "/mason/")
		dap.adapters.codelldb = {
			type = "executable",
			-- port = "${port}",
			-- executable = {
			command = mason_path .. "packages/codelldb/codelldb",
			-- args = { "--port", "${port}" },
			-- },
		}
		-- setup a debugger config for zig projects
		dap.configurations.zig = {
			{
				name = "Launch Zig",
				type = "codelldb",
				request = "launch",
				program = "${workspaceFolder}/zig-out/bin/${workspaceFolderBasename}",
				cwd = "${workspaceFolder}",
				stopOnEntry = false,
				args = {},
			},
		}
	end,
}
