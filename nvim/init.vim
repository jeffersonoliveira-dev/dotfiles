" vim config
"plugins
source $HOME/.config/nvim/general/plugins.vim

"general settings
source $HOME/.config/nvim/general/settings.vim

"theme
source $HOME/.config/nvim/general/theme.vim

"keymaps
source $HOME/.config/nvim/general/keymaps.vim

"functions
source $HOME/.config/nvim/general/functions.vim

"plugins config
"airline
source $HOME/.config/nvim/plug-config/airline.vim

"ale
" source $HOME/.config/nvim/plug-config/ale.vim

"better white space
source $HOME/.config/nvim/plug-config/better-whitespace.vim

" close tag
source $HOME/.config/nvim/plug-config/closetag.vim

"lsp
source $HOME/.config/nvim/plug-config/nvim-lsp.vim

"terminal
source $HOME/.config/nvim/plug-config/floaterm.vim

" source $HOME/.config/nvim/plug-config/gutentags.vim

source $HOME/.config/nvim/plug-config/indent.vim

source $HOME/.config/nvim/plug-config/nerdtree.vim

source $HOME/.config/nvim/plug-config/tagalong.vim

source $HOME/.config/nvim/plug-config/vim-gitgutter.vim

source $HOME/.config/nvim/plug-config/fzf.vim

" source $HOME/.config/nvim/plug-config/minimap.vim

" source $HOME/.config/nvim/plug-config/tabline.vim

source $HOME/.config/nvim/plug-config/highlight.vim

source $HOME/.config/nvim/plug-config/barbar.vim

" lua require
lua require("lsp_config")


