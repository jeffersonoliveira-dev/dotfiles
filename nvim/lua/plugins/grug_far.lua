require("grug_far").setup({})

vim.keymap.set("n", "<leader>sr", function()
	require("grug_far").open({})
end, { desc = "Search & replace (project)", noremap = true, silent = true })

vim.keymap.set("v", "<leader>sr", function()
	require("grug_far").with_visual_selection({ prefills = { paths = vim.fn.expand("%:p") } })
end, { desc = "Search & replace (selection)", noremap = true, silent = true })
