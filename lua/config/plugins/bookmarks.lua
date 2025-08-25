return {
	"tomasky/bookmarks.nvim",
	dependencies = { "nvim-telescope/telescope.nvim" },
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

				local callback_list = function()
					require("telescope").extensions.bookmarks.list()
				end

				local map = vim.keymap.set
				map("n", "<leader>bm", bm.bookmark_toggle) -- add or remove bookmark at current line
				map("n", "<leader>bi", bm.bookmark_ann) -- add or edit mark annotation at current line
				map("n", "<leader>bc", bm.bookmark_clean) -- clean all marks in local buffer
				map("n", "<leader>bn", bm.bookmark_next) -- jump to next mark in local buffer
				map("n", "<leader>bp", bm.bookmark_prev) -- jump to previous mark in local buffer
				map("n", "<leader>bl", callback_list) -- show marked file list in quickfix window
				map("n", "<leader>bx", bm.bookmark_clear_all) -- removes all bookmarks
			end,
		})
	end,
}
