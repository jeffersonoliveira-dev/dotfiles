set background=dark " or light if you prefer the light version
let g:nvcode_termcolors=256
syntax on
syntax enable
colorscheme nord " Or whatever colorscheme you make
let g:airline_theme='oceanicnext'

" checks if your terminal has 24-bit color support
if (has("termguicolors"))
    set termguicolors
    hi LineNr ctermbg=NONE guibg=NONE
endif


function SetItalics() abort
    hi Comment gui=italic
    hi Keyword gui=italic
    hi Keyword gui=italic
    hi Identifier gui=italic
    hi StorageClass gui=italic
    hi jsLineComment gui=italic
    hi xmlAttrib gui=italic
    hi htmlArg gui=italic
    hi pythonSelf gui=italic
    hi htmlArg gui=italic
  endfunction
  autocmd ColorScheme * call SetItalics()


let g:onedark_terminal_italics = 1
let g:oceanic_next_terminal_bold = 1
let g:oceanic_next_terminal_italic = 1
let g:nord_terminal_italic = 1
set list
set listchars=tab:‣\ ,trail:·
