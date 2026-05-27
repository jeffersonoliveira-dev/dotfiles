require("mini.pairs").setup()
require("mini.comment").setup()
require("mini.surround").setup()
require("mini.icons").setup()

require("tiny-inline-diagnostic").setup()

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

-- bookmarks.nvim opens sqlite with ensure=true before running migrations; a DB that
-- already has migrated columns (branch, list) fails on every restart. Auto-reset once.
local bookmarks_db = vim.fn.stdpath("data") .. "/bookmarks.nvim.db"

local function setup_bookmarks()
	require("bookmarks").setup({
		default_mappings = true,
		db_path = bookmarks_db,
	})
end

local function reset_bookmarks_db()
	if vim.uv.fs_stat(bookmarks_db) then
		vim.uv.fs_unlink(bookmarks_db)
	end
end

local bookmarks_ok, bookmarks_err = pcall(setup_bookmarks)
if not bookmarks_ok and tostring(bookmarks_err):match("schema defined") then
	reset_bookmarks_db()
	bookmarks_ok, bookmarks_err = pcall(setup_bookmarks)
end
if not bookmarks_ok then
	vim.notify("bookmarks.nvim: " .. tostring(bookmarks_err), vim.log.levels.ERROR)
end

pcall(require("telescope").load_extension, "bookmarks")

vim.keymap.set("n", "<leader>ba", "<cmd>BookmarkAdd<cr>", { desc = "Add bookmark", noremap = true, silent = true })
vim.keymap.set("n", "<leader>br", "<cmd>BookmarkRemove<cr>", { desc = "Remove bookmark", noremap = true, silent = true })
vim.keymap.set("n", "<leader>bl", "<cmd>Bookmarks<cr>", { desc = "List bookmarks", noremap = true, silent = true })
