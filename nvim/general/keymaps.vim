" search better
nnoremap / /\v\c
vnoremap / /\v\c

"Move between buffers
nmap <Leader>l :bnext<CR>
nmap <Leader>h :bprevious<CR>

" key mapping for tab navigation
nmap <Tab> gt
nmap <S-Tab> gT

"moving between buffers
nnoremap <silent> <TAB> :bnext<CR>
nnoremap <silent> <S-TAB> :bprevious<CR>

" copy yanked text to clipboard
vnoremap <C-c> "+y

"change to normal mode
inoremap jj <Esc><Esc>
inoremap jk <Esc><Esc>
inoremap kj <Esc><Esc>

"make <c-m> clear the highlight as well as redraw
nnoremap <C-m> :nohls<CR><C-L>
inoremap <C-m> <C-O>:nohls<CR>

nnoremap <Leader>p :Ag<CR>


" close buffer
nnoremap <silent> <leader>bd :bd<CR>

" search and replace shortcut
nmap <Leader>s :%s//cg<Left><Left><Left>

" use alt+hjkl para mover entre split/vsplit paineis
tnoremap <A-h> <C-\><C-n><C-w>h
tnoremap <A-j> <C-\><C-n><C-w>j
tnoremap <A-k> <C-\><C-n><C-w>k
tnoremap <A-l> <C-\><C-n><C-w>l
nnoremap <A-h> <C-w>h
nnoremap <A-j> <C-w>j
nnoremap <A-k> <C-w>k
nnoremap <A-l> <C-w>


" enter indented
inoremap {<Enter> {<Enter>}<Esc>O

"better identing
vnoremap < <gv
vnoremap > >gv

" Better window navigation
nnoremap <C-h> <C-w>h
nnoremap <C-j> <C-w>j
nnoremap <C-k> <C-w>k
nnoremap <C-l> <C-w>l

" Move selected line / block of text in visual mode
" shift + k to move up
" shift + j to move down
xnoremap K :move '<-2<CR>gv-gv
xnoremap J :move '>+1<CR>gv-gv

vnoremap * :<C-u>call <SID>VSetSearch()<CR>//<CR>
vnoremap # :<C-u>call <SID>VSetSearch()<CR>??<CR>
