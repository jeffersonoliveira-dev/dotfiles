if vim.fn.has("nvim-0.12") == 1 then
	-- project.nvim still uses a deprecated LSP API on Neovim 0.12.
	-- Keep a useful fallback mapping without loading the plugin.
	local ok_builtin, builtin = pcall(require, "telescope.builtin")
	if not ok_builtin then
		return
	end
	vim.keymap.set("n", "<leader>fp", function()
		builtin.oldfiles({ prompt_title = "Recent files (projects)" })
	end, { desc = "Find projects (fallback)", noremap = true, silent = true })
	return
end

local ok, project_nvim = pcall(require, "project_nvim")
if not ok then
	return
end

project_nvim.setup({
	detection_methods = { "lsp", "pattern" },
	patterns = { ".git", "package.json", "go.mod", "pyproject.toml" },
	show_hidden = false,
	silent_chdir = true,
	scope_chdir = "global",
})

pcall(require("telescope").load_extension, "projects")

vim.keymap.set("n", "<leader>fp", "<cmd>Telescope projects<CR>", { desc = "Find projects", noremap = true, silent = true })
