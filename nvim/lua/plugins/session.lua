require("auto-session").setup({
	auto_restore = true,
	auto_save = true,
	auto_session_suppress_dirs = {
		"~",
		"~/Downloads",
		"/",
	},
})

vim.keymap.set("n", "<leader>wr", "<cmd>SessionRestore<CR>", { desc = "Restore session", noremap = true, silent = true })
vim.keymap.set("n", "<leader>ws", "<cmd>SessionSave<CR>", { desc = "Save session", noremap = true, silent = true })
