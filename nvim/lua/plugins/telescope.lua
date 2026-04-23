local builtin = require("telescope.builtin")

require("telescope").setup({
	pickers = {
		buffers = {
			initial_mode = "normal",
		},
		bookmarks = {
			initial_mode = "normal",
		},
	},
})

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
