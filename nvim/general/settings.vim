let mapleader=" "

set t_Co=256
set termguicolors
syntax on
set lazyredraw
set noswapfile
set nobackup
set nowb
set scrolloff=8
set expandtab
set tabstop=2
set shiftwidth=2
set softtabstop=2
set number relativenumber
" set relativenumber
set textwidth=0
set linespace=2
set smarttab
set autoindent
set encoding=utf-8
set hidden
" Advanced
set ruler	" Show row and column ruler information
set ttyfast
set backspace=indent,eol,start	" Backspace behaviour
" turn on syntax highlighting
syntax enable
set clipboard=unnamed
set backspace=indent,eol,start
set history=1000

" status bar
set showcmd
set showmode
set modeline      " Enable modeline.
set linespace=0   " Set line-spacing to minimum.
set nojoinspaces  " Prevents insertin two spaces after punctuation on a join (J)

" wrap quickfix window
autocmd FileType qf setlocal wrap linebreak
autocmd FileType qf setlocal wrap linebreak
autocmd BufNewFile,BufRead .babelrc setlocal filetype=json
autocmd BufNewFile,BufRead .eslintrc setlocal filetype=json

"italic comments
highlight Comment cterm=italic gui=italic

" searching
set incsearch " incremental searching
set hlsearch " hightlight matching
set showbreak=->
set wrap linebreak nolist " only manuly insert line breaks
set showmatch " show matching brackets for a moment
set mouse=a

"statusline
set statusline=
set statusline+=%m
set statusline+=\ %f
set statusline+=%=

let $NVIM_TUI_ENABLE_TRUE_COLOR=1
if (has("termguicolors"))
 set termguicolors
endif

set nobackup
set nowritebackup
set shortmess+=c
set signcolumn=yes

" Better display for messages
set cmdheight=2

" You will have bad experience for diagnostic messages when it's default 4000.
set updatetime=50
" color column
set colorcolumn=80
highlight ColorColumn ctermbg=0 guibg=lightgrey


set nocompatible
filetype plugin indent on

"timeout
set timeoutlen=500

let g:LanguageClient_serverCommands = {
    \ 'vue': ['vls']
    \ }
