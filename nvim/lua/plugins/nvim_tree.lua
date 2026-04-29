vim.g.loaded_netrw = 1
vim.g.loaded_netrwPlugin = 1

vim.keymap.set("n", "<C-n>", vim.cmd.NvimTreeToggle)

local function on_attach(bufnr)
	local api = require("nvim-tree.api")
	api.config.mappings.default_on_attach(bufnr)

	local opts = function(desc)
		return { desc = "nvim-tree: " .. desc, buffer = bufnr, noremap = true, silent = true, nowait = true }
	end

	-- Open selected node in current window (new/current buffer).
	vim.keymap.set("n", "<CR>", api.node.open.edit, opts("Open"))
	vim.keymap.set("n", "o", api.node.open.edit, opts("Open"))
	vim.keymap.set("n", "s", api.node.open.horizontal, opts("Open horizontal split"))
	vim.keymap.set("n", "v", api.node.open.vertical, opts("Open vertical split"))
	vim.keymap.set("n", "t", api.node.open.tab, opts("Open in new tab"))
end

require("nvim-tree").setup({
	on_attach = on_attach,
	view = {
		adaptive_size = true,
		side = "left",
	},
	update_focused_file = {
		enable = true,
		update_root = true,
	},
	actions = {
		open_file = {
			quit_on_open = false,
		},
	},
	sync_root_with_cwd = true,
	respect_buf_cwd = true,
})
