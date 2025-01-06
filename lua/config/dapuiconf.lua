local M = {}

M.config = function()
	return {
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
end

return M
