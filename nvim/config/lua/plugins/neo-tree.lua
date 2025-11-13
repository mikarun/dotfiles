return {
  "nvim-neo-tree/neo-tree.nvim",
  branch = "v3.x",
  dependencies = {
    "nvim-lua/plenary.nvim",
    "nvim-tree/nvim-web-devicons",
    "MunifTanjim/nui.nvim",
  },
  config = function()
    vim.keymap.set("n", "<leader>E", ":Neotree toggle current reveal<CR>", { desc = "Toggle [E]xplorer" })
    vim.keymap.set("n", "<leader>e", ":Neotree reveal<CR>", { desc = "Toggle [E]xplorer" })
    vim.keymap.set("n", "|", ":Neotree reveal<CR>", { desc = "Reveal explorer" })
    vim.keymap.set("n", "<leader>gs", ":Neotree float git_status<CR>", { desc = "Show [g]it [s]tatus" })
  end,
}
