local actions = require("diffview.actions")

require("diffview").setup({
	use_icons = true,
	enhanced_diff_hl = true,
	view = {
		default = {
			layout = "diff2_horizontal",
		},
		-- VS Code–like 3-way merge: incoming/current on top, result below.
		merge_tool = {
			layout = "diff3_mixed",
			disable_diagnostics = true,
			winbar_info = true,
		},
	},
	file_panel = {
		listing_style = "tree",
		win_config = { position = "left", width = 35 },
	},
	keymaps = {
		view = {
			-- Avoid clashing with <leader>e (explorer) and <leader>b (buffers).
			{ "n", "<leader>e", false },
			{ "n", "<leader>b", false },
			{ "n", "<leader><leader>", actions.focus_files, { desc = "Focus diff file panel" } },
			{ "n", "<leader>gb", actions.toggle_files, { desc = "Toggle diff file panel" } },
		},
	},
})

vim.keymap.set("n", "<leader>gd", "<cmd>DiffviewOpen<cr>", { desc = "Diffview (all changes)", noremap = true, silent = true })
vim.keymap.set("n", "<leader>gm", "<cmd>DiffviewOpen<cr>", { desc = "Diffview merge / conflicts", noremap = true, silent = true })
vim.keymap.set("n", "<leader>gD", "<cmd>DiffviewClose<cr>", { desc = "Close diffview", noremap = true, silent = true })
vim.keymap.set("n", "<leader>gh", "<cmd>DiffviewFileHistory<cr>", { desc = "Diffview file history", noremap = true, silent = true })
