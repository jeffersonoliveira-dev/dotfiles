" search better
nnoremap / /\v\c
vnoremap / /\v\c

"moving between buffers
" nnoremap <silent> <TAB> :bnext<CR>
" nnoremap <silent> <S-TAB> :bprevious<CR>

" copy yanked text to clipboard
vnoremap <C-c> "+y

"make <c-m> clear the highlight as well as redraw
nnoremap <C-m> :nohls<CR>


"silver searcher
nnoremap <Leader>p :Ag<CR>

" close buffer
nnoremap <silent> <leader>bd :bd<CR>

" search and replace shortcut
nmap <Leader>s :%s//cg<Left><Left><Left>

" enter indented
inoremap {<Enter> {<Enter>}<Esc>

"better identing
vnoremap < <gv
vnoremap > >gv

" Better window navigation
nnoremap <C-h> <C-w>h
nnoremap <C-j> <C-w>j
nnoremap <C-k> <C-w>k
nnoremap <C-l> <C-w>l

" Move selected line / block of text in visual mode
xnoremap K :move '<-2<CR>gv-gv
xnoremap J :move '>+1<CR>gv-gv
