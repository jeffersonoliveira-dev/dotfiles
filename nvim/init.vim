" Specify a directory for plugins (for Neovim: ~/.local/share/nvim/plugged)
call plug#begin('~/.vim/plugged')
Plug 'posva/vim-vue'
Plug 'scrooloose/nerdtree'
Plug 'vim-airline/vim-airline'
Plug 'neoclide/coc.nvim', {'tag': '*', 'do': { -> coc#util#install()}}
Plug 'docunext/closetag.vim'
Plug 'skywind3000/asyncrun.vim'
Plug 'Valloric/MatchTagAlways'
Plug 'w0rp/ale'
Plug 'vim-airline/vim-airline-themes'
Plug 'terryma/vim-multiple-cursors'
Plug 'tpope/vim-commentary'
Plug 'tpope/vim-unimpaired'
Plug 'tpope/vim-eunuch'
Plug 'tpope/vim-repeat'
Plug 'vim-airline/vim-airline'
Plug 'airblade/vim-gitgutter'
Plug 'ctrlpvim/ctrlp.vim'
Plug 'jiangmiao/auto-pairs'
Plug 'ayu-theme/ayu-vim'
" if has('nvim')
  " Plug 'Shougo/deoplete.nvim', { 'do': ':UpdateRemotePlugins' }
" else
  " Plug 'Shougo/deoplete.nvim'
  " Plug 'roxma/nvim-yarp'
  " Plug 'roxma/vim-hug-neovim-rpc'
" endif
" let g:deoplete#enable_at_startup = 1
" Plug 'Shougo/neosnippet.vim'
" Plug 'Shougo/neosnippet-snippets'

" HTML
Plug 'alvan/vim-closetag', {'for': 'html' }
Plug 'mattn/emmet-vim'

" easymotion
" Plug 'easymotion/vim-easymotion'
" JavaScript
Plug 'moll/vim-node'
Plug 'mxw/vim-jsx', {'for': 'javascript'}
Plug 'othree/yajs.vim', {'for': 'javascript'}
Plug 'othree/es.next.syntax.vim', {'for': 'javascript'}
Plug 'gavocanov/vim-js-indent', {'for': 'javascript'}
Plug 'pangloss/vim-javascript'
call plug#end()

let mapleader = ' '
nnoremap <Leader>w :w<CR>
" matchtags
nnoremap <leader>% :MtaJumpToOtherTag<cr>
" autocmd BufRead,BufNewFile *.vue setfiletype html
filetype plugin indent on
set termguicolors
let ayucolor="mirage"
colorscheme ayu
let base16colorspace=256
syntax enable
set background=dark
set number
set clipboard=unnamed
set relativenumber
set tabstop=2
set mouse=a
set scrolljump=5                " Lines to scroll when cursor leaves screen
set scrolloff=3                 " Minimum lines to keep above and below cursor
set smartcase
set expandtab
set shiftwidth=2
set noswapfile
set undofile
set undodir=~/.config/nvim/temp/undodir
set completeopt-=preview
set showcmd             " Show (partial) command in status line.
set showmatch           " Show matching brackets.
set showmode            " Show current mode.
set formatoptions+=o    " Continue comment marker in new lines.
set textwidth=0         " Hard-wrap long lines as you type them.
nnoremap J mzJ`z

" matchtag
let g:mta_filetypes = {'html': 1, 'xhtml': 1, 'js': 1, 'jsx': 1}

" For conceal markers.
if has('conceal')
  set conceallevel=2 concealcursor=niv
endif


"Move between buffers
nmap <Leader>l :bnext<CR>
nmap <Leader>h :bprevious<CR>

" Use <C-L> to clear the highlighting of :set hlsearch.
if maparg('<C-L>', 'n') ==# ''
  nnoremap <silent> <C-L> :nohlsearch<CR><C-L>
endif
" Use ; for commands.
nnoremap ; :
" Use Q to execute default register.
nnoremap Q @q

set noerrorbells        " No beeps.
set modeline            " Enable modeline.
set linespace=0         " Set line-spacing to minimum.
set nojoinspaces        " Prevents insertin two spaces after punctuation on a join (J)

map <C-a> :NERDTreeToggle<CR>


" More natural splits
set splitbelow          " Horizontal split below current.
set splitright          " Vertical split to right of current.

nnoremap <Down> :m .+1<CR>==
nnoremap <Up> :m .-2<CR>==


" Search and Replace
nmap <Leader>s :%s//g<Left><Left>


" Configure CtrlP
let g:ctrlp_working_path_mode = 'r'
set wildignore+=*/tmp/*,*.so,*.swp,*.zip     " MacOSX/Linux
let g:ctrlp_custom_ignore = '[/].(git|hg|svn)$'


" Open file menu
nnoremap <Leader>o :CtrlP<CR>
" Open buffer menu
nnoremap <Leader>b :CtrlPBuffer<CR>
" Open most recently used files
nnoremap <Leader>f :CtrlPMRUFiles<CR>

" Relative numbering
function! NumberToggle()
  if(&relativenumber == 1)
    set nornu
    set number
  else
    set rnu
  endif
endfunc

" Toggle between normal and relative numbering.
nnoremap <leader>r :call NumberToggle()<cr>


" Visual shifting (does not exit Visual mode)
vnoremap < <gv
vnoremap > >gv


" show next jshint error
nnoremap <silent><F2> :lnext<CR>
inoremap <silent><F2> <C-O>:lnext<CR>
vnoremap <silent><F2> :lnext<CR>

" show previous jshint error
nnoremap <silent><F3> :lprevious<CR>
inoremap <silent><F3> <C-O>:lprevious<CR>
vnoremap <silent><F3> :lprevious<CR>
autocmd BufWritePost *.js AsyncRun -post=checktime ./node_modules/.bin/eslint --fix %

" using tabs
nnoremap th  :tabfirst<CR>
nnoremap tj  :tabnext<CR>
nnoremap tk  :tabprev<CR>
nnoremap tl  :tablast<CR>
nnoremap tt  :tabedit<Space>
nnoremap tn  :tabnew<Space>
nnoremap tm  :tabm<Space>
nnoremap tc  :tabclose<CR>
nnoremap <S-h> gT
nnoremap <S-l> gt


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
let g:ruby_host_prog = '/home/jefferson/.gem/ruby/2.6.0/bin/neovim-ruby-host'
let g:airline#extensions#ale#enabled = 1
"lint
let g:ale_sign_error = '●' " Less aggressive than the default '>>'
let g:ale_sign_warning = '.'
let g:ale_lint_on_enter = 0 " Less distracting when opening a new file
let g:ale_completion_enabled = 1
let b:ale_fixers = ['prettier', 'eslint']
" let g:ale_fix_on_save = 1

let g:mta_use_matchparen_group = 1
let g:mta_set_default_matchtag_color = 1


"vue
let g:vue_disable_pre_processors=1

set hidden
set cmdheight=2
set updatetime=300
set shortmess+=c
set signcolumn=yes

inoremap <silent><expr> <TAB>
      \ pumvisible() ? "\<C-n>" :
      \ <SID>check_back_space() ? "\<TAB>" :
      \ coc#refresh()
inoremap <expr><S-TAB> pumvisible() ? "\<C-p>" : "\<C-h>"

function! s:check_back_space() abort
  let col = col('.') - 1
  return !col || getline('.')[col - 1]  =~# '\s'
endfunction

inoremap <expr> <cr> pumvisible() ? "\<C-y>" : "\<CR>"
let g:coc_snippet_next = '<TAB>'
let g:coc_snippet_prev = '<S-TAB>'

autocmd FileType json syntax match Comment +\/\/.\+$+

function! Expander()
  let line   = getline(".")
  let col    = col(".")
  let first  = line[col-2]
  let second = line[col-1]
  let third  = line[col]

  if first ==# ">"
    if second ==# "<" && third ==# "/"
      return "\<CR>\<C-o>==\<C-o>O"

    else
      return "\<CR>"

    endif

  else
    return "\<CR>"

  endif

endfunction

inoremap <expr> <CR> Expander()
