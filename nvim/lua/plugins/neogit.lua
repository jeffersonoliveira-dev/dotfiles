local neogit = require("neogit")

neogit.setup({
	integrations = {
		diffview = true,
	},
	disable_signs = false,
	disable_context_highlighting = false,
	disable_commit_confirmation = false,
})

vim.keymap.set("n", "<leader>gg", function()
	neogit.open({})
end, { desc = "Neogit (Git UI)", noremap = true, silent = true })

vim.keymap.set("n", "<leader>gC", function()
	neogit.open({ "commit" })
end, { desc = "Neogit commit", noremap = true, silent = true })
