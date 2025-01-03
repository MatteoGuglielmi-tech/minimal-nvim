-- Bootstrap lazy.nvim
local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
---@diagnostic disable-next-line: undefined-field
if not (vim.uv or vim.loop).fs_stat(lazypath) then
	local lazyrepo = "https://github.com/folke/lazy.nvim.git"
	local out = vim.fn.system({ "git", "clone", "--filter=blob:none", "--branch=stable", lazyrepo, lazypath })
	if vim.v.shell_error ~= 0 then
		vim.api.nvim_echo({
			{ "Failed to clone lazy.nvim:\n", "ErrorMsg" },
			{ out, "WarningMsg" },
			{ "\nPress any key to exit..." },
		}, true, {})
		vim.fn.getchar()
		os.exit(1)
	end
end

vim.opt.runtimepath:prepend(lazypath)

vim.g.mapleader = " "
vim.g.maplocalleader = " "

-- Setup lazy.nvim
require("lazy").setup({
	spec = {
		{ "nvim-lua/plenary.nvim", priority = 1000 },
		{ "tpope/vim-sleuth" },
		-- {
		-- 	"folke/tokyonight.nvim",
		-- 	config = function()
		-- 		vim.cmd.colorscheme("tokyonight")
		-- 	end,
		-- },
		-- {
		-- 	"pauchiner/pastelnight.nvim",
		-- 	lazy = false,
		-- 	priority = 1000,
		-- 	config = function()
		-- 		vim.cmd("colorscheme pastelnight")
		-- 	end,
		-- },
		{
			"EdenEast/nightfox.nvim",
			lazy = false,
			priority = 100,
			config = function()
				vim.cmd("colorscheme nordfox")
				-- vim.cmd("colorscheme duskfox")
			end,
		},
		{ import = "config.plugins" },
	},
	-- automatically check for plugin updates
	checker = { enabled = true },
	change_detection = { enabled = false, notify = false },
})
