require("goto-preview").setup({
	default_mappings = true,
	width = 120,
	height = 25,
	border = { "─", "│", "─", "│", "╭", "╮", "╯", "╰" },
})

-- Peek definition (stay in place); gd still jumps full definition.
vim.keymap.set("n", "gpd", "<cmd>lua require('goto-preview').goto_preview_definition()<cr>", { desc = "Peek definition", noremap = true, silent = true })
vim.keymap.set("n", "gpi", "<cmd>lua require('goto-preview').goto_preview_implementation()<cr>", { desc = "Peek implementation", noremap = true, silent = true })
vim.keymap.set("n", "gpr", "<cmd>lua require('goto-preview').goto_preview_references()<cr>", { desc = "Peek references", noremap = true, silent = true })
vim.keymap.set("n", "gP", "<cmd>lua require('goto-preview').close_all_win()<cr>", { desc = "Close all peek windows", noremap = true, silent = true })
