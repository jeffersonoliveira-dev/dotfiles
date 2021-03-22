local execute = vim.api.nvim_command
local fn = vim.fn

local install_path = fn.stdpath('data') .. '/site/pack/packer/start/packer.nvim'

if fn.empty(fn.glob(install_path)) > 0 then
    execute('!git clone https://github.com/wbthomason/packer.nvim ' .. install_path)
    execute 'packadd packer.nvim'
end

vim.cmd 'autocmd BufWritePost plugins.lua PackerCompile' -- auto compile when there are changes in plugins


return require('packer').startup(function(use)
	-- packer can manage itself as an optional plugin
	use 'wbthomason/packer.nvim'
	 -- Quality of life improvements
	use 'norcalli/nvim_utils'

	-- LSP
	    use 'neovim/nvim-lspconfig'
    use 'glepnir/lspsaga.nvim'
    use 'onsails/lspkind-nvim'
    use 'kosayoda/nvim-lightbulb'
    use 'mfussenegger/nvim-jdtls'

    --Debugging
    use 'mfussenegger/nvim-dap'

    -- autocomplete
        use 'hrsh7th/nvim-compe'
    use 'christianchiarulli/emmet-vim'
    use 'hrsh7th/vim-vsnip'
    use 'xabikos/vscode-javascript'
    use 'dsznajder/vscode-es7-javascript-react-snippets'
    use 'golang/vscode-go'
    use 'rust-lang/vscode-rust'
    use 'ChristianChiarulli/html-snippets'
    use 'ChristianChiarulli/java-snippets'
    use 'ChristianChiarulli/python-snippets'

    -- Treesitter
    use {'nvim-treesitter/nvim-treesitter', run = ':TSUpdate'}
    use 'nvim-treesitter/nvim-treesitter-refactor'
    use 'nvim-treesitter/playground'
    use 'p00f/nvim-ts-rainbow'

    -- Icons
    use 'kyazdani42/nvim-web-devicons'
    use 'ryanoasis/vim-devicons'

        use 'glepnir/galaxyline.nvim'
    -- use {'akinsho/nvim-bufferline.lua', requires = 'kyazdani42/nvim-web-devicons'}
    use 'romgrk/barbar.nvim'

    -- Telescope
    use 'nvim-lua/popup.nvim'
    use 'nvim-lua/plenary.nvim'
    use {
      'nvim-telescope/telescope.nvim',
      requires = {{'nvim-lua/popup.nvim'}, {'nvim-lua/plenary.nvim'}}
    }
    use 'nvim-telescope/telescope-media-files.nvim'

    -- Explorer
    use 'kyazdani42/nvim-tree.lua'

    -- Color
    use 'christianchiarulli/nvcode-color-schemes.vim'
    use 'norcalli/nvim-colorizer.lua'


        -- Git
    use 'TimUntersberger/neogit'
    use {'lewis6991/gitsigns.nvim', requires = {'nvim-lua/plenary.nvim'}}
    use 'f-person/git-blame.nvim'
    use 'tpope/vim-fugitive'
    use 'tpope/vim-rhubarb'

    -- Webdev
    use 'windwp/nvim-ts-autotag'
    use 'gennaro-tedesco/nvim-jqx'
    use 'turbio/bracey.vim'

    -- General Plugins
    use 'windwp/nvim-autopairs'
    use 'kevinhwang91/nvim-bqf'
    use 'unblevable/quick-scope'
    use 'airblade/vim-rooter'
    use 'kevinhwang91/rnvimr'
    use 'mhinz/vim-startify'
    use 'metakirby5/codi.vim'
    use 'psliwka/vim-smoothie'
    use 'moll/vim-bbye'
    use {'iamcco/markdown-preview.nvim', run = 'cd app && npm install'}
    use 'voldikss/vim-floaterm'
    use 'liuchengxu/vista.vim'
    use 'terrortylor/nvim-comment'
    use 'bfredl/nvim-miniyank'
    use 'junegunn/goyo.vim'
    use 'andymass/vim-matchup'
    use 'phaazon/hop.nvim'
    use 'tpope/vim-sleuth'
    use 'sheerun/vim-polyglot'






end)
