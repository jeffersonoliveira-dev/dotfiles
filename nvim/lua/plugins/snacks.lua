require("snacks").setup({
	bigfile = { enabled = true },
	bufdelete = { enabled = true },
	dashboard = { enabled = false },
	explorer = { enabled = false },
	image = { enabled = false },
	indent = { enabled = false },
	input = { enabled = true },
	lazygit = { enabled = false },
	notifier = { enabled = true, timeout = 4000 },
	picker = { enabled = true, ui_select = true },
	quickfile = { enabled = true },
	rename = { enabled = true },
	scroll = { enabled = true },
	scope = { enabled = false },
	scratch = { enabled = true },
	statuscolumn = { enabled = false },
	terminal = { enabled = false },
	words = { enabled = true },
	zen = { enabled = true },
	styles = {
		float = { border = "rounded" },
		input = { border = "rounded" },
		scratch = { border = "rounded" },
		notification = { border = "rounded" },
		notification_history = { border = "rounded" },
	},
})

vim.keymap.set("n", "<leader>.", function()
	Snacks.scratch()
end, { desc = "Scratch buffer" })
vim.keymap.set("n", "<leader>S", function()
	Snacks.scratch.select()
end, { desc = "Select scratch buffer" })
vim.keymap.set("n", "<leader>fs", function()
	Snacks.picker.smart()
end, { desc = "Snacks smart find" })
vim.keymap.set("n", "<leader>nh", function()
	Snacks.picker.notifications()
end, { desc = "Notification history" })
vim.keymap.set("n", "<leader>z", function()
	Snacks.zen()
end, { desc = "Zen mode" })
vim.keymap.set("n", "<leader>cR", function()
	Snacks.rename.rename_file()
end, { desc = "LSP rename file" })
vim.keymap.set("n", "<leader>un", function()
	Snacks.notifier.hide()
end, { desc = "Dismiss notifications" })
