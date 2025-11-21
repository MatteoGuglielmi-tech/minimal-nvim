vim.keymap.set("n", "<leader>crd", "<cmd>CsvViewDisable<CR>", { desc = "[C]sv [R]ender [D]isable" })
vim.keymap.set(
	"n",
	"<leader>crt",
	"<cmd>CsvViewToggle delimiter=, display_mode=border header_lnum=1<CR>",
	{ desc = "[C]sv [R]ender [T]oggle" }
)
