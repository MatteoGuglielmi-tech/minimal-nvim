---@diagnostic disable: undefined-field, unused-local
-- -- everything in treesitter is "mapped" to a schema.
-- -- useful cmds: Inspect and InspectTree
return {
	"nvim-treesitter/nvim-treesitter",
	version = false,
	build = ":TSUpdate",
	event = { "BufReadPre", "BufNewFile" },
	-- load treesitter early when opening a file from the cmdline
	lazy = vim.fn.argc(-1) == 0,
	init = function(plugin)
		require("nvim-treesitter.query_predicates")
	end,

	dependencies = {
		"nvim-treesitter/nvim-treesitter-textobjects",
		"nvim-treesitter/nvim-treesitter-context",
	},

	main = "nvim-treesitter.configs",

	opts = {
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

				-- Automatically jump forward to textobj, similar to targets.vim
				lookahead = true,

				keymaps = {
					-- You can use the capture groups defined in textobjects.scm
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

				swap = {
					enable = true,
					swap_next = {
						["<leader>si"] = "@parameter.inner", -- swap parameters/argument with next
						["<leader>so"] = "@function.outer", -- swap function with next
					},
					swap_previous = {
						["<leader>pi"] = "@parameter.inner", -- swap parameters/argument with prev
						["<leader>po"] = "@function.outer", -- swap function with previous
					},
				},

				move = {
					enable = true,
					set_jumps = true,
					goto_next_start = {
						["]f"] = { query = "@call.outer", { desc = "Next function call start" } },
						["]m"] = { query = "@function.outer", { desc = "Next method/function def start" } },
						["]c"] = { query = "@class.outer", { desc = "Next class start" } },
						["]i"] = { query = "@conditional.outer", { desc = "Next conditional start" } },
						["]l"] = { query = "@loop.outer", { desc = "Next loop start" } },

						-- You can pass a query group to use query from `queries/<lang>/<query_group>.scm file in your runtime path.
						-- Below example nvim-treesitter's `locals.scm` and `folds.scm`. They also provide highlights.scm and indent.scm.
						["]s"] = { query = "@scope", query_group = "locals", { desc = "Next scope" } },
						["]z"] = { query = "@fold", query_group = "folds", { desc = "Next fold" } },
					},
					goto_next_end = {
						["]F"] = { query = "@call.outer", { desc = "Next function call end" } },
						["]M"] = { query = "@function.outer", { desc = "Next method/function def end" } },
						["]C"] = { query = "@class.outer", { desc = "Next class end" } },
						["]I"] = { query = "@conditional.outer", { desc = "Next conditional end" } },
						["]L"] = { query = "@loop.outer", { desc = "Next loop end" } },
					},
					goto_previous_start = {
						["[f"] = { query = "@call.outer", { desc = "Prev function call start" } },
						["[m"] = { query = "@function.outer", { desc = "Prev method/function def start" } },
						["[c"] = { query = "@class.outer", { desc = "Prev class start" } },
						["[i"] = { query = "@conditional.outer", { desc = "Prev conditional start" } },
						["[l"] = { query = "@loop.outer", { desc = "Prev loop start" } },
					},
					goto_previous_end = {
						["[F"] = { query = "@call.outer", { desc = "Prev function call end" } },
						["[M"] = { query = "@function.outer", { desc = "Prev method/function def end" } },
						["[C"] = { query = "@class.outer", { desc = "Prev class end" } },
						["[I"] = { query = "@conditional.outer", { desc = "Prev conditional end" } },
						["[L"] = { query = "@loop.outer", { desc = "Prev loop end" } },
					},
				},
			},
		},

		context = {
			enable = true,
			line_numbers = true,
			multiline_threshold = 20,
			separator = nil,
		},
	},
}
