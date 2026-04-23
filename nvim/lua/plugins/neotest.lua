local neotest = require("neotest")

neotest.setup({
	adapters = {
		require("neotest-go")({
			experimental = {
				test_table = true,
			},
		}),
		require("neotest-vitest")({
			filter_dir = function(name)
				return name ~= "node_modules"
			end,
		}),
	},
	quickfix = {
		enabled = false,
	},
	output = {
		enabled = true,
		open_on_run = "short",
	},
})

vim.keymap.set("n", "<leader>tn", function()
	neotest.run.run()
end, { desc = "Run nearest test" })
vim.keymap.set("n", "<leader>tf", function()
	neotest.run.run(vim.fn.expand("%"))
end, { desc = "Run current test file" })
vim.keymap.set("n", "<leader>td", function()
	neotest.run.run({ strategy = "dap" })
end, { desc = "Debug nearest test" })
vim.keymap.set("n", "<leader>ts", function()
	neotest.summary.toggle()
end, { desc = "Toggle test summary" })
vim.keymap.set("n", "<leader>to", function()
	neotest.output.open({ enter = true, auto_close = true })
end, { desc = "Open test output" })
vim.keymap.set("n", "<leader>tO", function()
	neotest.output_panel.toggle()
end, { desc = "Toggle test output panel" })
