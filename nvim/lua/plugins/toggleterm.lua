local function detect_project_dir()
	local current_file = vim.api.nvim_buf_get_name(0)
	if current_file ~= "" then
		local buffer_dir = vim.fs.dirname(current_file)

		local git_dir = vim.fs.find(".git", { path = buffer_dir, upward = true, type = "directory" })[1]
		if git_dir then
			return vim.fs.dirname(git_dir)
		end

		local marker = vim.fs.find({ "package.json", "pyproject.toml", "go.mod", "Cargo.toml", "Makefile" }, { path = buffer_dir, upward = true })[1]
		if marker then
			return vim.fs.dirname(marker)
		end

		return buffer_dir
	end

	return vim.fn.getcwd()
end

local function toggle_term(opts)
	opts = opts or {}
	local dir = detect_project_dir()
	local cmd = "ToggleTerm"

	if opts.size then
		cmd = cmd .. " size=" .. opts.size
	end
	if opts.direction then
		cmd = cmd .. " direction=" .. opts.direction
	end

	cmd = cmd .. " dir=" .. vim.fn.fnameescape(dir)
	vim.cmd(cmd)
end

require("toggleterm").setup({
	size = 15,
	open_mapping = [[<c-\>]],
	hide_numbers = true,
	shade_filetypes = {},
	shade_terminals = true,
	start_in_insert = true,
	insert_mappings = true,
	persist_size = true,
	direction = "horizontal",
	close_on_exit = true,
	shell = vim.o.shell,
	on_open = function(term)
		local dir = detect_project_dir()
		if dir and dir ~= "" then
			term:send("cd " .. vim.fn.shellescape(dir), false)
		end
	end,
})

vim.keymap.set("n", "<leader>tt", function()
	toggle_term()
end, { desc = "Toggle terminal", noremap = true, silent = true })

vim.keymap.set("n", "<leader>tT", function()
	toggle_term({ direction = "float" })
end, { desc = "Floating terminal", noremap = true, silent = true })

vim.keymap.set("n", "<leader>th", function()
	toggle_term({ size = 15, direction = "horizontal" })
end, { desc = "Horizontal terminal", noremap = true, silent = true })

vim.keymap.set("n", "<leader>tv", function()
	toggle_term({ size = 80, direction = "vertical" })
end, { desc = "Vertical terminal", noremap = true, silent = true })
