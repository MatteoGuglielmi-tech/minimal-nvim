return {
	cmd = { "intelephense", "--stdio" },
	filetypes = { "php" },
	root_markers = {
		"composer.json",
		"drush",
		"web/core",
		"docroot/core",
		"core/lib/Drupal",
		".git",
	},
	settings = {
		intelephense = {
			telemetry = {
				enabled = false,
			},
			files = {
				associations = {
					"*.php",
					"*.phtml",
					"*.module",
					"*.theme",
					"*.install",
					"*.profile",
					"*.inc",
					"*.engine",
				},
			},
		},
	},
}
