local conf = require("telescope.config").values

local toggle_telescope = function(harpoon)
	local file_paths = {}
	for _, item in ipairs(harpoon:list().items) do
		table.insert(file_paths, item.value)
	end

	require("telescope.pickers")
		.new({}, {
			prompt_title = "Harpoon",
			finder = require("telescope.finders").new_table({ results = file_paths }),
			previewer = conf.file_previewer({}),
			sorter = conf.generic_sorter({}),
		})
		:find()
end

return toggle_telescope
