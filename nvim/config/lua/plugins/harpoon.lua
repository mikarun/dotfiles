return {
	"ThePrimeagen/harpoon",
	event = "VeryLazy",
	dependencies = {
		"nvim-lua/plenary.nvim",
	},
	config = function()
		-- Set a vim motion to <Shift>m to mark a file with harpoon
		vim.keymap.set("n", "<s-m>", "<cmd>lua require('harpoon.mark').add_file()<cr>", { desc = "Harpoon Mark File" })
		-- Set a vim motion to the tab key to open the harpoon menu to easily navigate frequented files
		vim.keymap.set(
			"n",
			"<TAB>",
			"<cmd>lua require('harpoon.ui').toggle_quick_menu()<cr>",
			{ desc = "Harpoon Toggle Menu" }
		)
		vim.keymap.set(
			"n",
			"<C-N>",
			"<cmd>lua require('harpoon.ui').nav_next()<cr>",
			{ desc = "Harpoon Navigate Next" }
		)
		vim.keymap.set(
			"n",
			"<C-P>",
			"<cmd>lua require('harpoon.ui').nav_prev()<cr>",
			{ desc = "Harpoon Navigate Previews" }
		)
	end,
}
