set nocompatible               " be iMproved
call pathogen#infect()

"  ---------------------------------------------------------------------------
"  Plugins
"  ---------------------------------------------------------------------------

silent! runtime bundles.vim

"  ---------------------------------------------------------------------------
"  General
"  ---------------------------------------------------------------------------

filetype plugin indent on     
let mapleader = ","
let g:mapleader = ","
set modelines=0
set history=1000
set nobackup
set nowritebackup
set noswapfile
syntax enable
set autoread
set clipboard=unnamed

"  ---------------------------------------------------------------------------
"  UI
"  ---------------------------------------------------------------------------

set title
set encoding=utf-8
set scrolloff=3
set autoindent
set smartindent
set showmode
set showcmd
set hidden
set wildmenu
set wildmode=list:longest
set visualbell
set cursorline
set ttyfast
set ruler
set backspace=indent,eol,start
set laststatus=2
set number
" set noballooneval
"set relativenumber
"set undofile
set cpoptions+=$

" Auto adjust window sizes when they become current
"set winwidth=84
"set winheight=5
"set winminheight=5
"set winheight=999

"colorscheme solarized
set background=dark
colorscheme codeschool


hi ColorColumn  cterm=NONE ctermbg=235
hi EndOfBuffer  cterm=NONE ctermbg=235

set splitbelow splitright
"  ---------------------------------------------------------------------------
"  Text Formatting
"  ---------------------------------------------------------------------------

set tabstop=2
set shiftwidth=2
set softtabstop=2
set expandtab
set tags:tags,./tmp/tags;

"set nowrap
"set textwidth=79
"set formatoptions=n
"
"" check to make sure vim has been compiled with colorcolumn support
"" before enabling it
"if exists("+colorcolumn")
"  set colorcolumn=80
"endif

"  ---------------------------------------------------------------------------
"  File browsing
"  ---------------------------------------------------------------------------
let g:netrw_banner=0 "disable banner
let g:netrw_browses_split=4 " open in prior window
let g:netrw_altv=1 " opens split to the right
let g:netrw_liststyle=3 " tree view
"  ---------------------------------------------------------------------------
"  Status Line
"  ---------------------------------------------------------------------------

