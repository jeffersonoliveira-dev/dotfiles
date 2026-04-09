vim.g.mapleader = " "

vim.opt.shortmess:append("c")

vim.opt.cmdheight = 2
--
vim.opt.number = true
--
vim.opt.relativenumber = true
--
vim.opt.updatetime = 4000
--
vim.opt.ignorecase = true
--
vim.opt.smartcase = true

vim.opt.termguicolors = true
--
vim.opt.completeopt = "menu,menuone,noselect,popup"

vim.o.autocomplete = true
--
vim.opt.tabstop = 2
--
vim.opt.shiftwidth = 2
--
vim.opt.softtabstop = 2
--
vim.opt.smartindent = true
--
vim.opt.smarttab = true


-- vim.pack
vim.pack.add({
	{ src = "https://github.com/shaunsingh/nord.nvim" },
})


-- vim colorscheme
vim.cmd('colorscheme nord')


vim.pack.add({
	{ src = "https://github.com/folke/which-key.nvim" },
	{ src = "https://github.com/nvim-lua/plenary.nvim" },
	})



-- vim lsp
--

vim.api.nvim_create_autocmd("LspAttach", {
	group = vim.api.nvim_create_augroup("lsp_completion", { clear = true }),
	callback = function(args)
		local client_id = args.data.client_id
		if not client_id then
			return
		end

		local bufnr = args.buf
    local map = function(mode, lhs, rhs, desc)
      vim.keymap.set(mode, lhs, rhs, { buffer = bufnr, desc = desc })
    end

		map('n', 'K', vim.lsp.buf.hover, 'LSP Hover')
    map('n', 'gd', vim.lsp.buf.definition, 'Go to definition')
    map('n', 'gD', vim.lsp.buf.declaration, 'Go to declaration')
    map('n', 'gi', vim.lsp.buf.implementation, 'Go to implementation')
    map('n', 'gr', vim.lsp.buf.references, 'References')
    map('n', '<leader>rn', vim.lsp.buf.rename, 'Rename symbol')
    map({ 'n', 'v' }, '<leader>ca', vim.lsp.buf.code_action, 'Code action')
    map('n', '<leader>f', function()
      vim.lsp.buf.format({ async = true })
    end, 'Format buffer')

		local client = vim.lsp.get_client_by_id(client_id)
		if client and client:supports_method("textDocument/completion") then
			vim.lsp.completion.enable(true, client_id, args.buf, {
				autotrigger = true,

			})
		end
	end,
})


vim.lsp.enable({ 'gopls'})
vim.lsp.enable({ 'ts_ls'})


vim.diagnostic.config({
  severity_sort = true,
  update_in_insert = false,
  float = {
    border = 'rounded',
    source = 'if_many',
  },
  underline = true,
  virtual_text = {
    spacing = 2,
    source = 'if_many',
    prefix = '●',
  },
  signs = {
    text = {
      [vim.diagnostic.severity.ERROR] = 'E',
      [vim.diagnostic.severity.WARN] = 'W',
      [vim.diagnostic.severity.INFO] = 'I',
      [vim.diagnostic.severity.HINT] = 'H',
    },
  },
})

require('vim._core.ui2').enable({})

local function set_wrap()
	vim.opt.wrap = true
	vim.opt.linebreak = true
	vim.keymap.set('n', 'j', 'gj')
	vim.keymap.set('n', 'k', 'gk')
end

local function set_nowrap()
	vim.opt.wrap = false
	vim.opt.linebreak = false
	vim.keymap.set('n', 'j', 'j')
	vim.keymap.set('n', 'k', 'k')
end

vim.keymap.set('n', '<leader>w', set_wrap)
vim.keymap.set('n', '<leader>W', set_nowrap)

vim.keymap.set('v', '>', '>gv', { noremap = true })
vim.keymap.set('v', '<', '<gv', { noremap = true })

vim.keymap.set('n', 'Y', 'yy')
vim.keymap.set('v', '<C-c>', '"+y')
vim.keymap.set("n", "<leader>ge", function() vim.diagnostic.jump({ count = 1 }) end)
vim.keymap.set("n", "<leader>gE", function() vim.diagnostic.jump({ count = -1 }) end)
--
vim.keymap.set("n", "<leader>sn", ":cnext<CR>", { noremap = true })
vim.keymap.set("n", "<leader>sp", ":cprev<CR>", { noremap = true })

