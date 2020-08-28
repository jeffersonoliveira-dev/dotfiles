set statusline+=\ %{LinterStatus()}
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

"ale
" Fix files with prettier, and then ESLint.
" let b:ale_fixers = ['prettier', 'eslint']
" let b:ale_linter_aliases = [ 'javascript', 'vue' ]
" let b:ale_liters = ['eslint']
" Equivalent to the above.
let g:ale_fixers = {
\   '*': ['remove_trailing_lines', 'trim_whitespace'],
\   'javascript': ['eslint'],
\   'typescript': ['eslint','prettier'],
\   'vue': ['prettier', 'eslint'],
\}
let g:ale_linters_explicit = 1
let g:ale_fix_on_save = 1
let g:ale_completion_autoimport = 1
set timeoutlen=500

