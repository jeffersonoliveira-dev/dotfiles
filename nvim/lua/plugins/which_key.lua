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
	{ "<leader>l", group = "Lint" },
	{ "<leader>o", desc = "Reveal in explorer" },
	{ "<leader>r", group = "Rust/Crates" },
	{ "<leader>s", group = "Search" },
	{ "<leader>t", group = "Terminal/Test" },
})
