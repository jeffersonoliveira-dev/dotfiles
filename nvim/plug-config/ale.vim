"set statusline+=\ %{LinterStatus()}
"function! LinterStatus() abort
"  let l:counts = ale#statusline#Count(bufnr(''))

"  let l:all_errors = l:counts.error + l:counts.style_error
"  let l:all_non_errors = l:counts.total - l:all_errors

"  return l:counts.total == 0 ? '✨ all good ✨' : printf(
"        \   '😞 %dW %dE',
"        \   all_non_errors,
"        \   all_errors
"        \)
"endfunction
"  hi link ALEError SpellBad
"  hi link ALEWarning SpellBad
""ale
"" Fix files with prettier, and then ESLint.
"" let b:ale_fixers = ['prettier', 'eslint']
"" let b:ale_linter_aliases = [ 'javascript', 'vue' ]
"" let b:ale_liters = ['eslint']
"" Equivalent to the above.
"let g:ale_fixers = {
"\   '*': ['remove_trailing_lines', 'trim_whitespace'],
"\   'javascript': ['eslint'],
"\   'typescript': ['eslint','prettier'],
"\   'vue': ['prettier', 'eslint'],
"\}
"" let g:ale_fixers = {
"" \   '*': ['remove_trailing_lines', 'trim_whitespace'],
"" \}
"let g:ale_disable_lsp = 1
"let g:ale_linters_explicit = 1
"let g:ale_fix_on_save = 1
"let g:ale_completion_autoimport = 1
"set timeoutlen=300
" let g:ale_fix_on_save = 1
" let g:ale_javascript_prettier_use_local_config = 1

" function! s:PRETTIER_OPTIONS()
"   return '--config-precedence prefer-file --single-quote --no-bracket-spacing --prose-wrap always --arrow-parens always --trailing-comma all --no-semi --end-of-line  lf --print-width ' . &textwidth
" endfunction
" let g:ale_javascript_prettier_options = <SID>PRETTIER_OPTIONS()

" augroup ALE
"   au!
"   " Auto update the option when textwidth is dynamically set or changed in a ftplugin file
"   au! OptionSet textwidth let g:ale_javascript_prettier_options = <SID>PRETTIER_OPTIONS()
" augroup END

" let g:ale_fixers = {
"       \   '*'         : ['remove_trailing_lines', 'trim_whitespace'],
"       \   'markdown'  : ['prettier'],
"       \   'javascript': ['prettier'],
"       \   'typescript': ['prettier'],
"       \   'css'       : ['prettier'],
"       \   'json'      : ['prettier'],
"       \   'scss'      : ['prettier'],
"       \   'less'      : ['prettier'],
"       \   'yaml'      : ['prettier'],
"       \   'graphql'   : ['prettier'],
"       \   'html'      : ['prettier'],
"       \   'reason'    : ['refmt'],
"       \   'python'    : ['black'],
"       \   'sh'        : ['shfmt'],
"       \   'bash'      : ['shfmt'],
"       \   'rust'      : ['rustfmt'],
"       \   'go'        : ['gofmt'],
"       \}
"
"

