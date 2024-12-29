local ui = {
	auto_open = true,
	notify = {
		threshold = vim.log.levels.INFO,
	},
	config = {
		icons = { expanded = "", collapsed = "", circular = "" },
		mappings = {
			-- Use a table to apply multiple mappings
			expand = { "<CR>", "<2-LeftMouse>" },
			open = "o",
			remove = "d",
			edit = "e",
			repl = "r",
			toggle = "t",
		},
		-- Use this to override mappings for specific elements
		element_mappings = {},
		expand_lines = true,
		layouts = {
			{
				elements = {
					{ id = "scopes", size = 0.55 },
					{ id = "breakpoints", size = 0.1 },
					{ id = "stacks", size = 0.35 },
					-- { id = "watches", size = 0.25 },
				},
				size = 0.1,
				position = "left",
			},
			{
				elements = {
					-- { id = "repl", size = 0.45 },
					{ id = "console", size = 0.9 },
				},
				size = 0.2,
				position = "bottom",
			},
		},
		controls = {
			enabled = true,
			-- Display controls in this element
			element = "repl",
			icons = {
				pause = "",
				play = "",
				step_into = "",
				step_over = "",
				step_out = "",
				step_back = "",
				run_last = "",
				terminate = "",
			},
		},
		floating = {
			max_height = 0.9,
			max_width = 0.65, -- Floats will be treated as percentage of your screen.
			border = "rounded",
			mappings = {
				close = { "q", "<Esc>" },
			},
		},
		windows = { indent = 1 },
		render = {
			max_type_length = nil, -- Can be integer or nil.
			max_value_lines = 100, -- Can be integer or nil.
		},
	},
}

return {
	"mfussenegger/nvim-dap",
	dependencies = {
		"rcarriga/nvim-dap-ui",
		"nvim-neotest/nvim-nio",
		"williamboman/mason.nvim",
		"jay-babu/mason-nvim-dap.nvim",
		"theHamsta/nvim-dap-virtual-text",
		-- custom debugger
		"mfussenegger/nvim-dap-python",
	},
	config = function()
		local dap = require("dap")
		local dapui = require("dapui")

		require("mason-nvim-dap").setup({
			automatic_installation = true,
			handlers = {},
			ensure_installed = {
				-- debuggers
				"debugpy",
				-- "bash-debug-adapter",
			},
		})

		require("nvim-dap-virtual-text").setup({})

		local map = function(obj, icon, thl, lhl, nhl)
			vim.fn.sign_define(obj, { text = icon, texthl = thl, linehl = lhl, numhl = nhl })
		end

		local cond_breakpoint = function()
			dap.set_breakpoint(vim.fn.input("Breakpoint condition: "))
		end

		local dap_ui_hover = function()
			dap.ui.widgets.hover()
		end

		local dap_ui_eval = function()
			dapui.eval(vim.fn.input("[Expression] > "))
		end

		map("DapBreakpoint", "🐞", "DiagnosticsSignWarn", "", "")
		map("DapBreakpointRejected", "🚫", "DiagnosticsSignError", "", "")
		map("DapStopped", "🚨", "DiagnosticSignWarn", "Visual", "DiagnosticSignWarn")

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

		dapui.setup(ui.config)

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

		local mason_path = vim.fn.glob(vim.fn.stdpath("data") .. "/mason/")
		pcall(function()
			-- /home/matteo/.local/share/nvim/mason/packages/debugpy/venv/bin
			require("dap-python").setup(mason_path .. "packages/debugpy/venv/bin/python")
		end)

		-- looks for .vscode/launch.json
		require("dap.ext.vscode").load_launchjs(nil, { debugpy = { "python" } })

		-- table.insert(require("dap").configurations.python, {
		-- 	type = "python",
		-- 	request = "launch",
		-- 	args = "-Xfrozen_modules=off",
		-- 	name = "Python launch config",
		-- 	program = "${file}",
		-- 	-- ... more options, see https://github.com/microsoft/debugpy/wiki/Debugsconfiguration-settings
		-- })
	end,
}
