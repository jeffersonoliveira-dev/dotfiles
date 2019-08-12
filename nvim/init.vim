call plug#begin('~/.local/share/nvim/plugged')

Plug 'christoomey/vim-tmux-navigator'
Plug 'ntpeters/vim-better-whitespace'
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'itchyny/vim-cursorword'
Plug 'terryma/vim-multiple-cursors'
Plug 'neoclide/coc.nvim', {'branch': 'release'}
Plug 'Raimondi/delimitMate'
Plug 'tpope/vim-fugitive'
Plug 'airblade/vim-gitgutter'
Plug 'rakr/vim-one'


" file management
Plug 'tpope/vim-vinegar'

Plug 'ludovicchabant/vim-gutentags'

Plug 'w0rp/ale'


"javascript
Plug 'elzr/vim-json', { 'for': 'json' }
Plug 'pangloss/vim-javascript',    { 'for': ['javascript', 'javascript.jsx'] }
Plug 'maxmellon/vim-jsx-pretty',   { 'for': ['javascript', 'javascript.jsx','typescript', 'typescript.tsx'] }
Plug 'othree/html5.vim',       { 'for': 'html' }
Plug 'hail2u/vim-css3-syntax', { 'for': 'css' }
Plug 'elzr/vim-json',          { 'for': 'json' }
Plug 'neoclide/jsonc.vim'

Plug 'tpope/vim-surround'
Plug 'gorkunov/smartpairs.vim'



"prettier
Plug 'sbdchd/neoformat'

"html
Plug 'Valloric/MatchTagAlways'

" markdown
Plug 'plasticboy/vim-markdown', { 'for' : 'markdown'}

"indent
Plug 'Yggdroot/indentLine'

call plug#end()
set t_Co=256
set background=dark
set termguicolors
colorscheme one
let mapleader=" "
set lazyredraw
nnoremap <Leader>w :w<CR>
set noswapfile
set nobackup
set nowb
set scrolloff=8
set relativenumber
set expandtab
set tabstop=2
set shiftwidth=2
set softtabstop=2
set textwidth=0
set linespace=2
set smarttab
set autoindent
set number	" Show line numbers
set linebreak	" Break lines at word (requires Wrap lines)
set textwidth=100	" Line wrap (number of cols)
set showmatch	" Highlight matching brace
set spell	" Enable spell-checking
set visualbell	" Use visual bell (no beeping)
set cursorline
set hlsearch	" Highlight all search results
set smartcase	" Enable smart-case search
set ignorecase	" Always case-insensitive
set incsearch	" Searches for strings incrementally
set smartindent	" Enable smart-indent
set smarttab	" Enable smart-tabs
set softtabstop=4	" Number of spaces per Tab

" Advanced
set ruler	" Show row and column ruler information
set ttyfast

set undolevels=1000	" Number of undo levels
set backspace=indent,eol,start	" Backspace behaviour
inoremap <silent><expr><tab> pumvisible() ? "\<c-n>" : "\<tab>"
inoremap <silent><expr><s-tab> pumvisible() ? "\<c-p>" : "\<s-tab>"
" turn on syntax highlighting
syntax enable
set clipboard=unnamed

set backspace=indent,eol,start
set history=1000

" status bar
set showcmd
set showmode
set modeline            " Enable modeline.
set linespace=0         " Set line-spacing to minimum.
set nojoinspaces        " Prevents insertin two spaces after punctuation on a join (J)

" Airline
let g:airline#extensions#tabline#enabled = 2
let g:airline#extensions#tabline#fnamemod = ':t'
let g:airline#extensions#tabline#left_sep = ' '
let g:airline#extensions#tabline#left_alt_sep = '|'
let g:airline#extensions#tabline#right_sep = ' '
let g:airline#extensions#tabline#right_alt_sep = '|'
let g:airline_powerline_fonts = 1
let g:airline_left_sep = ' '
let g:airline_left_alt_sep = '|'
let g:airline_right_sep = ' '
let g:airline_right_alt_sep = '|'
let g:airline_theme='one'
let g:one_allow_italics = 1 " I love italic for comments


