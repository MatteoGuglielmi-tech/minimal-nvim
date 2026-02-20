return {
	"folke/snacks.nvim",
	priority = 1000,
	lazy = false,
	opts = {
		bigfile = { enabled = true, notify = true, size = 100 * 1024 * 1024 }, -- 100MiB
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
		  -- layout = { preset = "vertical" },
		},
	},
	keys = {
    -- Explorer
	  { "<leader>e", function() Snacks.explorer() end, desc = "File Explorer" },

    -- Picker (replaces Telescope)
    { "<leader>fh", function() Snacks.picker.help() end, desc = "[F]ind [H]elp" },
    { "<leader>fk", function()
      Snacks.picker.keymaps({
        layout = {
          preset = "vertical",
          layout = {
            -- 90% of the screen
            width = 0.9,
            height = 0.9,
          },
        },
      })
    end, desc = "[F]ind [K]eymaps" },
    { "<leader>fs", function() Snacks.picker() end, desc = "[F]ind [S]elect Picker" },

    -- Find
    { "<leader><leader>", function() Snacks.picker.buffers() end, desc = "Find existing buffers" },
    { "<leader>ff", function() Snacks.picker.smart() end, desc = "Smart [F]ind [F]iles" },
    -- { "<leader>ff", function() Snacks.picker.files() end, desc = "[F]ind [F]iles" },
    { "<leader>fn", function() Snacks.picker.files({ cwd = vim.fn.stdpath("config") }) end, desc = "[F]ind [N]eovim files" },
    { "<leader>f.", function() Snacks.picker.recent() end, desc = "[F]ind Recent Files" },
    { "<leader>fg", function() Snacks.picker.git_files() end, desc = "[F]ind [G]it Files" },
    { "<leader>fp", function() Snacks.picker.projects() end, desc = "[F]ind [P]rojects" },

		-- Bufdelete
		{ "Q", function() Snacks.bufdelete() end, desc = "Delete current Buffer" },
    { "<leader>bD", function() Snacks.bufdelete.all() end, desc = "Delete All Buffers" },

		-- Git
		{ "<leader>gg", function() Snacks.lazygit() end, desc = "Lazygit" },
    { "<leader>gB", function() Snacks.gitbrowse() end, desc = "Git Browse (open in browser)" },
    { "<leader>gb", function() Snacks.picker.git_branches() end, desc = "Git Branches" },
    -- { "<leader>gl", function() Snacks.lazygit.log() end, desc = "Lazygit Log" },
    { "<leader>gl", function() Snacks.picker.git_log() end, desc = "Git Log" },
    { "<leader>gL", function() Snacks.picker.git_log_line() end, desc = "Git Log Line" },
    { "<leader>gs", function() Snacks.picker.git_status() end, desc = "Git Status" },
    { "<leader>gS", function() Snacks.picker.git_stash() end, desc = "Git Stash" },
    { "<leader>gd", function() Snacks.picker.git_diff() end, desc = "Git Diff (Hunks)" },
    { "<leader>gf", function() Snacks.picker.git_log_file() end, desc = "Git Log File" },

		-- GitHub
    -- { "<leader>gi", function() Snacks.picker.gh_issue() end, desc = "GitHub Issues (open)" },
    -- { "<leader>gI", function() Snacks.picker.gh_issue({ state = "all" }) end, desc = "GitHub Issues (all)" },
    -- { "<leader>gp", function() Snacks.picker.gh_pr() end, desc = "GitHub Pull Requests (open)" },
    -- { "<leader>gP", function() Snacks.picker.gh_pr({ state = "all" }) end, desc = "GitHub Pull Requests (all)" },

    -- Grep
    { "<leader>fc", function() Snacks.picker.lines() end, desc = "[F]uzzy search in [C]urrent buffer" },
    { "<leader>f/", function() Snacks.picker.grep_buffers() end, desc = "[F]ind in Open Files" },
    { "<leader>fw", function() Snacks.picker.grep_word() end, desc = "[F]ind current [W]ord", mode= {"n", "x"} },
    { "<leader>fl", function() Snacks.picker.grep({ live = true }) end, desc = "[F]ind by [G]rep" },
    { "<leader>fo", function() Snacks.picker.grep({ live = true }) end, desc = "[F]ind by Grep [O]ffline" },

    -- Search
    { '<leader>s/', function() Snacks.picker.search_history() end, desc = "Search History" },
    { "<leader>sc", function() Snacks.picker.command_history() end, desc = "Command History" },
    { "<leader>sC", function() Snacks.picker.commands() end, desc = "[S]earch [C]ommands" },
    { "<leader>si", function() Snacks.picker.icons() end, desc = "Icons/Emojis" },
    { "<leader>sM", function() Snacks.picker.man() end, desc = "Man Pages" },
    { "<leader>su", function() Snacks.picker.undo() end, desc = "Undo History" },

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
},

  init = function()
      ---@diagnostic disable-next-line: duplicate-set-field
      vim.ui.select = function(items, opts, on_choice)
        return Snacks.picker.select(items, opts, on_choice)
      end
    end,
}
