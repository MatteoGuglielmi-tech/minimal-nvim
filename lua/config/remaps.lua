vim.keymap.set("n", "<space>", " ", {})
vim.keymap.set("n", "<Esc>", "<cmd>nohlsearch<CR>")
vim.keymap.set("t", "<Esc><Esc>", "<C-\\><C-n>", { desc = "Exit terminal mode" })

vim.keymap.set("n", "<C-h>", "<C-w><C-h>", { desc = "Move focus to the left window" })
vim.keymap.set("n", "<C-l>", "<C-w><C-l>", { desc = "Move focus to the right window" })
vim.keymap.set("n", "<C-j>", "<C-w><C-j>", { desc = "Move focus to the lower window" })
vim.keymap.set("n", "<C-k>", "<C-w><C-k>", { desc = "Move focus to the upper window" })

-- Window resizing
vim.keymap.set("n", "M", "<cmd>resize -2<CR>", { desc = "Shrink window horizontally" })
vim.keymap.set("n", "H", "<cmd>resize +2<CR>", { desc = "Wide window horizontally" })
vim.keymap.set("n", "<C-m>", "<cmd>vertical resize -2<CR>", { desc = "Shrink window vertically" })
vim.keymap.set("n", "<C-n>", "<cmd>vertical resize +2<CR>", { desc = "Wide window vertically" })

-- Move lines up and down
vim.keymap.set("v", "J", ":m '>+1<CR>gv=gv", { desc = "Move selected line up" })
vim.keymap.set("v", "K", ":m '<-2<CR>gv=gv", { desc = "Move selected line down" })

-- searching for keywords occurrences
vim.keymap.set("n", "n", "nzz", { desc = "" })
vim.keymap.set("n", "N", "Nzz", { desc = "" })
vim.keymap.set("n", "*", "*zz", { desc = "Find next occurrence of word under cursor" })
vim.keymap.set("n", "#", "#zz", { desc = "Find previous occurrence of word under cursor" })
vim.keymap.set("n", "g*", "g*zz", { desc = "Find next occurrences of selected char" })
vim.keymap.set("n", "g#", "g#zz", { desc = "Find previous occurrence of selected char" })

-- visualize Neovim error
vim.keymap.set("n", "<space>nm", function ()
  -- capture `:messages` output
  vim.cmd('redir @a | messages | redir END')
  local message_history = vim.fn.getreg('a')

  -- create empty buffer
  local buf = vim.api.nvim_create_buf(false, true)
  vim.bo[buf].buftype = 'nofile'
  vim.api.nvim_buf_set_lines(buf, 0, -1, false, vim.split(message_history, '\n'))

  -- ui calculation
  local width = math.floor(vim.o.columns * 0.8)
  local height = math.floor(vim.o.lines * 0.8)
  local row = math.floor((vim.o.lines - height) / 2)
  local col = math.floor((vim.o.columns - width) / 2)

  -- open the floating window
  vim.api.nvim_open_win(buf, true, {
    relative = 'editor',
    width = width,
    height = height,
    row = row,
    col = col,
    style = 'minimal',
    border = 'rounded',
  })

  -- buffer-local keymap to close the window
  vim.keymap.set('n', 'q', '<cmd>close!<CR>', { silent = true, buffer = buf })
end, { desc = "Show [N]eovim [m]essage history in floating window" })

vim.keymap.set("n", "<space>em", function()
  local errmsg = vim.v.errmsg

  if errmsg and errmsg ~= "" then
    local buf = vim.api.nvim_create_buf(false, true)
    vim.bo[buf].buftype = 'nofile'

    local lines = vim.split(errmsg, '\n')
    vim.api.nvim_buf_set_lines(buf, 0, -1, false, lines)

    local width = math.floor(vim.o.columns * 0.8)
    local height = math.min(math.floor(vim.o.lines * 0.8), #lines + 2)
    local row = math.floor((vim.o.lines - height) / 2)
    local col = math.floor((vim.o.columns - width) / 2)

    vim.api.nvim_open_win(buf, true, {
      relative = 'editor',
      width = width,
      height = height,
      row = row,
      col = col,
      style = 'minimal',
      border = 'rounded',
    })

    vim.keymap.set('n', 'q', '<cmd>close!<CR>', {
      silent = true,
      buffer = buf,
    })
  else
    -- no error messages
    vim.notify("No error message to display.", vim.log.levels.INFO)
  end
end, { desc = "Show [e]rror [m]essage in floating window" })

-- yanking
vim.keymap.set("n", "P", '"0p', { desc = "Yank from register 0" })
vim.keymap.set("n", "P1", '"1p', { desc = "Yank from register 1" })
vim.keymap.set("x", "<leader>p", [["_dP]], { desc = "Yank on black hole register" })
--this requires either xclip or xsel to be installed
vim.keymap.set("v", "<leader>y", [["+y]], { desc = "Copy content to clipboard" })

vim.keymap.set("n", "<leader>se", "<C-w>=", { desc = "Make split windows the same dimensions" })
vim.keymap.set("n", "<leader>sv", "<C-w>v", { desc = "Split buffer vertically" })
vim.keymap.set("n", "<leader>sh", "<C-w>s", { desc = "Split buffer horizontally" })

vim.keymap.set("n", "<M-k>", "<cmd>cprev<CR>", { desc = "Navigate up on QuickFix list" })
vim.keymap.set("n", "<M-j>", "<cmd>cnext<CR>", { desc = "Navigate down on QuickFix list" })
