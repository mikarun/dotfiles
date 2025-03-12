return {
	{
		"nvim-treesitter/nvim-treesitter",
		build = ":TSUpdate",
		config = function()
			local config = require("nvim-treesitter.configs")
			config.setup({
				auto_install = true,
				highlight = { enable = true },
				indent = { enable = true, disable = { "yaml" } },
				endwise = { enable = true },
				"bash",
				"embedded_template",
				"gitignore",
				"html",
				"javascript",
				"json",
				"lua",
				"markdown",
				"markdown_inline",
				"php",
				"python",
				"query",
				"regex",
				"ruby",
				"tsx",
				"typescript",
				"vim",
				"vimdoc",
				"yaml",
				ensure_installed = {},
			})
		end,
	},
}
