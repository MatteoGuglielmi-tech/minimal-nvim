local tt = {}
tt.__index = tt

function tt:_get_buf_size()
	local cbuf = vim.api.nvim_get_current_buf()
	local bufinfo = vim.tbl_filter(function(buf)
		return buf.bufnr == cbuf
	end, vim.fn.getwininfo(vim.api.nvim_get_current_win()))[1]
	if bufinfo == nil then
		return { width = -1, height = -1 }
	end
	return { width = bufinfo.width, height = bufinfo.height }
end

function tt:get_dynamic_terminal_size(direction, size)
	size = size
	if direction ~= "float" and tostring(size):find(".", 1, true) then
		size = math.min(size, 1.0)
		local buf_sizes = self:_get_buf_size()
		local buf_size = direction == "horizontal" and buf_sizes.height or buf_sizes.width
		return buf_size * size
	else
		return size
	end
end

function tt:exec_toggle(opts)
	local Terminal = require("toggleterm.terminal").Terminal
	local term = Terminal:new({ cmd = opts.cmd, count = opts.count, direction = opts.direction })
	term:toggle(opts.size, opts.direction)
end

function tt:_add_exec(opts)
	local binary = opts.cmd:match("(%S+)")
	if vim.fn.executable(binary) ~= 1 then
		vim.notify("Skipping configuring executable " .. binary .. ". Please make sure it is installed properly.")
		return
	end

	vim.keymap.set({ "n", "t" }, opts.keymap, function()
		self:_exec_toggle({ cmd = opts.cmd, count = opts.count, direction = opts.direction, size = opts.size() })
	end, { desc = opts.label, noremap = true, silent = true })
end

function tt:add_execs()
	local execs = {
		{ nil, "<M-1>", "Horizontal Terminal", "horizontal", 0.3 },
		{ nil, "<M-2>", "Vertical Terminal", "vertical", 0.4 },
		{ nil, "<M-3>", "Float Terminal", "float", nil },
	}

	for i, exec in pairs(execs) do
		local direction = exec[4]
		local opts = {
			cmd = exec[1] or vim.o.shell,
			keymap = exec[2],
			label = exec[3],
			count = i + 100,
			direction = direction,
			size = function()
				return self:_get_dynamic_terminal_size(direction, exec[5])
			end,
		}

		self:_add_exec(opts)
	end
end

return tt
