vim.keymap.set("n", "<space>", " ", {})
vim.keymap.set("n", "<Esc>", "<cmd>nohlsearch<CR>")
vim.keymap.set("t", "<Esc><Esc>", "<C-\\><C-n>", { desc = "Exit terminal mode" })

vim.keymap.set("n", "<C-h>", "<C-w><C-h>", { desc = "Move focus to the left window" })
vim.keymap.set("n", "<C-l>", "<C-w><C-l>", { desc = "Move focus to the right window" })
vim.keymap.set("n", "<C-j>", "<C-w><C-j>", { desc = "Move focus to the lower window" })
vim.keymap.set("n", "<C-k>", "<C-w><C-k>", { desc = "Move focus to the upper window" })

-- Window resizing
vim.keymap.set("n", "<C-,>", "<cmd>resize -2<CR>", { desc = "Shrink window horizontally" })
vim.keymap.set("n", "<C-.>", "<cmd>resize +2<CR>", { desc = "Wide window horizontally" })
vim.keymap.set("n", "<C-Down>", "<cmd>vertical resize -2<CR>", { desc = "Shrink window vertically" })
vim.keymap.set("n", "<C-Up>", "<cmd>vertical resize +2<CR>", { desc = "Wide window vertically" })

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

-- visualize messages by nvim
vim.keymap.set("c", "mes", "<cmd>messages<CR><esc>", { desc = "Shows messages by neovim" })
vim.keymap.set("c", "emes", "<esc><cmd>echo v:errmsg<CR>", { desc = "Shows error messages by neovim" })

-- yanking
vim.keymap.set("n", "P", '"0p', { desc = "Yank from register 0" })
vim.keymap.set("n", "P1", '"1p', { desc = "Yank from register 1" })
vim.keymap.set("x", "<leader>p", [["_dP]], { desc = "Yank on black hole register" })
--this requires either xclip or xsel to be installed
vim.keymap.set("v", "<leader>y", [["+y]], { desc = "Copy content to clipboard" })

-- keymap('c', 'w!!', "<esc>:lua require'user.sudo'.sudo_write()<CR>", { silent = true })
vim.keymap.set("n", "<leader>se", "<C-w>=", { desc = "Make split windows the same dimensions" })
vim.keymap.set("n", "<leader>sv", "<C-w>v", { desc = "Split buffer vertically" })
vim.keymap.set("n", "<leader>sh", "<C-w>s", { desc = "Split buffer horizontally" })
