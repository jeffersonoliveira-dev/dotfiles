-- Default vault matches `notes` alias in fish (~Documents/notes). Override with $OBSIDIAN_VAULT.
local vault_path = vim.env.OBSIDIAN_VAULT or vim.fn.expand("~/Documents/notes")

require("obsidian").setup({
	workspaces = {
		{ name = "notes", path = vault_path },
	},
	completion = {
		-- nvim-cmp is not installed; use blink.compat + cmp sources if you want [[ / # completion.
		nvim_cmp = false,
		min_chars = 2,
	},
	picker = {
		name = "telescope.nvim",
	},
})

vim.keymap.set("n", "<leader>Oq", "<cmd>ObsidianQuickSwitch<cr>", { desc = "Obsidian quick switch" })
vim.keymap.set("n", "<leader>Os", "<cmd>ObsidianSearch<cr>", { desc = "Obsidian search" })
vim.keymap.set("n", "<leader>On", "<cmd>ObsidianNew<cr>", { desc = "Obsidian new note" })
vim.keymap.set("n", "<leader>Ot", "<cmd>ObsidianToday<cr>", { desc = "Obsidian daily note" })
