local wk = require("which-key")

wk.setup({
	preset = "modern",
	delay = 300,
	plugins = {
		spelling = { enabled = true },
	},
})

wk.add({
	{ "<leader>b", group = "Buffer" },
	{ "<leader>d", group = "Debug" },
	{ "<leader>e", desc = "Explorer toggle" },
	{ "<leader>E", desc = "Explorer focus" },
	{ "<leader>g", group = "Git/Diagnostics" },
	{ "<leader>o", desc = "Reveal in explorer" },
	{ "<leader>s", group = "Search" },
	{ "<leader>t", group = "Terminal/Test" },
})
