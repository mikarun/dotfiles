-- ---------------------------------------------------------------------------
--  General
-- ---------------------------------------------------------------------------

vim.cmd("filetype plugin indent on")
vim.opt.modelines = 0
vim.opt.history = 1000
vim.opt.backup = false
vim.opt.writebackup = false
vim.opt.swapfile = false
vim.opt.syntax = "enable"
vim.opt.autoread = true
vim.opt.clipboard = "unnamed"

-- ---------------------------------------------------------------------------
--  Text Formatting
-- ---------------------------------------------------------------------------
vim.opt.expandtab = true
vim.opt.tabstop = 2
vim.opt.shiftwidth = 2
vim.opt.softtabstop = 2
vim.opt.tags = { "tags", "./tmp/tags" }

-- ---------------------------------------------------------------------------
-- UI
-- ---------------------------------------------------------------------------
vim.g.loaded_netrw = 1
vim.g.loaded_netrwPlugin = 1
vim.opt.title = true
vim.opt.fileencoding = "utf-8"
vim.opt.scrolloff = 5
vim.opt.autoindent = true
vim.opt.smartindent = true
vim.opt.showmode = true
vim.opt.showcmd = true
vim.opt.hidden = true
vim.opt.wildmenu = true
vim.opt.wildmode = "list:longest"
vim.opt.visualbell = true
vim.opt.cursorline = true
vim.opt.ttyfast = true
vim.opt.termguicolors = true
vim.opt.number = true
vim.opt.ruler = true
vim.opt.relativenumber = true
vim.opt.cpoptions:append("$")
vim.opt.splitbelow = true
vim.opt.splitright = true

-- ---------------------------------------------------------------------------
--  Mappings
-- ---------------------------------------------------------------------------

-- Searching / moving
--vim.cmd("nnoremap / /\v")
--vim.cmd("vnoremap / /\v")
vim.opt.ignorecase = true
vim.opt.smartcase = true
vim.opt.incsearch = true
vim.opt.showmatch = true
vim.opt.hlsearch = true