-- Move the current window to the far left
vim.keymap.set('n', '<C-h>', '<C-W>H', { desc = 'Move window to far left', noremap = true, silent = true })
-- Move the current window to the far right
vim.keymap.set('n', '<C-l>', '<C-W>L', { desc = 'Move window to far right', noremap = true, silent = true })

vim.keymap.set('n', 'gt', ':bn<CR>', { noremap = true, silent = true })
vim.keymap.set('n', 'gT', ':bp<CR>', { noremap = true, silent = true })
--:

vim.pack.add({
	{ src = "https://github.com/rcarriga/nvim-notify" },
	{ src = "https://github.com/MunifTanjim/nui.nvim" },
	{ src = "https://github.com/folke/noice.nvim" },
})
require("noice").setup({
	lsp = {
		override = {
			["vim.lsp.util.convert_input_to_markdown_lines"] = true,
			["vim.lsp.util.stylize_markdown"] = true,
			["cmp.entry.get_documentation"] = true, -- requires hrsh7th/nvim-cmp
		},
	},
	presets = {
		bottom_search = true,   -- use a classic bottom cmdline for search
		command_palette = true, -- position the cmdline and popupmenu together
		long_message_to_split = true, -- long messages will be sent to a split
		inc_rename = false,     -- enables an input dialog for inc-rename.nvim
		lsp_doc_border = false, -- add a border to hover docs and signature help
	},
})

--: treesitter
vim.pack.add({
	{ src = "https://github.com/nvim-treesitter/nvim-treesitter" },
})



--: nvim-tree
vim.pack.add({
	{ src = "https://github.com/nvim-tree/nvim-tree.lua" },
})

vim.g.loaded_netrw = 1
vim.g.loaded_netrwPlugin = 1
vim.opt.termguicolors = true
vim.keymap.set("n", "<C-n>", vim.cmd.NvimTreeToggle)
require("nvim-tree").setup({
	view = {
		adaptive_size = true,
	},
	update_focused_file = {
		enable = true,
	},
	sync_root_with_cwd = true,
	respect_buf_cwd = true,
})
--:

--: blink.cmp
vim.pack.add({
	{ src = "https://github.com/Saghen/blink.cmp", version = "v1.6.0" },
})
require("blink.cmp").setup({
	keymap = { preset = 'default' },
	appearance = {
		nerd_font_variant = 'mono'
	},
	completion = { documentation = { auto_show = true } },
	sources = {
		default = { 'lsp', 'path', 'snippets', 'buffer' },
	},
	fuzzy = { implementation = "prefer_rust" }
})
--:


--: telescope
vim.pack.add({
	{ src = "https://github.com/nvim-lua/plenary.nvim" },
	{ src = "https://github.com/nvim-telescope/telescope.nvim" },
})

local builtin = require('telescope.builtin')

require('telescope').setup({
	pickers = {
		buffers = {
			initial_mode = "normal",
		},
		bookmarks = {
			initial_mode = "normal",
		},
	},
})

function SearchClasses()
	builtin.lsp_dynamic_workspace_symbols({
		symbols = { "Class" },
		prompt_title = "Search Classes"
	})
end

function SearchFunctions()
	builtin.lsp_dynamic_workspace_symbols({
		symbols = { "Function", "Method" },
		prompt_title = "Search Functions"
	})
end

function SearchVariables()
	builtin.lsp_dynamic_workspace_symbols({
		symbols = { "Variable", "Constant" },
		prompt_title = "Search Variables"
	})
end

vim.keymap.set('n', '<C-p>', builtin.find_files, {})
vim.keymap.set('n', '<C-e>', builtin.oldfiles, {})
-- vim.keymap.set('n', '<leader>sg', builtin.git_files, {})
vim.keymap.set('n', '<leader>sf', SearchFunctions, {})
vim.keymap.set('n', '<leader>sc', SearchClasses, {})
vim.keymap.set('n', '<leader>sv', SearchVariables, {})
vim.keymap.set('n', 'gb', ":Telescope buffers<CR>", { desc = '[G]oto [B]uffer' })
vim.keymap.set('n', '<leader>ss', builtin.lsp_dynamic_workspace_symbols, {})
vim.keymap.set('n', '<leader>sg', builtin.live_grep, {})
vim.keymap.set('n', '<leader>sw', builtin.grep_string, { desc = '[S]earch current [W]ord' })
vim.keymap.set('n', '<leader>sd', builtin.diagnostics, { desc = '[S]earch [D]iagnostics' })
vim.keymap.set('n', '<leader>sb', builtin.buffers, {})
vim.keymap.set('n', '<leader>sh', builtin.help_tags, {})
vim.keymap.set('n', '<leader>sq', builtin.quickfix, {})
vim.keymap.set('n', '<leader>sk', builtin.keymaps, {})
--:


