vim.pack.add({
	{ src = "https://github.com/shaunsingh/nord.nvim" },
	{ src = "https://github.com/folke/which-key.nvim" },
	{ src = "https://github.com/nvim-lua/plenary.nvim" },
	{ src = "https://github.com/rcarriga/nvim-notify" },
	{ src = "https://github.com/MunifTanjim/nui.nvim" },
	{ src = "https://github.com/folke/noice.nvim" },
	{ src = "https://github.com/nvim-treesitter/nvim-treesitter" },
	{ src = "https://github.com/nvim-treesitter/nvim-treesitter-textobjects" },
	{ src = "https://github.com/nvim-tree/nvim-tree.lua" },
	{ src = "https://github.com/neovim/nvim-lspconfig" },
	{ src = "https://github.com/mason-org/mason.nvim" },
	{ src = "https://github.com/mason-org/mason-lspconfig.nvim" },
	{ src = "https://github.com/Saghen/blink.cmp", version = "v1.6.0" },
	{ src = "https://github.com/nvim-mini/mini.pairs" },
	{ src = "https://github.com/nvim-telescope/telescope.nvim" },
	{ src = "https://github.com/lewis6991/gitsigns.nvim" },
	{ src = "https://github.com/akinsho/toggleterm.nvim" },
	{ src = "https://github.com/rmagatti/auto-session" },
	{ src = "https://github.com/stevearc/conform.nvim" },
	{ src = "https://github.com/nvim-lualine/lualine.nvim" },
	{ src = "https://github.com/echasnovski/mini.files" },
	{ src = "https://github.com/sindrets/diffview.nvim" },
	{ src = "https://github.com/rachartier/tiny-inline-diagnostic.nvim" },
	{ src = "https://github.com/akinsho/nvim-bufferline.lua" },
	{ src = "https://github.com/nvim-tree/nvim-web-devicons" },
	{ src = "https://github.com/goolord/alpha-nvim" },
	{ src = "https://github.com/mfussenegger/nvim-dap" },
	{ src = "https://github.com/rcarriga/nvim-dap-ui" },
	{ src = "https://github.com/nvim-neotest/nvim-nio" },
	{ src = "https://github.com/theHamsta/nvim-dap-virtual-text" },
	{ src = "https://github.com/mxsdev/nvim-dap-vscode-js" },
	{ src = "https://github.com/microsoft/vscode-js-debug" },
	{ src = "https://github.com/nvim-neotest/neotest" },
	{ src = "https://github.com/nvim-neotest/neotest-go" },
	{ src = "https://github.com/marilari88/neotest-vitest" },
	{ src = "https://github.com/antoinemadec/FixCursorHold.nvim" },
	{ src = "https://github.com/heilgar/bookmarks.nvim" },
	{ src = "https://github.com/kkharji/sqlite.lua" },
	{ src = "https://github.com/MeanderingProgrammer/render-markdown.nvim" },
	{ src = "https://github.com/iamcco/markdown-preview.nvim" },
})

local ok_colorscheme = pcall(vim.cmd, "colorscheme nord")
if not ok_colorscheme then
	vim.cmd("colorscheme habamax")
end

local function safe_require(module)
	pcall(require, module)
end

for _, module in ipairs({
	"plugins.noice",
	"plugins.which_key",
	"plugins.treesitter",
	"plugins.gitsigns",
	"plugins.nvim_tree",
	"plugins.lsp",
	"plugins.blink",
	"plugins.telescope",
	"plugins.project",
	"plugins.toggleterm",
	"plugins.conform",
	"plugins.lualine",
	"plugins.misc",
	"plugins.dashboard",
	"plugins.markdown",
	"plugins.dap",
	"plugins.neotest",
	"plugins.session",
}) do
	safe_require(module)
end
