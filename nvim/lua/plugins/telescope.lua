local builtin = require("telescope.builtin")
local themes = require("telescope.themes")

-- Default horizontal/flex layout splits the tab from the alpha splash. After picking a
-- file, the old split can stay as an empty side window. Dropdown uses a centered float
-- so the first real buffer replaces alpha in the only editor split.
local rounded = { "─", "│", "─", "│", "╭", "╮", "╯", "╰" }

require("telescope").setup({
	defaults = themes.get_dropdown({
		winblend = 6,
		borderchars = {
			prompt = rounded,
			results = rounded,
			preview = rounded,
		},
		layout_config = {
			width = function(_, max_columns, _)
				return math.min(max_columns, 120)
			end,
			height = function(_, _, max_lines)
				return math.min(max_lines, math.floor(max_lines * 0.45))
			end,
		},
	}),
	pickers = {
		buffers = {
			initial_mode = "normal",
		},
	},
	extensions = {
		-- Image/video/pdf previews use Chafa (and optional deps); see plugin README.
		media_files = {
			filetypes = { "png", "jpg", "jpeg", "webp", "gif", "svg", "mp4", "webm", "pdf" },
		},
	},
})

pcall(require("telescope").load_extension, "media_files")

local function search_classes()
	builtin.lsp_dynamic_workspace_symbols({
		symbols = { "Class" },
		prompt_title = "Search Classes",
	})
end

local function search_functions()
	builtin.lsp_dynamic_workspace_symbols({
		symbols = { "Function", "Method" },
		prompt_title = "Search Functions",
	})
end

local function search_variables()
	builtin.lsp_dynamic_workspace_symbols({
		symbols = { "Variable", "Constant" },
		prompt_title = "Search Variables",
	})
end

vim.keymap.set("n", "<C-p>", builtin.find_files, {})
vim.keymap.set("n", "<leader>fm", function()
	if not pcall(require("telescope").load_extension, "media_files") then
		vim.notify(
			"telescope-media-files unavailable. Sync plugins (pack) and install `chafa` for image previews.",
			vim.log.levels.WARN
		)
		return
	end
	require("telescope").extensions.media_files.media_files()
end, { desc = "Find media files (image preview)" })
vim.keymap.set("n", "<C-e>", builtin.oldfiles, {})
vim.keymap.set("n", "<leader>sf", search_functions, {})
vim.keymap.set("n", "<leader>sc", search_classes, {})
vim.keymap.set("n", "<leader>sv", search_variables, {})
vim.keymap.set("n", "gb", ":Telescope buffers<CR>", { desc = "[G]oto [B]uffer" })
vim.keymap.set("n", "<leader>ss", builtin.lsp_dynamic_workspace_symbols, {})
vim.keymap.set("n", "<leader>sg", builtin.live_grep, {})
vim.keymap.set("n", "<leader>sw", builtin.grep_string, { desc = "[S]earch current [W]ord" })
vim.keymap.set("n", "<leader>sd", builtin.diagnostics, { desc = "[S]earch [D]iagnostics" })
vim.keymap.set("n", "<leader>sb", builtin.buffers, {})
vim.keymap.set("n", "<leader>sh", builtin.help_tags, {})
vim.keymap.set("n", "<leader>sq", builtin.quickfix, {})
vim.keymap.set("n", "<leader>sk", builtin.keymaps, {})
