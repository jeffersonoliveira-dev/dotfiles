let g:airline_theme='onedark'
let g:airline#extensions#tabline#enabled = 1


  let g:webdevicons_enable_airline_statusline = 1
  if !exists('g:airline_symbols')
    let g:airline_symbols = {
      \ 'branch': '',
      \ 'modified': ' ●'
      \}
  endif

  " let w:airline_disabled = 1
   let g:airline_powerline_fonts = 0
   let g:airline#extensions#tabline#enabled = 0
   let g:airline#extensions#tabline#fnamemod = ':t'
   let g:airline#extensions#tabline#buffer_idx_mode = 1
   let g:airline#extensions#tabline#left_alt_sep = ''
   let g:airline#extensions#tabline#left_sep = " "
   let g:airline#extensions#nvim_typescript#enabled=1

   let w:airline_skip_empty_sections = 0

   "devicons
  let g:webdevicons_enable_airline_statusline = 1
  if !exists('g:airline_symbols')
    let g:airline_symbols = {
      \ 'branch': '',
      \ 'modified': ' ●'
      \}
  endif
   let g:airline#extensions#branch#format = 0
   let g:airline_detect_spelllang=0
   let g:airline_detect_spell=0
   let g:airline#extensions#hunks#enabled = 0
   let g:airline#extensions#wordcount#enabled = 0
   let g:airline#extensions#whitespace#enabled = 0
   let g:airline_section_c = '%f%m'
   let g:airline_section_x = ''
   let g:airline_section_y = ''
   let g:airline_section_z = '%l:%c'
   let g:airline#parts#ffenc#skip_expected_string=''
  " let g:airline_mode_map = {
  "     \ '__' : '',
  "     \ 'c'  : '',
  "     \ 'i'  : '',
  "     \ 'ic' : '',
  "     \ 'ix' : '',
  "     \ 'n'  : '',
  "     \ 'ni' : '',
  "     \ 'no' : '',
  "     \ 'R'  : '',
  "     \ 'Rv' : '',
  "     \ 's'  : '',
  "     \ 'S'  : '',
  "     \ '' : '',
  "     \ 't'  : '',
  "     \ 'v'  : '',
  "     \ 'V'  : '',
  "     \ '' : '',
  "     \ }

 let g:airline#extensions#tabline#buffer_idx_format = {
      \ '0': '0 ',
      \ '1': '1 ',
      \ '2': '2 ',
      \ '3': '3 ',
      \ '4': '4 ',
      \ '5': '5 ',
      \ '6': '6 ',
      \ '7': '7 ',
      \ '8': '8 ',
      \ '9': '9 ',
      \}

let g:airline#extensions#ale#error_symbol='• '
let g:airline#extensions#ale#warning_symbol='•  '
let g:airline#extensions#neomake#error_symbol='• '
let g:airline#extensions#neomake#warning_symbol='•  '
