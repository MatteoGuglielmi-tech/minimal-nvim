---@diagnostic disable: undefined-field, unused-local
-- -- everything in treesitter is "mapped" to a schema.
-- -- useful cmds: Inspect and InspectTree
return {
	"nvim-treesitter/nvim-treesitter",
	version = false,
	build = ":TSUpdate",
	event = { "BufReadPre", "BufNewFile" },
	lazy = false,
	init = function(plugin)
		require("nvim-treesitter.query_predicates")
	end,

	dependencies = {
		"nvim-treesitter/nvim-treesitter-textobjects",
		"nvim-treesitter/nvim-treesitter-context",
	},

	main = "nvim-treesitter.configs",

	opts = {
		ensure_installed = {
			"rust", "lua", "vim", "vimdoc",
			"query", "javascript", "typescript",
			"python", "json", "toml", "markdown",
		},
		sync_install = false,
		auto_install = true,

		highlight = {
			enable = true,
			disable = function(lang, buf)
				local max_filesize = 100 * 1024 * 1024 -- 100 MiB
				local ok, stats = pcall(vim.loop.fs_stat, vim.api.nvim_buf_get_name(buf))
				if ok and stats and stats.size > max_filesize then
					return true
				end
			end,
			additional_vim_regex_highlighting = { "markdown", "markdown_inline" },
		},
		indent = { enable = true, disable = { "markdown", "markdown_inline" } },
		incremental_selection = {
			enable = true,
			keymaps = {
				init_selection = "<C-space>",
				node_incremental = "<C-space>",
				scope_incremental = false,
				node_decremental = "<bs>",
			},
		},

		textobjects = {
			select = {
				enable = true,
				lookahead = true,
				keymaps = {
					["a="] = { query = "@assignment.outer", { desc = "Select outer part of an assignment" } },
					["i="] = { query = "@assignment.inner", { desc = "Select inner part of an assignment" } },
					["l="] = { query = "@assignment.lhs", { desc = "Select left hand side of an assignment" } },
					["r="] = { query = "@assignment.rhs", { desc = "Select right hand side of an assignment" } },

					["aa"] = { query = "@parameter.outer", { desc = "Select outer part of a parameter/argument" } },
					["ia"] = { query = "@parameter.inner", { desc = "Select inner part of a parameter/argument" } },

					["ai"] = { query = "@conditional.outer", { desc = "Select outer part of a conditional" } },
					["ii"] = { query = "@conditional.inner", { desc = "Select inner part of a conditional" } },

					["al"] = { query = "@loop.outer", { desc = "Select outer part of a loop" } },
					["il"] = { query = "@loop.inner", { desc = "Select inner part of a loop" } },

					["af"] = { query = "@call.outer", { desc = "Select outer part of a function call" } },
					["if"] = { query = "@call.inner", { desc = "Select inner part of a function call" } },

					["am"] = {
						query = "@function.outer",
						{ desc = "Select outer part of a method/function definition" },
					},
					["im"] = {
						query = "@function.inner",
						{ desc = "Select inner part of a method/function definition" },
					},

					["ac"] = { query = "@class.outer", { desc = "Select outer part of a class" } },
					["ic"] = { query = "@class.inner", { desc = "Select inner part of a class" } },
				},
			},

			swap = {
				enable = true,
				swap_next = {
					["<leader>si"] = { query = "@parameter.inner", { desc = "Swap parameters/argument with next one" } },
					["<leader>so"] = { query = "@function.outer", { desc = "Swap function with next one" } },
				},
				swap_previous = {
					["<leader>pi"] = { query = "@parameter.inner", { desc = "Swap parameters/argument with prev one" } },
					["<leader>po"] = { query = "@function.outer", { desc = "Swap function with prev one" } },
				},
			},

			move = {
				enable = true,
				set_jumps = true,
				goto_next_start = {
					["}l"] = { query = "@assignment.lhs", { desc = "Go to next left hand side of an assignment" } },
					["}r"] = { query = "@assignment.rhs", { desc = "Go to next right hand side of an assignment" } },
					["]m"] = { query = "@function.outer", { desc = "Next method/function def start" } },
					["]i"] = { query = "@conditional.outer", { desc = "Next conditional start" } },
					["]o"] = { query = "@loop.outer", { desc = "Next loop start" } },
				},
				goto_next_end = {
					["]M"] = { query = "@function.outer", { desc = "Next method/function def end" } },
					["]I"] = { query = "@conditional.outer", { desc = "Next conditional end" } },
					["]O"] = { query = "@loop.outer", { desc = "Next loop end" } },
				},
				goto_previous_start = {
					["{l"] = { query = "@assignment.lhs", { desc = "Go to prev left hand side of an assignment" } },
					["{r"] = { query = "@assignment.rhs", { desc = "Go to prev right hand side of an assignment" } },
					["[m"] = { query = "@function.outer", { desc = "Prev method/function def start" } },
					["[i"] = { query = "@conditional.outer", { desc = "Prev conditional start" } },
					["[o"] = { query = "@loop.outer", { desc = "Prev loop start" } },
				},
				goto_previous_end = {
					["[M"] = { query = "@function.outer", { desc = "Prev method/function def end" } },
					["[I"] = { query = "@conditional.outer", { desc = "Prev conditional end" } },
					["[O"] = { query = "@loop.outer", { desc = "Prev loop end" } },
				},
			},
		},
		context = { max_lines = 1 },
	},
}
