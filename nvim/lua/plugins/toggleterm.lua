require("toggleterm").setup({
	size = 15,
	open_mapping = [[<c-\>]],
	hide_numbers = true,
	shade_filetypes = {},
	shade_terminals = true,
	start_in_insert = true,
	insert_mappings = true,
	persist_size = true,
	direction = "horizontal",
	close_on_exit = true,
	shell = vim.o.shell,
})

vim.keymap.set("n", "<leader>tt", "<cmd>ToggleTerm<CR>", { desc = "Toggle terminal", noremap = true, silent = true })
vim.keymap.set("n", "<leader>tT", "<cmd>ToggleTerm direction=float<CR>", { desc = "Floating terminal", noremap = true, silent = true })
vim.keymap.set("n", "<leader>th", "<cmd>ToggleTerm size=15 direction=horizontal<CR>", { desc = "Horizontal terminal", noremap = true, silent = true })
vim.keymap.set("n", "<leader>tv", "<cmd>ToggleTerm size=80 direction=vertical<CR>", { desc = "Vertical terminal", noremap = true, silent = true })
