call plug#begin('~/.local/share/nvim/plugged')

"git
Plug 'rhysd/git-messenger.vim'
Plug 'tpope/vim-fugitive'
Plug 'airblade/vim-gitgutter'

"one buffer to rule them all
Plug 'numtostr/BufOnly.nvim', { 'on': 'BufOnly' }
"terminal
Plug 'voldikss/vim-floaterm'

"whitespace
Plug 'ntpeters/vim-better-whitespace'

"utility
Plug 'tpope/vim-surround'

"closing tags
Plug 'AndrewRadev/tagalong.vim'
Plug 'alvan/vim-closetag'

"completion
Plug 'nvim-lua/completion-nvim'
Plug 'neovim/nvim-lspconfig'

"highlight
Plug 'dominikduda/vim_current_word'

"css color
Plug 'norcalli/nvim-colorizer.lua'

"airline
Plug 'vim-airline/vim-airline-themes'
Plug 'vim-airline/vim-airline'

"comments
Plug 'tpope/vim-commentary'

"i3
Plug 'mboughaba/i3config.vim'

"theme
Plug 'joshdick/onedark.vim'

"tree
Plug 'ryanoasis/vim-devicons'
Plug 'preservim/nerdtree'

"multiple cursors
Plug 'mg979/vim-visual-multi', {'branch': 'master'}

"pairs {} [] ()
Plug 'gorkunov/smartpairs.vim'
Plug 'jiangmiao/auto-pairs'

"lsp
Plug 'nvim-treesitter/nvim-treesitter'
Plug 'nvim-treesitter/completion-treesitter'
Plug 'tjdevries/lsp_extensions.nvim'

"diagnostic
Plug 'haorenW1025/diagnostic-nvim'

"linter / fixer
Plug 'dense-analysis/ale'

"searcher
Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
Plug 'junegunn/fzf.vim'

"html
Plug 'Valloric/MatchTagAlways'

"indent
Plug 'Yggdroot/indentLine'

call plug#end()