" path
set statusline=%f
" flags
set statusline+=%m%r%h%w
" git branch
"set statusline+=\ %{fugitive#statusline()}
" encoding
set statusline+=\ [%{strlen(&fenc)?&fenc:&enc}]
" rvm
"set statusline+=\ %{rvm#statusline()}
" line x of y
set statusline+=\ [Line\ %l\/%L\ %P]
" col
set statusline+=\ [Col\ %c\/%v]
" Buff
set statusline+=\ [Buf\ #\%n]

" Colour
hi StatusLine ctermfg=Black ctermbg=White

" Change colour of statusline in insert mode
au InsertEnter * hi StatusLine ctermbg=DarkBlue
au InsertLeave * hi StatusLine ctermfg=Black ctermbg=White

"  ---------------------------------------------------------------------------
"  Mappings
"  ---------------------------------------------------------------------------

" Searching / moving
nnoremap / /\v
vnoremap / /\v
set ignorecase
set smartcase
set incsearch
set showmatch
set hlsearch

" Center screen when scrolling search results
nmap n nzz
nmap N Nzz


" fzf config
set rtp+=/usr/local/opt/fzf

" ACK
set grepprg=ack

" ,a to Ack (search in files)
nnoremap <leader>a :Ack 

" Ack settings: https://github.com/krisleech/vimfiles/wiki/Make-ack-ignore-files

" show/ hide cursor line
hi CursorLine   cterm=NONE ctermbg=235
hi CursorColumn cterm=NONE ctermbg=235
nnoremap <leader>x :set cursorline! cursorcolumn!

" Edit/View files relative to current directory
cnoremap %% <C-R>=expand('%:h').'/'<cr>
map <leader>e :edit %%
map <leader>v :view %%
nmap <silent> <leader>E :Explore<CR>

" Ignore some binary, versioning and backup files when auto-completing
set wildignore=.svn,CVS,.git,*.swp,*.jpg,*.png,*.gif,*.pdf,*.bak

"  ---------------------------------------------------------------------------
"  Plugins
"  ---------------------------------------------------------------------------
"#UltiSnip
" If you want :UltiSnipsEdit to split your window.
let g:UltiSnipsEditSplit="vertical"
"let g:UltiSnipsSnippetDirectories="~/.vim/bundle/vim-snippets/snippets"
let g:UltiSnipsSnippetDirectories = ['~/.vim/bundle/vim-snippets/snippets', 'UltiSnips']

"#FuzzyFinder
"let g:fzf_command_prefix = 'Fzf'
map <leader>F :Files<CR>
map <leader>s :Tags<CR>
map <leader>S :BTags<CR>
map <leader>b :Buffers<CR>

" AutoClose
let g:AutoClosePairs = {'(': ')', '{': '}', '[': ']', '"': '"', "'": "'", '#{': '}'} 
let g:AutoCloseProtectedRegions = ["Character"] 

let my_home = expand("$HOME/")

let g:jsx_ext_required = 0 " Allow JSX in normal JS files

"  ---------------------------------------------------------------------------
"  Ruby/Rails
"  ---------------------------------------------------------------------------
" Leader shortcuts for Rails commands
map <Leader>m :Emodel 
map <Leader>c :Econtroller 
map <Leader>v :Eview 
map <Leader>u :Eunittest 
map <Leader>ff :Rfunctionaltest 
map <Leader>tm :RTmodel 
map <Leader>tc :RTcontroller 
map <Leader>tv :RTview 
map <Leader>tu :RTunittest 
map <Leader>tf :RTfunctionaltest 
map <Leader>sm :RSmodel 
map <Leader>sc :RScontroller 
map <Leader>sv :RSview 
map <Leader>su :RSunittest 
map <Leader>sf :RSfunctionaltest 

"  ---------------------------------------------------------------------------
"  Rspc
"  ---------------------------------------------------------------------------
let g:rspec_command = 'call Send_to_Tmux("rspec {spec}\n")'

" Hide search highlighting
map <Leader>h :set invhls <CR>

" Opens an edit command with the path of the currently edited file filled in
" Normal mode: <Leader>e
map <Leader>e :e <C-R>=expand("%:p:h") . "/" <CR>

" Opens a tab edit command with the path of the currently edited file filled
" in
" Normal mode: <Leader>t
map <Leader>te :tabe <C-R>=expand("%:p:h") . "/" <CR>

" Inserts the path of the currently edited file into a command
" Command mode: Ctrl+P
cmap <C-P> <C-R>=expand("%:p:h") . "/" <CR>
" Execute current buffer as ruby
map <S-r> :w !ruby<CR>

" Other files to consider Ruby
au BufRead,BufNewFile Gemfile,Rakefile,Thorfile,config.ru,Vagrantfile,Guardfile,Capfile set ft=ruby

"  ---------------------------------------------------------------------------
"  GUI
"  ---------------------------------------------------------------------------

if has("gui_running")
  set guioptions-=T " no toolbar set guioptions-=m " no menus
  set guioptions-=r " no scrollbar on the right
  set guioptions-=R " no scrollbar on the right
  set guioptions-=l " no scrollbar on the left
"  set guioptions-=b " no scrollbar on the bottom
"  set guioptions=aiA 
"  set mouse=v
"  set guifont=Monaco:h11 "<- Maybe a good idea when using mac
endif
"set guifont=Monaco:h11

"  ---------------------------------------------------------------------------
"  Directories
"  ---------------------------------------------------------------------------

set backupdir=~/tmp,/tmp
"set undodir=~/.vim/.tmp,~/tmp,~/.tmp,/tmp

" Ctags path (brew install ctags)
let Tlist_Ctags_Cmd = 'ctags'

" Make Vim use RVM correctly when using Zsh
" https://rvm.beginrescueend.com/integration/vim/
set shell=/bin/bash

" Finally, load custom configs
if filereadable(my_home . '.vimrc.local')
  source ~/.vimrc.local
endif

"  ---------------------------------------------------------------------------
"  Node / React / JSX
"  ---------------------------------------------------------------------------
" grant plugin on file with other than .jsx extension
let g:jsx_ext_required = 0
let g:javascript_plugin_flow = 1


"  ---------------------------------------------------------------------------
" Syntastic 
"  ---------------------------------------------------------------------------
set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*
let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 1
let g:syntastic_check_on_open = 1
let g:syntastic_check_on_wq = 0
let g:syntastic_javascript_checkers = ['eslint']
let g:syntastic_javascript_eslint_exe = '$(npm bin)/eslint'
let g:syntastic_ruby_mri_args = "-W1"


"  ---------------------------------------------------------------------------
"  Misc
"  ---------------------------------------------------------------------------
"
"  white spaces handling

function! ShowSpaces(...)
  let @/='\v(\s+$)|( +\ze\t)'
  let oldhlsearch=&hlsearch
  if !a:0
    let &hlsearch=!&hlsearch
  else
    let &hlsearch=a:1
  end
  return oldhlsearch
endfunction

function! TrimSpaces() range
  let oldhlsearch=ShowSpaces(1)
  execute a:firstline.",".a:lastline."substitute ///gec"
  let &hlsearch=oldhlsearch
endfunction

"command -bar -nargs=? ShowSpaces call ShowSpaces(<args>)
"command -bar -nargs=0 -range=% TrimSpaces <line1>,<line2>call TrimSpaces()
"nnoremap <F12>     :ShowSpaces 1<CR>
"nnoremap <S-F12>   m`:TrimSpaces<CR>``
"vnoremap <S-F12>   :TrimSpaces<CR>
"
" list methods
function! ShowFunc(sort)
  let gf_s = &grepformat
  let gp_s = &grepprg
  if ( &filetype == "c" || &filetype == "php" || &filetype == "python" ||
        \ &filetype == "sh" )
    let &grepformat='%*\k%*\sfunction%*\s%l%*\s%f %m'
    let &grepprg = 'ctags -x --'.&filetype.'-types=f --sort='.a:sort
  elseif ( &filetype == "perl" )
    let &grepformat='%*\k%*\ssubroutine%*\s%l%*\s%f %m'
    let &grepprg = 'ctags -x --perl-types=s --sort='.a:sort
  elseif ( &filetype == "vim" )
    let &grepformat='%*\k%*\sfunction%*\s%l%*\s%f %m'
    let &grepprg = 'ctags -x --vim-types=f --language-force=vim --sort='.a:sort
  endif
  if (&readonly == 0) | update | endif
  silent! grep %
  cwindow 10
  redraw
  let &grepformat = gf_s
  let &grepprg = gp_s
endfunc



"http://stackoverflow.com/questions/5686206/search-replace-using-quickfix-list-in-vim/5686810#5686810
"Append quickfix results to args
command! -nargs=0 -bar Qargs execute 'args ' . QuickfixFilenames()
function! QuickfixFilenames()
  " Building a hash ensures we get each buffer only once
  let buffer_numbers = {}
  for quickfix_item in getqflist()
    let buffer_numbers[quickfix_item['bufnr']] = bufname(quickfix_item['bufnr'])
  endfor
  return join(values(buffer_numbers))
endfunction


" When vimrc, either directly or via symlink, is edited, automatically reload it
autocmd! bufwritepost .vimrc source %
autocmd! bufwritepost vimrc source %
