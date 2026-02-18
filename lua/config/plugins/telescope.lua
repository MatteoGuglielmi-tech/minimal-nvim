return {
	"nvim-telescope/telescope.nvim",
	branch = "master",
	lazy=false,
	dependencies = {
		"nvim-lua/plenary.nvim",
		"nvim-telescope/telescope-dap.nvim",
		"echasnovski/mini.icons",
	},
	keys = {
    { "<leader>db", function() require("telescope").extensions.dap.list_breakpoints() end, desc = "DAP Breakpoints" },
    { "<leader>df", function() require("telescope").extensions.dap.frames() end, desc = "DAP Frames" },
    { "<leader>dv", function() require("telescope").extensions.dap.variables() end, desc = "DAP Variables" },
    { "<leader>dc", function() require("telescope").extensions.dap.commands() end, desc = "DAP Commands" },
  },
	config = function()
		require("telescope").load_extension("dap")
		require("telescope").load_extension("noice")
	end,
}