--: conform
vim.pack.add({
	{ src = "https://github.com/stevearc/conform.nvim" },
})
require("conform").setup({
	format_on_save = {
		timeout_ms = 500,
		lsp_fallback = true,
	},
	formatters_by_ft = {
		lua = { "stylua" },
		json = { "jq" },
		rust = { "rustfmt" },
		python = { "black" },
		htmldjango = { "djlint" },
		html = { "djlint" },
		javascript = { "prettier" },
	},
})
--:


--: lualine
vim.pack.add({
	{ src = "https://github.com/nvim-lualine/lualine.nvim" },
})

require('lualine').setup({
	options = {
		theme = 'auto',
		component_separators = { left = '', right = '' },
		section_separators = { left = '', right = '' },
	},
	sections = {
		lualine_a = { 'mode' },
		lualine_b = {
			{
				'branch',
				fmt = function(str)
					if #str > 5 then
						return str:sub(1, 5) .. '…'
					end
					return str
				end
			},
			'diff'
		},
		lualine_c = {
			{
				'filename',
				path = 1,
				file_status = true,
				fmt = function(str)
					local sep = package.config:sub(1, 1) -- Get OS-specific path separator ('/' or '\')
					local parts = {}

					for part in string.gmatch(str, "([^" .. sep .. "]+)") do
						table.insert(parts, part)
					end

					-- If there's only one part (the filename), just return it
					if #parts == 1 then
						return parts[1]
					end

					local result = {}
					-- Process all parts except the last one
					for i = 1, #parts - 1 do
						-- Take the first character of the directory name
						table.insert(result, parts[i]:sub(1, 1))
					end

					-- Add the full filename (the last part)
					table.insert(result, parts[#parts])

					-- Join them all back together
					return table.concat(result, sep)
				end,
			}
		},
		lualine_x = { 'diagnostics', 'filetype' },
		lualine_y = { 'progress' },
		lualine_z = { 'location' }
	},
	tabline = {
		--lualine_a = { 'tabs' }
	},
	inactive_sections = {
		lualine_c = { { 'filename', path = 1, file_status = true } },
	},
	extensions = {}
})
--:

--: mini files
vim.pack.add({
	{ src = "https://github.com/echasnovski/mini.files" },
})
require('mini.files').setup()
vim.keymap.set('n', '<M-2>', ":lua MiniFiles.open()<cr>", {})


--: diffview
vim.pack.add({
	{ src = "https://github.com/sindrets/diffview.nvim" },
})

--: tiny-inline-diagnostic
vim.pack.add({
	{ src = "https://github.com/rachartier/tiny-inline-diagnostic.nvim" },
})
require("tiny-inline-diagnostic").setup()
vim.diagnostic.config({
	virtual_text = false,
	jump = { float = true },
})

--: bufferline
vim.pack.add({
	{ src = "https://github.com/akinsho/nvim-bufferline.lua" },
	-- Optional, but recommended for file icons
	{ src = "https://github.com/nvim-tree/nvim-web-devicons" },
})

require("bufferline").setup({
	options = {
		mode = "buffers",
		separator_style = "thin",
		show_buffer_close_icons = true,
		show_close_icon = true,
	}
})
--:



--: bookmarks
vim.pack.add({
	{ src = "https://github.com/heilgar/bookmarks.nvim" },
	{ src = "https://github.com/kkharji/sqlite.lua" },
})

require("bookmarks").setup({
	default_mappings = true,
	db_path = vim.fn.stdpath('data') .. '/bookmarks.db'
})

pcall(require("telescope").load_extension, "bookmarks")

vim.keymap.set('n', '<leader>ba', "<cmd>BookmarkAdd<cr>", { desc = "Add Bookmark", noremap = true, silent = true })
vim.keymap.set('n', '<leader>br', "<cmd>BookmarkRemove<cr>", { desc = "Remove Bookmark", noremap = true, silent = true })
vim.keymap.set('n', '<leader>bl', "<cmd>Bookmarks<cr>",
	{ desc = "List Bookmarks (Telescope)", noremap = true, silent = true })
--:

