local M = {}

M.config = function()
	return {
		auto_open = true,
		notify = {
			threshold = vim.log.levels.INFO,
		},
		icons = { expanded = "", collapsed = "", circular = "" },
		mappings = {
			expand = { "<CR>" },
			open = "o",
			remove = "d",
			edit = "e",
			repl = "r",
			toggle = "t",
		},
		element_mappings = {},
		expand_lines = true,
		layouts = {
			{
				elements = {
					{ id = "scopes", size = 0.50 },
					{ id = "stacks", size = 0.20 },
					{ id = "watches", size = 0.30 },
				},
				size = 0.3,
				position = "right",
			},
			{
				elements = {
					{ id = "repl", size = 0.5 },
					{ id = "console", size = 0.5 },
				},
				size = 0.2,
				position = "bottom",
			},
		},
		controls = {
			enabled = true,
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
			max_width = 0.8,
			border = "rounded",
			mappings = {
				close = { "q", "<Esc>" },
			},
		},
		windows = { indent = 1 },
		render = {
			max_type_length = nil,
			max_value_lines = 100,
		},
	}
end

return M

