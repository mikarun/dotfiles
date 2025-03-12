return {
  {
    "smichaud/nvim-gototest",
    config = function()
      require("gototest").setup()
      --vim.keymap.set("n", "<leader>T", ":GoToTestToggle<CR>", { desc = "[A]lternate [E]dit" })
    end,
  },
  {
    "vim-test/vim-test",
    dependencies = {
      "preservim/vimux",
    },
    config = function()
      vim.keymap.set("n", "<leader>t", ":TestNearest<CR>", {})
      --vim.keymap.set("n", "<leader>T", ":TestFile<CR>", {})
      vim.keymap.set("n", "<leader>a", ":TestSuite<CR>", {})
      vim.keymap.set("n", "<leader>l", ":TestLast<CR>", {})
      vim.keymap.set("n", "<leader>g", ":TestVisit<CR>", {})
      vim.cmd("let g:VimuxRunnerType = 'window'")
      vim.cmd("let g:test#strategy = 'vimux'")
      vim.cmd("let g:test#php#phpunit#executable= 'docker-compose exec php vendor/bin/phpunit'")
    end,
  },
}