let g:closetag_filenames= '*.jsx,*.js,*.html'
let g:closetag_xhtml_filenames= '*.jsx,*.js'
let g:closetag_xhtml_filetypes= 'javascript.jsx'
" looks for JSX in just .js files
let g:jsx_ext_required = 0

" wrap quickfix window
autocmd FileType qf setlocal wrap linebreak

set tags=./.tags;

autocmd FileType qf setlocal wrap linebreak

autocmd BufNewFile,BufRead .babelrc setlocal filetype=json
autocmd BufNewFile,BufRead .eslintrc setlocal filetype=json





highlight Comment cterm=italic gui=italic
" neoformat
autocmd BufWritePre *.js Neoformat

" coc
nmap <leader>rn <Plug>(coc-rename)
command! -nargs=0 Prettier :call CocAction('runCommand', 'prettier.formatFile')

" searching
set incsearch " incremental searching
set hlsearch " hightlight matching


set showbreak=->
set wrap linebreak nolist " only manuly insert line breaks
set showmatch " show matching brackets for a moment


" vim better whitespace
let g:better_whitespace_enabled=1
let g:strip_whitespace_on_save=1
let g:strip_whitespace_confirm=0

" some stuff to get the mouse going in term
set mouse=a



"hide buffers when not displayed
set hidden

" search better
nnoremap / /\v\c
vnoremap / /\v\c

" FZF
nnoremap <Leader>o :FZF<CR>

"Move between buffers
nmap <Leader>l :bnext<CR>
nmap <Leader>h :bprevious<CR>

" key mapping for tab navigation
nmap <Tab> gt
nmap <S-Tab> gT

"terminal
nnoremap <Leader><Enter> :terminal<CR>


" stay in normal mode after inserting a new line
noremap o o <Bs><Esc>
noremap O O <Bs><Esc>

" prettier
autocmd FileType typescript setlocal formatprg=prettier\ --parser\ typescript

"use ; to issue a command"
nnoremap ; :

" copy yanked text to clipboard
vnoremap <C-c> "+y


" disable visual bell
set noerrorbells
set novisualbell
set visualbell t_vb=


" toggle paste mode
nnoremap <F2> :set invpaste paste?<CR>
imap <F2> <C-O>:set invpaste paste?<CR>
set pastetoggle=<F2>

inoremap jj <Esc><Esc>
inoremap jk <Esc><Esc>
inoremap kj <Esc><Esc>



"make <c-l> clear the highlight as well as redraw
nnoremap <C-l> :nohls<CR><C-L>
inoremap <C-l> <C-O>:nohls<CR>
set ruler
"jump to last cursor position when opening a file
"dont do it when writing a commit log entry
autocmd BufReadPost * call SetCursorPosition()
function! SetCursorPosition()
    if &filetype !~ 'commit\c'
        if line("'\"") > 0 && line("'\"") <= line("$")
            exe "normal! g`\""
            normal! zz
        endif
    end
  endfunction


  " file type recognition
filetype on
filetype plugin on
filetype indent on


" close buffer
nnoremap <silent> <leader>bd :bd<CR>

" horizontal split with new buffer
nnoremap <silent> <leader>bh :new<CR>


" improved keyboard support for navigation (especially terminal)
" https://neovim.io/doc/user/nvim_terminal_emulator.html
tnoremap <Esc> <C-\><C-n>
tnoremap <A-h> <C-\><C-n><C-w>h
tnoremap <A-j> <C-\><C-n><C-w>j
tnoremap <A-k> <C-\><C-n><C-w>k
tnoremap <A-l> <C-\><C-n><C-w>l
nnoremap <A-h> <C-w>h
nnoremap <A-j> <C-w>j
nnoremap <A-k> <C-w>k
nnoremap <A-l> <C-w>l

" Start terminal in insert mode
au BufEnter * if &buftype == 'terminal' | :startinsert | endif
nnoremap <silent> <leader>tv :vnew<CR>:terminal<CR>
nnoremap <silent> <leader>th :new<CR>:terminal<CR>
tnoremap <C-x> <C-\><C-n><C-w>q


