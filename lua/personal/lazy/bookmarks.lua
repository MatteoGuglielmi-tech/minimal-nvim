return {
	"tomasky/bookmarks.nvim",
	dependencies = { "telescope.nvim" },
	event = "VimEnter",
	config = function()
		require("bookmarks").setup({
			save_file = vim.fn.expand("$HOME/.bookmarks"), -- bookmarks save file path
			keywords = {
				["@t"] = " ", -- mark annotation startswith @t ,signs this icon as `Todo`
				["@w"] = "", -- mark annotation startswith @w ,signs this icon as `Warn`
				["@f"] = " ", -- mark annotation startswith @f ,signs this icon as `Fix`
				["@n"] = "", -- mark annotation startswith @n ,signs this icon as `Note`
			},
			---@diagnostic disable-next-line: unused-local
			on_attach = function(bufnr)
				local bm = require("bookmarks")
				local map = vim.keymap.set
				map("n", "bm", bm.bookmark_toggle) -- add or remove bookmark at current line
				map("n", "bi", bm.bookmark_ann) -- add or edit mark annotation at current line
				map("n", "bc", bm.bookmark_clean) -- clean all marks in local buffer
				map("n", "bn", bm.bookmark_next) -- jump to next mark in local buffer
				map("n", "bp", bm.bookmark_prev) -- jump to previous mark in local buffer
				map("n", "bl", bm.bookmark_list) -- show marked file list in quickfix window
				map("n", "bx", bm.bookmark_clear_all) -- removes all bookmarks
			end,
		})
	end,
}
