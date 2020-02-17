call plug#begin('~/.local/share/nvim/plugged')
Plug 'ntpeters/vim-better-whitespace'
Plug 'itchyny/vim-cursorword'
Plug 'preservim/nerdtree', { 'on': ['NERDTreeToggle', 'NERDTreeFind'] }
    augroup nerdtree
      autocmd!
        autocmd FileType nerdtree setlocal nolist " turn off whitespace characters
        autocmd FileType nerdtree setlocal nocursorline " turn off line highlighting for performance
    augroup END
    let NERDTreeShowHidden=1

    function! ToggleNerdTree()
            if @% != "" && @% !~ "Startify" && (!exists("g:NERDTree") || (g:NERDTree.ExistsForTab() && !g:NERDTree.IsOpen()))
                :NERDTreeFind
            else
                :NERDTreeToggle
            endif
          endfunction
     let g:WebDevIconsOS = 'Darwin'
        let g:WebDevIconsUnicodeDecorateFolderNodes = 1
        let g:DevIconsEnableFoldersOpenClose = 1
        let g:DevIconsEnableFolderExtensionPatternMatching = 1
        let NERDTreeDirArrowExpandable = "\u00a0" " make arrows invisible
        let NERDTreeDirArrowCollapsible = "\u00a0" " make arrows invisible
        let NERDTreeNodeDelimiter = "\u263a" " smiley face
Plug 'Xuyuanp/nerdtree-git-plugin'
Plug 'mhinz/vim-startify'
        let g:startify_lists = [
        \  { 'type': 'dir',       'header': [ 'Files '. getcwd() ] },
        \  { 'type': 'sessions',  'header': [ 'Sessions' ]       },
        \  { 'type': 'bookmarks', 'header': [ 'Bookmarks' ]      },
        \  { 'type': 'commands',  'header': [ 'Commands' ]       },
        \ ]

        let g:startify_commands = [
        \   { 'up': [ 'Update Plugins', ':PlugUpdate' ] },
        \   { 'ug': [ 'Upgrade Plugin Manager', ':PlugUpgrade' ] },
        \ ]

        let g:startify_bookmarks = [
            \ { 'c': '~/.config/nvim/init.vim' },
            \ { 'g': '~/.gitconfig' },
            \ { 'z': '~/.zshrc' }
        \ ]

        autocmd User Startified setlocal cursorline
        nmap <leader>st :Startify<cr>
Plug 'vim-airline/vim-airline'
Plug 'vim-syntastic/syntastic'
Plug 'liuchengxu/vista.vim'
Plug 'tiagofumo/vim-nerdtree-syntax-highlight'
Plug 'vim-airline/vim-airline-themes'
Plug 'tpope/vim-commentary'
Plug 'tweekmonster/django-plus.vim'
Plug 'gryf/pylint-vim'
Plug 'Vimjas/vim-python-pep8-indent'
Plug 'ryanoasis/vim-devicons'
Plug 'dikiaap/minimalist'
Plug 'terryma/vim-multiple-cursors'
Plug 'google/yapf', { 'rtp': 'plugins/vim', 'for': 'python' }
"javascript
Plug 'pangloss/vim-javascript',    { 'for': ['javascript', 'javascript.jsx'] }
Plug 'maxmellon/vim-jsx-pretty',   { 'for': ['javascript', 'javascript.jsx','typescript', 'typescript.tsx'] }
Plug 'gorkunov/smartpairs.vim'
Plug 'neoclide/coc.nvim', {'tag': '*', 'branch': 'release'}
" coc extensions
let g:coc_global_extensions = ['coc-tslint-plugin', 'coc-eslint', 'coc-tsserver', 'coc-emmet', 'coc-css', 'coc-html', 'coc-json', 'coc-yank', 'coc-prettier']
" fzf
Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
Plug 'junegunn/fzf.vim'

" typescript
Plug 'ianks/vim-tsx'
"html
Plug 'Valloric/MatchTagAlways'
Plug 'jiangmiao/auto-pairs'
"indent
Plug 'Yggdroot/indentLine'
call plug#end()

set t_Co=256
set background=dark
set termguicolors
syntax on
colorscheme minimalist
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

"Move between buffers
nmap <Leader>l :bnext<CR>
nmap <Leader>h :bprevious<CR>

" key mapping for tab navigation
nmap <Tab> gt
nmap <S-Tab> gT

"terminal
nnoremap <Leader><Enter> :terminal<CR>

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

if exists('+termguicolors')
  let &t_8f = "\<Esc>[38;2;%lu;%lu;%lum"
  let &t_8b = "\<Esc>[48;2;%lu;%lu;%lum"
  set termguicolors
endif

set nocompatible
filetype plugin indent on

nnoremap <expr> <Leader>o (len(system('git rev-parse')) ? ':Files' : ':GFiles --exclude-standard --others --cached')."\<cr>"
nnoremap <silent> <Leader>a :Buffers<CR>
nnoremap <silent> <Leader>A :Windows<CR>
nnoremap <silent> <Leader>; :BLines<CR>
nnoremap <silent> <Leader>? :History<CR>
nnoremap <silent> <Leader>/ :execute 'Ag ' . input('Ag/')<CR>
nnoremap <silent> <Leader>. :AgIn
nnoremap <silent> <Leader>gl :Commits<CR>
nnoremap <silent> <Leader>ga :BCommits<CR>
nnoremap <silent> <Leader>ft :Filetypes<CR>
imap <C-x><C-f> <plug>(fzf-complete-file-ag)
imap <C-x><C-l> <plug>(fzf-complete-line)

"airline
let g:airline#extensions#tabline#enabled = 1
function! SearchWordWithAg()
  execute 'Ag' expand('<cword>')
endfunction

"airline theme
let g:airline_theme='deus'


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


nnoremap <silent> K :call <SID>show_documentation()<CR>

function! s:show_documentation()
  if (index(['vim','help'], &filetype) >= 0)
    execute 'h '.expand('<cword>')
  else
    call CocAction('doHover')
  endif
endfunction

command! -nargs=0 Prettier :CocCommand prettier.formatFile

"nerdtre
map <C-a> :call ToggleNerdTree()<CR>
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif

"vista
function! NearestMethodOrFunction() abort
  return get(b:, 'vista_nearest_method_or_function', '')
endfunction

set statusline+=%{NearestMethodOrFunction()}

" By default vista.vim never run if you don't call it explicitly.
"
" If you want to show the nearest function in your statusline automatically,
" you can add the following line to your vimrc
autocmd VimEnter * call vista#RunForNearestMethodOrFunction()

" terminal in insert mode
if has('nvim')
    autocmd TermOpen term://* startinsert
endif


"netrw
let g:netrw_winsize = 15
