vim.g.has_nerd_font = true
vim.g.tex_flavor = "latex"

vim.opt.number = true
vim.opt.relativenumber = true

-- Don't show the mode, since it's already in the status line
vim.opt.showmode = false

-- this allows to visualize consecutive lines with the same indentation
vim.opt.breakindent = true
vim.opt.smartindent = true

-- preserve history
vim.opt.undodir = os.getenv("HOME") .. "/.vim/undodir"
vim.opt.undofile = true

-- temps
vim.opt.swapfile = false
vim.opt.backup = false

-- Keep signcolumn on by default
vim.opt.signcolumn = "yes"
vim.opt.updatetime = 50

-- Sets how neovim will display certain whitespace characters in the editor.
vim.opt.list = true
vim.opt.listchars = { tab = "» ", trail = "·", nbsp = "␣" }

-- Preview substitutions live, as you type!
vim.opt.inccommand = "split"

-- Show which line your cursor is on
vim.opt.cursorline = true

-- Minimal number of screen lines to keep above and below the cursor.
vim.opt.scrolloff = 10
vim.opt.incsearch = true
vim.opt.termguicolors = true

vim.opt.smartcase = true
vim.opt.ignorecase = true -- ignore case in search patterns
