require("plugins.visual_multi")

vim.pack.add({
	{ src = "https://github.com/navarasu/onedark.nvim" },
	{ src = "https://github.com/folke/which-key.nvim" },
	{ src = "https://github.com/nvim-lua/plenary.nvim" },
	{ src = "https://github.com/mistweaverco/kulala.nvim" },
	{ src = "https://github.com/folke/snacks.nvim" },
	{ src = "https://github.com/MunifTanjim/nui.nvim" },
	{ src = "https://github.com/folke/trouble.nvim" },
	{ src = "https://github.com/mg979/vim-visual-multi" },
	{ src = "https://github.com/b0o/schemastore.nvim" },
	{ src = "https://github.com/nvim-treesitter/nvim-treesitter" },
	{ src = "https://github.com/nvim-treesitter/nvim-treesitter-textobjects" },
	{ src = "https://github.com/nvim-tree/nvim-tree.lua" },
	{ src = "https://github.com/neovim/nvim-lspconfig" },
	{ src = "https://github.com/Saghen/blink.cmp", version = "v1.6.0" },
	{ src = "https://github.com/echasnovski/mini.nvim" },
	{ src = "https://github.com/folke/grug-far.nvim" },
	{ src = "https://github.com/folke/todo-comments.nvim" },
	{ src = "https://github.com/rmagatti/logger.nvim" },
	{ src = "https://github.com/rmagatti/goto-preview" },
	{ src = "https://github.com/TimUntersberger/neogit" },
	{ src = "https://github.com/nvim-telescope/telescope.nvim" },
	{ src = "https://github.com/nvim-telescope/telescope-media-files.nvim" },
	{ src = "https://github.com/comfysage/artio.nvim" },
	{ src = "https://github.com/lewis6991/gitsigns.nvim" },
	{ src = "https://github.com/akinsho/toggleterm.nvim" },
	{ src = "https://github.com/christoomey/vim-tmux-navigator" },
	{ src = "https://github.com/rmagatti/auto-session" },
	{ src = "https://github.com/stevearc/conform.nvim" },
	{ src = "https://github.com/mfussenegger/nvim-lint" },
	{ src = "https://github.com/nvim-lualine/lualine.nvim" },
	{ src = "https://github.com/sindrets/diffview.nvim" },
	{ src = "https://github.com/akinsho/git-conflict.nvim" },
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
	{ src = "https://github.com/sphamba/smear-cursor.nvim" },
	{ src = "https://github.com/heilgar/bookmarks.nvim" },
	{ src = "https://github.com/kkharji/sqlite.lua" },
	{ src = "https://github.com/MeanderingProgrammer/render-markdown.nvim" },
	{ src = "https://github.com/epwalsh/obsidian.nvim", version = "v3.9.0" },
	{ src = "https://github.com/iamcco/markdown-preview.nvim" },
	{ src = "https://github.com/Saecki/crates.nvim" },
	{ src = "https://github.com/stevearc/aerial.nvim" },
})

-- snacks.nvim: run setup early (notifier, ui hooks). See lua/plugins/snacks.lua.
require("plugins.snacks")

pcall(function()
	require("onedark").setup({
		style = "dark",
		transparent = false,
		term_colors = true,
		ending_tildes = false,
		code_style = {
			comments = "italic",
			keywords = "none",
			functions = "none",
			strings = "none",
			variables = "none",
		},
		highlights = {
			CursorLine = { bg = "#2c313c" },
		},
	})
end)

local ok_colorscheme = pcall(vim.cmd, "colorscheme onedark")
if not ok_colorscheme then
	vim.cmd("colorscheme habamax")
end

local function safe_require(module)
	pcall(require, module)
end

local loaded = {}
local function load_once(module)
	if loaded[module] then
		return
	end
	loaded[module] = true
	safe_require(module)
end

for _, module in ipairs({
	"plugins.trouble",
	"plugins.which_key",
	"plugins.treesitter",
	"plugins.gitsigns",
	"plugins.diffview",
	"plugins.git_conflict",
	"plugins.neogit",
	"plugins.nvim_tree",
	"plugins.blink",
	"plugins.grug_far",
	"plugins.todo_comments",
	"plugins.goto_preview",
	"plugins.telescope",
	"plugins.artio",
	"plugins.project",
	"plugins.tmux_navigator",
	"plugins.toggleterm",
	"plugins.kulala",
	"plugins.conform",
	"plugins.lint",
	"plugins.lualine",
	"plugins.smear_cursor",
	"plugins.misc",
	"plugins.aerial",
	"plugins.obsidian",
	"plugins.session",
	"plugins.dap",
}) do
	safe_require(module)
end

vim.api.nvim_create_autocmd("VimEnter", {
	group = vim.api.nvim_create_augroup("lazy_dashboard", { clear = true }),
	callback = function()
		load_once("plugins.dashboard")
	end,
})

vim.api.nvim_create_autocmd("FileType", {
	group = vim.api.nvim_create_augroup("lazy_markdown", { clear = true }),
	pattern = { "markdown", "mdx" },
	callback = function()
		load_once("plugins.markdown")
	end,
})

vim.api.nvim_create_autocmd("FileType", {
	group = vim.api.nvim_create_augroup("lazy_crates", { clear = true }),
	pattern = { "toml" },
	callback = function()
		load_once("plugins.crates")
	end,
})
