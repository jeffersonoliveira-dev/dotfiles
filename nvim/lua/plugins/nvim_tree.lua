vim.g.loaded_netrw = 1
vim.g.loaded_netrwPlugin = 1

vim.keymap.set("n", "<C-n>", vim.cmd.NvimTreeToggle)

local function on_attach(bufnr)
	local api = require("nvim-tree.api")
	api.config.mappings.default_on_attach(bufnr)

	local opts = function(desc)
		return { desc = "nvim-tree: " .. desc, buffer = bufnr, noremap = true, silent = true, nowait = true }
	end

	-- no_window_picker: avoids window-picker edge cases (e.g. no eligible wins
	-- → target_winid 0 → extra vsplit + blank buffer) with alpha + tree.
	vim.keymap.set("n", "<CR>", api.node.open.no_window_picker, opts("Open"))
	vim.keymap.set("n", "o", api.node.open.no_window_picker, opts("Open"))
	vim.keymap.set("n", "s", api.node.open.horizontal_no_picker, opts("Open horizontal split"))
	vim.keymap.set("n", "v", api.node.open.vertical_no_picker, opts("Open vertical split"))
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
			-- Picker can yield no eligible windows (e.g. stale target); then open-file
			-- falls back badly. Mappings use *_no_picker; keep picker off for defaults.
			window_picker = {
				enable = false,
				exclude = {
					filetype = { "notify", "lazy", "qf", "diff", "fugitive", "fugitiveblame" },
					buftype = { "terminal", "help" },
				},
			},
		},
	},
	sync_root_with_cwd = true,
	respect_buf_cwd = true,
})

-- After alpha-nvim is shown, record this window as nvim-tree’s “target” so
-- opening a file prefers replacing the dashboard instead of splitting again.
vim.api.nvim_create_autocmd("User", {
	pattern = "AlphaReady",
	callback = function()
		vim.schedule(function()
			if vim.g.NvimTreeSetup == 1 then
				pcall(function()
					require("nvim-tree.lib").set_target_win()
				end)
			end
		end)
	end,
})
