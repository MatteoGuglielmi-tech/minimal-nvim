-- https://github.com/milanglacier/minuet-ai.nvim

return {
	"milanglacier/minuet-ai.nvim",
	enabled = false,
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

		local gemini_key = (api_keys and api_keys.GEMINI_API_KEY) or os.getenv("GEMINI_API_KEY")
		local deepseek_key = (api_keys and api_keys.DEEPSEEK_API_KEY) or os.getenv("DEEPSEEK_API_KEY")

		local function wrap(key)
			return "'" .. key .. "'"
		end

		return {
			provider = "openai_compatible",
			provider_options = {
				-- Gemini --
				gemini = {
					model = "gemini-1.5-pro-latest",
					api_key = gemini_key,
				},
				-- DeepSeek --
				openai_compatible = {
					end_point = "https://api.deepseek.com/chat/completions",
					api_key = deepseek_key,
					name = "deepseek",
					optional = {
						model = "deepseek-chat", -- model
						max_tokens = 4096,
						temperature = 0.7,
						top_p = 0.9,
					},
				},
			},
		}
	end,
}
