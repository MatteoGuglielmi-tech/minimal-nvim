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

		-- Set pretty signs for nvim-dap

		-- "🛑", "🚨", "🚫", "📌",  "📍"
		vim.fn.sign_define("DapBreakpoint", { text = "⛔", texthl = "Error", linehl = "", numhl = "" })
		-- "🤔", "🔎", 
		vim.fn.sign_define("DapBreakpointCondition", { text = "⁉️", texthl = "", linehl = "", numhl = "" })
		-- "💬"
		vim.fn.sign_define("DapLogPoint", { text =  "📢", texthl = "", linehl = "", numhl = "" })
		vim.fn.sign_define(
			"DapStopped",
			{ text = "▶️", texthl = "DiagnosticSignWarn", linehl = "Visual", numhl = "DiagnosticSignWarn" }
		)
		vim.fn.sign_define(
			"DapBreakpointRejected",
			{ text = "❌", texthl = "DiagnosticsSignError", linehl = "", numhl = "DiagnosticsSignError" }
		)

		local dap_ui_hover = function()
			dap.ui.widgets.hover()
		end

		local dap_ui_eval = function()
			dapui.eval(vim.fn.input("[Expression] > "))
		end

		dap.set_log_level("info")

		vim.keymap.set("n", "<F5>", dap.continue, { desc = "DAP: Start/Continue" })
		vim.keymap.set("n", "<S-F5>", dap.restart, { desc = "DAP: ReStart" })
		vim.keymap.set("n", "<C-F5>", dap.terminate, { desc = "DAP : Terminate" })
		-- vim.keymap.set("n", "<C-M-F5>", dap.close, { desc = "DAP : Close" })
		vim.keymap.set("n", "<F6>", dap.run_to_cursor, { desc = "DAP: Run to cursor" })
		vim.keymap.set("n", "<F10>", dap.step_over, { desc = "DAP: Step Over" })
		vim.keymap.set("n", "<F11>", dap.step_into, { desc = "DAP: Step Into" })
		vim.keymap.set("n", "<F12>", dap.step_out, { desc = "DAP: Step Out" })

		vim.keymap.set("n", "<F9>", dap.toggle_breakpoint, { desc = "DAP: Toggle Breakpoint" })

		vim.keymap.set("n", "<leader>db", function()
			local condition = vim.fn.input("Breakpoint Condition: ")
			require("dap").set_breakpoint(condition)
		end, { desc = "DAP: Set Breakpoint with condition" })

		-- Set a keymap for creating a DAP logpoint
		vim.keymap.set("n", "<leader>bl", function()
			-- Prompt the user for the message to log
			local log_message = vim.fn.input("Log Message: ")
			-- Ensure the user entered a message before setting the logpoint
			if log_message ~= "" then
				require("dap").set_breakpoint(nil, nil, log_message)
			end
		end, { desc = "DAP: Set Log Point" })

		vim.keymap.set("n", "<leader>de", dap_ui_eval, { desc = "DAP: Evaluate Input" })

		vim.keymap.set("n", "<leader>dD", dap.disconnect, { desc = "DAP: Disconnect" })
		vim.keymap.set("n", "<leader>di", dap.step_back, { desc = "DAP: Step Back" })

		dapui.setup(dapuiconfig)

		vim.keymap.set("n", "<leader>dK", dap_ui_hover, { desc = "DAP: Info expression under cursor" })
		vim.keymap.set("n", "<leader>dt", dapui.toggle, { desc = "DAP: See last session result." })

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
