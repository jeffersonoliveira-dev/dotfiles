if not vim.g.experimental_ui2 then
	return
end

local ok, artio = pcall(require, "artio")
if not ok then
	return
end

artio.setup({
	opts = {
		preselect = true,
		bottom = true,
		shrink = true,
		prompt_title = true,
		use_icons = true,
	},
	win = {
		height = 12,
		hidestatusline = false,
	},
})

vim.ui.select = artio.select

vim.keymap.set("n", "<leader><leader>", "<Plug>(artio-files)", { desc = "Artio files", silent = true })
vim.keymap.set("n", "<leader>ff", "<Plug>(artio-smart)", { desc = "Artio smart files", silent = true })
vim.keymap.set("n", "<leader>fg", "<Plug>(artio-grep)", { desc = "Artio grep", silent = true })
vim.keymap.set("n", "<leader>fb", "<Plug>(artio-buffers)", { desc = "Artio buffers", silent = true })
vim.keymap.set("n", "<leader>fh", "<Plug>(artio-helptags)", { desc = "Artio help tags", silent = true })
vim.keymap.set("n", "<leader>fo", "<Plug>(artio-oldfiles)", { desc = "Artio old files", silent = true })
vim.keymap.set("n", "<leader>f/", "<Plug>(artio-buffergrep)", { desc = "Artio buffer grep", silent = true })
