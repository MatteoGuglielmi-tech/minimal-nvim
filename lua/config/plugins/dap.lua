return {
	"rcarriga/nvim-dap-ui",
	dependencies = {
		"nvim-neotest/nvim-nio",
		"theHamsta/nvim-dap-virtual-text",
	},
	config = function()
		local dap = require("dap")
		local dapui = require("dapui")
		local dapuiconfig = require("config.dapuiconf").config()

		---@diagnostic disable-next-line: missing-fields
		require("nvim-dap-virtual-text").setup({})

		-- Set pretty signs for nvim-dap

		-- "🛑", "🚨", "🚫", "📌",  "📍"
		vim.fn.sign_define("DapBreakpoint", { text = "⛔", texthl = "Error", linehl = "", numhl = "" })
		-- "🤔", "🔎"
		vim.fn.sign_define("DapBreakpointCondition", { text = "⁉️", texthl = "", linehl = "", numhl = "" })
		-- "💬"
		vim.fn.sign_define("DapLogPoint", { text = "📢", texthl = "", linehl = "", numhl = "" })
		vim.fn.sign_define(
			"DapStopped",
			{ text = "▶️", texthl = "DiagnosticSignWarn", linehl = "Visual", numhl = "DiagnosticSignWarn" }
		)
		vim.fn.sign_define(
			"DapBreakpointRejected",
			{ text = "❌", texthl = "DiagnosticsSignError", linehl = "", numhl = "DiagnosticsSignError" }
		)

		dap.set_log_level("info")

		--- setting ui ---
		dapui.setup(dapuiconfig)
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

		--- setting keymaps ---
		vim.keymap.set("n", "<F5>", dap.continue, { desc = "DAP: Start/Continue" })
		vim.keymap.set("n", "<S-F5>", dap.restart, { desc = "DAP: ReStart" })
		vim.keymap.set("n", "<leader>dq", dap.terminate, { desc = "DAP : Terminate" })
		-- vim.keymap.set("n", "<C-M-F5>", dap.close, { desc = "DAP : Close" })
		vim.keymap.set("n", "<F6>", dap.run_to_cursor, { desc = "DAP: Run to cursor" })
		vim.keymap.set("n", "<F10>", dap.step_over, { desc = "DAP: Step Over" })
		vim.keymap.set("n", "<F11>", dap.step_into, { desc = "DAP: Step Into" })
		vim.keymap.set("n", "<F12>", dap.step_out, { desc = "DAP: Step Out" })
		vim.keymap.set("n", "<F9>", dap.toggle_breakpoint, { desc = "DAP: Toggle Breakpoint" })

		vim.keymap.set("n", "<leader>db", function()
			local condition = vim.fn.input("Breakpoint Condition: ")
			dap.set_breakpoint(condition)
		end, { desc = "DAP: Set Breakpoint with condition" })

		-- Set a keymap for creating a DAP logpoint
		vim.keymap.set("n", "<leader>bl", function()
			-- Prompt the user for the message to log
			local log_message = vim.fn.input("Log Message: ")
			-- Ensure the user entered a message before setting the logpoint
			if log_message ~= "" then
				dap.set_breakpoint(nil, nil, log_message)
			end
		end, { desc = "DAP: Set Log Point" })

		vim.keymap.set("n", "<leader>dD", dap.disconnect, { desc = "DAP: Disconnect" })
		vim.keymap.set("n", "<leader>di", dap.step_back, { desc = "DAP: Step Back" })

		vim.keymap.set("n", "<leader>dK", function()
			dap.ui.widgets.hover()
		end, { desc = "DAP: Info expression under cursor" })
		vim.keymap.set("n", "<leader>dt", dapui.toggle, { desc = "DAP: Manual Toggle." })

		local ivy_theme = require("telescope.themes").get_ivy()
		local themed_dap = {
			variables = function()
				require("telescope").extensions.dap.variables(ivy_theme)
			end,
			scopes = function()
				require("telescope").extensions.dap.scopes(ivy_theme)
			end,
			frames = function ()
				require("telescope").extensions.dap.frames(ivy_theme)
			end
		}

		local callback_lbs = function ()
			require("telescope").extensions.dap.list_breakpoints()
		end
		local callback_dap_cmds = function ()
			require('telescope').extensions.dap.commands()
		end

		vim.keymap.set('n', '<leader>dl', callback_lbs, { desc = "[D]AP: [L]ist Breakpoints" })
		vim.keymap.set('n', '<leader>dv', themed_dap.variables, { desc = "[D]AP: List [V]ariables" })
		vim.keymap.set('n', '<leader>dp', themed_dap.scopes, { desc = "[D]AP: List Sco[p]es" })
		vim.keymap.set('n', '<leader>df', themed_dap.frames, { desc = "[D]AP: List [F]rames" })
		vim.keymap.set('n', '<leader>dc', callback_dap_cmds, { desc = "[D]AP: List [F]rames" })

		local function resize_float(direction)
			local win_id = vim.api.nvim_get_current_win()
			local win_config = vim.api.nvim_win_get_config(win_id)

			-- Ensure we are in a floating window
			if win_config.relative == "" then
				return
			end

			local amount = 2
			if direction == "up" then
				vim.api.nvim_win_set_height(win_id, vim.api.nvim_win_get_height(win_id) - amount)
			elseif direction == "down" then
				vim.api.nvim_win_set_height(win_id, vim.api.nvim_win_get_height(win_id) + amount)
			elseif direction == "left" then
				vim.api.nvim_win_set_width(win_id, vim.api.nvim_win_get_width(win_id) - amount)
			elseif direction == "right" then
				vim.api.nvim_win_set_width(win_id, vim.api.nvim_win_get_width(win_id) + amount)
			end
		end

		-- Keymaps for resizing floating windows
		vim.keymap.set("n", "<C-Up>", function()
			resize_float("up")
		end, { desc = "Resize Float Up" })
		vim.keymap.set("n", "<C-Down>", function()
			resize_float("down")
		end, { desc = "Resize Float Down" })
		vim.keymap.set("n", "<C-Left>", function()
			resize_float("left")
		end, { desc = "Resize Float Left" })
		vim.keymap.set("n", "<C-Right>", function()
			resize_float("right")
		end, { desc = "Resize Float Right" })

		-- Keymap to open a floating window with the full value of the variable under the cursor
		vim.keymap.set("n", "<leader>de", function()
			require("dapui").eval()
		end, { desc = "[D]AP: [e]valuate variable under cursor" })

		-- Keymap to open a large, floating REPL for interactive evaluation
		vim.keymap.set("n", "<leader>dr", function()
			require("dapui").float_element("repl")
		end, { desc = "[D]AP: open floating [R]EPL" })

	end,
}
