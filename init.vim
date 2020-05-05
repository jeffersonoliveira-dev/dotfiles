 call plug#begin('~/.local/share/nvim/plugged')
Plug 'ntpeters/vim-better-whitespace'
Plug 'sheerun/vim-polyglot'
Plug 'itchyny/vim-cursorword'
Plug 'ap/vim-buftabline'
Plug 'liuchengxu/vim-which-key'
Plug 'alvan/vim-closetag'
Plug 'mhinz/vim-startify'
Plug 'rakr/vim-one'
Plug 'vim-airline/vim-airline'
Plug 'vim-syntastic/syntastic'
Plug 'vim-airline/vim-airline-themes'
Plug 'tpope/vim-commentary'
Plug 'tweekmonster/django-plus.vim'
Plug 'gryf/pylint-vim'
Plug 'Vimjas/vim-python-pep8-indent'
Plug 'ryanoasis/vim-devicons'
Plug 'terryma/vim-multiple-cursors'
Plug 'google/yapf', { 'rtp': 'plugins/vim', 'for': 'python' }
"javascript
Plug 'pangloss/vim-javascript',    { 'for': ['javascript', 'javascript.jsx'] }
Plug 'gorkunov/smartpairs.vim'
Plug 'neoclide/coc.nvim', {'tag': '*', 'branch': 'release'}
" coc extensions
let g:coc_global_extensions = [
        \ 'coc-css',
        \ 'coc-json',
        \ 'coc-tsserver',
        \ 'coc-git',
        \ 'coc-eslint',
        \ 'coc-tslint-plugin',
        \ 'coc-pairs',
        \ 'coc-sh',
        \ 'coc-vimlsp',
        \ 'coc-emmet',
        \ 'coc-prettier',
        \ 'coc-ultisnips',
        \ 'coc-explorer',
        \ 'coc-actions'
        \ ]
" fzf
Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
Plug 'junegunn/fzf.vim'

" typescript
Plug 'leafgarland/typescript-vim'
Plug 'peitalin/vim-jsx-typescript'
Plug 'HerringtonDarkholme/yats.vim'
" or Plug 'leafgarland/typescript-vim'
Plug 'maxmellon/vim-jsx-pretty'
"html
Plug 'Valloric/MatchTagAlways'
Plug 'jiangmiao/auto-pairs'
"indent
"Plug 'Yggdroot/indentLine'
let g:indentLine_char_list = ['|']
call plug#end()

set t_Co=256
set termguicolors
set background=dark " or light if you prefer the light version
let g:two_firewatch_italics=1
colo one
let g:airline_theme='bubblegum' " if you have Airline installed and want the associated theme
syntax on
let mapleader=" "
set lazyredraw
nnoremap <Leader>w :w<CR>
set noswapfile
set nobackup
set nowb
set scrolloff=8
set expandtab
set tabstop=2
set shiftwidth=2
set softtabstop=2
set relativenumber
set textwidth=0
set linespace=2
set smarttab
set autoindent
set number	" Show line numbers
set linebreak	" Break lines at word (requires Wrap lines)
set textwidth=100	" Line wrap (number of cols)
set showmatch	" Highlight matching brace
set nospell	" Enable spell-checking
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


" looks for JSX in just .js files
let g:jsx_ext_required = 0

" wrap quickfix window
autocmd FileType qf setlocal wrap linebreak
autocmd FileType qf setlocal wrap linebreak
autocmd BufNewFile,BufRead .babelrc setlocal filetype=json
autocmd BufNewFile,BufRead .eslintrc setlocal filetype=json
highlight Comment cterm=italic gui=italic

" searching
set incsearch " incremental searching
set hlsearch " hightlight matching
set showbreak=->
set wrap linebreak nolist " only manuly insert line breaks
set showmatch " show matching brackets for a moment

" vim better whitespace
let g:better_whitespace_enabled=0
let g:strip_whitespace_on_save=1
let g:strip_whitespace_confirm=0

" some stuff to get the mouse going in term
set mouse=a

"hide buffers when not displayed
set hidden

" search better
nnoremap / /\v\c
vnoremap / /\v\c

"Move between buffers
nmap <Leader>l :bnext<CR>
nmap <Leader>h :bprevious<CR>

" key mapping for tab navigation
nmap <Tab> gt
nmap <S-Tab> gT

"terminal
nnoremap <Leader><Enter> :term<CR>

