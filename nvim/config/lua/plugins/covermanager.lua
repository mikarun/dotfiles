return {
  {
    dir = "/Users/mickael/Repositories/github.com/mikarun/covermanager.nvim",
    dependencies = {
      "nvim-lua/plenary.nvim",
    },
    config = function()
      vim.g.covermanager_log_level = "info"
      require("covermanager").setup()
      vim.keymap.set("n", "<leader>T", ":CoverTestToggle<CR>", { desc = "[A]lternate [E]dit" })

      vim.keymap.set("n", "<leader>rr", require("covermanager.dev").reload, {})
    end,
  },
}
