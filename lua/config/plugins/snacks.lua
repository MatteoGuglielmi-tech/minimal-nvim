return {
	"folke/snacks.nvim",
	priority = 1000,
	lazy = false,
	opts = {
		bigfile = { enabled = true, notify = true, size = 1.5 * 1024 * 1024 }, -- 1.5MB
		bufdelete = { enabled = true },
		gitbrowse = { enabled = true },
		lazygit = { enabled = true },
		rename = { enabled = true },
		scratch = { enabled = true },
		image = { enabled = true },
		scroll = { enabled = false },
		gh = { enabled = true },
		terminal = { enabled = true },
    picker = {
      enabled = true,
      layout = { preset = "ivy" },
    },
	},
	keys = {
		-- Bufdelete
		{ "Q", function() Snacks.bufdelete() end, desc = "Delete current Buffer" },
    { "<leader>bD", function() Snacks.bufdelete.all() end, desc = "Delete All Buffers" },

		-- Git
		{ "<leader>gb", function() Snacks.gitbrowse() end, desc = "Git Browse (open in browser)" },
		{ "<leader>gg", function() Snacks.lazygit() end, desc = "Lazygit" },
    { "<leader>gl", function() Snacks.lazygit.log() end, desc = "Lazygit Log" },

		-- GitHub
		{ "<leader>gi", function() Snacks.picker.gh_issue() end, desc = "GitHub Issues" },
		{ "<leader>gp", function() Snacks.picker.gh_pr() end, desc = "GitHub PRs" },

		-- Scratch
		{ "<leader>.", function() Snacks.scratch() end, desc = "Toggle Scratch Buffer" },
		{ "<leader>.a", function() Snacks.scratch.select() end, desc = "Select Scratch Buffer" },

		-- Terminal
		{
      [[<C-\>]], function()
        Snacks.terminal.toggle(nil, { id = "main" })
      end, desc = "Toggle Terminal", mode = { "n", "t" }
    },
		{ "<leader>tf", function()
        Snacks.terminal.toggle(nil, { id = "float", win = { position = "float" } })
      end, desc = "Toggle Floating Terminal", mode = { "n", "t" }
    },
		{ "<M-h>", [[<C-\><C-n><C-w>h]], mode = "t" },
		{ "<M-j>", [[<C-\><C-n><C-w>j]], mode = "t" },
		{ "<M-k>", [[<C-\><C-n><C-w>k]], mode = "t" },
		{ "<M-l>", [[<C-\><C-n><C-w>l]], mode = "t" },

    -- Picker (replaces Telescope)
    { "<leader>fh", function() Snacks.picker.help() end, desc = "[F]ind [H]elp" },
    { "<leader>fk", function() Snacks.picker.keymaps() end, desc = "[F]ind [K]eymaps" },
    { "<leader>ff", function() Snacks.picker.files() end, desc = "[F]ind [F]iles" },
    { "<leader>fs", function() Snacks.picker() end, desc = "[F]ind [S]elect Picker" },
    { "<leader>fw", function() Snacks.picker.grep_word() end, desc = "[F]ind current [W]ord" },
    { "<leader>fg", function() Snacks.picker.grep({ live = true }) end, desc = "[F]ind by [G]rep" },
    { "<leader>wd", function() Snacks.picker.diagnostics() end, desc = "[W]orkspace [D]iagnostics" },
    { "<leader>bd", function() Snacks.picker.diagnostics({ filter = { buf = 0 } }) end, desc = "[B]uffer [D]iagnostics" },
    { "<leader>f.", function() Snacks.picker.recent() end, desc = "[F]ind Recent Files" },
    { "<leader><leader>", function() Snacks.picker.buffers() end, desc = "Find existing buffers" },
    { "<leader>fc", function() Snacks.picker.lines() end, desc = "[F]uzzily search in [C]urrent buffer" },
    { "<leader>fn", function() Snacks.picker.files({ cwd = vim.fn.stdpath("config") }) end, desc = "[F]ind [N]eovim files" },
    { "<leader>f/", function() Snacks.picker.grep_buffers() end, desc = "[F]ind in Open Files" },
},

  init = function()
      ---@diagnostic disable-next-line: duplicate-set-field
      vim.ui.select = function(items, opts, on_choice)
        return Snacks.picker.select(items, opts, on_choice)
      end
    end,
}
