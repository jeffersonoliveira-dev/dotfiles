" lua require'lspconfig'.tsserver.setup{ on_attach=require'completion'.on_attach }
" lua require'lspconfig'.vuels.setup{ on_attach=require'completion'.on_attach }

" autocmd BufEnter * lua require'completion'.on_attach()

" Set completeopt to have a better completion experience
set completeopt-=preview
set completeopt=menuone,noinsert,noselect

autocmd Filetype * setlocal omnifunc=v:lua.vim.lsp.omnifunc

  call sign_define('LspDiagnosticsErrorSign',       {'text': '・'})
  call sign_define('LspDiagnosticsWarningSign',     {'text': '・'})
  call sign_define('LspDiagnosticsInformationSign', {'text': '・'})
  call sign_define('LspDiagnosticsHintSign',        {'text': '・'})
  hi LspReferenceRead guibg='#343d46'
  hi LspReferenceText guibg='#343d46'
  hi LspReferenceWrite guibg='#343d46'

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

" Set updatetime for CursorHold
" 300ms of no cursor movement to trigger CursorHvvvim.lsp.handlers['textDocument/codeAction'] = require'lsputil.codeAction'.code_action_handler

set updatetime=300
" Show diagnostic popup on cursor hold
autocmd CursorHold * lua vim.lsp.diagnostic.show_line_diagnostics()
autocmd BufEnter * lua require'completion'.on_attach()
" have a fixed column for the diagnostics to appear in
" this removes the jitter when warnings/errors flow in
set signcolumn=yes

lua require("lsp_config")

" set foldmethod=expr
" set foldexpr=nvim_treesitter#foldexpr()
  " nnoremap <silent> <c-]> <cmd>lua vim.lsp.buf.definition()<CR>
  " nnoremap <silent> K     <cmd>lua vim.lsp.buf.hover()<CR>
  " nnoremap <silent> gD    <cmd>lua vim.lsp.buf.implementation()<CR>
  " nnoremap <silent> <c-k> <cmd>lua vim.lsp.buf.signature_help()<CR>
  " nnoremap <silent> 1gD   <cmd>lua vim.lsp.buf.type_definition()<CR>
  " nnoremap <silent> gr    <cmd>lua vim.lsp.buf.references()<CR>
  " nnoremap <silent> g0    <cmd>lua vim.lsp.buf.document_symbol()<CR>
  " nnoremap <silent> gW    <cmd>lua vim.lsp.buf.workspace_symbol()<CR>
  " nnoremap <silent> gd    <cmd>lua vim.lsp.buf.declaration()<CR>
  " nnoremap <silent> do    <cmd>lua vim.lsp.buf.code_action()<CR>

  " vim.api.nvim_buf_set_keymap(bufnr, 'n', '<leader>do',  '<cmd>vim.lsp.buf.code_action()<CR>',     opts)