" visual search mappings
function! s:VSetSearch()
    let temp = @@
    norm! gvy
    let @/ = '\V' . substitute(escape(@@, '\'), '\n', '\\n', 'g')
    let @@ = temp
endfunction
vnoremap * :<C-u>call <SID>VSetSearch()<CR>//<CR>
vnoremap # :<C-u>call <SID>VSetSearch()<CR>??<CR>

" search and replace shortcut
nmap <Leader>s :%s//cg<Left><Left><Left>

"set encoding to utf8
if &encoding != 'utf-8'
    set encoding=utf-8              "Necessary to show Unicode glyphs
endif



"set cursorline
set laststatus=2
" unicode symbols
"
  if !exists('g:airline_symbols')
    let g:airline_symbols = {}
  endif
let g:airline_symbols_ascii = 1
let g:airline_left_alt_sep = ''
let g:airline_right_alt_sep = ''
let g:airline_left_sep = ''
let g:airline_right_sep = ''
let g:airline_symbols.crypt = '🔒'
let g:airline_symbols.linenr = ''
let g:airline_symbols.maxlinenr = '☰'
let g:airline_symbols.branch = ''
let g:airline_symbols.readonly = ''
let g:airline_symbols.paste = 'ρ'
let g:airline_symbols.spell = 'Ꞩ'
let g:airline_symbols.notexists = '∄'
let g:airline_symbols.whitespace = 'Ξ'
let g:airline_powerline_fonts = 1

" ale
let g:ale_linters = {
\   'javascript': ['eslint'],
\   'vue': ['eslint']
\}

let g:ale_fixers = {
\    'javascript': ['eslint'],
\    'typescript': ['prettier'],
\    'vue': ['eslint'],
\    'scss': ['prettier'],
\    'html': ['prettier']
\}
let g:ale_fix_on_save = 1
let g:ale_set_quickfix = 1
let g:ale_lint_on_text_changed = 'never'
let g:ale_lint_on_insert_leave = 0
let g:ale_lint_on_enter= 0


set nowritebackup

" Better display for messages
set cmdheight=2

" You will have bad experience for diagnostic messages when it's default 4000.
set updatetime=300

" don't give |ins-completion-menu| messages.
set shortmess+=c

" always show signcolumns
set signcolumn=yes


"ctags
set statusline+=%{gutentags#statusline()}



" markdown
let g:vim_markdown_folding_level = 6
let g:vim_markdown_emphasis_multiline = 0
let g:vim_markdown_conceal = 0
let g:vim_markdown_frontmatter = 1
let g:vim_markdown_new_list_item_indent = 2
let g:vim_markdown_edit_url_in = 'vsplit'
let g:vim_markdown_strikethrough = 1
let g:vim_markdown_fenced_languages = [
  \ 'c++=cpp',
  \ 'viml=vim',
  \ 'bash=sh',
  \ 'ini=dosini',
  \ 'js=javascript',
  \ 'json=javascript',
  \ 'docker=Dockerfile',
  \ 'makefile=make',
  \ 'py=python'
  \ ]

if exists('$TMUX')
    let &t_SI .= "\ePtmux;\e\e[=1c\e\\"
    let &t_EI .= "\ePtmux;\e\e[=2c\e\\"
 else
    let &t_SI .= "\e[=1c"
    let &t_EI .= "\e[=2c"
 endif

if exists('+termguicolors')
  let &t_8f = "\<Esc>[38;2;%lu;%lu;%lum"
  let &t_8b = "\<Esc>[48;2;%lu;%lu;%lum"
  set termguicolors
endif

set nocompatible
filetype plugin indent on
augroup filetypes
  autocmd!
  autocmd BufNewFile,BufRead .babelrc set filetype=json
  autocmd BufNewFile,BufRead .eslintrc set filetype=json
  autocmd BufNewFile,BufRead .prettierrc set filetype=json
  autocmd BufNewFile,BufRead tsconfig.json set filetype=jsonc
  autocmd BufNewFile,BufRead .gitignore set filetype=config
  autocmd BufNewFile,BufRead *.tsx set filetype=typescript.tsx
  autocmd BufNewFile,BufRead *.js set filetype=javascript.tsx
  autocmd BufNewFile,BufRead zprofile set filetype=zsh
augroup END

