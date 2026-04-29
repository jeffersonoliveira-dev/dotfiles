require("mini.pairs").setup()

require("mini.files").setup()
vim.keymap.set("n", "<M-2>", ":lua MiniFiles.open()<cr>", {})

require("tiny-inline-diagnostic").setup()
vim.diagnostic.config({
	virtual_text = false,
	jump = { float = true },
})

require("bufferline").setup({
	options = {
		mode = "buffers",
		numbers = "none",
		separator_style = "thin",
		modified_icon = "●",
		show_modified_icon = true,
		show_buffer_close_icons = true,
		show_close_icon = true,
		always_show_bufferline = true,
		offsets = {
			{
				filetype = "NvimTree",
				text = "Explorer",
				separator = true,
			},
		},
		name_formatter = function(buf)
			local filename = vim.fn.fnamemodify(buf.name, ":t")
			if filename == "" then
				return "[No Name]"
			end
			return filename
		end,
	},
})

-- require("bookmarks").setup({
-- 	default_mappings = true,
-- 	db_path = vim.fn.stdpath("data") .. "/bookmarks.db",
-- })
--
-- pcall(require("telescope").load_extension, "bookmarks")
--
-- vim.keymap.set("n", "<leader>ba", "<cmd>BookmarkAdd<cr>", { desc = "Add Bookmark", noremap = true, silent = true })
-- vim.keymap.set("n", "<leader>br", "<cmd>BookmarkRemove<cr>", { desc = "Remove Bookmark", noremap = true, silent = true })
-- vim.keymap.set("n", "<leader>bl", "<cmd>Bookmarks<cr>", { desc = "List Bookmarks (Telescope)", noremap = true, silent = true })
