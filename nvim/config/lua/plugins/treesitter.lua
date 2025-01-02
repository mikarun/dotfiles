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
        ensure_installed = {
          "bash",
          "embedded_template",
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
          "yaml",
        },
      })
    end,
  },
}
