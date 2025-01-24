-- ---------------------------------------------------------------------------
--  General
-- ---------------------------------------------------------------------------
vim.cmd("let mapleader = ' '")
--vim.cmd("let g:mapleader = ','")
vim.g.mapleader = " "

vim.cmd("filetype plugin indent on")
vim.cmd("set modelines=0")
vim.cmd("set history=1000")
vim.cmd("set nobackup")
vim.cmd("set nowritebackup")
vim.cmd("set noswapfile")
vim.cmd("syntax enable")
vim.cmd("set autoread")
vim.cmd("set clipboard=unnamed")

-- ---------------------------------------------------------------------------
--  Text Formatting
-- ---------------------------------------------------------------------------
vim.cmd("set expandtab")
vim.cmd("set tabstop=2")
vim.cmd("set shiftwidth=2")
vim.cmd("set softtabstop=2")
vim.cmd("set tags:tags,./tmp/tags;")

-- ---------------------------------------------------------------------------
-- UI
-- ---------------------------------------------------------------------------
vim.cmd("set title")
vim.cmd("set encoding=utf-8")
vim.cmd("set scrolloff=3")
vim.cmd("set autoindent")
vim.cmd("set smartindent")
vim.cmd("set showmode")
vim.cmd("set showcmd")
vim.cmd("set hidden")
vim.cmd("set wildmenu")
vim.cmd("set wildmode=list:longest")
vim.cmd("set visualbell")
vim.cmd("set cursorline")
vim.cmd("set ttyfast")
vim.cmd("set ruler")
vim.cmd("set backspace=indent,eol,start")
vim.cmd("set laststatus=2")
vim.cmd("set number")
vim.cmd("set relativenumber")
vim.cmd("set cpoptions+=$")

vim.cmd("set splitbelow splitright")

-- ---------------------------------------------------------------------------
--  Mappings
-- ---------------------------------------------------------------------------

-- Searching / moving
--vim.cmd("nnoremap / /\v")
--vim.cmd("vnoremap / /\v")
vim.cmd("set ignorecase")
vim.cmd("set smartcase")
vim.cmd("set incsearch")
vim.cmd("set showmatch")
vim.cmd("set hlsearch")

-- Edit/View files relative to current directory
--vim.cmd("cnoremap %% <C-R>=expand('%:h').'/'<cr>")
vim.keymap.set("n", "<leader>E", ":Explore")
vim.keymap.set("n", "<leader>e", ':e <C-R>=expand("%:p:h") . "/" <CR>')
vim.keymap.set("n", "<leader>v", ":view %%")
