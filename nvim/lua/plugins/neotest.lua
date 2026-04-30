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