"use ; to issue a command"
nnoremap ; :

"use :W as :w"
nnoremap :W :w
""

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


" Start terminal in insert mode
au BufEnter * if &buftype == 'terminal' | :startinsert | endif

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

set nowritebackup
" Better display for messages
set cmdheight=2

" You will have bad experience for diagnostic messages when it's default 4000.
set updatetime=300
" don't give |ins-completion-menu| messages.
set shortmess=I
" always show signcolumns
set signcolumn=yes


set nocompatible
filetype plugin indent on

nnoremap <expr> <Leader>o (len(system('git rev-parse')) ? ':Files' : ':GFiles --exclude-standard --others --cached')."\<cr>"
imap <C-x><C-f> <plug>(fzf-complete-file-ag)
imap <C-x><C-l> <plug>(fzf-complete-line)

"airline
let g:airline#extensions#tabline#enabled = 0
function! SearchWordWithAg()
  execute 'Ag' expand('<cword>')
endfunction


function! SearchVisualSelertionWithAg() range
  let old_reg = getreg('"')
  let old_regtype = getregtype('"')
  let old_clipboard = &clipboard
  set clipboard&
  normal! ""gvy
  let selection = getreg('"')
  call setreg('"', old_reg, old_regtype)
  let &clipboard = old_clipboard
  execute 'Ag' selection
endfunction
function! SearchWithAgInDirectory(...)
  call fzf#vim#ag(join(a:000[1:], ' '), extend({'dir': a:1}, g:fzf#vim#default_layout))
endfunction
command! -nargs=+ -complete=dir AgIn call SearchWithAgInDirectory(<f-args>)
" }}}

" == AUTOCMD ================================
" by default .ts file are not identified as typescript and .tsx files are not
" identified as typescript react file, so add following
au BufNewFile,BufRead *.ts setlocal filetype=typescript
au BufNewFile,BufRead *.tsx setlocal filetype=typescript.tsx
" == AUTOCMD END ================================


function! LinterStatus() abort
  let l:counts = ale#statusline#Count(bufnr(''))

  let l:all_errors = l:counts.error + l:counts.style_error
  let l:all_non_errors = l:counts.total - l:all_errors

  return l:counts.total == 0 ? '✨ all good ✨' : printf(
        \   '😞 %dW %dE',
        \   all_non_errors,
        \   all_errors
        \)
endfunction

set statusline=
set statusline+=%m
set statusline+=\ %f
set statusline+=%=
set statusline+=\ %{LinterStatus()}


autocmd CursorHold * silent call CocActionAsync('highlight')

set statusline^=%{coc#status()}%{get(b:,'coc_current_function','')}
command! -nargs=0 OR :call CocAction('runCommand', 'editor.action.organizeImport')


nnoremap <silent> K :call <SID>show_documentation()<CR>

nnoremap <C-a> :CocCommand explorer<CR>

function! s:show_documentation()
  if (index(['vim','help'], &filetype) >= 0)
    execute 'h '.expand('<cword>')
  else
    call CocAction('doHover')
  endif
endfunction

command! -nargs=0 Prettier :CocCommand prettier.formatFile

"" terminal in insert mode
if has('nvim')
    autocmd TermOpen term://* startinsert
endif


xmap <silent> <leader>a :<C-u>execute 'CocCommand actions.open ' . visualmode()<CR>
nmap <silent> <leader>a :<C-u>set operatorfunc=<SID>cocActionsOpenFromSelected<CR>g@
let $NVIM_TUI_ENABLE_TRUE_COLOR=1
if (has("termguicolors"))
 set termguicolors
endif

function! s:cocActionsOpenFromSelected(type) abort
  execute 'CocCommand actions.open ' . a:type
endfunction

let g:rainbow_active = 1
"closetag
let g:closetag_filenames = "*.html,*.xhtml,*.phtml,*.php,*.jsx,*.tsx"

let g:onedark_hide_endofbuffer = 1
let g:onedark_terminal_italics = 1
let g:airline_theme='onedark'

" Fix files with prettier, and then ESLint.
let b:ale_fixers = ['prettier', 'eslint']
" Equivalent to the above.
let b:ale_fixers = {'javascript': ['prettier', 'eslint']}


"vim which key
nnoremap <silent> <leader> :WhichKey '<Space>'<CR>
set timeoutlen=500
