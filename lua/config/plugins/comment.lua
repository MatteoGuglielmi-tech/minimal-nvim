return {
	"numToStr/Comment.nvim",
	event = "VeryLazy",
	dependencies = { "JoosepAlviste/nvim-ts-context-commentstring" },
	config = function()
		local ts_pre_hook
		local ok, ts_cs = pcall(require, "ts_context_commentstring")
		if ok then
			ts_cs.setup({ enable_autocmd = false })
			local ok2, integration = pcall(require, "ts_context_commentstring.integrations.comment_nvim")
			if ok2 then
				ts_pre_hook = integration.create_pre_hook()
			end
		end

		local ft_commentstrings = {
			typescript = "// %s",
			javascript = "// %s",
			typescriptreact = "// %s",
			javascriptreact = "// %s",
		}

		require("Comment").setup({
			pre_hook = function(ctx)
				if ts_pre_hook then
					local cs = ts_pre_hook(ctx)
					if type(cs) == "string" and cs ~= "" then return cs end
				end
				return ft_commentstrings[vim.bo.filetype] or vim.bo.commentstring
			end,
			mappings = {
				basic = false,
				extra = false,
			},
		})

		--- normal mode
		vim.keymap.set(
			"n",
			"gcc",
			'<cmd>lua require("Comment.api").toggle.linewise.current()<CR>',
			{ desc = "Comment line" }
		)
		vim.keymap.set(
			"n",
			"gca",
			'<cmd>lua require("Comment.api").insert.linewise.eol()<CR>',
			{ desc = "Append comment to eol" }
		)

		--- Visual mode
		vim.keymap.set("x", "gc", "<Plug>(comment_toggle_linewise_visual)")
	end,
}
