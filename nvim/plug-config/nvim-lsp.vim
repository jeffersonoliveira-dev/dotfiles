lua require'nvim_lsp'.tsserver.setup{ on_attach=require'completion'.on_attach }
lua require'nvim_lsp'.vuels.setup{ on_attach=require'completion'.on_attach }

autocmd BufEnter * lua require'completion'.on_attach()

"mapping
nnoremap <silent>gD    <cmd>lua vim.lsp.buf.declaration()<CR>
nnoremap <silent>gd    <cmd>lua vim.lsp.buf.definition()<CR>
nnoremap <silent>gi    <cmd>lua vim.lsp.buf.implementation()<CR>
nnoremap <silent>K     <cmd>lua vim.lsp.buf.hover()<CR>
nnoremap <silent>td   <cmd>lua vim.lsp.buf.type_definition()<CR>
nnoremap <silent><C-k>     <cmd>lua vim.lsp.buf.signature_help()<CR>
nnoremap <silent>gr     <cmd>lua vim.lsp.buf.references()<CR>
nnoremap <silent><leader>e     <cmd>lua vim.lsp.util.show_line_diagnostics()<CR>
nnoremap <silent>do    <cmd>lua vim.lsp.buf.code_action()<CR>

" Set completeopt to have a better completion experience
set completeopt-=preview
set completeopt=menuone,noinsert,noselect

autocmd Filetype * setlocal omnifunc=v:lua.vim.lsp.omnifunc

" lsp specific config
let g:completion_enable_fuzzy_match = 1
let g:completion_matching_strategy_list = ['exact', 'substring', 'fuzzy']

" Use <Tab> and <S-Tab> to navigate through popup menu
inoremap <expr> <Tab>   pumvisible() ? "\<C-n>" : "\<Tab>"
inoremap <expr> <S-Tab> pumvisible() ? "\<C-p>" : "\<S-Tab>"

" Set completeopt to have a better completion experience
set completeopt=menuone,noinsert,noselect

" Avoid showing message extra message when using completion
set shortmess+=c

inoremap <silent><expr> <C-space> completion#trigger_completion()

" fix conflict between completion-nvim and autopairs
let g:completion_confirm_key = ""
inoremap <expr> <cr>    pumvisible() ? "\<Plug>(completion_confirm_completion)" : "\<cr>"

" Visualize diagnostics
let g:diagnostic_trimmed_virtual_text = '40'
let g:diagnostic_enable_virtual_text = 1
let g:diagnostic_enable_underline = 0
let g:diagnostic_auto_popup_while_jump = 1
" Set updatetime for CursorHold
" 300ms of no cursor movement to trigger CursorHold
set updatetime=300
" Show diagnostic popup on cursor hold
autocmd CursorHold * lua vim.lsp.util.show_line_diagnostics()

" Goto previous/next diagnostic warning/error
nnoremap <silent> g[ <cmd>PrevDiagnosticCycle<cr>
nnoremap <silent> g] <cmd>NextDiagnosticCycle<cr>

" have a fixed column for the diagnostics to appear in
" this removes the jitter when warnings/errors flow in
set signcolumn=yes

" treesitter
lua <<EOF
require'nvim-treesitter.configs'.setup {
  ensure_installed = "all",     -- one of "all", "language", or a list of languages
  highlight = {
    enable = true,              -- false will disable the whole extension
    disable = { "c", "rust", "java"  },  -- list of language that will be disabled
  },
}
EOF

" set foldmethod=expr
" set foldexpr=nvim_treesitter#foldexpr()
