-- https://github.com/milanglacier/minuet-ai.nvim

return {
	"milanglacier/minuet-ai.nvim",
	dependencies = { "nvim-lua/plenary.nvim" },
	opts = function()
		local utils = require("config.utils.utils")

		local markers = { ".git", "lazy-lock.json" }
		local current_file = vim.api.nvim_buf_get_name(0)

		local root = utils.find_project_root(markers, "file", current_file)

		local api_keys = {}
		if root then
			local env_path = utils.join_path(root, ".env")
			api_keys = utils.load_env(env_path) or {}
		end

		return {
			provider_options = {
				gemini = {
					model = "gemini-2.0-flash",
					api_key = (api_keys and api_keys.GEMINI) or os.getenv("GEMINI_API_KEY"),
				},
			},
		}
	end,
}
