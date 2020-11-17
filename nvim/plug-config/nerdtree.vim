map <C-a> :NERDTreeToggle<CR>
augroup ntinit
    autocmd FileType nerdtree call s:nerdtreeinit()
  augroup END
  function! s:nerdtreeinit() abort
    set nolist
    if !has("gui_running")
      nunmap <buffer> K
      nunmap <buffer> J



      " call NERDTreeAddKeyMap({
      " \ 'key': '<Tab>',
      " \ 'scope': 'all',
      " \ 'callback': 'NERDTreeMapToggleZoom',
      " \ 'quickhelpText': 'Toggle use existing windows'
      " \ })
      map <silent> <Tab> :call nerdtree#ui_glue#invokeKeyMap("A")<CR>
    endif
  endf
  let NERDTreeShowHidden=1
  let g:NERDTreeWinSize=45
  let NERDTreeMinimalUI=1
  let NERDTreeHijackNetrw=1

  let g:netrw_liststyle = 3
  let g:netrw_browse_split = 4
  let g:netrw_altv = 1
  let g:netrw_winsize = -28
  let g:netrw_banner = 0
  let g:netrw_menu = 0

  let NERDTreeCascadeSingleChildDir=0
  let NERDTreeCascadeOpenSingleChildDir=0
  let g:NERDTreeAutoDeleteBuffer=1
  let g:NERDTreeShowIgnoredStatus = 1
  let g:NERDTreeDirArrowExpandable = ''
  let g:NERDTreeDirArrowCollapsible = ''
" esearch settings {{{

  let g:esearch#cmdline#help_prompt = 1
   let g:esearch#cmdline#dir_icon = ''
   let g:esearch = {
   \ 'adapter':    'ag',
   \ 'backend':    'nvim',
   \ 'use':        ['visual', 'hlsearch', 'last'],
   \}

" }}}

  let g:NERDTreeShowIgnoredStatus = 1  "enables ignored highlighting
  let g:NERDTreeGitStatusNodeColorization = 1  "enables colorization
  let g:NERDTreeGitStatusWithFlags = 1  "enables flags, (may be default), required for colorization

  highlight link NERDTreeDir Question  "custom color
  highlight link NERDTreeGitStatusIgnored Comment  "custom color
  highlight link NERDTreeGitStatusModified cssURL  "custom color

  let g:WebDevIconsUnicodeDecorateFolderNodes = 1


  " NERDTree
  set hidden

  autocmd FileType nerdtree setlocal nolist  "if you show hidden characters, this hides them in NERDTree
"  let g:NERDTreeGitStatusIndicatorMap = {
 let g:NERDTreeIndicatorMapCustom = {
         \ 'Modified'  : '✹',
         \ 'Staged'    : '✚',
         \ 'Untracked' : '✭',
         \ 'Renamed'   : '➜',
         \ 'Unmerged'  : '═',
         \ 'Deleted'   : '✖',
         \ 'Dirty'     : '✗',
         \ 'Clean'     : '✔︎',
         \ 'Ignored'   : '',
         \ 'Unknown'   : '?'
         \ }
