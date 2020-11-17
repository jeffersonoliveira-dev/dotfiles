""gitgutter
"let g:gitgutter_sign_added              = '▎'
"let g:gitgutter_sign_modified           = '▎'
"let g:gitgutter_sign_removed            = '契'
"let g:gitgutter_sign_removed_first_line = '契'
"let g:gitgutter_sign_modified_removed   = '▎'
"let g:gitgutter_preview_win_floating = 1

let g:gitgutter_enabled = 1

highlight GitGutterAdd    guifg=#98c379 ctermfg=2
highlight GitGutterChange guifg=#61afef ctermfg=3
highlight GitGutterDelete guifg=#e06c75 ctermfg=1
set signcolumn=yes:1
set diffopt+=internal,algorithm:patience,iwhiteall
let g:conflict_marker_enable_mappings = 0
let g:gitgutter_sign_added = '│'
let g:gitgutter_sign_modified = '│'
let g:gitgutter_sign_removed = '│'
let g:gitgutter_sign_removed_first_line = '│'
let g:gitgutter_sign_modified_removed = '│'
let g:gina#command#blame#formatter#format="%in (%au) %ti"
autocmd FileType fugitive call s:fugitive_settings()
function! s:fugitive_settings() abort
 setlocal nonumber
endfunction
